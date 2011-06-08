
/*
 * lpc23xx-uart-test.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"

#ifdef OLIMEXLPCP2378REVA
    #include "olimexlpcp2378reva.h"
#elif LPC2368PSASGFE 
    #include "lpc2368-PSAS-GFE"
#else
    #error ***** No board configuration defined. ******
#endif

#include "lpc23xx-uart-test.h"

int main (void) {

    int8_t c;
    char* instring;

    pllstart_sixtymhz() ;
    //pllstart_fourtyeightmhz() ;

    //pllstart_twelvemhz();

    uart0_init_115200() ;

   //  uart0_putstring("\n***Starting UART test: uart0.***\n\n");

    uart0_putchar('1');
    uart0_putchar('2');
    uart0_putchar('\n');
    uart0_putchar('3');
    uart0_putchar(' ');
    uart0_putchar('4');
    uart0_putchar('\n');

 //   uart0_putstring("Type a character.\n");

 //   c = uart0_getchar();

 //   uart0_putstring("\nYou typed: ");
 //   uart0_putchar(c);

 //   uart0_putstring("\nType a line.\n");
 //   instring = uart0_getstring();

 //   uart0_putstring("\nYou typed: ");
 //   uart0_putstring(instring);

 //   uart0_putstring("\n\n***End of UART test***\n");

    return(0);

}

