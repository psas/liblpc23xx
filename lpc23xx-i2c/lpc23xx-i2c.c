
/*
 * lpc23xx-i2c.c
 */

#include <stdint.h>

#include "lpc23xx.h"

#include "lpc23xx-i2c.h"

/*
 * i2c_create_read_addr
 */
uint8_t i2c_create_read_address(uint8_t addr) {
    return (addr << 1) | 0x1;
}

/*
 * i2c_create_write_addr
 */
uint8_t i2c_create_write_address(uint8_t addr) {
    return addr << 1;
}

/*
 * I2CInit_State
 */
void I2CInit_State( i2c_master_xact_t* s) {
    int i = 0;

    s->state             = I2C_IDLE;
    for(i=0; i<I2C_MAX_BUFFER; i++) {
        s->I2C_TX_buffer[i] = 0;
        s->I2C_RD_buffer[i] = 0;
    }
    s->I2Cext_slave_address = 0x0;
    s->write_length         = 0x0;
    s->read_length          = 0x0;
}

/*
 * I2Cinit
 *
 * 0. Init xaction structure.
 * 1. Turn on the power to the channel
 * 2. Configure the clock for the channel
 * 3. Set I/O pins to correct mode
 * 4. Configure interrupt in VIC
 * 5. Continue initializing...tbd
 */
void I2Cinit(i2c_iface channel) {
    { 
        portENTER_CRITICAL();

        // Sat 27 March 2010 11:02:36 (PDT)
        // only create one semaphore for now, maybe one for each
        // channel later.
        vSemaphoreCreateBinary( i2cSemaphore_g );
        if( i2cSemaphore_g == NULL ) {
            vSerialPutString(0, "*** I2C-ERROR ***: Failed to create i2cSemaphore_g. I2CInit Failed!\n\r", 50);
        } else {
            switch(channel) {
                case I2C0: 
                    // structure
                    I2CInit_State( &i2c0_s_g );

                    // power
                    SET_BIT(PCONP, PCI2C0);

                    // Enable
                    I2C0CONCLR = 0x7C;
                    I2C0CONSET = (I2C_I2EN | I2C_AA); // master mode
                    // printf2("I20Conset is 0x%X\n",I2C0CONSET);

                    // I2C clock
                    I2C0SCLL = I2SCLLOW;
                    I2C0SCLH = I2SCLHIGH;

                    // 2368 is 100pin package use table 107 p158 lpc23xx usermanual
                    PINSEL1 &= SDA0MASK;
                    PINSEL1 |= SDA0;
                    PINSEL1 &= SCL0MASK;
                    PINSEL1 |= SCL0;

                    // pinmode:   I2C0 pins permanent open drain (pullup)
                    // reference: lpc23xx usermanual p158 table 107 footnote 2

                    // vic
                    // set up VIC p93 table 86 lpc23xx user manual
                    SET_BIT(VICIntEnable, VICI2C0EN);
                    VICVectAddr9 = (unsigned) i2c0_isr;

                    I2C0CONCLR   = I2C_SIC;
                    break;

                case I2C1: 
                    // structure
                    I2CInit_State( &i2c1_s_g );


                    SET_BIT(PCONP, PCI2C1);

                    I2C1CONSET = (I2C_I2EN | I2C_AA); // master mode

                    I2C1SCLL = I2SCLLOW;
                    I2C1SCLH = I2SCLHIGH;

                    PINSEL1 &= SDA1MASK;
                    PINSEL1 |= SDA1;
                    PINSEL1 &= SCL1MASK;
                    PINSEL1 |= SCL1;

                    PINMODE1 &= SDA1MASK;
                    PINMODE1 |= PULLUP;
                    PINMODE1 &= SCL1MASK;
                    PINMODE1 |= PULLUP;

                    SET_BIT(VICIntEnable, VICI2C1EN);
                    VICVectAddr19 = (unsigned) i2c1_isr;
                    break;

                case I2C2: 
                    // structure
                    I2CInit_State( &i2c2_s_g );


                    SET_BIT(PCONP, PCI2C2);

                    I2C2CONSET = (I2C_I2EN | I2C_AA); // master mode

                    I2C2SCLL = I2SCLLOW;
                    I2C2SCLH = I2SCLHIGH;

                    PINSEL0 &= SDA2MASK;
                    PINSEL0 |= SDA2;
                    PINSEL0 &= SCL2MASK;
                    PINSEL0 |= SCL2;

                    PINMODE2 &= SDA2MASK;
                    PINMODE2 |= PULLUP;
                    PINMODE2 &= SCL2MASK;
                    PINMODE2 |= PULLUP;

                    SET_BIT(VICIntEnable, VICI2C2EN);
                    VICVectAddr30 = (unsigned) i2c2_isr;
                    break;

                default:
                    //  error         ???
                    break;
            }
        }
    }
    portEXIT_CRITICAL();
}

