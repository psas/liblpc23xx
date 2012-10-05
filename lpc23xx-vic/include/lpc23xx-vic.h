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
#define VIC_WDT_BIT         (1<<0)
#define VIC_SWINT_BIT       (1<<1)
#define VIC_ARMCore0_BIT    (1<<2)
#define VIC_ARMCore1_BIT    (1<<3)
#define VIC_TIMER0_BIT      (1<<4)
#define VIC_TIMER1_BIT      (1<<5)
#define VIC_UART0_BIT       (1<<6)
#define VIC_UART1_BIT       (1<<7)
#define VIC_PWM1_BIT        (1<<8)
#define VIC_I2C0_BIT        (1<<9)
#define VIC_SPI_SSP0_BIT    (1<<10)
#define VIC_SSP1_BIT        (1<<11)
#define VIC_PLL_BIT         (1<<12)
#define VIC_RTC_BIT         (1<<13)
#define VIC_EINT0_BIT       (1<<14)
#define VIC_EINT1_BIT       (1<<15)
#define VIC_EINT2_BIT       (1<<16)
#define VIC_EINT3_GPIO_BIT  (1<<17)
#define VIC_ADC0_BIT        (1<<18)
#define VIC_I2C1_BIT        (1<<19)
#define VIC_BOD_BIT         (1<<20)
#define VIC_ETHERNET_BIT    (1<<21)
#define VIC_USB_BIT         (1<<22)
#define VIC_CAN_BIT         (1<<23)
#define VIC_SDMMC_BIT       (1<<24)
#define VIC_GPDMA_BIT       (1<<25)
#define VIC_TIMER2_BIT      (1<<26)
#define VIC_TIMER3_BIT      (1<<27)
#define VIC_UART2_BIT       (1<<28)
#define VIC_UART3_BIT       (1<<29)
#define VIC_I2C2_BIT        (1<<30)
#define VIC_I2S_BIT         (1<<31)

//6-5.4, p 89 lpc23xx manual
#define ENABLE_WDT_INT         (VICIntEnable = VIC_WDT_BIT)
#define ENABLE_SWINT_INT       (VICIntEnable = VIC_SWINT_BIT)
#define ENABLE_ARMCore0_INT    (VICIntEnable = VIC_ARMCore0_BIT)
#define ENABLE_ARMCore1_INT    (VICIntEnable = VIC_ARMCore1_BIT)
#define ENABLE_TIMER0_INT      (VICIntEnable = VIC_TIMER0_BIT)
#define ENABLE_TIMER1_INT      (VICIntEnable = VIC_TIMER1_BIT)
#define ENABLE_UART0_INT       (VICIntEnable = VIC_UART0_BIT)
#define ENABLE_UART1_INT       (VICIntEnable = VIC_UART1_BIT)
#define ENABLE_PWM1_INT        (VICIntEnable = VIC_PWM1_BIT)
#define ENABLE_I2C0_INT        (VICIntEnable = VIC_I2C0_BIT)
#define ENABLE_SPI_SSP0_INT    (VICIntEnable = VIC_SPI_SSP0_BIT)
#define ENABLE_SSP1_INT        (VICIntEnable = VIC_SSP1_BIT)
#define ENABLE_PLL_INT         (VICIntEnable = VIC_PLL_BIT)
#define ENABLE_RTC_INT         (VICIntEnable = VIC_RTC_BIT)
#define ENABLE_EINT0_INT       (VICIntEnable = VIC_EINT0_BIT)
#define ENABLE_EINT1_INT       (VICIntEnable = VIC_EINT1_BIT)
#define ENABLE_EINT2_INT       (VICIntEnable = VIC_EINT2_BIT)
#define ENABLE_EINT3_GPIO_INT  (VICIntEnable = VIC_EINT3_GPIO_BIT)
#define ENABLE_ADC0_INT        (VICIntEnable = VIC_ADC0_BIT)
#define ENABLE_I2C1_INT        (VICIntEnable = VIC_I2C1_BIT)
#define ENABLE_BOD_INT         (VICIntEnable = VIC_BOD_BIT)
#define ENABLE_ETHERNET_INT    (VICIntEnable = VIC_ETHERNET_BIT)
#define ENABLE_USB_INT         (VICIntEnable = VIC_USB_BIT)
#define ENABLE_CAN_INT         (VICIntEnable = VIC_CAN_BIT)
#define ENABLE_SDMMC_INT       (VICIntEnable = VIC_SDMMC_BIT)
#define ENABLE_GPDMA_INT       (VICIntEnable = VIC_GPDMA_BIT)
#define ENABLE_TIMER2_INT      (VICIntEnable = VIC_TIMER2_BIT)
#define ENABLE_TIMER3_INT      (VICIntEnable = VIC_TIMER3_BIT)
#define ENABLE_UART2_INT       (VICIntEnable = VIC_UART2_BIT)
#define ENABLE_UART3_INT       (VICIntEnable = VIC_UART3_BIT)
#define ENABLE_I2C2_INT        (VICIntEnable = VIC_I2C2_BIT)
#define ENABLE_I2S_INT         (VICIntEnable = VIC_I2S_BIT)

