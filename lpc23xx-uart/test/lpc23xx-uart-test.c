
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

    // pllstart_sixtymhz() ;
    pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;

    uart0_putchar('a');
    uart0_putchar('b');
    uart0_putchar('\n');
//    uart0_putchar('c');
 //   uart0_putchar('d');
  //  uart0_putchar('\n');

    // uart0_putstring("End of uart0_test\n");

    return(0);

}