/*
 * i2c0_isr
 */
void i2c0_isr(void) {

    portSAVE_CONTEXT();

    uint32_t                 status;
    uint8_t                  give_binsem;
    static signed            portBASE_TYPE xHigherPriorityTaskWoken; 

    xHigherPriorityTaskWoken = pdFALSE;
    give_binsem              = 0;

    status = I2C0STAT;

#if DEBUG_ISR==1
    // status (state) register observability to io pins
#include "i2c_debug_isr_status.c"
#endif
    //Read the I2C state from the correct I2STA register and then branch to
    //the corresponding state routine.
    switch(status) {
        // State 0x00 - Bus Error
        case 0x00:
            i2c_wrindex_g     = 0;
            i2c_rdindex_g     = 0;
            i2c0_s_g.state    = I2C_ERROR;
            I2C0CONSET        = (I2C_STO | I2C_AA);
            give_binsem       = 1;
            break;

            // State 0X08 - 
            //   A start condition has been transmitted. 
            //   The Slave Address and Read or Write bit will be transmitted.
            //   An ACK bit will be received.
        case 0x08:
            i2c_wrindex_g     = 0;

            // write the Slave Address with R/W bit to I2DAT
            I2C0DAT           = i2c0_s_g.I2C_TX_buffer[i2c_wrindex_g++] ;
            i2c0_s_g.state    = I2C_START;

            break;

            // State 0x10 - 
            //   A repeated start condition has been transmitted.
            //   The Slave Address and Read or Write bit will be transmitted.  
            //   An ACK bit will be received
        case 0x10:
            i2c_rdindex_g     = 0;

            // Device address + R/W is first after write data in stream
            I2C0DAT           = i2c0_s_g.I2C_TX_buffer[i2c_wrindex_g++] ;
            i2c0_s_g.state    = I2C_RESTART;
            I2C0CONCLR        = I2C_STAC;
            break;

            // State 0x18 - 
            //   Previous state was 0x08 or 0x10.  
            //   Slave Address and Read or Write has been transmitted.
            //   An ACK has been received. 
            //   The first data byte will be transmitted. 
            //   An ACK bit will be received.
        case 0x18:
            if(i2c0_s_g.state == I2C_START) {
                I2C0DAT           = i2c0_s_g.I2C_TX_buffer[i2c_wrindex_g++] ;
                I2C0CONSET        = I2C_AA;
                I2C0CONCLR        = I2C_STAC; // undocumented clear start flag
                i2c0_s_g.state    = I2C_ACK;
            }
            break;

            // State 0x20 - 
            //   Slave Address + Write has been transmitted.  
            //   "NOT_ACK" has been received. 
            //   A Stop condition will be transmitted.
        case 0x20:
            I2C0CONSET        = (I2C_STO | I2C_AA);
            give_binsem       = 1;
            i2c0_s_g.state = I2C_NOTACK;
            break;

            // State 0x28 - 
            //   Data has been transmitted, ACK has been received. 
            //   If the transmitted data was the last data byte then 
            //   check to see if read length is > 0. (looking for repeated 
            //   start transaction)
        case 0x28:
            if(i2c_wrindex_g < i2c0_s_g.write_length) {
                I2C0DAT           = i2c0_s_g.I2C_TX_buffer[i2c_wrindex_g++] ;
                I2C0CONSET        = I2C_AA;
                i2c0_s_g.state = I2C_ACK;
            } else {
                if (i2c0_s_g.read_length != 0) {
                    I2C0CONSET        = I2C_STA;  // repeated start
                    i2c0_s_g.state    = I2C_REPEATED_START;
                } else {
                    I2C0CONSET        = (I2C_STO | I2C_AA);
                    give_binsem = 1;
                    i2c0_s_g.state = I2C_ACK;
                }
            }
            break;

            // State 0x30 - 
            //   Data has been transmitted, 
            //   NOT ACK received. 
            //   A Stop condition will be transmitted.
        case 0x30:
            I2C0CONSET        = (I2C_STO | I2C_AA);
            give_binsem       = 1;
            i2c0_s_g.state = I2C_NOTACK;
            break;

            // State 0x38 - Multiple Master State 
            //   Arbitration has been lost during Slave Address + Write or data. 
            //   The bus has been released and not addressed Slave mode is entered. 
            //   A new Start condition will be transmitted when the bus is free again.
            //   *** We will issue a STOP here, since we should never be in Multiple master 
            //   mode for our application ***
        case 0x38:
            // I2C0CONSET        = (I2C_STA | I2C_AA);
            I2C0CONSET        = (I2C_STO | I2C_AA);
            give_binsem       = 1;
            i2c0_s_g.state = I2C_ERROR;
            break;

            // MASTER RECEIVE STATES

            // State 0x40 
            //   Previous state was State 0x08 or State 0x10. 
            //   Slave Address + Read has been transmitted, ACK has been received.
        case 0x40:
            if (i2c0_s_g.read_length == 1) {
                // go to state 0x58
                I2C0CONCLR        = I2C_AAC;
                I2C0CONCLR        = I2C_STAC; // undocumented clear start flag
            } else {
                // go to state 0x50
                I2C0CONSET        = I2C_AA;
                I2C0CONCLR        = I2C_STAC; // undocumented clear start flag
            }
            break;

            // State 0x48 - 
            //   Slave Address + Read has been transmitted, NOT ACK has been received. 
            //   A Stop condition will be transmitted.
        case 0x48:
            I2C0CONSET        = (I2C_STO | I2C_AA);
            give_binsem       = 1;
            i2c0_s_g.state    = I2C_NOTACK;
            break;

            // State 0x50 -
            //   Data has been received, ACK has been returned. 
            //   Data will be read from I2DAT. 
            //   Additional data will be received. 
            //   If this is the last data byte then NOT ACK will be returned, 
            //     otherwise ACK will be returned. 
        case 0x50:
            i2c0_s_g.I2C_RD_buffer[i2c_rdindex_g++] = I2C0DAT;  
            if(i2c_rdindex_g < i2c0_s_g.read_length) {
                I2C0CONSET     = I2C_AA;
                i2c0_s_g.state = I2C_ACK;
            } else { // it's the last byte...
                I2C0CONCLR     = I2C_AAC;
                i2c0_s_g.state = I2C_NOTACK;
            }
            break;

            // State: 0x58 - 
            //   Data has been received, NOT ACK has been returned. 
            //   Data will be read from I2DAT. 
            //   A Stop condition will be transmitted.
        case 0x58:
            i2c0_s_g.I2C_RD_buffer[i2c_rdindex_g++] = I2C0DAT;  
            I2C0CONSET         = (I2C_STO | I2C_AA);
            i2c0_s_g.state     = I2C_NOTACK;
            give_binsem = 1;
            break;

            // State: ???
            //   Unimplemented state, treat like state 0x0, bus error
        default:
            i2c_wrindex_g     = 0;
            i2c_rdindex_g     = 0;
            i2c0_s_g.state = I2C_ERROR;
            I2C0CONSET        = (I2C_STO | I2C_AA);
            give_binsem       = 1;
            break;
    }

    I2C0CONCLR = I2C_SIC;

    VICVectAddr = 0x0;      // clear VIC address

    if(give_binsem == 1) {  // STOP Bit has been set
        xSemaphoreGiveFromISR( i2cSemaphore_g, &xHigherPriorityTaskWoken );
    }

    /*
     * If xHigherPriorityTaskWoken was set to true you
     *  we should yield.  The actual macro used here is 
     *  port specific.
     *  Sat 27 March 2010 12:46:21 (PDT):Only needed if context switch in i2c_isr?
     *  portYIELD_FROM_ISR( xHigherPriorityTaskWoken );
     */
    portRESTORE_CONTEXT();
}