//6-5.5, p 89 lpc23xx manual
#define DISABLE_WDT_INT         (VICIntEnClr = VIC_WDT_BIT)
#define DISABLE_SWINT_INT       (VICIntEnClr = VIC_SWINT_BIT)
#define DISABLE_ARMCore0_INT    (VICIntEnClr = VIC_ARMCore0_BIT)
#define DISABLE_ARMCore1_INT    (VICIntEnClr = VIC_ARMCore1_BIT)
#define DISABLE_TIMER0_INT      (VICIntEnClr = VIC_TIMER0_BIT)
#define DISABLE_TIMER1_INT      (VICIntEnClr = VIC_TIMER1_BIT)
#define DISABLE_UART0_INT       (VICIntEnClr = VIC_UART0_BIT)
#define DISABLE_UART1_INT       (VICIntEnClr = VIC_UART1_BIT)
#define DISABLE_PWM1_INT        (VICIntEnClr = VIC_PWM1_BIT)
#define DISABLE_I2C0_INT        (VICIntEnClr = VIC_I2C0_BIT)
#define DISABLE_SPI_SSP0_INT    (VICIntEnClr = VIC_SPI_SSP0_BIT)
#define DISABLE_SSP1_INT        (VICIntEnClr = VIC_SSP1_BIT)
#define DISABLE_PLL_INT         (VICIntEnClr = VIC_PLL_BIT)
#define DISABLE_RTC_INT         (VICIntEnClr = VIC_RTC_BIT)
#define DISABLE_EINT0_INT       (VICIntEnClr = VIC_EINT0_BIT)
#define DISABLE_EINT1_INT       (VICIntEnClr = VIC_EINT1_BIT)
#define DISABLE_EINT2_INT       (VICIntEnClr = VIC_EINT2_BIT)
#define DISABLE_EINT3_GPIO_INT  (VICIntEnClr = VIC_EINT3_GPIO_BIT)
#define DISABLE_ADC0_INT        (VICIntEnClr = VIC_ADC0_BIT)
#define DISABLE_I2C1_INT        (VICIntEnClr = VIC_I2C1_BIT)
#define DISABLE_BOD_INT         (VICIntEnClr = VIC_BOD_BIT)
#define DISABLE_ETHERNET_INT    (VICIntEnClr = VIC_ETHERNET_BIT)
#define DISABLE_USB_INT         (VICIntEnClr = VIC_USB_BIT)
#define DISABLE_CAN_INT         (VICIntEnClr = VIC_CAN_BIT)
#define DISABLE_SDMMC_INT       (VICIntEnClr = VIC_SDMMC_BIT)
#define DISABLE_GPDMA_INT       (VICIntEnClr = VIC_GPDMA_BIT)
#define DISABLE_TIMER2_INT      (VICIntEnClr = VIC_TIMER2_BIT)
#define DISABLE_TIMER3_INT      (VICIntEnClr = VIC_TIMER3_BIT)
#define DISABLE_UART2_INT       (VICIntEnClr = VIC_UART2_BIT)
#define DISABLE_UART3_INT       (VICIntEnClr = VIC_UART3_BIT)
#define DISABLE_I2C2_INT        (VICIntEnClr = VIC_I2C2_BIT)
#define DISABLE_I2S_INT         (VICIntEnClr = VIC_I2S_BIT)

