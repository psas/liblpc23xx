
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
char* itoa(int32_t val, uint32_t base) {

    static char ibuf[MAX_I2ASTRING];

    int         i     = MAX_I2ASTRING-2;
    int         minus = 0;

    memset(ibuf,'\0',MAX_I2ASTRING);

    if(val < 0) {
        val   = -val;
        minus = 1;
    }

    if(val == 0) {
        ibuf[0] = '0';
        return &ibuf[0];
    } else {
        for(; val && i ; --i, val /= base) {
            ibuf[i] = "0123456789abcdef"[val % base];
        }

        if(minus == 1 && base == 10) {
            ibuf[i] = '-';
            return &ibuf[i];
        } else {
            return &ibuf[i+1];
        }
    }
}

int main (void) {

    uint32_t binsem      = 10;
    uint32_t wait_count  = 10;

    uint32_t getlock_bool = 0;
    uint32_t lock_bool    = 0;

    // init_binsem(binsem);

    pllstart_seventytwomhz() ;

    uart0_init_115200() ;

    uart0_putstring("\n***Starting binsem test: uart0.***\n\n");

    uart0_putstring("\n***Before init binsem is: ");
    uart0_putstring(itoa(binsem,10));
    uart0_putchar('\n');
 
    init_binsem(&binsem);

    uart0_putstring("\n***After init binsem is: ");
    uart0_putstring(itoa(binsem,10));
    uart0_putchar('\n');

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
