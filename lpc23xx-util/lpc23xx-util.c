
/* Copyright (C) 2011 Keith Wilson.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */


/*! \file lpc23xx-util.c
 */

#include <stdint.h>
#include <string.h>

#include "lpc23xx.h"
#include "lpc23xx-debug.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-vic.h"
#include "lpc23xx-timer.h"

#include "printf-lpc.h"

#include "ringbuffer.h"
#include "lpc23xx-util.h"

/*
 * color_led_flash
 */
void color_led_flash(uint32_t cycles,
		ledcolor_type   led,
		flashspeed_type speed ) {

	int x              = 0;
	int interval       = 100000;

	Freq cclk;
	cclk  =  pllquery_cclk_mhz();

	switch(cclk) {
	case ZERO:
		interval = 100000;
		break;
	case FOURTY_EIGHT_MHZ:
		switch(speed) {
		case FLASH_SLOW:
			interval = 0.1 * 48000000;
			break;
		case FLASH_NORMAL:
			interval = 0.008 * 48000000;
			break;
		case FLASH_FAST:
			interval = 0.0008 * 48000000;
			break;
		default:
			break;
		}
		break;
		case SIXTY_MHZ:
			switch(speed) {
			case FLASH_SLOW:
				interval = 0.01 * 60000000;
				break;
			case FLASH_NORMAL:
				interval = 0.003 * 60000000;
				break;
			case FLASH_FAST:
				interval = 0.0008 * 60000000;
				break;
			default:
				break;
			}
			break;
			case SEVENTY_TWO_MHZ:
				switch(speed) {
				case FLASH_SLOW:
					interval = 0.01 * 72000000;
					break;
				case FLASH_NORMAL:
					interval = 0.003 * 72000000;
					break;
				case FLASH_FAST:
					interval = 0.0005 * 72000000;
					break;
				default:
					break;
				}
				break;
				default:
					interval = 100000;
					break;
	}

	cycles++;
	if(cycles > 0) {
		for(;;) {
			x++;
			if (x == interval) {
				--cycles;
				switch(led) {
				case RED_LED:
					RED_LED_ON;
					break;
				case BLUE_LED:
					BLUE_LED_ON;
					break;
				case GREEN_LED:
					GREEN_LED_ON;
					break;
				default:
					break;
				}
			} else if (x >= (interval * 2)) {
				switch(led) {
				case RED_LED:
					RED_LED_OFF;
					break;
				case BLUE_LED:
					BLUE_LED_OFF;
					break;
				case GREEN_LED:
					GREEN_LED_OFF;
					break;
				default:
					break;
				}
				x = 0;
			}
			if(cycles==0) break;
		}
	}
	switch(led) {
	case RED_LED:
		RED_LED_OFF;
		break;
	case BLUE_LED:
		BLUE_LED_OFF;
		break;
	case GREEN_LED:
		GREEN_LED_OFF;
		break;
	default:
		break;
	}
}



/*! \brief Toggle an LED
 *
 * @param led color
 */
void led_toggle(ledcolor_type led) {
	uint32_t state = 0;
	switch(led) {
	case RED_LED:
		state = FIO1SET & (1 << RED_LED_PIN);
		if(!state) RED_LED_ON;
		else RED_LED_OFF;
		break;
	case BLUE_LED:
		state = FIO1SET & (1 << BLUE_LED_PIN);
		if(!state) BLUE_LED_ON;
		else BLUE_LED_OFF;
		break;
	case GREEN_LED:
		state = FIO1SET & (1 << GREEN_LED_PIN);
		if(!state) GREEN_LED_ON;
		else GREEN_LED_OFF;
		break;
	default:
		break;
	}
}


/*! \brief Print the contents of the ringbuffer
 *
 */
void rb_print_buffer(Ringbuffer* rb) {
	uint8_t i=0;

	DBG(UART0,"Print buffer hp:%d tp:%d\r\n", rb->headidx, rb->tailidx);
	for(i=0; i<MAX_RINGBUFFER_ELEMS; ++i) {
		DBG(UART0,"rbuff[%d]: %c\n\r",i, rb->rbuff[i]);
	}
}

void rb_print_state(Ringbuffer* rb) {

	DBG(UART0,"\n\rStatus:\n\r");
	DBG(UART0,"num entries: %d\n\r", rb->num_entries);

}

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
 *
 * (1e6 ticks/sec) x (1sec/1000msec) = 1e3ticks/msec * Xmsec = (X * 1e3) ticks
 *
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
    uart0_putstring_intr(msg)      ;
    uart0_putstring_intr("\n")     ;
}

/*
 * debug_val
 */
void debug_val(char* msg, int32_t val, uint32_t base) {
    uart0_putstring_intr(msg)                 ;
    uart0_putstring_intr(util_itoa(val,base)) ;
    uart0_putstring_intr("\n")                ;
}

/*
 * putstring_lpc
 * put a string to a uart port
 */
void putstring_lpc(uartport p, const char *s) {
    switch(p){ 
        case UART0:
            uart0_putstring_intr(s);
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
            uart0_putchar_intr(c);
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
    volatile uint32_t j=0;
    volatile uint32_t k=0;

    k=0;
    for(j=ticks; j>0; --j) k++;
}

/*! \brief Attempt to build a consistent delay function
 *
 * @param msecs  number of millisecs to wait
 *
 * \warning This is approximate.
 */
void util_wait_msecs(uint32_t msecs) {

	uint32_t ticks = 0;
	uint32_t scale = 45;

	ticks = millisecondsToCPUTicks(msecs);

	util_waitticks(ticks / scale);
}

/*! \brief Attempt to build a consistent delay function
 *
 * @param usecs  number of usecs to wait
 *
 * \warning This is approximate.
 */
void util_wait_usecs(uint32_t usecs) {

	uint32_t ticks = 0;
	uint32_t scale = 85;

	ticks = microsecondsToCPUTicks(usecs);

	util_waitticks(ticks / scale);

}

