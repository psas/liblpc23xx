
/*
 * lpc23xx-binsem.h
 */


#ifndef _LPC23XX_BINSEM_H
#define _LPC23XX_BINSEM_H

#include <stdint.h>

/*
 * init_binsem
 *  r0 contains address of semaphore, need to initialize
 *  semaphore to non-zero value prior to using.
 */
void     init_binsem(uint32_t* binsem_addr);

/*
 * is_binsem_locked
 * input: r0 contains binsem_addr
 *
 * return: 1 if locked 
 *         0 if not locked 
 */
uint32_t is_binsem_locked(uint32_t* binsem_addr);

/*
 * get_binsem
 * in: binsem_addr is r0
 *      wait_count is r1
 * return: a '1' for successful lock
 *         a '0' if wait for cycles count and not successful
 */ 
uint32_t get_binsem(uint32_t* binsem_addr, uint32_t wait_count);

/*
 * release_binsem
 * input: r0 is binsem_addr
 * returns a '1' for release of locked binary semaphore
 * returns a '0' for release of unlocked binary semaphore
 * in C define prototype: uint32_t release_binsem(uint32_t* binsem_addr);
 */ 
uint32_t release_binsem(uint32_t* binsem);

#endif

