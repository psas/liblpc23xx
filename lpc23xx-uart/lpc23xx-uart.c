
/*
 * lpc23xx-uart.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"
extern struct uart0_status uart0stat;

    #include "olimexlpcp2378reva.h"

#ifdef OLIMEXLPCP2378REVA
    #include "olimexlpcp2378reva.h"
#elif LPC2368PSASGFE
    #include "lpc2368-PSAS-GFE"
#else
    #error ***** No board configuration defined. ******
#endif

/*
 * uart_0_init_115200
 * initialize uart0
 */
void uart0_init_115200(void) {

	Freq     cclk;

	uart0stat.baudrate = ZERO_H_B;

	// Enable GPIO for TXD/RXD
	SET_RXD0_TXD0;

	// turn on power.
	POWER_ON_UART0;

	// divide cclk by one
	PCLKSEL0_UART0_DIV1;

	// set parameters
	UART0_8N1;

	uart0stat.charlength = 8;
	uart0stat.stopbits   = 1;

	// enable divisor latch access
	SET_DLAB0;

	cclk = pllquery_cclk_mhz();

	switch(cclk) {
	case TWELVE_MHZ:
		U0DLL = 4;
		U0DLM = 0;
		U0FDR = (8<<4) | 5; // MULVAL = 8, DIVADD = 5;
		break;
	case FOURTY_EIGHT_MHZ:
		U0DLL = 17;
		U0DLM = 0;
		U0FDR = (15<<4) | 8; // MULVAL = 15, DIVADD = 8;
		break;
	case SIXTY_MHZ:
		U0DLL = 21;
		U0DLM = 0;
		U0FDR = (11<<4) | 6; // MULVAL = 11, DIVADD = 6;
		break;
	default:
		break;
	}
	// enable interrupt

	CLEAR_DLAB0;
	UART0_FCR_ONE_CHAR_EN;

	uart0stat.baudrate = ONE_FIFTEEN_TWO_H_B;

}

/*
 * uart0_putchar
 */
void uart0_putchar(int8_t ch) {
	if (ch == '\n') {
		while (!(U0THR_EMPTY));
		U0THR = '\r';
	}
	while (!(U0THR_EMPTY));
	U0THR = ch;
}


/*
 * uart0_putstring
 * -------------------------------------
 * put a string to the serial port
 *
 * Assumes null termination of string.
 */
void uart0_putstring(const int8_t *s) {

	while(*s) {
		uart0_putchar(*s++); // put the char
	}
	uart0_putchar('\n');
}


/*
 * uart0_getchar
 */
int8_t uart0_getchar (void)  {

	while (!U0RDR_READY);

	return (U0RBR);
}


/*
 * uart0_getstring
 * --------------------------------------
 * receive chars from the serial port until
 *   '\n'.
 * string is in uart0_linebuffer
 * maximum length of line is UART_MAXBUFFER-1 chars.
 */
void uart0_getstring (void) {

	uint8_t    current = ' ';
	uint32_t   index   = 0;

	while((current != '\n' && current != '\r') && index < UART_MAXBUFFER-1) {
		current                 = uart0_getchar();
		uart0_linebuffer[index] = current;
		++index;
	}
	uart0_linebuffer[index]     = '\0';
}

