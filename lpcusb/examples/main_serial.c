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
	Minimal implementation of a USB serial port, using the CDC class.
	This example application simply echoes everything it receives right back
	to the host.

	Windows:
	Extract the usbser.sys file from .cab file in C:\WINDOWS\Driver Cache\i386
	and store it somewhere (C:\temp is a good place) along with the usbser.inf
	file. Then plug in the LPC214x and direct windows to the usbser driver.
	Windows then creates an extra COMx port that you can open in a terminal
	program, like hyperterminal.

	Linux:
	The device should be recognised automatically by the cdc_acm driver,
	which creates a /dev/ttyACMx device file that acts just like a regular
	serial port.

*/


#include <string.h>			// memcpy

#include "type.h"
#include "debug.h"

#ifdef LPC214x
#include "lpc214x.h"
#endif
#ifdef LPC23xx
#include "lpc23xx.h"
#endif

#include "armVIC.h"

#include "hal.h"
#include "console.h"
#include "usbapi.h"

#include "serial_fifo.h"


#define BAUD_RATE	115200

#define INT_IN_EP		0x81
#define BULK_OUT_EP		0x05
#define BULK_IN_EP		0x82

#define MAX_PACKET_SIZE	64

#define LE_WORD(x)		((x)&0xFF),((x)>>8)

// CDC definitions
#define CS_INTERFACE			0x24
#define CS_ENDPOINT				0x25

#define	SET_LINE_CODING			0x20
#define	GET_LINE_CODING			0x21
#define	SET_CONTROL_LINE_STATE	0x22

#define	INT_VECT_NUM	0

#define IRQ_MASK 0x00000080

// data structure for GET_LINE_CODING / SET_LINE_CODING class requests
typedef struct {
	U32		dwDTERate;
	U8		bCharFormat;
	U8		bParityType;
	U8		bDataBits;
} TLineCoding;

static TLineCoding LineCoding = {115200, 0, 0, 8};
static U8 abBulkBuf[64];
static U8 abClassReqData[8];
static volatile BOOL fBulkInBusy;
static volatile BOOL fChainDone;

static U8 txdata[VCOM_FIFO_SIZE];
static U8 rxdata[VCOM_FIFO_SIZE];

static fifo_t txfifo;
static fifo_t rxfifo;

// forward declaration of interrupt handler
static void USBIntHandler(void) __attribute__ ((interrupt("IRQ")));


static const U8 abDescriptors[] = {

// device descriptor
	0x12,
	DESC_DEVICE,
	LE_WORD(0x0101),			// bcdUSB
	0x02,						// bDeviceClass
	0x00,						// bDeviceSubClass
	0x00,						// bDeviceProtocol
	MAX_PACKET_SIZE0,			// bMaxPacketSize
	LE_WORD(0xFFFF),			// idVendor
	LE_WORD(0x0005),			// idProduct
	LE_WORD(0x0100),			// bcdDevice
	0x01,						// iManufacturer
	0x02,						// iProduct
	0x03,						// iSerialNumber
	0x01,						// bNumConfigurations

// configuration descriptor
	0x09,
	DESC_CONFIGURATION,
	LE_WORD(67),				// wTotalLength
	0x02,						// bNumInterfaces
	0x01,						// bConfigurationValue
	0x00,						// iConfiguration
	0xC0,						// bmAttributes
	0x32,						// bMaxPower
// control class interface
	0x09,
	DESC_INTERFACE,
	0x00,						// bInterfaceNumber
	0x00,						// bAlternateSetting
	0x01,						// bNumEndPoints
	0x02,						// bInterfaceClass
	0x02,						// bInterfaceSubClass
	0x01,						// bInterfaceProtocol, linux requires value of 1 for the cdc_acm module
	0x00,						// iInterface
// header functional descriptor
	0x05,
	CS_INTERFACE,
	0x00,
	LE_WORD(0x0110),
// call management functional descriptor
	0x05,
	CS_INTERFACE,
	0x01,
	0x01,						// bmCapabilities = device handles call management
	0x01,						// bDataInterface
// ACM functional descriptor
	0x04,
	CS_INTERFACE,
	0x02,
	0x02,						// bmCapabilities
// union functional descriptor
	0x05,
	CS_INTERFACE,
	0x06,
	0x00,						// bMasterInterface
	0x01,						// bSlaveInterface0
// notification EP
	0x07,
	DESC_ENDPOINT,
	INT_IN_EP,					// bEndpointAddress
	0x03,						// bmAttributes = intr
	LE_WORD(8),					// wMaxPacketSize
	0x0A,						// bInterval
// data class interface descriptor
	0x09,
	DESC_INTERFACE,
	0x01,						// bInterfaceNumber
	0x00,						// bAlternateSetting
	0x02,						// bNumEndPoints
	0x0A,						// bInterfaceClass = data
	0x00,						// bInterfaceSubClass
	0x00,						// bInterfaceProtocol
	0x00,						// iInterface
// data EP OUT
	0x07,
	DESC_ENDPOINT,
	BULK_OUT_EP,				// bEndpointAddress
	0x02,						// bmAttributes = bulk
	LE_WORD(MAX_PACKET_SIZE),	// wMaxPacketSize
	0x00,						// bInterval
// data EP in
	0x07,
	DESC_ENDPOINT,
	BULK_IN_EP,					// bEndpointAddress
	0x02,						// bmAttributes = bulk
	LE_WORD(MAX_PACKET_SIZE),	// wMaxPacketSize
	0x00,						// bInterval
	
	// string descriptors
	0x04,
	DESC_STRING,
	LE_WORD(0x0409),

	0x0E,
	DESC_STRING,
	'L', 0, 'P', 0, 'C', 0, 'U', 0, 'S', 0, 'B', 0,

	0x14,
	DESC_STRING,
	'U', 0, 'S', 0, 'B', 0, 'S', 0, 'e', 0, 'r', 0, 'i', 0, 'a', 0, 'l', 0,

	0x12,
	DESC_STRING,
	'D', 0, 'E', 0, 'A', 0, 'D', 0, 'C', 0, '0', 0, 'D', 0, 'E', 0,

// terminating zero
	0
};


