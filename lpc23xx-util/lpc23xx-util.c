
/*
 * lpc23xx-util.c
 */

#include <stdint.h>
#include <string.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-vic.h"
#include "printf-lpc.h"

#include "lpc23xx-util.h"

/*
 * util_getbitval
 */
inline uint32_t util_getbitval(uint32_t val, uint32_t bitnumber) {
    return ( (val & (1<<bitnumber)) >> bitnumber );
}

/*
 * cpsr_stat
 */
void util_cpsrstat(uint32_t cpsrval) {
    uint32_t     irq;
    uint32_t     fiq;
    uint32_t     mode;
    uint32_t     v_overflow;
    uint32_t     z_zero;
    uint32_t     c_carry;
    uint32_t     n_negative;
    uint32_t     t_thumbmode;

    irq         = util_getbitval(cpsrval,IRQ_BIT);
    fiq         = util_getbitval(cpsrval,FIQ_BIT);

    mode        = (cpsrval & 0x1F);
    v_overflow  = util_getbitval(cpsrval,VOVERFLOW_BIT);
    c_carry     = util_getbitval(cpsrval,CCARRY_BIT);
    z_zero      = util_getbitval(cpsrval,ZZERO_BIT);
    n_negative  = util_getbitval(cpsrval,NNEGLT_BIT);
    t_thumbmode = util_getbitval(cpsrval,T_BIT);

    printf_lpc(UART0,"\n*** cpsr decode start ***\n");

    printf_lpc(UART0,"Decoding cpsr: 0b%b\n",cpsrval);

    printf_lpc(UART0,"v_overflow:\t\t%d.\n", v_overflow);
    printf_lpc(UART0,"c_carry:\t\t%d.\n",    c_carry);
    printf_lpc(UART0,"z_zero:\t\t\t%d.\n",     z_zero);
    printf_lpc(UART0,"n_negative:\t\t%d.\n", n_negative);
    printf_lpc(UART0,"t_thumbmode:\t\t%d.\n", t_thumbmode);

    if(irq == 1) {
        printf_lpc(UART0,"IRQ:\t\t\t%d (disabled).\n", irq);
    } else {
        printf_lpc(UART0,"IRQ:\t\t\t%d (enabled).\n", irq);
    }
    if(fiq == 1) {
        printf_lpc(UART0,"FIQ:\t\t\t%d (disabled).\n", fiq);
    } else {
        printf_lpc(UART0,"FIQ:\t\t\t%d (enabled).\n", fiq);
    }
    printf_lpc(UART0,"Mode:\n");
    switch(mode) {
        case 0x13:
            printf_lpc(UART0,"  Supervisor Mode:\t0x%x\n", mode);
            break;
        case 0x17:
            printf_lpc(UART0,"  Abort Mode:\t0x%x\n", mode);
            break;
        case 0x1b:
            printf_lpc(UART0,"  Undefined Mode:\t0x%x\n", mode);
            break;
        case 0x1f:
            printf_lpc(UART0,"  System Mode:\t0x%x\n", mode);
            break;
        default:
            printf_lpc(UART0,"  Unknown Mode:\t0x%x\n", mode);
            break;
    }
    printf_lpc(UART0,"\n*** cpsr decode end ***\n");

}


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

