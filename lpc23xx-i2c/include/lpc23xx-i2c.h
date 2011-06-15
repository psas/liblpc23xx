
/*
 * lpc23xx-i2c.h
 */

#ifndef _LPC23XX_I2C_H
#define _LPC23XX_I2C_H

// Debug flags
#define DEBUG_ISR        1
#define DEBUG_INIT       0
#define DEBUG_TX         0
#define DEBUG_RX         0

// MAX values 
#define I2C_MAX_BUFFER   64          // uint8_t

// VIC table page 94 lpc23xx manual
#define VICI2C0EN        9
#define VICI2C1EN        19
#define VICI2C2EN        30

// I2C CONSET and CONCLR Bits
// SET
#define I2C_I2EN           0x40
#define I2C_AA             0x04
#define I2C_SI             0x08
#define I2C_STO            0x10
#define I2C_STA            0x20
        
// CLEAR
#define I2C_I2ENC          0x40
#define I2C_AAC            0x04 
#define I2C_SIC            0x08
#define I2C_STAC           0x20

// PCONP
#define PCI2C0           7
#define PCI2C1           19
#define PCI2C2           26

// I2C clock
// Table 435 p496 lpc23xx
//
// Here are some values I've verified trying to understand
// the clock speed on the i2c:
//
// For our setup right now:
// XTAL/oscillator input: 12Mhz
//
// Fcco = 288,000,000 Hz
// CCLK  = 57,600,000 Hz
// PCLK  = 14,400,000 Hz
//
//
// ( i2c clock speed ref: lpc23xx user manual p516)
//
// i2c standard clock speed goes to 100kHz
//
// This is about 30Khz
// #define I2SCLHIGH        200
// #define I2SCLLOW         200
//
// This is about 62Khz
#define I2SCLHIGH        100
#define I2SCLLOW         100

//
// This is about 120khz 
// #define I2SCLHIGH        50
// #define I2SCLLOW         50


// Pinsel0 has builtin pullup. 
// Pinsel1&2 do not. 
#define PULLUP           0x0

// PINSEL0
#define SDA2             (0x2<<20)
#define SDA2MASK         ~(0x3<<20)

#define SCL2             0x2<<20
#define SCL2MASK         ~(0x3<<22)


// PINSEL1
#define SDA1             (0x3<<6)
#define SDA1MASK         ~(0x3<<6)

#define SCL1             0x3<<8
#define SCL1MASK         ~(0x3<<8)

#define SDA0             0x1<<22
#define SDA0MASK         ~(0x3<<22)

#define SCL0             0x1<<24
#define SCL0MASK         ~(0x3<<24)

#define I2C_BINSEM_WAIT   ( ( portTickType ) 3000 / portTICK_RATE_MS )


typedef enum { I2C0=0, I2C1, I2C2} i2c_iface;

typedef enum { 
    I2C_IDLE = 0, 
    I2C_START,
    I2C_RESTART,
    I2C_REPEATED_START,
    I2C_ACK,
    I2C_NOTACK,
    I2C_ERROR
} i2c_state;

typedef struct i2c_master_xact {
    volatile i2c_state state;

    volatile uint8_t  I2C_TX_buffer[I2C_MAX_BUFFER];  // Transmit data for transaction
    volatile uint8_t  I2C_RD_buffer[I2C_MAX_BUFFER];  // Receive  data for transaction
    volatile uint8_t  I2Cext_slave_address;
    volatile uint8_t  write_length;
    volatile uint8_t  read_length;

} i2c_master_xact_t;


/*
void i2c0_isr(void) __attribute__ ((interrupt("IRQ")));
void i2c1_isr(void) __attribute__ ((interrupt("IRQ")));
void i2c2_isr(void) __attribute__ ((interrupt("IRQ")));
*/

void i2c0_isr(void) __attribute__ ((naked));
void i2c1_isr(void) __attribute__ ((naked));
void i2c2_isr(void) __attribute__ ((naked));

// Use a binary semaphore for mutual exclusion on the i2c interface.
// Ref: http://www.freertos.org/index.html?http://www.freertos.org/a00121.html
static volatile xSemaphoreHandle i2cSemaphore_g;

// One structure for each i2c channel
static i2c_master_xact_t     i2c0_s_g;
static i2c_master_xact_t     i2c1_s_g;
static i2c_master_xact_t     i2c2_s_g;

static volatile uint32_t         i2c_wrindex_g;
static volatile uint32_t         i2c_rdindex_g;

// void I2CGeneral_Call(i2c_iface channel);
void I2CInit_State( i2c_master_xact_t* s) ;
void i2c_init(i2c_iface channel) ;
void I2C0_get_read_data(i2c_master_xact_t* s) ;
void I2C0_master_xact(i2c_master_xact_t*  s) ;

/*
void I2C1_master_xact(i2c_master_xact_t&  s) ;
void I2C2_master_xact(i2c_master_xact_t&  s) ;
*/



#endif
