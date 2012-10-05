
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
 * lpc23xx-i2c.c
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

bin_semaphore         i2c0_binsem_g;
bin_semaphore         i2c1_binsem_g;
bin_semaphore         i2c2_binsem_g;

i2c_master_xact_t     i2c0_s_g;
i2c_master_xact_t     i2c1_s_g;
i2c_master_xact_t     i2c2_s_g;

volatile uint32_t     i2c0_wrindex_g;
volatile uint32_t     i2c0_rdindex_g;

volatile uint32_t     i2c1_wrindex_g;
volatile uint32_t     i2c1_rdindex_g;

volatile uint32_t     i2c2_wrindex_g;
volatile uint32_t     i2c2_rdindex_g;


XACT_FnCallback*      _i2c0_FnCallback_g;
XACT_FnCallback*      _i2c1_FnCallback_g;
XACT_FnCallback*      _i2c2_FnCallback_g;

i2c_master_xact_t*    i2c0_s_caller_g;
i2c_master_xact_t*    i2c1_s_caller_g;
i2c_master_xact_t*    i2c2_s_caller_g;

/*
 * i2c_create_read_addr
 */
uint8_t i2c_create_read_address(uint8_t addr) {
    return (addr << 1) | 0x1;
}

/*
 * i2c_create_write_addr
 */
uint8_t i2c_create_write_address(uint8_t addr) {
    return addr << 1;
}

/*
 * i2c_init_state
 */
