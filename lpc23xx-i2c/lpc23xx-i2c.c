
/*! \file lpc23xx-i2c.c
 */

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

/*! \defgroup lpc23xx-i2c i2c utility for liblpc23xx
 * @{
 */

/* Currently only read, write and write-restart-read transactions are
 * supported, but they are by far the most common cases. Also only master mode
 * is supported.
 * TODO: implement ability to have multiple restarts per transaction of either
 * read or write. This will require a re-think of how transaction data is
 * buffered (ring buffer?).
 * TODO: Slave mode.
 */

#include <stdint.h>
#include <stdlib.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-power.h"
#include "lpc23xx-types.h"
#include "lpc23xx-binsem.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "lpc23xx-vic.h"

#include "lpc23xx-i2c.h"

typedef struct i2c{
    volatile unsigned char * CONSET;
    volatile unsigned char * CONCLR;
    volatile unsigned char * STAT;
    volatile unsigned char * DAT;
    i2c_callback * callback;
    bin_semaphore binsem;
    unsigned int wrindex;
    unsigned int rdindex;
    i2c_master_xact_t internal;
}i2c;

static i2c I2C0_s;
static i2c I2C1_s;
static i2c I2C2_s;
//TODO: WHY DOES THIS NOT WORK? ASDFJAHFSKJF
//static i2c I2C0_s = {
//    //.CONSET = &I2C0CONSET,
//    .CONCLR = &I2C0CONCLR,
//    .STAT = &I2C0STAT,
//    .DAT = &I2C0DAT
//};
//
//static i2c I2C1_s = {
//    .CONSET = 0xE005C000,
//    .CONCLR = &I2C1CONCLR,
//    .STAT = &I2C1STAT,
//    .DAT = &I2C1DAT
//};
//
//static i2c I2C2_s = {
//    //.CONSET = &I2C2CONSET,
//    .CONCLR = &I2C2CONCLR,
//    .STAT = &I2C2STAT,
//    .DAT = &I2C2DAT
//};
/*
 * i2c_create_read_addr
 */
static inline uint8_t i2c_create_read_address(uint8_t addr) {
    return (addr << 1) | 0x1;
}

/*
 * i2c_create_write_addr
 */
static inline uint8_t i2c_create_write_address(uint8_t addr) {
    return addr << 1;
}

/*
 * i2c_init_state
 */
void i2c_init_state( i2c_master_xact_t* s) {
    int i = 0;

    s->state             = I2C_IDLE;
    for(i=0; i<I2C_MAX_BUFFER; i++) {
        s->tx_buffer[i] = 0;
        s->rd_buffer[i] = 0;
    }
    s->write_length          = 0x0;
    s->read_length           = 0x0;
    s->cb_data               = NULL;
}

/*
 * i2c_get_state
 */

i2c_state i2c_get_state(i2c_iface chan){
    switch(chan){
    case I2C0:
        return I2C0_s.internal.state;
    case I2C1:
        return I2C1_s.internal.state;
    case I2C2:
        return I2C2_s.internal.state;
    default:
        return I2C_NOT_INITIALIZED;
    }
}

/*
 * I2Cinit
 *
 * 0. Init xaction structure.
 * 1. Turn on the power to the channel
 * 2. Configure the clock for the channel
 * 3. Set I/O pins to correct mode
 * 4. Configure interrupt in VIC
 */
