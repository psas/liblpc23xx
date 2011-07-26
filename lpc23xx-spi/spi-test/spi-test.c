
/*
 * spi-test.c
 */

#include <stdint.h>

#include "lpc23xx.h"
#include "lpc23xx-spi.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"

#include "spi-test.h"

int main (void) {

    pllstart_seventytwomhz() ;
    pllstart_sixtymhz() ;
    // pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;
    // uart0_init_9600() ;

    uart0_putstring("\n***Starting spi test.***\n\n");

#ifdef DEBUG_SPI
    uart0_putstring("\n*** DEBUG_SPI ***\n");
#endif
    spi_init(CCLK_DIV8, SPI_100KHZ) ;

    uart0_putstring("\n***Done .***\n\n");
    return(0);

}

