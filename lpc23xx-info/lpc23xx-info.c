

/*
 * lpc23xx-pll.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-info.h"

#ifdef OLIMEXLPCP2378REVA
    #include "olimexlpcp2378reva.h"
#elif LPC2368PSASGFE
    #include "lpc2368-PSAS-GFE"
#else
    #error ***** No board configuration defined. ******
#endif
