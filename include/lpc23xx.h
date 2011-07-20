
/*
 * lpc23xx.h
 * Reference: LPC23XX User Manual Rev. 03-25 August 2009 (NXP: www.nxp.com)
 */

#ifndef _LPC23XX_H
#define _LPC23XX_H

/*
 * System Control Block (SCB) 
 * Chapter 2 p24
 */
#define         SCB_BASE_ADDR   0xE01FC000

/*
 * Memory Map Control
 * Chapter 2 p27
 */
#define         MEMMAP                  (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x040))

/* 
 * Memory Accelerator Module (MAM) 
 * Chapter 7 p100
 */
#define         MAMCR                   (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x000))
#define         MAMTIM                  (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x004))

/* 
 * Phase Locked Loop (PLL) 
 * Chapter 4 p50
 */
#define         PLLCON                  (*(volatile unsigned char *)(SCB_BASE_ADDR + 0x080))
#define         PLLCFG                  (*(volatile unsigned int  *)(SCB_BASE_ADDR + 0x084))
#define         PLLSTAT                 (*(volatile unsigned int  *)(SCB_BASE_ADDR + 0x088))
#define         PLLFEED                 (*(volatile unsigned char *)(SCB_BASE_ADDR + 0x08C))

/* 
 * Power Control 
 * Chapter 4 p65
 */
#define         PCON                    (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x0C0))
#define         PCONP                   (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x0C4))

/* 
 * Clock
 * Chapter 4 p46
 */
#define         CCLKCFG                 (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x104))
#define         USBCLKCFG               (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x108))
#define         CLKSRCSEL               (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x10C))
#define         IRCTRIM                 (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x1A4))
#define         PCLKSEL0                (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x1A8))
#define         PCLKSEL1                (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x1AC))
        
/* 
 * External Interrupts 
 * Chapter 3 p30
 */
#define         EXTINT                  (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x140))
#define         INTWAKE                 (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x144))
#define         EXTMODE                 (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x148))
#define         EXTPOLAR                (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x14C))

/* 
 * Reset Source
 * Chapter 3 p31
 */
#define         RSIR                    (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x180))
#define         RSID                    (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x180)) /* alias name in manual */

/* 
 * AHB configuration 
 * Chapter 3 p38
 */
#define         AHBCFG1                 (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x188))
#define         AHBCFG2                 (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x18C))

/* 
 * System Controls and Status 
 * Chapter 3 p42
 */
#define         SCS                     (*(volatile unsigned int *)(SCB_BASE_ADDR + 0x1A0))

/*
 * Vectored Interrupt Controller "VIC" 
 * Chapter 6 p86
 */
#define         VIC_BASE_ADDR           0xFFFFF000

#define         VICIRQStatus            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x000))
#define         VICFIQStatus            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x004))
#define         VICRawIntr              (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x008))
#define         VICIntSelect            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x00C))
#define         VICIntEnable            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x010))
#define         VICIntEnClr             (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x014))
#define         VICSoftInt              (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x018))
#define         VICSoftIntClr           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x01C))
#define         VICProtection           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x020))
#define         VICSWPriorityMask       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x024))

#define         VICVectAddr0            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x100))
#define         VICVectAddr1            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x104))
#define         VICVectAddr2            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x108))
#define         VICVectAddr3            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x10C))
#define         VICVectAddr4            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x110))
#define         VICVectAddr5            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x114))
#define         VICVectAddr6            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x118))
#define         VICVectAddr7            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x11C))
#define         VICVectAddr8            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x120))
#define         VICVectAddr9            (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x124))
#define         VICVectAddr10           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x128))
#define         VICVectAddr11           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x12C))
#define         VICVectAddr12           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x130))
#define         VICVectAddr13           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x134))
#define         VICVectAddr14           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x138))
#define         VICVectAddr15           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x13C))
#define         VICVectAddr16           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x140))
#define         VICVectAddr17           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x144))
#define         VICVectAddr18           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x148))
#define         VICVectAddr19           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x14C))
#define         VICVectAddr20           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x150))
#define         VICVectAddr21           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x154))
#define         VICVectAddr22           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x158))
#define         VICVectAddr23           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x15C))
#define         VICVectAddr24           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x160))
#define         VICVectAddr25           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x164))
#define         VICVectAddr26           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x168))
#define         VICVectAddr27           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x16C))
#define         VICVectAddr28           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x170))
#define         VICVectAddr29           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x174))
#define         VICVectAddr30           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x178))
#define         VICVectAddr31           (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x17C))

#define         VICVectPriority0        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x200))
#define         VICVectPriority1        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x204))
#define         VICVectPriority2        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x208))
#define         VICVectPriority3        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x20C))
#define         VICVectPriority4        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x210))
#define         VICVectPriority5        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x214))
#define         VICVectPriority6        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x218))
#define         VICVectPriority7        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x21C))
#define         VICVectPriority8        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x220))
#define         VICVectPriority9        (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x224))
#define         VICVectPriority10       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x228))
#define         VICVectPriority11       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x22C))
#define         VICVectPriority12       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x230))
#define         VICVectPriority13       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x234))
#define         VICVectPriority14       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x238))
#define         VICVectPriority15       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x23C))
#define         VICVectPriority16       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x240))
#define         VICVectPriority17       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x244))
#define         VICVectPriority18       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x248))
#define         VICVectPriority19       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x24C))
#define         VICVectPriority20       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x250))
#define         VICVectPriority21       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x254))
#define         VICVectPriority22       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x258))
#define         VICVectPriority23       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x25C))
#define         VICVectPriority24       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x260))
#define         VICVectPriority25       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x264))
#define         VICVectPriority26       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x268))
#define         VICVectPriority27       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x26C))
#define         VICVectPriority28       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x270))
#define         VICVectPriority29       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x274))
#define         VICVectPriority30       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x278))
#define         VICVectPriority31       (*(volatile unsigned int *)(VIC_BASE_ADDR + 0x27C))

