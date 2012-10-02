/*
 * LSM303DLH.h
 *
 *  Created on: Nov 21, 2011
 *      Author: theo
 */

#ifndef LSM303DLH_H_
#define LSM303DLH_H_

void LSM303DLH_m_get_data(XACT_FnCallback*);
void LSM303DLH_init_m(i2c_iface i2c_ch);
int LSM303DLH_m_set_ctrl_reg(int, uint8_t);


#define LSM303DLH_ADDR_A	(0x19) //will need to coordinate this with LIS331HH
#define LSM303DLH_ADDR_M	(0x1E)

#define C_AUTO_INCREMENT	(0x80)

#define C_CTRL_REG1_A		(0x20)
#define C_CTRL_REG2_A 		(0x21)
#define C_CTRL_REG3_A 		(0x22)
#define C_CTRL_REG4_A 		(0x23)
#define C_CTRL_REG5_A 		(0x24)
#define C_HP_FILTER_RESET_A (0x25)
#define C_REFERENCE_A 		(0x26)
#define C_STATUS_REG_A 		(0x27)
#define C_OUT_X_L_A 		(0x28)
#define C_OUT_X_H_A			(0x29)
#define C_OUT_Y_L_A			(0x2A)
#define C_OUT_Y_H_A			(0x2B)
#define C_OUT_Z_L_A			(0x2C)
#define C_OUT_Z_H_A			(0x2D)
#define C_INT1_CFG_A		(0x30)
#define C_INT1_SOURCE_A		(0x31)
#define C_INT1_THS_A		(0x32)
#define C_INT1_DURATION_A	(0x33)
#define C_INT2_CFG_A		(0x34)
#define C_INT2_SOURCE_A		(0x35)
#define C_INT2_THS_A		(0x36)
#define C_INT2_DURATION_A	(0x37)
#define C_CRA_REG_M			(0x00)
#define C_CRB_REG_M			(0x01)
#define C_MR_REG_M			(0x02)
#define C_OUT_X_L_M 		(0x03)
#define C_OUT_X_H_M			(0x04)
#define C_OUT_Y_L_M			(0x05)
#define C_OUT_Y_H_M			(0x06)
#define C_OUT_Z_L_M			(0x07)
#define C_OUT_Z_H_M			(0x08)
#define C_SR_REG_M			(0x09) //Printed as SR_REG_Mg in table 17, assumed typo.
#define C_IRA_REG_M			(0x0A)
#define C_IRB_REG_M			(0x0B)
#define C_IRC_REG_M			(0x0C)


/*CRA_REG_M data*/
#define C_CRA_REG_M_MASK	(0x1F)
#define C_ODR_0_75			(0x00)
#define C_ODR_1_5			(0x04)
#define C_ODR_3				(0x08)
#define C_ODR_7_5			(0x0C)
#define C_ODR_15			(0x10)
#define C_ODR_30			(0x14)
#define C_ODR_75			(0x18)
#define C_BIAS_NORMAL		(0x00)
#define C_BIAS_POS			(0x01)
#define C_BIAS_NEG			(0x02)

/*CRB_REG_M data*/
#define C_RANGE_1_3			(0x20)
#define C_RANGE_1_9			(0x40)
#define C_RANGE_2_5			(0x60)
#define C_RANGE_4			(0x80)
#define C_RANGE_4_7			(0xA0)
#define C_RANGE_5_6			(0xC0)
#define C_RANGE_8_1			(0xE0)
#define C_CRB_REG_M_MASK	(0xE0)

/*MR_REG_M data*/
#define C_CONT_CONV			(0x00)
#define C_SING_CONV			(0x01)
#define C_SLEEP				(0x03)
#define C_MR_REG_M_MASK		(0x03)

/*SR_REG_M data*/
#define C_RDY				(0x01)
#define C_LOCK				(0x02)
#define C_REN				(0x04)


#endif /* LSM303DLH_H_ */
