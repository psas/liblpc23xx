
/* Copyright (C) 2011 Keith Wilson.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */

/*! \file lpc23xx-uart.c
 */

#include <stdint.h>
#include <stdbool.h>

#include "lpc23xx.h"
#include "lpc23xx-pll.h"
#include "lpc23xx-vic.h"

#include "ringbuffer.h"
#include "lpc23xx-uart.h"

struct uart0_status uart0stat;

Ringbuffer          uart0_rb_g;

/*! \brief enable the interrupts on uartport u
 *
 * @param u
 */
void uart_enable_interrupt(uartport u) {
	switch(u){
	case UART0:
		U0IER =  (1<<RXLSIE_BIT) | (1<<THREIE_BIT) | (1<<RBRIE_BIT);
		VIC_UART0_SELECT_IRQ ;
		VIC_ENABLE_UART0_INT ;
		VIC_UART0_SET_PRIORITY(3) ;
		break;
	case UART1:
		U1IER =  (1<<RXLSIE_BIT) | (1<<THREIE_BIT) | (1<<RBRIE_BIT);
		VIC_UART1_SELECT_IRQ ;
		VIC_ENABLE_UART1_INT ;
		VIC_UART1_SET_PRIORITY(3) ;
		break;
	case UART2:
		U2IER =  (1<<RXLSIE_BIT) | (1<<THREIE_BIT) | (1<<RBRIE_BIT);
		VIC_UART2_SELECT_IRQ ;
		VIC_ENABLE_UART2_INT ;
		VIC_UART2_SET_PRIORITY(3) ;
		break;
	case UART3:
		U3IER =  (1<<RXLSIE_BIT) | (1<<THREIE_BIT) | (1<<RBRIE_BIT);
		VIC_UART3_SELECT_IRQ ;
		VIC_ENABLE_UART3_INT ;
		VIC_UART3_SET_PRIORITY(3) ;
		break;
	default:
		break;
	}
	CLEAR_DLAB0;
}

/*! \brief disable the interrupts on uartport u
 *
 * @param u
 *
 * \warning Priority is default to 3 in VIC and IRQ is default in VIC.
 */
void uart_disable_interrupt(uartport u) {
	switch(u) {
		case UART0:
			U0IER =  U0IER & ( ~( (1<<RXLSIE_BIT) | (1<<THREIE_BIT) | (1<<RBRIE_BIT) ) );
			VIC_DISABLE_UART0_INT ;
			break;
		case UART1:
			U1IER =  U1IER & ( ~( (1<<RXLSIE_BIT) | (1<<THREIE_BIT) | (1<<RBRIE_BIT) ) );
			VIC_DISABLE_UART1_INT ;
			break;
		case UART2:
			U2IER =  U2IER & ( ~( (1<<RXLSIE_BIT) | (1<<THREIE_BIT) | (1<<RBRIE_BIT) ) );
			VIC_DISABLE_UART2_INT ;
			break;
		case UART3:
			U3IER =  U3IER & ( ~( (1<<RXLSIE_BIT) | (1<<THREIE_BIT) | (1<<RBRIE_BIT) ) );
			VIC_DISABLE_UART3_INT ;
			break;
		default:
			break;
	}
}

/*
 * uart0_query_baud
 */
Baud uart0_query_baud(void) {
    return(uart0stat.baudrate);
}

/*
 * uart0_query_charlength
 */
uint8_t uart0_query_charlength(void) {
    return(uart0stat.charlength);
}

/*
 * uart0_query_stopbits
 */
uint8_t uart0_query_stopbits(void) {
    return(uart0stat.stopbits);
}

/*
 * uart_0_init_9600
 * initialize uart0
 */
void uart0_init_9600(void) {

    Freq     cclk;

    uart0stat.baudrate = ZERO_H_B;

    uart0_init_rb();

    // Enable GPIO for TXD/RXD
    SET_RXD0_TXD0;

    // turn on power.
    POWER_ON_UART0;

    // divide cclk by one
    PCLKSEL0_UART0_DIV1;

    // enable divisor latch access
    SET_DLAB0;

    cclk = pllquery_cclk_mhz();

    switch(cclk) {
        case FOURTY_EIGHT_MHZ:
            U0DLL = 208;
            U0DLM = 0;
            U0FDR = (2<<4) | 1; // MULVAL = 2, DIVADD = 1;
            break;
        case SIXTY_MHZ:
            U0DLL = 4;
            U0DLM = 1;
            U0FDR = (2<<4) | 1; // MULVAL = 2, DIVADD = 1;
            break;
        case SEVENTY_TWO_MHZ:
            U0DLL = 56;
            U0DLM = 1;
            U0FDR = (2<<4) | 1; // MULVAL = 2, DIVADD = 1;
            break;
        default:
            while(1);
            break;
    }

    UART0_FCR_ONE_CHAR_EN;

    // set parameters
    UART0_8N1;

    uart0stat.charlength = 8;
    uart0stat.stopbits   = 1;

    // reset tx/rx fifo

    CLEAR_DLAB0;

    uart0stat.baudrate = NINETY_SIX_H_B;

}