void i2c_init_state( i2c_master_xact_t* s) {
    int i = 0;

    s->state             = I2C_IDLE;
    for(i=0; i<I2C_MAX_BUFFER; i++) {
        s->i2c_tx_buffer[i] = 0;
        s->i2c_rd_buffer[i] = 0;
    }
    s->write_length          = 0x0;
    s->read_length           = 0x0;
    s->xact_success          = false;
    s->cb_data               = NULL;
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
            init_binsem( &i2c0_binsem_g );

            i2c_init_state( &i2c0_s_g );

            POWER_ON(PCI2C0);

            I2C0CONCLR = 0x7C;
            I2C0CONSET = (I2C_I2EN | I2C_AA); // master mode

            // I2C clock
            SET_PCLK(PCLK_I2C0, CCLK_DIV1);
            I2C0SCLL   = I2SCLLOW;
            I2C0SCLH   = I2SCLHIGH;

            I2C0_ENABLE_SDA0_PIN;
            I2C0_ENABLE_SCL0_PIN;

            // pinmode:   I2C0 pins permanent open drain (pullup)
            // reference: lpc23xx usermanual p158 table 107 footnote 2

            // vic
            // set up VIC p93 table 86 lpc23xx user manual
            ENABLE_INT(I2C0);

            VICVectAddr9 = (unsigned int) i2c0_isr;
            VICAddress = 0x0;      // clear VIC address

            I2C0CONCLR   = I2C_SIC;

            break;

        case I2C1: 

        	init_binsem(&i2c1_binsem_g);

            i2c_init_state( &i2c1_s_g );

            POWER_ON(PCI2C1);

            I2C1CONCLR = 0x7C;
            I2C1CONSET = (I2C_I2EN | I2C_AA); // master mode

            SET_PCLK(PCLK_I2C1, CCLK_DIV1);
            I2C1SCLL   = I2SCLLOW;
            I2C1SCLH   = I2SCLHIGH;
            if(pin == I2C1_ALTPIN){
            	I2C1_ENABLE_SDA1_ALT_PIN;
            	I2C1_ENABLE_SCL1_ALT_PIN;

				// reference: lpc23xx usermanual p158 table 107 footnote 2
				I2C1_SDA1_ALT_PULLUP;
            }
            else{
            	I2C1_ENABLE_SDA1_PIN;
				I2C1_ENABLE_SCL1_PIN;

				// reference: lpc23xx usermanual p158 table 107 footnote 2
				I2C1_SDA1_PULLUP;
            }

            // vic
            // set up VIC p93 table 86 lpc23xx user manual
            ENABLE_INT(VIC_I2C1);
            VICVectAddr19 = (unsigned int) i2c1_isr;

            I2C1CONCLR    = I2C_SIC;
            break;

        case I2C2: 
            init_binsem(&i2c2_binsem_g);

            i2c_init_state( &i2c2_s_g );

            POWER_ON(PCI2C2);

            I2C2CONCLR = 0x7C;
            I2C2CONSET = (I2C_I2EN | I2C_AA); // master mode

            // I2C clock
            SET_PCLK(PCLK_I2C2, CCLK_DIV1);
            I2C2SCLL   = I2SCLLOW;
            I2C2SCLH   = I2SCLHIGH;

            I2C2_ENABLE_SDA2_PIN;
            I2C2_ENABLE_SCL2_PIN;

            // reference: lpc23xx usermanual p158 table 107 footnote 2
            I2C2_SDA2_PULLUP;

            // vic
            // set up VIC p93 table 86 lpc23xx user manual
            VICVectAddr30 = (unsigned int) i2c2_isr;
            ENABLE_INT(VIC_I2C2);

            I2C2CONCLR    = I2C_SIC;
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
void i2c_kHz(i2c_iface channel, uint32_t freq){
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
 * i2c0_isr
 */
void i2c0_isr(void) {

    //   ISR_ENTRY;

    uint32_t                 status;
    uint8_t                  xact_exit;

    xact_exit                = 0;

    status                   = I2C0STAT;

    //Read the I2C state from the correct I2STA register and then branch to
    //the corresponding state routine.
    switch(status) {
        // State 0x00 - Bus Error
        case 0x00:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x00\n");
#endif
            i2c0_wrindex_g     = 0;
            i2c0_rdindex_g     = 0;
            i2c0_s_g.state    = I2C_ERROR;
            I2C0CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            break;

            // State 0X08 - 
            //   A start condition has been transmitted. 
            //   The Slave Address and Read or Write bit will be transmitted.
            //   An ACK bit will be received.
        case 0x08:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x08\n");
#endif
            i2c0_wrindex_g     = 0;

            // write the Slave Address with R/W bit to I2DAT
            I2C0DAT           = i2c0_s_g.i2c_tx_buffer[i2c0_wrindex_g++] ;
            i2c0_s_g.state    = I2C_START;

            break;

            // State 0x10 - 
            //   A repeated start condition has been transmitted.
            //   The Slave Address and Read or Write bit will be transmitted.  
            //   An ACK bit will be received
        case 0x10:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x10\n");
#endif
            i2c0_rdindex_g     = 0;

            // Device address + R/W is first after write data in stream
            I2C0DAT           = i2c0_s_g.i2c_tx_buffer[i2c0_wrindex_g++] ;
            i2c0_s_g.state    = I2C_RESTART;
            I2C0CONCLR        = I2C_STAC;
            break;

            // State 0x18 - 
            //   Previous state was 0x08 or 0x10.  
            //   Slave Address and Read or Write has been transmitted.
            //   An ACK has been received. 
            //   The first data byte will be transmitted. 
            //   An ACK bit will be received.
        case 0x18:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x18\n");
#endif
            if(i2c0_s_g.state == I2C_START) {
                I2C0DAT           = i2c0_s_g.i2c_tx_buffer[i2c0_wrindex_g++] ;
                I2C0CONSET        = I2C_AA;
                I2C0CONCLR        = I2C_STAC; // undocumented clear start flag
                i2c0_s_g.state    = I2C_ACK;
            }
            break;

            // State 0x20 - 
            //   Slave Address + Write has been transmitted.  
            //   "NOT_ACK" has been received. 
            //   A Stop condition will be transmitted.
        case 0x20:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x20\n");
#endif
            I2C0CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            i2c0_s_g.state    = I2C_NOTACK;
            I2C0CONCLR        = I2C_STAC; // undocumented clear start flag
            status            = I2C0STAT;

            break;

            // State 0x28 - 
            //   Data has been transmitted, ACK has been received. 
            //   If the transmitted data was the last data byte then 
            //   check to see if read length is > 0. (looking for repeated 
            //   start transaction)
        case 0x28:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x28\n");
#endif
            if(i2c0_wrindex_g < i2c0_s_g.write_length) {
                I2C0DAT           = i2c0_s_g.i2c_tx_buffer[i2c0_wrindex_g++] ;
                I2C0CONSET        = I2C_AA;
                i2c0_s_g.state    = I2C_ACK;
            } else {
                if (i2c0_s_g.read_length != 0) {
                    I2C0CONSET        = I2C_STA;  // repeated start
                    i2c0_s_g.state    = I2C_REPEATED_START;
                } else {
                    I2C0CONSET        = (I2C_STO | I2C_AA);
                    xact_exit         = 1;
                    i2c0_s_g.state    = I2C_ACK;
                }
            }
            break;

            // State 0x30 - 
            //   Data has been transmitted, 
            //   NOT ACK received. 
            //   A Stop condition will be transmitted.
        case 0x30:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x30\n");
#endif
            I2C0CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            i2c0_s_g.state    = I2C_NOTACK;
            break;

            // State 0x38 - Multiple Master State 
            //   Arbitration has been lost during Slave Address + Write or data. 
            //   The bus has been released and not addressed Slave mode is entered. 
            //   A new Start condition will be transmitted when the bus is free again.
            //   *** We will issue a STOP here, since we should never be in Multiple master 
            //   mode for our application ***
        case 0x38:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x38\n");
#endif
            I2C0CONSET        = (I2C_STO | I2C_AA);
            xact_exit       = 1;
            i2c0_s_g.state    = I2C_ERROR;
            break;

            // MASTER RECEIVE STATES

            // State 0x40 
            //   Previous state was State 0x08 or State 0x10. 
            //   Slave Address + Read has been transmitted, ACK has been received.
        case 0x40:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x40\n");
#endif
            if (i2c0_s_g.read_length == 1) {
                // go to state 0x58
                I2C0CONCLR        = I2C_AAC;
                I2C0CONCLR        = I2C_STAC; // undocumented clear start flag
            } else {
                // go to state 0x50
                I2C0CONSET        = I2C_AA;
                I2C0CONCLR        = I2C_STAC; // undocumented clear start flag
            }
            break;

            // State 0x48 - 
            //   Slave Address + Read has been transmitted, NOT ACK has been received. 
            //   A Stop condition will be transmitted.
        case 0x48:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x48\n");
#endif
            I2C0CONSET        = (I2C_STO | I2C_AA);
            xact_exit       = 1;
            i2c0_s_g.state    = I2C_NOTACK;
            break;

            // State 0x50 -
            //   Data has been received, ACK has been returned. 
            //   Data will be read from I2DAT. 
            //   Additional data will be received. 
            //   If this is the last data byte then NOT ACK will be returned, 
            //     otherwise ACK will be returned. 
        case 0x50:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x50\n");
#endif
            i2c0_s_g.i2c_rd_buffer[i2c0_rdindex_g++] = I2C0DAT;  
            if(i2c0_rdindex_g < (i2c0_s_g.read_length-1)) {
                I2C0CONSET     = I2C_AA;
                i2c0_s_g.state = I2C_ACK;
            } else { // it's the last byte...
                I2C0CONCLR     = I2C_AAC;
                i2c0_s_g.state = I2C_NOTACK;
            }
            break;

            // State: 0x58 - 
            //   Data has been received, NOT ACK has been returned. 
            //   Data will be read from I2DAT. 
            //   A Stop condition will be transmitted.
        case 0x58:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x58\n");
#endif
            i2c0_s_g.i2c_rd_buffer[i2c0_rdindex_g++] = I2C0DAT;  
            I2C0CONSET                              = (I2C_STO | I2C_AA);
            i2c0_s_g.state                          = I2C_NOTACK;
            xact_exit                               = 1;
            break;

            //   Unimplemented state, treat like state 0x0, bus error
        default:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0xdefault\n");
#endif      
            i2c0_wrindex_g     = 0;
            i2c0_rdindex_g     = 0;
            i2c0_s_g.state    = I2C_ERROR;
            I2C0CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            break;
    }

    if(xact_exit == 1) {  // STOP Bit has been set
        if(i2c0_s_g.state != I2C_ERROR) {
            i2c0_s_g.xact_success = 1;
        }
        if(_i2c0_FnCallback_g != NULL)
            _i2c0_FnCallback_g( i2c0_s_caller_g, &i2c0_s_g);
        i2c_init_state(&i2c0_s_g) ;
        release_binsem(&i2c0_binsem_g);
    }
    I2C0CONCLR = I2C_SIC;

    //    ISR_EXIT;
    EXIT_INTERRUPT;
}

/*
 * i2c1_isr
 */
void i2c1_isr(void) {

    //   ISR_ENTRY;

    uint32_t                 status;
    uint8_t                  xact_exit;

    xact_exit                = 0;

    status                   = I2C1STAT;

    //Read the I2C state from the correct I2STA register and then branch to
    //the corresponding state routine.
    switch(status) {
        // State 0x00 - Bus Error
        case 0x00:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x00\n");
#endif
            i2c1_wrindex_g     = 0;
            i2c1_rdindex_g     = 0;
            i2c1_s_g.state    = I2C_ERROR;
            I2C1CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            break;

            // State 0X08 - 
            //   A start condition has been transmitted. 
            //   The Slave Address and Read or Write bit will be transmitted.
            //   An ACK bit will be received.
        case 0x08:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x08\n");
#endif
            i2c1_wrindex_g     = 0;

            // write the Slave Address with R/W bit to I2DAT
            I2C1DAT           = i2c1_s_g.i2c_tx_buffer[i2c1_wrindex_g++] ;
            i2c1_s_g.state    = I2C_START;

            break;

            // State 0x10 - 
            //   A repeated start condition has been transmitted.
            //   The Slave Address and Read or Write bit will be transmitted.  
            //   An ACK bit will be received
        case 0x10:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x10\n");
#endif
            i2c1_rdindex_g     = 0;

            // Device address + R/W is first after write data in stream
            I2C1DAT           = i2c1_s_g.i2c_tx_buffer[i2c1_wrindex_g++] ;
            i2c1_s_g.state    = I2C_RESTART;
            I2C1CONCLR        = I2C_STAC;
            break;

            // State 0x18 - 
            //   Previous state was 0x08 or 0x10.  
            //   Slave Address and Read or Write has been transmitted.
            //   An ACK has been received. 
            //   The first data byte will be transmitted. 
            //   An ACK bit will be received.
        case 0x18:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x18\n");
#endif
            if(i2c1_s_g.state == I2C_START) {
                I2C1DAT           = i2c1_s_g.i2c_tx_buffer[i2c1_wrindex_g++] ;
                I2C1CONSET        = I2C_AA;
                I2C1CONCLR        = I2C_STAC; // undocumented clear start flag
                i2c1_s_g.state    = I2C_ACK;
            }
            break;

            // State 0x20 - 
            //   Slave Address + Write has been transmitted.  
            //   "NOT_ACK" has been received. 
            //   A Stop condition will be transmitted.
        case 0x20:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x20\n");
#endif
            I2C1CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            i2c1_s_g.state    = I2C_NOTACK;
            I2C1CONCLR        = I2C_STAC; // undocumented clear start flag
            status            = I2C1STAT;

            break;

            // State 0x28 - 
            //   Data has been transmitted, ACK has been received. 
            //   If the transmitted data was the last data byte then 
            //   check to see if read length is > 0. (looking for repeated 
            //   start transaction)
        case 0x28:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x28\n");
#endif
            if(i2c1_wrindex_g < i2c1_s_g.write_length) {
                I2C1DAT           = i2c1_s_g.i2c_tx_buffer[i2c1_wrindex_g++] ;
                I2C1CONSET        = I2C_AA;
                i2c1_s_g.state    = I2C_ACK;
            } else {
                if (i2c1_s_g.read_length != 0) {
                    I2C1CONSET        = I2C_STA;  // repeated start
                    i2c1_s_g.state    = I2C_REPEATED_START;
                } else {
                    I2C1CONSET        = (I2C_STO | I2C_AA);
                    xact_exit         = 1;
                    i2c1_s_g.state    = I2C_ACK;
                }
            }
            break;

            // State 0x30 - 
            //   Data has been transmitted, 
            //   NOT ACK received. 
            //   A Stop condition will be transmitted.
        case 0x30:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x30\n");
#endif
            I2C1CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            i2c1_s_g.state    = I2C_NOTACK;
            break;

            // State 0x38 - Multiple Master State 
            //   Arbitration has been lost during Slave Address + Write or data. 
            //   The bus has been released and not addressed Slave mode is entered. 
            //   A new Start condition will be transmitted when the bus is free again.
            //   *** We will issue a STOP here, since we should never be in Multiple master 
            //   mode for our application ***
        case 0x38:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x38\n");
#endif
            I2C1CONSET        = (I2C_STO | I2C_AA);
            xact_exit       = 1;
            i2c1_s_g.state    = I2C_ERROR;
            break;

            // MASTER RECEIVE STATES

            // State 0x40 
            //   Previous state was State 0x08 or State 0x10. 
            //   Slave Address + Read has been transmitted, ACK has been received.
        case 0x40:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x40\n");
#endif
            if (i2c1_s_g.read_length == 1) {
                // go to state 0x58
                I2C1CONCLR        = I2C_AAC;
                I2C1CONCLR        = I2C_STAC; // undocumented clear start flag
            } else {
                // go to state 0x50
                I2C1CONSET        = I2C_AA;
                I2C1CONCLR        = I2C_STAC; // undocumented clear start flag
            }
            break;

            // State 0x48 - 
            //   Slave Address + Read has been transmitted, NOT ACK has been received. 
            //   A Stop condition will be transmitted.
        case 0x48:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x48\n");
#endif
            I2C1CONSET        = (I2C_STO | I2C_AA);
            xact_exit       = 1;
            i2c1_s_g.state    = I2C_NOTACK;
            break;

            // State 0x50 -
            //   Data has been received, ACK has been returned. 
            //   Data will be read from I2DAT. 
            //   Additional data will be received. 
            //   If this is the last data byte then NOT ACK will be returned, 
            //     otherwise ACK will be returned. 
        case 0x50:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x50\n");
#endif
            i2c1_s_g.i2c_rd_buffer[i2c1_rdindex_g++] = I2C1DAT;  
            if(i2c1_rdindex_g < (i2c1_s_g.read_length-1)) {
                I2C1CONSET     = I2C_AA;
                i2c1_s_g.state = I2C_ACK;
            } else { // it's the last byte...
                I2C1CONCLR     = I2C_AAC;
                i2c1_s_g.state = I2C_NOTACK;
            }
            break;

            // State: 0x58 - 
            //   Data has been received, NOT ACK has been returned. 
            //   Data will be read from I2DAT. 
            //   A Stop condition will be transmitted.
        case 0x58:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state 0x58\n");
#endif
            i2c1_s_g.i2c_rd_buffer[i2c1_rdindex_g++] = I2C1DAT;  
            I2C1CONSET                              = (I2C_STO | I2C_AA);
            i2c1_s_g.state                          = I2C_NOTACK;
            xact_exit                               = 1;
            break;

            //   Unimplemented state, treat like state 0x0, bus error
        default:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C1 state default\n");
#endif      
            i2c1_wrindex_g     = 0;
            i2c1_rdindex_g     = 0;
            i2c1_s_g.state    = I2C_ERROR;
            I2C1CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            break;
    }

    if(xact_exit == 1) {  // STOP Bit has been set
        if(i2c1_s_g.state != I2C_ERROR) {
            i2c1_s_g.xact_success = 1;
        }
        if(_i2c1_FnCallback_g != NULL)
            _i2c1_FnCallback_g( i2c1_s_caller_g, &i2c1_s_g );
        i2c_init_state(&i2c1_s_g) ;
        release_binsem(&i2c1_binsem_g);
    }
    I2C1CONCLR = I2C_SIC;

    //    ISR_EXIT;
    EXIT_INTERRUPT;
}

/*
 * i2c2_isr
 */
void i2c2_isr(void) {

    //   ISR_ENTRY;

    uint32_t                 status;
    uint8_t                  xact_exit;

    xact_exit                = 0;

    status                   = I2C2STAT;

    //Read the I2C state from the correct I2STA register and then branch to
    //the corresponding state routine.
    switch(status) {
        // State 0x00 - Bus Error
        case 0x00:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x00\n");
#endif
            i2c2_wrindex_g     = 0;
            i2c2_rdindex_g     = 0;
            i2c2_s_g.state    = I2C_ERROR;
            I2C2CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            break;

            // State 0X08 - 
            //   A start condition has been transmitted. 
            //   The Slave Address and Read or Write bit will be transmitted.
            //   An ACK bit will be received.
        case 0x08:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x08\n");
#endif
            i2c2_wrindex_g     = 0;

            // write the Slave Address with R/W bit to I2DAT
            I2C2DAT           = i2c2_s_g.i2c_tx_buffer[i2c2_wrindex_g++] ;
            i2c2_s_g.state    = I2C_START;

            break;

            // State 0x10 - 
            //   A repeated start condition has been transmitted.
            //   The Slave Address and Read or Write bit will be transmitted.  
            //   An ACK bit will be received
        case 0x10:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x10\n");
#endif
            i2c2_rdindex_g     = 0;

            // Device address + R/W is first after write data in stream
            I2C2DAT           = i2c2_s_g.i2c_tx_buffer[i2c2_wrindex_g++] ;
            i2c2_s_g.state    = I2C_RESTART;
            I2C2CONCLR        = I2C_STAC;
            break;

            // State 0x18 - 
            //   Previous state was 0x08 or 0x10.  
            //   Slave Address and Read or Write has been transmitted.
            //   An ACK has been received. 
            //   The first data byte will be transmitted. 
            //   An ACK bit will be received.
        case 0x18:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x18\n");
#endif
            if(i2c2_s_g.state == I2C_START) {
                I2C2DAT           = i2c2_s_g.i2c_tx_buffer[i2c2_wrindex_g++] ;
                I2C2CONSET        = I2C_AA;
                I2C2CONCLR        = I2C_STAC; // undocumented clear start flag
                i2c2_s_g.state    = I2C_ACK;
            }
            break;

            // State 0x20 - 
            //   Slave Address + Write has been transmitted.  
            //   "NOT_ACK" has been received. 
            //   A Stop condition will be transmitted.
        case 0x20:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x20\n");
#endif
            I2C2CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            i2c2_s_g.state    = I2C_NOTACK;
            I2C2CONCLR        = I2C_STAC; // undocumented clear start flag
            status            = I2C2STAT;

            break;

            // State 0x28 - 
            //   Data has been transmitted, ACK has been received. 
            //   If the transmitted data was the last data byte then 
            //   check to see if read length is > 0. (looking for repeated 
            //   start transaction)
        case 0x28:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x28\n");
#endif
            if(i2c2_wrindex_g < i2c2_s_g.write_length) {
                I2C2DAT           = i2c2_s_g.i2c_tx_buffer[i2c2_wrindex_g++] ;
                I2C2CONSET        = I2C_AA;
                i2c2_s_g.state    = I2C_ACK;
            } else {
                if (i2c2_s_g.read_length != 0) {
                    I2C2CONSET        = I2C_STA;  // repeated start
                    i2c2_s_g.state    = I2C_REPEATED_START;
                } else {
                    I2C2CONSET        = (I2C_STO | I2C_AA);
                    xact_exit         = 1;
                    i2c2_s_g.state    = I2C_ACK;
                }
            }
            break;

            // State 0x30 - 
            //   Data has been transmitted, 
            //   NOT ACK received. 
            //   A Stop condition will be transmitted.
        case 0x30:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x30\n");
#endif
            I2C2CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            i2c2_s_g.state    = I2C_NOTACK;
            break;

            // State 0x38 - Multiple Master State 
            //   Arbitration has been lost during Slave Address + Write or data. 
            //   The bus has been released and not addressed Slave mode is entered. 
            //   A new Start condition will be transmitted when the bus is free again.
            //   *** We will issue a STOP here, since we should never be in Multiple master 
            //   mode for our application ***
        case 0x38:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x38\n");
#endif
            I2C2CONSET        = (I2C_STO | I2C_AA);
            xact_exit       = 1;
            i2c2_s_g.state    = I2C_ERROR;
            break;

            // MASTER RECEIVE STATES

            // State 0x40 
            //   Previous state was State 0x08 or State 0x10. 
            //   Slave Address + Read has been transmitted, ACK has been received.
        case 0x40:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x40\n");
#endif
            if (i2c2_s_g.read_length == 1) {
                // go to state 0x58
                I2C2CONCLR        = I2C_AAC;
                I2C2CONCLR        = I2C_STAC; // undocumented clear start flag
            } else {
                // go to state 0x50
                I2C2CONSET        = I2C_AA;
                I2C2CONCLR        = I2C_STAC; // undocumented clear start flag
            }
            break;

            // State 0x48 - 
            //   Slave Address + Read has been transmitted, NOT ACK has been received. 
            //   A Stop condition will be transmitted.
        case 0x48:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x48\n");
#endif
            I2C2CONSET        = (I2C_STO | I2C_AA);
            xact_exit       = 1;
            i2c2_s_g.state    = I2C_NOTACK;
            break;

            // State 0x50 -
            //   Data has been received, ACK has been returned. 
            //   Data will be read from I2DAT. 
            //   Additional data will be received. 
            //   If this is the last data byte then NOT ACK will be returned, 
            //     otherwise ACK will be returned. 
        case 0x50:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x50\n");
#endif
            i2c2_s_g.i2c_rd_buffer[i2c2_rdindex_g++] = I2C2DAT;  
            if(i2c2_rdindex_g < (i2c2_s_g.read_length-1)) {
                I2C2CONSET     = I2C_AA;
                i2c2_s_g.state = I2C_ACK;
            } else { // it's the last byte...
                I2C2CONCLR     = I2C_AAC;
                i2c2_s_g.state = I2C_NOTACK;
            }
            break;

            // State: 0x58 - 
            //   Data has been received, NOT ACK has been returned. 
            //   Data will be read from I2DAT. 
            //   A Stop condition will be transmitted.
        case 0x58:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0x58\n");
#endif
            i2c2_s_g.i2c_rd_buffer[i2c2_rdindex_g++] = I2C2DAT;  
            I2C2CONSET                              = (I2C_STO | I2C_AA);
            i2c2_s_g.state                          = I2C_NOTACK;
            xact_exit                               = 1;
            break;

            //   Unimplemented state, treat like state 0x0, bus error
        default:
#ifdef DEBUG_I2C 
            uart0_putstring("*Dbg* I2C state 0xdefault\n");
#endif      
            i2c2_wrindex_g     = 0;
            i2c2_rdindex_g     = 0;
            i2c2_s_g.state    = I2C_ERROR;
            I2C2CONSET        = (I2C_STO | I2C_AA);
            xact_exit         = 1;
            break;
    }

    if(xact_exit == 1) {  // STOP Bit has been set
        if(i2c2_s_g.state != I2C_ERROR) {
            i2c2_s_g.xact_success = 1;
        }

        if(_i2c2_FnCallback_g != NULL)
            _i2c2_FnCallback_g( i2c2_s_caller_g, &i2c2_s_g );
        i2c_init_state(&i2c2_s_g) ;
        release_binsem(&i2c2_binsem_g);
    }
    I2C2CONCLR = I2C_SIC;

    //    ISR_EXIT;
    EXIT_INTERRUPT;
}


/*****************************************************************************
// EXAMPLE BASIC CALLBACK FUNCTION
void app_i2c0_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c) {
uint16_t i;
for(i=0; i<I2C_MAX_BUFFER; ++i) {
caller->i2c_tx_buffer[i] = i2c->i2c_tx_buffer[i];
caller->i2c_rd_buffer[i] = i2c->i2c_rd_buffer[i];
}

caller->write_length         = i2c->write_length;
caller->read_length          = i2c->read_length;
caller->xact_success         = i2c->xact_success;
// maybe trigger an interrupt here
}

 ****************************************************************************/

/*
 * start_i2c0_master_xact
 * Input: Pointer to i2c_master_t structure with xaction data
 */
void start_i2c0_master_xact(i2c_master_xact_t* s, XACT_FnCallback* xact_fn) {

    uint16_t i;
    if(s!=NULL) {
        // See if we can obtain the semaphore. If the semaphore is not available 
        // wait I2C_BINSEM_WAIT msecs to see if it becomes free. 
        if( get_binsem( &i2c0_binsem_g, I2C_BINSEM_WAITTICKS ) == 1 ) {  // binsem for channel 0
            for(i=0; i<s->write_length; ++i) {
                i2c0_s_g.i2c_tx_buffer[i]  = s->i2c_tx_buffer[i];
            }
            i2c0_s_g.write_length          = s->write_length;
            i2c0_s_g.read_length           = s->read_length;
            i2c0_s_g.xact_success          = false;
            s->xact_success                = false;
            i2c0_s_g.cb_data               = s->cb_data;
            i2c0_s_caller_g                = s;

            _i2c0_FnCallback_g             = xact_fn;

            //write 0x20 to I2CONSET to set the STA bit
            I2C0CONSET                    = I2C_STA;
        } else { 
            uart0_putstring("*** I2C0-ERROR ***: I2C0_master_xact, Timed out waiting for i2c0_binsem_g. Skipping Request.\n");
        } 
    } else {
        uart0_putstring("*** I2C0-ERROR ***: I2C0_master_xact, structure pointer is NULL. Skipping.\n");
    }
}

/*
 * start_i2c1_master_xact
 * Input: Pointer to i2c_master_t structure with xaction data
 */
void start_i2c1_master_xact(i2c_master_xact_t* s, XACT_FnCallback* xact_fn) {

    uint16_t i;
    if(s!=NULL) {
        // See if we can obtain the semaphore. If the semaphore is not available 
        // wait I2C_BINSEM_WAIT msecs to see if it becomes free. 
        if( get_binsem( &i2c1_binsem_g, I2C_BINSEM_WAITTICKS ) == 1 ) {  // binsem for channel 1
            for(i=0; i<s->write_length; ++i) {
                i2c1_s_g.i2c_tx_buffer[i]  = s->i2c_tx_buffer[i];
            }
            i2c1_s_g.write_length          = s->write_length;
            i2c1_s_g.read_length           = s->read_length;
            i2c0_s_g.xact_success          = false;
            s->xact_success                = false;
            i2c0_s_g.cb_data               = s->cb_data;
            i2c1_s_caller_g                = s;
            _i2c1_FnCallback_g             = xact_fn;

            //write 0x20 to I2CONSET to set the STA bit
            I2C1CONSET                    = I2C_STA;
        } else { 
            uart0_putstring("*** i2c1-ERROR ***: i2c1_master_xact, Timed out waiting for i2c1_binsem_g. Skipping Request.\n");
        } 
    } else {
        uart0_putstring("*** i2c1-ERROR ***: i2c1_master_xact, structure pointer is NULL. Skipping.\n");
    }
}

/*
 * start_i2c2_master_xact
 * Input: Pointer to i2c_master_t structure with xaction data
 */
void start_i2c2_master_xact(i2c_master_xact_t* s, XACT_FnCallback* xact_fn) {

    uint16_t i;
    if(s!=NULL) {
        // See if we can obtain the semaphore. If the semaphore is not available 
        // wait I2C_BINSEM_WAIT msecs to see if it becomes free. 
        if( get_binsem( &i2c2_binsem_g, I2C_BINSEM_WAITTICKS ) == 1 ) {  // binsem for channel 0
            for(i=0; i<s->write_length; ++i) {
                i2c2_s_g.i2c_tx_buffer[i]  = s->i2c_tx_buffer[i];
            }
            i2c2_s_g.write_length          = s->write_length;
            i2c2_s_g.read_length           = s->read_length;
            i2c0_s_g.xact_success          = false;
            s->xact_success                = false;
            i2c0_s_g.cb_data               = s->cb_data;
            i2c2_s_caller_g                = s;
            _i2c2_FnCallback_g             = xact_fn;

            //write 0x20 to I2CONSET to set the STA bit
            I2C2CONSET                    = I2C_STA;
        } else { 
            uart0_putstring("*** i2c2-ERROR ***: i2c2_master_xact, Timed out waiting for i2c2_binsem_g. Skipping Request.\n");
        } 
    } else {
        uart0_putstring("*** i2c2-ERROR ***: i2c2_master_xact, structure pointer is NULL. Skipping.\n");
    }
}

/*
 * start_i2c_master_xact
 * Input: Pointer to i2c_master_t structure with xaction data
 */
void start_i2c_master_xact(i2c_iface i2c_ch, i2c_master_xact_t* s, XACT_FnCallback* xact_fn){
    switch(i2c_ch){
    case I2C0:
    	start_i2c0_master_xact(s, xact_fn);
    	break;
    case I2C1:
    	start_i2c1_master_xact(s, xact_fn);
    	break;
    case I2C2:
    	start_i2c2_master_xact(s, xact_fn);
    	break;
    }
}
