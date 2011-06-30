
/*
 * lpc23xx-vic.c
 */

#include <stdint.h>

#include "lpc23xx.h"

#include "lpc23xx-util.h"
#include "lpc23xx-vic.h"


/* 
 * vic_disableIRQ
 * The IRQ bit in the CPSR must be cleared for IRQ ints 
 *
 * This function returns the value of cpsr prior to clear 
 */
uint32_t vic_disableIRQ(void) {
    uint32_t _cpsr;

    _cpsr = __get_cpsr();
    __set_cpsr(_cpsr | (1<<IRQ_BIT));
    return _cpsr;
}

/*
 * vic_enableIRQ
 */
uint32_t vic_enableIRQ(void) {
    uint32_t _cpsr;

    _cpsr = __get_cpsr();
    __set_cpsr(_cpsr & IRQ_MASK);
    return _cpsr;
}

/*
 * vic_disableFIQ
 */
uint32_t vic_disableFIQ(void) {
    uint32_t _cpsr;

    _cpsr = __get_cpsr();
    __set_cpsr(_cpsr | (1<<FIQ_BIT));
    return _cpsr;
}

/*
 * vic_enableFIQ
 */
uint32_t vic_enableFIQ(void) {
    uint32_t _cpsr;

    _cpsr = __get_cpsr();
    __set_cpsr(_cpsr & FIQ_MASK);
    return _cpsr;
}


