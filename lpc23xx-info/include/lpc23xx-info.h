

/*
 * lpc23xx-info.h
 */


struct liblpc23xx_info {
	char*	target ;
} ;

#ifdef OLIMEXLPCP2378REVA
   static struct liblpc23xx_info lpc23xx_info __attribute__ ((unused)) = { .target = "olimexlpcp2378reva" };
#elif LPC2368PSASGFE
   static struct liblpc23xx_info lpc23xx_info __attribute__ ((unused)) = { .target = "lpc2368-PSAS-GFE" };
#else
   static struct liblpc23xx_info lpc23xx_info __attribute__ ((unused)) = { .target = "undefined" };
#endif
