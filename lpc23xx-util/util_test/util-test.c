
/*
 * util-test.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"
#include "lpc23xx-timer.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"

#include "util-test.h"

int main (void) {


    pllstart_seventytwomhz() ;
    //pllstart_sixtymhz() ;
    //pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;
    //uart0_init_9600() ;

    uart0_putstring("\n***Starting UTIL timing test.***\n\n");

    util_wait_msecs(200) ;  // how many ticks in 200 msecs?

    return(0);

}

