/*
 * BQ24725.c
 * LPC23xx API for using the BQ24725 Battery Charge Controller
 */

#ifndef NULL
#define NULL 0
#endif

#include "lpc23xx-i2c.h"
#include "BQ24725.h"

static i2c_iface i2c_channel; //todo: set to invalid and check that init was called in each fn?


static void empty_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s) {
	if(!(i2c_s->xact_success)){
		uart0_putstring("\n***I2C call failed***\n");
	}
	return;
}

void BQ24725_init(i2c_iface channel, i2c_pinsel pin){
	if(is not initialized){//todo:
		i2c_init(channel, pin);
		i2c_khz(400);
	}
	i2c_channel = channel;

	//todo: gpio for acok?
	//todo: adc for IMON?
}

void BQ24725_GetDeviceID(XACT_FnCallback* callback){
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = DEVICE_ID;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;

	start_i2c_master_xact(i2c_channel, &xact, callback);
}

void BQ24725_GetManufactureID(XACT_FnCallback* callback){
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = MANUFACTURE_ID;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;

	start_i2c_master_xact(i2c_channel, &xact, callback);
}

void BQ24725_GetChargeCurrent(XACT_FnCallback* callback){
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_CURRENT;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;

	start_i2c_master_xact(i2c_channel, &xact, callback);

}
void BQ24725_SetChargeCurrent(unsigned int mA){
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
void BQ24725_GetChargeVoltage(XACT_FnCallback* callback){
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_VOLTAGE;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;

	start_i2c_master_xact(i2c_channel, &xact, callback);
}
void BQ24725_SetChargeVoltage(unsigned int mV){
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

void BQ24725_GetInputCurrent(XACT_FnCallback* callback){
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = INPUT_CURRENT;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;

	start_i2c_master_xact(i2c_channel, &xact, callback);
}
void BQ24725_SetInputCurrent(unsigned int mA){
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

void BQ24725_GetChargeOption(XACT_FnCallback* callback){
	i2c_master_xact_t xact;

	xact.i2c_tx_buffer[0] = i2c_create_write_address(BQ24725_ADDR);
	xact.i2c_tx_buffer[1] = CHARGE_OPTION;
	xact.i2c_tx_buffer[2] = i2c_create_read_address(BQ24725_ADDR);
	xact.write_length = 2;
	xact.read_length  = 3;

	start_i2c_master_xact(i2c_channel, &xact, callback);
}
void BQ24725_SetChargeOption(BQ24725_charge_options * option){
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

void BQ24725_UpdateChargeOption(uint16_t option){

}

