
/*
 * olimexlpcp2378reva.h
 */

#ifndef _OLIMEXLPCP2378REVA_H
#define _OLIMEXLPCP2378REVA_H

#include "lpc23xx.h"

typedef enum Freqtype { 
    TWELVE_MHZ       = 12000000, 
    FIFTEEN_MHZ      = 15000000, 
    FOURTY_EIGHT_MHZ = 48000000, 
    SIXTY_MHZ        = 60000000 
} Freq;

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
 * uart pins and register masks
 */
#define         P0_TXD0_RXD0_MASK         ~(0xF0)
#define         P0_RXD0_TXD0_ENABLE       0x50

#define         P0_RXD2_TXD2_MASK         ~(0xF00000)
#define         P0_RXD2_TXD2_ENABLE       0x500000

#define         P0_RXD3_TXD3_MASK         ~(0xF)
#define         P0_RXD3_TXD3_ENABLE       0xA

/*
 * pll
 */
#define         SET_PLLC                   ( PLLCON = PLLCON | 0x2    ) 
#define         CLEAR_PLLC                 ( PLLCON = PLLCON & ~(0x2) ) 

#define         SET_PLLE                   ( PLLCON = PLLCON | 0x1    ) 
#define         CLEAR_PLLE                 ( PLLCON = PLLCON & ~(0x1) ) 

#define         PLLC                       ( ((unsigned)((0x1<<25) & PLLSTAT)) >> 25 )
#define         PLLE                       ( ((unsigned)((0x1<<24) & PLLSTAT)) >> 24 )

/* Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz */
#define         FCCO_FOUR_EIGHTY_MHZ       (PLLCFG = (0x1 << 16) | 20)

#define         PLOCK                      (((unsigned) ((0x1<<26) & PLLSTAT)) >> 26)

/*
 * oscillator
 */
#define         OSCEN                      (((unsigned) ((0x1<<5) & SCS)) >> 5)
#define         OSCSTAT                    (((unsigned) ((0x1<<6) & SCS)) >> 6)

#define         mainOSC_ENABLE             ( SCS |= (0x1<<5) )
#define         mainOSC_READY              ( OSCSTAT )
#define         mainOSC_SELECT             ( CLKSRCSEL = 0x1 )

#define         CCLK_IS_FCCODIV1           ( CCLKCFG = 0x0)
#define         CCLK_IS_FCCODIV8           ( CCLKCFG = 0x7)
#define         CCLK_IS_FCCODIV10          ( CCLKCFG = 0x9)
#define         CCLK_IS_FCCODIV40          ( CCLKCFG = 0x39)

#define         USB_IS_FCCODIV10           ( USBCLKCFG = 9)

#endif
