
/*
 * lpc23xx-spi.h
 */

#ifndef _LPC23XX_SPI_H
#define _LPC23XX_SPI_H

#define 	PCONP_PCSPI       8

#define     SPI_PWR_ON        (PCONP = (PCONP |  (1<<PCONP_PCSPI)))
#define     SPI_PWR_OFF       (PCONP = (PCONP & ~(1<<PCONP_PCSPI)))



#define     SPI_ENABLE        (AD0CR = (AD0CR |  (1 << AD0CR_PDN)))
#define     SPI_DISABLE       (AD0CR = (AD0CR & ~(1 << AD0CR_PDN)))


#endif
