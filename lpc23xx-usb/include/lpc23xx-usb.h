/*! \file lpc23xx-usb.h
 *
 */

#ifndef LPC23XX_USB_H
#define LPC23XX_USB_H

#include "lpc23xx.h"
#include "lpc23xx-vic.h"

#define VIC_USB_BIT               22

#define ENABLE_USB_INT            (VICIntEnable = (VICIntEnable | (1<<VIC_USB_BIT)   ))
#define DISABLE_USB_INT           (VICIntEnable = (VICIntEnable & (~(1<<VIC_USB_BIT))))

#define USB_SELECT_IRQ            (VICIntSelect = (VICIntSelect & (~(1<<VIC_USB_BIT)) ))
#define USB_SELECT_FIQ            (VICIntSelect = (VICIntSelect | (1<<VIC_USB_BIT)    ))

#define USB_SET_VIC_PRIORITY(pri) (VICVectPriority22 = pri)

#define USB_SET_VIC_HANDLER(name) (VICVectAddr22 = (unsigned int)name)

#endif