#define         VICAddress              (*(volatile unsigned int *)(VIC_BASE_ADDR + 0xF00))

/* 
 * Pin Connect Block 
 * Chapter 9 p155
 */
#define         PINCONN_BASE_ADDR       0xE002C000

#define         PINSEL0                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x000))
#define         PINSEL1                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x004))
#define         PINSEL2                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x008))
#define         PINSEL3                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x00C))
#define         PINSEL4                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x010))
#define         PINSEL5                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x014))
#define         PINSEL6                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x018))
#define         PINSEL7                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x01C))
#define         PINSEL8                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x020))
#define         PINSEL9                 (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x024))
#define         PINSEL10                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x028))

#define         PINMODE0                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x040))
#define         PINMODE1                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x044))
#define         PINMODE2                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x048))
#define         PINMODE3                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x04C))
#define         PINMODE4                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x050))
#define         PINMODE5                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x054))
#define         PINMODE6                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x058))
#define         PINMODE7                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x05C))
#define         PINMODE8                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x060))
#define         PINMODE9                (*(volatile unsigned int *)(PINCONN_BASE_ADDR + 0x064))

/* 
 * General Purpose Input/Output (GPIO) 
 * Chapter 10 p171
 */
#define         GPIO_BASE_ADDR          0xE0028000

#define         IOPIN0                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x000))
#define         IO0PIN                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x000))
#define         IOSET0                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x004))
#define         IO0SET                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x004))
#define         IODIR0                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x008))
#define         IO0DIR                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x008))
#define         IOCLR0                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x00C))
#define         IO0CLR                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x00C))

#define         IOPIN1                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x010))
#define         IO1PIN                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x010))
#define         IOSET1                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x014))
#define         IO1SET                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x014))
#define         IODIR1                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x018))
#define         IO1DIR                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x018))
#define         IOCLR1                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x01C))
#define         IO1CLR                  (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x01C))

/* 
 * GPIO Interrupt Registers 
 * Chapter 10 p173
 * (Typo in manual for register Base+0x094 and Base+0x0B4)
 */
#define         IO0IntEnR               (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x090)) 
#define         IO0IntEnF               (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x094))
#define         IO0IntStatR             (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x084))
#define         IO0IntStatF             (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x088))
#define         IO0IntClr               (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x08C))

#define         IO2IntEnR               (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x0B0)) 
#define         IO2IntEnF               (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x0B4))
#define         IO2IntStatR             (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x0A4))
#define         IO2IntStatF             (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x0A8))
#define         IO2IntClr               (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x0AC))

#define         IOIntStat               (*(volatile unsigned int *)(GPIO_BASE_ADDR + 0x080))

/*
 * Part Configuration Register
 * Chapter 2 p28, no description available
 */
#define         PARTCFG_BASE_ADDR       0x3FFF8000
#define         PARTCFG                 (*(volatile unsigned int *)(PARTCFG_BASE_ADDR + 0x000)) 

/* 
 * Fast I/O
 * Chapter 9 p173 
 */
#define         FIO_BASE_ADDR           0x3FFFC000

#define         FIO0DIR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x000)) 
#define         FIO0MASK                (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x010))
#define         FIO0PIN                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x014))
#define         FIO0SET                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x018))
#define         FIO0CLR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x01C))

#define         FIO1DIR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x020)) 
#define         FIO1MASK                (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x030))
#define         FIO1PIN                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x034))
#define         FIO1SET                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x038))
#define         FIO1CLR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x03C))

#define         FIO2DIR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x040)) 
#define         FIO2MASK                (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x050))
#define         FIO2PIN                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x054))
#define         FIO2SET                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x058))
#define         FIO2CLR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x05C))

#define         FIO3DIR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x060)) 
#define         FIO3MASK                (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x070))
#define         FIO3PIN                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x074))
#define         FIO3SET                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x078))
#define         FIO3CLR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x07C))

#define         FIO4DIR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x080)) 
#define         FIO4MASK                (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x090))
#define         FIO4PIN                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x094))
#define         FIO4SET                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x098))
#define         FIO4CLR                 (*(volatile unsigned int *)(FIO_BASE_ADDR + 0x09C))

/*
 * FIO sub-wordsize addressing
 * Chapter 10 p175
 */
#define         FIO0DIR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x000)) 
#define         FIO1DIR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x020)) 
#define         FIO2DIR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x040)) 
#define         FIO3DIR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x060)) 
#define         FIO4DIR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x080)) 

#define         FIO0DIR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x001)) 
#define         FIO1DIR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x021)) 
#define         FIO2DIR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x041)) 
#define         FIO3DIR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x061)) 
#define         FIO4DIR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x081)) 

#define         FIO0DIR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x002)) 
#define         FIO1DIR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x022)) 
#define         FIO2DIR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x042)) 
#define         FIO3DIR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x062)) 
#define         FIO4DIR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x082)) 

#define         FIO0DIR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x003)) 
#define         FIO1DIR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x023)) 
#define         FIO2DIR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x043)) 
#define         FIO3DIR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x063)) 
#define         FIO4DIR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x083)) 

#define         FIO0DIRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x000)) 
#define         FIO1DIRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x020)) 
#define         FIO2DIRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x040)) 
#define         FIO3DIRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x060)) 
#define         FIO4DIRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x080)) 

#define         FIO0DIRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x002)) 
#define         FIO1DIRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x022)) 
#define         FIO2DIRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x042)) 
#define         FIO3DIRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x062)) 
#define         FIO4DIRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x082)) 

#define         FIO0MASK0               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x010)) 
#define         FIO1MASK0               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x030)) 
#define         FIO2MASK0               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x050)) 
#define         FIO3MASK0               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x070)) 
#define         FIO4MASK0               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x090)) 

#define         FIO0MASK1               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x011)) 
#define         FIO1MASK1               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x021)) 
#define         FIO2MASK1               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x051)) 
#define         FIO3MASK1               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x071)) 
#define         FIO4MASK1               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x091)) 

