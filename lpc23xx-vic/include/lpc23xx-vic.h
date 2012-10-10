/*! \file lpc23xx-vic.h
 */

/*! \ingroup lpc23xx-vic
 *
 * @{
 */

//todo: additional features for external interrupts?

#ifndef _LPC23XX_VIC_H
#define _LPC23XX_VIC_H

#include "lpc23xx.h"

// VIC table page 94 lpc23xx manual
typedef enum{
    VIC_WDT        = (1<<0),
    VIC_SWINT      = (1<<1),
    VIC_ARMCore0   = (1<<2),
    VIC_ARMCore1   = (1<<3),
    VIC_TIMER0     = (1<<4),
    VIC_TIMER1     = (1<<5),
    VIC_UART0      = (1<<6),
    VIC_UART1      = (1<<7),
    VIC_PWM1       = (1<<8),
    VIC_I2C0       = (1<<9),
    VIC_SPI_SSP0   = (1<<10),
    VIC_SSP1       = (1<<11),
    VIC_PLL        = (1<<12),
    VIC_RTC        = (1<<13),
    VIC_EINT0      = (1<<14),
    VIC_EINT1      = (1<<15),
    VIC_EINT2      = (1<<16),
    VIC_EINT3_GPIO = (1<<17),
    VIC_ADC0       = (1<<18),
    VIC_I2C1       = (1<<19),
    VIC_BOD        = (1<<20),
    VIC_ETHERNET   = (1<<21),
    VIC_USB        = (1<<22),
    VIC_CAN        = (1<<23),
    VIC_SDMMC      = (1<<24),
    VIC_GPDMA      = (1<<25),
    VIC_TIMER2     = (1<<26),
    VIC_TIMER3     = (1<<27),
    VIC_UART2      = (1<<28),
    VIC_UART3      = (1<<29),
    VIC_I2C2       = (1<<30),
    VIC_I2S        = (1<<31),
} vic_interrupts;

//6-5.4, p 89 lpc23xx manual
void inline ENABLE_INT(vic_interrupts interrupt);

//6-5.5, p 89 lpc23xx manual
void inline DISABLE_INT(vic_interrupts interrupt);

void inline SET_IRQ(vic_interrupts interrupt);

