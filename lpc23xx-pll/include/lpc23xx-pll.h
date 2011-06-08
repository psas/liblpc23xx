
/*
 * lpc23xx-pll.h
 */

#ifndef _LPC23XX_PLL_H
#define _LPC23XX_PLL_H

#include <stdint.h>

#define         FEEDBYTE_A                 ((unsigned) 0xAA)
#define         FEEDBYTE_B                 ((unsigned) 0x55)

typedef enum Freqtype { 
    ZERO             = 0, 
    FOURTY_EIGHT_MHZ = 48000000, 
    SIXTY_MHZ        = 60000000, 
    SEVENTY_TWO_MHZ  = 72000000 
} Freq;

extern struct pll_status {
    Freq cclk_mhz;
} pllstat ;

Freq        pllquery_cclk_mhz(void);

void    	pllfeed(void) ;

void    	pllstop(void) ;

void    	pllstart_seventytwomhz(void) ;
void    	pllstart_sixtymhz(void) ;
void    	pllstart_fourtyeightmhz(void) ;

#endif
