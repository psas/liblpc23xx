
/*
 * lpc23xx-adc.h
 */

#ifndef _LPC23XX_ADC_H
#define _LPC23XX_ADC_H

// PCONP
#define     PCONP_PCAD            12

// AD0CR
#define     AD0CR_CLKDIV          8
#define     AD0CR_BURST           16
#define     AD0CR_CLKS            17
#define     AD0CR_PDN             21
#define     AD0CR_START           24
#define     AD0CR_EDGE            24

#define     ADC_PWR_ON            (PCONP = (PCONP |  (1<<PCONP_PCAD)))
#define     ADC_PWR_OFF           (PCONP = (PCONP & ~(1<<PCONP_PCAD)))

#define     ADC_ENABLE            (AD0CR = (AD0CR |  (1 << AD0CR_PDN)))
#define     ADC_DISABLE           (AD0CR = (AD0CR & ~(1 << AD0CR_PDN)))

#define     AD0DR0_DONE           ((AD0DR0 & 0x80000000) >> 31)
#define     AD0DR1_DONE           ((AD0DR1 & 0x80000000) >> 31)
#define     AD0DR2_DONE           ((AD0DR1 & 0x80000000) >> 31)
#define     AD0DR3_DONE           ((AD0DR3 & 0x80000000) >> 31)
#define     AD0DR4_DONE           ((AD0DR4 & 0x80000000) >> 31)
#define     AD0DR5_DONE           ((AD0DR5 & 0x80000000) >> 31)
#define     AD0DR6_DONE           ((AD0DR6 & 0x80000000) >> 31)
#define     AD0DR7_DONE           ((AD0DR7 & 0x80000000) >> 31)

typedef     uint8_t               adc_channelmask;

typedef     enum {ADC0_0=0, ADC0_1, ADC0_2, 
                  ADC0_3,   ADC0_4, ADC0_5, 
                  ADC0_6,   ADC0_7} adc_channel;

void        adc_init_cont(adc_channelmask channels) ;
void        adc_disable(void) ;
uint16_t    adc_read(adc_channel ch) ;

#endif
