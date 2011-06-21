
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

#define MAX_I2ASTRING 34

int main (void) {

    bin_semaphore binsem       = 42;
    uint32_t      wait_count   = 1000;

    uint32_t      getlock_bool = 0;
    uint32_t      lock_bool    = 0;

    uint32_t      all_passed   = 1;

    pllstart_seventytwomhz() ;

    uart0_init_115200() ;

    uart0_putstring("\n**********************************\n");
    uart0_putstring(  "***Starting binsem test: uart0.***\n");
    uart0_putstring(  "**********************************\n");

    init_binsem(&binsem);

    if(binsem!=1) {
        uart0_putstring("\n***ERROR: init_bitsem. Wrong value. ***\n");
        all_passed = 0;
    } else {
        uart0_putstring("***PASS: init_bitsem.***\n");
    }

    uart0_putstring("\n\n***Testing is_binsem_locked when unlocked.***\n");
    lock_bool = is_binsem_locked(&binsem);

    if(lock_bool==1) {
        uart0_putstring("***ERROR: is_binsem_locked: Semaphore should not be locked! ***\n");
        all_passed = 0;
    } else {
        uart0_putstring("***PASS: is_binsem_locked. Not locked after init. ***\n");
    }

    uart0_putstring("\n\n***Testing aquire when unlocked.***\n");
    getlock_bool = get_binsem(&binsem, wait_count);
    if(getlock_bool==0) {
        uart0_putstring("***ERROR: get_binsem: Did not aquire lock. ***\n");
        all_passed = 0;
    } else {
        uart0_putstring("***PASS: get_binsem after initialize.***\n");
    }

    uart0_putstring("\n\n***Testing aquire when locked.***\n");
    getlock_bool = get_binsem(&binsem, wait_count);
    if(getlock_bool==0) {
        uart0_putstring("***PASS: get_binsem when locked. Timeout.***\n");
    } else {
        uart0_putstring("***ERROR: get_binsem: aquired lock when locked.\n");
        all_passed = 0;
    }

    uart0_putstring("\n\n***Testing is_binsem_locked when locked.***\n");
    lock_bool = is_binsem_locked(&binsem);
    if(lock_bool==1) {
        uart0_putstring("***PASS: is_binsem_locked: locked. ***\n");
    } else {
        uart0_putstring("***ERROR: is_binsem_locked: returned unlocked when locked***\n");
        all_passed = 0;
    }

    uart0_putstring("\n\n***Testing release when locked.***\n");
    getlock_bool = release_binsem(&binsem);
    if(getlock_bool==1 && binsem==1) {
        uart0_putstring("***PASS: release_binsem return value when locked.***\n");
    } else {
        uart0_putstring("***ERROR: release_binsem: wrong return value when locked.\n");
        all_passed = 0;
        if(binsem==0) {
            uart0_putstring("***ERROR: release_binsem: wrong value in binsem.\n");
            all_passed = 0;
        } 
        uart0_putchar('\n');
    }

    uart0_putstring("\n\n***Testing release when unlocked.***\n");
    getlock_bool = release_binsem(&binsem);
    if(getlock_bool==1) {
        uart0_putstring("***ERROR: release_binsem when unlocked.***\n");
        all_passed = 0;
    } else {
        uart0_putstring("***PASS: release_binsem: return value correct when unlocked.\n");
        if(binsem==0) {
            uart0_putstring("***ERROR: release_binsem: wrong value in binsem.\n");
        }
    }

    uart0_putstring("\n\n***Testing aquire when unlocked.***\n");
    getlock_bool = get_binsem(&binsem, wait_count);
    if(getlock_bool==0) {
        uart0_putstring("***ERROR: get_binsem: Did not aquire lock. ***\n");
        all_passed = 0;
    } else {
        uart0_putstring("***PASS: get_binsem after initialize.***\n");
    }

    uart0_putstring("\n\n***Testing zero count wait for lock.***\n");
    getlock_bool = get_binsem(&binsem,0x0);
    if(getlock_bool==0) {
        uart0_putstring("***PASS: get_binsem: zero wait when unlocked.***\n");
        if(binsem==1) {
            uart0_putstring("***ERROR: get_binsem: wrong value in binsem.\n");
            all_passed = 0;
        }
    } else {
        uart0_putstring("***ERROR: get_binsem: zero wait when unlocked failed.\n");
        all_passed = 0;
    }

    uart0_putstring("\n\n***Testing release when locked.***\n");
    getlock_bool = release_binsem(&binsem);
    if(getlock_bool==1) {
        uart0_putstring("***PASS: release_binsem when locked.***\n");
    } else {
        uart0_putstring("***ERROR: release_binsem: return value not correct when locked.\n");
        all_passed = 0;
        if(binsem==0) {
            uart0_putstring("***ERROR: release_binsem: wrong value in binsem.\n");
            all_passed = 0;
        }
    }

    if(all_passed == 1) {
        uart0_putstring("\n*****************************\n");
        uart0_putstring(  "***PASS: all tests passed.***\n");
        uart0_putstring(  "*****************************\n");
    } else {
        uart0_putstring("\n*********************************\n");
        uart0_putstring(  "***FAIL: not all tests passed.***\n");
        uart0_putstring(  "*********************************\n");
    }

    uart0_putstring("\n\n***************************\n");
    uart0_putstring(     "*** End of binsem test ***\n");
    uart0_putstring(     "**************************\n\n");

    return(0);

}

/*
  
**********************************
***Starting binsem test: uart0.***
**********************************
***PASS: init_bitsem.***


***Testing is_binsem_locked when unlocked.***
***PASS: is_binsem_locked. Not locked after init. ***


***Testing aquire when unlocked.***
***PASS: get_binsem after initialize.***


***Testing aquire when locked.***
***PASS: get_binsem when locked. Timeout.***


***Testing is_binsem_locked when locked.***
***PASS: is_binsem_locked: locked. ***


***Testing release when locked.***
***PASS: release_binsem return value when locked.***


***Testing release when unlocked.***
***PASS: release_binsem: return value correct when unlocked.


***Testing aquire when unlocked.***
***PASS: get_binsem after initialize.***


***Testing zero count wait for lock.***
***PASS: get_binsem: zero wait when unlocked.***


***Testing release when locked.***
***PASS: release_binsem when locked.***

*****************************
***PASS: all tests passed.***
*****************************


***************************
*** End of binsem test ***
**************************

*/
