
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


/*
 * lpc23xx-util.h
 */

#ifndef _LPC23XX_UTIL_H
#define _LPC23XX_UTIL_H

#include "lpc23xx.h"
#include "lpc23xx-uart.h"
#include "ringbuffer.h"


#define RED_LED_PIN          19
#define BLUE_LED_PIN         22
#define GREEN_LED_PIN        25

#define RED_LED_UNMASK       ( FIO1MASK = FIO1MASK & (~(1<<RED_LED_PIN)))
#define RED_LED_MASK         ( FIO1MASK = FIO1MASK | (1<<RED_LED_PIN))

#define RED_LED_ENABLE       ( FIO1DIR |= (1 << RED_LED_PIN) )
#define RED_LED_DISABLE      ( FIO1DIR = FIO1DIR & (~(1<<RED_LED_PIN)) )

#define BLUE_LED_UNMASK      ( FIO1MASK = FIO1MASK & (~(1<<BLUE_LED_PIN)))
#define BLUE_LED_MASK        ( FIO1MASK = FIO1MASK | (1<<BLUE_LED_PIN))

#define BLUE_LED_ENABLE      ( FIO1DIR |= (1 << BLUE_LED_PIN) )
#define BLUE_LED_DISABLE     ( FIO1DIR = FIO1DIR & (~(1<<BLUE_LED_PIN)) )

#define GREEN_LED_UNMASK     ( FIO1MASK = FIO1MASK & (~(1<<GREEN_LED_PIN)))
#define GREEN_LED_MASK       ( FIO1MASK = FIO1MASK | (1<<GREEN_LED_PIN))

#define GREEN_LED_ENABLE     ( FIO1DIR |= (1 << GREEN_LED_PIN) )
#define GREEN_LED_DISABLE    ( FIO1DIR = FIO1DIR & (~(1<<GREEN_LED_PIN)) )

#define RED_LED_ON           ( FIO1SET = (1 << RED_LED_PIN) )
#define RED_LED_OFF          ( FIO1CLR = (1 << RED_LED_PIN) )

#define BLUE_LED_ON          ( FIO1SET = (1 << BLUE_LED_PIN) )
#define BLUE_LED_OFF         ( FIO1CLR = (1 << BLUE_LED_PIN) )

#define GREEN_LED_ON         ( FIO1SET = (1 << GREEN_LED_PIN) )
#define GREEN_LED_OFF        ( FIO1CLR = (1 << GREEN_LED_PIN) )

typedef enum {FLASH_SLOW=0, FLASH_NORMAL, FLASH_FAST} flashspeed_type;
typedef enum {RED_LED=0, BLUE_LED, GREEN_LED}         ledcolor_type;

void init_color_led() ;
void all_led_off() ;
void cycle_led() ;
void color_led_flash(uint32_t cycles, ledcolor_type led, flashspeed_type speed ) ;
void led_toggle(ledcolor_type led);


// Use typeof to avoid side effects from MAX(i++,j++) type of call.
//  (only evaluate each variable once.)

#define MAX(a,b) \
    ({ typeof (a) _a = (a); \
       typeof (b) _b = (b); \
       _a > _b ? _a : _b; })

#define MIN(a,b) \
    ({ typeof (a) _a = (a); \
       typeof (b) _b = (b); \
       _a < _b ? _a : _b; })

#define         MAX_I2ASTRING           33
#define         CPSR_SUPERVISOR_MODE    0x13

#define         T_BIT                   5
#define         FIQ_BIT                 6
#define         IRQ_BIT                 7

#define         VOVERFLOW_BIT           28
#define         CCARRY_BIT              29
#define         ZZERO_BIT               30
#define         NNEGLT_BIT              31

#define         IRQ_MASK                ~(1<<IRQ_BIT)
#define         FIQ_MASK                ~(1<<FIQ_BIT)
#define         T_MASK                  ~(1<<T_BIT)

#define         FIO_ENABLE              ( SCS |= 1 )

enum {BIN=2, OCT=8, DEC=10, HEX=16} ;


/**
 * __get_cpsr
 * ---------------------------------------
 * Reads and returns the value of the cpsr
 *
   \sa <a href="http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.faqs/ka3724.html> ARM FAQ </a>
 */
static inline uint32_t __get_cpsr(void) {
    uint32_t retval;
    asm volatile (" mrs  %0, cpsr" : "=r" (retval) : /* no inputs */  );
    return retval;
}

/**
 * __set_cpsr
 * ---------------------------------------
 * Set the value of the cpsr
 * This will force the processor into, then out of system (privileged) mode.
 *  Resulting processor mode is decided by caller by setting mode bits in val.
 * Don't change the 'T' bit.
 *  "Never use an MSR instruction to force a change to the state of the T bit in the CPSR. If
 *  you do this, the processor enters an unpredictable state."
 *
 * This is a very dangerous function, use at your own risk.
 * Reference: ARM7TDMI-S Technical Reference Manual, p54 "The Control Bits"
 */
static inline void __set_cpsr(uint32_t val) {
    uint32_t current_cpsr ;
    uint32_t save_Tbit;
   
    current_cpsr = __get_cpsr();

    save_Tbit    = (current_cpsr & (1<<T_BIT));
    val          = (val & T_MASK) | save_Tbit;

    // try to let previous instructions finish
    asm volatile ("nop" : /* no outputs */ : /* no inputs */  );
    asm volatile ("nop" : /* no outputs */ : /* no inputs */  );
    asm volatile ("nop" : /* no outputs */ : /* no inputs */  );

    asm volatile (" msr  cpsr, %0" : /* no outputs */ : "r" (val)  );

    asm volatile ("nop" : /* no outputs */ : /* no inputs */  );
    asm volatile ("nop" : /* no outputs */ : /* no inputs */  );
    asm volatile ("nop" : /* no outputs */ : /* no inputs */  );


}

void            rb_print_buffer(Ringbuffer* rb) ;
void            rb_print_state(Ringbuffer* rb);

inline uint32_t util_getbitval(uint32_t val, uint32_t bitnumber) ;
void            util_cpsrstat(uint32_t cpsrval);

uint32_t        microsecondsToCPUTicks(const uint32_t microseconds) ;
uint32_t        millisecondsToCPUTicks(const uint32_t milliseconds) ;

char*           util_itoa(int32_t val, uint32_t base) ;
char*           util_uitoa(uint32_t val, uint32_t base) ;

void            debug_msg(char* msg) ;
void            debug_val(char* msg, int32_t val, uint32_t base) ;

bool            putstring_lpc(uartport p, const char *s) ;
bool            putchar_lpc(uartport p,  char c) ;

void            util_waitticks(uint32_t ticks) ;

void            util_wait_msecs(uint32_t msecs) ;
void            util_wait_usecs(uint32_t usecs) ;

#endif
