/*! \file lpc23xx-spi.c
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

/*! \defgroup lpc23xx-spi SPI utility for liblpc23xx
 * @{
 */

#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

#include "lpc23xx.h"
#include "lpc23xx-types.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"
#include "lpc23xx-vic.h"

#include "lpc23xx-spi.h"

static SPI_XACT_FnCallback      _spi_FnCallback_g;

bin_semaphore             spi_binsem_g;

spi_xact_status           spi_status_g;

spi_master_xact           spi_xact_g;
spi_master_xact*           spi_caller_xact_g;

/*!
 */
inline bool spi_abrt(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_ABRT)) >> SPI_SR_ABRT) );
}

/*!
 */
inline bool spi_modf(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_MODF)) >> SPI_SR_MODF) );
}

/*!
 */
inline bool spi_rovr(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_ROVR)) >> SPI_SR_ROVR) );
}

/*!
 */
inline bool spi_wcol(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_WCOL)) >> SPI_SR_WCOL) );
}

/*!
 */
inline bool spi_spif(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_SPIF)) >> SPI_SR_SPIF) );
}

/*! \brief debugging function
 */
uint8_t spi_readstatus() {
    uint8_t spi_status;

    spi_status = S0SPSR;

#ifdef DEBUG_SPI
    if(spi_abrt(spi_status)) printf_lpc(UART0,"ABRT set\n");
    if(spi_modf(spi_status)) printf_lpc(UART0,"MODF set\n");
    if(spi_rovr(spi_status)) printf_lpc(UART0,"ROVR set\n");
    if(spi_wcol(spi_status)) printf_lpc(UART0,"WCOL set\n");
    if(spi_spif(spi_status)) printf_lpc(UART0,"SPIF set\n");
#endif

    return (spi_status);
}

/*! \brief Start a SPI Interrupt transaction on PORT D
 *
 * copy data into local spi_d_xact structure. This leaves the caller free to
 * set up another SPI transaction.
 *
 * @param caller        Pointer to a structure with transaction information
 * @param callback_fn   Pointer to a function to call at end of transaction
 */
void spi_start_xact_intr(spi_master_xact* caller, SPI_XACT_FnCallback callback_fn) {
    uint8_t   i          = 0;
    uint8_t   status_reg = 0;

    ++spi_d_status.xact_pending_count;

    // block if another SPI transaction is already active.
    while(spi_d_status.xact_id != SPI_IDLE) { _delay_ms(SPI_PENDING_LOOP_MS);    }

    --spi_d_status.xact_pending_count;

    spi_d_caller_xact         = caller;
    _spi_d_FnCallback         = callback_fn;

    // start a transaction
    // copy caller data into spi_d_xact
    spi_d_xact.dummy_value    = caller->dummy_value;
    spi_d_xact.id             = caller->id;
    spi_d_xact.read_numbytes  = caller->read_numbytes;
    spi_d_xact.write_numbytes = caller->write_numbytes;

    if((spi_d_xact.write_numbytes < SPI_BUFFER_MAX) && (spi_d_xact.read_numbytes < SPI_BUFFER_MAX)) {
        for(i=0; i<spi_d_xact.write_numbytes; ++i) {
            spi_d_xact.writebuf[i] = caller->writebuf[i];
        }
    } else {
        return;
    }
    // read IF from Status register to clear
    status_reg                = SPID.STATUS;

    if((spi_d_xact.id == SPI_ACCEL_READ_REG) || (spi_d_xact.id == SPI_ACCEL_WRITE_REG))  {
        // Activate the CS for Accelerometer.
        port_pin_low(&ACCEL_SPI_PORT, ACCEL_SCS_bm);
    }

    // put the first write byte into the data buffer to begin transaction. This will generate an interrupt.
    SPID.DATA  = spi_d_xact.writebuf[0];
}

