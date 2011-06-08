
/*
 * olimexlpcp2378reva.h
 * lpc2378 part  (144pins)
 */

#ifndef _OLIMEXLPCP2378REVA_H
#define _OLIMEXLPCP2378REVA_H

#include "lpc23xx.h"
/*
 * hardware details
 */
#define         LPC_XTAL_FREQ             TWELVE_MHZ
#define         CCLK                      SIXTY_MHZ

/*
 * VIC
 */
#define         VIC_ENABLE_CLEAR          ( VICIntEnClr = (unsigned) 0xFFFFFFFF )

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



/*
 * pll
 */
#define         SET_PLLC                   ( PLLCON = PLLCON | 0x2    ) 
#define         CLEAR_PLLC                 ( PLLCON = PLLCON & ~(0x2) ) 

#define         SET_PLLE                   ( PLLCON = PLLCON | 0x1    ) 
#define         CLEAR_PLLE                 ( PLLCON = PLLCON & ~(0x1) ) 

#define         PLLC                       ( ((unsigned)((0x1<<25) & PLLSTAT)) >> 25 )
#define         PLLE                       ( ((unsigned)((0x1<<24) & PLLSTAT)) >> 24 )

/* Fcco = 480Mhz, M=60, N=3, Fin = 12Mhz */
#define         FCCO_FOUR_EIGHTY_MHZ       (PLLCFG = (0x0 << 16) | 19)
#define         FCCO_TWO_EIGHTY_EIGHT_MHZ  (PLLCFG = (0x0 << 16) | 11)

#define         PLOCK                      (((unsigned) ((0x1<<26) & PLLSTAT)) >> 26)

/*
 * oscillator
 */
#define         OSCEN                      (((unsigned) ((0x1<<5) & SCS)) >> 5)
#define         OSCSTAT                    (((unsigned) ((0x1<<6) & SCS)) >> 6)

#define         mainOSC_ENABLE             ( SCS |= (0x1<<5) )
#define         mainOSC_READY              ( OSCSTAT )
#define         mainOSC_SELECT             ( CLKSRCSEL = 0x1 )

#define         CCLK_IS_FCCODIV1           ( CCLKCFG = 0x0   )
#define         CCLK_IS_FCCODIV4           ( CCLKCFG = 0x3   )
#define         CCLK_IS_FCCODIV8           ( CCLKCFG = 0x7  )
#define         CCLK_IS_FCCODIV10          ( CCLKCFG = 0x9  )
#define         CCLK_IS_FCCODIV40          ( CCLKCFG = 0x39 )

#define         USB_IS_FCCODIV6            ( USBCLKCFG = 5 )
#define         USB_IS_FCCODIV10           ( USBCLKCFG = 9 )

#endif