void i2c_init(i2c_iface channel, i2c_pinsel pin) {
    switch(channel) {
        case I2C0:
            init_binsem(&I2C0_s.binsem);
            I2C0_s.internal.state = I2C_IDLE;
            I2C0_s.CONSET = &I2C0CONSET;
            I2C0_s.CONCLR = &I2C0CONCLR;
            I2C0_s.STAT = &I2C0STAT;
            I2C0_s.DAT = &I2C0DAT;

            POWER_ON(PCI2C0);
            SET_PCLK(PCLK_I2C0, CCLK_DIV1);
            // I2C default speed 100khz
            I2C0SCLL   = I2SCLLOW;
            I2C0SCLH   = I2SCLHIGH;

            I2C0_ENABLE_SDA0_PIN;
            I2C0_ENABLE_SCL0_PIN;
            // pinmode:   I2C0 pins permanent open drain (pullup)
            // reference: lpc23xx usermanual p158 table 107 footnote 2

            // set up VIC p93 table 86 lpc23xx user manual
            VIC_SET_I2C0_HANDLER(i2c0_isr);

            I2C0CONCLR = I2C_AAC | I2C_SIC | I2C_STAC | I2C_I2ENC;
            I2C0CONSET = I2C_I2EN;// master mode
            ENABLE_INT(I2C0);
            break;

        case I2C1:
            init_binsem(&I2C1_s.binsem);
            I2C1_s.internal.state = I2C_IDLE;
            I2C1_s.CONSET = &I2C1CONSET;
            I2C1_s.CONCLR = &I2C1CONCLR;
            I2C1_s.STAT = &I2C1STAT;
            I2C1_s.DAT = &I2C1DAT;

            POWER_ON(PCI2C1);
            SET_PCLK(PCLK_I2C1, CCLK_DIV1);
            // I2C default speed 100khz
            I2C1SCLL   = I2SCLLOW;
            I2C1SCLH   = I2SCLHIGH;
            if(pin == I2C1_ALTPIN){
                I2C1_ENABLE_SDA1_ALT_PIN;
                I2C1_ENABLE_SCL1_ALT_PIN;
                I2C1_SDA1_ALT_PULLUP;
                I2C1_SCL1_ALT_PULLUP;
            }
            else{
                I2C1_ENABLE_SDA1_PIN;
                I2C1_ENABLE_SCL1_PIN;
                I2C1_SDA1_PULLUP;
                I2C1_SCL1_PULLUP;
            }
            // set up VIC p93 table 86 lpc23xx user manual
            VIC_SET_I2C1_HANDLER(i2c1_isr);

            I2C1CONCLR = I2C_AAC | I2C_SIC | I2C_STAC | I2C_I2ENC;
            I2C1CONSET = I2C_I2EN;// master mode
            ENABLE_INT(VIC_I2C1);
            break;

        case I2C2:
            init_binsem(&I2C2_s.binsem);
            I2C2_s.internal.state = I2C_IDLE;
            I2C2_s.CONSET = &I2C2CONSET;
            I2C2_s.CONCLR = &I2C2CONCLR;
            I2C2_s.STAT = &I2C2STAT;
            I2C2_s.DAT = &I2C2DAT;

            POWER_ON(PCI2C2);
            SET_PCLK(PCLK_I2C2, CCLK_DIV1);
            // I2C default speed 100khz
            I2C2SCLL   = I2SCLLOW;
            I2C2SCLH   = I2SCLHIGH;

            I2C2_ENABLE_SDA2_PIN;
            I2C2_ENABLE_SCL2_PIN;
            I2C2_SDA2_PULLUP;
            I2C2_SCL2_PULLUP;

            // set up VIC p93 table 86 lpc23xx user manual
            VIC_SET_I2C2_HANDLER(i2c2_isr);
            I2C2CONCLR = I2C_AAC | I2C_SIC | I2C_STAC | I2C_I2ENC;
            I2C2CONSET = I2C_I2EN;// master mode
            ENABLE_INT(VIC_I2C2);
            break;
        default:
            //  error         ???
            break;
    }
}

/*
 * i2c_freq
 * set the i2c channel to a custom freq and duty cycle
 */
void i2c_freq(i2c_iface channel, uint16_t highcount, uint16_t lowcount) {
    switch(channel) {
        case I2C0:
            I2C0SCLL   = lowcount;
            I2C0SCLH   = highcount;
            break;
        case I2C1:
            I2C1SCLL   = lowcount;
            I2C1SCLH   = highcount;
            break;
        case I2C2:
            I2C2SCLL   = lowcount;
            I2C2SCLH   = highcount;
            break;
        default:
            // error !!
            break;
    }
}

/*
 * i2c_kHz
 * set the i2c channel to a custom freq at an even duty cycle.
 * Frequency in kHz, allowed values are between 1 and 400
 */
