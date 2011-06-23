
/*
 * blinkm-test.c
 * testing i2c interface using a blinkm tricolor i2c led.
 */

#include <limits.h>
#include <stdint.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-binsem.h"
#include "lpc23xx-i2c.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"

#include "olimex2378-util.h"
#include "blinkm-test.h"

i2c_master_xact_t       xact_s;

/*
 * xact_callback
 * callback function for i2c
 */
void xact_callback(i2c_master_xact_t* caller, i2c_master_xact_t* i2c_s) {
    uint16_t i;

    caller->i2c_ext_slave_address = i2c_s->i2c_ext_slave_address;
    caller->xact_success          = i2c_s->xact_success;
    caller->write_length          = i2c_s->write_length;
    caller->read_length           = i2c_s->read_length;
    caller->xact_active           = i2c_s->xact_active;

    for(i=0; i<I2C_MAX_BUFFER; ++i) {
        caller->i2c_tx_buffer[i] = i2c_s->i2c_tx_buffer[i];
        caller->i2c_rd_buffer[i] = i2c_s->i2c_rd_buffer[i];
    }
    /* maybe trigger an interrupt here */
}

/*
 * blinkm_task
 * 
 */
void blinkm_task() {

    uint32_t i, on;

    uart0_putstring("i2c Write Color Task...\n");
    xact_s.i2c_tx_buffer[0]  =  i2c_create_write_address(BLINKM_ADDR);
    xact_s.i2c_tx_buffer[1]  =  'o';
    xact_s.i2c_tx_buffer[2]  =  'f';
    xact_s.i2c_tx_buffer[3]  =   5;
    xact_s.i2c_tx_buffer[4]  =  'c';
    xact_s.i2c_tx_buffer[5]  =  0x50;
    xact_s.i2c_tx_buffer[6]  =  0x10;
    xact_s.i2c_tx_buffer[7]  =  0x03;
    xact_s.write_length      =  0x08;
    xact_s.read_length       =  0x0;
    xact_s.xact_active       =  0x1;
    xact_s.xact_success      =  0x0;

    start_i2c0_master_xact(&xact_s, &xact_callback);

    // poll
    STAT_LED_OFF;
    i  = 0;
    on = 0;

    while(is_binsem_locked(&i2c0_binsem_g)== 1) {
        i++;
        if(i % BLINKM_POLL_WAITTICKS == 0) {
            if(on==0) {
                STAT_LED_ON;
                on = 1;
            } else {
                on = 0;
                STAT_LED_OFF;
            }
            i = 0;
        }
    }

    if(xact_s.xact_success == 1) {
        uart0_putstring("i2c write xaction success.\n");
    } else {
        uart0_putstring("i2c write xaction fail.\n");
    }

    uart0_putstring("i2c Read Color Task...\n");

    xact_s.i2c_tx_buffer[0] =  i2c_create_write_address(BLINKM_ADDR);
    xact_s.i2c_tx_buffer[1] =  'g';
    xact_s.write_length     =  0x02;
    xact_s.i2c_tx_buffer[2] =  i2c_create_read_address(BLINKM_ADDR);
    xact_s.read_length      =  0x02;
    start_i2c0_master_xact(&xact_s, &xact_callback);

    // poll
    STAT_LED_OFF;
    i  = 0;
    on = 0;

    while(is_binsem_locked(&i2c0_binsem_g)== 1) {
        i++;
        if(i % BLINKM_POLL_WAITTICKS == 0) {
            if(on==0) {
                STAT_LED_ON;
                on = 1;
            } else {
                on = 0;
                STAT_LED_OFF;
            }
            i = 0;
        }
    }

    if(xact_s.xact_success == 1) {
        uart0_putstring("i2c read xaction success.\n");
    } else {
        uart0_putstring("i2c read xaction fail.\n");
    }

    uart0_putstring("Read data 0 is 0x");
    uart0_putstring(util_uitoa(xact_s.i2c_rd_buffer[0],16));
    if(xact_s.i2c_rd_buffer[0] != 0x50) uart0_putstring("Error, wrong value, should be 0x50"); 
    uart0_putstring("\n");
    uart0_putstring("Read data 1 is 0x");
    uart0_putstring(util_uitoa(xact_s.i2c_rd_buffer[1],16));
    if(xact_s.i2c_rd_buffer[1] != 0x10) uart0_putstring("Error, wrong value, should be 0x10"); 
    uart0_putstring("\n");
    uart0_putstring("Read data 2 is 0x");
    uart0_putstring(util_uitoa(xact_s.i2c_rd_buffer[2],16));
    if(xact_s.i2c_rd_buffer[2] != 0x3) uart0_putstring("Error, wrong value, should be 0x3"); 
    uart0_putstring("\n");
}


int main (void) {

    int32_t cycles = 5;

    pllstart_seventytwomhz() ;
    //   pllstart_sixtymhz() ;
    //   pllstart_fourtyeightmhz() ;

    MAMCR  = 0x0;
    MAMTIM = 0x4;
    MAMCR  = 0x2;

    uart0_init_115200() ;

    uart0_putstring("\n***Starting olimex blinkm test***\n\n");

    i2c_init(I2C0);

    stat_led_flash(cycles); // initial visual check

    blinkm_task() ;

    stat_led_flash_slow(2);

    uart0_putstring("\n\n***Done***\n\n");

    return(0);

}

