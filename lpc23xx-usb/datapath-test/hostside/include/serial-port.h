
/*
 * serial-port.h
 */

#ifndef _SERIAL_PORT_H
#define _SERIAL_PORT_H

int init_port_raw(const char *pathname, long int speed, struct termios* orig_tios) ;
int close_port(int fd, struct termios* orig_tios) ;
int flush_port(int fd) ;

#endif
