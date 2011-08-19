
/*
 * scp1000-test.c
 * testing SPI interface with pressure sensor scp1000-D01
 */

#include <stdint.h>

#include "lpc23xx.h"

#include "lpc23xx-pll.h"
#include "lpc23xx-spi.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"
#include "printf-lpc.h"

#include "olimex2378-util.h"
#include "scp1000-test.h"

/*
 * scp_create_register_write_address
 */
inline uint8_t scp_create_register_write_address(scp_regaddr regaddr) {
    return(  ( (regaddr << 2)| 0x2)   );
}

/*
 * scp_create_register_read_address
 */
inline uint8_t scp_create_register_read_address(scp_regaddr regaddr) {
    return( (regaddr << 2) );
}

/*
 * scp_read_revid
 */
uint16_t scp_read_revid() {
    uint8_t  cmdaddr;
    uint16_t data = 0;

    cmdaddr = scp_create_register_read_address(REVID);

    SSEL_LOW;

    spi_transact(cmdaddr, SPI_16BITS) ;

    spi_waitSPIF();

    data = S0SPDR ;

    SSEL_HIGH;

    return(data & 0xf);
}

/*
 * scp_read_data8
 */
uint16_t scp_read_data8() {
    uint8_t  cmdaddr;
    uint16_t data = 0;

    cmdaddr = scp_create_register_read_address(DATARD8);
    printf_lpc(UART0,"DATARD8 address is: 0x%x\n",cmdaddr);

    SSEL_LOW;

    spi_transact(cmdaddr<<8, SPI_16BITS) ;
    printf_lpc(UART0,"DATARD8<<8 address is: 0x%x\n",cmdaddr<<8);

    spi_waitSPIF();

    data = S0SPDR & 0x7 ;

    SSEL_HIGH;

    return(data);
}

/*
 * scp_read_data16
 */
uint16_t scp_read_data16() {
    uint8_t  cmdaddr;
    uint16_t data_low = 0;
    uint16_t data_high = 0;

    cmdaddr = scp_create_register_read_address(DATARD16);

    SSEL_LOW;

    spi_transact(cmdaddr<<8, SPI_16BITS) ;

    spi_waitSPIF();

    data_high = S0SPDR & 0xff ;

    spi_transact(cmdaddr<<8, SPI_16BITS) ;

    spi_waitSPIF();

    data_low = S0SPDR & 0xff ;


    SSEL_HIGH;

    return((data_high<<8) | data_low);
}

/*
 * scp_read_status
 */
uint16_t scp_read_status() {
    uint8_t  cmdaddr;
    uint16_t data = 0;

    cmdaddr = scp_create_register_read_address(STATUS);
    SSEL_LOW;

    spi_transact(cmdaddr<<8, SPI_16BITS) ;

    spi_waitSPIF();

    data = S0SPDR ;

    SSEL_HIGH;

    return(data & 0xff);
}

/*
 * scp_reset
 */
void scp_reset() {
    uint8_t  cmdaddr;

    cmdaddr = scp_create_register_write_address(RSTR);

    SSEL_LOW;

    spi_transact( ((cmdaddr<<8)|0x1), SPI_16BITS) ;

    spi_waitSPIF();
    SSEL_HIGH;
}


/*
 * scp_check
 */
void scp_check() {
    uint8_t  cmdaddr;
    uint8_t  status = 1;
    uint8_t check_result = 0;

    cmdaddr = scp_create_register_write_address(OPERATION);

    SSEL_LOW;
    spi_transact( ((cmdaddr<<8)|0x7), SPI_16BITS) ;
    spi_waitSPIF();
    SSEL_HIGH;

    while(status != 0) {
        uart0_putstring("SCP read status...\n");
        status = scp_read_status() ;
        status &= 0x1;
        printf_lpc(UART0,"SCP status is: %d\n", status );
        util_wait_msecs(2500);

    }
    cmdaddr = scp_create_register_read_address(DATARD8);

    SSEL_LOW;

    spi_transact(cmdaddr<< 8, SPI_16BITS) ;

    spi_waitSPIF();

    check_result = S0SPDR;
    if(check_result != 0) {
        printf_lpc(UART0,"SCP checksum result OK: %d\n", check_result );
    } else {
        printf_lpc(UART0, "SCP checksum result fail.\n",check_result);
    }

    SSEL_HIGH;
}

/*
 * scp_setmode
 */
void scp_setmode(scp_mode mode) {
    uint8_t  cmdaddr;

    cmdaddr = scp_create_register_write_address(OPERATION);

    SSEL_LOW;

    switch(mode) {
        case SCP_HIGH_RES:
        case SCP_HIGH_SPEED:
        case SCP_ULTRA_LOW_POWER:
            spi_transact( ((cmdaddr<<8)|mode), SPI_16BITS) ;
            break;
        case SCP_LOW_POWER_17BITS:
        case SCP_LOW_POWER_15BITS:
        case SCP_LOW_POWER_START:
#ifdef DEBUG_SCP
            printf_lpc(UART0,"SCP: LOW POWER NOT IMPLEMENTED\n");
#endif
            break;
        default:
#ifdef DEBUG_SCP
            printf_lpc(UART0,"SCP: scp_mode not recognized.\n");
#endif
            break;
    }

    spi_waitSPIF();
    SSEL_HIGH;

    //   cmdaddr = scp_create_register_read_address(OPERATION);

    //    SSEL_LOW;


    //    spi_transact(cmdaddr<<8, SPI_16BITS);
    //
    //    spi_waitSPIF();
    //
    //    value = S0SPDR;
    //    printf_lpc(UART0,"value is: 0x%x\n",value);
    //
    //    SSEL_HIGH;

}

