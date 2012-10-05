
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
#include <lpc23xx.h>

//Section 4-7.4, Peripheral clocking control
#define PCLK_REG_0              0
#define PCLK_REG_1              0x80
#define PCLK_REGISTER_MASK      0x80
#define PCLK_PERIPHERIAL_MASK   ~(PCLK_REGISTER_MASK)

typedef enum {
    //PCLKSEL0
    PCLK_WDT      = 0  + PCLK_REG_0,
    PCLK_TIMER0   = 2  + PCLK_REG_0,
    PCLK_TIMER1   = 4  + PCLK_REG_0,
    PCLK_UART0    = 6  + PCLK_REG_0,
    PCLK_UART1    = 8  + PCLK_REG_0,
    //11:10 - Unused
    PCLK_PWM1     = 12 + PCLK_REG_0,
    PCLK_I2C0     = 14 + PCLK_REG_0,
    PCLK_SPI      = 16 + PCLK_REG_0,
    PCLK_RTC      = 18 + PCLK_REG_0,
    PCLK_SSP1     = 20 + PCLK_REG_0,
    PCLK_DAC      = 22 + PCLK_REG_0,
    PCLK_ADC      = 24 + PCLK_REG_0,
    PCLK_CAN1     = 26 + PCLK_REG_0,
    PCLK_CAN2     = 28 + PCLK_REG_0,
    PCLK_ACF      = 30 + PCLK_REG_0,

    //PCLKSEL1
    PCLK_BAT_RAM  = 0  + PCLK_REG_1,
    PCLK_GPIO     = 2  + PCLK_REG_1,
    PCLK_PCB      = 4  + PCLK_REG_1,
    PCLK_I2C1     = 6  + PCLK_REG_1,
    //9:8 - Unused
    PCLK_SSP0     = 10 + PCLK_REG_1,
    PCLK_TIMER2   = 12 + PCLK_REG_1,
    PCLK_TIMER3   = 14 + PCLK_REG_1,
    PCLK_UART2    = 16 + PCLK_REG_1,
    PCLK_UART3    = 18 + PCLK_REG_1,
    PCLK_I2C2     = 20 + PCLK_REG_1,
    PCLK_I2S      = 22 + PCLK_REG_1,
    PCLK_MCI      = 24 + PCLK_REG_1,
    //27:26 - Unused
    PCLK_SYSCON   = 28 + PCLK_REG_1,
    //31:30 - Unused
} pclk_peripheral;

typedef enum {CCLK_DIV1=1, CCLK_DIV2=2, CCLK_DIV4=0, CCLK_DIV6=3, CCLK_DIV8=3} pclk_scale;

//field is a bit pair in the register, indexed by the lower bit
#define SET_PCLKSEL0_FIELD(field, value) \
    (PCLKSEL0 = (PCLKSEL0 & ~(0x3<<(field))) | (((value) & 0x3)<<(field)))
#define SET_PCLKSEL1_FIELD(field, value) \
    (PCLKSEL1 = (PCLKSEL1 & ~(0x3<<(field))) | (((value) & 0x3)<<(field)))

/*
 *For PCLK_RTC only, the value CCLK_DIV1 is illegal. Do not write
 *CCLK_DIV1 to the PCLK_RTC. Attempting to write CCLK_DIV1
 *results in the previous value being unchanged.
 *
 *In the case of PCLK_CAN1, PCLK_CAN2, or PCLK_ACF CCLK_DIV8 can not be set,
 *use CCLK_DIV6 instead. Attempting to set them to CCLK_DIV8 will result in
 *CCLK_DIV6 being set. CCLK_DIV_6 is only valid for PCLK_CAN1, PCLK_CAN2, and
 *PCLK_ACF, attempting to set another peripheral with it will result in
 *CCLK_DIV8
 */
//todo: error check?
void inline SET_PCLK(pclk_peripheral peripheral, pclk_scale scale){
    if((peripheral & PCLK_REGISTER_MASK) == PCLK_REG_1){
        SET_PCLKSEL1_FIELD(peripheral, scale);
    }else{
        SET_PCLKSEL0_FIELD(peripheral, scale);
    }
}

//PLL

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
int             pllstart(Freq cclk_mhz);
#endif
