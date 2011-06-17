
/*
 * lpc23xx-util.h
 */


#ifndef _LPC23XX_UTIL_H
#define _LPC23XX_UTIL_H

#define         MAX_I2ASTRING           33

static inline uint32_t __get_cpsr(void) ;
static inline void     __set_cpsr(uint32_t val) ;

char*                  util_itoa(int32_t val, uint32_t base) ;
char*                  util_uitoa(uint32_t val, uint32_t base) ;

void                   util_waitTicks(uint32_t ticks) ;


#endif
