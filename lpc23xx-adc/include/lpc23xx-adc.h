
/*
 * lpc23xx-adc.h
 */



#ifndef _LPC23XX_ADC_H
#define _LPC23XX_ADC_H

// PCONP
#define 	PCAD			12

// AD0CR
#define     PDN             21
#define     CLKDIV          8
#define     BURST           16


#define     ADC_PWR_ON  	(PCONP = (PCONP | (1<<PCAD)))
#define     ADC_PWR_OFF  	(PCONP = (PCONP & ~(1<<PCAD)))

#define     ADC_ENABLE      (AD0CR = (AD0CR | (1<<PDN)))
#define     ADC_DISABLE     (AD0CR = (AD0CR & ~(1<<PDN)))

#define     AD0DR0_DONE     ((AD0DR0 & 0x80000000) >> 31)
#define     AD0DR1_DONE     ((AD0DR1 & 0x80000000) >> 31)
#define     AD0DR2_DONE     ((AD0DR1 & 0x80000000) >> 31)
#define     AD0DR3_DONE     ((AD0DR3 & 0x80000000) >> 31)
#define     AD0DR4_DONE     ((AD0DR4 & 0x80000000) >> 31)
#define     AD0DR5_DONE     ((AD0DR5 & 0x80000000) >> 31)
#define     AD0DR6_DONE     ((AD0DR6 & 0x80000000) >> 31)
#define     AD0DR7_DONE     ((AD0DR7 & 0x80000000) >> 31)

typedef     uint8_t 		adc_channelmask;

typedef enum {ADC0=0, ADC1, ADC2, ADC3, ADC4, ADC5, ADC6, ADC7} adc_channel;

void            adc_init_cont(adc_channelmask channels) ;
void            adc_disable(void) ;
uint16_t        adc_read(adc_channel ch) ;


#endif
