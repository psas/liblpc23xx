
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
 * lpc23xx-pll.c
 */

#include <stdint.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"

struct pll_status pllstat;

/*! \brief Current Controlled Oscillator Frequency Setting
 * pllquery_fcco_mhz
 * \return Current value of cco frequency
 */
Freq    pllquery_fcco_mhz(void) {
    return(pllstat.fcco_mhz);
}

/*! 
 * pllquery_cclk_mhz
 * \brief Main clock Frequency Setting
 * \return Freq value of main clock.
 */
Freq    pllquery_cclk_mhz(void) {
    return(pllstat.cclk_mhz);
}

/*!
 * pllfeed
 * \brief Turns off interrupts, feeds pll, then restores interrupt functions.
 */
void pllfeed(void) {
    uint32_t        savedInterrupts;

    /* disable interrupts */
    savedInterrupts = VICIntEnable;
    VICIntEnClr     = (unsigned) 0xFFFFFFFF;

    PLLFEED         = FEEDBYTE_A;
    PLLFEED         = FEEDBYTE_B;

    /* restore interrupts */
    VICIntEnable    = savedInterrupts;
}

/*!
 * pllstop
 * \brief safely stop pll
 */
void pllstop(void) {

    uint32_t status;

    status          = PLLSTAT;

    if(PLLC != 0) {
        CLEAR_PLLC; 
        pllfeed();
    }
    CLEAR_PLLE;
    pllfeed();

}

/*! 
 * pllstart_seventytwomhz
 * lpc23xx rev03 p60
 * Fcco = 288Mhz, M=12, N=1, Fin = 12Mhz 
 * \brief run cclk at 72Mhz
 */
void pllstart_seventytwomhz(void) { 
    pllstat.cclk_mhz = ZERO;

    pllstop();

    mainOSC_ENABLE;
    while (!mainOSC_READY);

    mainOSC_SELECT;

    FCCO_TWO_EIGHTY_EIGHT_MHZ;
    pllfeed();

    SET_PLLE;
    pllfeed();

    CCLK_IS_FCCODIV4;
    USB_IS_FCCODIV6;

    while(!PLOCK);

    SET_PLLCE;
    pllfeed();
    pllstat.cclk_mhz = SEVENTY_TWO_MHZ;
    pllstat.fcco_mhz = TWO_EIGHTY_EIGHT_MHZ;
}


/*!
 * pllstart_sixtymhz
 * lpc23xx rev03 p60
 * Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz 
 * \brief run cclk at 60Mhz
 */
void pllstart_sixtymhz(void) { 
    pllstat.cclk_mhz = ZERO;

    pllstop();

    mainOSC_ENABLE;
    while (!mainOSC_READY);

    mainOSC_SELECT;

    FCCO_FOUR_EIGHTY_MHZ;
    pllfeed();

    SET_PLLE;
    pllfeed();

    CCLK_IS_FCCODIV8;
    USB_IS_FCCODIV10;

    while(!PLOCK);

    SET_PLLCE;
    pllfeed();
    pllstat.cclk_mhz = SIXTY_MHZ;
    pllstat.fcco_mhz = FOUR_EIGHTY_MHZ;

}

/*!
 * pllstart_fourtyeightmhz
 * lpc23xx rev03 p60
 * Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz
 * \brief run cclk at 48Mhz
 */
void pllstart_fourtyeightmhz(void) {
    pllstat.cclk_mhz = ZERO;

    pllstop();

    mainOSC_ENABLE;
    while (!mainOSC_READY);

    mainOSC_SELECT;

    FCCO_FOUR_EIGHTY_MHZ;
    pllfeed();

    SET_PLLE;
    pllfeed();

    CCLK_IS_FCCODIV10;
    USB_IS_FCCODIV10;

    while(!PLOCK);

    SET_PLLCE;
    pllfeed();
    pllstat.cclk_mhz = FOURTY_EIGHT_MHZ;
    pllstat.fcco_mhz = FOUR_EIGHTY_MHZ;
}


