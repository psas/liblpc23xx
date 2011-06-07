
/*
 * lpc23xx-uart.h
 */

#ifndef _LPC23XX_UART_H
#define _LPC23XX_UART_H

typedef enum Baudtype {
    TWELVE_H             = 1200,
    FOURTY_EIGHT_H       = 4800,
    NINETY_SIX_H         = 9600,
    NINETEEN_TWO_H       = 19200,
    THIRTY_EIGHT_FOUR_H  = 38400,
    FIFTY_SEVEN_SIX_H    = 57600,
    ONE_FIFTEEN_TWO_H    = 115200
} Baud;

void uart_0_init(Baud baudrate);

#endif
