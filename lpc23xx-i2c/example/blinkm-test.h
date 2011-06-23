
/*
 * blinkm-test.h
 */


#ifndef _BLINKM_TEST_H
#define _BLINKM_TEST_H

#include "lpc23xx-i2c.h"

/* blinkm i2c address */
#define BLINKM_ADDR                   0x09
//#define EEPROM_ADDR                   0x50  // 0b0101_000
#define BLINKM_POLL_WAITTICKS         500000

extern i2c_master_xact_t       xact_s;

void xact_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s) ;

#endif

