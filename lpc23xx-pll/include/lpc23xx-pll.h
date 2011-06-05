
/*
 * lpc23xx-pll.h
 */

#ifndef _LPC23XX_PLL_H
#define _LPC23XX_PLL_H

#include <stdint.h>

#define         FEEDBYTE_A                 ((unsigned) 0xAA)
#define         FEEDBYTE_B                 ((unsigned) 0x55)

struct pll_status {
	uint32_t cclk_mhz;
} pllstat ;

uint32_t    query_cclk_mhz(void);

void    	pllfeed(void) ;

void    	pllstop(void) ;

void    	pllstart_sixtymhz(void) ;
void    	pllstart_fourtyeightmhz(void) ;
void    	pllstart_twelvemhz(void) ;

#endif
