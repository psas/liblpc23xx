
/*
 * lpc23xx-types.h
 */

#ifndef _LPC23XX_TYPES_H
#define _LPC23XX_TYPES_H

#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>

typedef _Bool               BOOL;

#undef NULL
    #if defined(__cplusplus)
        #define NULL 0
    #else
        #define NULL ((void *)0)
    #endif
#endif


