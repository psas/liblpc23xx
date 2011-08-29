
/*
   LPCUSB, an USB device driver for LPC microcontrollers   
   Copyright (C) 2006 Bertrik Sikken (bertrik@sikken.nl)

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
   2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
   3. The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
   IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
   OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
   IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, 
   INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
   NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
   THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
   */

#include <stdint.h>
#include "lpc23xx-types.h"
#include "printf-lpc.h"
#include "serial-fifo.h"

void fifo_init(fifo_type *fifo) {
    fifo->head = 0;
    fifo->tail = 0;
}

/**
 * put a uint32_t word into the uint8_t char fifo
 */
BOOL fifo_putword(fifo_type *fifo, uint32_t w) {
    int     next;

    uint8_t i = 0;

    // check if FIFO has room
    for(i=1; i<5; ++i) {
        next = (fifo->head + i) % sizeof(fifo->buf);
        if (next == fifo->tail) {
            // full
            printf_lpc(UART0, "fifo_putword: FIFO full at %d\n", i);
            return FALSE;
        }
    }

    fifo->buf[fifo->head]   = w &  0xff;
    fifo->buf[fifo->head+1] = ((w & (0xff << 8)) >> 8);
    fifo->buf[fifo->head+2] = ((w & (0xff << 16)) >> 16);
    fifo->buf[fifo->head+3] = ((w & (0xff << 24)) >> 24);

    fifo->head = next;


    return TRUE;

}

BOOL fifo_put(fifo_type *fifo, uint8_t c) {
    int next;

    // check if FIFO has room
    next = (fifo->head + 1) % sizeof(fifo->buf);
    if (next == fifo->tail) {
        // full
        printf_lpc(UART0, "FIFO full\n");
        return FALSE;
    }

    fifo->buf[fifo->head] = c;
    fifo->head = next;

    return TRUE;
}


BOOL fifo_get(fifo_type *fifo, uint8_t *pc) {
    int next;

    // check if FIFO has data
    if (fifo->head == fifo->tail) {
        return FALSE;
    }

    next = (fifo->tail + 1) % sizeof(fifo->buf);

    *pc = fifo->buf[fifo->tail];
    fifo->tail = next;

    return TRUE;
}


int fifo_avail(fifo_type *fifo) {
    return (sizeof(fifo->buf) + fifo->head - fifo->tail) % sizeof(fifo->buf);
}


int fifo_free(fifo_type *fifo) {
    return (sizeof(fifo->buf) - 1 - fifo_avail(fifo));
}

