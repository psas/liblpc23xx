

/*
 * lpc23xx-info.h
 */

extern struct liblpc23xx_info {
	char*	boardtag ;
} ;

char*   infoquery_boardtag(void) ;

#ifdef BOARDA
   static struct liblpc23xx_info lpc23xx_info __attribute__ ((unused)) = { .boardtag = "boarda" };
#elif BOARDB
   static struct liblpc23xx_info lpc23xx_info __attribute__ ((unused)) = { .boardtag = "boardb" };
#else
   static struct liblpc23xx_info lpc23xx_info __attribute__ ((unused)) = { .boardtag = "undefined" };
#endif
