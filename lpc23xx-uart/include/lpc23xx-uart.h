
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

struct uart0_status {
    Baud    baudrate;
    uint8_t charlength;
    uint8_t stopbits;
} ;

static char uart0_linebuffer[UART_MAXBUFFER] ;

void uart0_init_115200(void) ;

void uart0_putchar(int8_t ch) ;

void uart0_putstring(const int8_t *s) ;

int8_t uart0_getchar (void) ;

void uart0_getstring (void) ;

#endif
