
/*
 * lpc23xx-spi.h
 */

#ifndef _LPC23XX_SPI_H
#define _LPC23XX_SPI_H

PINSEL_ADC0_1(PINSEL1  = (PINSEL1 & ~(0x3 << 16)) | (0x01 << 16))

#define     PINSEL_SPI_SCK    (PINSEL0 & ~(0x0030
#define 	PCONP_PCSPI       8

#define     SPI_PWR_ON        (PCONP = (PCONP |  (1<<PCONP_PCSPI)))
#define     SPI_PWR_OFF       (PCONP = (PCONP & ~(1<<PCONP_PCSPI)))

// Clock
#define     PCLKSEL0_PCLK_SPI     16

#define     SPI_CLK_IS_CCLK_DIV1  ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_SPI)) |(0x1 << PCLKSEL0_PCLK_SPI)) )
#define     SPI_CLK_IS_CCLK_DIV2  ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_SPI)) |(0x2 << PCLKSEL0_PCLK_SPI)) )
#define     SPI_CLK_IS_CCLK_DIV4  ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_SPI)) |(0x0 << PCLKSEL0_PCLK_SPI)) )
#define     SPI_CLK_IS_CCLK_DIV8  ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_SPI)) |(0x3 << PCLKSEL0_PCLK_SPI)) )

#define     SPI_ENABLE        (AD0CR = (AD0CR |  (1 << AD0CR_PDN)))
#define     SPI_DISABLE       (AD0CR = (AD0CR & ~(1 << AD0CR_PDN)))


#endif
