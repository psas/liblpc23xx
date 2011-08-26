
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

