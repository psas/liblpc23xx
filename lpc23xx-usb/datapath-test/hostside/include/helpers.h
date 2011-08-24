
/*
 * helpers.h
 */

#ifndef _HELPERS_H
#define _HELPERS_H

#ifdef __cplusplus
extern "C" {
#endif


    typedef enum { FALSE, TRUE } boolean;

    void info(const char* message);
    void error(const char* message);

    void wait ( int seconds );

    unsigned int popcount(unsigned int x) ;
    unsigned int fast_log2(unsigned long int x) ;
    unsigned int numbits_in_int(unsigned long int x) ;
    void wait_ms ( int msecs );

    void binaryprint(int b);

    void gen_primes(unsigned long int exp, char* filename) ;

    int get_numprocs();

    void util_strreverse(char* begin, char* end);

    int max(int a, int b);
    int min(int a, int b);

    void machineSizes(void) ;

#ifdef __cplusplus
} 
#endif

#endif
