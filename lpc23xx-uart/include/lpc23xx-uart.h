
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

/*! \file lpc23xx-uart.h
 */

#ifndef _LPC23XX_UART_H
#define _LPC23XX_UART_H

#include <stdint.h>
#include <stdbool.h>
#include "ringbuffer.h"

#define         UART_MAXBUFFER            121

/*
 * PCLKSEL0
 */

#define         PCLKSEL0_UART0_MASK       ( ~(0x11<<6) )
#define         PCLKSEL0_UART0_DIV1       ( PCLKSEL0 = (PCLKSEL0 & PCLKSEL0_UART0_MASK) | (0x01<<6) )
#define         PCLKSEL0_UART0_DIV2       ( PCLKSEL0 = (PCLKSEL0 & PCLKSEL0_UART0_MASK) | (0x10<<6) )
#define         PCLKSEL0_UART0_DIV4       ( PCLKSEL0 = (PCLKSEL0 & PCLKSEL0_UART0_MASK) )
#define         PCLKSEL0_UART0_DIV8       ( PCLKSEL0 = (PCLKSEL0 & PCLKSEL0_UART0_MASK) | (0x11<<6) )

#define         PCLKSEL0_UART1_MASK       ( ~(0x11<<8) )
#define         PCLKSEL0_UART1_DIV1       ( PCLKSEL0 = (PCLKSEL0 & PCLKSEL0_UART0_MASK) | (0x01<<8) )
#define         PCLKSEL0_UART1_DIV2       ( PCLKSEL0 = (PCLKSEL0 & PCLKSEL0_UART0_MASK) | (0x10<<8) )
#define         PCLKSEL0_UART1_DIV4       ( PCLKSEL0 = (PCLKSEL0 & PCLKSEL0_UART0_MASK) )
#define         PCLKSEL0_UART1_DIV8       ( PCLKSEL0 = (PCLKSEL0 & PCLKSEL0_UART0_MASK) | (0x11<<8) )

#define         PCLKSEL1_UART2_MASK       ( ~(0x11<<16) )
#define         PCLKSEL1_UART2_DIV1       ( PCLKSEL1 = (PCLKSEL1 & PCLKSEL1_UART2_MASK) | (0x01<<16) )
#define         PCLKSEL1_UART2_DIV2       ( PCLKSEL1 = (PCLKSEL1 & PCLKSEL1_UART2_MASK) | (0x10<<16) )
#define         PCLKSEL1_UART2_DIV4       ( PCLKSEL1 = (PCLKSEL1 & PCLKSEL1_UART2_MASK) )
#define         PCLKSEL1_UART2_DIV8       ( PCLKSEL1 = (PCLKSEL1 & PCLKSEL1_UART2_MASK) | (0x11<<16) )

#define         PCLKSEL1_UART3_MASK       ( ~(0x11<<18) )
#define         PCLKSEL1_UART3_DIV1       ( PCLKSEL1 = (PCLKSEL1 & PCLKSEL1_UART3_MASK) | (0x01<<18) )
#define         PCLKSEL1_UART3_DIV2       ( PCLKSEL1 = (PCLKSEL1 & PCLKSEL1_UART3_MASK) | (0x10<<18) )
#define         PCLKSEL1_UART3_DIV4       ( PCLKSEL1 = (PCLKSEL1 & PCLKSEL1_UART3_MASK) )
#define         PCLKSEL1_UART3_DIV8       ( PCLKSEL1 = (PCLKSEL1 & PCLKSEL1_UART3_MASK) | (0x11<<18) )

/*
 * PCONP Peripheral Power control
 * p69 lpc23xx rev 3.
 */
#define         POWER_UART0_MASK          ~(0x1<<3)
#define         POWER_ON_UART0            ( PCONP = PCONP | (0x1<<3)           )
#define         POWER_OFF_UART0           ( PCONP = (PCONP & POWER_UART0_MASK) )

#define         POWER_UART1_MASK          ~(0x1<<4)
#define         POWER_ON_UART1            ( PCONP = PCONP | (0x1<<4)           )
#define         POWER_OFF_UART1           ( PCONP = (PCONP & POWER_UART1_MASK) )

#define         POWER_UART2_MASK          ~(0x1<<24)
#define         POWER_ON_UART2            ( PCONP = PCONP | (0x1<<24)          )
#define         POWER_OFF_UART2           ( PCONP = (PCONP & POWER_UART2_MASK) )

