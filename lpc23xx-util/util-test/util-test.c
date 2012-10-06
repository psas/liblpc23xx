/*! \file util-test.c
*/

#include <stdint.h>
#include <string.h>

#include "lpc23xx.h"
#include "lpc23xx-debug.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-timer.h"
#include "lpc23xx-vic.h"

#include "ringbuffer.h"
#include "printf-lpc.h"

#include "lpc23xx-util.h"

#include "util-test.h"

/*! \brief blink a light, get chars from terminal and echo.
 */
void do_task() {
    volatile uint32_t x               = 0;
    const    uint32_t interval        = 2000000;
    char     ch ;
    int      uart0_numchars_in_rxbuff = 0;
    x = 0;
    for(;;) {
        x++;
        if (x == interval) {

            x = 0;
            // led_toggle(BLUE_LED);
            uart0_numchars_in_rxbuff = rb_numentries(&uart0_rb_rx_g);
            if(uart0_numchars_in_rxbuff > 0) {
                uart0_putstring_intr("Char(s) received: ");
                while (uart0_numchars_in_rxbuff > 0) {
                    ch = uart0_getchar_intr();
                    uart0_putchar_intr(ch);
                    uart0_numchars_in_rxbuff = rb_numentries(&uart0_rb_rx_g);
                }
                uart0_putstring_intr("\r\n");
            } else {
               printf_lpc(UART0,".");
            }
        }
    }
}


/*! \brief A little test of the Ringbuffer
 *
 * \return True if passes.
 */
bool rb_test() {

    static    Ringbuffer        rbst;
    Ringbuffer*                 rb = &rbst;

    bool      pass = true;
    uint8_t   element;
    static    uint8_t   getstr[MAX_RINGBUFFER_ELEMS];
    uint8_t   i;

    uart0_putstring_intr("\n\r----------\n\rStart test\n\r");


    if(!rb_initialize(rb)) {
        uart0_putstring_intr("Failed to init rb\n\r");
        pass = false;
    }

    rb_print_state(rb);

    uart0_putstring_intr("Insert a line\r\n");
    if(!rb_insert_string("Hello line\r\r\n", rb)) {
        uart0_putstring_intr("Failed to insert line: Hello Line\r\n");
        pass = false;
    }

    rb_print_state(rb);

    rb_get_line(getstr, rb);

    uart0_putstring_intr("Got a line:\t-->");
    uart0_putstring_intr((const char *) getstr);
    uart0_putstring_intr("<--\r\n");

    rb_print_state(rb);

    if(!rb_initialize(rb)) {
        uart0_putstring_intr("Failed to re-init (2) rb\n\r");
        pass = false;
    }

    uart0_putstring_intr("Insert 'a'\r\n");
    if(!rb_put_elem('a',rb)) {
        uart0_putstring_intr("Failed to insert uint8 'a'\n\r");
        pass=false;
    }

    if(rb->num_entries != 1) {
        uart0_putstring_intr("ERROR: Number of entries should be 1\r\n");
        pass = false;
    }

    uart0_putstring_intr("Get uint8 'a'\r\n");
    if(!rb_get_elem(&element, rb)) {
        uart0_putstring_intr("Failed to get uint8 'a'\n\r");
        pass = false;
    } else if (element  != 'a') {
        uart0_putstring_intr("wrong get uint8 'a'\n\r");
        pass = false;
    } else {}


    if(rb->num_entries != 0) {
        uart0_putstring_intr("ERROR: Number of entries should be 0\r\n");
        pass = false;
    }

    rb_print_state(rb);

    uart0_putstring_intr("Get a uint8 from empty rb...\r\n");

    if(rb_get_elem(&element,rb)) {
        uart0_putstring_intr("***FAIL! Got a uint8 from empty rb\r\n");
        pass = false;
    } else {
        uart0_putstring_intr("***PASS get from empty rb.\r\n");
    }

    if(rb->num_entries != 0) {
        uart0_putstring_intr("ERROR: Number of entries should be 0\r\n");
        pass = false;
    }

    uart0_putstring_intr("Insert uint8 b\t");
    if(!rb_put_elem('b',rb)) {
        uart0_putstring_intr("Failed to insert uint8");
        pass = false;
    }

    if(rb->num_entries != 1) {
        uart0_putstring_intr("ERROR: Number of entries should be 1\r\n");
        pass = false;
    }

    rb_print_state(rb);

    uart0_putstring_intr("Insert string\r\n");
    if(!rb_insert_string("1234\n\r\n\r\t-->Ring-buffer!<--\r\n ",rb)) {
        uart0_putstring_intr("Failed to insert string");
        pass = false;
        rb_print_state(rb);
        if(!rb_is_full(rb)) uart0_putstring_intr("FAIL: Should report full\r\n");
    }

    rb_print_state(rb);

    if(!rb_get_elem(&element,rb)) {
        uart0_putstring_intr("Failed to get uint8");
        pass = false;
    } else {
        uart0_putstring_intr("Got a uint8: ");
        uart0_putchar_intr(element);
        uart0_putstring_intr("\r\n");
    }

    if(!rb_put_elem('c',rb)) {
        uart0_putstring_intr("Failed to insert uint8 ");
        uart0_putchar_intr('c');
        pass = false;
    }

    rb_get_string(getstr, rb);

    uart0_putstring_intr("got string");

    if(!rb_is_empty(rb))
    {
        uart0_putstring_intr("FAIL: Should report empty\n\r");
        pass = false;
    }
    rb_print_state(rb);

    for(i = 0 ; i < 20 ; ++i) {
        rb_insert_string("01234567890123456789",rb);
    }
    rb_print_state(rb);
    if(!rb_get_elem(&element,rb)) {
        uart0_putstring_intr("Failed to get uint8");
        pass = false;
    } else {
        uart0_putstring_intr("Got a uint8: ");
        uart0_putchar_intr((char) element);
        uart0_putstring_intr("\r\n");
    }

    rb_print_state(rb);

    rb_get_string(getstr, rb);
    uart0_putstring_intr("got string\r\n");
    if(strncmp((char*) getstr, "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234",MAX_RINGBUFFER_ELEMS) !=0) {
        uart0_putstring_intr("FAIL: Strings not equal\n\r");
        uart0_putstring_intr((const char *)getstr);
        pass = false;
    }
    rb_print_state(rb);

    (pass) ? uart0_putstring_intr("PASSED RINGBUFFER TESTS\r\n") : uart0_putstring_intr("FAILED RINGBUFFER TESTS\r\n");

    return(pass);
}

