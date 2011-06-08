
/*
 * lpc23xx-uart.h
 */

#ifndef _LPC23XX_UART_H
#define _LPC23XX_UART_H

#define UART_MAXBUFFER  121 

typedef enum Baudtype {
    ZERO_H_B              = 0,
    TWELVE_H_B            = 1200,
    FOURTY_EIGHT_H_B      = 4800,
    NINETY_SIX_H_B        = 9600,
    NINETEEN_TWO_H_B      = 19200,
    THIRTY_EIGHT_FOUR_H_B = 38400,
    FIFTY_SEVEN_SIX_H_B   = 57600,
    ONE_FIFTEEN_TWO_H_B   = 115200
} Baud;

extern struct uart0_status {
    Baud    baudrate;
    uint8_t charlength;
    uint8_t stopbits;
} uart0stat ;

//extern char uart0_linebuffer[UART_MAXBUFFER] ;

Baud    uart0_query_baud(void) ;

uint8_t uart0_query_charlength(void) ;

uint8_t uart0_query_stopbits(void) ;

void    uart0_init_115200(void) ;

void    uart0_putchar(int8_t ch) ;

void    uart0_putstring(const char *s) ;

int8_t  uart0_getchar (void) ;

char*   uart0_getstring (void) ;

#endif
