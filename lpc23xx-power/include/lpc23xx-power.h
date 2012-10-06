
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
typedef enum{
    PCTIM0  = (1<<1),
    PCTIM1  = (1<<2),
    PCUART0 = (1<<3),
    PCUART1 = (1<<4),
    PCPWM1  = (1<<6),
    PCI2C0  = (1<<7),
    PCSPI   = (1<<8),
    PCRTC   = (1<<9),
    PCSSP1  = (1<<10),
    PCEMC   = (1<<11),
    PCAD    = (1<<12),
    PCAN1   = (1<<13),
    PCAN2   = (1<<14),
    PCI2C1  = (1<<19),
    PCSSP0  = (1<<21),
    PCTIM2  = (1<<22),
    PCTIM3  = (1<<23),
    PCUART2 = (1<<24),
    PCUART3 = (1<<25),
    PCI2C2  = (1<<26),
    PCI2S   = (1<<27),
    PCSDC   = (1<<28),
    PCGPDMA = (1<<29),
    PCENET  = (1<<30),
    PCUSB   = (1<<31),
} pconp_peripheral;
#define PCONP_MASK ~(0x00078000)
void inline POWER_ON(pconp_peripheral perf);
void inline POWER_OFF(pconp_peripheral perf);

//PCON Power Mode Control, 4-8.6, p65 LPC23xx user manual
#define PCON_MASK       ~(0x60)
#define IDLE_MODE       PCON = (PCON & PCON_MASK) | 0x01
#define SLEEP_MODE      PCON = (PCON & PCON_MASK) | 0x81
#define POWER_DOWN_MODE PCON = (PCON & PCON_MASK) | 0x02

//INTWAKE Interrupt Wake Register, 4-8.7, p66 LPC23xx user manual
typedef enum{
    EXTWAKE0    = (1<<0),
    EXTWAKE1    = (1<<1),
    EXTWAKE2    = (1<<2),
    EXTWAKE3    = (1<<3),
    ETHWAKE     = (1<<4),
    USBWAKE     = (1<<5),
    CANWAKE     = (1<<6),
    GPIO0WAKE   = (1<<7),
    GPIO2WAKE   = (1<<8),
    BODWAKE     = (1<<14),
    RTCWAKE     = (1<<15),
} intwake_bits;
#define INTWAKE_MASK    ~(0x3E00)

void inline ENABLE_WAKE_ON(intwake_bits module);

void inline DISABLE_WAKE_ON(intwake_bits module);

void safe_sleep(unsigned int intwake);

#endif
