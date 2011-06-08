

/*
 * lpc23xx-pll.c
 */

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-info.h"

struct liblpc23xx_info brd;

/*
 * infoquery_board
 */
char*    infoquery_boardtag(void) {
    return(brd.boardtag);
}

