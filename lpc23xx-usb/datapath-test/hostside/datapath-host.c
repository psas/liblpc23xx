

/*
 * datapath-host.c
 */


#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <syslog.h>
#include <termios.h>    // terminal
#include <unistd.h>     // read, write, close
#include <errno.h>
#include <time.h>

#include "serial-port.h"
#include "parse-args.h"
#include "datapath-host.h"

/*
 * dp_read
 * do a bunch of error checking on read
 */
uint32_t dp_read(int32_t fd, int32_t* value, uint32_t numbytes) {

        uint32_t bytes_read = 0;

        value               = 0x0;

        bytes_read = read(fd, value, numbytes);
        switch(bytes_read) {
            case EAGAIN:
//                syslog(LOG_CRIT, "dp_read: Non-blocking I/O has been selected using O_NONBLOCK and no data was immediately available for reading.\n");
                break;
            case EBADF:
                syslog(LOG_CRIT, "dp_read: fd is not a valid file descriptor or is not open for reading.\n");
                break;
            case EFAULT:
                syslog(LOG_CRIT, "dp_read: buf is outside your accessible address space.\n");
                break;
            case EINTR:
                syslog(LOG_CRIT, "dp_read: The call was interrupted by a signal before any data was read.\n");
                break;
             case EINVAL:
                syslog(LOG_CRIT, "dp_read: fd is attached to an object which is unsuitable for reading; or the file was opened with the O_DIRECT flag, and either the address specified in buf, the value specified in count, or the current file offset is not suitably aligned.\n");
                break;
             case EIO:
                syslog(LOG_CRIT, "dp_read: I/O error. This will happen for example when the process is in a background process group, tries to read from its controlling tty, and either it is ignoring or blocking SIGTTIN or its process group is orphaned. It may also occur when there is a low-level I/O error while reading from a disk or tape.\n");
                break;
              case EISDIR:
                syslog(LOG_CRIT, "dp_read: fd refers to a directory.\n");
                break;
            default:
                break;
        }
        return(bytes_read);
} 


/*
 * init_stdin
 */
int init_stdin(struct termios* orig_stdin_tios) {

    struct termios      tios;

    // Get tios 
    if (tcgetattr(0, &tios)){
        printf("init_stdin: Error getting current terminal settings\n");
        return (-1);
    } else {
        tcgetattr(0, orig_stdin_tios);
    }

    tios.c_lflag        &= ~ICANON;
    tios.c_lflag        |= ECHO;

    tios.c_cc[VMIN]     = VMIN_VALUE;
    tios.c_cc[VTIME]    = VTIME_VALUE;

    if (tcsetattr(0, TCSAFLUSH, &tios)){
        printf("init_stdin: Error applying terminal settings\n");
        return (-1);
    }

    return(0);
}

/*
 * reset_stdin
 */
int reset_stdin(struct termios* orig_stdin_tios) {

    if(tcsetattr(0, TCSAFLUSH, orig_stdin_tios)) {
            syslog(LOG_CRIT, "reset_stdin: failed to reset attributes on stdin.\n");
            return(-1);
    };

    return(0);
}


/*
 * datapath_task
 */
