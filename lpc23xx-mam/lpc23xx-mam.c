
/*
 * lpc23xx-mam.c
 */

#include <stdint.h>

#include "lpc23xx-pll.h"

#include "lpc23xx.h"


/*
 * mam_disable
 */
void mam_disable() {
    MAMCR  = 0x0;
    MAMTIM = 0x7;
}

/*
 * mam_enable_custom
 */
void mam_enable_custom(uint8_t mamcr, uint8_t mamtim) {
    MAMCR  = (mamcr  & 0x3);
    MAMTIM = (mamtim & 0x7);
}

/* lpc23xx user manual-v3 p102 */
/*
 * mam_enable
 */
void mam_enable() {

    Freq current_cclk = pllquery_cclk_mhz();

    mam_disable();

    switch(current_cclk) {
        case ZERO:
            mam_disable();
            /* less than 20Mhz 1CCLK */
            // MAMCR  = 0x2;
            // MAMTIM = 0x1;
            break;

            /* 40Mhz to 60Mhz  3CCLK */
        case FOURTY_EIGHT_MHZ:
            MAMCR  = 0x2;
            MAMTIM = 0x3;
            break;

        case SIXTY_MHZ:
            MAMCR  = 0x2;
            MAMTIM = 0x3;
            break;

            /* more than 60Mhz 4CCLK */
        case SEVENTY_TWO_MHZ:
            MAMCR  = 0x2;
            MAMTIM = 0x4;
            break;

        default:
            mam_disable();
            break;
    }
}

