
/*
 * scp1000-test.h
 */

#ifndef _SCP1000_TEST_H
#define _SCP1000_TEST_H

#define 	GPIO_1_21     	10
#define 	GPIO_1_23     	14

// connect scp1000D01 breakout board power to GPIO so software
// can execute hard reset. There is no other way to hard reset
// the device.
//

// Choose GPIO P1.21 for POWER
// Pinned to EXT2-15 on olimex
#define 	SCP1000_PWR_PINSEL        (PINSEL3  = ((PINSEL3  & ~(0x3 << GPIO_1_21)) | (0x0 << GPIO_1_21)))

#define 	SCP1000_PWR_NOPULL        (PINMODE3 = ((PINMODE3 & ~(0x3 << GPIO_1_21)) | (0x2 << GPIO_1_21)))

#define 	SCP1000_PWR_EN            (FIO1DIR = (1<<21))
#define 	SCP1000_PWR_ON            (FIO1SET = (1<<21))
#define 	SCP1000_PWR_OFF           (FIO1CLR = (1<<21))


// DRDY input
#define 	SCP1000_DRDY_PINSEL       ( PINSEL3  = (PINSEL3   & ~(0x3 << GPIO_1_23) ) )
#define 	SCP1000_DRDY_NOPULL       ( PINMODE3 = ((PINMODE3 & ~(0x3 << GPIO_1_23)) | (0x2 << GPIO_1_23)))

#define 	SCP1000_DRDY_EN           ( FIO1DIR  = (FIO1DIR  & ~(1<<23) ) )
#define     SCP1000_DRDY              ( ( FIO1PIN & (1<<23) ) >> 23 )

// scp1000 registers
typedef enum { REVID      =0x0,
               DATAWR     =0x1 ,
               ADDPTR     =0x2 ,
               OPERATION  =0x3 ,
               OPSTATUS   =0x4 ,
               RSTR       =0x6 ,
               STATUS     =0x7 ,
               DATARD8    =0x1F,
               DATARD16   =0x20,
               TEMPOUT    =0x21 } scp_regaddr;

// scp1000 modes
typedef enum { SCP_HIGH_RES         = 0xA ,
               SCP_HIGH_SPEED       = 0x9 ,
               SCP_ULTRA_LOW_POWER  = 0xB ,
               // SCP1000 series documentation for LOW POWER operation
               // Page 20/37 "Indirect Registers" 'CFG'.
               // www.vti.fi SCA3000_Product_Specification_8257300.13
               SCP_LOW_POWER_17BITS = 0x5 ,  // to CFG register
               SCP_LOW_POWER_15BITS = 0xD ,  // to CFG register
               SCP_LOW_POWER_START  = 0xC    // to OPERATION register
               } scp_mode;

#endif

