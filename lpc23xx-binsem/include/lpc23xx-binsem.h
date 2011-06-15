
/*
 * lpc23xx-binsem.h
 */


#ifndef _LPC23XX_BINSEM_H
#define _LPC23XX_BINSEM_H

#include <stdint.h>

void     init_binsem(uint32_t* binsem_addr);

uint32_t is_binsem_locked(uint32_t* binsem_addr);

uint32_t get_binsem(uint32_t* binsem_addr, uint32_t wait_count);

uint32_t release_binsem(uint32_t* binsem);

#endif


