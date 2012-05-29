
/*! \file util-test.c
 */

#include <stdint.h>
#include <string.h>

#include "lpc23xx.h"
#include "lpc23xx-debug.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-timer.h"
#include "lpc23xx-vic.h"

#include "ringbuffer.h"
#include "printf-lpc.h"

#include "lpc23xx-util.h"

#include "util-test.h"

#ifdef DEBUG_COLORS

#endif

/*! \brief blink a light
 *
 */
static void do_task() {
	volatile uint32_t x        = 0;
	const    uint32_t interval = 500000;

	x = 0;
	for(;;) {
		x++;
		if (x == interval) {
			x = 0;
			led_toggle(BLUE_LED);

		    uart0_putchar_intr('a');
		    uart0_putchar_intr('b');
		    uart0_putchar_intr('c');
		    uart0_putchar_intr('\r');
		    uart0_putchar_intr('\n');

		 //   U0IER = 3;

		    if(rb_numentries(&uart0_tx_rb_g) > 5) RED_LED_ON;

//		    if((U0LSR & 0b100000) == 0b100000) {
//		    	 RED_LED_ON;
//		    }
//		    if ( ((VICIntEnable & (1<<VIC_UART0_BIT)) >> VIC_UART0_BIT ) == 1) {
//		 		RED_LED_ON;
//		    } else {
//		    	BLUE_LED_ON;
//		    }

//		    if((U0IER & 0b10) == 0b10) {
//		    	RED_LED_OFF;
//		    } else {
//		    	RED_LED_ON;
//		    }

//		    ch = uart0_getchar_intr();
//		    uart0_putchar_intr(ch);
//		    uart0_putchar_intr('\n');
//		    uart0_putchar_intr('\r');

//			rb_get_string(astr, &uart0_rb_rx_g);
//			DBG(UART0, "-->%s<--\n", astr);
		}
	}
}
/*! \brief A little test of the Ringbuffer
 *
 * \return True if passes.
 */
bool rb_test() {

	Ringbuffer        rbst;
	Ringbuffer*       rb = &rbst;

	bool      pass = true;
	uint8_t   element;
	uint8_t   getstr[MAX_RINGBUFFER_ELEMS];
	uint8_t   i;

	DBG(UART0,"\n\r----------\n\rStart test\n\r");

	if(!rb_initialize(rb)) {
		DBG(UART0,"Failed to init rb\n\r");
		pass = false;
	}

	rb_print_state(rb);

	DBG(UART0,"Insert a line\r\n");
	if(!rb_insert_string("Hello line\r\r\n", rb)) {
		DBG(UART0,"Failed to insert line:\t%s\r\n", "Hello line\r\n");
		pass = false;
	}

	rb_print_state(rb);
	rb_get_line(getstr, rb);

	DBG(UART0,"Got a line:\t-->%s<--\r\n", getstr);

	rb_print_state(rb);

	if(!rb_initialize(rb)) {
		DBG(UART0,"Failed to re-init (2) rb\n\r");
		pass = false;
	}

	DBG(UART0,"Insert %c\r\n", 'a');
	if(!rb_put_elem('a',rb)) {
		DBG(UART0,"Failed to insert uint8 %c\n\r", 'a');
		pass=false;
	}

	if(rb->num_entries != 1) {
		DBG(UART0,"ERROR: Number of entries should be 1\r\n");
		pass = false;
	}

	DBG(UART0,"Get uint8 %c\r\n", 'a');
	if(!rb_get_elem(&element, rb)) {
		DBG(UART0,"Failed to get uint8 %c\n\r", 'a');
		pass = false;
	} else if (element  != 'a') {
		DBG(UART0,"wrong get uint8 %c\n\r", 'a');
		pass = false;
	} else {}


	if(rb->num_entries != 0) {
		DBG(UART0,"ERROR: Number of entries should be 0\r\n");
		pass = false;
	}

	rb_print_state(rb);

	DBG(UART0,"Get a uint8 from empty rb...\r\n");
	if(rb_get_elem(&element,rb)) {
		DBG(UART0,"***FAIL! Got a uint8 from empty rb");
		pass = false;
	} else {
		DBG(UART0,"***PASS get from empty rb.\n");
	}

	if(rb->num_entries != 0) {
		DBG(UART0,"ERROR: Number of entries should be 0\r\n");
		pass = false;
	}

	DBG(UART0,"Insert uint8 b\t");
	if(!rb_put_elem('b',rb)) {
		DBG(UART0,"Failed to insert uint8 %c\n\r", 'b');
		pass = false;
	}

	if(rb->num_entries != 1) {
		DBG(UART0,"ERROR: Number of entries should be 1\r\n");
		pass = false;
	}

	rb_print_state(rb);

	DBG(UART0,"Insert string\r\n");
	if(!rb_insert_string("1234\n\r\n\r\t-->Ring-buffer!<--\r\n ",rb)) {
		DBG(UART0,"Failed to insert string");
		pass = false;
		rb_print_state(rb);
		if(!rb_is_full(rb)) DBG(UART0,"FAIL: Should report full\r\n");
	}

	rb_print_state(rb);

	if(!rb_get_elem(&element,rb)) {
		DBG(UART0,"Failed to get uint8");
		pass = false;
	} else {
		DBG(UART0,"Got a uint8: %c\n\r", element);
	}

	if(!rb_put_elem('c',rb)) {
		DBG(UART0,"Failed to insert uint8 %c", 'c');
		pass = false;
	}

	rb_get_string(getstr, rb);

	DBG(UART0, "got string: -->%s<--\n", getstr);

	if(!rb_is_empty(rb))
	{
		DBG(UART0,"FAIL: Should report empty\n\r");
		pass = false;
	}
	rb_print_state(rb);

	for(i = 0 ; i < 20 ; ++i) {
		rb_insert_string("01234567890123456789",rb);
	}

	if(!rb_get_elem(&element,rb)) {
		DBG(UART0,"Failed to get uint8");
		pass = false;
	} else {
		DBG(UART0,"Got a uint8: %c\n\r", element);
	}

	rb_print_state(rb);

	rb_get_string(getstr, rb);
	DBG(UART0,"got string: -->%s<--\n", getstr);
	if(strncmp((char*) getstr, "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123",MAX_RINGBUFFER_ELEMS) !=0) {
		DBG(UART0,"FAIL: Strings not equal\n\r");
		pass = false;
	}
	rb_print_state(rb);

	(pass) ? printf_lpc(UART0,"PASSED RINGBUFFER TESTS\r\n") : printf_lpc(UART0,"FAILED RINGBUFFER TESTS\r\n");

	return(pass);
}


