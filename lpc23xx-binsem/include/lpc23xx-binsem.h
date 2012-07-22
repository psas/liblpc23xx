/*! \file lpc23xx-binsem.h
 */

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

#ifndef _LPC23XX_BINSEM_H
#define _LPC23XX_BINSEM_H

#include <stdint.h>

/*! \defgroup lpc23xx-binsem Binary Semaphore Implementation
 * @{
 */

/*! \brief Binary semaphore implementation for lpc23xx ARM7
 *
 * Header file notes for lpc23xx-binsem.s
 *
 *  \sa http://en.wikipedia.org/wiki/Application_binary_interface#EABI
 *
 *  EABI says r0-r3 are reserved for calling and return
 *
 *  The EABI standard dictates that the ARM Stack be:
 *  "Full Descending" which means that stores need to decrement beforehand and loads must increment
 *  afterward. You can use the actual addressing types "DB" and "IA" or just "FD" on the assembly instructions.
 */

/*!
 *    FOR ARM:
 *    sp is r13
 *    lr is r14
 *    pc is r15
 */

typedef         volatile uint32_t        bin_semaphore;

/*
 * init_binsem
 *  r0 contains address of semaphore, need to initialize
 *  semaphore to non-zero value prior to using.
 */
void     init_binsem(bin_semaphore* binsem_addr);

/*
 * is_binsem_locked
 * input: r0 contains binsem_addr
 *
 * return: 1 if locked 
 *         0 if not locked 
 */
uint32_t is_binsem_locked(bin_semaphore* binsem_addr);

/*
 * get_binsem
 * in: binsem_addr is r0
 *      wait_count is r1
 * return: a '1' for successful lock
 *         a '0' if wait for cycles count and not successful
 */ 
uint32_t get_binsem(bin_semaphore* binsem_addr, uint32_t wait_count);

/*
 * release_binsem
 * input: r0 is binsem_addr
 * returns a '1' for release of locked binary semaphore
 * returns a '0' for release of unlocked binary semaphore
 * in C define prototype: uint32_t release_binsem(uint32_t* binsem_addr);
 */ 
uint32_t release_binsem(bin_semaphore* binsem);

#endif

//! @}

