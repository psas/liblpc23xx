
/*
 * lpc23xx-binsem-test.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"

#include "lpc23xx-binsem.h"

#include "lpc23xx-binsem-test.h"

int main (void) {

    uint32_t binsem      = 1;
    uint32_t wait_count  = 10;

    uint32_t getlock_bool = 0;
    uint32_t lock_bool    = 0;

    // init_binsem(binsem);

    pllstart_seventytwomhz() ;

    uart0_init_115200() ;

    init_binsem(&binsem);

    uart0_putstring("\n***Starting binsem test: uart0.***\n\n");

    lock_bool = is_binsem_locked(&binsem);

    if(lock_bool) {
        uart0_putstring("\n***ERROR: is_binsem_locked: Semaphore should not be locked! ***");
    }

    getlock_bool = get_binsem(&binsem, wait_count);
    if(!getlock_bool) {
        uart0_putstring("\n***ERROR: get_binsem: Failed! ***");
    }

    uart0_putstring("\n***End of binsem test: uart0.***\n\n");

    return(0);

}
