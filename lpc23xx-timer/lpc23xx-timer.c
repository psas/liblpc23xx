
/*
 * lpc23xx-timer.c
 */

#include <stdint.h>

#include "lpc23xx.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"

#include "lpc23xx-timer.h"

/*
 * timer_init
 */
void timer_init(timer_channel channel, uint32_t prescale, pclk_scale scale) {

    switch(channel) {
        case TIMER_0: 
            TIMER_0_PWR_ON;
            RESET_TIMER0;
            START_TIMER0;
            T0PC = prescale;
            switch(scale) {
                case CCLK_DIV1:
                    TIMER_0_CLK_IS_CCLK_DIV1;
                    break;
                case CCLK_DIV2:
                    TIMER_0_CLK_IS_CCLK_DIV2;
                    break;
                case CCLK_DIV4:
                    TIMER_0_CLK_IS_CCLK_DIV4;
                    break;
                case CCLK_DIV8:
                    TIMER_0_CLK_IS_CCLK_DIV8;
                    break;
                default:
                    break;
            }
            break;
        case TIMER_1: 
            TIMER_1_PWR_ON;
            RESET_TIMER1;
            START_TIMER1;
            T1PC = prescale;
            switch(scale) {
                case CCLK_DIV1:
                    TIMER_1_CLK_IS_CCLK_DIV1;
                    break;
                case CCLK_DIV2:
                    TIMER_1_CLK_IS_CCLK_DIV2;
                    break;
                case CCLK_DIV4:
                    TIMER_1_CLK_IS_CCLK_DIV4;
                    break;
                case CCLK_DIV8:
                    TIMER_1_CLK_IS_CCLK_DIV8;
                    break;
                default:
                    break;
            }
            break;
        case TIMER_2: 
            TIMER_2_PWR_ON;
            RESET_TIMER2;
            START_TIMER2;
            T2PC = prescale;
            switch(scale) {
                case CCLK_DIV1:
                    TIMER_2_CLK_IS_CCLK_DIV1;
                    break;
                case CCLK_DIV2:
                    TIMER_2_CLK_IS_CCLK_DIV2;
                    break;
                case CCLK_DIV4:
                    TIMER_2_CLK_IS_CCLK_DIV4;
                    break;
                case CCLK_DIV8:
                    TIMER_2_CLK_IS_CCLK_DIV8;
                    break;
                default:
                    break;
            }

            break;
        case TIMER_3: 
            TIMER_3_PWR_ON;
            RESET_TIMER3;
            START_TIMER3;
            T3PC = prescale;
            switch(scale) {
                case CCLK_DIV1:
                    TIMER_3_CLK_IS_CCLK_DIV1;
                    break;
                case CCLK_DIV2:
                    TIMER_3_CLK_IS_CCLK_DIV2;
                    break;
                case CCLK_DIV4:
                    TIMER_3_CLK_IS_CCLK_DIV4;
                    break;
                case CCLK_DIV8:
                    TIMER_3_CLK_IS_CCLK_DIV8;
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
            TIMER_0_PWR_OFF;
            break;
        case TIMER_1: 
            TIMER_1_PWR_OFF;
            break;
        case TIMER_2: 
            TIMER_2_PWR_OFF;
            break;
        case TIMER_3: 
            TIMER_3_PWR_OFF;
            break;
        default: 
            break;
    }
}


