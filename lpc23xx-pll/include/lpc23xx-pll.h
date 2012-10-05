
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

//Section 4-7.4, Peripheral clocking control
//PCLKSEL0
#define PCLK_WDT        0
#define PCLK_TIMER0     2
#define PCLK_TIMER1     4
#define PCLK_UART0      6
#define PCLK_UART1      8
//11:10 - Unused, always read as 0. 00
#define PCLK_PWM1       12
#define PCLK_I2C0       14
#define PCLK_SPI        16
#define PCLK_RTC        18
#define PCLK_SSP1       20
#define PCLK_DAC        22
#define PCLK_ADC        24
#define PCLK_CAN1       26
#define PCLK_CAN2       28
#define PCLK_ACF        30

//PCLKSEL1
#define PCLK_BAT_RAM    0
#define PCLK_GPIO       2
#define PCLK_PCB        4
#define PCLK_I2C1       6
//9:8 - Unused, always read as 0. 00
#define PCLK_SSP0       10
#define PCLK_TIMER2     12
#define PCLK_TIMER3     14
#define PCLK_UART2      16
#define PCLK_UART3      18
#define PCLK_I2C2       20
#define PCLK_I2S        22
#define PCLK_MCI        24
//27:26 - Unused, always read as 0. 00
#define PCLK_SYSCON     28
//31:30 - Unused, always read as 0. 00

//field is a bit pair in the register, indexed by the lower bit
#define SET_PCLKSEL0_FIELD(value, field) \
    (PCLKSEL0 = (PCLKSEL0 & ~(0x3<<(field))) | (((value) & 0x3)<<(field)))
#define SET_PCLKSEL1_FIELD(value, field) \
    (PCLKSEL1 = (PCLKSEL1 & ~(0x3<<(field))) | (((value) & 0x3)<<(field)))

#define WDT_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_WDT)
#define WDT_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_WDT)
#define WDT_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_WDT)
#define WDT_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_WDT)

#define TIMER0_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_TIMER0)
#define TIMER0_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_TIMER0)
#define TIMER0_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_TIMER0)
#define TIMER0_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_TIMER0)

#define TIMER1_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_TIMER1)
#define TIMER1_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_TIMER1)
#define TIMER1_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_TIMER1)
#define TIMER1_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_TIMER1)

#define UART0_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_UART0)
#define UART0_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_UART0)
#define UART0_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_UART0)
#define UART0_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_UART0)

#define UART1_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_UART1)
#define UART1_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_UART1)
#define UART1_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_UART1)
#define UART1_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_UART1)

#define PWM1_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_PWM1)
#define PWM1_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_PWM1)
#define PWM1_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_PWM1)
#define PWM1_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_PWM1)

#define I2C0_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_I2C0)
#define I2C0_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_I2C0)
#define I2C0_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_I2C0)
#define I2C0_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_I2C0)

#define SPI_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_SPI)
#define SPI_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_SPI)
#define SPI_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_SPI)
#define SPI_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_SPI)

//For PCLK_RTC only, the value ’01’ is illegal. Do not write ’01’ to the
//PCLK_RTC. Attempting to write ’01’ results in the previous value being
//unchanged.

#define RTC_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_RTC)
#define RTC_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_RTC)
#define RTC_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_RTC)

#define SSP1_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_SSP1)
#define SSP1_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_SSP1)
#define SSP1_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_SSP1)
#define SSP1_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_SSP1)

#define DAC_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_DAC)
#define DAC_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_DAC)
#define DAC_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_DAC)
#define DAC_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_DAC)

#define ADC_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_ADC)
#define ADC_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_ADC)
#define ADC_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_ADC)
#define ADC_CLK_IS_CCLK_DIV8 SET_PCLKSEL0_FIELD(0x3, PCLK_ADC)

//Peripheral’s clock is selected to PCLK_xyz = CCLK/8 except for CAN1, CAN2,
//and CAN filtering (ACF) when ’11’ selects PCLK_xyz = CCLK/6.

#define CAN1_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_CAN1)
#define CAN1_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_CAN1)
#define CAN1_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_CAN1)
#define CAN1_CLK_IS_CCLK_DIV6 SET_PCLKSEL0_FIELD(0x3, PCLK_CAN1)

#define CAN2_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_CAN2)
#define CAN2_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_CAN2)
#define CAN2_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_CAN2)
#define CAN2_CLK_IS_CCLK_DIV6 SET_PCLKSEL0_FIELD(0x3, PCLK_CAN2)

#define ACF_CLK_IS_CCLK_DIV1 SET_PCLKSEL0_FIELD(0x1, PCLK_ACF)
#define ACF_CLK_IS_CCLK_DIV2 SET_PCLKSEL0_FIELD(0x2, PCLK_ACF)
#define ACF_CLK_IS_CCLK_DIV4 SET_PCLKSEL0_FIELD(0x0, PCLK_ACF)
#define ACF_CLK_IS_CCLK_DIV6 SET_PCLKSEL0_FIELD(0x3, PCLK_ACF)

#define BAT_RAM_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_BAT_RAM)
#define BAT_RAM_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_BAT_RAM)
#define BAT_RAM_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_BAT_RAM)
#define BAT_RAM_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_BAT_RAM)

#define GPIO_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_GPIO)
#define GPIO_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_GPIO)
#define GPIO_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_GPIO)
#define GPIO_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_GPIO)

#define PCB_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_PCB)
#define PCB_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_PCB)
#define PCB_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_PCB)
#define PCB_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_PCB)

#define I2C1_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_I2C1)
#define I2C1_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_I2C1)
#define I2C1_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_I2C1)
#define I2C1_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_I2C1)

#define SSP0_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_SSP0)
#define SSP0_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_SSP0)
#define SSP0_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_SSP0)
#define SSP0_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_SSP0)

#define TIMER2_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_TIMER2)
#define TIMER2_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_TIMER2)
#define TIMER2_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_TIMER2)
#define TIMER2_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_TIMER2)

#define TIMER3_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_TIMER3)
#define TIMER3_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_TIMER3)
#define TIMER3_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_TIMER3)
#define TIMER3_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_TIMER3)

#define UART2_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_UART2)
#define UART2_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_UART2)
#define UART2_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_UART2)
#define UART2_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_UART2)

#define UART3_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_UART3)
#define UART3_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_UART3)
#define UART3_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_UART3)
#define UART3_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_UART3)

#define I2C2_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_I2C2)
#define I2C2_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_I2C2)
#define I2C2_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_I2C2)
#define I2C2_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_I2C2)

#define I2S_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_I2S)
#define I2S_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_I2S)
#define I2S_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_I2S)
#define I2S_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_I2S)

#define MCI_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_MCI)
#define MCI_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_MCI)
#define MCI_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_MCI)
#define MCI_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_MCI)

#define SYSCON_CLK_IS_CCLK_DIV1 SET_PCLKSEL1_FIELD(0x1, PCLK_SYSCON)
#define SYSCON_CLK_IS_CCLK_DIV2 SET_PCLKSEL1_FIELD(0x2, PCLK_SYSCON)
#define SYSCON_CLK_IS_CCLK_DIV4 SET_PCLKSEL1_FIELD(0x0, PCLK_SYSCON)
#define SYSCON_CLK_IS_CCLK_DIV8 SET_PCLKSEL1_FIELD(0x3, PCLK_SYSCON)



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

typedef enum {CCLK_DIV1=1, CCLK_DIV2=2, CCLK_DIV4=0, CCLK_DIV6=3, CCLK_DIV8=3} pclk_scale;

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
