
/*
 * adc-test.c
 */

#include <stdint.h>

#include "lpc23xx.h"
#include "lpc23xx-adc.h"
#include "lpc23xx-mam.h"
#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"

#include "adc-test.h"

/*
 * calc_voltage
 * calculate the voltage in microVolts
 * This is for integers, since we don't have floating point
 * printf.
 */
uint32_t calc_voltage(uint16_t in) {
    uint32_t ref = 3223; // microVolts per division at 11 bits

    return(in*ref);

}

int main (void) {

    adc_channelmask cmask = 0x1;

    uint16_t        val   = 0;

    pllstart_seventytwomhz() ;
    // pllstart_sixtymhz() ;
    // pllstart_fourtyeightmhz() ;

    uart0_init_115200() ;
    // uart0_init_9600() ;

    uart0_putstring("\n***Starting adc test.***\n\n");

    PINSEL_ADC0_0;
    ADC0_0_NOPULLUP_NOPULLDOWN;

    adc_init_cont(cmask, CCLK_DIV1) ;  // continuous read in burst mode

    while(1) {
        val = adc_read(ADC0_0) ;
        printf_lpc(UART0, "Voltage is:\t%u\tuV\n", calc_voltage(val));
        util_waitticks(300000);
    }

    return(0);

}

