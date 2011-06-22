
/*
 * lpc23xx-util.h
 */


#ifndef _LPC23XX_UTIL_H
#define _LPC23XX_UTIL_H

#include "lpc23xx.h"

#define         MAX_I2ASTRING           33
#define         CPSR_TBIT               (1<<5)
#define         CPSR_SUPERVISOR_MODE    0b10011

#define         FIQ_BIT                    (1<<6)
#define         IRQ_BIT                    (1<<7)

#define         FIQ_MASK                   ~(FIQ_BIT)
#define         IRQ_MASK                   ~(IRQ_BIT)

/*
 * __get_cpsr
 * ---------------------------------------
 * Reads and returns the value of the cpsr
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.faqs/ka3724.html
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

    save_Tbit    = (current_cpsr & CPSR_TBIT); 
    val          = (val & ~(CPSR_TBIT)) | save_Tbit; 

    asm volatile (" msr  cpsr, %0" : /* no outputs */ : "r" (val)  );
}

uint32_t        microsecondsToCPUTicks(const uint32_t microseconds) ;
uint32_t        millisecondsToCPUTicks(const uint32_t milliseconds) ;

char*           util_itoa(int32_t val, uint32_t base) ;
char*           util_uitoa(uint32_t val, uint32_t base) ;

void            util_waitticks(uint32_t ticks) ;


#endif