#define         FIO0MASK2               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x012)) 
#define         FIO1MASK2               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x032)) 
#define         FIO2MASK2               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x052)) 
#define         FIO3MASK2               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x072)) 
#define         FIO4MASK2               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x092)) 

#define         FIO0MASK3               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x013)) 
#define         FIO1MASK3               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x033)) 
#define         FIO2MASK3               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x053)) 
#define         FIO3MASK3               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x073)) 
#define         FIO4MASK3               (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x093)) 

#define         FIO0MASKL               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x010)) 
#define         FIO1MASKL               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x030)) 
#define         FIO2MASKL               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x050)) 
#define         FIO3MASKL               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x070)) 
#define         FIO4MASKL               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x090)) 

#define         FIO0MASKU               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x012)) 
#define         FIO1MASKU               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x032)) 
#define         FIO2MASKU               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x052)) 
#define         FIO3MASKU               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x072)) 
#define         FIO4MASKU               (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x092)) 

#define         FIO0PIN0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x014)) 
#define         FIO1PIN0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x034)) 
#define         FIO2PIN0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x054)) 
#define         FIO3PIN0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x074)) 
#define         FIO4PIN0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x094)) 

#define         FIO0PIN1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x015)) 
#define         FIO1PIN1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x025)) 
#define         FIO2PIN1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x055)) 
#define         FIO3PIN1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x075)) 
#define         FIO4PIN1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x095)) 

#define         FIO0PIN2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x016)) 
#define         FIO1PIN2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x036)) 
#define         FIO2PIN2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x056)) 
#define         FIO3PIN2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x076)) 
#define         FIO4PIN2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x096)) 

#define         FIO0PIN3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x017)) 
#define         FIO1PIN3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x037)) 
#define         FIO2PIN3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x057)) 
#define         FIO3PIN3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x077)) 
#define         FIO4PIN3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x097)) 

#define         FIO0PINL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x014)) 
#define         FIO1PINL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x034)) 
#define         FIO2PINL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x054)) 
#define         FIO3PINL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x074)) 
#define         FIO4PINL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x094)) 

#define         FIO0PINU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x016)) 
#define         FIO1PINU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x036)) 
#define         FIO2PINU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x056)) 
#define         FIO3PINU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x076)) 
#define         FIO4PINU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x096)) 

#define         FIO0SET0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x018)) 
#define         FIO1SET0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x038)) 
#define         FIO2SET0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x058)) 
#define         FIO3SET0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x078)) 
#define         FIO4SET0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x098)) 

#define         FIO0SET1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x019)) 
#define         FIO1SET1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x029)) 
#define         FIO2SET1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x059)) 
#define         FIO3SET1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x079)) 
#define         FIO4SET1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x099)) 

#define         FIO0SET2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x01A)) 
#define         FIO1SET2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x03A)) 
#define         FIO2SET2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x05A)) 
#define         FIO3SET2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x07A)) 
#define         FIO4SET2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x09A)) 

#define         FIO0SET3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x01B)) 
#define         FIO1SET3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x03B)) 
#define         FIO2SET3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x05B)) 
#define         FIO3SET3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x07B)) 
#define         FIO4SET3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x09B)) 

#define         FIO0SETL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x018)) 
#define         FIO1SETL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x038)) 
#define         FIO2SETL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x058)) 
#define         FIO3SETL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x078)) 
#define         FIO4SETL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x098)) 

#define         FIO0SETU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x01A)) 
#define         FIO1SETU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x03A)) 
#define         FIO2SETU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x05A)) 
#define         FIO3SETU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x07A)) 
#define         FIO4SETU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x09A)) 

#define         FIO0CLR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x01C)) 
#define         FIO1CLR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x03C)) 
#define         FIO2CLR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x05C)) 
#define         FIO3CLR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x07C)) 
#define         FIO4CLR0                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x09C)) 

#define         FIO0CLR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x01D)) 
#define         FIO1CLR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x02D)) 
#define         FIO2CLR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x05D)) 
#define         FIO3CLR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x07D)) 
#define         FIO4CLR1                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x09D)) 

#define         FIO0CLR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x01E)) 
#define         FIO1CLR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x03E)) 
#define         FIO2CLR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x05E)) 
#define         FIO3CLR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x07E)) 
#define         FIO4CLR2                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x09E)) 

#define         FIO0CLR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x01F)) 
#define         FIO1CLR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x03F)) 
#define         FIO2CLR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x05F)) 
#define         FIO3CLR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x07F)) 
#define         FIO4CLR3                (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x09F)) 

#define         FIO0CLRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x01C)) 
#define         FIO1CLRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x03C)) 
#define         FIO2CLRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x05C)) 
#define         FIO3CLRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x07C)) 
#define         FIO4CLRL                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x09C)) 

#define         FIO0CLRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x01E)) 
#define         FIO1CLRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x03E)) 
#define         FIO2CLRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x05E)) 
#define         FIO3CLRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x07E)) 
#define         FIO4CLRU                (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x09E)) 


/*
 * EMC registers
 * Chapter 5 p74
 */
#define         EMC_BASE_ADDR           0xFFE08000

#define         EMCControl              (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x000))
#define         EMCStatus               (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x004))
#define         EMCConfig               (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x008))
#define         EMCStaticExtendedWait   (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x080))

#define         EMCStaticConfig0        (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x200))
#define         EMCStaticWaitWen0       (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x204))
#define         EMCStaticWaitOen0       (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x208))
#define         EMCStaticWaitRd0        (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x20C))
#define         EMCStaticWaitPage0      (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x210))
#define         EMCStaticWaitWr0        (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x214))
#define         EMCStaticWaitTurn0      (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x218))

