/*
	LPCUSB, an USB device driver for LPC microcontrollers	
	Copyright (C) 2006 Bertrik Sikken (bertrik@sikken.nl)

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

	1. Redistributions of source code must retain the above copyright
	   notice, this list of conditions and the following disclaimer.
	2. Redistributions in binary form must reproduce the above copyright
	   notice, this list of conditions and the following disclaimer in the
	   documentation and/or other materials provided with the distribution.
	3. The name of the author may not be used to endorse or promote products
	   derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
	IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
	OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
	IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, 
	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
	NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
	THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
	Initialisation functions for exception handlers, PLL and MAM
	
	Partially copied from Jim Lynch's tutorial
*/

/**********************************************************
                  Header files
 **********************************************************/

#include "type.h"
#include "debug.h"

#include "hal.h"

#ifdef LPC214x
#include "lpc214x.h"
#endif
#ifdef LPC23xx
#include "lpc23xx.h"
#endif

void IRQ_Routine (void)   __attribute__ ((interrupt("IRQ")));
void FIQ_Routine (void)   __attribute__ ((interrupt("FIQ")));
void SWI_Routine (void)   __attribute__ ((interrupt("SWI")));
void UNDEF_Routine (void) __attribute__ ((interrupt("UNDEF")));


/*  Stubs for various interrupts (may be replaced later)  */
/*  ----------------------------------------------------  */

void IRQ_Routine (void) {
	while (1) ;	
}

void FIQ_Routine (void)  {
	while (1) ;	
}


void SWI_Routine (void)  {
	while (1) ;	
}


void UNDEF_Routine (void) {
	while (1) ;	
}


#ifdef LPC214x
#define PLOCK 0x400
#endif

#ifdef LPC23xx
#define PLOCK (1 << 26)
#endif

static void feed(void)
{
	PLLFEED = 0xAA;
	PLLFEED = 0x55;
}


void HalSysInit(void)  
{
	
 
	// 				Setting the Phased Lock Loop (PLL)
	//               ----------------------------------
	//
	// Olimex LPC-P2148 has a 12.0000 mhz crystal
	//
	// We'd like the LPC2148 to run at 60 mhz (has to be an even multiple of crystal)
	// 
	// According to the Philips LPC2148 manual:   M = cclk / Fosc	where:	M    = PLL multiplier (bits 0-4 of PLLCFG)
	//																		cclk = 60000000 hz
	//																		Fosc = 12000000 hz
	//
	// Solving:	M = 60000000 / 12000000 = 5           
	//
	//			Note: M - 1 must be entered into bits 0-4 of PLLCFG (assign 4 to these bits)
	//
	//
	// The Current Controlled Oscilator (CCO) must operate in the range 156 mhz to 320 mhz
	//
	// According to the Philips LPC2148 manual:	Fcco = cclk * 2 * P    where:	Fcco = CCO frequency 
	//																			cclk = 60000000 hz
	//																			P = PLL divisor (bits 5-6 of PLLCFG)
	//
	// Solving:	Fcco = 60000000 * 2 * P
	//			P = 2  (trial value)
	//			Fcco = 60000000 * 2 * 2
	//			Fcc0 = 240000000 hz    (good choice for P since it's within the 156 mhz to 320 mhz range)
	//
	// From Table 22 (page 34) of Philips LPC2148 manual    P = 2, PLLCFG bits 5-6 = 1  (assign 1 to these bits)
	//
	// Finally:      PLLCFG = 0  01  00100  =  0x24
	//
	// Final note: to load PLLCFG register, we must use the 0xAA followed 0x55 write sequence to the PLLFEED register
	//             this is done in the short function feed() below
	//
   
#ifdef LPC23xx
	SCS |= 1;//Set fast IO mode
	PINSEL10 = 0;
	FIO2DIR |= 0x00FF; // Enable LED output on the KEIL MCB2300 board
	FIO2CLR |= 0xFF; // Turn off all LEDs

	// Select the CPU clock divider
	//CCLKCFG = 0x03;//Divide the CCO output frquency by (3 + 1)
	
	CCLKCFG = 0x05;//Divide the CCO output frquency by (5 + 1), 288mhz/6=48mhz
	//CCLKCFG = 0x03;//Divide the CCO output frquency by (3 + 1), 288mhz/4=72mhz

	/* Start main oscillator */
	SCS |= (1 << 5);

	while(!(SCS & (1<<6)));

	CLKSRCSEL = 1;

	// Setting Multiplier and Divider values
	//PLLCFG = (0 << 16) | (5 << 0); //Divider = 1, multiplier = 0 (aka 0+1=1), frequency = 12mhz * 16 * 2/ 1 = 384mhz
	PLLCFG = (0 << 16) | 11;//Mul=12, div=1, CCO at 288mhz 
#else
	// Setting Multiplier and Divider values
  	PLLCFG = 0x24;
#endif
  	feed();
  
	// Enabling the PLL */	
	PLLCON = 0x1;
	feed();
  
	// Wait for the PLL to lock to set frequency
	while(!(PLLSTAT & PLOCK)) ;

	// Connect the PLL as the clock source
	PLLCON = 0x3;
	feed();
  
#ifdef LPC23xx
  // Wait for the PLL to connect
  while(!(PLLSTAT & (1 << 25)));
#endif
  
	// Enabling MAM and setting number of clocks used for Flash memory fetch
	MAMTIM = 0x3;
	MAMCR = 0x2;
  
#ifdef LPC23xx
    PCLKSEL0 = (1 << 6); /* Set UART0 clock to cclk */
#else
	// Setting peripheral Clock (pclk) to System Clock (cclk)
	VPBDIV = 0x1;
#endif
}


void HalSysPinSelect(U8 bPin, U8 bFunc)
{
	if (bPin < 16) {
		PINSEL0 = (PINSEL0 & ~(3 << (2 * bPin))) | (bFunc << (2 * bPin));
	}
	else {
		bPin -= 16;
		PINSEL1 = (PINSEL1 & ~(3 << (2 * bPin))) | (bFunc << (2 * bPin));
	}
}


int HalSysGetCCLK(void)
{
	return 60000000;
}


int HalSysGetPCLK(void)
{
	return 60000000;
}


void HalPinSelect(U8 bPin, U8 bFunc)
{
	if (bPin < 16) {
		PINSEL0 = (PINSEL0 & ~(3 << (2 * bPin))) | (bFunc << (2 * bPin));
	}
	else {
		bPin -= 16;
		PINSEL1 = (PINSEL1 & ~(3 << (2 * bPin))) | (bFunc << (2 * bPin));
	}
}

