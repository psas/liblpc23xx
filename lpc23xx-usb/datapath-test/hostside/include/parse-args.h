
#ifndef _PARSE_ARGS_H
#define _PARSE_ARGS_H

#define         NAME_SIZE               50
void printHelp(const char* progname);

void pf_command_line(int   argc,
            char*          argv[],
            int*           quiet,
            char*          logfile,
            char*          portname) ;

#endif

