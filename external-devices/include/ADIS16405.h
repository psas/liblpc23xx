/* \file ADIS16405.h
 */

#ifndef _ADIS16405_H
#define _ADIS16405_H

#include "lpc23xx-spi.h"
#include "lpc23xx-util.h"

#include "ringbuffer.h"


/*! Pin connections between ADIS and LPC2368 on GFE board #6

    LPC23xx       (ADIS)         LPC2368 PIN    ADIS PIN
    -------------------------------------------------
    SCK/P0.6      (SCK)               62           3
    SSEL          (_CS)               63           6
    MISO          (DOUT)              61           4
    MOSI          (DIN)               60           5

    P1.29         (_RST)    pu=yes    45           8
  P2.10/_EINT0    (DIO1)    pu=10k    53           7
  P2.11/_EINT1    (DIO2)              52           9
    P0.5          (DIO3)              80           1
    P0.6          (DIO4/CLKIN)        79           2
                  (AUX_DAC)                       20
                  (AUX_ADC)                       21
    ---------------------------------------------
 */

#define     GPIO_PINSEL0                      0b00
#define     EINT0_PINSEL4                     0b01
#define     EINT1_PINSEL4                     0b01

#define     P0_0_PINSEL0                      0
#define     P0_5_PINSEL0                      10
#define     P0_6_PINSEL0                      12
#define     P1_29_PINSEL3                     26
#define     P2_10_PINSEL4                     20
#define     P2_11_PINSEL4                     22

#define     PINSEL_ADIS_RESET                 (PINSEL3  = (PINSEL3  & ~(0x3 << P1_29_PINSEL3)) | (GPIO_PINSEL0   << P1_29_PINSEL3))
#define     PINMODE_ADIS_RESET_PULLUP         (PINMODE3 = (PINMODE3 & ~(0x3 << P1_29_PINSEL3)) | (P0_PULLUP_MODE << P1_29_PINSEL3))
#define     PINMODE_ADIS_RESET_NOPULL         (PINMODE3 = (PINMODE3 & ~(0x3 << P1_29_PINSEL3)) | (P0_NOPULL_MODE << P1_29_PINSEL3))

#define     PINSEL_ADIS_EINT0_DIO1            (PINSEL4  = (PINSEL4  & ~(0x3 << P2_10_PINSEL4)) | (EINT0_PINSEL4  << P2_10_PINSEL4))
#define     PINMODE_ADIS_EINT0_DIO1_NOPULL    (PINMODE4 = (PINMODE4 & ~(0x3 << P2_10_PINSEL4)) | (P0_NOPULL_MODE << P2_10_PINSEL4))

#define     PINSEL_ADIS_EINT1_DIO2            (PINSEL4  = (PINSEL4  & ~(0x3 << P2_11_PINSEL4)) | (EINT1_PINSEL4  << P2_11_PINSEL4))
#define     PINMODE_ADIS_EINT1_DIO2_NOPULL    (PINMODE4 = (PINMODE4 & ~(0x3 << P2_11_PINSEL4)) | (P0_NOPULL_MODE << P2_11_PINSEL4))

#define     PINSEL_ADIS_DIO3                  (PINSEL0  = (PINSEL0  & ~(0x3 << P0_5_PINSEL0))  | (GPIO_PINSEL0   << P0_5_PINSEL0))
#define     PINMODE_ADIS_DIO3_PULLUP          (PINMODE0 = (PINMODE0 & ~(0x3 << P0_5_PINSEL0))  | (P0_PULLUP_MODE << P0_5_PINSEL0))

#define     PINSEL_ADIS_DIO4                  (PINSEL0  = (PINSEL0  & ~(0x3 << P0_6_PINSEL0))  | (GPIO_PINSEL0   << P0_6_PINSEL0))
#define     PINMODE_ADIS_DIO4_PULLUP          (PINMODE0 = (PINMODE0 & ~(0x3 << P0_6_PINSEL0))  | (P0_PULLUP_MODE << P0_6_PINSEL0))


#define     FIO_ADIS_RESET_OUTPUT             (FIO1DIR |= (1<<29))

#define     ADIS_RESET_HIGH                   (FIO1SET |= (1<<29))
#define     ADIS_RESET_LOW                    (FIO1CLR |= (1<<29))

#define     ADIS_RESET_MSECS                  500

#define     ADIS_MAX_DATA_BUFFER              64
#define     ADIS_NUM_BURSTREAD_REGS           12

