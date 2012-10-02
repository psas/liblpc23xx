/*
 * L3G4200D.c
 *
 * Gyro  
 *
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
#include "L3G4200D.h"

static i2c_iface i2c_channel;

static void empty_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s) {
	if(!(i2c_s->xact_success)){
		uart0_putstring("\n***L3G4200D I2C call failed***\n");
	}
	return;
}


void L3G4200D_init(i2c_iface i2c_ch){
	i2c_master_xact_t gyroinit;

	i2c_channel = i2c_ch;

	gyroinit.i2c_tx_buffer[0]  = i2c_create_write_address(L3G4200D_ADDR);
    gyroinit.i2c_tx_buffer[1]  = G_CTRL_REG1 | G_AUTO_INCREMENT;
    gyroinit.i2c_tx_buffer[2]  = G_ODR_100 | G_PWR | G_ALL_AXIS_ENABLE; //CTRL_REG1, turn on, data rate 100Hz
    gyroinit.i2c_tx_buffer[3]  = G_CTRL_REG2_DEFAULT;
    gyroinit.i2c_tx_buffer[4]  = G_INT2_DRDY;     //CTRL_REG3, interrupt 2 fires on data ready
//    gyroinit.i2c_tx_buffer[4]  = G_BDU; //CTRL_REG4 block data update
    gyroinit.write_length      = 0x5;
    gyroinit.read_length       = 0x0;

    start_i2c_master_xact(i2c_channel, &gyroinit, &empty_callback);
}


void L3G4200D_get_data(XACT_FnCallback* callback_fn){
	i2c_master_xact_t gyrodata;

	gyrodata.i2c_tx_buffer[0]  = i2c_create_write_address(L3G4200D_ADDR);
	gyrodata.i2c_tx_buffer[1]  = G_OUT_TEMP | G_AUTO_INCREMENT; //Auto increment through, temperature, data status,
	gyrodata.write_length      = 0x2;					   //then all the axis data registers
	gyrodata.i2c_tx_buffer[2]  = i2c_create_read_address(L3G4200D_ADDR);
	gyrodata.read_length       = 0x8;

	start_i2c_master_xact(i2c_channel, &gyrodata, callback_fn);
}

int L3G4200D_data_overrun(uint8_t status_reg){
	return ((status_reg & G_ZYXOR) == G_ZYXOR);
}

int L3G4200D_data_available(uint8_t status_reg){
	return ((status_reg & G_ZYXDA) == G_ZYXDA);
}

int L3G4200D_set_ctrl_reg(int reg, uint8_t val){
	i2c_master_xact_t gyro;
	uint8_t reg_addr;
	switch(reg){
	case 1:
		reg_addr = G_CTRL_REG1;
		break;
	case 2:
		reg_addr = G_CTRL_REG2;
		break;
	case 3:
		reg_addr = G_CTRL_REG3;
		break;
	case 4:
		reg_addr = G_CTRL_REG4;
		break;
	case 5:
		reg_addr = G_CTRL_REG5;
		break;
	default:
		return 0;
	}


	gyro.i2c_tx_buffer[0] = i2c_create_write_address(L3G4200D_ADDR);
	gyro.i2c_tx_buffer[1] = reg_addr;
	gyro.i2c_tx_buffer[2] = val;
	gyro.write_length     = 0x3;

	start_i2c_master_xact(i2c_channel, &gyro, empty_callback);
	return 1;
}
