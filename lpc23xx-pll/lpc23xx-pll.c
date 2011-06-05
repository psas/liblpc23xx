
/*
 * lpc23xx-pll.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "olimexlpcp2378reva.h"

#include "lpc23xx-pll.h"

#ifdef OLIMEXLPCP2378REVA
    #include "olimexlpcp2378reva.h"
#elif LPC2368PSASGFE
    #include "lpc2368-PSAS-GFE"
#else
    #error ***** No board configuration defined. ******
#endif

uint32_t    query_cclk_mhz(void) {
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
    VIC_ENABLE_CLEAR;

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
 * pllstart_sixtymhz
 * lpc23xx rev03 p60
 * Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz 
 */
void pllstart_sixtymhz(void) { 

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
    pllstat.cclk_mhz = 60;
}

/*
 * pllstart_fourtyeightmhz
 * lpc23xx rev03 p60
 * Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz
 */
void pllstart_fourtyeightmhz(void) {

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
    pllstat.cclk_mhz = 40;
}

/*
 * pllstart_twelvemhz
 * lpc23xx rev03 p60
 * Fcco = 480Mhz, M=20, N=1, Fin = 12Mhz
 */
void pllstart_twelvemhz(void) {

    pllstop();

    mainOSC_ENABLE;
    while (!mainOSC_READY);

    mainOSC_SELECT;

    FCCO_FOUR_EIGHTY_MHZ;
    pllfeed();

    SET_PLLE;
    pllfeed();

    CCLK_IS_FCCODIV40;
    USB_IS_FCCODIV10;

    while(!PLOCK);

    SET_PLLC;
    pllfeed();
    pllstat.cclk_mhz = 1;
}
