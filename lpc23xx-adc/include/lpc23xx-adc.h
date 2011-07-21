
/*
 * lpc23xx-adc.h
 */

#ifndef _LPC23XX_ADC_H
#define _LPC23XX_ADC_H

#include "lpc23xx-util.h"
// Clock
#define     PCLKSEL0_PCLK_ADC     24

#define     ADC_CLK_IS_CCLK_DIV1  ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_ADC)) |(0x1 << PCLKSEL0_PCLK_ADC)) )
#define     ADC_CLK_IS_CCLK_DIV2  ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_ADC)) |(0x2 << PCLKSEL0_PCLK_ADC)) )
#define     ADC_CLK_IS_CCLK_DIV4  ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_ADC)) |(0x0 << PCLKSEL0_PCLK_ADC)) )
#define     ADC_CLK_IS_CCLK_DIV8  ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_ADC)) |(0x3 << PCLKSEL0_PCLK_ADC)) )

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

// P0.23
#define     PINSEL_ADC0_0                (PINSEL1  = (PINSEL1 & ~(0x00 << 14)) | (0x01 << 14))
#define     ADC0_0_NOPULLUP_NOPULLDOWN   (PINMODE1 = (PINMODE1 & ~(0x00 << 14)) | (0x2 << 14))

// P0.24
#define     PINSEL_ADC0_1                (PINSEL1  = (PINSEL1 & ~(0x00 << 16)) | (0x01 << 16))
#define     ADC0_1_NOPULLUP_NOPULLDOWN   (PINMODE1 = (PINMODE1 & ~(0x00 << 16)) | (0x2 << 16))

// P0.25
#define     PINSEL_ADC0_2                (PINSEL1  = (PINSEL1 & ~(0x00 << 18)) | (0x01 << 18))
#define     ADC0_2_NOPULLUP_NOPULLDOWN   (PINMODE1 = (PINMODE1 & ~(0x00 << 18)) | (0x2 << 18))

// P0.26
#define     PINSEL_ADC0_3                (PINSEL1  = (PINSEL1 & ~(0x00 << 20)) | (0x01 << 20))
#define     ADC0_3_NOPULLUP_NOPULLDOWN   (PINMODE1 = (PINMODE1 & ~(0x00 << 20)) | (0x2 << 20))

// P1.30
#define     PINSEL_ADC0_4                (PINSEL3  = (PINSEL3 & ~(0x00 << 28)) | (0x03 << 28))
#define     ADC0_4_NOPULLUP_NOPULLDOWN   (PINMODE3 = (PINMODE3 & ~(0x00 << 28)) | (0x2 << 28))

// P1.31
#define     PINSEL_ADC0_5                (PINSEL3  = (PINSEL3 & ~(0x00 << 30)) | (0x03 << 30))
#define     ADC0_5_NOPULLUP_NOPULLDOWN   (PINMODE3 = (PINMODE3 & ~(0x00 << 30)) | (0x2 << 30))


#if defined (LPC2378) || defined (LPC2388)

    // P0.12
    #define     PINSEL_ADC0_6                (PINSEL0  = (PINSEL0 & ~(0x00 << 24)) | (0x03 << 24))
    #define     ADC0_6_NOPULLUP_NOPULLDOWN   (PINMODE0 = (PINMODE0 & ~(0x00 << 24)) | (0x2 << 24))
    
    // P0.13
    #define     PINSEL_ADC0_7                (PINSEL0  = (PINSEL0 & ~(0x00 << 26)) | (0x03 << 26))
    #define     ADC0_7_NOPULLUP_NOPULLDOWN   (PINMODE0 = (PINMODE0 & ~(0x00 << 26)) | (0x2 << 26))
    
#endif

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

void        adc_init_cont(adc_channelmask channels, pclk_scale scale) ;
void        adc_disable(void) ;
uint16_t    adc_read(adc_channel ch) ;

#endif