#define         EMCStaticConfig1        (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x220))
#define         EMCStaticWaitWen1       (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x224))
#define         EMCStaticWaitOen1       (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x228))
#define         EMCStaticWaitRd1        (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x22C))
#define         EMCStaticWaitPage1      (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x230))
#define         EMCStaticWaitWr1        (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x234))
#define         EMCStaticWaitTurn1      (*(volatile unsigned int *)(EMC_BASE_ADDR + 0x238))

/* 
 * Timer 0 
 * Chapter 23 p552
 */
#define         TMR0_BASE_ADDR          0xE0004000

#define         T0IR                    (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x000))
#define         T0TCR                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x004))
#define         T0TC                    (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x008))
#define         T0PR                    (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x00C))
#define         T0PC                    (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x010))
#define         T0MCR                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x014))
#define         T0MR0                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x018))
#define         T0MR1                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x01C))
#define         T0MR2                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x020))
#define         T0MR3                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x024))
#define         T0CCR                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x028))
#define         T0CR0                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x02C))
#define         T0CR1                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x030))
#define         T0EMR                   (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x03C))
#define         T0CTCR                  (*(volatile unsigned int *)(TMR0_BASE_ADDR + 0x070))

/* 
 * Timer 1 
 */
#define         TMR1_BASE_ADDR          0xE0008000

#define         T1IR                    (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x000))
#define         T1TCR                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x004))
#define         T1TC                    (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x008))
#define         T1PR                    (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x00C))
#define         T1PC                    (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x010))
#define         T1MCR                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x014))
#define         T1MR0                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x018))
#define         T1MR1                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x01C))
#define         T1MR2                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x020))
#define         T1MR3                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x024))
#define         T1CCR                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x028))
#define         T1CR0                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x02C))
#define         T1CR1                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x030))
#define         T1EMR                   (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x03C))
#define         T1CTCR                  (*(volatile unsigned int *)(TMR1_BASE_ADDR + 0x070))

/* 
 * Timer 2 
 */
#define         TMR2_BASE_ADDR          0xE0070000
#define         T2IR                    (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x00))
#define         T2TCR                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x04))
#define         T2TC                    (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x08))
#define         T2PR                    (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x0C))
#define         T2PC                    (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x10))
#define         T2MCR                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x14))
#define         T2MR0                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x18))
#define         T2MR1                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x1C))
#define         T2MR2                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x20))
#define         T2MR3                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x24))
#define         T2CCR                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x28))
#define         T2CR0                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x2C))
#define         T2CR1                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x30))
#define         T2EMR                   (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x3C))
#define         T2CTCR                  (*(volatile unsigned int *)(TMR2_BASE_ADDR + 0x70))

/*
 * Timer 3 
 */
#define         TMR3_BASE_ADDR          0xE0074000

#define         T3IR                    (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x00))
#define         T3TCR                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x04))
#define         T3TC                    (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x08))
#define         T3PR                    (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x0C))
#define         T3PC                    (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x10))
#define         T3MCR                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x14))
#define         T3MR0                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x18))
#define         T3MR1                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x1C))
#define         T3MR2                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x20))
#define         T3MR3                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x24))
#define         T3CCR                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x28))
#define         T3CR0                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x2C))
#define         T3CR1                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x30))
#define         T3EMR                   (*(volatile unsigned int *)(TMR3_BASE_ADDR + 0x3C))


/* 
 * Pulse Width Modulator (PWM) 
 * Chapter 24 p567
 */
#define         PWM1_BASE_ADDR          0xE0018000

#define         PWM1IR                  (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x000))
#define         PWM1TCR                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x004))
#define         PWM1TC                  (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x008))
#define         PWM1PR                  (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x00C))
#define         PWM1PC                  (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x010))
#define         PWM1MCR                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x014))
#define         PWM1MR0                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x018))
#define         PWM1MR1                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x01C))
#define         PWM1MR2                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x020))
#define         PWM1MR3                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x024))
#define         PWM1CCR                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x028))
#define         PWM1CR0                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x02C))
#define         PWM1CR1                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x030))
#define         PWM1CR2                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x034))
#define         PWM1CR3                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x038))
#define         PWM1EMR                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x03C))
#define         PWM1MR4                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x040))
#define         PWM1MR5                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x044))
#define         PWM1MR6                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x048))
#define         PWM1PCR                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x04C))
#define         PWM1LER                 (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x050))
#define         PWM1CTCR                (*(volatile unsigned int *)(PWM1_BASE_ADDR + 0x070))


/* 
 * (UART0/2/3) Universal Asynchronous Receiver Transmitter 0,2,3
 * Chapter 16 p411
 */
#define         UART0_BASE_ADDR         0xE000C000

#define         U0RBR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x000))
#define         U0THR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x000))
#define         U0DLL                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x000))
#define         U0DLM                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x004))
#define         U0IER                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x004))
#define         U0IIR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x008))
#define         U0FCR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x008))
#define         U0LCR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x00C))
#define         U0LSR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x014))
#define         U0SCR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x01C))
#define         U0ACR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x020))
#define         U0FDR                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x028))
#define         U0TER                   (*(volatile unsigned char *)(UART0_BASE_ADDR + 0x030))

/* UART2 */
#define         UART2_BASE_ADDR         0xE0078000

#define         U2RBR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x000))
#define         U2THR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x000))
#define         U2DLL                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x000))
#define         U2DLM                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x004))
#define         U2IER                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x004))
#define         U2IIR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x008))
#define         U2FCR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x008))
#define         U2LCR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x00C))
#define         U2LSR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x014))
#define         U2SCR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x01C))
#define         U2ACR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x020))
#define         U2FDR                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x028))
#define         U2TER                   (*(volatile unsigned char *)(UART2_BASE_ADDR + 0x030))

/* UART3 */
#define         UART3_BASE_ADDR         0xE007C000

