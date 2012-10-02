/*
 * L3G4200D.h
 *
 *  Created on: Nov 19, 2011
 *      Author: theo
 */

#ifndef L3G4200D_H_
#define L3G4200D_H_


void L3G4200D_init(i2c_iface i2c_ch);
void L3G4200D_get_data(XACT_FnCallback* xact_callback);
int L3G4200D_data_overrun(uint8_t status_reg);
int L3G4200D_data_available(uint8_t status_reg);
int L3G4200D_set_ctrl_reg(int, uint8_t);

#define L3G4200D_ADDR	(0x68)

#define G_AUTO_INCREMENT	(0x80)

/*Register addresses */
#define G_WHO_AM_I 			(0x0F)
#define G_CTRL_REG1			(0x20)
#define G_CTRL_REG2			(0x21)
#define G_CTRL_REG3			(0x22)
#define G_CTRL_REG4			(0x23)
#define G_CTRL_REG5			(0x24)
#define G_REFERENCE			(0x25)
#define G_OUT_TEMP			(0x26)
#define G_STATUS_REG		(0x27)
#define G_OUT_X_L			(0x28)
#define G_OUT_X_H			(0x29)
#define G_OUT_Y_L			(0x2A)
#define G_OUT_Y_H			(0x2B)
#define G_OUT_Z_L			(0x2C)
#define G_OUT_Z_H			(0x2D)
#define G_FIFO_CTRL_REG		(0x2E)
#define G_FIFO_SRC_REG		(0x2F)
#define G_INT1_CFG			(0x30)
#define G_INT1_SRC			(0x31)
#define G_INT1_TSH_XH		(0x32)
#define G_INT1_TSH_XL		(0x33)
#define G_INT1_TSH_YH		(0x34)
#define G_INT1_TSH_YL		(0x35)
#define G_INT1_TSH_ZH		(0x36)
#define G_INT1_TSH_ZL		(0x37)
#define G_INT1_DURATION		(0x38)

/* CTRL_REG default settings */
#define G_CTRL_REG1_DEFAULT	(0x07)
#define G_CTRL_REG2_DEFAULT	(0x00)
#define G_CTRL_REG2_MASK	(0x3F) //L3G4200D data sheet p.30 s7.3
#define G_CTRL_REG3_DEFAULT	(0x00)
#define G_CTRL_REG4_DEFAULT	(0x00)
#define G_CTRL_REG5_DEFAULT	(0x00)

/* CTRL_REG1 data */
#define G_PWR_DOWN          (0x00)
#define G_ODR_100			(0x00)
#define G_ODR_200			(0x40)
#define G_ODR_400			(0x80)
#define G_ODR_800			(0xA0)
#define G_BW_L				(0x00)
#define G_BW_ML				(0x10)
#define G_BW_MH				(0x20)
#define G_BW_H				(0x30)
#define G_PWR				(0x08)
#define G_Z_EN				(0x04)
#define G_Y_EN				(0x02)
#define G_X_EN				(0x01)
#define G_ALL_AXIS_ENABLE 	(G_Z_EN | G_Y_EN | G_X_EN)

/* CTRL_REG3 data */
#define G_INT1_EN			(0x80)
#define G_INT1_BOOT			(0x40)
#define G_INT1_ACTIVE_LOW	(0x20)
#define G_OPEN_DRAIN		(0x10)
#define G_INT2_DRDY			(0x08)

/* CTRL_REG4 data*/
#define G_BDU				(0x80)
#define G_BLE_LITLE			(0x40)
#define G_BLT_BIG			(0x00)
#define G_FS_250			(0x00)
#define G_FS_500			(0x10)
#define G_FS_2000			(0x30)
#define G_ST_SIGN_MINUS		(0x04)
#define G_ST_SIGN_PLUS		(0x00)
#define G_ST				(0x02)
#define G_SIM_3_WIRE		(0x01)
#define G_SIM_4_WIRE		(0x00)

/* STATUS_REG data */
#define G_ZYXOR				(0x80)
#define G_ZYXDA				(0x08)

#endif /* L3G4200D_H_ */
