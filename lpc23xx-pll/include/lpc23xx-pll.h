
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

#define         CCLK_IS_FCCODIV1           ( CCLKCFG   = 0  )
#define         CCLK_IS_FCCODIV4           ( CCLKCFG   = 3  )
#define         CCLK_IS_FCCODIV8           ( CCLKCFG   = 7  )
#define         CCLK_IS_FCCODIV10          ( CCLKCFG   = 9  )
#define         CCLK_IS_FCCODIV40          ( CCLKCFG   = 39 )

#define         USB_IS_FCCODIV6            ( USBCLKCFG = 5  )
#define         USB_IS_FCCODIV10           ( USBCLKCFG = 9  )

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
