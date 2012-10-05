
/* Copyright (C) 2011 Keith Wilson.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */


/*
 * lpc23xx-i2c.h
 */

#ifndef _LPC23XX_I2C_H
#define _LPC23XX_I2C_H

#include <stdint.h>

#include "lpc23xx-binsem.h"

// MAX values 
#define I2C_MAX_BUFFER      64




// I2C CONSET and CONCLR Bits
// SET
#define I2C_AA              (1<<2)
#define I2C_SI              (1<<3)
#define I2C_STO             (1<<4)
#define I2C_STA             (1<<5)
#define I2C_I2EN            (1<<6)
        
// CLEAR
#define I2C_AAC             (1<<2)
#define I2C_SIC             (1<<3)
#define I2C_STAC            (1<<5)
#define I2C_I2ENC           (1<<6)
                           
// I2C clock
// Table 435 p496 lpc23xx
//
// ( i2c clock speed ref: lpc23xx user manual p516)
// i2c standard clock speed goes to 100kHz


// p516: Max rate is 400kHz according to lpc23xx manual.
//#define I2SCLHIGH           90
//#define I2SCLLOW            90
#define I2SCLHIGH           300
#define I2SCLLOW            300

// Pinsel0 has builtin pullup. //should this be I2C0?
// Pinsel1&2 do not. 
#define I2C1_SDA1_PULLUP    (PINMODE0 = (PINMODE0 & ~(3<<0))) // P0.0
#define I2C1_SCL1_PULLUP    (PINMODE0 = (PINMODE0 & ~(3<<2))) // P0.1

#define I2C1_SDA1_ALT_PULLUP    (PINMODE1 = (PINMODE1 & ~(3<<6))) // P0.19
#define I2C1_SCL1_ALT_PULLUP    (PINMODE1 = (PINMODE1 & ~(3<<8))) // P0.20

#define I2C2_SDA2_PULLUP    (PINMODE0 = (PINMODE0 & ~(3<<20))) // P0.10
#define I2C2_SCL2_PULLUP    (PINMODE0 = (PINMODE0 & ~(3<<22))) // P0.11



#define SDA2_SEL           (0x2<<20)
#define SDA2MASK           ~(0x3<<20)

#define SCL2_SEL           0x2<<22
#define SCL2MASK           ~(0x3<<22)

#define SDA1_SEL           (0x3<<0)
#define SDA1MASK           ~(0x3<<0)

#define SCL1_SEL           0x3<<2
#define SCL1MASK           ~(0x3<<2)

#define SDA1_SEL_ALT       (0x3<<6)
#define SDA1MASK_ALT	   ~(0x3<<6)

#define SCL1_SEL_ALT       0x3<<8
#define SCL1MASK_ALT       ~(0x3<<8)

#define SDA0_SEL            0x1<<22
#define SDA0MASK           ~(0x3<<22)

#define SCL0_SEL            0x1<<24
#define SCL0MASK           ~(0x3<<24)

#define I2C0_ENABLE_SDA0_PIN   (PINSEL1 = ((PINSEL1 & SDA0MASK) | SDA0_SEL))
#define I2C0_ENABLE_SCL0_PIN   (PINSEL1 = ((PINSEL1 & SCL0MASK) | SCL0_SEL))

#define I2C1_ENABLE_SDA1_PIN   (PINSEL0 = ((PINSEL0 & SDA1MASK) | SDA1_SEL))
#define I2C1_ENABLE_SCL1_PIN   (PINSEL0 = ((PINSEL0 & SCL1MASK) | SCL1_SEL))

#define I2C1_ENABLE_SDA1_ALT_PIN   (PINSEL1 = ((PINSEL1 & SDA1MASK_ALT) | SDA1_SEL_ALT))
#define I2C1_ENABLE_SCL1_ALT_PIN   (PINSEL1 = ((PINSEL1 & SCL1MASK_ALT) | SCL1_SEL_ALT))

#define I2C2_ENABLE_SDA2_PIN   (PINSEL0 = ((PINSEL0 & SDA2MASK) | SDA2_SEL))
#define I2C2_ENABLE_SCL2_PIN   (PINSEL0 = ((PINSEL0 & SCL2MASK) | SCL2_SEL))

#define I2C_BINSEM_WAITTICKS  3000


