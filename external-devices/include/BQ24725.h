/*
 * BQ24725.h
 *
 *  Created on: Sep 28, 2012
 *      Author: theo
 */

#ifndef BQ24725_H_
#define BQ24725_H_

#define BQ24725_ADDR      0b0001001

#define DEVICE_ID       0xFF
#define MANUFACTURE_ID  0xFE
#define CHARGE_CURRENT  0x14
#define CHARGE_VOLTAGE  0x15
#define INPUT_CURRENT   0x3F
#define CHARGE_OPTION   0x12


#define CHARGE_CURRENT_MASK 0x1FC0
#define CHARGE_VOLTAGE_MASK 0x7FF0
#define INPUT_CURRENT_MASK  0x1F80
#define LOWDATA_BYTE(data) ((data) & 0xFF)
#define HIGHDATA_BYTE(data) (((data) & 0xFF00) >> 8)
#define DATA_FROM_BYTES(low, high) (((low) & 0xFF) | ((high) &0xFF) << 8)

//todo: define masks for each enum
typedef enum {t150ms=0, t1300ms=0x8000}  BQ24725_ACOK_deglitch_time;
typedef enum {disabled=0, t44s=0x2000, t88s=0x4000, t175s=0x6000}
	BQ24725_WATCHDOG_timer;
typedef enum {FT59_19pct=0, FT62_65pct=0x800, FT66_55pct=0x1000,
	FT70_97pct=0x1800}  BQ24725_BAT_depletion_threshold; //todo: percent abbreviation
typedef enum {inc18pct=0, dec18pct=0x400}  BQ24725_EMI_sw_freq_adj;
typedef enum {disable=0, enable= 0x200}  BQ24725_EMI_sw_freq_adj_en;
typedef enum {l300mV=0, l500mV=0x80, l700mV=0x100, l900mV=0x180}
	BQ24725_IFAULT_HI_threshold;
typedef enum {disable=0, enable=0x40} BQ24725_LEARN_en;
typedef enum {adapter_current=0, charge_current=0x20} BQ24725_IOUT;
typedef enum {disable=0, l1_33X=0x2, l1_66X=0x4, l2_22X=0x6}
	BQ24725_ACOC_threshold;
typedef enum {enable=0, inhibit=1} BQ24725_charge_inhibit;

typedef struct BQ24725_charge_options{ //todo: default values
	BQ24725_ACOK_deglitch_time ACOK_deglitch_time;
	BQ24725_WATCHDOG_timer WATCHDOG_timer;
	BQ24725_BAT_depletion_threshold BAT_depletion_threshold;
	BQ24725_EMI_sw_freq_adj EMI_sw_freq_adj;
	BQ24725_EMI_sw_freq_adj_en EMI_sw_freq_adj_en;
	BQ24725_IFAULT_HI_threshold IFAULT_HI_threshold;
	BQ24725_LEARN_en LEARN_en;
	BQ24725_IOUT IOUT;
	BQ24725_ACOC_threshold ACOC_threshold;
	BQ24725_charge_inhibit charge_inhibit;
} BQ24725_charge_options;

#define FORM_OPTIONS_DATA(opts) (opts).ACOK_deglitch_time |\
	(opts).WATCHDOG_timer | (opts).BAT_depletion_threshold |\
	(opts).EMI_sw_freq_adj | (opts).EMI_sw_freq_adj_en |\
	(opts).IFAULT_HI_threshold | (opts).LEARN_en | (opts).IOUT |\
	(opts).ACOC_threshold | (opts).charge_inhibit

#endif /* BQ24725_H_ */
