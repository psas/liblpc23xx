
/*
 * lpc23xx-pll.h
 */

#ifndef _LPC23XX_PLL_H
#define _LPC23XX_PLL_H

#include <stdint.h>

#define         FEEDBYTE_A                 ((unsigned) 0xAA)
#define         FEEDBYTE_B                 ((unsigned) 0x55)

#define         SET_PLLCE                  ( PLLCON = PLLCON | 0x3    )
#define         CLEAR_PLLC                 ( PLLCON = PLLCON & ~(0x2) ) 

#define         SET_PLLE                   ( PLLCON = PLLCON | 0x1    ) 
#define         CLEAR_PLLE                 ( PLLCON = PLLCON & ~(0x1) ) 

#define         PLLC                       ( ((unsigned)((0x1<<25) & PLLSTAT)) >> 25 )
#define         PLLE                       ( ((unsigned)((0x1<<24) & PLLSTAT)) >> 24 )

/* Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz */
#define         FCCO_FOUR_EIGHTY_MHZ       (PLLCFG = (0x0 << 16) | 19)
/* Fcco = 288Mhz, M=12, N=1, Fin = 12Mhz */
#define         FCCO_TWO_EIGHTY_EIGHT_MHZ  (PLLCFG = (0x0 << 16) | 11)

#define         PLOCK                      (((unsigned) ((0x1<<26) & PLLSTAT)) >> 26)

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

typedef enum {CCLK_DIV1=0, CCLK_DIV2, CCLK_DIV4, CCLK_DIV6, CCLK_DIV8} pclk_scale;

typedef enum Freqtype { 
    ZERO                 = (uint32_t) 0,
    FOURTY_EIGHT_MHZ     = (uint32_t) 48000000,
    SIXTY_MHZ            = (uint32_t) 60000000,
    SEVENTY_TWO_MHZ      = (uint32_t) 72000000,
    TWO_EIGHTY_EIGHT_MHZ = (uint32_t) 288000000,
    FOUR_EIGHTY_MHZ      = (uint32_t) 480000000
} Freq;

extern struct pll_status {
    Freq cclk_mhz;
    Freq fcco_mhz;
} pllstat ;

Freq            pllquery_cclk_mhz(void);

Freq            pllquery_fcco_mhz(void);

void            pllfeed(void) ;

void            pllstop(void) ;

void            pllstart_seventytwomhz(void) ;
void            pllstart_sixtymhz(void) ;
void            pllstart_fourtyeightmhz(void) ;

#endif
