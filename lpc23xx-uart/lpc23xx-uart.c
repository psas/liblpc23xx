
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
#include "lpc23xx-power.h"
#include "lpc23xx-vic.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"
#include "ringbuffer.h"

#include "lpc23xx-uart.h"


uart_status         uart0_status_g;

Ringbuffer          uart0_rb_rx_g;
Ringbuffer          uart0_tx_rb_g;

bool                uart0_kick_thr_int_g     = true;

static char         uart0_linebuffer[MAX_RINGBUFFER_ELEMS+1] ;

/*! \brief enable the interrupts on uartport u
 *
 * @param u
 */
void uart_enable_interrupt(uartport u) {
    uint32_t dummy32 = 0;
    uint8_t  dummy8  = 0;

    switch(u){
        case UART0:
            UART0_RBR_INT_DISABLE ;
            UART0_RXLS_INT_DISABLE ;
            UART0_THRE_INT_DISABLE ;

            uart0_kick_thr_int_g = true;
            SET_IRQ(VIC_UART0);
            ENABLE_INT(VIC_UART0);
            VIC_SET_UART0_PRIORITY(UART0_INTR_PRIORITY) ;
            VIC_SET_UART0_HANDLER(uart0_interrupt_service);

            UART0_RBR_INT_ENABLE ;
            UART0_THRE_INT_ENABLE ;
            UART0_RXLS_INT_ENABLE ;
            dummy8  = U0LSR;
            dummy32 = U0IIR;           // clear any flags in IntId fields...
            break;
        case UART1:
            // this uart has a modem...
            break;
        case UART2:
            break;
        case UART3:
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
            U0IER =  U0IER & ( ~( (1<<UART_RXLSIE_BIT) | (1<<UART_THREIE_BIT) | (1<<UART_RBRIE_BIT) ) );
            DISABLE_INT(VIC_UART0);
            break;
        case UART1:
            U1IER =  U1IER & ( ~( (1<<UART_RXLSIE_BIT) | (1<<UART_THREIE_BIT) | (1<<UART_RBRIE_BIT) ) );
            DISABLE_INT(VIC_UART1);
            break;
        case UART2:
            U2IER =  U2IER & ( ~( (1<<UART_RXLSIE_BIT) | (1<<UART_THREIE_BIT) | (1<<UART_RBRIE_BIT) ) );
            DISABLE_INT(VIC_UART2);
            break;
        case UART3:
            U3IER =  U3IER & ( ~( (1<<UART_RXLSIE_BIT) | (1<<UART_THREIE_BIT) | (1<<UART_RBRIE_BIT) ) );
            DISABLE_INT(VIC_UART3);
            break;
        default:
            break;
    }
}

/*
 * uart0_query_baud
 */
Baud uart0_query_baud(void) {
    return(uart0_status_g.baudrate);
}

/*
 * uart0_query_charlength
 */
uint8_t uart0_query_charlength(void) {
    return(uart0_status_g.charlength);
}

/*
 * uart0_query_stopbits
 */
uint8_t uart0_query_stopbits(void) {
    return(uart0_status_g.stopbits);
}

/*
 * uart_0_init_9600
 * initialize uart0
 */
void uart0_init_9600(void) {

    Freq     cclk;

    uart0_status_g.baudrate = ZERO_H_B;

    uart0_init_rb();

    // Enable GPIO for TXD/RXD
    SET_RXD0_TXD0;

    // turn on power.
    POWER_ON(PCUART0);

    // divide cclk by one
    SET_PCLK(PCLK_UART0, CCLK_DIV1);

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

    uart0_status_g.charlength = 8;
    uart0_status_g.stopbits   = 1;

    // reset tx/rx fifo

    CLEAR_DLAB0;

    uart0_status_g.baudrate = NINETY_SIX_H_B;

}


/*
 * uart_0_init_115200
 * initialize uart0
 */
void uart0_init_115200(void) {

    Freq     cclk;

    uart0_status_g.baudrate = ZERO_H_B;

    uart0_init_rb();

    // Enable GPIO for TXD/RXD
    SET_RXD0_TXD0;

    // turn on power.
    POWER_ON(PCUART0);

    // divide cclk by one
    SET_PCLK(PCLK_UART0, CCLK_DIV1);

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

    uart0_status_g.charlength = 8;
    uart0_status_g.stopbits   = 1;

    CLEAR_DLAB0;

    uart0_status_g.baudrate = ONE_FIFTEEN_TWO_H_B;
    uart_enable_interrupt(UART0);

}

/*! \brief initialize the ringbuffer structure
 *
 */
bool uart0_init_rb() {
    if(!rb_initialize(&uart0_rb_rx_g)) {
        return false;
    }
    if(!rb_initialize(&uart0_tx_rb_g)) {
        return false;
    }
    return(true);
}


/*! \brief get the status of the interrupt
*/
uart_iir_intid get_uart0_iir_intid(uint32_t u0iir) {
    return( (0x7 & (u0iir >> 1))  );
}

/*! \brief reading LSR will clear it.
 *
 * @param lsrstatus pointer to lsr status structure
 */
