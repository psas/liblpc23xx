
/*
 * lpc23xx-mutex.h
 */


#ifndef _LPC23XX_UTIL_H
#define _LPC23XX_MUTEX_H

#include <stdint.h>

void     init_mutex(uint32_t *mutex_addr);

uint32_t get_mutex(uint32_t *mutex_addr, uint32_t wait_count);

#endif


