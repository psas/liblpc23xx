
/*
 * lpc23xx-pll-test.c
 * Test for lpc23xx-pll-test
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#ifdef OLIMEXLPCP2378REVA
    #include "olimexlpcp2378reva.h"
#elif LPC2368PSASGFE 
    #include "lpc2368-PSAS-GFE"
#else
    #error ***** No board configuration defined. ******
#endif

#include "lpc23xx-pll-test.h"

int main (void) {

    void pllstart_sixtymhz(void) ;
    return(0);

}

