
/*
 * lpc23xx-adc.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-uart.h"

#include "lpc23xx-adc.h"

/*
 * adc_init_sw
 * input: 8 bit channel. each bit set enables
 *   respective channel
 * this initializes continuous sampling at
 * 11 clocks/sample.
 */
void adc_init_cont(adc_channelmask channels) {
	uint8_t cdiv=0;

	// turn on power
   ADC_PWR_ON;
   // then enable ADC
   ADC_ENABLE;

   // cclk value
   cclk = pllquery_cclk_mhz();

   switch(cclk) {
   case FOURTY_EIGHT_MHZ:
	   cdiv = 11; // ~4.36Mhz
	   break;
   case SIXTY_MHZ:
	   cdiv = 14; // ~4.28Mhz
	   break;
   case SEVENTY_TWO_MHZ:
	   cdiv = 17; // ~4.23Mhz
	   break;
   default:
	   while(1);
	   break;
   }

   AD0CR = (AD0CR | (cdiv << CLKDIV) | (1<<BURST) | channels ); // 11 clocks/channel
}

/*
 * adc_disable
 */
void adc_disable(ADC_CHANNEL) {
	// order matters see page 596 of user manual v3.
	ADC_DISABLE;
	ADC_PWR_OFF;
}

/*
 * adc_read
 * read value from AD0DRx
 */

uint16_t adc_read(adc_channel ch) {
	uint16_t value= 0;

	switch(ch) {
	case ADC0:
		do {
			value = AD0DR0;
		} while (AD0DR0_DONE == 0);
		break;
	case ADC1:
		do {
			value = AD0DR1;
		} while (AD0DR1_DONE == 0);
		break;
	case ADC2:
		do {
			value = AD0DR2;
		} while (AD0DR2_DONE == 0);
		break;
	case ADC3:
		do {
			value = AD0DR3;
		} while (AD0DR3_DONE == 0);
		break;
	case ADC4:
		do {
			value = AD0DR4;
		} while (AD0DR4_DONE == 0);
		break;
	case ADC6:
		do {
			value = AD0DR6;
		} while (AD0DR6_DONE == 0);
		break;
	case ADC7:
		do {
			value = AD0DR7;
		} while (AD0DR7_DONE == 0);
		break;
	default:
		break;
	}

	value=(value>>6) & 0x03FF;

	return(value);
}