typedef enum { I2C0=0, I2C1, I2C2} i2c_iface;
//The I2C1 channel has two different pin configurations, I2C1_ALTPIN selects it.
//The rest are dummies, use DEFAULT. See SDA1_SEL_ALT and SCL1_SEL_ALT.
//See p156 and 158 of the lpc23xx user manual.
typedef enum { DEFAULT=0, I2C0_ALTPIN, I2C1_ALTPIN, I2C2_ALTPIN} i2c_pinsel;

typedef enum { 
	//todo: I2C_NOT_INITIALIZED
    I2C_IDLE = 0, 
    I2C_START,
    I2C_RESTART,
    I2C_REPEATED_START,
    I2C_ACK,
    I2C_NOTACK,
    I2C_ERROR
} i2c_state;

typedef struct i2c_master_xact {
     i2c_state state;

     uint8_t   i2c_tx_buffer[I2C_MAX_BUFFER];  // Transmit data for transaction
     uint8_t   i2c_rd_buffer[I2C_MAX_BUFFER];  // Receive  data for transaction
     uint32_t  write_length;
     uint32_t  read_length;
     bool      xact_success;
     void*     cb_data;

} i2c_master_xact_t;

typedef void (XACT_FnCallback) (i2c_master_xact_t* caller, i2c_master_xact_t* i2c);

// Use a binary semaphore for mutual exclusion on the i2c interface.
extern volatile  bin_semaphore         i2c0_binsem_g;
extern volatile  bin_semaphore         i2c1_binsem_g;
extern volatile  bin_semaphore         i2c2_binsem_g;

// One structure for each i2c channel
extern i2c_master_xact_t     i2c0_s_g;
extern i2c_master_xact_t     i2c1_s_g;
extern i2c_master_xact_t     i2c2_s_g;

extern volatile uint32_t     i2c0_wrindex_g;
extern volatile uint32_t     i2c0_rdindex_g;

extern volatile uint32_t     i2c1_wrindex_g;
extern volatile uint32_t     i2c1_rdindex_g;

extern volatile uint32_t     i2c2_wrindex_g;
extern volatile uint32_t     i2c2_rdindex_g;

extern XACT_FnCallback*      _i2c0_FnCallback_g;
extern XACT_FnCallback*      _i2c1_FnCallback_g;
extern XACT_FnCallback*      _i2c2_FnCallback_g;

extern i2c_master_xact_t*    i2c0_s_caller_g;
extern i2c_master_xact_t*    i2c1_s_caller_g;
extern i2c_master_xact_t*    i2c2_s_caller_g;

void i2c0_isr(void) __attribute__ ((interrupt("IRQ")));
void i2c1_isr(void) __attribute__ ((interrupt("IRQ")));
void i2c2_isr(void) __attribute__ ((interrupt("IRQ")));

// // still experimenting. gcc v4.5.2 may do the correct thing now.
// void i2c0_isr(void) __attribute__ ((naked));  // use ISR_ENTRY/ISR_EXIT from lpc23xx-vic.h
// void i2c1_isr(void) __attribute__ ((naked));
// void i2c2_isr(void) __attribute__ ((naked));
// 
// void i2cgeneral_call(i2c_iface channel);

uint8_t i2c_create_read_address(uint8_t addr) ;
uint8_t i2c_create_write_address(uint8_t addr) ;
void    i2c_init_state( i2c_master_xact_t* s) ;
void    i2c_init(i2c_iface channel, i2c_pinsel pin) ;
void    i2c_freq(i2c_iface channel, uint16_t highcount, uint16_t lowcount) ;
void    i2c_kHz(i2c_iface channel, uint32_t freq) ;
void    i2c0_get_read_data(i2c_master_xact_t* s) ;

void    start_i2c0_master_xact(i2c_master_xact_t* s, XACT_FnCallback* xact_fn) ;
void    start_i2c1_master_xact(i2c_master_xact_t* s, XACT_FnCallback* xact_fn) ;
void    start_i2c2_master_xact(i2c_master_xact_t* s, XACT_FnCallback* xact_fn) ;
void    start_i2c_master_xact(i2c_iface i2c_ch, i2c_master_xact_t* s, XACT_FnCallback* xact_fn) ;
/*
void I2C1_master_xact(i2c_master_xact_t&  s) ;
void I2C2_master_xact(i2c_master_xact_t&  s) ;
*/

#endif
