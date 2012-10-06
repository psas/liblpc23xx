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
#include "lpc23xx-power.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"
#include "lpc23xx-vic.h"

#include "lpc23xx-spi.h"

static SPI_XACT_FnCallback        _spi_FnCallback_g = NULL;

bin_semaphore                     spi_binsem_g;

spi_xact_status                   spi_status_g;

spi_master_xact_data              spi_xact_g;
spi_master_xact_data*             spi_caller_xact_g;
static bool                       spi_rel_binsem_g = false;
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
static uint8_t spi_readstatus() {
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

/*! \brief Initialize the SPI Xact state structure
 *
 * @param s
 */
static void spi_init_xact_status( spi_xact_status* s) {

	s->read_index           = 0;
	s->write_index          = 0;
	s->xact_id              = SPI_DEFAULT_XACT_ID;
	s->xact_state           = SPI_IDLE_ST;
	s->xact_pending_count   = 0;
}

static void spi_copy_spi_xact(spi_master_xact_data *to, spi_master_xact_data* from) {
	uint8_t i = 0;

	to->spi_cpha_val        = from->spi_cpha_val;
	to->spi_cpol_val        = from->spi_cpol_val;
	to->spi_lsbf_val        = from->spi_lsbf_val;
	to->dummy_value         = from->dummy_value;
	to->id                  = from->id;
	to->read_numbytes       = from->read_numbytes;
	to->write_numbytes      = from->write_numbytes;
	to->cb_data             = from->cb_data;
	to->success             = from->success;

	for (i=0; i< (to->write_numbytes); ++i) {
		to->writebuf[i] = from->writebuf[i];
	}
	for (i=0; i< SPI_MAX_BUFFER; ++i) {
		to->readbuf[i]  = 0;
	}
}


/*! \brief initialize the data structure for a transaction.
 *
 * @param s
 *
 * The default is SPI MODE 3 (rising edge sclk, sclk active low, MSB)
 */
void spi_init_master_xact_data(spi_master_xact_data* s) {
	uint16_t   i = 0;

	s->spi_cpha_val        = SPI_SCK_FIRST_CLK;
	s->spi_cpol_val        = SPI_SCK_ACTIVE_LOW;
	s->spi_lsbf_val        = SPI_DATA_MSB_FIRST;
	s->dummy_value         = 0xaa;
	s->id                  = 0xff;
	s->read_numbytes       = 0;
	s->write_numbytes      = 0;
	s->cb_data             = NULL;
	s->success             = true;

	for (i=0; i< SPI_MAX_BUFFER; ++i) {
		s->writebuf[i] = 0;
	}
	for (i=0; i< SPI_MAX_BUFFER; ++i) {
		s->readbuf[i]  = 0;
	}
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

    printf_lpc(UART0, "%s: Called\r\n", __func__);

	FIO_ENABLE;

	mam_enable();

	POWER_ON(PCSPI);

	init_binsem( &spi_binsem_g );
	spi_init_xact_status( &spi_status_g );

	SET_PCLK(PCLK_SPI, CCLK_DIV1);
	// cclk value
	cclk = pllquery_cclk_mhz();

	switch(scale) {
	case CCLK_DIV1:
		spi_pclk = cclk;
		break;
	case CCLK_DIV2:
		spi_pclk = cclk/2;
		break;
	case CCLK_DIV4:
		spi_pclk = cclk/4;
		break;
	case CCLK_DIV8:
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

	VICVectPriority10 = 0x5;
	VICVectAddr10     = (unsigned int) spi_isr;
	VICAddress        = 0x0;
	DISABLE_SPI_INT;
}

/*!\ Brief Start a SPI interrupt based transaction
 *
 * @param s         Pointer to a structure with xact information
 * @param xact_fn   Pointer to a function to call at end of xaction
 */
bool start_spi_master_xact_intr(spi_master_xact_data* s, SPI_XACT_FnCallback xact_fn) {

	uint8_t  status_reg;

	_spi_FnCallback_g        = xact_fn;

	if(s!=NULL) {
		// bounds check on transaction
		if((s->write_numbytes >= SPI_MAX_BUFFER) || (s->read_numbytes >= SPI_MAX_BUFFER)) {
			return false;
		}

		// See if we can obtain the semaphore. If the semaphore is not available
		// wait to see if it becomes free.
		if( get_binsem( &spi_binsem_g, SPI_BINSEM_WAITTICKS ) == 1 ) {
			DISABLE_SPI_INT;

			spi_rel_binsem_g = false;

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
			S0SPDR                    = spi_xact_g.writebuf[0];
		} else {
			return false;
			//  uart0_putstring_intr("*** SPI-ERROR ***: spi_master_xact, Timed out waiting for spi_binsem_g. Skipping Request.\n");
		}
	} else {
		return false;
		//  uart0_putstring_intr("*** SPI-ERROR ***: spi_master_xact, structure pointer is NULL. Skipping.\n");
	}
	ENABLE_SPI_INT;
	return true;
}

/*! \brief ISR for SPI Transaction
 *
 *  Interrupts happen when SPIF is high, cleared when:
 *    1: read of S0SPSR
 *    2: then read S0SPDR
 */
void spi_isr(void) {

	uint8_t  status_reg = 0;
	uint8_t  data_reg   = 0;

	// read status  to clear IF
	status_reg = spi_readstatus();

	switch(spi_status_g.xact_state) {
	case SPI_IDLE_ST:                      // one write has been done...SPI starts with write...
		spi_status_g.read_index   = 0;
		spi_status_g.write_index  = 1;

		if(spi_status_g.write_index < spi_xact_g.write_numbytes ) {
			spi_status_g.xact_state   = SPI_WRITE_ST;
			S0SPDR = spi_xact_g.writebuf[spi_status_g.write_index] ;
			spi_status_g.write_index  += 1;
		} else {
			spi_status_g.xact_state = SPI_READ_ST;
			S0SPDR = spi_xact_g.dummy_value;
		}
		break;
	case SPI_WRITE_ST:
		if(spi_status_g.write_index < spi_xact_g.write_numbytes) {
			if(spi_status_g.write_index < SPI_MAX_BUFFER) {
				spi_status_g.xact_state   = SPI_WRITE_ST;
				spi_status_g.write_index += 1;
				S0SPDR                    = spi_xact_g.writebuf[spi_status_g.write_index] ;
			} else {
				spi_status_g.xact_state   = SPI_ERROR_ST;
				data_reg                  = S0SPDR;
			}
		} else if (spi_status_g.read_index < spi_xact_g.read_numbytes) {      // get the first read byte.
			spi_xact_g.readbuf[spi_status_g.read_index] = S0SPDR;
			spi_status_g.read_index                     += 1;
			spi_status_g.xact_state                     = SPI_READ_ST;
		} else {
			_spi_FnCallback_g(spi_caller_xact_g, &spi_xact_g, NULL);

			spi_status_g.read_index     = 0;
			spi_status_g.write_index    = 0;
			spi_status_g.xact_id        = SPI_DEFAULT_XACT_ID;
			spi_status_g.xact_state     = SPI_IDLE_ST;

			spi_xact_g.dummy_value      = SPI_DEFAULT_DUMMY_DATA;
			data_reg                    = S0SPDR;
			SSEL_HIGH;
			spi_xact_g.success          = true;
			spi_rel_binsem_g            = true;
		}
		break;
	case SPI_READ_ST:
		spi_xact_g.readbuf[spi_status_g.read_index] = S0SPDR;
		spi_status_g.read_index                     += 1;
		if( spi_status_g.read_index < spi_xact_g.read_numbytes) {
			if(spi_status_g.read_index < SPI_MAX_BUFFER) {
				spi_status_g.xact_state              = SPI_READ_ST;
				S0SPDR                               = spi_xact_g.dummy_value;    // drive another byte out of slave dev.
			} else {
				spi_status_g.xact_state              = SPI_ERROR_ST;
				data_reg                             = S0SPDR;
			}
		} else {
			_spi_FnCallback_g(spi_caller_xact_g, &spi_xact_g, NULL);

			spi_status_g.read_index     = 0;
			spi_status_g.write_index    = 0;
			spi_status_g.xact_id        = SPI_DEFAULT_XACT_ID;
			spi_status_g.xact_state     = SPI_IDLE_ST;

			spi_xact_g.dummy_value      = SPI_DEFAULT_DUMMY_DATA;
			data_reg                    = S0SPDR; // access data_reg to clear S0SPSR SPIF
			SSEL_HIGH;
			spi_xact_g.success          = true;
			spi_rel_binsem_g            = true;
		}
		break;
	case SPI_ERROR_ST:  // must rerun init spi
		spi_status_g.read_index     = 0;
		spi_status_g.write_index    = 0;
		spi_status_g.xact_id        = SPI_DEFAULT_XACT_ID;
		spi_status_g.xact_state     = SPI_ERROR_ST;
		spi_xact_g.success          = false;
		spi_rel_binsem_g            = true;
		break;
	default:  // this should never really happen.
		spi_status_g.read_index     = 0;
		spi_status_g.write_index    = 0;
		spi_status_g.xact_id        = SPI_DEFAULT_XACT_ID;
		spi_status_g.xact_state     = SPI_IDLE_ST;
		spi_xact_g.success          = false;
		spi_rel_binsem_g            = true;
		break;
	}
	S0SPINT       = (0x1 << SPI_IR_IF);   // clear int flag in INT register.
	VICAddress    = 0x0;
	if(spi_rel_binsem_g) {
		release_binsem(&spi_binsem_g);
	}
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

    POWER_ON(PCSPI);

	init_binsem( &spi_binsem_g );
	SET_PCLK(PCLK_SPI, scale);

	// cclk value
	cclk = pllquery_cclk_mhz();

    switch(scale) {
        case CCLK_DIV1:
            spi_pclk = cclk;
            break;
        case CCLK_DIV2:
            spi_pclk = cclk/2;
            break;
        case CCLK_DIV4:
            spi_pclk = cclk/4;
            break;
        case CCLK_DIV8:
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

