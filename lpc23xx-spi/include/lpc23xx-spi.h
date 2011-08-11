
/*
 * lpc23xx-spi.h
 */

#ifndef _LPC23XX_SPI_H
#define _LPC23XX_SPI_H

#include "lpc23xx.h"
#include "lpc23xx-types.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-util.h"

//P0.15
#define     PINSEL_SPI_SCK             (PINSEL0  = (PINSEL0  & ~(0x3 << 30)) | (0x3 << 30))
#define     PINMODE_SPI_SCK_NOPULL     (PINMODE0 = (PINMODE0 & ~(0x3 << 30)) | (0x2 << 30))

//P0.17
#define     PINSEL_SPI_MISO            (PINSEL1  = (PINSEL1  & ~(0x3 << 2)) | (0x3 << 2))
#define     PINMODE_SPI_MISO_NOPULL    (PINMODE1 = (PINMODE1 & ~(0x3 << 2)) | (0x2 << 2))

//P0.18
#define     PINSEL_SPI_MOSI            (PINSEL1  = (PINSEL1  & ~(0x3 << 4)) | (0x3 << 4))
#define     PINMODE_SPI_MOSI_NOPULL    (PINMODE1 = (PINMODE1 & ~(0x3 << 4)) | (0x2 << 4))

// P0.16 is SSEL, use as GPIO in master mode SPI
#define     PINSEL_SPI_SLAVEM_SSEL     (PINSEL1  = (PINSEL1  & ~(0x3)     ) | (0x3))
#define     PINSEL_SPI_MASTERM_SSEL_0  (PINSEL1  = (PINSEL1  & ~(0x3)     ) )
#define     PINMODE_SPI_SSEL_NOPULL    (PINMODE1  = (PINMODE1 & ~(0x3))     | (0x2 ))

#define     FIO_SPI_SSEL               (FIO0DIR |= (1<<16))
#define     SSEL_HIGH                  (FIO0SET |= (1<<16))
#define     SSEL_LOW                   (FIO0CLR |= (1<<16))

// P1.0  is for a second device in master mode SPI
#define     PINSEL_SPI_MASTERM_SSEL_1            (PINSEL1 =  (PINSEL2 & ~(0x11)     ) | (0x00))
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

#define     SPI_ENABLE                 (AD0CR = (AD0CR |  (1 << AD0CR_PDN)))
#define     SPI_DISABLE                (AD0CR = (AD0CR & ~(1 << AD0CR_PDN)))

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

typedef enum {SPI_50KHZ=50000,
    SPI_100KHZ=100000,
    SPI_250KHZ=250000,
    SPI_500KHZ=500000} spi_freq;

// lpc23xx_um v3 p462
typedef enum {SPI_8BITS =0x8,
    SPI_9BITS =0x9,
    SPI_10BITS=0xa,
    SPI_11BITS=0xb,
    SPI_12BITS=0xc,
    SPI_13BITS=0xd,
    SPI_14BITS=0xe,
    SPI_15BITS=0xf,
    SPI_16BITS=0x0} spi_xfernumbits ;

uint8_t    spi_readstatus();

void       spi_waitSPIF() ;
void       spi_transact(uint16_t data, spi_xfernumbits bits) ;
void       spi_init_master_MSB_16(pclk_scale scale, spi_freq spifreq) ;


#endif
