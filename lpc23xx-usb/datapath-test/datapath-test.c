
/*
 * datapath-test.c
 *
 * Test the datapath from a sensor to
 * the LPC to USB to the FC and from the FC
 * to the LPC.
 * 
 */

#include <stdio.h>                      // EOF
#include <string.h>                     // memcpy

#include "lpc23xx.h"
#include "lpc23xx-debug.h"
#include "printf-lpc.h"

#include "lpc23xx-mam.h"
#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "lpc23xx-vic.h"

#include "usbapi.h"

#include "serial-fifo.h"
#include "datapath-test.h"


#define BAUD_RATE               115200

#define INT_IN_EP               0x81
#define BULK_OUT_EP             0x05
#define BULK_IN_EP              0x82

#define MAX_PACKET_SIZE 64

#define LE_WORD(x)              ((x)&0xFF),((x)>>8)

// CDC definitions
#define CS_INTERFACE            0x24
#define CS_ENDPOINT             0x25

#define SET_LINE_CODING         0x20
#define GET_LINE_CODING         0x21
#define SET_CONTROL_LINE_STATE  0x22

typedef enum {GO=0, STOP, RESET} runstate_type;

struct {
   runstate_type state;
} runstate_g;

// data structure for GET_LINE_CODING / SET_LINE_CODING class requests
typedef struct {
    uint32_t            dwDTERate;
    uint8_t             bCharFormat;
    uint8_t             bParityType;
    uint8_t             bDataBits;
} TLineCoding;

static TLineCoding      LineCoding = {115200, 0, 0, 8};
static uint8_t          abBulkBuf[64];
static uint8_t          abClassReqData[8];
static volatile BOOL    fBulkInBusy;
static volatile BOOL    fChainDone;

static fifo_type           txfifo;
static fifo_type           rxfifo;

// forward declaration of interrupt handler
static void USBIntHandler(void) __attribute__ ((interrupt("IRQ")));

static const uint8_t abDescriptors[] = {

    // device descriptor
    0x12,
    DESC_DEVICE,
    LE_WORD(0x0101),                    // bcdUSB
    0x02,                               // bDeviceClass
    0x00,                               // bDeviceSubClass
    0x00,                               // bDeviceProtocol
    MAX_PACKET_SIZE0,                   // bMaxPacketSize
    LE_WORD(0xFFFF),                    // idVendor
    LE_WORD(0x0005),                    // idProduct
    LE_WORD(0x0100),                    // bcdDevice
    0x01,                               // iManufacturer
    0x02,                               // iProduct
    0x03,                               // iSerialNumber
    0x01,                               // bNumConfigurations

    // configuration descriptor
    0x09,
    DESC_CONFIGURATION,
    LE_WORD(67),                        // wTotalLength
    0x02,                               // bNumInterfaces
    0x01,                               // bConfigurationValue
    0x00,                               // iConfiguration
    0xC0,                               // bmAttributes
    0x32,                               // bMaxPower
    // control class interface
    0x09,
    DESC_INTERFACE,
    0x00,                               // bInterfaceNumber
    0x00,                               // bAlternateSetting
    0x01,                               // bNumEndPoints
    0x02,                               // bInterfaceClass
    0x02,                               // bInterfaceSubClass
    0x01,                               // bInterfaceProtocol, linux requires value of 1 for the cdc_acm module
    0x00,                               // iInterface
    // header functional descriptor
    0x05,
    CS_INTERFACE,
    0x00,
    LE_WORD(0x0110),
    // call management functional descriptor
    0x05,
    CS_INTERFACE,
    0x01,
    0x01,                                // bmCapabilities = device handles call management
    0x01,                                // bDataInterface
    // ACM functional descriptor
    0x04,
    CS_INTERFACE,
    0x02,
    0x02,                                // bmCapabilities
    // union functional descriptor
    0x05,
    CS_INTERFACE,
    0x06,
    0x00,                                // bMasterInterface
    0x01,                                // bSlaveInterface0
    // notification EP
    0x07,
    DESC_ENDPOINT,
    INT_IN_EP,                           // bEndpointAddress
    0x03,                                // bmAttributes = intr
    LE_WORD(8),                          // wMaxPacketSize
    0x0A,                                // bInterval
    // data class interface descriptor
    0x09,
    DESC_INTERFACE,
    0x01,                                // bInterfaceNumber
    0x00,                                // bAlternateSetting
    0x02,                                // bNumEndPoints
    0x0A,                                // bInterfaceClass = data
    0x00,                                // bInterfaceSubClass
    0x00,                                // bInterfaceProtocol
    0x00,                                // iInterface
    // data EP OUT
    0x07,
    DESC_ENDPOINT,
    BULK_OUT_EP,                         // bEndpointAddress
    0x02,                                // bmAttributes = bulk
    LE_WORD(MAX_PACKET_SIZE),            // wMaxPacketSize
    0x00,                                // bInterval
    // data EP in
    0x07,
    DESC_ENDPOINT,
    BULK_IN_EP,                          // bEndpointAddress
    0x02,                                // bmAttributes = bulk
    LE_WORD(MAX_PACKET_SIZE),            // wMaxPacketSize
    0x00,                                // bInterval

    // string descriptors
    0x04,
    DESC_STRING,
    LE_WORD(0x0409),

    0x0A,
    DESC_STRING,
    'P', 0, 'S', 0, 'A', 0, 'S', 0,

    0x14,
    DESC_STRING,
    'U', 0, 'S', 0, 'B', 0, 'S', 0, 'e', 0, 'r', 0, 'i', 0, 'a', 0, 'l', 0,

    0x16,
    DESC_STRING,
    'l', 0, 'i', 0, 'b', 0, 'l', 0, 'p', 0, 'c', 0, '2', 0, '3', 0, 'x', 0, 'x', 0,

    // terminating zero
    0
};