void i2c_kHz(i2c_iface channel, unsigned int freq){
	if(freq > 400 || freq < 1){ //p516 of the user manual, max i2c freq is 400kHz.
		return;
	}
	Freq curr_freq = pllquery_cclk_mhz();
	uint32_t divider = 4;
	uint16_t count = 300;

	switch(channel){
	case I2C0:
		divider = (PCLKSEL0 & (0x3 << (PCLK_I2C0 & PCLK_PERIPHERIAL_MASK))) >>
		           (PCLK_I2C0 & PCLK_PERIPHERIAL_MASK);
		break;
	case I2C1:
		divider = (PCLKSEL1 & (0x3 << (PCLK_I2C1 & PCLK_PERIPHERIAL_MASK))) >>
		           (PCLK_I2C1 & PCLK_PERIPHERIAL_MASK);
		break;
	case I2C2:
		divider = (PCLKSEL1 & (0x3 << (PCLK_I2C2 & PCLK_PERIPHERIAL_MASK))) >>
		           (PCLK_I2C2 & PCLK_PERIPHERIAL_MASK);
		break;
	default:
		//nope
		break;
	}

	switch(divider){
	case 1:
		divider = 1;
		break;
	case 2:
		divider = 2;
		break;
	case 0:
		divider = 4;
		break;
	case 3:
		divider = 8;
		break;
	default:
		divider = 4;
		break;
	}

	count = curr_freq/(2*freq*1000*divider);
	i2c_freq(channel, count, count);
}

/*
 * i2c_common_isr
 */

inline bool i2c_active(i2c_iface ch){
    switch(ch){
    case I2C0:
        return is_binsem_locked(&I2C0_s.binsem);
    case I2C1:
        return is_binsem_locked(&I2C1_s.binsem);
    case I2C2:
        return is_binsem_locked(&I2C2_s.binsem);
     }
    return false;
}

