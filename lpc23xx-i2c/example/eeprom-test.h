
/*
 * eeprom-test.h
 */


#ifndef _EEPROM_TEST_H
#define _EEPROM_TEST_H

#include "lpc23xx-i2c.h"

/* blinkm i2c address */
#define EEPROM_ADDR                   0x50  // 0b0101_000
#define EEPROM_POLL_WAITTICKS         500000

extern i2c_master_xact_t       xact_s;

void xact_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s) ;

#endif

