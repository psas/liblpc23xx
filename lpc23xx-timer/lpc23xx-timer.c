
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
 * lpc23xx-timer.c
 */

#include <stdint.h>

#include "lpc23xx.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-pll.h"
#include "lpc23xx-power.h"
#include "lpc23xx-uart.h"
#include "printf-lpc.h"

#include "lpc23xx-timer.h"

/*
 * timer_init
 */
void timer_init(timer_channel channel, uint32_t prescale, pclk_scale scale) {

    switch(channel) {
        case TIMER_0: 
            POWER_TIM0_ON;
            RESET_TIMER0;
            START_TIMER0;
            T0PC = prescale;
            switch(scale) {
                case CCLK_DIV1:
                    TIMER0_CLK_IS_CCLK_DIV1;
                    break;
                case CCLK_DIV2:
                    TIMER0_CLK_IS_CCLK_DIV2;
                    break;
                case CCLK_DIV4:
                    TIMER0_CLK_IS_CCLK_DIV4;
                    break;
                case CCLK_DIV8:
                    TIMER0_CLK_IS_CCLK_DIV8;
                    break;
                default:
                    break;
            }
            break;
        case TIMER_1: 
            POWER_TIM1_ON;
            RESET_TIMER1;
            START_TIMER1;
            T1PC = prescale;
            switch(scale) {
                case CCLK_DIV1:
                    TIMER1_CLK_IS_CCLK_DIV1;
                    break;
                case CCLK_DIV2:
                    TIMER1_CLK_IS_CCLK_DIV2;
                    break;
                case CCLK_DIV4:
                    TIMER1_CLK_IS_CCLK_DIV4;
                    break;
                case CCLK_DIV8:
                    TIMER1_CLK_IS_CCLK_DIV8;
                    break;
                default:
                    break;
            }
            break;
        case TIMER_2: 
            POWER_TIM2_ON;
            RESET_TIMER2;
            START_TIMER2;
            T2PC = prescale;
            switch(scale) {
                case CCLK_DIV1:
                    TIMER2_CLK_IS_CCLK_DIV1;
                    break;
                case CCLK_DIV2:
                    TIMER2_CLK_IS_CCLK_DIV2;
                    break;
                case CCLK_DIV4:
                    TIMER2_CLK_IS_CCLK_DIV4;
                    break;
                case CCLK_DIV8:
                    TIMER2_CLK_IS_CCLK_DIV8;
                    break;
                default:
                    break;
            }

            break;
        case TIMER_3: 
            POWER_TIM3_ON;
            RESET_TIMER3;
            START_TIMER3;
            T3PC = prescale;
            switch(scale) {
                case CCLK_DIV1:
                    TIMER3_CLK_IS_CCLK_DIV1;
                    break;
                case CCLK_DIV2:
                    TIMER3_CLK_IS_CCLK_DIV2;
                    break;
                case CCLK_DIV4:
                    TIMER3_CLK_IS_CCLK_DIV4;
                    break;
                case CCLK_DIV8:
                    TIMER3_CLK_IS_CCLK_DIV8;
                    break;
                default:
                    break;
            }
            break;
        default: 
            break;
    }
}

/*
 * timer_disable
 */
void timer_disable(timer_channel channel) {

    switch(channel) {
        case TIMER_0: 
            POWER_TIM0_OFF;
            break;
        case TIMER_1: 
            POWER_TIM1_OFF;
            break;
        case TIMER_2: 
            POWER_TIM2_OFF;
            break;
        case TIMER_3: 
            POWER_TIM3_OFF;
            break;
        default: 
            break;
    }
}