/*
 * i2c1_isr
 */
void i2c1_isr(void) {
    // not implemented
}

/*
 * i2c2_isr
 */
void i2c2_isr(void) {
    // not implemented
}

/*
 * I2C0_get_read_data
 * Input: Pointer to i2c_master_t structure with xaction data
 * This will copy data from local i2c0_s_g structure to same
 * type of structure passed as pointer from outside i2c scope.
 */
void I2C0_get_read_data(i2c_master_xact_t* s) {
    uint32_t i;

    if(s !=NULL ) {
        if( i2cSemaphore_g != NULL ) { 
            // See if we can obtain the semaphore. If the semaphore is not available 
            // wait I2C_BINSEM_WAIT msecs to see if it becomes free. 
            if( xSemaphoreTake( i2cSemaphore_g, I2C_BINSEM_WAIT ) == pdTRUE ) { 
                for(i=0; i<I2C_MAX_BUFFER; i++) {
                    s->I2C_RD_buffer[i] = i2c0_s_g.I2C_RD_buffer[i];
                }
                if( xSemaphoreGive( i2cSemaphore_g ) != pdTRUE ) {
                    vSerialPutString(0, "*** I2C-ERROR ***: I2C0_master_xact, Give semaphore fail should not be possible.\n\r", 50);
                }
            } else { 
                vSerialPutString(0, "*** I2C-ERROR ***: I2C0_get_read_data Timed out waiting for i2cSemaphore_g. Skipping Request.\n\r", 50);
            }
        } else {
            vSerialPutString(0, "*** I2C-ERROR ***: I2C0_get_read_data i2cSemaphore_g is NULL in I2C0MasterTX. Did you run I2CInit?\n\r", 50);
        }
    } else {
        vSerialPutString(0, "*** I2C-ERROR ***: I2C0_get_read_data, structure pointer is NULL. Skipping.\n\r", 50);
    }
}


