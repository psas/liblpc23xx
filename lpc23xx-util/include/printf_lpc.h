
/*
 * printf_lpc.h
 */

#ifndef _PRINTF_LPC_H
#define _PRINTF_LPC_H

#include <stdarg.h>
#include <stdint.h>

#include "lpc23xx-uart.h"

void      printf_lpc(uartport fd, const char *format, ... );

#endif