#define         U3RBR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x000))
#define         U3THR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x000))
#define         U3DLL                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x000))
#define         U3DLM                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x004))
#define         U3IER                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x004))
#define         U3IIR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x008))
#define         U3FCR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x008))
#define         U3LCR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x00C))
#define         U3LSR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x014))
#define         U3SCR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x01C))
#define         U3ACR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x020))
#define         U3ICR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x024)) /* UART3 only */
#define         U3FDR                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x028))
#define         U3TER                   (*(volatile unsigned char *)(UART3_BASE_ADDR + 0x030))


/* 
 * Universal Asynchronous Receiver Transmitter 1 (UART1) 
 * Chapter 17 p433
 */
#define         UART1_BASE_ADDR         0xE0010000

#define         U1RBR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x000))
#define         U1THR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x000))
#define         U1DLL                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x000))
#define         U1DLM                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x004))
#define         U1IER                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x004))
#define         U1IIR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x008))
#define         U1FCR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x008))
#define         U1LCR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x00C))
#define         U1MCR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x010))
#define         U1LSR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x014))
#define         U1MSR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x018))
#define         U1SCR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x01C))
#define         U1ACR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x020))
#define         U1FDR                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x028))
#define         U1TER                   (*(volatile unsigned char *)(UART1_BASE_ADDR + 0x030))


/* 
 * I2C0
 * Chapter 21 p511
 */
#define         I2C0_BASE_ADDR          0xE001C000

#define         I2C0CONSET              (*(volatile unsigned char  *)(I2C0_BASE_ADDR + 0x000))
#define         I2C0STAT                (*(volatile unsigned char  *)(I2C0_BASE_ADDR + 0x004))
#define         I2C0DAT                 (*(volatile unsigned char  *)(I2C0_BASE_ADDR + 0x008))
#define         I2C0ADR                 (*(volatile unsigned char  *)(I2C0_BASE_ADDR + 0x00C))
#define         I2C0SCLH                (*(volatile unsigned short *)(I2C0_BASE_ADDR + 0x010))
#define         I2C0SCLL                (*(volatile unsigned short *)(I2C0_BASE_ADDR + 0x014))
#define         I2C0CONCLR              (*(volatile unsigned char  *)(I2C0_BASE_ADDR + 0x018))


/* 
 * I2C1
 */
#define         I2C1_BASE_ADDR          0xE005C000

#define         I2C1CONSET              (*(volatile unsigned char  *)(I2C1_BASE_ADDR + 0x000))
#define         I2C1STAT                (*(volatile unsigned char  *)(I2C1_BASE_ADDR + 0x004))
#define         I2C1DAT                 (*(volatile unsigned char  *)(I2C1_BASE_ADDR + 0x008))
#define         I2C1ADR                 (*(volatile unsigned char  *)(I2C1_BASE_ADDR + 0x00C))
#define         I2C1SCLH                (*(volatile unsigned short *)(I2C1_BASE_ADDR + 0x010))
#define         I2C1SCLL                (*(volatile unsigned short *)(I2C1_BASE_ADDR + 0x014))
#define         I2C1CONCLR              (*(volatile unsigned char  *)(I2C1_BASE_ADDR + 0x018))

/* 
 * I2C2
 */
#define         I2C2_BASE_ADDR          0xE0080000

#define         I2C2CONSET              (*(volatile unsigned char  *)(I2C2_BASE_ADDR + 0x000))
#define         I2C2STAT                (*(volatile unsigned char  *)(I2C2_BASE_ADDR + 0x004))
#define         I2C2DAT                 (*(volatile unsigned char  *)(I2C2_BASE_ADDR + 0x008))
#define         I2C2ADR                 (*(volatile unsigned char  *)(I2C2_BASE_ADDR + 0x00C))
#define         I2C2SCLH                (*(volatile unsigned short *)(I2C2_BASE_ADDR + 0x010))
#define         I2C2SCLL                (*(volatile unsigned short *)(I2C2_BASE_ADDR + 0x014))
#define         I2C2CONCLR              (*(volatile unsigned char  *)(I2C2_BASE_ADDR + 0x018))


/* 
 * SPI0 (Serial Peripheral Interface 0) 
 * Chapter 18 p461
 */
#define         SPI0_BASE_ADDR          0xE0020000

#define         S0SPCR                  (*(volatile unsigned short *)(SPI0_BASE_ADDR + 0x000))
#define         S0SPSR                  (*(volatile unsigned char  *)(SPI0_BASE_ADDR + 0x004))
#define         S0SPDR                  (*(volatile unsigned short *)(SPI0_BASE_ADDR + 0x008))
#define         S0SPCCR                 (*(volatile unsigned char  *)(SPI0_BASE_ADDR + 0x00C))
#define         S0SPINT                 (*(volatile unsigned char  *)(SPI0_BASE_ADDR + 0x01C))

/* 
 * SSP0
 * Chapter 19 p474
 */
#define         SSP0_BASE_ADDR          0xE0068000

#define         SSP0CR0                 (*(volatile unsigned short *)(SSP0_BASE_ADDR + 0x000))
#define         SSP0CR1                 (*(volatile unsigned char  *)(SSP0_BASE_ADDR + 0x004))
#define         SSP0DR                  (*(volatile unsigned short *)(SSP0_BASE_ADDR + 0x008))
#define         SSP0SR                  (*(volatile unsigned char  *)(SSP0_BASE_ADDR + 0x00C))
#define         SSP0CPSR                (*(volatile unsigned char  *)(SSP0_BASE_ADDR + 0x010))
#define         SSP0IMSC                (*(volatile unsigned char  *)(SSP0_BASE_ADDR + 0x014))
#define         SSP0RIS                 (*(volatile unsigned char  *)(SSP0_BASE_ADDR + 0x018))
#define         SSP0MIS                 (*(volatile unsigned char  *)(SSP0_BASE_ADDR + 0x01C))
#define         SSP0ICR                 (*(volatile unsigned char  *)(SSP0_BASE_ADDR + 0x020))
#define         SSP0DMACR               (*(volatile unsigned short *)(SSP0_BASE_ADDR + 0x024))

/* 
 * SSP1
 */