/**
	Local function to handle incoming bulk data
		
	@param [in] bEP
	@param [in] bEPStatus
 */
static void BulkOut(U8 bEP, U8 bEPStatus)
{
	int i, iLen;

	if (fifo_free(&rxfifo) < MAX_PACKET_SIZE) {
		// may not fit into fifo
		return;
	}

	// get data from USB into intermediate buffer
	iLen = USBHwEPRead(bEP, abBulkBuf, sizeof(abBulkBuf));
	for (i = 0; i < iLen; i++) {
		// put into FIFO
		if (!fifo_put(&rxfifo, abBulkBuf[i])) {
			// overflow... :(
			ASSERT(FALSE);
			break;
		}
	}
}


/**
	Sends the next packet in chain of packets to the host
		
	@param [in] bEP
	@param [in] bEPStatus
 */
static void SendNextBulkIn(U8 bEP, BOOL fFirstPacket)
{
	int iLen;

	// this transfer is done
	fBulkInBusy = FALSE;
	
	// first packet?
	if (fFirstPacket) {
		fChainDone = FALSE;
	}

	// last packet?
	if (fChainDone) {
		return;
	}
	
	// get up to MAX_PACKET_SIZE bytes from transmit FIFO into intermediate buffer
	for (iLen = 0; iLen < MAX_PACKET_SIZE; iLen++) {
		if (!fifo_get(&txfifo, &abBulkBuf[iLen])) {
			break;
		}
	}
	
	// send over USB
	USBHwEPWrite(bEP, abBulkBuf, iLen);
	fBulkInBusy = TRUE;

	// was this a short packet?
	if (iLen < MAX_PACKET_SIZE) {
		fChainDone = TRUE;
	}
}


/**
	Local function to handle outgoing bulk data
		
	@param [in] bEP
	@param [in] bEPStatus
 */
static void BulkIn(U8 bEP, U8 bEPStatus)
{
	SendNextBulkIn(bEP, FALSE);
}


/**
	Local function to handle the USB-CDC class requests
		
	@param [in] pSetup
	@param [out] piLen
	@param [out] ppbData
 */
static BOOL HandleClassRequest(TSetupPacket *pSetup, int *piLen, U8 **ppbData)
{
	switch (pSetup->bRequest) {

	// set line coding
	case SET_LINE_CODING:
DBG("SET_LINE_CODING\n");
		memcpy((U8 *)&LineCoding, *ppbData, 7);
		*piLen = 7;
DBG("dwDTERate=%u, bCharFormat=%u, bParityType=%u, bDataBits=%u\n",
	LineCoding.dwDTERate,
	LineCoding.bCharFormat,
	LineCoding.bParityType,
	LineCoding.bDataBits);
		break;

	// get line coding
	case GET_LINE_CODING:
DBG("GET_LINE_CODING\n");
		*ppbData = (U8 *)&LineCoding;
		*piLen = 7;
		break;

	// set control line state
	case SET_CONTROL_LINE_STATE:
		// bit0 = DTR, bit = RTS
DBG("SET_CONTROL_LINE_STATE %X\n", pSetup->wValue);
		break;

	default:
		return FALSE;
	}
	return TRUE;
}


