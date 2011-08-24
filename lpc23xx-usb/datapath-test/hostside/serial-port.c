
/*
 * serial-port.c
 */

/*
 *   Initialize network serial port
 *
 *   Some code borrowed from Jamey Sharp's
 *   PSAS serial program
 *
 * init_port_raw: Initialize the serial port.
 * Accepts a string for the filename to open and initialize.
 * Accepts a long int for baud rate.
 * Returns a filehandle for the initialized serial port, or -1 on failure.
 *
 * close_port: close a port and restore to original settings
 * Accepts a file descriptor from init_port
 * Accepts a pointer to a struct termios
 * Returns a value related to result of closing the fd. 0 is success.
 *
 * Modifications:
 *   K. Wilson Tue 16 August 2011
 *      o Added pointer for capturing original termios settings in init_port
 *      o Added close_port
 *      o Added flush_port
 *   G.N. LeBrasseur  22-Mar-2005
 *      o Set/clear RTS appropriately
 *      o Re-specify several port configuration details
 *
 */

#include <stdlib.h>
#include <stdio.h>

#include <unistd.h>     // read, write, close
#include <fcntl.h>      // open (linux: man 2 open)
#include <termios.h>    // terminal
#include <errno.h>      // error numbers
#include <syslog.h>     // logging of messages

#include "serial-port.h"

/*
 * init_port
 * open a serial port (device) in raw (aka: 'don't touch my stuff!') mode.
 * NON-blocking: (O_NDELAY)
 * return:
 *      file descriptor
 */
int init_port_raw(const char *pathname, long int speed, struct termios* orig_tios) {

    int                 port;

    speed_t             realspeed;

    struct termios      port_termios;

    switch(speed) {
        case 50:     realspeed = B50;     break;
        case 75:     realspeed = B75;     break;
        case 110:    realspeed = B110;    break;
        case 134:    realspeed = B134;    break;
        case 150:    realspeed = B150;    break;
        case 200:    realspeed = B200;    break;
        case 300:    realspeed = B300;    break;
        case 600:    realspeed = B600;    break;
        case 1200:   realspeed = B1200;   break;
        case 1800:   realspeed = B1800;   break;
        case 2400:   realspeed = B2400;   break;
        case 4800:   realspeed = B4800;   break;
        case 9600:   realspeed = B9600;   break;
        case 19200:  realspeed = B19200;  break;
        case 38400:  realspeed = B38400;  break;
        case 57600:  realspeed = B57600;  break;
        case 115200: realspeed = B115200; break;
        default:
                     syslog(LOG_CRIT, "init_port: unrecognized baud rate: %d", (int)speed);
                     return(-1);
    }

    // Open the port.
    // if((port = open(pathname, O_RDWR | O_NOCTTY )) < 0) {    // Don't use O_NDELAY because we want to block on reads

    if((port = open(pathname, O_RDWR | O_NOCTTY | O_NDELAY )) < 0) {    // Don't use O_NDELAY because we want to block on reads
        syslog(LOG_CRIT, "init_port: failed to open serial port %s", pathname);
        return(-1);
    }

    // Argument 3-> 0 blocks; FNDELAY does not block
    //   fcntl(port, F_SETFL, 0);

    // Initialize the termios structure.
    if(tcgetattr(port, &port_termios)) {
        syslog(LOG_CRIT, "init_port: failed to get attributes for serial port %s", pathname);
        close(port);
        return(-1);
    } else {
        tcgetattr(port, orig_tios);
    }

    //       cfmakeraw sets the terminal attributes as follows:
    //                   termios_p->c_iflag &= ~(IGNBRK|BRKINT|PARMRK|ISTRIP
    //                                   |INLCR|IGNCR|ICRNL|IXON);
    //                   termios_p->c_oflag &= ~OPOST;
    //                   termios_p->c_lflag &= ~(ECHO|ECHONL|ICANON|ISIG|IEXTEN);
    //                   termios_p->c_cflag &= ~(CSIZE|PARENB);
    //                   termios_p->c_cflag |= CS8;

    cfmakeraw(&port_termios);
    cfsetispeed(&port_termios, realspeed);
    cfsetospeed(&port_termios, realspeed);

    //  Set to 8N1
    //   port_termios.c_cflag &= ~PARENB;
    //   port_termios.c_cflag &= ~CSTOPB;
    //   port_termios.c_cflag &= ~CSIZE;
    //   port_termios.c_cflag |= CS8;

    // No hardware flow control (we need to use these ourselves)
    //   port_termios.c_cflag &= ~CRTSCTS;

    // Seems obvious, but make sure the receiver is enabled.
    port_termios.c_cflag |= (CLOCAL | CREAD);


    // Make raw another way.
    //   port_termios.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);    // Turn off canonical mode and echo
    //   port_termios.c_iflag &= ~(IXON | IXOFF | IXANY);        // Turn off Xon/Xoff
    //   port_termios.c_oflag &= ~OPOST;                // Turn off all output post processing


    // Make the port return bytes immediately as soon as they hit the queue.
    port_termios.c_cc[VMIN]  = 1;   // 1 byte minimum
    port_termios.c_cc[VTIME] = 0;   // No timer


    // Apply the new configuration to the port.
    if(tcsetattr(port, TCSANOW, &port_termios)) {
        syslog(LOG_CRIT, "init_port: failed to set attributes for serial port %s", pathname);
        close(port);
        return(-1);
    }

    // At this point I think I've got a valid serial port.
    return(port); // file descriptor on success
}


/*
 * close_port
 * input:
 *      fd:        file descriptor
 *      orig_tios: original termios settings
 * return:  0 success
 *       : -1 on EBADF
 *       : -2 on EINTR
 *       : -3 on EIO
 *       : -4 on Failure to reset attributes
 * Ref: linux,  man 2 close
 */
int close_port(int fd, struct termios* orig_tios) {
    int check   = 0;
    int success = 0;

    if(tcsetattr(fd, TCSAFLUSH, orig_tios)) {
        syslog(LOG_CRIT, "close_port: failed to reset attributes on %i\n", fd);
        return(-4);
    };

    check = close(fd);
    switch(check) {
        case EBADF: 
            syslog(LOG_CRIT, "close_port: Not a valid file descriptor port: %i\n", fd);
            success = -1;
            break;
        case EINTR: 
            syslog(LOG_CRIT, "close_port: Call to close interupted by signal.\n");
            success = -2;
            break;
        case EIO: 
            syslog(LOG_CRIT, "close_port: An I/O error occurred.\n");
            success = -3;
            break;
        default:
            success =  0;
            break;
    }
    return(success);
}

/*
 * flush_port
 */
int flush_port(int fd) {
    int check   = 0;
    int success = 0;

    check = tcflush(fd, TCIOFLUSH);
    switch(check) {
        case EBADF:
            syslog(LOG_CRIT, "flush_port: Not a valid file descriptor port: %i\n", fd);
            success = -1;
            break;
        case EINVAL:
            syslog(LOG_CRIT, "flush_port: The queue_selector argument is not a supported value..\n");
            success = -2;
            break;
        case ENOTTY:
            syslog(LOG_CRIT, "flush_port: The file associated with fildes is not a terminal\n");
            success = -3;
            break;
        default:
            success =  check;
            break;
    }
    return(success);
}

