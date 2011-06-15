
/*
 * lpc23xx-mutex-test.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"

#include "lpc23xx-mutex.h"

#include "lpc23xx-mutex-test.h"

int main (void) {

    uint32_t mutex      = 1;
    uint32_t wait_count = 10;

    uint32_t ret;

    // init_mutex(mutex);

    pllstart_seventytwomhz() ;

    uart0_init_115200() ;

    uart0_putstring("\n***Starting MUTEX test: uart0.***\n\n");

    uart0_putstring("\n***Test not yet implemented\n");

    init_mutex(&mutex );
    ret = get_mutex(&mutex, wait_count);

    uart0_putstring("\n***End of MUTEX test: uart0.***\n\n");
    return(0);

}