/**
	Initialises the VCOM port.
	Call this function before using VCOM_putchar or VCOM_getchar
 */
void VCOM_init(void)
{
	fifo_init(&txfifo, txdata);
	fifo_init(&rxfifo, rxdata);
	fBulkInBusy = FALSE;
	fChainDone = TRUE;
}


/**
	Writes one character to VCOM port
	
	@param [in] c character to write
	@returns character written, or EOF if character could not be written
 */
int VCOM_putchar(int c)
{
	return fifo_put(&txfifo, c) ? c : EOF;
}


/**
	Reads one character from VCOM port
	
	@returns character read, or EOF if character could not be read
 */
int VCOM_getchar(void)
{
	U8 c;
	
	return fifo_get(&rxfifo, &c) ? c : EOF;
}


/**
	Interrupt handler
	
	Simply calls the USB ISR, then signals end of interrupt to VIC
 */
static void USBIntHandler(void)
{
	USBHwISR();
	VICVectAddr = 0x00;    // dummy write to VIC to signal end of ISR 	
}

/**
	USB frame interrupt handler
	
	Called every milisecond by the hardware driver.
	
	This function is responsible for sending the first of a chain of packets
	to the host. A chain is always terminated by a short packet, either a
	packet shorter than the maximum packet size or a zero-length packet
	(as required by the windows usbser.sys driver).

 */
static void USBFrameHandler(U16 wFrame)
{
	if (!fBulkInBusy && (fifo_avail(&txfifo) != 0)) {
		// send first packet
		SendNextBulkIn(BULK_IN_EP, TRUE);
	}
}


/**
	USB device status handler
	
	Resets state machine when a USB reset is received.
 */
static void USBDevIntHandler(U8 bDevStatus)
{
	if ((bDevStatus & DEV_STATUS_RESET) != 0) {
		fBulkInBusy = FALSE;
	}
}


/*************************************************************************
	main
	====
**************************************************************************/
int main(void)
{
	int c;
	
	// PLL and MAM
	HalSysInit();

#ifdef LPC214x
	// init DBG
	ConsoleInit(60000000 / (16 * BAUD_RATE));
#else
	// init DBG
	ConsoleInit(72000000 / (16 * BAUD_RATE));
#endif

	DBG("Initialising USB stack\n");

	// initialise stack
	USBInit();

	// register descriptors
	USBRegisterDescriptors(abDescriptors);

	// register class request handler
	USBRegisterRequestHandler(REQTYPE_TYPE_CLASS, HandleClassRequest, abClassReqData);

	// register endpoint handlers
	USBHwRegisterEPIntHandler(INT_IN_EP, NULL);
	USBHwRegisterEPIntHandler(BULK_IN_EP, BulkIn);
	USBHwRegisterEPIntHandler(BULK_OUT_EP, BulkOut);
	
	// register frame handler
	USBHwRegisterFrameHandler(USBFrameHandler);
	
	// register device event handler
	USBHwRegisterDevIntHandler(USBDevIntHandler);

	// initialise VCOM
	VCOM_init();

	DBG("Starting USB communication\n");

#ifdef LPC214x
	(*(&VICVectCntl0+INT_VECT_NUM)) = 0x20 | 22; // choose highest priority ISR slot 	
	(*(&VICVectAddr0+INT_VECT_NUM)) = (int)USBIntHandler;
#else
  VICVectCntl22 = 0x01;
  VICVectAddr22 = (int)USBIntHandler;
#endif
  
	// set up USB interrupt
	VICIntSelect &= ~(1<<22);               // select IRQ for USB
	VICIntEnable |= (1<<22);
	
	enableIRQ();

	// connect to bus
	USBHwConnect(TRUE);

	// echo any character received (do USB stuff in interrupt)
	while (1) {
		c = VCOM_getchar();
		if (c != EOF) {
			// show on console
			if ((c == 9) || (c == 10) || (c == 13) || ((c >= 32) && (c <= 126))) {
				DBG("%c", c);
			}
			else {
				DBG(".");
			}
			VCOM_putchar(c);
		}
	}

	return 0;
}