static void spi_copy_spi_xact(spi_master_xact *to, spi_master_xact* from) {
	uint8_t i = 0;

	to->spi_cpha_val      = from->spi_cpha_val;
	to->spi_cpol_val      = from->spi_cpol_val;
	to->spi_lsbf_val      = from->spi_lsbf_val;
	to->dummy_value       = from->dummy_value;
	to->id                = from->id;
	to->read_numbytes     = from->read_numbytes;
	to->write_numbytes    = from->write_numbytes;

	for (i=0; i< (to->write_numbytes); ++i) {
		to->writebuf[i] = from->writebuf[i];
	}
	for (i=0; i< SPI_MAX_BUFFER; ++i) {
		to->readbuf[i]  = 0;
	}
}

/*!\ Brief Start a SPI interrupt based transaction
 *
 * @param s         Pointer to a structure with xact information
 * @param xact_fn   Pointer to a function to call at end of xaction
 */
bool start_spi_master_xact_intr(spi_master_xact* s, SPI_XACT_FnCallback xact_fn) {

	uint16_t i;
	uint8_t  status_reg;

	_spi_FnCallback_g        = *xact_fn;

	if(s!=NULL) {
		// bounds check on transaction
		if((s->write_numbytes >= SPI_MAX_BUFFER) || (s->read_numbytes >= SPI_MAX_BUFFER)) {
			return false;
		}

		// See if we can obtain the semaphore. If the semaphore is not available
		// wait to see if it becomes free.
		if( get_binsem( &spi_binsem_g, SPI_BINSEM_WAITTICKS ) == 1 ) {

			spi_copy_spi_xact(&spi_xact_g, s);

			spi_caller_xact_g             = s;
			_spi_FnCallback_g             = xact_fn;

			// SPI control register setup
			S0SPCR = 0;
			S0SPCR = ((0x0                   << SPI_CR_BITENABLE) |
					(spi_xact_g.spi_cpha_val << SPI_CR_CPHA)      |
					(spi_xact_g.spi_cpol_val << SPI_CR_CPOL)      |
					(0x1                     << SPI_CR_MSTR)      |
					(spi_xact_g.spi_lsbf_val << SPI_CR_LSBF)      |
					(0x1                     << SPI_CR_SPIE));

			// Start the transaction
			SSEL_LOW;

			// read SPIF then write Data register to clear IF
			status_reg                = S0SPSR;
			S0SPDR                    = spi_xact_g.writebuf[i];
		} else {
			return false;
			//  uart0_putstring_intr("*** SPI-ERROR ***: spi_master_xact, Timed out waiting for spi_binsem_g. Skipping Request.\n");
		}
	} else {
		return false;
		//  uart0_putstring_intr("*** SPI-ERROR ***: spi_master_xact, structure pointer is NULL. Skipping.\n");
	}
	return true;
}

/*! \brief ISR for SPI Transaction
 *
 *  Interrupts happen when SPIF is high, cleared when:
 *    1: read of S0SPSR
 *    2: then read S0SPDR
 */