void inline SET_FIQ(vic_interrupts interrupt);
//todo:
//void inline SET_HANDLER(vic_interrupts interrupt, void * name){
//    (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x100 +interrupt>>?*4)) =
//        (unsigned int)name;
//}
#define VIC_SET_WDT_HANDLER(name)        (VICVectAddr0 = (unsigned int)(name))
#define VIC_SET_SWINT_HANDLER(name)      (VICVectAddr1 = (unsigned int)(name))
#define VIC_SET_ARMCore0_HANDLER(name)   (VICVectAddr2 = (unsigned int)(name))
#define VIC_SET_ARMCore1_HANDLER(name)   (VICVectAddr3 = (unsigned int)(name))
#define VIC_SET_TIMER0_HANDLER(name)     (VICVectAddr4 = (unsigned int)(name))
#define VIC_SET_TIMER1_HANDLER(name)     (VICVectAddr5 = (unsigned int)(name))
#define VIC_SET_UART0_HANDLER(name)      (VICVectAddr6 = (unsigned int)(name))
#define VIC_SET_UART1_HANDLER(name)      (VICVectAddr7 = (unsigned int)(name))
#define VIC_SET_PWM1_HANDLER(name)       (VICVectAddr8 = (unsigned int)(name))
#define VIC_SET_I2C0_HANDLER(name)       (VICVectAddr9 = (unsigned int)(name))
#define VIC_SET_SPI_SSP0_HANDLER(name)   (VICVectAddr10 = (unsigned int)(name))
#define VIC_SET_SSP1_HANDLER(name)       (VICVectAddr11 = (unsigned int)(name))
#define VIC_SET_PLL_HANDLER(name)        (VICVectAddr12 = (unsigned int)(name))
#define VIC_SET_RTC_HANDLER(name)        (VICVectAddr13 = (unsigned int)(name))
#define VIC_SET_EINT0_HANDLER(name)      (VICVectAddr14 = (unsigned int)(name))
#define VIC_SET_EINT1_HANDLER(name)      (VICVectAddr15 = (unsigned int)(name))
#define VIC_SET_EINT2_HANDLER(name)      (VICVectAddr16 = (unsigned int)(name))
#define VIC_SET_EINT3_GPIO_HANDLER(name) (VICVectAddr17 = (unsigned int)(name))
#define VIC_SET_ADC0_HANDLER(name)       (VICVectAddr18 = (unsigned int)(name))
#define VIC_SET_I2C1_HANDLER(name)       (VICVectAddr19 = (unsigned int)(name))
#define VIC_SET_BOD_HANDLER(name)        (VICVectAddr20 = (unsigned int)(name))
#define VIC_SET_ETHERNET_HANDLER(name)   (VICVectAddr21 = (unsigned int)(name))
#define VIC_SET_USB_HANDLER(name)        (VICVectAddr22 = (unsigned int)(name))
#define VIC_SET_CAN_HANDLER(name)        (VICVectAddr23 = (unsigned int)(name))
#define VIC_SET_SDMMC_HANDLER(name)      (VICVectAddr24 = (unsigned int)(name))
#define VIC_SET_GPDMA_HANDLER(name)      (VICVectAddr25 = (unsigned int)(name))
#define VIC_SET_TIMER2_HANDLER(name)     (VICVectAddr26 = (unsigned int)(name))
#define VIC_SET_TIMER3_HANDLER(name)     (VICVectAddr27 = (unsigned int)(name))
#define VIC_SET_UART2_HANDLER(name)      (VICVectAddr28 = (unsigned int)(name))
#define VIC_SET_UART3_HANDLER(name)      (VICVectAddr29 = (unsigned int)(name))
#define VIC_SET_I2C2_HANDLER(name)       (VICVectAddr30 = (unsigned int)(name))
#define VIC_SET_I2S_HANDLER(name)        (VICVectAddr31 = (unsigned int)(name))