/*
 * I2C_master_xact
 * Input: Pointer to i2c_master_t structure with xaction data
 */
void I2C0_master_xact(i2c_master_xact_t* s) {

    uint8_t i;
    if(s!=NULL) {
        if( i2cSemaphore_g != NULL ) { 
            // See if we can obtain the semaphore. If the semaphore is not available 
            // wait I2C_BINSEM_WAIT msecs to see if it becomes free. 
            if( xSemaphoreTake( i2cSemaphore_g, I2C_BINSEM_WAIT ) == pdTRUE ) { 
                for(i=0; i<I2C_MAX_BUFFER; i++){
                    i2c0_s_g.I2C_TX_buffer[i] = s->I2C_TX_buffer[i];
                    i2c0_s_g.I2C_RD_buffer[i] = s->I2C_RD_buffer[i];
                }
                i2c0_s_g.I2Cext_slave_address = s->I2Cext_slave_address;
                i2c0_s_g.write_length         = s->write_length;
                i2c0_s_g.read_length          = s->read_length;

//                 printf2("write_length: 0x%X\r\n", s->write_length);
                //write 0x20 to I2CONSET to set the STA bit
                I2C0CONSET                    = I2C_STA;
           } else { 
                vSerialPutString(0, "*** I2C-ERROR ***: I2C0_master_xact, Timed out waiting for i2cSemaphore_g. Skipping Request.\n\r", 50);
            } 
        } else {
            vSerialPutString(0, "*** I2C-ERROR ***: I2C0_master_xact, i2cSemaphore_g is NULL in I2C0MasterTX. Did you run I2CInit?\n\r", 50);
        }  
    } else {
        vSerialPutString(0, "*** I2C-ERROR ***: I2C0_master_xact, structure pointer is NULL. Skipping.\n\r", 50);
    }
}




