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


/**
	Hardware register definitions for the LPC214x USB controller

	These are private to the usbhw module
*/


#define MAMCR		*(volatile unsigned int *)0xE01FC000
#define MAMTIM		*(volatile unsigned int *)0xE01FC004

#define PLLCON		*(volatile unsigned int *)0xE01FC080
#define PLLCFG		*(volatile unsigned int *)0xE01FC084
#define PLLSTAT		*(volatile unsigned int *)0xE01FC088
#define PLLFEED		*(volatile unsigned int *)0xE01FC08C

#define VPBDIV		*(volatile unsigned int *)0xE01FC100

#define PINSEL0		*(volatile unsigned int *)0xE002C000

#define U0THR		*(volatile unsigned int *)0xE000C000
#define U0RBR		*(volatile unsigned int *)0xE000C000
#define U0DLL		*(volatile unsigned int *)0xE000C000
#define U0DLM		*(volatile unsigned int *)0xE000C004
#define U0FCR		*(volatile unsigned int *)0xE000C008
#define U0LCR		*(volatile unsigned int *)0xE000C00C
#define U0LSR		*(volatile unsigned int *)0xE000C014

/* SPI0 (Serial Peripheral Interface 0) */
#define S0SPCR			*(volatile unsigned int *)0xE0020000
#define S0SPSR			*(volatile unsigned int *)0xE0020004
#define S0SPDR			*(volatile unsigned int *)0xE0020008
#define S0SPCCR			*(volatile unsigned int *)0xE002000C
#define S0SPTCR			*(volatile unsigned int *)0xE0020010
#define S0SPTSR			*(volatile unsigned int *)0xE0020014
#define S0SPTOR			*(volatile unsigned int *)0xE0020018
#define S0SPINT			*(volatile unsigned int *)0xE002001C

/* SSP Controller */
#define SSPCR0			*(volatile unsigned int *)0xE0068000
#define SSPCR1			*(volatile unsigned int *)0xE0068004
#define SSPDR			*(volatile unsigned int *)0xE0068008
#define SSPSR			*(volatile unsigned int *)0xE006800C
#define SSPCPSR			*(volatile unsigned int *)0xE0068010
#define SSPIMSC			*(volatile unsigned int *)0xE0068014
#define SSPRIS			*(volatile unsigned int *)0xE0068018
#define SSPMIS			*(volatile unsigned int *)0xE006801C
#define SSPICR			*(volatile unsigned int *)0xE0068020

// interrupts
#define VICIntSelect	*(volatile unsigned int *)0xFFFFF00C
#define VICIntEnable	*(volatile unsigned int *)0xFFFFF010
#define VICVectAddr		*(volatile unsigned int *)0xFFFFF030
#define VICVectAddr0	*(volatile unsigned int *)0xFFFFF100
#define VICVectCntl0	*(volatile unsigned int *)0xFFFFF200

/* Common LPC2148 definitions, related to USB */
#define	PCONP			*(volatile unsigned int *)0xE01FC0C4
#define	PLL1CON			*(volatile unsigned int *)0xE01FC0A0
#define	PLL1CFG			*(volatile unsigned int *)0xE01FC0A4
#define	PLL1STAT		*(volatile unsigned int *)0xE01FC0A8
#define	PLL1FEED		*(volatile unsigned int *)0xE01FC0AC

#define PINSEL0			*(volatile unsigned int *)0xE002C000
#define PINSEL1			*(volatile unsigned int *)0xE002C004
#define PINSEL2			*(volatile unsigned int *)0xE002C014
#define IOPIN0			*(volatile unsigned int *)0xE0028000
#define IOSET0			*(volatile unsigned int *)0xE0028004
#define IODIR0			*(volatile unsigned int *)0xE0028008
#define IOCLR0			*(volatile unsigned int *)0xE002800C
#define IOPIN1			*(volatile unsigned int *)0xE0028010
#define IOSET1			*(volatile unsigned int *)0xE0028014
#define IODIR1			*(volatile unsigned int *)0xE0028018
#define IOCLR1			*(volatile unsigned int *)0xE002801C

/* PCONP bits */
#define PCTIM0		(1<<1)
#define PCTIM1		(1<<2)
#define PCUART0		(1<<3)
#define PCUART1		(1<<4)
#define PCPWM0		(1<<5)
#define PCI2C0		(1<<7)
#define PCSPI0		(1<<8)
#define PCRTC		(1<<9)
#define PCSPI1		(1<<10)
#define PCAD0		(1<<12)
#define PCI2C1		(1<<19)
#define PCAD1		(1<<20)
#define PCUSB		(1<<31)

/* USB register definitions */
#define USBIntSt		*(volatile unsigned int *)0xE01FC1C0

#define USBDevIntSt		*(volatile unsigned int *)0xE0090000
#define USBDevIntEn		*(volatile unsigned int *)0xE0090004
#define USBDevIntClr	*(volatile unsigned int *)0xE0090008
#define USBDevIntSet	*(volatile unsigned int *)0xE009000C
#define USBDevIntPri	*(volatile unsigned int *)0xE009002C

#define USBEpIntSt		*(volatile unsigned int *)0xE0090030
#define USBEpIntEn		*(volatile unsigned int *)0xE0090034
#define USBEpIntClr		*(volatile unsigned int *)0xE0090038
#define USBEpIntSet		*(volatile unsigned int *)0xE009003C
#define USBEpIntPri		*(volatile unsigned int *)0xE0090040

#define USBReEp			*(volatile unsigned int *)0xE0090044
#define USBEpInd		*(volatile unsigned int *)0xE0090048
#define USBMaxPSize		*(volatile unsigned int *)0xE009004C

#define USBRxData		*(volatile unsigned int *)0xE0090018
#define USBRxPLen		*(volatile unsigned int *)0xE0090020
#define USBTxData		*(volatile unsigned int *)0xE009001C
#define USBTxPLen		*(volatile unsigned int *)0xE0090024
#define USBCtrl			*(volatile unsigned int *)0xE0090028

#define USBCmdCode		*(volatile unsigned int *)0xE0090010
#define USBCmdData		*(volatile unsigned int *)0xE0090014


/* USB DMA Relivent definitions */
#define USBEpDMAEn   *(volatile unsigned int *)0xE0090088
#define USBEpDMADis  *(volatile unsigned int *)0xE009008C
#define USBUDCAH     *(volatile unsigned int *)0xE0090080

#define USBDMAIntSt      *(volatile unsigned int *)0xE0090090
#define USBDMAIntEn      *(volatile unsigned int *)0xE0090094
#define USBEoTIntSt      *(volatile unsigned int *)0xE00900A0
#define USBEoTIntClr     *(volatile unsigned int *)0xE00900A4
#define USBNDDRIntSt     *(volatile unsigned int *)0xE00900AC
#define USBNDDRIntClr    *(volatile unsigned int *)0xE00900B0
#define USBSysErrIntSt   *(volatile unsigned int *)0xE00900B8
#define USBSysErrIntClr  *(volatile unsigned int *)0xE00900BC


