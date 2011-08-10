
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
    uint32_t ticks;
    uint32_t start=0;
    uint32_t stop=0;
    uint32_t difftime=0;
    uint32_t msecs=0;
    uint32_t usecs=0;

    int32_t error=0;

    //pllstart_seventytwomhz() ;
    pllstart_sixtymhz() ;
    //pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;
    //uart0_init_9600() ;

    uart0_putstring("\n***Starting UTIL timing test.***\n\n");

    /* get counter value */
    timer_init(TIMER_0,  (uint32_t) 0x0 , CCLK_DIV1);
    RESET_TIMER0;
    START_TIMER0;

    msecs = 200;
    ticks = millisecondsToCPUTicks(msecs);

    printf_lpc(UART0,"--> ticks in %u msecs are %u\n",msecs, ticks);

    start = T0TC;
    util_wait_msecs(msecs) ;
    stop  = T0TC;
    difftime = stop - start;
    error    = difftime - ticks;
    printf_lpc(UART0, "difftime is: %u\n", difftime);
    printf_lpc(UART0, "error is: %d ticks.\n", error);

    RESET_TIMER0;
    START_TIMER0;

    usecs = 200;
    ticks = microsecondsToCPUTicks(usecs);

    printf_lpc(UART0,"--> ticks in %u usecs are %u\n",msecs, ticks);

    start = T0TC;
    util_wait_usecs(usecs) ;
    stop  = T0TC;
    difftime = stop - start;
    error    = difftime - ticks;
    printf_lpc(UART0, "difftime is: %u\n", difftime);
    printf_lpc(UART0, "error is: %d ticks.\n", error);

    printf_lpc(UART0, "done\n");

    return(0);

}