#define SET_WDT_IRQ         (VICIntSelect &= ~VIC_WDT_BIT)
#define SET_SWINT_IRQ       (VICIntSelect &= ~VIC_SWINT_BIT)
#define SET_ARMCore0_IRQ    (VICIntSelect &= ~VIC_ARMCore0_BIT)
#define SET_ARMCore1_IRQ    (VICIntSelect &= ~VIC_ARMCore1_BIT)
#define SET_TIMER0_IRQ      (VICIntSelect &= ~VIC_TIMER0_BIT)
#define SET_TIMER1_IRQ      (VICIntSelect &= ~VIC_TIMER1_BIT)
#define SET_UART0_IRQ       (VICIntSelect &= ~VIC_UART0_BIT)
#define SET_UART1_IRQ       (VICIntSelect &= ~VIC_UART1_BIT)
#define SET_PWM1_IRQ        (VICIntSelect &= ~VIC_PWM1_BIT)
#define SET_I2C0_IRQ        (VICIntSelect &= ~VIC_I2C0_BIT)
#define SET_SPI_SSP0_IRQ    (VICIntSelect &= ~VIC_SPI_SSP0_BIT)
#define SET_SSP1_IRQ        (VICIntSelect &= ~VIC_SSP1_BIT)
#define SET_PLL_IRQ         (VICIntSelect &= ~VIC_PLL_BIT)
#define SET_RTC_IRQ         (VICIntSelect &= ~VIC_RTC_BIT)
#define SET_EINT0_IRQ       (VICIntSelect &= ~VIC_EINT0_BIT)
#define SET_EINT1_IRQ       (VICIntSelect &= ~VIC_EINT1_BIT)
#define SET_EINT2_IRQ       (VICIntSelect &= ~VIC_EINT2_BIT)
#define SET_EINT3_GPIO_IRQ  (VICIntSelect &= ~VIC_EINT3_GPIO_BIT)
#define SET_ADC0_IRQ        (VICIntSelect &= ~VIC_ADC0_BIT)
#define SET_I2C1_IRQ        (VICIntSelect &= ~VIC_I2C1_BIT)
#define SET_BOD_IRQ         (VICIntSelect &= ~VIC_BOD_BIT)
#define SET_ETHERNET_IRQ    (VICIntSelect &= ~VIC_ETHERNET_BIT)
#define SET_USB_IRQ         (VICIntSelect &= ~VIC_USB_BIT)
#define SET_CAN_IRQ         (VICIntSelect &= ~VIC_CAN_BIT)
#define SET_SDMMC_IRQ       (VICIntSelect &= ~VIC_SDMMC_BIT)
#define SET_GPDMA_IRQ       (VICIntSelect &= ~VIC_GPDMA_BIT)
#define SET_TIMER2_IRQ      (VICIntSelect &= ~VIC_TIMER2_BIT)
#define SET_TIMER3_IRQ      (VICIntSelect &= ~VIC_TIMER3_BIT)
#define SET_UART2_IRQ       (VICIntSelect &= ~VIC_UART2_BIT)
#define SET_UART3_IRQ       (VICIntSelect &= ~VIC_UART3_BIT)
#define SET_I2C2_IRQ        (VICIntSelect &= ~VIC_I2C2_BIT)
#define SET_I2S_IRQ         (VICIntSelect &= ~VIC_I2S_BIT)

