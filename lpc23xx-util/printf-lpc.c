
/*
 * printf_lpc.c
 */

#include <stdarg.h>
#include <stdint.h>

#include "lpc23xx-types.h"
#include "lpc23xx-uart.h"
#include "lpc23xx-util.h"

#include "printf-lpc.h"

/*
 * print_lpc
 */
void print_lpc(uartport fd, const char *format, ... ) {
    va_list args = NULL ;
    const char *curFormatPtr = format;

    for( ;*curFormatPtr != '\0'; curFormatPtr++ ) {
        if( *curFormatPtr != '%' ) {
            putchar_lpc(fd, *curFormatPtr);
        } else {
            curFormatPtr++;
            if( *curFormatPtr == '\0') {
                break;
            }
            if( *curFormatPtr == 'd') {
                const int valToPrint = va_arg( args, int );
                putstring_lpc(fd,util_itoa(valToPrint,10));
            } else if( *curFormatPtr == 'u') {
                const unsigned int valToPrint = va_arg( args, unsigned int );
                putstring_lpc(fd,util_uitoa(valToPrint,10));
            } else if( *curFormatPtr == 'X') {
                unsigned int valToPrint = va_arg( args, unsigned int );
                putstring_lpc(fd, util_uitoa(valToPrint,16));
            } else if( *curFormatPtr == 's') {
                char *s = (char *) va_arg( args, int );
                putstring_lpc(fd, s);
            } else if( *curFormatPtr == 'c') {
                char ch = (char)va_arg( args, int );
                putchar_lpc(fd, ch);
            } else if( *curFormatPtr == '%') {
                putchar_lpc(fd, '%');
            } else {
                //dont know what to do with this format string
                putchar_lpc(fd, '%');
                putchar_lpc(fd, *curFormatPtr);
            }
        }
    }
}

/*
 * printf_lpc
 */
void printf_lpc(uartport fd, const char *format, ... ) {
    va_list args = NULL;
    va_start( args, format );

    print_lpc(fd, format, args);
}


