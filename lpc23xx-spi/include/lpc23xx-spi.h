/*! \file lpc23xx-spi.h
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

#ifndef _LPC23XX_SPI_H
#define _LPC23XX_SPI_H

/*! \ingroup lpc23xx-spi
 *
 * @{
 */

#include <stdbool.h>

#include "lpc23xx.h"
#include "lpc23xx-types.h"

#include "lpc23xx-binsem.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-util.h"

#define     SPI_MAX_BUFFER              64

#define     FN_SCK_PINSEL0              0b11
#define     FN_MISO_PINSEL1             0b11
#define     FN_MOSI_PINSEL1             0b11
#define     FN_SSEL_PINSEL1             0b11

#define     P0_15_PINSEL0                 30
#define     P0_16_PINSEL1                  0
#define     P0_17_PINSEL1                  2
#define     P0_18_PINSEL1                  4

//P0.15
#define     PINSEL_SPI_SCK             (PINSEL0  = (PINSEL0  & ~(0x3 << P0_15_PINSEL0)) | (FN_SCK_PINSEL0  << P0_15_PINSEL0))
#define     PINMODE_SPI_SCK_NOPULL     (PINMODE0 = (PINMODE0 & ~(0x3 << P0_15_PINSEL0)) | (P0_NOPULL_MODE  << P0_15_PINSEL0))
#define     PINMODE_SPI_SCK_PULLUP     (PINMODE0 = (PINMODE0 & ~(0x3 << P0_15_PINSEL0)) | (P0_PULLUP_MODE  << P0_15_PINSEL0))

//P0.17
#define     PINSEL_SPI_MISO            (PINSEL1  = (PINSEL1  & ~(0x3 << P0_17_PINSEL1)) | (FN_MISO_PINSEL1 << P0_17_PINSEL1))
#define     PINMODE_SPI_MISO_NOPULL    (PINMODE1 = (PINMODE1 & ~(0x3 << P0_17_PINSEL1)) | (P0_NOPULL_MODE  << P0_17_PINSEL1))
#define     PINMODE_SPI_MISO_PULLUP    (PINMODE1 = (PINMODE1 & ~(0x3 << P0_17_PINSEL1)) | (P0_PULLUP_MODE  << P0_17_PINSEL1))

//P0.18
#define     PINSEL_SPI_MOSI            (PINSEL1  = (PINSEL1  & ~(0x3 << P0_18_PINSEL1)) | (FN_MOSI_PINSEL1 << P0_18_PINSEL1))
#define     PINMODE_SPI_MOSI_NOPULL    (PINMODE1 = (PINMODE1 & ~(0x3 << P0_18_PINSEL1)) | (P0_NOPULL_MODE  << P0_18_PINSEL1))
#define     PINMODE_SPI_MOSI_PULLUP    (PINMODE1 = (PINMODE1 & ~(0x3 << P0_18_PINSEL1)) | (P0_PULLUP_MODE  << P0_18_PINSEL1))

// P0.16 is SSEL, use as GPIO in master mode SPI
#define     PINSEL_SPI_SLAVEM_SSEL     (PINSEL1  = (PINSEL1  & ~(0x3 << P0_16_PINSEL1)) | (FN_SSEL_PINSEL1 << P0_16_PINSEL1 ))
#define     PINSEL_SPI_MASTERM_SSEL_0  (PINSEL1  = (PINSEL1  & ~(0x3 << P0_16_PINSEL1)))
#define     PINMODE_SPI_SSEL_NOPULL    (PINMODE1 = (PINMODE1 & ~(0x3 << P0_16_PINSEL1)) | (P0_NOPULL_MODE  << P0_16_PINSEL1 ))
#define     PINMODE_SPI_SSEL_PULLUP    (PINMODE1 = (PINMODE1 & ~(0x3 << P0_16_PINSEL1)) | (P0_PULLUP_MODE  << P0_16_PINSEL1 ))

#define     FIO_UNMASK_SSEL            (FIO0MASK = (FIO0MASK & ~(1<<16)))
#define     FIO_SPI_SSEL               (FIO0DIR |= (1<<16))

#define     SSEL_HIGH                  (FIO0SET |= (1<<16))
#define     SSEL_LOW                   (FIO0CLR |= (1<<16))
#define     SCK_HIGH                   (FIO0SET |= (1<<15))
#define     MOSI_HIGH                  (FIO0SET |= (1<<18))

// P1.0  is for a second device in master mode SPI
#define     PINSEL_SPI_MASTERM_SSEL_1            (PINSEL1  =  (PINSEL2 & ~(0x11)    ) | (0x00))
#define     PINMODE_SPI_MASTERM_SSEL_1_NOPULL    (PINMODE2 = (PINMODE2 & ~(0x3))      | (0x2 ))
#define     FIO_SPI_SSEL_1                       (FIO1DIR |= 0x1)
#define     SSEL_1_HIGH                          (FIO1SET |= 0x1)
#define     SSEL_1_LOW                           (FIO1CLR |= 0x1)

