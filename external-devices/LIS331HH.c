
/*
 * LIS331HH.c
 * LPC23xx API LIS331HH accelerometer
 */

#include <limits.h>
#include <stdint.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-binsem.h"
#include "lpc23xx-i2c.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "lpc23xx-vic.h"
#include "printf-lpc.h"

#include "gfe2368-util.h"
#include "LIS331HH.h"

static i2c_iface i2c_channel = I2C1;

//TODO: self-test

static void empty_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s) {
	if(!(i2c_s->xact_success)){
		uart0_putstring("\n***LIS331HH I2C call failed***\n");
	}
	return;
}

void LIS331HH_init(i2c_iface i2c_ch){	
	i2c_master_xact_t accel_init;
	i2c_channel = i2c_ch;

    //ctrl register setup
	accel_init.i2c_tx_buffer[0]  = i2c_create_write_address(LIS331HH_ADDR);
	accel_init.i2c_tx_buffer[1]  = A_CTRL_REG1 | A_AUTO_INCREMENT; //initial ctrl register addr
	accel_init.i2c_tx_buffer[2]  = A_LPWR_ODR_5 | A_ALL_AXIS_ENABLE; //CTRL_REG1 data
	accel_init.i2c_tx_buffer[3]  = A_CTRL_REG2_DEFAULT;
	accel_init.i2c_tx_buffer[4]  = A_INT_ACTIVE_HIGH | A_INT1_DRDY | A_INT1_LATCH; //interupt 1 fires on data ready
	accel_init.i2c_tx_buffer[5]  = A_BDU;
	accel_init.write_length      = 0x6;
	accel_init.read_length       = 0x0;
    start_i2c_master_xact(i2c_channel, &accel_init, &empty_callback);
}

void LIS331HH_get_data(XACT_FnCallback* xact_fn){
	i2c_master_xact_t xact0_s;

	xact0_s.i2c_tx_buffer[0]  = i2c_create_write_address(LIS331HH_ADDR);
	xact0_s.i2c_tx_buffer[1]  = A_STATUS_REG | A_AUTO_INCREMENT;
	xact0_s.write_length      = 0x2;
	xact0_s.i2c_tx_buffer[2]  = i2c_create_read_address(LIS331HH_ADDR);
	xact0_s.read_length       = 0x7;

	start_i2c_master_xact(i2c_channel, &xact0_s, xact_fn);
}

int LIS331HH_data_overrun(uint8_t status_reg){
	return ((status_reg & A_ZYXOR) == A_ZYXOR);
}

int LIS331HH_data_available(uint8_t status_reg){
	return ((status_reg & A_ZYXDA) == A_ZYXDA);
}

int LIS331HH_set_ctrl_reg(int reg, uint8_t val){
	i2c_master_xact_t accel;
	uint8_t reg_addr;
	switch(reg){
	case 1:
		reg_addr = A_CTRL_REG1;
		break;
	case 2:
		reg_addr = A_CTRL_REG2;
		break;
	case 3:
		reg_addr = A_CTRL_REG3;
		break;
	case 4:
		reg_addr = A_CTRL_REG4;
		break;
	case 5:
		reg_addr = A_CTRL_REG5;
		break;
	default:
		return 0;
	}


	accel.i2c_tx_buffer[0] = i2c_create_write_address(LIS331HH_ADDR);
	accel.i2c_tx_buffer[1] = reg_addr;
	accel.i2c_tx_buffer[2] = val;
	accel.write_length     = 0x3;

	start_i2c_master_xact(i2c_channel, &accel, empty_callback);
	return 1;
}
