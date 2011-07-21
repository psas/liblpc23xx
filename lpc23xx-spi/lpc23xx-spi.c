
/*
 * lpc23xx-spi.c
 */

#include <stdint.h>
#include <stdlib.h>

#include "lpc23xx.h"

#include "lpc23xx-binsem.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "lpc23xx-vic.h"

#include "lpc23xx-spi.h"


/*
 * spi_init
 */
void spi_init(pclk_scale scale) {

    FIO_ENABLE;

    mam_enable();

    SPI_PWR_ON;

//    switch(scale) {
//        case CCLK_DIV1:
//            SPI_CLK_IS_CCLK_DIV1;
//            break;
//        case CCLK_DIV2:
//            SPI_CLK_IS_CCLK_DIV2;
//            break;
//        case CCLK_DIV4:
//            SPI_CLK_IS_CCLK_DIV4;
//            break;
//        case CCLK_DIV8:
//            SPI_CLK_IS_CCLK_DIV8;
//            break;
//        default:
//            while(1);  // not a valid choice, stop.
//            break;
//    }

//    //Pin Function
//    PINSEL0 |= (1<<31) | (1<<30);
//    //PINSEL1 |= (1<<1)  | (1<<0);//P0.16 - SSEL as a GPIO
//    PINSEL1 |= (1<<3)  | (1<<2);
//    PINSEL1 |= (1<<5)  | (1<<4);
//
//    //Pin Mode
//    PINMODE0 = (PINMODE0 | (1<<31)) & ~(1<<30);
//    PINMODE1 = (PINMODE1 | (1<<1))  & ~(1<<0);
//    PINMODE1 = (PINMODE1 | (1<<3))  & ~(1<<2);
//    PINMODE1 = (PINMODE1 | (1<<5))  & ~(1<<4);
//
//    //SPI Settings
//    S0SPCR = 0x24;//Master Mode, MSB First, variable Bit transfers, POL=PHA=0.
//
//    S0SPCCR = 0x0C;//500Khz
//
//    //Configure SSEL as GPIO Out
//    FIO0DIR |= (1<<16);
//    FIO0SET |= (1<<16);
}


