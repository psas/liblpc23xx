
/*TODO: find this -
Some peripherals, particularly those that include analog functions, may consume power
that is not clock dependent. These peripherals may contain a separate disable control that
turns off additional circuitry to reduce power. Information on peripheral specific power
saving features may be found in the chapter describing that peripheral.
*/

#ifndef _LPC23XX_POWER_H
#define _LPC23XX_POWER_H

#include "lpc23xx.h"

/*
 * PCONP Peripheral Power control
 * p69 lpc23xx rev 3.
 */
#define PCTIM0_BIT          (1<<1)
#define PCTIM1_BIT          (1<<2)
#define PCUART0_BIT         (1<<3)
#define PCUART1_BIT         (1<<4)
#define PCPWM1_BIT          (1<<6)
#define PCI2C0_BIT          (1<<7)
#define PCSPI_BIT           (1<<8)
#define PCRTC_BIT           (1<<9)
#define PCSSP1_BIT          (1<<10)
#define PCEMC_BIT           (1<<11)
#define PCAD_BIT            (1<<12)
#define PCAN1_BIT           (1<<13)
#define PCAN2_BIT           (1<<14)
#define PCI2C1_BIT          (1<<19)
#define PCSSP0_BIT          (1<<21)
#define PCTIM2_BIT          (1<<22)
#define PCTIM3_BIT          (1<<23)
#define PCUART2_BIT         (1<<24)
#define PCUART3_BIT         (1<<25)
#define PCI2C2_BIT          (1<<26)
#define PCI2S_BIT           (1<<27)
#define PCSDC_BIT           (1<<28)_LPC23XX_POWER_H
#define PCGPDMA_BIT         (1<<29)
#define PCENET_BIT          (1<<30)
#define PCUSB_BIT           (1<<31)

#define PCONP_MASK ~(0x00078000)

#define POWER_TIM0_ON          (PCONP = (PCONP | PCTIM0_BIT) & PCONP_MASK)
#define POWER_TIM1_ON          (PCONP = (PCONP | PCTIM1_BIT) & PCONP_MASK)
#define POWER_UART0_ON         (PCONP = (PCONP | PCUART0_BIT) & PCONP_MASK)
#define POWER_UART1_ON         (PCONP = (PCONP | PCUART1_BIT) & PCONP_MASK)
#define POWER_PWM1_ON          (PCONP = (PCONP | PCPWM1_BIT) & PCONP_MASK)
#define POWER_I2C0_ON          (PCONP = (PCONP | PCI2C0_BIT) & PCONP_MASK)
#define POWER_SPI_ON           (PCONP = (PCONP | PCSPI_BIT) & PCONP_MASK)
#define POWER_RTC_ON           (PCONP = (PCONP | PCRTC_BIT) & PCONP_MASK)
#define POWER_SSP1_ON          (PCONP = (PCONP | PCSSP1_BIT) & PCONP_MASK)
#define POWER_EMC_ON           (PCONP = (PCONP | PCEMC_BIT) & PCONP_MASK)
#define POWER_AD_ON            (PCONP = (PCONP | PCAD_BIT) & PCONP_MASK)
#define POWER_AN1_ON           (PCONP = (PCONP | PCAN1_BIT) & PCONP_MASK)
#define POWER_AN2_ON           (PCONP = (PCONP | PCAN2_BIT) & PCONP_MASK)
#define POWER_I2C1_ON          (PCONP = (PCONP | PCI2C1_BIT) & PCONP_MASK)
#define POWER_SSP0_ON          (PCONP = (PCONP | PCSSP0_BIT) & PCONP_MASK)
#define POWER_TIM2_ON          (PCONP = (PCONP | PCTIM2_BIT) & PCONP_MASK)
#define POWER_TIM3_ON          (PCONP = (PCONP | PCTIM3_BIT) & PCONP_MASK)
#define POWER_UART2_ON         (PCONP = (PCONP | PCUART2_BIT) & PCONP_MASK)
#define POWER_UART3_ON         (PCONP = (PCONP | PCUART3_BIT) & PCONP_MASK)
#define POWER_I2C2_ON          (PCONP = (PCONP | PCI2C2_BIT) & PCONP_MASK)
#define POWER_I2S_ON           (PCONP = (PCONP | PCI2S_BIT) & PCONP_MASK)
#define POWER_SDC_ON           (PCONP = (PCONP | PCSDC_BIT) & PCONP_MASK)
#define POWER_GPDMA_ON         (PCONP = (PCONP | PCGPDMA_BIT) & PCONP_MASK)
#define POWER_ENET_ON          (PCONP = (PCONP | PCENET_BIT) & PCONP_MASK)
#define POWER_USB_ON           (PCONP = (PCONP | PCUSB_BIT) & PCONP_MASK)