#define         SSP1_BASE_ADDR          0xE0030000

#define         SSP1CR0                 (*(volatile unsigned short *)(SSP1_BASE_ADDR + 0x000))
#define         SSP1CR1                 (*(volatile unsigned char  *)(SSP1_BASE_ADDR + 0x004))
#define         SSP1DR                  (*(volatile unsigned short *)(SSP1_BASE_ADDR + 0x008))
#define         SSP1SR                  (*(volatile unsigned char  *)(SSP1_BASE_ADDR + 0x00C))
#define         SSP1CPSR                (*(volatile unsigned char  *)(SSP1_BASE_ADDR + 0x010))
#define         SSP1IMSC                (*(volatile unsigned char  *)(SSP1_BASE_ADDR + 0x014))
#define         SSP1RIS                 (*(volatile unsigned char  *)(SSP1_BASE_ADDR + 0x018))
#define         SSP1MIS                 (*(volatile unsigned char  *)(SSP1_BASE_ADDR + 0x01C))
#define         SSP1ICR                 (*(volatile unsigned char  *)(SSP1_BASE_ADDR + 0x020))
#define         SSP1DMACR               (*(volatile unsigned short *)(SSP1_BASE_ADDR + 0x024))


/* 
 * Real Time Clock 
 * Chapter 26 p583
 */
#define         RTC_BASE_ADDR           0xE0024000

#define         RTC_ILR                 (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x000))
#define         RTC_CTC                 (*(volatile unsigned short *)(RTC_BASE_ADDR + 0x004))
#define         RTC_CTCR                (*(volatile unsigned short *)(RTC_BASE_ADDR + 0x004))
#define         RTC_CCR                 (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x008))
#define         RTC_CIIR                (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x00C))
#define         RTC_AMR                 (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x010))
#define         RTC_CTIME0              (*(volatile unsigned int   *)(RTC_BASE_ADDR + 0x014))
#define         RTC_CTIME1              (*(volatile unsigned int   *)(RTC_BASE_ADDR + 0x018))
#define         RTC_CTIME2              (*(volatile unsigned int   *)(RTC_BASE_ADDR + 0x01C))
#define         RTC_SEC                 (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x020))
#define         RTC_MIN                 (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x024))
#define         RTC_HOUR                (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x028))
#define         RTC_DOM                 (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x02C))
#define         RTC_DOW                 (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x030))
#define         RTC_DOY                 (*(volatile unsigned short *)(RTC_BASE_ADDR + 0x034))
#define         RTC_MONTH               (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x038))
#define         RTC_YEAR                (*(volatile unsigned short *)(RTC_BASE_ADDR + 0x03C))
#define         RTC_CISS                (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x040))
#define         RTC_ALSEC               (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x060))
#define         RTC_ALMIN               (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x064))
#define         RTC_ALHOUR              (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x068))
#define         RTC_ALDOM               (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x06C))
#define         RTC_ALDOW               (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x070))
#define         RTC_ALDOY               (*(volatile unsigned short *)(RTC_BASE_ADDR + 0x074))
#define         RTC_ALMON               (*(volatile unsigned char  *)(RTC_BASE_ADDR + 0x078))
#define         RTC_ALYEAR              (*(volatile unsigned short *)(RTC_BASE_ADDR + 0x07C))
#define         RTC_PREINT              (*(volatile unsigned short *)(RTC_BASE_ADDR + 0x080))
#define         RTC_PREFRAC             (*(volatile unsigned short *)(RTC_BASE_ADDR + 0x084))


/* 
 * ADC0
 * Chapter 27 p597
 */
#define         AD0_BASE_ADDR           0xE0034000

#define         AD0CR                   (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x00))
#define         AD0GDR                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x04))
#define         AD0INTEN                (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x0C))
#define         AD0DR0                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x10))
#define         AD0DR1                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x14))
#define         AD0DR2                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x18))
#define         AD0DR3                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x1C))
#define         AD0DR4                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x20))
#define         AD0DR5                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x24))
#define         AD0DR6                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x28))
#define         AD0DR7                  (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x2C))
#define         AD0STAT                 (*(volatile unsigned int *)(AD0_BASE_ADDR + 0x30))


/* 
 * DAC
 * Chapter 28 p603
 */
#define DAC_BASE_ADDR                   0xE006C000

#define DACR                            (*(volatile unsigned int *)(DAC_BASE_ADDR + 0x00))


/* 
 * WDT WatchDog Timer 
 * Chapter 25 p576
 */
#define WDG_BASE_ADDR                   0xE0000000

#define         WDMOD                   (*(volatile unsigned char *)(WDG_BASE_ADDR + 0x00))
#define         WDTC                    (*(volatile unsigned int  *)(WDG_BASE_ADDR + 0x04))
#define         WDFEED                  (*(volatile unsigned char *)(WDG_BASE_ADDR + 0x08))
#define         WDTV                    (*(volatile unsigned int  *)(WDG_BASE_ADDR + 0x0C))
#define         WDCLKSEL                (*(volatile unsigned int  *)(WDG_BASE_ADDR + 0x10))

/*
 * CAN CONTROLLERS / ACCEPTANCE FILTER 
 * Chapter 12 p263
 */
#define         CAN_ACCEPT_BASE_ADDR    0xE003C000

#define         CAN_AFMR                (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x000))      
#define         CAN_SFF_sa              (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x004))      
#define         CAN_SFF_GRP_sa          (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x008))
#define         CAN_EFF_sa              (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x00C))
#define         CAN_EFF_GRP_sa          (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x010))      
#define         CAN_EOT                 (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x014))
#define         CAN_ENDofTable          (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x014))
#define         CAN_LUT_ERR_ADR         (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x018))      
#define         CAN_LUTerrAd            (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x018))      
#define         CAN_LUT_ERR             (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x01C))
#define         CAN_LUTerr              (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x01C))
#define         CAN_FCANIE              (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x020))
#define         CAN_FCANIC0             (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x024))
#define         CAN_FCANIC1             (*(volatile unsigned int *)(CAN_ACCEPT_BASE_ADDR + 0x028))

