
/*
 * lpc23xx-adc.c
 */

#include <stdint.h>


#include "lpc23xx-adc.h"

void adc_init(adc_channel c) {
    switch(c) {
        case ADC0:


            break;
        default:
            break;
    }

    
    
    
}

void adc_disable(ADC_CHANNEL);

void adc0_isr(void){

}
//void adc1_isr(void){
//
//}
//void adc2_isr(void){
//
//}
//void adc3_isr(void){
//
//}
//void adc4_isr(void){
//
//}
//void adc5_isr(void){
//
//}

//#if (defined LPC2377 || defined LPC2378 || defined LPC2388)
//    // lpc2377/78 lpc2388 only.
//    void adc6_isr
//    void adc7_isr
//#endif