#define SET_WDT_FIQ         (VICIntSelect |= VIC_WDT_BIT)
#define SET_SWINT_FIQ       (VICIntSelect |= VIC_SWINT_BIT)
#define SET_ARMCore0_FIQ    (VICIntSelect |= VIC_ARMCore0_BIT)
#define SET_ARMCore1_FIQ    (VICIntSelect |= VIC_ARMCore1_BIT)
#define SET_TIMER0_FIQ      (VICIntSelect |= VIC_TIMER0_BIT)
#define SET_TIMER1_FIQ      (VICIntSelect |= VIC_TIMER1_BIT)
#define SET_UART0_FIQ       (VICIntSelect |= VIC_UART0_BIT)
#define SET_UART1_FIQ       (VICIntSelect |= VIC_UART1_BIT)
#define SET_PWM1_FIQ        (VICIntSelect |= VIC_PWM1_BIT)
#define SET_I2C0_FIQ        (VICIntSelect |= VIC_I2C0_BIT)
#define SET_SPI_SSP0_FIQ    (VICIntSelect |= VIC_SPI_SSP0_BIT)
#define SET_SSP1_FIQ        (VICIntSelect |= VIC_SSP1_BIT)
#define SET_PLL_FIQ         (VICIntSelect |= VIC_PLL_BIT)
#define SET_RTC_FIQ         (VICIntSelect |= VIC_RTC_BIT)
#define SET_EINT0_FIQ       (VICIntSelect |= VIC_EINT0_BIT)
#define SET_EINT1_FIQ       (VICIntSelect |= VIC_EINT1_BIT)
#define SET_EINT2_FIQ       (VICIntSelect |= VIC_EINT2_BIT)
#define SET_EINT3_GPIO_FIQ  (VICIntSelect |= VIC_EINT3_GPIO_BIT)
#define SET_ADC0_FIQ        (VICIntSelect |= VIC_ADC0_BIT)
#define SET_I2C1_FIQ        (VICIntSelect |= VIC_I2C1_BIT)
#define SET_BOD_FIQ         (VICIntSelect |= VIC_BOD_BIT)
#define SET_ETHERNET_FIQ    (VICIntSelect |= VIC_ETHERNET_BIT)
#define SET_USB_FIQ         (VICIntSelect |= VIC_USB_BIT)
#define SET_CAN_FIQ         (VICIntSelect |= VIC_CAN_BIT)
#define SET_SDMMC_FIQ       (VICIntSelect |= VIC_SDMMC_BIT)
#define SET_GPDMA_FIQ       (VICIntSelect |= VIC_GPDMA_BIT)
#define SET_TIMER2_FIQ      (VICIntSelect |= VIC_TIMER2_BIT)
#define SET_TIMER3_FIQ      (VICIntSelect |= VIC_TIMER3_BIT)
#define SET_UART2_FIQ       (VICIntSelect |= VIC_UART2_BIT)
#define SET_UART3_FIQ       (VICIntSelect |= VIC_UART3_BIT)
#define SET_I2C2_FIQ        (VICIntSelect |= VIC_I2C2_BIT)
#define SET_I2S_FIQ         (VICIntSelect |= VIC_I2S_BIT)

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

#define RAISE_WDT_INT         (VICSoftInt = VIC_WDT_BIT)
#define RAISE_SWINT_INT       (VICSoftInt = VIC_SWINT_BIT)
#define RAISE_ARMCore0_INT    (VICSoftInt = VIC_ARMCore0_BIT)
#define RAISE_ARMCore1_INT    (VICSoftInt = VIC_ARMCore1_BIT)
#define RAISE_TIMER0_INT      (VICSoftInt = VIC_TIMER0_BIT)
#define RAISE_TIMER1_INT      (VICSoftInt = VIC_TIMER1_BIT)
#define RAISE_UART0_INT       (VICSoftInt = VIC_UART0_BIT)
#define RAISE_UART1_INT       (VICSoftInt = VIC_UART1_BIT)
#define RAISE_PWM1_INT        (VICSoftInt = VIC_PWM1_BIT)
#define RAISE_I2C0_INT        (VICSoftInt = VIC_I2C0_BIT)
#define RAISE_SPI_SSP0_INT    (VICSoftInt = VIC_SPI_SSP0_BIT)
#define RAISE_SSP1_INT        (VICSoftInt = VIC_SSP1_BIT)
#define RAISE_PLL_INT         (VICSoftInt = VIC_PLL_BIT)
#define RAISE_RTC_INT         (VICSoftInt = VIC_RTC_BIT)
#define RAISE_EINT0_INT       (VICSoftInt = VIC_EINT0_BIT)
#define RAISE_EINT1_INT       (VICSoftInt = VIC_EINT1_BIT)
#define RAISE_EINT2_INT       (VICSoftInt = VIC_EINT2_BIT)
#define RAISE_EINT3_GPIO_INT  (VICSoftInt = VIC_EINT3_GPIO_BIT)
#define RAISE_ADC0_INT        (VICSoftInt = VIC_ADC0_BIT)
#define RAISE_I2C1_INT        (VICSoftInt = VIC_I2C1_BIT)
#define RAISE_BOD_INT         (VICSoftInt = VIC_BOD_BIT)
#define RAISE_ETHERNET_INT    (VICSoftInt = VIC_ETHERNET_BIT)
#define RAISE_USB_INT         (VICSoftInt = VIC_USB_BIT)
#define RAISE_CAN_INT         (VICSoftInt = VIC_CAN_BIT)
#define RAISE_SDMMC_INT       (VICSoftInt = VIC_SDMMC_BIT)
#define RAISE_GPDMA_INT       (VICSoftInt = VIC_GPDMA_BIT)
#define RAISE_TIMER2_INT      (VICSoftInt = VIC_TIMER2_BIT)
#define RAISE_TIMER3_INT      (VICSoftInt = VIC_TIMER3_BIT)
#define RAISE_UART2_INT       (VICSoftInt = VIC_UART2_BIT)
#define RAISE_UART3_INT       (VICSoftInt = VIC_UART3_BIT)
#define RAISE_I2C2_INT        (VICSoftInt = VIC_I2C2_BIT)
#define RAISE_I2S_INT         (VICSoftInt = VIC_I2S_BIT)