#define         CAN_CENTRAL_BASE_ADDR   0xE0040000      

#define         CANTxSR                 (*(volatile unsigned int *)(CAN_CENTRAL_BASE_ADDR + 0x000))     
#define         CANRxSR                 (*(volatile unsigned int *)(CAN_CENTRAL_BASE_ADDR + 0x004))     
#define         CANMSR                  (*(volatile unsigned int *)(CAN_CENTRAL_BASE_ADDR + 0x008))

#define         CAN1_BASE_ADDR          0xE0044000

#define         CAN1MOD                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x000))    
#define         CAN1CMR                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x004))    
#define         CAN1GSR                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x008))    
#define         CAN1ICR                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x00C))    
#define         CAN1IER                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x010))
#define         CAN1BTR                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x014))    
#define         CAN1EWL                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x018))    
#define         CAN1SR                  (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x01C))    
#define         CAN1RFS                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x020))    
#define         CAN1RID                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x024))
#define         CAN1RDA                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x028))    
#define         CAN1RDB                 (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x02C))
                
#define         CAN1TFI1                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x030))    
#define         CAN1TID1                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x034))    
#define         CAN1TDA1                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x038))
#define         CAN1TDB1                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x03C))    
#define         CAN1TFI2                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x040))    
#define         CAN1TID2                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x044))    
#define         CAN1TDA2                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x048))    
#define         CAN1TDB2                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x04C))
#define         CAN1TFI3                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x050))    
#define         CAN1TID3                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x054))    
#define         CAN1TDA3                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x058))    
#define         CAN1TDB3                (*(volatile unsigned int *)(CAN1_BASE_ADDR + 0x05C))

#define         CAN2_BASE_ADDR          0xE0048000

#define         CAN2MOD                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x000))    
#define         CAN2CMR                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x004))    
#define         CAN2GSR                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x008))    
#define         CAN2ICR                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x00C))    
#define         CAN2IER                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x010))
#define         CAN2BTR                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x014))    
#define         CAN2EWL                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x018))    
#define         CAN2SR                  (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x01C))    
#define         CAN2RFS                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x020))    
#define         CAN2RID                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x024))
#define         CAN2RDA                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x028))    
#define         CAN2RDB                 (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x02C))
                
#define         CAN2TFI1                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x030))    
#define         CAN2TID1                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x034))    
#define         CAN2TDA1                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x038))
#define         CAN2TDB1                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x03C))    
#define         CAN2TFI2                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x040))    
#define         CAN2TID2                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x044))    
#define         CAN2TDA2                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x048))    
#define         CAN2TDB2                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x04C))
#define         CAN2TFI3                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x050))    
#define         CAN2TID3                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x054))    
#define         CAN2TDA3                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x058))    
#define         CAN2TDB3                (*(volatile unsigned int *)(CAN2_BASE_ADDR + 0x05C))


/* 
 * MCI
 * Chapter 20 p493
 */
#define         MCI_BASE_ADDR           0xE008C000

#define         MCIPower                (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x000))
#define         MCIClock                (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x004))
#define         MCIArgument             (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x008))
#define         MCICommand              (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x00C))
#define         MCIRespCmd              (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x010))
#define         MCIResponse0            (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x014))
#define         MCIResponse1            (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x018))
#define         MCIResponse2            (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x01C))
#define         MCIResponse3            (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x020))
#define         MCIDataTimer            (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x024))
#define         MCIDataLength           (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x028))
#define         MCIDataCtrl             (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x02C))
#define         MCIDataCnt              (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x030))
#define         MCIStatus               (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x034))
#define         MCIClear                (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x038))
#define         MCIMask0                (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x03C))
#define         MCIMask1                (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x040))
#define         MCIFifoCnt              (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x048))
#define         MCIFIFO                 (*(volatile unsigned int *)(MCI_BASE_ADDR + 0x080))


/* 
 * I2S
 * Chapter 22 p543
 */
#define         I2S_BASE_ADDR          0xE0088000

#define         I2SDAO                  (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x000))
#define         I2SDAI                  (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x004))
#define         I2STXFIFO               (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x008))
#define         I2SRXFIFO               (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x00C))
#define         I2SSTATE                (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x010))
#define         I2SDMA1                 (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x014))
#define         I2SDMA2                 (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x018))
#define         I2SIRQ                  (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x01C))
#define         I2STXRATE               (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x020))
#define         I2SRXRATE               (*(volatile unsigned int *)(I2S_BASE_ADDR + 0x024))


/* 
 * GPDMA
 * Chapter 30 p638
 */
#define         GPDMA_BASE_ADDR         0xFFE04000

#define         DMACIntStatus           (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x000))
#define         DMACIntTCStatus         (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x004))
#define         DMACIntTCClear          (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x008))
#define         DMACIntErrorStatus      (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x00C))
#define         DMACIntErrClr           (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x010))
#define         DMACRawIntTCStatus      (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x014))
#define         DMACRawIntErrorStatus   (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x018))
#define         DMACEnbldChns           (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x01C))
#define         DMACSoftBReq            (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x020))
#define         DMACSoftSReq            (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x024))
#define         DMACSoftLBReq           (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x028))
#define         DMACSoftLSReq           (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x02C))
#define         DMACConfiguration       (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x030))
#define         DMACSync                (*(volatile unsigned int *)(GPDMA_BASE_ADDR + 0x034))

/* channel 0 */
#define         DMACC0SrcAddr           (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x100))
#define         DMACC0DestAddr          (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x104))
#define         DMACC0LLI               (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x108))
#define         DMACC0Control           (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x10C))
#define         DMACC0Configuration     (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x110))

/* channel 1 */
#define         DMACC1SrcAddr           (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x120))
#define         DMACC1DestAddr          (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x124))
#define         DMACC1LLI               (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x128))
#define         DMACC1Control           (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x12C))
#define         DMACC1Configuration     (*(volatile unsigned int *)(DMA_BASE_ADDR + 0x130))


