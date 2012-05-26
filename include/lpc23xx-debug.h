

/*
 * lpc23xx-debug.h
 */

#if defined(DEBUG_USB) || defined(DEBUG_UTIL)
    #define DBG             printf_lpc
    #define ASSERT(x)       if(!(x)){DBG(UART0,"\nAssertion '%s' failed in %s:%s#%d! Stop.\n",#x,__FILE__,__FUNCTION__,__LINE__);while(1);}
#else
    #define DBG(x ...)
    #define ASSERT(x)
#endif