int main (void) {
    uint32_t ticks;
    uint32_t start=0;
    uint32_t stop=0;
    uint32_t difftime=0;
    uint32_t msecs=0;
    uint32_t usecs=0;

    int32_t  error=0;

    pllstart_seventytwomhz() ;
    //pllstart_sixtymhz() ;
    //pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;
    //uart0_init_9600() ;

    FIO_ENABLE;

//    RED_LED_UNMASK;
//    BLUE_LED_UNMASK;
//    GREEN_LED_UNMASK;
//
//    RED_LED_ENABLE;
//    GREEN_LED_ENABLE;
//    BLUE_LED_ENABLE;
//
//    RED_LED_OFF;
//    BLUE_LED_OFF;
//    GREEN_LED_OFF;
//
//    color_led_flash(3, BLUE_LED,  FLASH_FAST ) ;
//
//    BLUE_LED_OFF;

    vic_disableIRQ();
    vic_disableFIQ();

    if(!uart0_init_rb()) {
//    	RED_LED_ON;
    	while (1);
    }

    uart_enable_interrupt(UART0);

    vic_enableIRQ();
    vic_enableFIQ();

    uart0_putstring_intr("\r\n***Starting UTIL timing test.***\r\n\r\n");

    /* get counter value */
    timer_init(TIMER_0,  (uint32_t) 0x0 , CCLK_DIV1);
    RESET_TIMER0;
    START_TIMER0;

    msecs = 200;
    ticks = millisecondsToCPUTicks(msecs);

    printf_lpc(UART0,"--> ticks in %u msecs are %u\r\n",msecs, ticks);

    start = T0TC;
    util_wait_msecs(msecs) ;
    stop  = T0TC;
    difftime = stop - start;
    error    = difftime - ticks;
   // printf_lpc(UART0, "error is: %d ticks.\r\n", error);

    RESET_TIMER0;
    START_TIMER0;

    usecs = 200;
    ticks = microsecondsToCPUTicks(usecs);
    printf_lpc(UART0,"--> ticks in %u usecs are %u\r\n",msecs, ticks);

    start = T0TC;
    util_wait_usecs(usecs) ;
    stop  = T0TC;
    difftime = stop - start;
    error    = difftime - ticks;
   // printf_lpc(UART0, "error is: %d ticks.\r\n", error);

    uart0_putstring_intr("\r\n*** Test ringbuffer...\r\n");

    rb_test() ;

    uart0_putstring_intr("\r\n***util-test done, now spin on UART0 test with I/O (please hit some keys!!!) ***\r\n-\r\n");

    do_task();

    return(0);

}

