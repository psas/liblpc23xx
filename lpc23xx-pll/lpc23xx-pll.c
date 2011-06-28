
/*
 * lpc23xx-pll.c
 */

#include <stdint.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"

struct pll_status pllstat;

/*
 * pllquery_fcco_mhz
 */
Freq    pllquery_fcco_mhz(void) {
    return(pllstat.fcco_mhz);
}

/*
 * pllquery_cclk_mhz
 */
Freq    pllquery_cclk_mhz(void) {
    return(pllstat.cclk_mhz);
}

/*
 * pllfeed
 * ----------------------
 * Turns off interrupts, feeds pll, then
 *  restores interrupt functions.
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

/*
 * pllstop
 */
void pllstop(void) {

    uint32_t status;

    status          = PLLSTAT;

    if(PLLC != 0) {
        CLEAR_PLLC; 
        pllfeed();
        CLEAR_PLLE; 
        pllfeed();
    }
}

/*
 * pllstart_seventytwomhz
 * lpc23xx rev03 p60
 * Fcco = 288Mhz, M=12, N=1, Fin = 12Mhz 
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

    SET_PLLC;
    pllfeed();
    pllstat.cclk_mhz = SEVENTY_TWO_MHZ;
    pllstat.fcco_mhz = TWO_EIGHTY_EIGHT_MHZ;
}


/*
 * pllstart_sixtymhz
 * lpc23xx rev03 p60
 * Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz 
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

    SET_PLLC;
    pllfeed();
    pllstat.cclk_mhz = SIXTY_MHZ;
    pllstat.fcco_mhz = FOUR_EIGHTY_MHZ;

}

/*
 * pllstart_fourtyeightmhz
 * lpc23xx rev03 p60
 * Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz
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

    SET_PLLC;
    pllfeed();
    pllstat.cclk_mhz = FOURTY_EIGHT_MHZ;
    pllstat.fcco_mhz = FOUR_EIGHTY_MHZ;
}


