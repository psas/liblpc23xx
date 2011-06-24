
/*
 * eeprom-test.c
 * testing i2c interface using an eeprom 
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
#include "eeprom-test.h"

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

void poll_wait() {
    uint32_t i, on;

    STAT_LED_OFF;
    i  = 0;
    on = 0;

    while(is_binsem_locked(&i2c0_binsem_g)== 1) {
        i++;
        if(i % EEPROM_POLL_WAITTICKS == 0) {
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
}


/*
 * eeprom_task
 * 
 */
void eeprom_task() {

    uint32_t i;

    /**************************************/
    i2c_init_state( &xact_s) ;

    uart0_putstring("eeprom i2c write 1 byte...\n");

    xact_s.i2c_tx_buffer[0] =  i2c_create_write_address(EEPROM_ADDR);
    xact_s.i2c_tx_buffer[1] =  0x0;
    xact_s.i2c_tx_buffer[2] =  0x0;
    xact_s.i2c_tx_buffer[3] =  0xe;
    xact_s.write_length     =  0x4;
    xact_s.read_length      =  0x0;
    xact_s.xact_active      =  0x1;
    xact_s.xact_success     =  0x0;

    start_i2c0_master_xact(&xact_s, &xact_callback);

    poll_wait();

    if(xact_s.xact_success == 1) {
        uart0_putstring("eeprom i2c write byte xaction success.\n");
    } else {
        uart0_putstring("eeprom i2c write byte  xaction fail.\n");
    }

    /**************************************/
    i2c_init_state( &xact_s) ;
    uart0_putstring("eeprom i2c read byte using repeated start...\n");
    xact_s.i2c_tx_buffer[0] =  i2c_create_write_address(EEPROM_ADDR);
    xact_s.i2c_tx_buffer[1] =  0x0;
    xact_s.i2c_tx_buffer[2] =  0x0;
    xact_s.write_length     =  0x3;
    xact_s.i2c_tx_buffer[3] =  i2c_create_read_address(EEPROM_ADDR);
    xact_s.read_length      =  0x1;
    xact_s.xact_active      =  0x1;
    xact_s.xact_success     =  0x0;

    start_i2c0_master_xact(&xact_s, &xact_callback);

    poll_wait();

    if(xact_s.xact_success == 1) {
        uart0_putstring("eeprom i2c read byte xaction success.\n");
    } else {
        uart0_putstring("eeprom i2c read byte xaction fail.\n");
    }

    uart0_putstring("Read data 0 is 0x");
    uart0_putstring(util_uitoa(xact_s.i2c_rd_buffer[0],16));
    if(xact_s.i2c_rd_buffer[0] != 0xe) uart0_putstring("Error, wrong value, should be 0xe"); 
    uart0_putstring("\n");

    /**************************************/

    i2c_init_state( &xact_s) ;
    uart0_putstring("i2c write bytes task...\n");

    xact_s.i2c_tx_buffer[0] =  i2c_create_write_address(EEPROM_ADDR);
    xact_s.i2c_tx_buffer[1] =  0x0;
    xact_s.i2c_tx_buffer[2] =  0x0;
    xact_s.i2c_tx_buffer[3] =  0x0b;
    xact_s.i2c_tx_buffer[4] =  0x0c;
    xact_s.i2c_tx_buffer[5] =  0x0d;
    xact_s.i2c_tx_buffer[6] =  0x1e;
    xact_s.i2c_tx_buffer[7] =  0x0f;
    xact_s.write_length     =  0x8;
    xact_s.read_length      =  0x0;
    xact_s.xact_active      =  0x1;
    xact_s.xact_success     =  0x0;

    start_i2c0_master_xact(&xact_s, &xact_callback);

    poll_wait();

    if(xact_s.xact_success == 1) {
        uart0_putstring("eeprom i2c write bytes xaction success.\n");
    } else {
        uart0_putstring("eeprom i2c write bytes xaction fail.\n");
    }


    /**************************************/
    i2c_init_state( &xact_s) ;
    uart0_putstring("i2c read bytes task...\n");

    xact_s.i2c_tx_buffer[0] =  i2c_create_write_address(EEPROM_ADDR);
    xact_s.i2c_tx_buffer[1] =  0x0;
    xact_s.i2c_tx_buffer[2] =  0x0;
    xact_s.i2c_tx_buffer[3] =  i2c_create_read_address(EEPROM_ADDR);
    xact_s.write_length     =  0x3;
    xact_s.read_length      =  0x5;
    xact_s.xact_active      =  0x1;
    xact_s.xact_success     =  0x0;

    start_i2c0_master_xact(&xact_s, &xact_callback);

    poll_wait();

    if(xact_s.xact_success == 1) {
        uart0_putstring("eeprom i2c write bytes xaction success.\n");
    } else {
        uart0_putstring("eeprom i2c write bytes xaction fail.\n");
    }

    uint8_t check_buff[5] = {0xb,0xc,0xd,0x1e,0xf};

    for(i=0; i<5; ++i) {
        uart0_putstring(util_uitoa(i,10));
        uart0_putstring(": Read data is 0x");
        uart0_putstring(util_uitoa(xact_s.i2c_rd_buffer[i],16));
        uart0_putchar('\n');
        if(check_buff[i] != xact_s.i2c_rd_buffer[i]) {
            uart0_putstring("Wrong value in read bytes-> 0x");
            uart0_putstring(util_uitoa(xact_s.i2c_rd_buffer[i],16));
            uart0_putstring("\n...Should be-> 0x");
            uart0_putstring(util_uitoa(check_buff[i],16));
        }
        uart0_putchar('\n');
    }
}


int main (void) {

    int32_t cycles = 10;

    //pllstart_seventytwomhz() ;
    //   pllstart_sixtymhz() ;
    pllstart_fourtyeightmhz() ;

    MAMCR  = 0x0;
    MAMTIM = 0x4;
    MAMCR  = 0x2;

    uart0_init_115200() ;

    uart0_putstring("\n***Starting olimex eeprom test***\n\n");

    i2c_init(I2C0);

    stat_led_flash(cycles); // initial visual check

    eeprom_task() ;

    stat_led_flash_slow(4);

    uart0_putstring("\n\n***Done***\n\n");

    return(0);

}