/*
 * scp_read_pressure
 */
uint32_t scp_read_pressure() {
    uint8_t  cmdaddr;
    uint16_t pres_highbits = 0;
    uint16_t pres_lowbits  = 0;
    uint32_t pres          = 0;

    cmdaddr = scp_create_register_read_address(DATARD8);

    SSEL_LOW;

    spi_transact(cmdaddr<< 8, SPI_16BITS) ;

    spi_waitSPIF();

    pres_highbits = (S0SPDR & 0x7); // bits [2:0] msb of pressure

    cmdaddr = scp_create_register_read_address(DATARD16);

    spi_transact(cmdaddr, SPI_16BITS) ;
    spi_waitSPIF();

    spi_transact(cmdaddr, SPI_16BITS) ;
    spi_waitSPIF();

    pres_lowbits = S0SPDR;
    SSEL_HIGH;

    pres = ((pres_highbits << 16) | pres_lowbits);

    return( pres );
}

/*
 * print_pressure
 */
void scp_print_pressure(uint32_t raw_pressure) {
    printf_lpc(UART0, "raw Pressure is: %u\n", raw_pressure);
    printf_lpc(UART0, "Pressure is: %u Pa\n", raw_pressure/4);
}


/*
 * scp_read_temperature
 */
uint32_t scp_read_temperature() {
    uint8_t  cmdaddr;
    uint16_t temp_highbits = 0;
    uint16_t temp_lowbits = 0;

    cmdaddr = scp_create_register_read_address(TEMPOUT);

    SSEL_LOW;

    spi_transact(cmdaddr<< 8, SPI_16BITS) ;

    spi_waitSPIF();

    temp_highbits = (S0SPDR & 0xff); //& 0xf ; // low 8 bits is high 8 bits of temp

    spi_transact(cmdaddr<< 8, SPI_16BITS) ;

    spi_waitSPIF();

    temp_lowbits = (S0SPDR>>8) & 0xff;

    SSEL_HIGH;

    return( ((temp_highbits << 8) | temp_lowbits) & 0xffff );
}

/*
 * print_temp
 */
void scp_print_temp(uint32_t temp_raw) {

    uint32_t temp          = 0;
    uint32_t temp_sign_bit = 0;

    temp_sign_bit = ((0x1 << 13) & temp_raw) >> 13;
    if(temp_sign_bit == 0) {
        temp = (int32_t) (temp_raw/20);
        printf_lpc(UART0,"temp is: %d C\n",temp);
    } else {
        temp = ~temp_raw & 0x00003fff;
        temp += 1;
        printf_lpc(UART0,"temp is: -%u C\n",temp);
    }
}


/*
 * scp_task
 */
void scp_task() {

    uint16_t rev = 0;
    uint16_t status        = 0;
    uint32_t temp_raw      = 0;
    uint32_t pres_raw      = 0;
    uint32_t count         = 0;

    uart0_putstring("\n===> SCP: scp task...\n");

    rev = scp_read_revid();
    printf_lpc(UART0, "SCP1000 Rev id: %u\n", rev);

    uart0_putstring("SCP reset scp...\n");
    scp_reset();

    util_wait_msecs(60);

    util_wait_msecs(90);

    // perform init sequence
    scp_check();


    uart0_putstring("SCP read status...\n");
    status = scp_read_status() ;
    printf_lpc(UART0,"SCP status is: %d\n", status & 0x1);

    uart0_putstring("SCP set mode...\n");
    scp_setmode(SCP_HIGH_RES);


    while (1) {
        ++count;
        while ( SCP1000_DRDY == 0 ) ;

        temp_raw = scp_read_temperature();
        temp_raw &= 0xffff;

        util_wait_msecs(2500);

        printf_lpc(UART0,"%u\t", count);
        scp_print_temp(temp_raw);

        pres_raw = scp_read_pressure();
        printf_lpc(UART0,"%u\t", count);
        scp_print_pressure(pres_raw);
    }


}

int main (void) {

    int32_t cycles = 10;

    SCP1000_DRDY_PINSEL;
    SCP1000_DRDY_NOPULL;
    SCP1000_DRDY_EN ;

    // scp1000 breakout board has no reset use power off/on to reset.
    SCP1000_PWR_PINSEL;
    SCP1000_PWR_NOPULL;

    pllstart_seventytwomhz() ;
    //   pllstart_sixtymhz() ;
    //   pllstart_fourtyeightmhz() ;
    FIO_ENABLE;
    SCP1000_PWR_EN;
    SCP1000_PWR_ON;

    uart0_init_115200() ;

    uart0_putstring("\n***Starting olimex scp1000-D01 test***\n\n");

    spi_init_master_MSB_16(CCLK_DIV8, SPI_100KHZ);

    stat_led_flash_fast(cycles); // initial visual check

    scp_task() ;

    // stat_led_flash_slow(2);

    uart0_putstring("\n\n***Done***\n\n");

    return(0);

}


















































































