/*
 * LSM303DLH.c
 * Digital compass
 * todo: accelerometer portion
 */


#include <limits.h>
#include <stdint.h>

#include "lpc23xx.h"

#include "lpc23xx-binsem.h"
#include "lpc23xx-i2c.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "lpc23xx-vic.h"
#include "printf-lpc.h"

#include "gfe2368-util.h"
#include "LSM303DLH.h"


static i2c_iface i2c_channel;

static void empty_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s) {
	if(!(i2c_s->xact_success)){
		uart0_putstring("\n***LSM303DLH I2C call failed***\n");
	}
	return;
}

void LSM303DLH_m_get_data(XACT_FnCallback* callback_fn){
	i2c_master_xact_t       gyrodata;
	gyrodata.i2c_tx_buffer[0]  = i2c_create_write_address(LSM303DLH_ADDR_M);
	gyrodata.i2c_tx_buffer[1]  = C_OUT_X_L_M | C_AUTO_INCREMENT; //Auto increment through, temperature, data status,
	gyrodata.write_length      = 0x2;					   //then all the axis data registers
	gyrodata.i2c_tx_buffer[2] =  i2c_create_read_address(LSM303DLH_ADDR_M);
	gyrodata.read_length       = 0x7;

	start_i2c_master_xact(i2c_channel, &gyrodata, callback_fn);
}

void LSM303DLH_init_m(i2c_iface i2c_ch){
	i2c_master_xact_t       gyroinit;

	i2c_channel = i2c_ch;

	gyroinit.i2c_tx_buffer[0]  = i2c_create_write_address(LSM303DLH_ADDR_M);
    gyroinit.i2c_tx_buffer[1]  = C_CRA_REG_M | C_AUTO_INCREMENT;
    gyroinit.i2c_tx_buffer[2]  = C_ODR_7_5 & C_CRA_REG_M_MASK; 	//CRA_REG_M
    gyroinit.i2c_tx_buffer[3]  = C_RANGE_1_9 & C_CRB_REG_M_MASK; 	//CRB_REG_M
    gyroinit.i2c_tx_buffer[4]  = C_CONT_CONV & C_MR_REG_M_MASK;	//MR_REG_M
    gyroinit.write_length      = 0x5;
    gyroinit.read_length       = 0x0;

    start_i2c_master_xact(i2c_channel, &gyroinit, &empty_callback);
}

int LSM303DLH_m_set_ctrl_reg(int reg, uint8_t val){
	i2c_master_xact_t mag;
	uint8_t reg_addr;
	switch(reg){
	case 1:
		reg_addr = C_CRA_REG_M;
		break;
	case 2:
		reg_addr = C_CRB_REG_M;
		break;
	case 3:
		reg_addr = C_MR_REG_M;
		break;
	default:
		return 0;
	}


	mag.i2c_tx_buffer[0] = i2c_create_write_address(LSM303DLH_ADDR_M);
	mag.i2c_tx_buffer[1] = reg_addr;
	mag.i2c_tx_buffer[2] = val;
	mag.write_length     = 0x3;

	start_i2c_master_xact(i2c_channel, &mag, empty_callback);
	return 1;
}

