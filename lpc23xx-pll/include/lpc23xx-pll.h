
/*
 * lpc23xx-pll.h
 */

#ifndef _LPC23XX_PLL_H
#define _LPC23XX_PLL_H

#define         FEEDBYTE_A                 ((unsigned) 0xAA)
#define         FEEDBYTE_B                 ((unsigned) 0x55)

void    pllfeed(void) ;

void    pllstop(void) ;

void    pllstart_sixtymhz(void) ;

#endif
