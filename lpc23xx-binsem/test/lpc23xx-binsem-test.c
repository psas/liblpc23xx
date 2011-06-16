
/*
 * lpc23xx-binsem-test.c
 */

#include <stdint.h>
#include <string.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"

#include "lpc23xx-binsem.h"

#include "lpc23xx-binsem-test.h"

#define MAX_I2ASTRING 120
/*
 * itoa
 */
char* uitoa(uint32_t val, uint32_t base) {

    static char ibuf[MAX_I2ASTRING];

    int         i     = MAX_I2ASTRING-2;

    memset(ibuf,'\0',MAX_I2ASTRING);

    if(val == 0) {
        ibuf[0] = '0';
        return &ibuf[0];
    } else {
        for(; val && i ; --i, val /= base) {
            ibuf[i] = "0123456789abcdef"[val % base];
        }
        return &ibuf[i+1];
    }
}


/*

***Starting binsem test: uart0.***


***PASS: init_bitsem.***
***PASS: is_binsem_locked. Not locked after init. ***

***PASS: get_binsem after initialize.***


***Testing aquire when locked.***

***PASS: get_binsem when locked. Timeout.***

***End of binsem test: uart0.***

*/


int main (void) {

    uint32_t binsem      = 42;
    uint32_t wait_count  = 5;

    uint32_t getlock_bool = 0;
    uint32_t lock_bool    = 0;

    // init_binsem(binsem);

    pllstart_seventytwomhz() ;

    uart0_init_115200() ;

    uart0_putstring("\n***Starting binsem test: uart0.***\n\n");
 
    init_binsem(&binsem);

    if(binsem!=1) {
        uart0_putstring("\n***ERROR: init_bitsem. Wrong value. ***\n");
    } else {
        uart0_putstring("\n***PASS: init_bitsem.***");
    }

    lock_bool = is_binsem_locked(&binsem);

    if(lock_bool==1) {
        uart0_putstring("\n***ERROR: is_binsem_locked: Semaphore should not be locked! ***\n");
    } else {
        uart0_putstring("\n***PASS: is_binsem_locked. Not locked after init. ***\n");
    }

    getlock_bool = get_binsem(&binsem, wait_count);
    if(getlock_bool==0) {
        uart0_putstring("\n***ERROR: get_binsem: Did not aquire lock. ***\n");
    } else {
        uart0_putstring("\n***PASS: get_binsem after initialize.***\n");
    }

    uart0_putstring("\n\n***Testing aquire when locked.***\n");
    getlock_bool = get_binsem(&binsem, wait_count);
    if(getlock_bool==0) {
        uart0_putstring("\n***PASS: get_binsem when locked. Timeout.***\n");
    } else {
        uart0_putstring("\n***ERROR: get_binsem: aquired lock when locked. getlock_bool: ");
        uart0_putstring(uitoa(getlock_bool,10));
        uart0_putchar('\n');
    }

    uart0_putstring("\n***End of binsem test: uart0.***\n\n");

    return(0);

}
