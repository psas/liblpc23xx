
/*
 * timer-test.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "lpc23xx-timer.h"
#include "printf-lpc.h"

#include "timer-test.h"

int main (void) {
    uint32_t ticks;
    uint32_t start=0;
    uint32_t stop=0;
    uint32_t difftime=0;
    uint32_t msecs=0;
    uint32_t usecs=0;

    int32_t error=0;

    //pllstart_seventytwomhz() ;
    // pllstart_sixtymhz() ;
    pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;
    //uart0_init_9600() ;

    uart0_putstring("\n***Starting timer test.***\n\n");

    printf_lpc(UART0,"Timer 0 test\n");

    timer_init(TIMER_0,  (uint32_t) 0x0 , CCLK_DIV1);

    RESET_TIMER0;
    START_TIMER0;

    usecs = 200;
    ticks = microsecondsToCPUTicks(usecs);

    //    printf_lpc(UART0,"--> ticks in %u usecs are %u\n",usecs, ticks);

    start    = T0TC;
    util_wait_usecs(usecs) ;
    stop     = T0TC;
    difftime = stop - start;
    error    = difftime - ticks;
    if(difftime == 0) {
        printf_lpc(UART0,"TIMER_0 read fail.\n");
        printf_lpc(UART0, "start/stop/difftime is: %d %d %d.\n", start,stop, difftime);
        printf_lpc(UART0, "error is: %d ticks.\n", error);

    } else {
        printf_lpc(UART0, "TIMER_0 read PASS.\n");
    }

    timer_disable(TIMER_0);
    start = T0TC;
    util_wait_msecs(10) ;
    stop = T0TC;
    difftime = stop - start;
    error    = difftime ;
    if(error != 0) {
        printf_lpc(UART0,"TIMER_0 not disabled?\n");
        printf_lpc(UART0, "error is: %d ticks.\n\n", error);
    } else {
        printf_lpc(UART0,"TIMER_0 disable test PASS\n\n");
    }


    printf_lpc(UART0,"Timer 1 test\n");

    timer_init(TIMER_1,  (uint32_t) 0x0 , CCLK_DIV1);

    RESET_TIMER1;
    START_TIMER1;

    usecs = 200;
    ticks = microsecondsToCPUTicks(usecs);

    //    printf_lpc(UART0,"--> ticks in %u usecs are %u\n",usecs, ticks);

    start = T1TC;
    util_wait_usecs(usecs) ;
    stop  = T1TC;
    difftime = stop - start;
    error    = difftime - ticks;
    if(difftime == 0) {
        printf_lpc(UART0,"TIMER_1 read fail.\n");
        printf_lpc(UART0, "start/stop/difftime is: %d %d %d.\n", start,stop, difftime);
        printf_lpc(UART0, "error is: %d ticks.\n", error);

    } else {
        printf_lpc(UART0, "TIMER_1 read PASS.\n");
    }



    timer_disable(TIMER_1);
    start = T1TC;
    util_wait_msecs(10) ;
    stop = T1TC;
    difftime = stop - start;
    error    = difftime ;
    if(error != 0) {
        printf_lpc(UART0,"TIMER_1 not disabled?\n");
        printf_lpc(UART0, "error is: %d ticks.\n\n", error);
    } else {
        printf_lpc(UART0,"TIMER_1 disable test PASS\n\n");
    }


    printf_lpc(UART0,"Timer 2 test\n");

    timer_init(TIMER_2,  (uint32_t) 0x0 , CCLK_DIV1);
    RESET_TIMER2;
    START_TIMER2;

    msecs = 200;
    ticks = millisecondsToCPUTicks(msecs);

    //    printf_lpc(UART0,"--> ticks in %u msecs are %u\n",msecs, ticks);

    start = T2TC;
    util_wait_msecs(msecs) ;
    stop  = T2TC;
    difftime = stop - start;
    error    = difftime - ticks;
    if(difftime == 0) {
        printf_lpc(UART0,"TIMER_2 read fail.\n");
        printf_lpc(UART0, "start/stop/difftime is: %d %d %d.\n", start,stop, difftime);
        printf_lpc(UART0, "error is: %d ticks.\n", error);

    } else {
        printf_lpc(UART0, "TIMER_2 read PASS.\n");
    }



    timer_disable(TIMER_2);
    start = T2TC;
    util_wait_msecs(10) ;
    stop = T2TC;
    difftime = stop - start;
    error    = difftime ;
    if(error != 0) {
        printf_lpc(UART0,"TIMER_2 not disabled?\n");
        printf_lpc(UART0, "error is: %d ticks.\n\n", error);
    } else {
        printf_lpc(UART0,"TIMER_2 disable test PASS\n\n");
    }



    printf_lpc(UART0,"Timer 3 test\n");

    timer_init(TIMER_3,  (uint32_t) 0x0 , CCLK_DIV1);

    RESET_TIMER3;
    START_TIMER3;

    usecs = 200;
    ticks = microsecondsToCPUTicks(usecs);

    //    printf_lpc(UART0,"--> ticks in %u usecs are %u\n",msecs, ticks);

    start = T3TC;
    util_wait_usecs(usecs) ;
    stop  = T3TC;
    difftime = stop - start;
    error    = difftime - ticks;
    if(difftime == 0) {
        printf_lpc(UART0,"TIMER_3 read fail.\n");
        printf_lpc(UART0, "start/stop/difftime is: %d %d %d.\n", start,stop, difftime);
        printf_lpc(UART0, "error is: %d ticks.\n", error);

    } else {
        printf_lpc(UART0, "TIMER_2 read PASS.\n");
    }


    timer_disable(TIMER_3);
    start = T3TC;
    util_wait_msecs(10) ;
    stop = T3TC;
    difftime = stop - start;
    error    = difftime ;
    if(error != 0) {
        printf_lpc(UART0,"TIMER_3 not disabled?\n");
        printf_lpc(UART0, "error is: %d ticks.\n", error);
    } else {
        printf_lpc(UART0,"TIMER_3 disable test PASS\n");
    }


    printf_lpc(UART0, "done\n");


    return(0);

}