#define CLR_SW_WDT_INT         (VICSoftIntClr = VIC_WDT_BIT)
#define CLR_SW_SWINT_INT       (VICSoftIntClr = VIC_SWINT_BIT)
#define CLR_SW_ARMCore0_INT    (VICSoftIntClr = VIC_ARMCore0_BIT)
#define CLR_SW_ARMCore1_INT    (VICSoftIntClr = VIC_ARMCore1_BIT)
#define CLR_SW_TIMER0_INT      (VICSoftIntClr = VIC_TIMER0_BIT)
#define CLR_SW_TIMER1_INT      (VICSoftIntClr = VIC_TIMER1_BIT)
#define CLR_SW_UART0_INT       (VICSoftIntClr = VIC_UART0_BIT)
#define CLR_SW_UART1_INT       (VICSoftIntClr = VIC_UART1_BIT)
#define CLR_SW_PWM1_INT        (VICSoftIntClr = VIC_PWM1_BIT)
#define CLR_SW_I2C0_INT        (VICSoftIntClr = VIC_I2C0_BIT)
#define CLR_SW_SPI_SSP0_INT    (VICSoftIntClr = VIC_SPI_SSP0_BIT)
#define CLR_SW_SSP1_INT        (VICSoftIntClr = VIC_SSP1_BIT)
#define CLR_SW_PLL_INT         (VICSoftIntClr = VIC_PLL_BIT)
#define CLR_SW_RTC_INT         (VICSoftIntClr = VIC_RTC_BIT)
#define CLR_SW_EINT0_INT       (VICSoftIntClr = VIC_EINT0_BIT)
#define CLR_SW_EINT1_INT       (VICSoftIntClr = VIC_EINT1_BIT)
#define CLR_SW_EINT2_INT       (VICSoftIntClr = VIC_EINT2_BIT)
#define CLR_SW_EINT3_GPIO_INT  (VICSoftIntClr = VIC_EINT3_GPIO_BIT)
#define CLR_SW_ADC0_INT        (VICSoftIntClr = VIC_ADC0_BIT)
#define CLR_SW_I2C1_INT        (VICSoftIntClr = VIC_I2C1_BIT)
#define CLR_SW_BOD_INT         (VICSoftIntClr = VIC_BOD_BIT)
#define CLR_SW_ETHERNET_INT    (VICSoftIntClr = VIC_ETHERNET_BIT)
#define CLR_SW_USB_INT         (VICSoftIntClr = VIC_USB_BIT)
#define CLR_SW_CAN_INT         (VICSoftIntClr = VIC_CAN_BIT)
#define CLR_SW_SDMMC_INT       (VICSoftIntClr = VIC_SDMMC_BIT)
#define CLR_SW_GPDMA_INT       (VICSoftIntClr = VIC_GPDMA_BIT)
#define CLR_SW_TIMER2_INT      (VICSoftIntClr = VIC_TIMER2_BIT)
#define CLR_SW_TIMER3_INT      (VICSoftIntClr = VIC_TIMER3_BIT)
#define CLR_SW_UART2_INT       (VICSoftIntClr = VIC_UART2_BIT)
#define CLR_SW_UART3_INT       (VICSoftIntClr = VIC_UART3_BIT)
#define CLR_SW_I2C2_INT        (VICSoftIntClr = VIC_I2C2_BIT)
#define CLR_SW_I2S_INT         (VICSoftIntClr = VIC_I2S_BIT)

#define EXIT_INTERRUPT  VICAddress=0x0

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