#define     PCONP_PCSPI                8

#define     SPI_PWR_ON                 (PCONP = (PCONP |  (1<<PCONP_PCSPI)))
#define     SPI_PWR_OFF                (PCONP = (PCONP & ~(1<<PCONP_PCSPI)))

// Clock
#define     PCLKSEL0_PCLK_SPI          16

#define     SPI_CLK_IS_CCLK_DIV1       ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_SPI)) |(0x1 << PCLKSEL0_PCLK_SPI)) )
#define     SPI_CLK_IS_CCLK_DIV2       ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_SPI)) |(0x2 << PCLKSEL0_PCLK_SPI)) )
#define     SPI_CLK_IS_CCLK_DIV4       ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_SPI)) |(0x0 << PCLKSEL0_PCLK_SPI)) )
#define     SPI_CLK_IS_CCLK_DIV8       ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_SPI)) |(0x3 << PCLKSEL0_PCLK_SPI)) )

// spi control register
#define     SPI_CR_BITENABLE           2
#define     SPI_CR_CPHA                3
#define     SPI_CR_CPOL                4
#define     SPI_CR_MSTR                5
#define     SPI_CR_LSBF                6
#define     SPI_CR_SPIE                7
#define     SPI_CR_BITS                8

// spi status register
#define     SPI_SR_ABRT                3
#define     SPI_SR_MODF                4
#define     SPI_SR_ROVR                5
#define     SPI_SR_WCOL                6
#define     SPI_SR_SPIF                7

// spi interrupt register
#define     SPI_IR_IF                  0

#define     SPI_BINSEM_WAITTICKS       25000

#define     VIC_SPI_BIT                10

#define     ENABLE_SPI_INT             (VICIntEnable = (VICIntEnable | (1<<VIC_SPI_BIT)))
#define     DISABLE_SPI_INT            (VICIntEnable = (VICIntEnable & ~(1<<VIC_SPI_BIT)))

#define     SPI_DEFAULT_DUMMY_DATA     0xFF
#define     SPI_DEFAULT_XACT_ID        0xFF

typedef enum {
	SPI_50KHZ =50000,
    SPI_100KHZ=100000,
    SPI_250KHZ=250000,
    SPI_500KHZ=500000
} spi_freq;

// lpc23xx_um v3 p462
typedef enum {
	SPI_8BITS =0x8,
    SPI_9BITS =0x9,
    SPI_10BITS=0xa,
    SPI_11BITS=0xb,
    SPI_12BITS=0xc,
    SPI_13BITS=0xd,
    SPI_14BITS=0xe,
    SPI_15BITS=0xf,
    SPI_16BITS=0x0
} spi_xfernumbits;

typedef enum {
	SPI_SCK_FIRST_CLK=0,
	SPI_SCK_SECOND_CLK
} spi_cpha;

typedef enum {
	SPI_SCK_ACTIVE_LOW=0,
	SPI_SCK_ACTIVE_HIGH
} spi_cpol;

typedef enum {
	SPI_DATA_MSB_FIRST=0,
	SPI_SCK_LSB_FIRST
} spi_lsbf;

typedef enum {
    SPI_IDLE_ST=0,
    SPI_WRITE_ST,
    SPI_READ_ST,
    SPI_ERROR_ST
} spi_state;

typedef uint8_t       spi_xact_id;
typedef uint8_t       spi_pending_count;

//! Use this to set up a SPI transfer
typedef struct _spi_master_xact {
	spi_cpha          spi_cpha_val;
    spi_cpol          spi_cpol_val;
    spi_lsbf          spi_lsbf_val;

    uint8_t           write_numbytes;
    uint8_t           read_numbytes;
    uint8_t           dummy_value;
    uint8_t           writebuf[SPI_MAX_BUFFER];
    uint8_t           readbuf[SPI_MAX_BUFFER];
    spi_xact_id       id;
} spi_master_xact_data;

//! Use this to track a SPI transfer
typedef struct _spi_xact_status {
    uint8_t           read_index;
    uint8_t           write_index;
    spi_state         xact_state;
    spi_pending_count xact_pending_count;
    spi_xact_id       xact_id;
} spi_xact_status;

typedef void (*SPI_XACT_FnCallback) (spi_master_xact_data* caller, spi_master_xact_data* spi_return);

void       spi_isr(void) __attribute__ ((interrupt("IRQ"), optimize("00") ));

void       spi_waitSPIF();
void       spi_transact(uint16_t data, spi_xfernumbits bits);

void       spi_init_master_xact_data(spi_master_xact_data* s) ;

void       spi_init_master_intr(pclk_scale scale, spi_freq spifreq) ;
void       spi_init_master_MSB_16(pclk_scale scale, spi_freq spifreq);

bool       start_spi_master_xact_intr(spi_master_xact_data* s, SPI_XACT_FnCallback xact_fn) ;

//! @}

#endif