/*
 * USB
 * Chapter 13, 14, 15 
 */

/* USB Controller */
#define         USB_BASE_ADDR           0xFFE0C000

/* USBPortSel only available on the LPC2378 */
#define         USBPortSel              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x110))

/* USB Clock Control Registers */
#define         USBClkCtrl              (*(volatile unsigned int *)(USB_BASE_ADDR + 0xFF4))
#define         USBClkSt                (*(volatile unsigned int *)(USB_BASE_ADDR + 0xFF8))

/* USB Device Interrupt Registers */
#define         USBIntSt                (*(volatile unsigned int *)(USB_BASE_ADDR + 0x1C0))
#define         USBDevIntSt             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x200))
#define         USBDevIntEn             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x204))
#define         USBDevIntClr            (*(volatile unsigned int *)(USB_BASE_ADDR + 0x208))
#define         USBDevIntSet            (*(volatile unsigned int *)(USB_BASE_ADDR + 0x20C))
#define         USBDevIntPri            (*(volatile unsigned int *)(USB_BASE_ADDR + 0x22C))

/* USB Device Endpoint Interrupt Registers */
#define         USBEpIntSt              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x230))
#define         USBEpIntEn              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x234))
#define         USBEpIntClr             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x238))
#define         USBEpIntSet             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x23C))
#define         USBEpIntPri             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x240))

/* USB Device Endpoint Realization Registers */
#define         USBReEp                 (*(volatile unsigned int *)(USB_BASE_ADDR + 0x244))
#define         USBEpInd                (*(volatile unsigned int *)(USB_BASE_ADDR + 0x248))
#define         USBMaxPSize             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x24C))

/* USB Device Data Transfer Registers */
#define         USBRxData               (*(volatile unsigned int *)(USB_BASE_ADDR + 0x218))
#define         USBRxPLen               (*(volatile unsigned int *)(USB_BASE_ADDR + 0x220))
#define         USBTxData               (*(volatile unsigned int *)(USB_BASE_ADDR + 0x21C))
#define         USBTxPLen               (*(volatile unsigned int *)(USB_BASE_ADDR + 0x224))
#define         USBCtrl                 (*(volatile unsigned int *)(USB_BASE_ADDR + 0x228))

/* USB SIE Command Reagisters */
#define         USBCmdCode              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x210))
#define         USBCmdData              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x214))

/* USB Device DMA Registers */
#define         USBDMARSt               (*(volatile unsigned int *)(USB_BASE_ADDR + 0x250))
#define         USBDMARClr              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x254))
#define         USBDMARSet              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x258))
#define         USBUDCAH                (*(volatile unsigned int *)(USB_BASE_ADDR + 0x280))
#define         USBEpDMASt              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x284))
#define         USBEpDMAEn              (*(volatile unsigned int *)(USB_BASE_ADDR + 0x288))
#define         USBEpDMADis             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x28C))
#define         USBDMAIntSt             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x290))
#define         USBDMAIntEn             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x294))
#define         USBEoTIntSt             (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2A0))
#define         USBEoTIntClr            (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2A4))
#define         USBEoTIntSet            (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2A8))
#define         USBNDDRIntSt            (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2AC))
#define         USBNDDRIntClr           (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2B0))
#define         USBNDDRIntSet           (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2B4))
#define         USBSysErrIntSt          (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2B8))
#define         USBSysErrIntClr         (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2BC))
#define         USBSysErrIntSet         (*(volatile unsigned int *)(USB_BASE_ADDR + 0x2C0))

/* 
 * Ethernet MAC 
 * Chapter 11 p193
 */
#define         MAC_BASE_ADDR           0xFFE00000

#define         MAC1                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x000)) 
#define         MAC2                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x004)) 
#define         IPGT                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x008))
#define         IPGR                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x00C))
#define         CLRT                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x010))
#define         MAXF                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x014))
#define         SUPP                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x018))
#define         TEST                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x01C))
#define         MCFG                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x020))
#define         MCMD                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x024))
#define         MADR                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x028))
#define         MWTD                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x02C))
#define         MRDD                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x030))
#define         MIND                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x034))

#define         SA0                     (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x040))
#define         SA1                     (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x044))
#define         SA2                     (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x048))

#define         Command                 (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x100))
#define         Status                  (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x104))
#define         RxDescriptor            (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x108))
#define         RxStatus                (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x10C))
#define         RxDescriptorNumber      (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x110))
#define         RxProduceIndex          (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x114))
#define         RxConsumeIndex          (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x118))
#define         TxDescriptor            (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x11C))
#define         TxStatus                (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x120))
#define         TxDescriptorNumber      (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x124))
#define         TxProduceIndex          (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x128))
#define         TxConsumeIndex          (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x12C))

#define         TSV0                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x158))
#define         TSV1                    (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x15C))
#define         RSV                     (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x160))

#define         FlowControlCounter      (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x170))
#define         FlowControlStatus       (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x174))

#define         RxFilterCtrl            (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x200))
#define         RxFilterWoLStatus       (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x204))
#define         RxFilterWoLClear        (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x208))

#define         HashFilterL             (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x210))
#define         HashFilterH             (*(volatile unsigned int *)(MAC_BASE_ADDR + 0x214))

#define         IntStatus               (*(volatile unsigned int *)(MAC_BASE_ADDR + 0xFE0))
#define         IntEnable               (*(volatile unsigned int *)(MAC_BASE_ADDR + 0xFE4))
#define         IntClear                (*(volatile unsigned int *)(MAC_BASE_ADDR + 0xFE8))
#define         IntSet                  (*(volatile unsigned int *)(MAC_BASE_ADDR + 0xFEC))

#define         PowerDown               (*(volatile unsigned int *)(MAC_BASE_ADDR + 0xFF4)) 


#endif

