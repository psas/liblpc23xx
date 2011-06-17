
/*
 * lpc23xx-util.c
 */

#include <stdint.h>
#include <string.h>

#include "lpc23xx.h"

#include "lpc23xx-util.h"

/*
 * __get_cpsr
 * ---------------------------------------
 * Reads and returns the value of the cpsr
 */
static inline uint32_t __get_cpsr(void) {
    uint32_t retval;
    asm volatile (" mrs  %0, cpsr" : "=r" (retval) : /* no inputs */  );
    return retval;
}

/*
 * __set_cpsr
 * ---------------------------------------
 * Set the value of the cpsr
 */
static inline void __set_cpsr(uint32_t val) {
    asm volatile (" msr  cpsr, %0" : /* no outputs */ : "r" (val)  );
}

/*
 * util_itoa
 * convert a signed int to a string...
 */
char* util_itoa(int32_t val, uint32_t base) {

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

/*
 * util_uitoa
 * convert an unsigned int to a string...
 */
char* util_uitoa(uint32_t val, uint32_t base) {

    static char ibuf[MAX_I2ASTRING];

    int         i = MAX_I2ASTRING-2;

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
 * util_waitTicks
 * -----------------------
 * Spin in a loop for ticks ..
 */
void util_waitCount(uint32_t ticks) {
    uint32_t j;

    for(j=ticks; j>0; --j);
}