#define POWER_TIM0_OFF          (PCONP &= PCONP_MASK & ~PCTIM0_BIT)
#define POWER_TIM1_OFF          (PCONP &= PCONP_MASK & ~PCTIM1_BIT)
#define POWER_UART0_OFF         (PCONP &= PCONP_MASK & ~PCUART0_BIT)
#define POWER_UART1_OFF         (PCONP &= PCONP_MASK & ~PCUART1_BIT)
#define POWER_PWM1_OFF          (PCONP &= PCONP_MASK & ~PCPWM1_BIT)
#define POWER_I2C0_OFF          (PCONP &= PCONP_MASK & ~PCI2C0_BIT)
#define POWER_SPI_OFF           (PCONP &= PCONP_MASK & ~PCSPI_BIT)
#define POWER_RTC_OFF           (PCONP &= PCONP_MASK & ~PCRTC_BIT)
#define POWER_SSP1_OFF          (PCONP &= PCONP_MASK & ~PCSSP1_BIT)
#define POWER_EMC_OFF           (PCONP &= PCONP_MASK & ~PCEMC_BIT)
#define POWER_AD_OFF            (PCONP &= PCONP_MASK & ~PCAD_BIT)
#define POWER_AN1_OFF           (PCONP &= PCONP_MASK & ~PCAN1_BIT)
#define POWER_AN2_OFF           (PCONP &= PCONP_MASK & ~PCAN2_BIT)
#define POWER_I2C1_OFF          (PCONP &= PCONP_MASK & ~PCI2C1_BIT)
#define POWER_SSP0_OFF          (PCONP &= PCONP_MASK & ~PCSSP0_BIT)
#define POWER_TIM2_OFF          (PCONP &= PCONP_MASK & ~PCTIM2_BIT)
#define POWER_TIM3_OFF          (PCONP &= PCONP_MASK & ~PCTIM3_BIT)
#define POWER_UART2_OFF         (PCONP &= PCONP_MASK & ~PCUART2_BIT)
#define POWER_UART3_OFF         (PCONP &= PCONP_MASK & ~PCUART3_BIT)
#define POWER_I2C2_OFF          (PCONP &= PCONP_MASK & ~PCI2C2_BIT)
#define POWER_I2S_OFF           (PCONP &= PCONP_MASK & ~PCI2S_BIT)
#define POWER_SDC_OFF           (PCONP &= PCONP_MASK & ~PCSDC_BIT)
#define POWER_GPDMA_OFF         (PCONP &= PCONP_MASK & ~PCGPDMA_BIT)
#define POWER_ENET_OFF          (PCONP &= PCONP_MASK & ~PCENET_BIT)
#define POWER_USB_OFF           (PCONP &= PCONP_MASK & ~PCUSB_BIT)


//PCON Power Mode Control, 4-8.6, p65 LPC23xx user manual
#define PCON_MASK       ~(0x60)
#define IDLE_MODE       PCON = (PCON & PCON_MASK) | 0x01
#define SLEEP_MODE      PCON = (PCON & PCON_MASK) | 0x81
#define POWER_DOWN_MODE PCON = (PCON & PCON_MASK) | 0x02

//INTWAKE Interrupt Wake Register, 4-8.7, p66 LPC23xx user manual
#define EXTWAKE0_BIT        (1<<0)
#define EXTWAKE1_BIT        (1<<1)
#define EXTWAKE2_BIT        (1<<2)
#define EXTWAKE3_BIT        (1<<3)
#define ETHWAKE_BIT         (1<<4)
#define USBWAKE_BIT         (1<<5)
#define CANWAKE_BIT         (1<<6)
#define GPIO0WAKE_BIT       (1<<7)
#define GPIO2WAKE_BIT       (1<<8)
#define BODWAKE_BIT         (1<<14)
#define RTCWAKE_BIT         (1<<15)

#define INTWAKE_MASK    ~(0x3E00)

#define ENABLE_WAKE_ON_EXT0  (INTWAKE = (INTWAKE | EXTWAKE0_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_EXT1  (INTWAKE = (INTWAKE | EXTWAKE1_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_EXT2  (INTWAKE = (INTWAKE | EXTWAKE2_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_EXT3  (INTWAKE = (INTWAKE | EXTWAKE3_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_ETH   (INTWAKE = (INTWAKE | ETHWAKE_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_USB   (INTWAKE = (INTWAKE | USBWAKE_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_CAN   (INTWAKE = (INTWAKE | CANWAKE_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_GPIO0 (INTWAKE = (INTWAKE | GPIO0WAKE_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_GPIO2 (INTWAKE = (INTWAKE | GPIO2WAKE_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_BOD   (INTWAKE = (INTWAKE | BODWAKE_BIT) & INTWAKE_MASK)
#define ENABLE_WAKE_ON_RTC   (INTWAKE = (INTWAKE | RTCWAKE_BIT) & INTWAKE_MASK)

#define DISABLE_WAKE_ON_EXT0  (INTWAKE &= ~EXTWAKE0_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_EXT1  (INTWAKE &= ~EXTWAKE1_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_EXT2  (INTWAKE &= ~EXTWAKE2_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_EXT3  (INTWAKE &= ~EXTWAKE3_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_ETH   (INTWAKE &= ~ETHWAKE_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_USB   (INTWAKE &= ~USBWAKE_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_CAN   (INTWAKE &= ~CANWAKE_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_GPIO0 (INTWAKE &= ~GPIO0WAKE_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_GPIO2 (INTWAKE &= ~GPIO2WAKE_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_BOD   (INTWAKE &= ~BODWAKE_BIT & INTWAKE_MASK)
#define DISABLE_WAKE_ON_RTC   (INTWAKE &= ~RTCWAKE_BIT & INTWAKE_MASK)


void safe_sleep(unsigned int intwake);

#endif
