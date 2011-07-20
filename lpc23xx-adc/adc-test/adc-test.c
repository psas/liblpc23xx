
/*
 * adc-test.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"

#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"

#include "lpc23xx-adc.h"
#include "adc-test.h"

/*
 * conf_adc_pins
 */
void conf_adc_pins() {

    PINSEL1   = ((PINSEL1 & ~(0x00 << 14)) | (0x01 << 14));
    PINMODE1  = ((PINMODE1 & ~(0x00 << 14)) | (0x2 << 14)); // no pullup or pulldown.
}

int main (void) {

    adc_channelmask cmask = 0x1;

    uint16_t        val   = 0;

    //pllstart_seventytwomhz() ;
    //pllstart_sixtymhz() ;
    pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;
    //uart0_init_9600() ;

    uart0_putstring("\n***Starting adc test: uart0.***\n\n");

    conf_adc_pins();

    adc_init_cont(cmask) ;

    while(1) {
        val = adc_read(ADC0_0) ;
        printf_lpc(UART0, "Value is: 0x%x\n", val);
        util_waitticks(200000);
    }

    return(0);

}

