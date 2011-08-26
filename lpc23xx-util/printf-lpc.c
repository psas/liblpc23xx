
/* Copyright (C) 2011 Keith Wilson.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */


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
 * doubles (%g) might be accommodated with dtoa() from gcc/newlib dist, but
 * this uses a large amount of code space. Is it really necessary? Omitted
 * for now.
 */

/*
 * print_lpc
 */
void print_lpc(uartport fd, const char *format, va_list args ) {

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
                putstring_lpc(fd,util_itoa(valToPrint,DEC));
            } else if( *curFormatPtr == 'u') {
                const unsigned int valToPrint = va_arg( args, unsigned int );
                putstring_lpc(fd,util_uitoa(valToPrint,DEC));
            } else if( *curFormatPtr == 'X') {
                unsigned int valToPrint = va_arg( args, unsigned int );
                putstring_lpc(fd, util_uitoa(valToPrint,HEX));
            } else if( *curFormatPtr == 'x') {
                unsigned int valToPrint = va_arg( args, unsigned int );
                putstring_lpc(fd, util_uitoa(valToPrint,HEX));
            } else if( *curFormatPtr == 'o') {
                unsigned int valToPrint = va_arg( args, unsigned int );
                putstring_lpc(fd, util_uitoa(valToPrint,OCT));
            } else if( *curFormatPtr == 'b') {
                unsigned int valToPrint = va_arg( args, unsigned int );
                putstring_lpc(fd, util_uitoa(valToPrint,BIN));
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