void poll_wait(i2c_iface i2c_ch) {
    switch(i2c_ch){
    case I2C0:
        while(is_binsem_locked(&I2C0_s.binsem) == 1);
        break;
    case I2C1:
        while(is_binsem_locked(&I2C1_s.binsem)  == 1);
        break;
    case I2C2:
        while(is_binsem_locked(&I2C2_s.binsem) == 1);
        break;
     }
}
//#define DEBUG_I2C
static inline void i2c_common_isr(i2c * I2C)
{
    bool xact_exit = false;
    //Read the I2C state from the correct I2STA register and then branch to
    //the corresponding state routine.
    unsigned char status = *(I2C->STAT);
#ifdef DEBUG_I2C
    uart0_putstring("*Dbg* I2C state: 0x");
    uart0_putstring(util_uitoa(status, HEX));
    uart0_putstring(" CONSET: 0x");
    uart0_putstring(util_uitoa(*(I2C->CONSET), HEX));
#endif
    switch(status) {
        case 0x00:
            /* State 0x00 - Bus Error */
            I2C->wrindex = 0;
            I2C->rdindex = 0;
            I2C->internal.state = I2C_ERROR;
            *(I2C->CONSET) = I2C_STO;
            xact_exit = true;
            break;

        case 0x08:
            /* State 0X08 -
             *  A start condition has been transmitted.
             *  The Slave Address and Read or Write bit will be transmitted.
             *  An ACK bit will be received.
             */
            I2C->internal.state = I2C_START;
            // write the Slave Address with R/W bit to I2DAT
            if(I2C->internal.write_length > 0){
                I2C->wrindex = 0;
                *I2C->DAT = i2c_create_write_address(I2C->internal.device_addr);
            }else{
                I2C->rdindex = 0;
                *I2C->DAT = i2c_create_read_address(I2C->internal.device_addr);
            }
#           ifdef DEBUG_I2C
            uart0_putstring(" DATA: ");
            uart0_putstring(util_uitoa(*(I2C->DAT), HEX));
#           endif
            *(I2C->CONCLR) = I2C_STAC;
            break;

        case 0x10:
            /* State 0x10 -
             *  A repeated start condition has been transmitted.
             *  The Slave Address and Read bit will be transmitted.
             *  An ACK bit will be received
             */
            I2C->internal.state = I2C_RESTART;
            // Device address + R is first after write data in stream
            I2C->rdindex = 0;
            *(I2C->DAT) = i2c_create_read_address(I2C->internal.device_addr);
            *(I2C->CONCLR) = I2C_STAC;
#           ifdef DEBUG_I2C
            uart0_putstring(" DATA: ");
            uart0_putstring(util_uitoa(*(I2C->DAT), HEX));
#           endif
            break;

        case 0x18:
            /* State 0x18 -
             *  Previous state was 0x08 (from 0x10 not implemented).
             *  Slave Address and Write has been transmitted.
             *  An ACK has been received.
             *  The first data byte will be transmitted (0x08 made sure there
             *  was at least 1 byte to write)
             *  An ACK bit will be received.
             */
            *(I2C->DAT) = I2C->internal.tx_buffer[I2C->wrindex++];
            I2C->internal.state = I2C_SLAVE_ACK;
#           ifdef DEBUG_I2C
            uart0_putstring(" DATA: ");
            uart0_putstring(util_uitoa(*(I2C->DAT), HEX));
#           endif
            break;

        case 0x20:
            /* State 0x20 -
             *  Slave Address + Write has been transmitted.
             *  "NOT_ACK" has been received.
             *  A Stop condition will be transmitted.
             */
            I2C->internal.state = I2C_SLAVE_NOTACK;
            *(I2C->CONSET) = I2C_STO;
            xact_exit = true;
            break;

        case 0x28:
            /* State 0x28 -
             *  Data has been transmitted, ACK has been received.
             *  If the transmitted data was the last data byte then
             *  check to see if read length is > 0. (looking for repeated
             *  start transaction)
             */
            if(I2C->wrindex < I2C->internal.write_length) {
                *(I2C->DAT) = I2C->internal.tx_buffer[(I2C->wrindex)++];
                I2C->internal.state = I2C_SLAVE_ACK;
#               ifdef DEBUG_I2C
                uart0_putstring(" DATA: ");
                uart0_putstring(util_uitoa(*(I2C->DAT), HEX));
#               endif
            } else if (I2C->internal.read_length > 0) {
                I2C->internal.state = I2C_REPEATED_START;
                *(I2C->CONSET) = I2C_STA;  // repeated start
            } else {
                I2C->internal.state = I2C_SLAVE_ACK;
                *(I2C->CONSET) = I2C_STO;
                xact_exit = true;
            }
            break;

        case 0x30:
            /* State 0x30 -
             *   Data has been transmitted,
             *   NOT ACK received.
             *   A Stop condition will be transmitted.
             */
            I2C->internal.state = I2C_SLAVE_NOTACK;
            *(I2C->CONSET) = I2C_STO;
            xact_exit = true;
            break;

        case 0x38:
            /* State 0x38 - Multiple Master State
             *  Arbitration has been lost during Slave Address + Write or data.
             *  The bus has been released and not addressed Slave mode is entered.
             *  A new Start condition will be transmitted when the bus is free again.
             */
            I2C->internal.state = I2C_START;
            I2C->wrindex = 0;
            I2C->rdindex = 0;
            *(I2C->CONSET) = I2C_STA;
            break;

            /**** MASTER RECEIVE STATES ****/

        case 0x40:
            /* State 0x40
             *   Previous state was State 0x08 or State 0x10.
             *   Slave Address + Read has been transmitted, ACK has been received.
             *   Slave will now send a data byte, master chooses to ACK or NOT ACK.
             */
            if (I2C->internal.read_length <= 1) {
                // go to state 0x58
                *(I2C->CONCLR) = I2C_AAC;
            } else {
                // go to state 0x50
                *(I2C->CONSET) = I2C_AA;
            }
            break;

        case 0x48:
            /* State 0x48 -
             *  Slave Address + Read has been transmitted, NOT ACK has been received.
             *  A Stop condition will be transmitted.
             */
            I2C->internal.state = I2C_SLAVE_NOTACK;
            *(I2C->CONSET) = I2C_STO;
            xact_exit = true;
            break;

        case 0x50:
            /* State 0x50 -
             *  Data has been received, ACK has been issued.
             *  Data will be read from I2DAT.
             *  Additional data will be received.
             *  If the next byte to be received is the last data byte then
             *  NOT ACK will be issued, otherwise ACK will be issued.
             */
            I2C->internal.rd_buffer[(I2C->rdindex)++] = *(I2C->DAT);
            if(I2C->rdindex + 1 < I2C->internal.read_length) {
                I2C->internal.state = I2C_MASTER_ACK;
                *(I2C->CONSET) = I2C_AA;
            } else { // it's the last byte...
                I2C->internal.state = I2C_MASTER_NOTACK;
                *(I2C->CONCLR) = I2C_AAC;
            }
#           ifdef DEBUG_I2C
            uart0_putstring(" DATA: ");
            uart0_putstring(util_uitoa(*(I2C->DAT), HEX));
#           endif
            break;

        case 0x58:
            /* State: 0x58 -
             *  Data has been received, NOT ACK has been issued.
             *  Data will be read from I2DAT.
             *  A Stop condition will be transmitted.
             */
            I2C->internal.rd_buffer[(I2C->rdindex)++] = *(I2C->DAT);
            I2C->internal.state = I2C_MASTER_NOTACK;
            *(I2C->CONSET) = I2C_STO;
#           ifdef DEBUG_I2C
            uart0_putstring(" DATA: ");
            uart0_putstring(util_uitoa(*(I2C->DAT), HEX));
#           endif
            xact_exit = true;
            break;

        default:
            /*Unimplemented state, treat like state 0x0, bus error*/
#           ifdef DEBUG_I2C
            uart0_putstring("*Dbg* I2C state 0xdefault\n");
#           endif
            I2C->wrindex = 0;
            I2C->rdindex = 0;
            I2C->internal.state = I2C_ERROR;
            *(I2C->CONSET) = I2C_STO;
            xact_exit = true;
            break;
    }
#   ifdef DEBUG_I2C
    uart0_putstring("\n");
#   endif
    *(I2C->CONCLR) = I2C_SIC;
    if(xact_exit == true) {  // STOP Bit has been set
        if(I2C->callback != NULL){

            I2C->callback(&I2C->internal);
        }
        I2C->rdindex = 0;
        I2C->wrindex = 0;
        I2C->internal.state = I2C_IDLE;
        release_binsem(&I2C->binsem);
    }

}

