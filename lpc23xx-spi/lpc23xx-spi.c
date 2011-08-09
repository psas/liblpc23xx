
/*
 * lpc23xx-spi.c
 */

#include <stdint.h>
#include <stdlib.h>
#include "lpc23xx.h"
#include "lpc23xx-types.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"
#include "lpc23xx-vic.h"

#include "lpc23xx-spi.h"

/*
 * spi_abrt
 */
inline BOOL spi_abrt(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_ABRT)) >> SPI_SR_ABRT) );
}


/*
 * spi_modf
 */
inline BOOL spi_modf(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_MODF)) >> SPI_SR_MODF) );
}

/*
 * spi_rovr
 */
inline BOOL spi_rovr(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_ROVR)) >> SPI_SR_ROVR) );
}

/*
 * spi_wcol
 */
inline BOOL spi_wcol(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_WCOL)) >> SPI_SR_WCOL) );
}

/*
 * spi_spif
 */
inline BOOL spi_spif(uint8_t spi_status) {
    return( ((spi_status & (0x1 << SPI_SR_SPIF)) >> SPI_SR_SPIF) );
}

/*
 * spi_status
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


/*
 * spi_waitSPIF
 * 200000000 count here is about 10 second wait at pclk 72Mhz?
 * Shouldn't hang here forever...
 * Alternative is to use interrupt instead of polling.
 */
void spi_waitSPIF() {
    uint32_t waitcount = 200000000;
    while ((spi_spif(S0SPSR)==FALSE) && (waitcount > 0 )) {
        waitcount--;
    }
   // printf_lpc(UART0, "spi_spif count is: %u\n",waitcount);
}

/*
 * spi_transact
 */
void spi_transact(uint16_t data, spi_xfernumbits bits) {

    // set number of bits to transfer.
    S0SPCR = ((S0SPCR & ~(0xf << SPI_CR_BITS)) | (bits << SPI_CR_BITS)) ;
    S0SPDR = data; // this starts transaction.

}

/*
 * spi_init
 * scale:   factor to divide cclk for spi peripheral
 * spifreq: frequency to run SCLK. 
 * example:  spi_init(CCLK_DIV8, SPI_100KHZ) ;
 */
void spi_init(pclk_scale scale, spi_freq spifreq) {

    Freq                cclk;
    uint32_t            spi_pclk = 0;
    uint32_t            ccount;
    volatile uint8_t    spi_status;

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
    SSEL_HIGH;

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

    if(ccount % 2) ccount   -= 1; // must be even number

    if(ccount > 254) ccount = 254; // max value for ccr

    S0SPCCR                 = (uint8_t) ccount;


    spi_status              = spi_readstatus();
#ifdef DEBUG_SPI

    printf_lpc(UART0, "spi_status is %u\n", spi_status);

    printf_lpc(UART0, "spi_pclk is %u\n", spi_pclk);
    printf_lpc(UART0, "spifreq is  %u\n", spifreq);
    printf_lpc(UART0, "S0SPCCR is  %u  for %u HZ\n", S0SPCCR, (spi_pclk/S0SPCCR));
    printf_lpc(UART0, "S0SPCCR is  %u  for %u HZ\n", S0SPCCR, (spi_pclk/S0SPCCR));
#endif

}