// ADIS Registers
typedef enum {
	// Name    address         default    function
	ADIS_FLASH_CNT =0x00,        // N/A     Flash memory write count
	ADIS_SUPPLY_OUT=0x02,        // N/A     Power supply measurement
	ADIS_XGYRO_OUT =0x04,        // N/A     X-axis gyroscope output
	ADIS_YGYRO_OUT =0x06,        // N/A     Y-axis gyroscope output
	ADIS_ZGYRO_OUT =0x08,        // N/A     Z-axis gyroscope output
	ADIS_XACCL_OUT =0x0A,        // N/A     X-axis accelerometer output
	ADIS_YACCL_OUT =0x0C,        // N/A     Y-axis accelerometer output
	ADIS_ZACCL_OUT =0x0E,        // N/A     Z-axis accelerometer output
	ADIS_XMAGN_OUT =0x10,        // N/A     X-axis magnetometer measurement
	ADIS_YMAGN_OUT =0x12,        // N/A     Y-axis magnetometer measurement
	ADIS_ZMAGN_OUT =0x14,        // N/A     Z-axis magnetometer measurement
	ADIS_TEMP_OUT  =0x16,        // N/A     Temperature output
	ADIS_AUX_ADC   =0x18,        // N/A     Auxiliary ADC measurement
	ADIS_XGYRO_OFF =0x1A,        // 0x0000  X-axis gyroscope bias offset factor
	ADIS_YGYRO_OFF =0x1C,        // 0x0000  Y-axis gyroscope bias offset factor
	ADIS_ZGYRO_OFF =0x1E,        // 0x0000  Z-axis gyroscope bias offset factor
	ADIS_XACCL_OFF =0x20,        // 0x0000  X-axis acceleration bias offset factor
	ADIS_YACCL_OFF =0x22,        // 0x0000  Y-axis acceleration bias offset factor
	ADIS_ZACCL_OFF =0x24,        // 0x0000  Z-axis acceleration bias offset factor
	ADIS_XMAGN_HIF =0x26,        // 0x0000  X-axis magnetometer, hard-iron factor
	ADIS_YMAGN_HIF =0x28,        // 0x0000  Y-axis magnetometer, hard-iron factor
	ADIS_ZMAGN_HIF =0x2A,        // 0x0000  Z-axis magnetometer, hard-iron factor
	ADIS_XMAGN_SIF =0x2C,        // 0x0800  X-axis magnetometer, soft-iron factor
	ADIS_YMAGN_SIF =0x2E,        // 0x0800  Y-axis magnetometer, soft-iron factor
	ADIS_ZMAGN_SIF =0x30,        // 0x0800  Z-axis magnetometer, soft-iron factor
	ADIS_GPIO_CTRL =0x32,        // 0x0000  Auxiliary digital input/output control
	ADIS_MSC_CTRL  =0x34,        // 0x0006  Miscellaneous control
	ADIS_SMPL_PRD  =0x36,        // 0x0001  Internal sample period (rate) control
	ADIS_SENS_AVG  =0x38,        // 0x0402  Dynamic range and digital filter control
	ADIS_SLP_CNT   =0x3A,        // 0x0000  Sleep mode control
	ADIS_DIAG_STAT =0x3C,        // 0x0000  System status
	ADIS_GLOB_CMD  =0x3E,        // 0x0000  System command
	ADIS_ALM_MAG1  =0x40,        // 0x0000  Alarm 1 amplitude threshold
	ADIS_ALM_MAG2  =0x42,        // 0x0000  Alarm spi_master_xact_data* caller, spi_master_xact_data* spi_xact, void* data2 amplitude threshold
	ADIS_ALM_SMPL1 =0x44,        // 0x0000  Alarm 1 sample size
	ADIS_ALM_SMPL2 =0x46,        // 0x0000  Alarm 2 sample size
	ADIS_ALM_CTRL  =0x48,        // 0x0000  Alarm control
	ADIS_AUX_DAC   =0x4A,        // 0x0000  Auxiliary DAC data
	//          =0x4C,to 0x55    //         Reserved
	ADIS_PRODUCT_ID=0x56         //         Product identifier
} adis_regaddr;

typedef struct {
	adis_regaddr        regaddr;
	uint8_t             cmd;
	SPI_XACT_FnCallback cb_fn;
	uint8_t             num_readbytes;
	uint8_t             num_writebytes;
} adis_spi_xact;

typedef struct {
	uint16_t data;
	uint8_t  valid;
} adis16D_cache_line;

typedef struct {
	adis16D_cache_line adis_id;
	adis16D_cache_line adis_sampl_per;
} adis16D_cache;

typedef struct {
	uint8_t data_high;
	uint8_t data_low;
	uint8_t valid;
} adis_cache_line;

typedef struct {
	adis_cache_line adis_prod_id;
	adis_cache_line adis_sampl_per;
} adis_cache;

/* extern declarations for interface */

extern Ringbuffer                adis_spi_done_q;

extern spi_master_xact_data      adis_read_id_xact;
extern spi_master_xact_data      adis_read_smpl_prd_xact;

extern adis_cache                adis_data_cache;

extern spi_ctl                   adis_spi_ctl;


/* function prototypes */

void adis_process_done_q() ;

void adis_read_cb(spi_master_xact_data* caller, spi_master_xact_data* spi_xact, void* data) ;

void adis_init() ;

void adis_process_done_q() ;

void adis_reset();

void adis_write_smpl_prd(uint8_t time_base, uint8_t sample_prd) ;

void adis_read_smpl_prd() ;
void adis_read_brst_mode() ;
void adis_read_id() ;
void adis_read_gpio_ctl();

void adis_read_intr(adis_spi_xact* s) ;

#endif


