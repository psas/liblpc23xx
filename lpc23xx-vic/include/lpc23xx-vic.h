/*! \file lpc23xx-vic.h
 */

/*! \ingroup lpc23xx-vic
 *
 * @{
 */


#ifndef _LPC23XX_VIC_H
#define _LPC23XX_VIC_H

#include "lpc23xx.h"

#define EXIT_INTERRUPT  VICAddress=0x0

/*
 *
 * MACRO Name: ISR_ENTRY()
 *
 * Description:
 *    This MACRO is used upon entry to an ISR. 
 *
 *    1 - Adjust address at which execution should resume after servicing
 *        ISR to compensate for IRQ entry
 *    2 - Save the non-banked registers r0-r12 and lr onto the IRQ stack.
 *    3 - Get the status of the interrupted program is in SPSR.
 *    4 - Push it onto the IRQ stack as well.
 *
 */
#define ISR_ENTRY asm volatile(" sub   lr, lr,#4\n"		\
                                 " stmfd sp!,{r0-r12,lr}\n"	\
                                 " mrs   r1, spsr\n"		\
                                 " stmfd sp!,{r1}" )

/*
 *
 * MACRO Name: ISR_EXIT()
 *
 * Description:
 *    This MACRO is used to exit an ISR. The MACRO performs
 *    the following steps:
 *
 *    1 - Recover SPSR value from stack       
 *    2 - restore its value                   
 *    3 - Pop the return address & the saved general registers from
 *        the IRQ stack & return
 *
 */
#define ISR_EXIT asm volatile(" ldmfd sp!,{r1}\n"		\
                                 " msr   spsr_c,r1\n"		\
                                 " ldmfd sp!,{r0-r12,pc}^")


void vic_cpu_disable_interrupts() ;
void vic_cpu_enable_interrupts() ;


uint32_t vic_disableIRQ(void) ;
uint32_t vic_enableIRQ(void) ;

uint32_t vic_disableFIQ(void) ;
uint32_t vic_enableFIQ(void) ;


#endif
//! @}