/*
 * i2c0_isr
 */
void i2c0_isr(void){
    i2c_common_isr(&I2C0_s);
    EXIT_INTERRUPT;
}

/*
 * i2c1_isr
 */
void i2c1_isr(void) {
    i2c_common_isr(&I2C1_s);
    EXIT_INTERRUPT;
}

/*
 * i2c2_isr
 */
void i2c2_isr(void) {
    i2c_common_isr(&I2C2_s);
    EXIT_INTERRUPT;
}

/*
 * start_i2c_master_xact
 * Input: I2C channel, pointer to i2c_master_t structure with transaction data,
 *        I2C callback.
 */
int start_i2c_master_xact(i2c_iface i2c_ch, i2c_master_xact_t* s,
        i2c_callback * xact_fn)
{
    if(s == NULL){
        return -1; //todo: error enum
    }

    i2c * I2C;
    switch(i2c_ch){
    case I2C0:
    	I2C = &I2C0_s;
    	break;
    case I2C1:
    	I2C = &I2C1_s;
    	break;
    case I2C2:
    	I2C = &I2C2_s;
    	break;
    default:
        return -2;
    }
    // See if we can obtain the semaphore. If the semaphore is not available
    // wait I2C_BINSEM_WAIT msecs to see if it becomes free.
    if( get_binsem(&(I2C->binsem), I2C_BINSEM_WAITTICKS) == 0){
        return -3;
    }

    int i;
    for(i = 0; i < s->write_length; ++i) {
        I2C->internal.tx_buffer[i] = s->tx_buffer[i];
    }
    I2C->internal.write_length = s->write_length;
    I2C->internal.read_length  = s->read_length;
    I2C->internal.cb_data      = s->cb_data;
    I2C->internal.device_addr  = s->device_addr;
    I2C->callback = xact_fn;
    //write 0x20 to I2CONSET to set the STA bit and start the transaction
    *(I2C->CONSET) = I2C_STA;
    return 0;
}

/*! @} */