#define VIC_SET_WDT_PRIORITY(pri)        (VICVectPriority0 = (unsigned int)(pri))
#define VIC_SET_SWINT_PRIORITY(pri)      (VICVectPriority1 = (unsigned int)(pri))
#define VIC_SET_ARMCore0_PRIORITY(pri)   (VICVectPriority2 = (unsigned int)(pri))
#define VIC_SET_ARMCore1_PRIORITY(pri)   (VICVectPriority3 = (unsigned int)(pri))
#define VIC_SET_TIMER0_PRIORITY(pri)     (VICVectPriority4 = (unsigned int)(pri))
#define VIC_SET_TIMER1_PRIORITY(pri)     (VICVectPriority5 = (unsigned int)(pri))
#define VIC_SET_UART0_PRIORITY(pri)      (VICVectPriority6 = (unsigned int)(pri))
#define VIC_SET_UART1_PRIORITY(pri)      (VICVectPriority7 = (unsigned int)(pri))
#define VIC_SET_PWM1_PRIORITY(pri)       (VICVectPriority8 = (unsigned int)(pri))
#define VIC_SET_I2C0_PRIORITY(pri)       (VICVectPriority9 = (unsigned int)(pri))
#define VIC_SET_SPI_SSP0_PRIORITY(pri)   (VICVectPriority10 = (unsigned int)(pri))
#define VIC_SET_SSP1_PRIORITY(pri)       (VICVectPriority11 = (unsigned int)(pri))
#define VIC_SET_PLL_PRIORITY(pri)        (VICVectPriority12 = (unsigned int)(pri))
#define VIC_SET_RTC_PRIORITY(pri)        (VICVectPriority13 = (unsigned int)(pri))
#define VIC_SET_EINT0_PRIORITY(pri)      (VICVectPriority14 = (unsigned int)(pri))
#define VIC_SET_EINT1_PRIORITY(pri)      (VICVectPriority15 = (unsigned int)(pri))
#define VIC_SET_EINT2_PRIORITY(pri)      (VICVectPriority16 = (unsigned int)(pri))
#define VIC_SET_EINT3_GPIO_PRIORITY(pri) (VICVectPriority17 = (unsigned int)(pri))
#define VIC_SET_ADC0_PRIORITY(pri)       (VICVectPriority18 = (unsigned int)(pri))
#define VIC_SET_I2C1_PRIORITY(pri)       (VICVectPriority19 = (unsigned int)(pri))
#define VIC_SET_BOD_PRIORITY(pri)        (VICVectPriority20 = (unsigned int)(pri))
#define VIC_SET_ETHERNET_PRIORITY(pri)   (VICVectPriority21 = (unsigned int)(pri))
#define VIC_SET_USB_PRIORITY(pri)        (VICVectPriority22 = (unsigned int)(pri))
#define VIC_SET_CAN_PRIORITY(pri)        (VICVectPriority23 = (unsigned int)(pri))
#define VIC_SET_SDMMC_PRIORITY(pri)      (VICVectPriority24 = (unsigned int)(pri))
#define VIC_SET_GPDMA_PRIORITY(pri)      (VICVectPriority25 = (unsigned int)(pri))
#define VIC_SET_TIMER2_PRIORITY(pri)     (VICVectPriority26 = (unsigned int)(pri))
#define VIC_SET_TIMER3_PRIORITY(pri)     (VICVectPriority27 = (unsigned int)(pri))
#define VIC_SET_UART2_PRIORITY(pri)      (VICVectPriority28 = (unsigned int)(pri))
#define VIC_SET_UART3_PRIORITY(pri)      (VICVectPriority29 = (unsigned int)(pri))
#define VIC_SET_I2C2_PRIORITY(pri)       (VICVectPriority30 = (unsigned int)(pri))
#define VIC_SET_I2S_PRIORITY(pri)        (VICVectPriority31 = (unsigned int)(pri))

void inline RAISE_INT(vic_interrupts interrupt);

void inline CLR_SW_INT(vic_interrupts interrupt);

// p 91 LPC23xx_UM
#define EXIT_INTERRUPT  do { VICAddress=0x0; return; } while(0)

/*
 *
 * MACRO Name: ISR_ENTRY()
 *
 * Description:
 *    This MACRO is used upon entry to an ISR. 
 *
 *    1 - Adjust address at which execution should resume after servicing
 *        ISR to compensate for IRQ entry
 *    2 - Save the non-banked registers r0-r12 and lr onto the IRQ stack.
 *    3 - Get the status of the interrupted program is in SPSR.
 *    4 - Push it onto the IRQ stack as well.
 *
 */
#define ISR_ENTRY asm volatile(" sub   lr, lr,#4\n"		\
                                 " stmfd sp!,{r0-r12,lr}\n"	\
                                 " mrs   r1, spsr\n"		\
                                 " stmfd sp!,{r1}" )

/*
 *
 * MACRO Name: ISR_EXIT()
 *
 * Description:
 *    This MACRO is used to exit an ISR. The MACRO performs
 *    the following steps:
 *
 *    1 - Recover SPSR value from stack       
 *    2 - restore its value                   
 *    3 - Pop the return address & the saved general registers from
 *        the IRQ stack & return
 *
 */
#define ISR_EXIT asm volatile(" ldmfd sp!,{r1}\n"		\
                                 " msr   spsr_c,r1\n"		\
                                 " ldmfd sp!,{r0-r12,pc}^")


void vic_cpu_disable_interrupts() ;
void vic_cpu_enable_interrupts() ;


uint32_t vic_disableIRQ(void) ;
uint32_t vic_enableIRQ(void) ;

uint32_t vic_disableFIQ(void) ;
uint32_t vic_enableFIQ(void) ;


#endif
//! @}