void datapath_task(const char* portname, const char* logfile, int quiet) {

    FILE*               log;


    time_t                begin, end;
    double                totalsecs;
    double                avgrate;

    int                 bytecount = 0;
    int                 check; 

    int                 fd, closed; 

    int                 write_serial = 0; 
    int                 bytes_serial = 0; 
    int                 value_serial = 0; 

    int                 bytes_stdin = 0; 
    int                 value_stdin = 0; 

    struct termios      orig_tios;
    struct termios      orig_stdin_tios;

    log = fopen(logfile, "w");
    if(log == NULL) {
        printf("logfile: %s open in write mode failure\n", logfile);
    }

    printf("Starting datapath test.\n\n");
    printf("Opening serial port.\n");

    fd = init_port_raw(portname, 115200, &orig_tios) ;
    if(fd < 0) {
        fprintf(stderr, "Failed to open %s\n", portname);
        exit(EXIT_FAILURE);
    }

    // read value from stdin
    if(init_stdin(&orig_stdin_tios) != 0) {
        fprintf(stderr, "datapath_task: Failed to init stdin.\n");
        exit(EXIT_FAILURE);
    };


    check = flush_port(fd);
    if (check != 0 ) {
        fprintf(stderr,"flush port failed.\n");
        exit(EXIT_FAILURE);
    }
    while(1) {
        bytes_stdin = read(0, &value_stdin, 1);
        if(bytes_stdin < 0) {
        //    fprintf(stderr, "datapath_task: stdin read error. %i\n", bytes_stdin);
        } else if (bytes_stdin > 0) {
            if(value_stdin == 'f') {
                check = flush_port(fd);
                if (check != 0 ) {
                    fprintf(stderr,"flush port failed.\n");
                    exit(EXIT_FAILURE);
                }
                printf("\nFlush buffer.\n");
                continue;
            } else {
                printf("\nOptions: (s)-stop, (r)-reset, (g)-go, (f)-flush host buffer, (q)-quit\n");
                printf("\nYou typed: %c\n", value_stdin);
                write_serial = write(fd, &value_stdin, 1);
                if(value_stdin == 'g') {
                    time(&begin);
                    bytecount = 0;
                }else if(value_stdin == 's') {
                    time(&end);
                    totalsecs = difftime (end, begin);
                    avgrate   = bytecount/totalsecs;
                    printf("Average rate:\t%5.2f bytes/sec.\t%5.2f bits/sec.\n", avgrate, avgrate*8);
                }
 
                if(write_serial != 1) {
                    fprintf(stderr, "Write serial %i\n", write_serial);
                }
            }
        } else {}

        if(value_stdin == 'q') {
            printf("You typed quit.\n");
            break;
        }

//        printf("Read from serial...\n");
        bytes_serial = read(fd, &value_serial, 4);
        if(bytes_serial < 0) {
////            fprintf(stderr, "datapath_task: serial read error. %d\n", bytes_serial);
        } else if (bytes_serial > 0) {
            //printf("\nReceived: %u bytes: 0x%x\n", bytes_serial, value_serial);
            bytecount += bytes_serial;
            if(quiet == 0) {
                printf("%x\n", value_serial);
                fprintf(log, "%x %u\n", value_serial, value_serial);
            }
        } else {}
    }

    printf("Closing serial port.\n");
    closed = close_port(fd, &orig_tios);
    if(closed != 0) {
        fprintf(stderr, "Unable to close fd: %i\n", fd);
        exit(EXIT_FAILURE);
    }

    fclose(log);

    printf("Reset stdin.\n");
    reset_stdin(&orig_stdin_tios);

}

int main(int argc, char* argv[]) {

    FILE*               log;

    int                 quiet = 0;

    char                portname[NAME_SIZE] = "/dev/ttyACM0";

    char                logfile[NAME_SIZE]  = "./datapath-host.log";

    pf_command_line( argc,
                     argv,
                     &quiet,
                     logfile,
                     portname);


    log = fopen(logfile, "w");
    if(log == NULL) {
        printf("logfile: %s open in write mode failure\n", logfile);
    }


    if(quiet != 0) {
        printf("\nSettings: %s --quiet --logfile %s --portname %s \n", argv[0], logfile, portname);
        fprintf(log,"\nSettings: %s --quiet --logfile %s --portname %s \n\n", argv[0], logfile, portname);
    } else {
        printf("\nSettings: %s --logfile %s --portname %s \n", argv[0], logfile, portname);
        fprintf(log,"\nSettings: %s --logfile %s --portname %s \n\n", argv[0], logfile, portname);
    }

    fclose(log);

    datapath_task(portname, logfile, quiet);

    printf("\n** %s Done. **\n\n", argv[0]);


    return(0);

}

