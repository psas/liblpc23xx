
/*
 * lpc23xx-spi.c
 */

#include <stdint.h>
#include <stdlib.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"
#include "lpc23xx-vic.h"

#include "lpc23xx-spi.h"


/*
 * spi_init
 * scale:   factor to divide cclk for spi peripheral
 * spifreq: frequency to run SCLK. 
 * example:  spi_init(CCLK_DIV8, SPI_100KHZ) ;
 */
void spi_init(pclk_scale scale, spi_freq spifreq) {

    Freq     cclk;
    uint32_t spi_pclk = 0;
    uint32_t ccount;

    FIO_ENABLE;

    mam_enable();

    SPI_PWR_ON;

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
            while(1);  // not a valid choice, stop.
            break;
    }

    PINSEL_SPI_SCK ;
    PINMODE_SPI_SCK_NOPULL ;

    PINSEL_SPI_MISO ;
    PINMODE_SPI_MISO_NOPULL ;

    PINSEL_SPI_MOSI ;
    PINMODE_SPI_MOSI_NOPULL ;

    // SSEL for master mode.
    PINSEL_SPI_MASTERM_SSEL_0 ;
    PINMODE_SPI_SSEL_NOPULL ;
    FIO_SPI_SSEL;
    SSEL_1_HIGH;

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

    if(ccount % 2) ccount -= 1; // must be even number

    if(ccount > 254) ccount = 254; // max value for ccr

    S0SPCCR = (uint8_t) ccount;

#ifdef DEBUG_SPI
    printf_lpc(UART0, "spi_pclk is %u\n", spi_pclk);
    printf_lpc(UART0, "spifreq is  %u\n", spifreq);
    printf_lpc(UART0, "S0SPCCR is  %u  for %u HZ\n", S0SPCCR, (spi_pclk/S0SPCCR));
#endif

}

/*
 * spi_waitSPIF
 */
void spi_waitSPIF() {

}


typedef enum {SPI_8BITS=8, SPI_16BITS...} spi_numbits ;
/*
 * spi_transfer_size
 */
void spi_transfer_size(spi_numbits bits) {


}


