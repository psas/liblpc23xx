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

SPI_XACT_FnCallback*      _spi_FnCallback_g;

bin_semaphore             spi_binsem_g;

spi_master_xact_t         spi_s_g;

spi_master_xact_t*        spi_s_caller_g;

static uint16_t           spi_wbytes_total;
static uint16_t           spi_rbytes_total;

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


/*!\ Brief Start a SPI interrupt based transaction
 *
 * @param s         Pointer to a structure with xact information
 * @param xact_fn   Pointer to a function to call at end of xaction
 */
void start_spi_master_xact_intr(spi_master_xact_t* s, SPI_XACT_FnCallback* xact_fn) {

    uint16_t i;
    spi_wbytes_total = 0;
    spi_rbytes_total = 0;
    if(s!=NULL) {
        // See if we can obtain the semaphore. If the semaphore is not available
        // wait SPI_BINSEM_WAIT msecs to see if it becomes free.
        if( get_binsem( &spi_binsem_g, SPI_BINSEM_WAITTICKS ) == 1 ) {
        	spi_s_g.spi_numbits           = s->spi_numbits;
        	spi_s_g.spi_dummyval          = s->spi_dummyval;
        	spi_s_g.tag                   = s->tag;
            for(i=0; i<s->write_length; ++i) {
                spi_s_g.spi_tx_buffer[i]  = s->spi_tx_buffer[i];
            }
            for(i=0; i<s->read_length; ++i) {
                spi_s_g.spi_rd_buffer[i]  = s->spi_rd_buffer[i];
            }
            spi_s_g.write_length          = s->write_length;
            spi_s_g.read_length           = s->read_length;
            spi_s_g.spi_cpha_val          = s->spi_cpha_val;
            spi_s_g.spi_cpol_val          = s->spi_cpol_val;
            spi_s_g.spi_lsbf_val          = s->spi_lsbf_val;
            spi_s_g.xact_active           = 1;
            spi_s_g.xact_success          = 0;
            s->xact_active                = 1;
            s->xact_success               = 0;
            spi_s_caller_g                = s;
            _spi_FnCallback_g             = xact_fn;

            S0SPCR = (S0SPCR  |  (0x1 << SPI_CR_BITENABLE));

            S0SPCR = ((S0SPCR & ~(0x1 << SPI_CR_CPHA)) | (spi_s_g.spi_cpha_val    << SPI_CR_CPHA));
            S0SPCR = ((S0SPCR & ~(0x1 << SPI_CR_CPOL)) | (spi_s_g.spi_cpol_val    << SPI_CR_CPOL));
            S0SPCR = (S0SPCR  |  (0x1 << SPI_CR_MSTR));
            S0SPCR = ((S0SPCR & ~(0x1 << SPI_CR_LSBF)) | (spi_s_g.spi_lsbf_val    << SPI_CR_CPOL));
            S0SPCR = (S0SPCR  |  (0x1 << SPI_CR_SPIE));
            S0SPCR = ((S0SPCR & ~(0xf << SPI_CR_BITS)) | (spi_s_g.spi_numbits     << SPI_CR_BITS));

            // Start the transaction
            ++spi_wbytes_total;
            spi_s_g.xact_active = 1;
            S0SPDR                        = spi_s_g.spi_tx_buffer[0];
        } else {
          //  uart0_putstring_intr("*** SPI-ERROR ***: spi_master_xact, Timed out waiting for spi_binsem_g. Skipping Request.\n");
        }
    } else {
      //  uart0_putstring_intr("*** SPI-ERROR ***: spi_master_xact, structure pointer is NULL. Skipping.\n");
    }
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

	if(spi_wbytes_total < spi_s_g.write_length) {
		S0SPDR = spi_s_g.spi_tx_buffer[spi_wbytes_total];
		++spi_wbytes_total;
	} else if (spi_rbytes_total<spi_s_g.read_length) {
		spi_s_g.spi_rd_buffer[spi_rbytes_total] = S0SPDR;
		++spi_rbytes_total;
		S0SPDR = spi_s_g.spi_dummyval;  // trigger another read...
	} else {
		_spi_FnCallback_g( spi_s_caller_g, &spi_s_g );
		spi_s_g.xact_active = 0;
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
void spi_init_state( spi_master_xact_t* s) {
    int i = 0;

    s->tag                  = SPI_READ;
    s->spi_dummyval         = 0xFF;
    for(i=0; i<SPI_MAX_BUFFER; i++) {
        s->spi_tx_buffer[i] = 0;
        s->spi_rd_buffer[i] = 0;
    }
    s->write_length          = 0x0;
    s->read_length           = 0x0;
    s->xact_active           = 0x0;
    s->xact_success          = 0x0;
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
 * \todo Discuss whether this is a good or bad idea.
 *
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
    PINMODE_SPI_SCK_NOPULL ;

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
    S0SPCR = (0x1 << SPI_CR_BITENABLE) | (0x1 << SPI_CR_MSTR) | (0x0 << SPI_CR_BITS);

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

    VICVectAddr10 = (unsigned int) spi_isr;
    VICAddress    = 0x0;

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