/**
  Local function to handle incoming bulk data

  @param [in] bEP
  @param [in] bEPStatus
  */
static void BulkOut(uint8_t bEP, uint8_t bEPStatus) {
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
static void SendNextBulkIn(uint8_t bEP, BOOL fFirstPacket)
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
static void BulkIn(uint8_t bEP, uint8_t bEPStatus)
{
    SendNextBulkIn(bEP, FALSE);
}


/**
  Local function to handle the USB-CDC class requests

  @param [in] pSetup
  @param [out] piLen
  @param [out] ppbData
  */
static BOOL HandleClassRequest(TSetupPacket *pSetup, int *piLen, uint8_t **ppbData)
{
    switch (pSetup->bRequest) {

        // set line coding
        case SET_LINE_CODING:
            //DBG(UART0,"SET_LINE_CODING\n");
            memcpy((uint8_t *)&LineCoding, *ppbData, 7);
            *piLen = 7;
            DBG(UART0,"dwDTERate=%u, bCharFormat=%u, bParityType=%u, bDataBits=%u\n",
                    LineCoding.dwDTERate,
                    LineCoding.bCharFormat,
                    LineCoding.bParityType,
                    LineCoding.bDataBits);
            break;

            // get line coding
        case GET_LINE_CODING:
            //DBG(UART0,"GET_LINE_CODING\n");
            *ppbData = (uint8_t *)&LineCoding;
            *piLen = 7;
            break;

            // set control line state
        case SET_CONTROL_LINE_STATE:
            // bit0 = DTR, bit = RTS
            //DBG(UART0,"SET_CONTROL_LINE_STATE %X\n", pSetup->wValue);
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
    fifo_init(&txfifo);
    fifo_init(&rxfifo);
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

/*
 * VCOM_putword
 * Writes one word to VCOM port
 */
int VCOM_putword(int c) {
    int r = 0;
    r = fifo_put(&txfifo,  c &  0xff              );
    if(r) {
        r = fifo_put(&txfifo, ((c & (0xff << 8)) >> 8));
        if( r ) {
            r = fifo_put(&txfifo, ((c & (0xff << 16))  >> 16 ));
            if( r ) {
                r = fifo_put(&txfifo, ((c & (0xff << 24))  >> 24));
                if( r ) { } 
                else DBG(UART0, "fifo_put fail\n"); 
            } else DBG(UART0, "fifo_put fail\n"); 
        } else  DBG(UART0, "fifo_put fail\n");
    } else  DBG(UART0, "fifo_put fail\n");
    return(0);
}

/**
  Reads one character from VCOM port

  @returns character read, or EOF if character could not be read
  */
int VCOM_getchar(void)
{
    uint8_t c;

    return fifo_get(&rxfifo, &c) ? c : EOF;
}


/**
  Interrupt handler

  Simply calls the USB ISR, then signals end of interrupt to VIC
  */
static void USBIntHandler(void)
{
    USBHwISR();
    VICAddress = 0x00;    // dummy write to VIC to signal end of ISR
}

/**
  USB frame interrupt handler

  Called every milisecond by the hardware driver.

  This function is responsible for sending the first of a chain of packets
  to the host. A chain is always terminated by a short packet, either a
  packet shorter than the maximum packet size or a zero-length packet
  (as required by the windows usbser.sys driver).

*/
static void USBFrameHandler(uint16_t wFrame)
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
static void USBDevIntHandler(uint8_t bDevStatus)
{
    if ((bDevStatus & DEV_STATUS_RESET) != 0) {
        fBulkInBusy = FALSE;
    }
}


/*
 * stream_task
 */
static void stream_task() {
	int c       = 0;
	int index   = 0;
	int success = 0;

	runstate_g.state = RESET;

	// do USB stuff in interrupt
	while (1) {
//		DBG(UART0, "State is: %u\n", (uint32_t) runstate_g.state);
	//util_wait_msecs(800);
		switch(runstate_g.state) {
		case GO:
			// get and print sample
			VCOM_putword(++index);
			DBG(UART0, "%d GO\n", index);
			break;
		case STOP:
			// stop getting samples
			break;
		case RESET:
			// reset index and continue getting samples, next state is GO
			index            = 0;
			runstate_g.state = STOP;
			break;
		default:
			DBG(UART0, "stream_task(): INVALID STATE\n");
			break;
		}
		c = VCOM_getchar();
		if (c != EOF) {
			// show on console
			if (c == 'g' ) {
				runstate_g.state = GO;
				DBG(UART0,"Go detected\n");
			} else if (c == 's' ) {
				runstate_g.state = STOP;
				DBG(UART0,"Stop detected\n");
			} else if (c == 'm' ) {
				DBG(UART0,"Menu detected\n");
			} else if (c == 'r' ) {
				runstate_g.state = RESET;
				DBG(UART0,"Reset detected\n");
			} else if ((c == 9) || (c == 10) || (c == 13) || ((c >= 32) && (c <= 126))) {

				success = VCOM_putchar(c);
				if(success == EOF){
					DBG(UART0, "success is: %d\n", success);
					runstate_g.state = RESET;
				}
				DBG(UART0,"%c", c);
			}
			else {
				DBG(UART0,".");

			}

		}
	}

}


/*************************************************************************
  main
  ====
 **************************************************************************/
int main(void)
{

    FIO_ENABLE;
    pllstart_seventytwomhz() ;
    mam_enable();
    uart0_init_115200() ;

    DBG(UART0,"Initialising USB stack\n");

    // initialise stack
    USBInit();

    DBG(UART0,"Past USBInit\n");

    // register descriptors
    USBRegisterDescriptors(abDescriptors);

    DBG(UART0,"Past USBRegisterDescriptors\n");

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

    DBG(UART0,"Starting USB communication\n");

    VICVectPriority22 = 0x01;
    VICVectAddr22     = (int) USBIntHandler;

    // set up USB interrupt
    VICIntSelect      &= ~(1<<22);     // select IRQ for USB
    VICIntEnable      |= (1<<22);

    vic_enableIRQ();

    // connect to bus
    USBHwConnect(TRUE);

    DBG(UART0,"USBHwConnect\n");
    stream_task();

    return 0;
}

