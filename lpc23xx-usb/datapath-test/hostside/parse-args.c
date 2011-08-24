
/*
 * parse-args.c
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "helpers.h"
#include "parse-args.h"

void pf_command_line(int   argc,
            char*          argv[],
            int*           quiet,
            char*          logfile,
            char*          portname) {

    int i=0;

    if(argc==0) {
        printHelp(argv[0]);
        exit(EXIT_SUCCESS);
    }
    for(i=0; i< argc ; i++) {
        if( (strcmp( argv[i],"-h") == 0) || (strcmp ( argv[i], "--help")==0) ){
            printHelp( argv[0]);
            exit(EXIT_SUCCESS);
        } else if(strcmp ( argv[i],"--quiet") == 0) {
            *quiet = 1;
        } else if(strcmp ( argv[i],"--logfile") == 0) {
            if(i< argc-1) {
                strncpy(logfile,argv[i+1],NAME_SIZE-1);
                logfile[NAME_SIZE-1] = '\0';
            } else {
                error("No log file name.");
                printHelp( argv[0]);
                exit(EXIT_FAILURE);
            }
            ++i;
        }  else if(strcmp ( argv[i],"--portname") == 0) {
            if(i< argc-1) {
                strncpy(portname,argv[i+1],NAME_SIZE-1);
                logfile[NAME_SIZE-1] = '\0';
            } else {
                error("No port name.");
                printHelp( argv[0]);
                exit(EXIT_FAILURE);
            }
            ++i;
       } else {
            if(i!=0){
                error("Unrecognized option:"); 
                fprintf(stderr,"\t%s <- unrecognized\n",  argv[i]); 
                printHelp( argv[0]);
                exit(EXIT_FAILURE);
            }
        }
    }
}

/*
 * printHelp
 */
void printHelp(const char* progname) {

    printf("\n%s is a program to read data from the usb port driven by a client GFE sensor node.\n\
            \n\
            Usage:\n\
            \t [--quiet]\n\
            \t [--logfile string]\n\
            \t [--portname string]\n\
            \t [-h|--help]\n\
            \n\
            --quiet            don't log or write values to screen.\n\n\
            --logfile          the file with run statistics and messages. \n\n\
            --portname         name of the serial port to open. (default /dev/ttyACM0)\n\n\
            -h | --help        help message.\n\n\
            \n\n"\
            ,progname);
}

