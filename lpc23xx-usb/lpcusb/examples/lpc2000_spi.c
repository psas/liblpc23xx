/*****************************************************************************\
*              efs - General purpose Embedded Filesystem library              *
*          --------------------- -----------------------------------          *
*                                                                             *
* Filename : lpc2000_spi.c                                                     *
* Description : This  contains the functions needed to use efs for        *
*               accessing files on an SD-card connected to an LPC2xxx.        *
*                                                                             *
* This library is free software; you can redistribute it and/or               *
* modify it under the terms of the GNU Lesser General Public                  *
* License as published by the Free Software Foundation; either                *
* version 2.1 of the License, or (at your option) any later version.          *
*                                                                             *
* This library is distributed in the hope that it will be useful,             *
* but WITHOUT ANY WARRANTY; without even the implied warranty of              *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU           *
* Lesser General Public License for more details.                             *
*                                                                             *
*                                                    (c)2005 Martin Thomas    *
*                                                                             *
\*****************************************************************************/

/*
	2006, Bertrik Sikken, modified for LPCUSB
*/

#include "type.h"
#include "debug.h"

#include "lpc214x.h"
#include "hal.h"

#include "spi.h"
/*****************************************************************************/


// SP0SPCR  Bit-Definitions
#define CPHA    (1<<3)
#define CPOL    (1<<4)
#define MSTR    (1<<5)
// SP0SPSR  Bit-Definitions
#define SPIF	(1<<7)

#define SPI_IODIR      IODIR0
#define SPI_SCK_PIN    4		/* Clock       P0.4  out */
#define SPI_MISO_PIN   5		/* from Card   P0.5  in  */
#define SPI_MOSI_PIN   6		/* to Card     P0.6  out */
#define SPI_SS_PIN	   22		/* Card-Select P0.7 - GPIO out */

#define SELECT_CARD()   IOCLR0 = (1 << SPI_SS_PIN)
#define UNSELECT_CARD() IOSET0 = (1 << SPI_SS_PIN)

#define SPI_IDLE_CHAR	0xFF

/*****************************************************************************/


void SPISetSpeed(int iFrequency)
{
	int iClock, iDivider;

	// get base SPI clock
	iClock = HalSysGetPCLK() / 2;
	// calculate divider (strictly round up)
	iDivider = (iClock + iFrequency - 1) / iFrequency;
	// should be at least 4
	iDivider = MAX(4, iDivider);
	// set it
	S0SPCCR = iDivider << 1;
	
	DBG("Configured SPI0 for %d kHz\n", iClock / (1000 * iDivider));
}


void SPIInit(void)
{
	// enable SPI
	PCONP |= PCSPI0;

	// setup GPIO
	UNSELECT_CARD();
	SPI_IODIR |= (1 << SPI_SS_PIN);

	// reset Pin-Functions  
	HalPinSelect(SPI_SCK_PIN,	1);	// SPI
	HalPinSelect(SPI_MISO_PIN,	1);	// SPI
	HalPinSelect(SPI_MOSI_PIN,	1);	// SPI
	HalPinSelect(SPI_SS_PIN,	0);	// GPIO

	// enable SPI-Master
	S0SPCR = MSTR | CPOL;
}

/*****************************************************************************/

void SPITransfer(int iCount, U8 *pbTxData, U8 *pbRxData)
{
	int i;

	SELECT_CARD();
	for (i = 0; i < iCount; i++) {
		// send byte
		if (pbTxData != NULL) {
			S0SPDR = *pbTxData++;
		}
		else {
			S0SPDR = SPI_IDLE_CHAR;
		}
		// wait until done
		while( !(S0SPSR & SPIF) ) ;
		// store received byte
		if (pbRxData != NULL) {
			*pbRxData++ = S0SPDR;
		}
	}
	UNSELECT_CARD();
}


void SPITick(int iCount)
{
	int i;
	
	UNSELECT_CARD();
	for (i = 0; i < iCount; i++) {
		S0SPDR = SPI_IDLE_CHAR;
		while (!(S0SPSR & SPIF));
	}
}

/*****************************************************************************/
