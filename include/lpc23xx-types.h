
/*
 * lpc23xx-types.h
 */

#ifndef _LPC23XX_TYPES_H
#define _LPC23XX_TYPES_H

#include <stdint.h>

typedef enum {FALSE=0, TRUE} BOOL;

#undef NULL
    #if defined(__cplusplus)
        #define NULL 0
    #else
        #define NULL ((void *)0)
    #endif
#endif