void get_uart0_lsr_status(uart_lsr_status* lsrstatus) {
    uint8_t lsr_reg = U0LSR; // this read will clear U0LSR

    lsrstatus->uart_rdr   = (  lsr_reg & (1<<LSR_RDR)            );
    lsrstatus->uart_oe    = ( (lsr_reg & (1<<LSR_OE))   >> LSR_OE);
    lsrstatus->uart_pe    = ( (lsr_reg & (1<<LSR_PE))   >> LSR_PE);
    lsrstatus->uart_fe    = ( (lsr_reg & (1<<LSR_FE))   >> LSR_FE);
    lsrstatus->uart_bi    = ( (lsr_reg & (1<<LSR_BI))   >> LSR_BI);
    lsrstatus->uart_thre  = ( (lsr_reg & (1<<LSR_THRE)) >> LSR_THRE);
    lsrstatus->uart_temt  = ( (lsr_reg & (1<<LSR_TEMT)) >> LSR_TEMT);
    lsrstatus->uart_rxfe  = ( (lsr_reg & (1<<LSR_RXFE)) >> LSR_RXFE);
}

/*! \brief Process an interrupt for uart0
*/
void uart0_interrupt_service() {

    volatile uint8_t           u0lsr_value;
    volatile unsigned char     u0iir_value;

    volatile uart_iir_intid    u0iir_intid;

    bool                       success = false;
    uint8_t                    ch      = '\0';

    u0iir_value = U0IIR;
    while ((u0iir_value & 0x1) == 0) {
        u0iir_intid = (0b111 & (u0iir_value >> 1));
        switch (u0iir_intid) {
            // receive line status, see page 417 lpc23xx user manual
            // RLS Interrupt on: overrun error (OE), parity error (PE), framing error (FE) and break interrupt (BI).
            case UART_RLS:
                u0lsr_value = U0LSR;
                break;
            case UART_RDA:             // receive data available
            case UART_CTI:             // Character time out indicated, could be same case as UART_RDA...
                ch = (RB_ELEM) U0RBR;
                if(!rb_is_full(&uart0_rb_rx_g)) {
                    rb_put_elem(ch, &uart0_rb_rx_g);
                } else {
                    // error...char is lost.
                }
                break;
            case UART_THRE:            // Transmit Holding Register Empty interrupt
                if(!rb_is_empty(&uart0_tx_rb_g)) {
                    success = rb_get_elem(&ch, &uart0_tx_rb_g);
                    // if(!success) ch = ;
                    U0THR = ch;
                    uart0_kick_thr_int_g=false;
                } else {
                    uart0_kick_thr_int_g=true;  // need to restart THR interrupt
                }
                break;
            default:
                break;
        }
        u0iir_value = U0IIR;
    }
    VICAddress = 0x0 ;
}

/*! \brief use interrupt based uart
 *
 * @param ch 8 bit char
 *
 * \return false on buffer full.
 */
volatile bool uart0_putchar_intr(char ch) {

	vic_cpu_disable_interrupts();
    if(!rb_is_full(&uart0_tx_rb_g)){
        if(uart0_kick_thr_int_g) {
            uart0_kick_thr_int_g = false;
            U0THR = ch;
        } else {
            rb_put_elem(ch, &uart0_tx_rb_g);
        }
    } else {
    	  vic_cpu_enable_interrupts();
          return(false);  // rb is full...char lost.
    }
    vic_cpu_enable_interrupts();
    return(true);
}

/*! \brief put a char to the uart0 ringbuffer
 * uart0_putchar
 * \warning This is the polling version.
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
 * uart0_putstring_intr
 * -------------------------------------
 * put a string to the serial port, using interrupts
 *
 * Assumes null termination of string.
 */
bool uart0_putstring_intr(const char *s) {
	bool success=false;

	char* slocal       = (char* )s;
	static char  outch;

	outch = *slocal;

	while(outch != '\0') {
		success = uart0_putchar_intr(outch);
		++slocal;
		outch = *slocal;
	}
	return success;
}

/*
 * uart0_putstring
 * -------------------------------------
 * put a string to the serial port
 *
 * Assumes null termination of string.
 */
void uart0_putstring(const char *s) {

    while(*s) {
        uart0_putchar(*s++); // put the char
    }
}

/*! \brief uart interrupt based
 *
 * \warning Consider calling rb_is_empty before this function
 *
 */
char uart0_getchar_intr(void)  {
    RB_ELEM ch;

    if(!rb_is_empty(&uart0_rb_rx_g)) {
        vic_cpu_disable_interrupts();
        rb_get_elem(&ch, &uart0_rb_rx_g);
        vic_cpu_enable_interrupts();
        return((char) ch);
    }
    return('\0');
}

/*! \brief uart polling version
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

/*
 * uart0_getstring_intr
 * --------------------------------------
 * Pull characters from the RX Ringbuffer until '\n'
 *
 * maximum length of line is MAX_RINGBUFFER_ELEMS+1 chars.
 */
char* uart0_getstring_intr (void) {

    vic_cpu_disable_interrupts();
    rb_get_line((RB_ELEM *) uart0_linebuffer, &uart0_rb_rx_g);
    vic_cpu_enable_interrupts();

    return(uart0_linebuffer);
}


