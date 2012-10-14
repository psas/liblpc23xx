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
	@file
*/


#include "lpc23xx-types.h"
#include "usbstruct.h"		// for TSetupPacket

/*************************************************************************
	USB configuration
**************************************************************************/

#define MAX_PACKET_SIZE0	64		/**< maximum packet size for EP 0 */

/*************************************************************************
	USB hardware interface
**************************************************************************/

// endpoint status sent through callback
#define EP_STATUS_DATA		(1<<0)		/**< EP has data */
#define EP_STATUS_STALLED	(1<<1)		/**< EP is stalled */
#define EP_STATUS_SETUP		(1<<2)		/**< EP received setup packet */
#define EP_STATUS_ERROR		(1<<3)		/**< EP data was overwritten by setup packet */
#define EP_STATUS_NACKED	(1<<4)		/**< EP sent NAK */

// device status sent through callback
#define DEV_STATUS_CONNECT		(1<<0)	/**< device just got connected */
#define DEV_STATUS_SUSPEND		(1<<2)	/**< device entered suspend state */
#define DEV_STATUS_RESET		(1<<4)	/**< device just got reset */

// interrupt bits for NACK events in USBHwNakIntEnable
// (these bits conveniently coincide with the LPC214x USB controller bit)
#define INACK_CI		(1<<1)			/**< interrupt on NACK for control in */
#define INACK_CO		(1<<2)			/**< interrupt on NACK for control out */
#define INACK_II		(1<<3)			/**< interrupt on NACK for interrupt in */
#define INACK_IO		(1<<4)			/**< interrupt on NACK for interrupt out */
#define INACK_BI		(1<<5)			/**< interrupt on NACK for bulk in */
#define INACK_BO		(1<<6)			/**< interrupt on NACK for bulk out */

void USBHwISR			(void)  __attribute__ ((interrupt("IRQ")));
void USBHwNakIntEnable	(uint8_t bIntBits);
void USBHwConnect		(bool fConnect);

// endpoint operations
int  USBHwEPRead		(uint8_t bEP, uint8_t *pbBuf, int iMaxLen);
int	 USBHwEPWrite		(uint8_t bEP, uint8_t *pbBuf, int iLen);
void USBHwEPStall		(uint8_t bEP, bool fStall);
int  USBHwISOCEPRead    (const uint8_t bEP, uint8_t *pbBuf, const int iMaxLen);

/** Endpoint interrupt handler callback */
typedef void (TFnEPIntHandler)	(uint8_t bEP, uint8_t bEPStatus);
void USBHwRegisterEPIntHandler	(uint8_t bEP, TFnEPIntHandler *pfnHandler);

/** Device status handler callback */
typedef void (TFnDevIntHandler)	(uint8_t bDevStatus);
void USBHwRegisterDevIntHandler	(TFnDevIntHandler *pfnHandler);

/** Frame event handler callback */
typedef void (TFnFrameHandler)(uint16_t wFrame);
void USBHwRegisterFrameHandler(TFnFrameHandler *pfnHandler);


/*************************************************************************
	USB application interface
**************************************************************************/

// initialise the complete stack, including HW
bool USBInit(void);

/** Request handler callback (standard, vendor, class) */
typedef bool (TFnHandleRequest)(TSetupPacket *pSetup, int *piLen, uint8_t **ppbData);
void USBRegisterRequestHandler(int iType, TFnHandleRequest *pfnHandler, uint8_t *pbDataStore);
void USBRegisterCustomReqHandler(TFnHandleRequest *pfnHandler);

/** Descriptor handler callback */
typedef bool (TFnGetDescriptor)(uint16_t wTypeIndex, uint16_t wLangID, int *piLen, uint8_t **ppbData);

/** Default standard request handler */
bool USBHandleStandardRequest(TSetupPacket *pSetup, int *piLen, uint8_t **ppbData);

/** Default EP0 handler */
void USBHandleControlTransfer(uint8_t bEP, uint8_t bEPStat);

/** Descriptor handling */
void USBRegisterDescriptors(const uint8_t *pabDescriptors);
bool USBGetDescriptor(uint16_t wTypeIndex, uint16_t wLangID, int *piLen, uint8_t **ppbData);




/** DMA descriptor setup */
void USBSetupDMADescriptor(
		volatile uint32_t dmaDescriptor[], 
		volatile uint32_t nextDdPtr[],
		const uint8_t isIsocFlag, 
		const uint16_t maxPacketSize, 
		const uint16_t dmaLengthIsocNumFrames,
		void *dmaBufferStartAddress,
		uint32_t *isocPacketSizeMemoryAddress );

void USBInitializeISOCFrameArray(uint32_t isocFrameArr[], const uint32_t numElements, const uint16_t startFrameNumber, const uint16_t defaultFrameLength);
void USBInitializeUSBDMA(volatile uint32_t* udcaHeadArray[32]);
void USBSetHeadDDForDMA(const uint8_t bEp, volatile uint32_t* udcaHeadArray[32], volatile const uint32_t *dmaDescriptorPtr);

void USBEnableDMAForEndpoint(const uint8_t bEndpointNumber) ;
void USBDisableDMAForEndpoint(const uint8_t bEndpointNumber);





