/*! \file lpc23xx-usb.h
 *
 */

#ifndef LPC23XX_USB_H
#define LPC23XX_USB_H

#define VIC_USB_BIT         22


#define ENABLE_USB_INT    (VICIntEnable  = (VICIntEnable | (1<<VIC_USB_BIT)))
#define DISABLE_USB_INT    (VICIntEnable = (VICIntEnable & ~(1<<VIC_USB_BIT)))


#endif
