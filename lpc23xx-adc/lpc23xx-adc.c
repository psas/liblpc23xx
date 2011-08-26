
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
 * lpc23xx-adc.c
 */

#include <stdint.h>

#include "lpc23xx.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"

#include "lpc23xx-adc.h"

/*
 * adc_init_sw
 * input: 8 bit channel. each bit set enables
 *   respective channel
 * this initializes continuous sampling at
 * 11 clocks/sample.
 */
void adc_init_cont(adc_channelmask channels, pclk_scale scale) {
    Freq     cclk;

    uint16_t cdiv=0;

    // adc clock
    switch(scale) {
        case CCLK_DIV1:
            mam_enable();           // At CCLK/1 must use mam for consistent behavior?   
            ADC_CLK_IS_CCLK_DIV1;
            break;
        case CCLK_DIV2:
            ADC_CLK_IS_CCLK_DIV2;
            break;
        case CCLK_DIV4:
            ADC_CLK_IS_CCLK_DIV4;
            break;
        case CCLK_DIV8:
            ADC_CLK_IS_CCLK_DIV8;
            break;
        default:
            while(1);  // not a valid choice, stop.
            break;
    }

    // turn on power
    ADC_PWR_ON;

    // then enable ADC
    ADC_ENABLE;

    // cclk value
    cclk = pllquery_cclk_mhz();

    switch(cclk) {
        case FOURTY_EIGHT_MHZ:
            cdiv = 10; // 11 ~4.36Mhz @ CCLK_DIV1
            break;
        case SIXTY_MHZ:
            cdiv = 13; // 14 ~4.28Mhz @ CCLK_DIV1
            break;
        case SEVENTY_TWO_MHZ:
            cdiv = 16; // 17 ~4.23Mhz @ CCLK_DIV1
            break;
        default:
            while(1);
            break;
    }

    AD0CR = (AD0CR & ~(111 << AD0CR_START));
    AD0CR = (AD0CR | (cdiv << AD0CR_CLKDIV) | (1 << AD0CR_BURST) | channels ); // 11 clocks/channel
#ifdef DEBUG_ADC
    printf_lpc(UART0,"AD0CR is: 0x%x\n", AD0CR);
#endif
}

/*
 * adc_disable
 */
void adc_disable(void) {
    // order matters see page 596 of user manual v3.
    ADC_DISABLE;
    ADC_PWR_OFF;
}

/*
 * adc_read
 * read value from AD0DRx
 */

uint16_t adc_read(adc_channel ch) {
    uint32_t value= 0;

    switch(ch) {
        case ADC0_0:
            do {
                value = AD0DR0;
            } while (AD0DR0_DONE == 0);
            break;
        case ADC0_1:
            do {
                value = AD0DR1;
            } while (AD0DR1_DONE == 0);
            break;
        case ADC0_2:
            do {
                value = AD0DR2;
            } while (AD0DR2_DONE == 0);
            break;
        case ADC0_3:
            do {
                value = AD0DR3;
            } while (AD0DR3_DONE == 0);
            break;
        case ADC0_4:
            do {
                value = AD0DR4;
            } while (AD0DR4_DONE == 0);
            break;
        case ADC0_6:
            do {
                value = AD0DR6;
            } while (AD0DR6_DONE == 0);
            break;
        case ADC0_7:
            do {
                value = AD0DR7;
            } while (AD0DR7_DONE == 0);
            break;
        default:
            break;
    }

#ifdef DEBUG_ADC
    printf_lpc(UART0, "value of ADC0_0 is: 0x%x\n",value);
#endif
    value=(value>>6) & 0x03FF;

    return(value);
}