#define         POWER_UART3_MASK          ~(0x1<<25)
#define         POWER_ON_UART3            ( PCONP = PCONP | (0x1<<25)          )
#define         POWER_OFF_UART3           ( PCONP = (PCONP & POWER_UART3_MASK) )

/*
 * uart pins and register masks
 */
#define         RBRIE_BIT                 0
#define         THREIE_BIT                1
#define         RXLSIE_BIT                2

#define         VIC_UART0_BIT             6   // lpc23xx manual page 94 VIC
#define         VIC_UART1_BIT             7
#define         VIC_UART2_BIT             28
#define         VIC_UART3_BIT             29

#define         VIC_ENABLE_UART0_INT      (VICIntEnable = (VICIntEnable | (1<<VIC_UART0_BIT)   ))
#define         VIC_DISABLE_UART0_INT     (VICIntEnable = (VICIntEnable & (~(1<<VIC_UART0_BIT))))

#define         VIC_ENABLE_UART1_INT      (VICIntEnable = (VICIntEnable | (1<<VIC_UART1_BIT)   ))
#define         VIC_DISABLE_UART1_INT     (VICIntEnable = (VICIntEnable & (~(1<<VIC_UART1_BIT))))

#define         VIC_ENABLE_UART2_INT      (VICIntEnable = (VICIntEnable | (1<<VIC_UART2_BIT)   ))
#define         VIC_DISABLE_UART2_INT     (VICIntEnable = (VICIntEnable & (~(1<<VIC_UART2_BIT))))

#define         VIC_ENABLE_UART3_INT      (VICIntEnable = (VICIntEnable | (1<<VIC_UART3_BIT)   ))
#define         VIC_DISABLE_UART3_INT     (VICIntEnable = (VICIntEnable & (~(1<<VIC_UART3_BIT))))

#define         VIC_UART0_SELECT_IRQ      (VICIntSelect = (VICIntSelect & (~(1<<VIC_UART0_BIT)) ))
#define         VIC_UART0_SELECT_FIQ      (VICIntSelect = (VICIntSelect | (1<<VIC_UART0_BIT)    ))

#define         VIC_UART1_SELECT_IRQ      (VICIntSelect = (VICIntSelect & (~(1<<VIC_UART1_BIT)) ))
#define         VIC_UART1_SELECT_FIQ      (VICIntSelect = (VICIntSelect | (1<<VIC_UART1_BIT)    ))

#define         VIC_UART2_SELECT_IRQ      (VICIntSelect = (VICIntSelect & (~(1<<VIC_UART2_BIT)) ))
#define         VIC_UART2_SELECT_FIQ      (VICIntSelect = (VICIntSelect | (1<<VIC_UART2_BIT)    ))

#define         VIC_UART3_SELECT_IRQ      (VICIntSelect = (VICIntSelect & (~(1<<VIC_UART3_BIT)) ))
#define         VIC_UART3_SELECT_FIQ      (VICIntSelect = (VICIntSelect | (1<<VIC_UART3_BIT)    ))

#define         VIC_UART0_SET_PRIORITY(pri) (VICVectPriority6  = pri)
#define         VIC_UART1_SET_PRIORITY(pri) (VICVectPriority7  = pri)
#define         VIC_UART2_SET_PRIORITY(pri) (VICVectPriority28 = pri)
#define         VIC_UART3_SET_PRIORITY(pri) (VICVectPriority29 = pri)

#define         UART_SET_VIC_UART0_HANDLER(name) (VICVectAddr6 = (unsigned int)name)
#define         UART_SET_VIC_UART1_HANDLER(name) (VICVectAddr7 - (unsigned int)name)
#define         UART_SET_VIC_UART2_HANDLER(name) (VICVectAddr28 - (unsigned int)name)
#define         UART_SET_VIC_UART3_HANDLER(name) (VICVectAddr20 - (unsigned int)name)

#define         UART_INTST_BIT                 0
#define         UART_INTSOURCE_BITS            0b1110

#define         P0_RXD0_TXD0_MASK         (~(0xF0))
#define         P0_RXD0_TXD0_ENABLE       0x50

#define         SET_RXD0_TXD0             ( PINSEL0 = ( ( PINSEL0 & P0_RXD0_TXD0_MASK ) | P0_RXD0_TXD0_ENABLE ) )
#define         CLEAR_RXD0_TXD0           ( PINSEL0 = ( ( PINSEL0 & P0_RXD0_TXD0_MASK ) )

