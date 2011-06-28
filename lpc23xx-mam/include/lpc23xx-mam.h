
/*
 * lpc23xx-mam.h
 */

#ifndef _LPC23XX_MAM_H
#define _LPC23XX_MAM_H

#include <stdint.h>

void mam_disable() ;

void mam_enable_custom(uint8_t mamcr, uint8_t mamtim) ;

void mam_enable() ;

#endif