void spi_isr(void) {
	uint8_t status;

	status = S0SPSR;  // clear the SPIF first
	uint8_t  status_reg;
	uint8_t  data_reg;

	// read status  to clear IF
	status_reg = SPID.STATUS;

	// spi_process_status(&status_reg);  // write this later for collision, other error processing...

	switch(spi_status_g.xact_state) {
	case SPI_IDLE_ST:                      // one write has been done...SPI starts with write...
		spi_status_g.read_index   = 0;
		spi_status_g.write_index  = 1;

		if(spi_d_status.write_index < spi_d_xact.write_numbytes ) {
			spi_d_status.xact_state   = SPI_WRITE_ST;
			SPID.DATA = spi_d_xact.writebuf[spi_d_status.write_index] ;
			spi_d_status.write_index  += 1;
		} else {
			spi_d_status.xact_state = SPI_READ_ST;
			SPID.DATA = spi_d_xact.dummy_value;
		}
		break;
	case SPI_WRITE_ST:
		if(spi_d_status.write_index < spi_d_xact.write_numbytes) {
			if(spi_d_status.write_index < SPI_BUFFER_MAX) {
				spi_d_status.xact_state   = SPI_WRITE_ST;
				spi_d_status.write_index += 1;
				SPID.DATA                 = spi_d_xact.writebuf[spi_d_status.write_index] ;
			} else {
				spi_d_status.xact_state   = SPI_ERROR_ST;
				data_reg                  = SPID.DATA;
			}
		} else if (spi_d_status.read_index < spi_d_xact.read_numbytes) {      // get the first read byte.
			spi_d_xact.readbuf[spi_d_status.read_index] = SPID.DATA;
		spi_d_status.read_index                     += 1;
		spi_d_status.xact_state                     = SPI_READ_ST;
		} else {
			_spi_d_FnCallback(spi_d_caller_xact, &spi_d_xact);

			spi_d_status.read_index     = 0;
			spi_d_status.write_index    = 0;
			spi_d_status.xact_id        = SPI_IDLE;
			spi_d_status.xact_state     = SPI_IDLE_ST;
			spi_d_xact.dummy_value      = SPID.DATA;
			if((spi_d_xact.id == SPI_ACCEL_READ_REG) || (spi_d_xact.id == SPI_ACCEL_WRITE_REG))  {
				port_pin_high(&ACCEL_SPI_PORT, ACCEL_SCS_bm);
			}
		}
		break;
	case SPI_READ_ST:
		spi_d_xact.readbuf[spi_d_status.read_index] = SPID.DATA;
		spi_d_status.read_index                     += 1;
		if( spi_d_status.read_index < spi_d_xact.read_numbytes) {
			if(spi_d_status.read_index < SPI_BUFFER_MAX) {
				spi_d_status.xact_state              = SPI_READ_ST;
				SPID.DATA                            = spi_d_xact.dummy_value;    // drive another byte out of slave dev.
			} else {
				spi_d_status.xact_state              = SPI_ERROR_ST;
				data_reg                             = SPID.DATA;
			}
		} else {
			_spi_d_FnCallback(spi_d_caller_xact, &spi_d_xact);

			spi_d_status.read_index     = 0;
			spi_d_status.write_index    = 0;
			spi_d_status.xact_id        = SPI_IDLE;
			spi_d_status.xact_state     = SPI_IDLE_ST;
			spi_d_xact.dummy_value      = SPID.DATA;
			if((spi_d_xact.id == SPI_ACCEL_READ_REG) || (spi_d_xact.id == SPI_ACCEL_WRITE_REG))  {
				port_pin_high(&ACCEL_SPI_PORT, ACCEL_SCS_bm);
			}
		}
		break;
	case SPI_ERROR_ST:
		spi_d_status.read_index     = 0;
		spi_d_status.write_index    = 0;
		spi_d_status.xact_id        = SPI_ERROR;
		spi_d_status.xact_state     = SPI_ERROR_ST;
		break;
	default:
		spi_d_status.read_index     = 0;
		spi_d_status.write_index    = 0;
		spi_d_status.xact_id        = SPI_IDLE;
		spi_d_status.xact_state     = SPI_IDLE_ST;
		break;
	}

	VICAddress    = 0x0;
}


/*! \brief Poll on SPIF
 *
 * 200000000 count here is about 10 second wait at pclk 72Mhz?
 * Shouldn't hang here forever...
 * Alternative is to use interrupt instead of polling.
 */
void spi_waitSPIF() {
    uint32_t waitcount = 200000000;
    while ((spi_spif(S0SPSR)==false) && (waitcount > 0 )) {
        waitcount--;
    }
}

/*! \brief Start a polled transaction
 *
 * @param data
 * @param bits
 */
void spi_transact(uint16_t data, spi_xfernumbits bits) {

    // set number of bits to transfer.
    S0SPCR = ((S0SPCR & ~(0xf << SPI_CR_BITS)) | (bits << SPI_CR_BITS)) ;

    // this starts the transaction.
    S0SPDR = data;
}

/*! \brief Initialize the SPI Xact state structure
 *
 * @param s
 */
