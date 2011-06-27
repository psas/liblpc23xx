
/*
 * lpc23xx-util.c
 */

#include <stdint.h>
#include <string.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"

/*
 * microsecondsToCPUTicks
 */
uint32_t microsecondsToCPUTicks(const uint32_t microseconds) {
    uint32_t ret = ( pllquery_cclk_mhz() / 1000000) * microseconds;
    return(ret);
}

/*
 * millisecondsToCPUTicks
 */
uint32_t millisecondsToCPUTicks(const uint32_t milliseconds) {
    uint32_t ret = (pllquery_cclk_mhz() / 1000) * milliseconds;
    return(ret);
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
 * debug_msg
 */
void debug_msg(char* msg) {
    uart0_putstring(msg) ;
    uart0_putstring("\n");
}

/*
 * debug_val
 */
void debug_val(char* msg, int32_t val, uint32_t base) {
    uart0_putstring(msg) ;
    uart0_putstring(util_itoa(val,base));
    uart0_putstring("\n");
}

/*
 * putstring_lpc
 * put a string to a uart port
 */
void putstring_lpc(uartport p, const char *s) {
    switch(p){ 
        case UART0:
            uart0_putstring(s);
            break;
//        case UART1:
//            uart1_putstring(s);
//            break;
//        case UART2:
//            uart2_putstring(s);
//            break;
//        case UART3:
//            uart3_putstring(s);
//            break;
        default:
            break;
    }
}
/*
 * put a character to a uart port
 */
void putchar_lpc(uartport p,  char c) {
    switch(p){ 
        case UART0:
            uart0_putchar(c);
            break;
//        case UART1:
//            uart1_putchar(c);
//            break;
//        case UART2:
//            uart2_putchar(c);
//            break;
//        case UART3:
//            uart3_putchar(c);
//            break;
        default:
            break;
    }
} 

/*
 * util_waitTicks
 * -----------------------
 * Spin in a loop for ticks ..
 */
void util_waitticks(uint32_t ticks) {
    uint32_t j;

    for(j=ticks; j>0; --j);
}

