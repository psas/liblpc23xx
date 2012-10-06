/*
 * BQ24725.c
 * LPC23xx API for using the BQ24725 Battery Charge Controller
 */

#include <stdint.h>
#include <stdlib.h> //for NULL

#include "lpc23xx-i2c.h"
#include "BQ24725.h"

static i2c_iface i2c_channel;
static bool initialized = false;

static void empty_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s){
	if(!(i2c_s->xact_success)){
		uart0_putstring("\n***I2C call failed***\n");
		//todo: come up with a better method of error
	}
	return;
}

static void BQ24725_i2c_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s){
    if(caller->cb_data != NULL){
        BQ24725_callback callback = (BQ24725_callback)caller->cb_data;
        uint16_t data = (((uint16_t)caller->i2c_rd_buffer[0])<<8) |
                         ((uint16_t)caller->i2c_rd_buffer[1]);
        callback(data);
    }
}

uint16_t inline form_options_data(BQ24725_charge_options opts){
    return opts.ACOK_deglitch_time | opts.WATCHDOG_timer |
            opts.BAT_depletion_threshold | opts.EMI_sw_freq_adj |
            opts.EMI_sw_freq_adj_en | opts.IFAULT_HI_threshold |
            opts.LEARN_en | opts.IOUT | opts.ACOC_threshold |
            opts.charge_inhibit;
}
void inline form_options_struct(uint16_t data, BQ24725_charge_options* opt){
    opt->ACOK_deglitch_time = data & BQ24725_ACOK_deglitch_time_MASK;
    opt->WATCHDOG_timer = data & BQ24725_WATCHDOG_timer_MASK;
    opt->BAT_depletion_threshold = data & BQ24725_BAT_depletion_threshold_MASK;
    opt->EMI_sw_freq_adj = data & BQ24725_EMI_sw_freq_adj_MASK;
    opt->EMI_sw_freq_adj_en = data & BQ24725_EMI_sw_freq_adj_en_MASK;
    opt->IFAULT_HI_threshold = data & BQ24725_IFAULT_HI_threshold_MASK;
    opt->LEARN_en = data & BQ24725_LEARN_en_MASK;
    opt->IOUT = data & BQ24725_IOUT_MASK;
    opt->ACOC_threshold = data & BQ24725_ACOC_threshold_MASK;
    opt->charge_inhibit = data & BQ24725_charge_inhibit_MASK;
}


void BQ24725_init(i2c_iface channel, i2c_pinsel pin){
	if(i2c_get_state(channel) == I2C_NOT_INITIALIZED){
		i2c_init(channel, pin);
		i2c_khz(400);
	}
	i2c_channel = channel;
	initialized = true;

	//todo: gpio for acok?
	//todo: adc for IMON?
}

void BQ24725_GetDeviceID(BQ24725_callback* callback){
    if(initialized == false)
        return;

	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = DEVICE_ID;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;
	xact.cb_data = callback;

	start_i2c_master_xact(i2c_channel, &xact, BQ24725_i2c_callback);
}

void BQ24725_GetManufactureID(BQ24725_callback* callback){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = MANUFACTURE_ID;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;
    xact.cb_data = callback;

    start_i2c_master_xact(i2c_channel, &xact, BQ24725_i2c_callback);
}

void BQ24725_GetChargeCurrent(BQ24725_callback* callback){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_CURRENT;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;
    xact.cb_data = callback;

    start_i2c_master_xact(i2c_channel, &xact, BQ24725_i2c_callback);
}
void BQ24725_SetChargeCurrent(unsigned int mA){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;
	uint16_t mA_data = mA & CHARGE_CURRENT_MASK;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_CURRENT;
	xact.i2c_tx_buffer[2] = LOWDATA_BYTE(mA_data);
	xact.i2c_tx_buffer[3] = HIGHDATA_BYTE(mA_data);
	xact.write_length = 4;
	xact.read_length = 0;

	start_i2c_master_xact(i2c_channel, &xact, empty_callback);
}
void BQ24725_GetChargeVoltage(BQ24725_callback* callback){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_VOLTAGE;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;
    xact.cb_data = callback;

    start_i2c_master_xact(i2c_channel, &xact, BQ24725_i2c_callback);
}
void BQ24725_SetChargeVoltage(unsigned int mV){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;
	uint16_t mV_data = mV & CHARGE_VOLTAGE_MASK;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_CURRENT;
	xact.i2c_tx_buffer[2] = LOWDATA_BYTE(mV_data);
	xact.i2c_tx_buffer[3] = HIGHDATA_BYTE(mV_data);
	xact.write_length = 4;
	xact.read_length = 0;

	start_i2c_master_xact(i2c_channel, &xact, empty_callback);
}

void BQ24725_GetInputCurrent(BQ24725_callback* callback){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = INPUT_CURRENT;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;
    xact.cb_data = callback;

    start_i2c_master_xact(i2c_channel, &xact, BQ24725_i2c_callback);
}
void BQ24725_SetInputCurrent(unsigned int mA){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;
	uint16_t mA_data = mA & INPUT_CURRENT_MASK;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = INPUT_CURRENT;
	xact.i2c_tx_buffer[2] = LOWDATA_BYTE(mA_data);
	xact.i2c_tx_buffer[3] = HIGHDATA_BYTE(mA_data);
	xact.write_length = 4;
	xact.read_length = 0;

	start_i2c_master_xact(i2c_channel, &xact, empty_callback);
}

void BQ24725_GetChargeOption(BQ24725_callback* callback){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_OPTION;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;
    xact.cb_data = callback;

    start_i2c_master_xact(i2c_channel, &xact, BQ24725_i2c_callback);
}
void BQ24725_SetChargeOption(BQ24725_charge_options * option){
    if(initialized == false)
        return;
	i2c_master_xact_t xact;
	uint16_t option_data = FORM_OPTIONS_DATA(*option);

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_OPTION;
	xact.i2c_tx_buffer[2] = LOWDATA_BYTE(option_data);
	xact.i2c_tx_buffer[3] = HIGHDATA_BYTE(option_data);
	xact.write_length = 4;
	xact.read_length  = 0;

	start_i2c_master_xact(i2c_channel, &xact, empty_callback);
}

//void BQ24725_UpdateChargeOption(uint16_t option){
//
//}