void spi_init_xact_status( spi_xact_status* s) {
    int i = 0;

    s->read_index           = 0;
    s->write_index          = 0;
    s->xact_id              = 0;
    s->xact_pending_count   = 0;
    s->xact_state           = SPI_IDLE_ST;
}

/*! SPI Master Mode initialization for interrupt based transactions
 *
 * @param scale
 * @param spifreq
 */
void spi_init_master_intr(pclk_scale scale, spi_freq spifreq) {
	  Freq                cclk;
	    uint32_t            spi_pclk = 0;
	    uint32_t            ccount;

	    FIO_ENABLE;

	    mam_enable();

	    SPI_PWR_ON;

	    init_binsem( &spi_binsem_g );
	    spi_init_xact_status()( &spi_s_g );

	    // cclk value
	    cclk = pllquery_cclk_mhz();

	    switch(scale) {
	        case CCLK_DIV1:
	            SPI_CLK_IS_CCLK_DIV1;
	            spi_pclk = cclk;
	            break;
	        case CCLK_DIV2:
	            SPI_CLK_IS_CCLK_DIV2;
	            spi_pclk = cclk/2;
	            break;
	        case CCLK_DIV4:
	            SPI_CLK_IS_CCLK_DIV4;
	            spi_pclk = cclk/4;
	            break;
	        case CCLK_DIV8:
	            SPI_CLK_IS_CCLK_DIV8;
	            spi_pclk = cclk/8;
	            break;
	        default:
	#ifdef DEBUG_SPI
	            printf_lpc(UART0,"Bad choice for scale value.\n");
	#endif
	            break;
	    }

	    PINSEL_SPI_SCK ;
	    PINMODE_SPI_SCK_NOPULL;

	    PINSEL_SPI_MISO ;
	    PINMODE_SPI_MISO_PULLUP ;

	    PINSEL_SPI_MOSI ;
	    PINMODE_SPI_MOSI_NOPULL ;

	    // SSEL for master mode.
	    PINSEL_SPI_MASTERM_SSEL_0 ;
	    PINMODE_SPI_SSEL_PULLUP ;
	    FIO_SPI_SSEL;

	    SSEL_HIGH;
	    SCK_HIGH;
	    MOSI_HIGH;

	    // no second device pin initialized.
	    // PINSEL_SPI_MASTERM_SSEL_1         // P1.0
	    // PINMODE_SPI_MASTERM_SSEL_1_NOPULL //
	    // FIO_SPI_SSEL_1;
	    // SSEL_1_HIGH;

	    // master mode, MSB first, 16 bits per transfer
	    S0SPCR = (0x1 << SPI_CR_MSTR) ;

	    ccount  = spi_pclk/spifreq;
	#ifdef DEBUG_SPI
	    if(ccount > 255) {
	        printf_lpc(UART0, "ccount is out of range for requested spi clock frequency %u\n", spifreq);
	    }
	#endif

	    if(ccount % 2)   ccount -= 1;  // must be even number

	    if(ccount < 8)   ccount = 8;   // min value for ccr (p 463, user manual.)
	    if(ccount > 254) ccount = 254; // max value for ccr

	    S0SPCCR                 = (uint8_t) ccount;



	#ifdef DEBUG_SPI
	    volatile uint8_t    spi_status;
	    spi_status              = spi_readstatus();
	    printf_lpc(UART0, "spi_status is %u\n", spi_status);

	    printf_lpc(UART0, "spi_pclk is %u\n", spi_pclk);
	    printf_lpc(UART0, "spifreq is  %u\n", spifreq);
	    printf_lpc(UART0, "S0SPCCR is  %u  for %u HZ\n", S0SPCCR, (spi_pclk/S0SPCCR));
	    printf_lpc(UART0, "S0SPCCR is  %u  for %u HZ\n", S0SPCCR, (spi_pclk/S0SPCCR));
	#endif

	VICVectAddr10 = (unsigned int) spi_isr;
	VICAddress    = 0x0;

}