/*
 * uart_0_init_115200
 * initialize uart0
 */
void uart0_init_115200(void) {

    Freq     cclk;

    uart0stat.baudrate = ZERO_H_B;

    uart0_init_rb();

    // Enable GPIO for TXD/RXD
    SET_RXD0_TXD0;

    // turn on power.
    POWER_ON_UART0;

    // divide cclk by one
    PCLKSEL0_UART0_DIV1;

    // enable divisor latch access
    SET_DLAB0;

    cclk = pllquery_cclk_mhz();

    switch(cclk) {
        case FOURTY_EIGHT_MHZ:
            U0DLL = 17;
            U0DLM = 0;
            U0FDR = (15<<4) | 8; // MULVAL = 15, DIVADD = 8;
            break;
        case SIXTY_MHZ:
            U0DLL = 21;
            U0DLM = 0;
            U0FDR = (11<<4) | 6; // MULVAL = 11, DIVADD = 6;
            break;
        case SEVENTY_TWO_MHZ:
            U0DLL = 26;
            U0DLM = 0;
            U0FDR = (2<<4) | 1; // MULVAL = 11, DIVADD = 6;
            break;
        default:
            while(1);
            break;
    }
    // enable interrupt
    UART0_FCR_ONE_CHAR_EN;

    // set parameters
    UART0_8N1;

    uart0stat.charlength = 8;
    uart0stat.stopbits   = 1;

    CLEAR_DLAB0;


    uart0stat.baudrate = ONE_FIFTEEN_TWO_H_B;

}
/*! \brief initialize the ringbuffer structure
 *
 */
bool uart0_init_rb() {
	if(!rb_initialize(&uart0_rb_g)) {
		return false;
	}
	return(true);
}


/*! \brief get the status of the interrupt
 */
uart_int_status get_uart_int_status(uint32_t reg) {
	return(st = reg >> 1 & 0b111);
}

/*! \brief the interrupt for uart0
 */
void uart0_interrupt_service() {
	uart_int_status st;

	st = U0IIR;

	if (st & UART_INTST_BIT ) {
		switch (st) {
		case RLS:
			break;
		case RDA:
			break;
		case CTI:
			break;
		case THRE:
			break;
		default:
			break;
		}
}


	// get status of interrupt rx , tx other?




}

/*! \brief use interrupt based uart
 *
 * @param ch 8 bit char
 */
void uart0_putchar_intr(char ch) {

	// what was the interrupt?
	uart_get_status(UART0_IIR)

	// put a char into ringbuffer

	// enable thre interrupt
}

/*! \brief put a char to the uart0 ringbuffer
 * uart0_putchar
 */
void uart0_putchar(char ch) {
    if (ch == '\n') {
        while (!(U0THR_EMPTY));
        U0THR = '\r';
    }
    while (!(U0THR_EMPTY));
    U0THR = ch;
}


/*
 * uart0_putstring
 * -------------------------------------
 * put a string to the serial port
 *
 * Assumes null termination of string.
 */
void uart0_putstring(const char *s) {

    while(*s ) {
        uart0_putchar(*s++); // put the char
    }
}


/*
 * uart0_getchar
 */
char uart0_getchar (void)  {

    while (!U0RDR_READY);

    return (U0RBR);
}


/*
 * uart0_getstring
 * --------------------------------------
 * receive chars from the serial port until
 *   '\n'.
 * maximum length of line is UART_MAXBUFFER-1 chars.
 */
char* uart0_getstring (void) {

    static char uart0_linebuffer[UART_MAXBUFFER] ;

    char    current = ' ';
    uint32_t   index   = 0;

    while((current != '\n' && current != '\r') && index < UART_MAXBUFFER-1) {
        current                 = uart0_getchar();
        uart0_linebuffer[index] = current;
        ++index;
    }
    uart0_linebuffer[index]     = '\0';

    return(uart0_linebuffer);
}