#define         P0_RXD2_TXD2_MASK         (~(0xF00000))
#define         P0_RXD2_TXD2_ENABLE       0x500000

#define         SET_RXD2_TXD2             ( PINSEL0 = ( ( PINSEL0 & P0_RXD2_TXD2_MASK ) | P0_RXD2_TXD2_ENABLE ) )
#define         CLEAR_RXD2_TXD2           ( PINSEL0 = ( ( PINSEL0 & P0_RXD2_TXD2_MASK ) )

#define         P0_RXD3_TXD3_MASK         (~(0xF))
#define         P0_RXD3_TXD3_ENABLE       0xA

#define         SET_RXD3_TXD3             ( PINSEL0 = ( ( PINSEL0 & P0_RXD3_TXD3_MASK ) | P0_RXD3_TXD3_ENABLE ) )
#define         CLEAR_RXD3_TXD3           ( PINSEL0 = ( ( PINSEL0 & P0_RXD3_TXD3_MASK ) )

#define         P0_TXD1_MASK              (~(0xC000))
#define         P0_TXD1_ENABLE            0x40000000

#define         SET_TXD1                  ( PINSEL0 = ( ( PINSEL0 & P0_TXD1_MASK ) | P0_TXD1_ENABLE ) )
#define         CLEAR_TXD1                ( PINSEL0 = ( ( PINSEL0 & P0_TXD1_MASK ) ) 

#define         P1_RXD1_MASK              (~(0x3))
#define         P1_RXD1_ENABLE            0x1

#define         SET_RXD1                  ( PINSEL1 = ( ( PINSEL1 & P1_RXD1_MASK ) | P1_RXD1_ENABLE ) )
#define         CLEAR_RXD1                ( PINSEL1 = ( ( PINSEL1 & P1_RXD1_MASK ) ) 

#define         DLAB_MASK                 ( ~((0x1)<<7) )
#define         SET_DLAB0                 ( U0LCR = ( U0LCR  | (0x1<<7) ) )
#define         CLEAR_DLAB0               ( U0LCR = (U0LCR & DLAB_MASK) )
#define         SET_DLAB2                 ( U2LCR = (( U2LCR & DLAB_MASK)  | (1<<7)))
#define         CLEAR_DLAB2               ( U2LCR = (U2LCR & DLAB_MASK) )
#define         SET_DLAB3                 ( U3LCR = (( U3LCR & DLAB_MASK)  | (1<<7)))
#define         CLEAR_DLAB3               ( U3LCR = (U3LCR & DLAB_MASK) )

#define         UART0_8N1                 ( U0LCR = 0x3 )
#define         UART2_8N1                 ( U2LCR = 0x3 )
#define         UART3_8N1                 ( U3LCR = 0x3 )

#define         UART0_FCR_ONE_CHAR_EN     ( U0FCR = 0x1 | 0x6 )
#define         UART2_FCR_ONE_CHAR_EN     ( U0FCR = 0x1 | 0x6 )
#define         UART3_FCR_ONE_CHAR_EN     ( U0FCR = 0x1 | 0x6 )

#define         U0THR_THRE_MASK           ( (0x1 << 0x5) )
#define         U0THR_EMPTY               ( (U0LSR & U0THR_THRE_MASK ) >> 0x5 )

#define         U0THR_THRE_MASK           ( (0x1 << 0x5) )
#define         U0THR_EMPTY               ( (U0LSR & U0THR_THRE_MASK ) >> 0x5 )

#define         U0LSR_RDR_MASK            ( ( 0x1 ) )
#define         U0RDR_READY               ( (U0LSR & U0LSR_RDR_MASK ) )



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

extern Ringbuffer     uart0_rb_g;

typedef enum {UART0=0, UART1, UART2, UART3} uartport;

typedef enum {RLS=0, RDA, CTI, THRE} uart_int_status;

void    uart_enable_interrupt(uartport u);

void    uart_disable_interrupt(uartport u);

Baud    uart0_query_baud(void) ;

uint8_t uart0_query_charlength(void) ;

uint8_t uart0_query_stopbits(void) ;

void    uart0_init_9600(void) ;
void    uart0_init_115200(void) ;
bool    uart0_init_rb() ;
void    uart0_putchar(char ch) ;

void    uart0_putstring(const char *s) ;

char    uart0_getchar (void) ;

char*   uart0_getstring (void) ;

#endif
