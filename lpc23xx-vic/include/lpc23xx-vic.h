
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

/*! \file lpc23xx-vic.h
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
                                 " stmfd sp!,{r1}")

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

uint32_t vic_disableIRQ(void) ;
uint32_t vic_enableIRQ(void) ;

uint32_t vic_disableFIQ(void) ;
uint32_t vic_enableFIQ(void) ;


#endif