/*! \brief SPI Master transaction for 16 bits.
 *
 * spi_init_master_MSB_16
 *
 * scale:    factor to divide cclk for spi peripheral
 * spifreq:  frequency to run SCLK.
 * example:  spi_init(CCLK_DIV8, SPI_100KHZ) ;
 *
 * master mode, MSB first, 16 bits per transfer
 *
 * PULLUP Configuration Default
 * MISO - PULLUP
 * MOSI - PULLUP
 * SCK  - PULLUP
 * SSEL - NONE
 *
 * Default Setting for SSEL is HIGH
 */
void spi_init_master_MSB_16(pclk_scale scale, spi_freq spifreq) {

    Freq                cclk;
    uint32_t            spi_pclk = 0;
    uint32_t            ccount;

    FIO_ENABLE;

    mam_enable();

    SPI_PWR_ON;

    init_binsem( &spi_binsem_g );
    spi_init_state( &spi_s_g );

    // cclk value
    cclk = pllquery_cclk_mhz();

    switch(scale) {
        case CCLK_DIV1:
            SPI_CLK_IS_CCLK_DIV1;
            spi_pclk = cclk;
            break;
        case CCLK_DIV2:
            SPI_CLK_IS_CCLK_DIV2;
            spi_pclk = cclk/2;
            break;
        case CCLK_DIV4:
            SPI_CLK_IS_CCLK_DIV4;
            spi_pclk = cclk/4;
            break;
        case CCLK_DIV8:
            SPI_CLK_IS_CCLK_DIV8;
            spi_pclk = cclk/8;
            break;
        default:
#ifdef DEBUG_SPI
            printf_lpc(UART0,"Bad choice for scale value.\n");
#endif
            break;
    }

    PINSEL_SPI_SCK ;
    PINMODE_SPI_SCK_NOPULL;

    PINSEL_SPI_MISO ;
    PINMODE_SPI_MISO_PULLUP ;

    PINSEL_SPI_MOSI ;
    PINMODE_SPI_MOSI_NOPULL ;

    // SSEL for master mode.
    PINSEL_SPI_MASTERM_SSEL_0 ;
    PINMODE_SPI_SSEL_PULLUP ;
    FIO_SPI_SSEL;

    SSEL_HIGH;
    SCK_HIGH;
    MOSI_HIGH;

    // no second device pin initialized.
    // PINSEL_SPI_MASTERM_SSEL_1         // P1.0
    // PINMODE_SPI_MASTERM_SSEL_1_NOPULL //
    // FIO_SPI_SSEL_1;
    // SSEL_1_HIGH;

    // master mode, MSB first, 16 bits per transfer
    S0SPCR = (0x1 << SPI_CR_BITENABLE) | (0x1 << SPI_CR_MSTR) | (SPI_16BITS << SPI_CR_BITS);

    ccount  = spi_pclk/spifreq;
#ifdef DEBUG_SPI
    if(ccount > 255) {
        printf_lpc(UART0, "ccount is out of range for requested spi clock frequency %u\n", spifreq);
    }
#endif

    if(ccount % 2)   ccount -= 1;  // must be even number

    if(ccount < 8)   ccount = 8;   // min value for ccr (p 463, user manual.)
    if(ccount > 254) ccount = 254; // max value for ccr

    S0SPCCR                 = (uint8_t) ccount;



#ifdef DEBUG_SPI
    volatile uint8_t    spi_status;
    spi_status              = spi_readstatus();
    printf_lpc(UART0, "spi_status is %u\n", spi_status);

    printf_lpc(UART0, "spi_pclk is %u\n", spi_pclk);
    printf_lpc(UART0, "spifreq is  %u\n", spifreq);
    printf_lpc(UART0, "S0SPCCR is  %u  for %u HZ\n", S0SPCCR, (spi_pclk/S0SPCCR));
    printf_lpc(UART0, "S0SPCCR is  %u  for %u HZ\n", S0SPCCR, (spi_pclk/S0SPCCR));
#endif

}

