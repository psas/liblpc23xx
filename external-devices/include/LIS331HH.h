
/*
 * twodevice-test.h
 */


#ifndef _LIS331HH_H
#define _LIS331HH_H

#include "lpc23xx-i2c.h"
#include "lpc23xx.h"

void LIS331HH_init(i2c_iface);
void LIS331HH_get_data(XACT_FnCallback* xact_fn) ;
int LIS331HH_data_overrun(uint8_t status_reg);
int LIS331HH_data_available(uint8_t status_reg);
int LIS331HH_set_ctrl_reg(int, uint8_t); //todo: take a reg addr argument?

#define LIS331HH_ADDR			(0x18)

//Register addresses
#define A_AUTO_INCREMENT 		(0x80)
#define A_CTRL_REG1 			(0x20)
#define A_CTRL_REG2				(0x21)
#define A_CTRL_REG3				(0x22)
#define A_CTRL_REG4				(0x23)
#define A_CTRL_REG5				(0x24)
#define A_HP_FILTER_RESET		(0x25)
#define A_REFERENCE				(0x26)
#define A_STATUS_REG			(0x27)
#define A_OUT_X_L				(0x28)
#define A_OUT_X_H				(0x29)
#define A_OUT_Y_L				(0x2A)
#define A_OUT_Y_H				(0x2B)
#define A_OUT_Z_L				(0x2C)
#define A_OUT_Z_H				(0x2D)
#define A_INT1_CFG				(0x30)
#define A_INT1_SOURCE			(0x31)
#define A_INT1_THS				(0x32)
#define A_INT1_DURATION			(0x33)
#define A_INT2_CFG				(0x34)
#define A_INT2_SOURCE			(0x35)
#define A_INT2_THS				(0x36)
#define A_INT2_DURATION			(0x37)

/*Data values*/
//default values
#define A_CTRL_REG1_DEFAULT		(0x07)
#define A_CTRL_REG2_DEFAULT		(0x00)
#define A_CTRL_REG3_DEFAULT		(0x00)
#define A_CTRL_REG4_DEFAULT		(0x00)
#define A_CTRL_REG5_DEFAULT		(0x00)
#define A_REFERENCE_DEFAULT		(0x00)
#define A_INT1_CFG_DEFAULT		(0x00)
#define A_INT1_SOURCE_DEFAULT	(0x00)
#define A_INT1_THS_DEFAULT		(0x00)
#define A_INT1_DURATION_DEFAULT	(0x00)
#define A_INT2_CFG_DEFAULT		(0x00)
#define A_INT2_SOURCE_DEFAULT	(0x00)
#define A_INT2_THS_DEFAULT		(0x00)
#define A_INT2_DURATION_DEFAULT	(0x00)
//control register 1 values
#define A_PWR_DOWN				(0x00)
#define A_LPWR_ODR_05			(0x40)
#define A_LPWR_ODR_1			(0x60)
#define A_LPWR_ODR_2			(0x80)
#define A_LPWR_ODR_5			(0xA0)
#define A_LPWR_ODR_10			(0xC0)
#define A_ODR_50				(0x20)
#define A_ODR_100				(0x28)
#define A_ODR_400				(0x30)
#define A_ODR_1000				(0x38)
#define A_LPWR_LP_37			(0x00)//wtf is this for?
#define A_LPWR_LP_74			(0x08)
#define A_LPWR_LP_292			(0x10)
#define A_LPWR_LP_780			(0x18)
#define	A_Z_AXIS_ENABLE			(0x04)
#define	A_Y_AXIS_ENABLE			(0x02)
#define A_X_AXIS_ENABLE			(0x01)
#define A_ALL_AXIS_ENABLE		(A_X_AXIS_ENABLE | A_Y_AXIS_ENABLE | A_Z_AXIS_ENABLE)
//status register values
#define A_ZYXOR					(0x80)
#define A_ZOR					(0x40)
#define A_YOR					(0x20)
#define A_XOR					(0x10)
#define A_ZYXDA					(0x08)
#define A_ZDA					(0x04)
#define A_YDA					(0x02)
#define A_XDA					(0x01)
//interupt config register (ctrl_reg3) values
#define A_INT_ACTIVE_HIGH    	(0x00)
#define A_INT_ACTIVE_LOW		(0x80)
//#define A_PUSH_PULL
//#define A_OPEN_DRAIN
#define A_INT1_DRDY				(0x02)
#define A_INT1_LATCH			(0x04)

/*CTRL_REG 4*/
#define A_BDU					(0x80)
#define A_BLE_LITLE				(0x40)
#define A_BLT_BIG				(0x00)
#define A_FS_6					(0x00)
#define A_FS_12					(0x10)
#define A_FS_24					(0x30)
#define A_ST_SIGN_MINUS			(0x08)
#define A_ST_SIGN_PLUS			(0x00)
#define A_ST					(0x02)
#define A_SIM_3_WIRE			(0x01)
#define A_SIM_4_WIRE			(0x00)

#endif