int main (void) {
//	uint32_t ticks;
//	uint32_t start=0;
//	uint32_t stop=0;
//	uint32_t difftime=0;
//	uint32_t msecs=0;
//	uint32_t usecs=0;
//
//	int32_t error=0;


	pllstart_seventytwomhz() ;
	// pllstart_sixtymhz() ;
	// pllstart_fourtyeightmhz() ;

	uart0_init_115200() ;
	//uart0_init_9600() ;
	FIO_ENABLE;

	RED_LED_UNMASK;
	BLUE_LED_UNMASK;
	GREEN_LED_UNMASK;

	RED_LED_ENABLE;
	GREEN_LED_ENABLE;
	BLUE_LED_ENABLE;

	RED_LED_OFF;
	BLUE_LED_OFF;
	GREEN_LED_OFF;

    color_led_flash(3, BLUE_LED,  FLASH_FAST ) ;

    BLUE_LED_OFF;

	vic_disableIRQ();
	vic_disableFIQ();

	uart0_init_rb();

    uart_enable_interrupt(UART0);

	vic_enableIRQ();
	vic_enableFIQ();

	uart0_putstring("\n***USB0 putstr polled***\r\n\n");

	uart0_putstring_intr("\n***USB0 putstr interrupt***\r\n\n");

    do_task();

//
//	uart0_putstring("\n***Starting UTIL timing test.***\n\n");
//
//	/* get counter value */
//	timer_init(TIMER_0,  (uint32_t) 0x0 , CCLK_DIV1);
//	RESET_TIMER0;
//	START_TIMER0;
//
//	msecs = 200;
//	ticks = millisecondsToCPUTicks(msecs);
//
//	printf_lpc(UART0,"--> ticks in %u msecs are %u\n",msecs, ticks);
//
//	start = T0TC;
//	util_wait_msecs(msecs) ;
//	stop  = T0TC;
//	difftime = stop - start;
//	error    = difftime - ticks;
//	printf_lpc(UART0, "difftime is: %u\n", difftime);
//	printf_lpc(UART0, "error is: %d ticks.\n", error);
//
//	RESET_TIMER0;
//	START_TIMER0;
//
//	usecs = 200;
//	ticks = microsecondsToCPUTicks(usecs);
//
//	printf_lpc(UART0,"--> ticks in %u usecs are %u\n",msecs, ticks);
//
//	start = T0TC;
//	util_wait_usecs(usecs) ;
//	stop  = T0TC;
//	difftime = stop - start;
//	error    = difftime - ticks;
//	printf_lpc(UART0, "difftime is: %u\n", difftime);
//	printf_lpc(UART0, "error is: %d ticks.\n", error);
//
//	printf_lpc(UART0, "\n*** Test ringbuffer...\n");
//	rb_test() ;
//
//	printf_lpc(UART0, "\n******************\n***util-test done***\n");

	return(0);

}




