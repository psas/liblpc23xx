
/*
 * helpers.c
 * useful routines
 */

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <sys/utsname.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <linux/types.h>
#include <math.h>

#include "helpers.h"


// info function
//     info("Machine sizes:\n");
//  => --INFO-- Machine sizes:
void info(const char* message) {
    printf("=> --INFO-- %s\n", message);
    fflush(stdout);
}

// error function
void error(const char* message) {
    fprintf(stderr, "=> --ERROR-- %s\n", message);
    fflush(stdout);
    fflush(stderr);
}

// wait function
//     wait(3);  // wait 3 seconds
//
void wait ( int seconds )
{
    clock_t endwait;
    endwait = clock () + seconds * CLOCKS_PER_SEC ;
    while (clock() < endwait) {}
}

// wait function
//     wait_ms(3);  // wait 3 mseconds
void wait_ms ( int msecs )
{
    clock_t endwait;
    endwait = clock () + msecs * (clock_t)(CLOCKS_PER_SEC/1000) ;
    while (clock() < endwait) {}
}

/*
 * Prints an integer in binary. 
 * Uses  sizeof(int) to determine word size. 
 *     binaryprint(4322210);
 *     => --INFO-- Test binaryprint(4322210)
 *      0000 0000 0100 0001 1111 0011 1010 0010
 *
 */
void binaryprint(int b) {

    int mask  = 0;
    int check = 0;
    int i     = 0;
    int shift = sizeof(int)*8;

    // create mask based on sizeof(int);
    mask    = 0x1<<(shift-1);
    // loop through bits
    for(i=0;i<shift;i++) {
        check = b;
        check = ((check<<i) & mask);
        if(i%4==0) printf(" "); 
        (check==mask) ? printf("1") : printf("0");
    }
}

/*
 * popcount
 *
 * — Built-in Function: int __builtin_popcount (unsigned int x)
 * 
 *    Returns the number of 1-bits in x. 
 */ 
unsigned int popcount(unsigned int x) {

    return(__builtin_popcount(x));
}

/*
 * fast_log2
 */
unsigned int fast_log2(unsigned long int x) {

    const long long int     b[] = {0x2, 0xC, 0xF0, 0xFF00, 0xFFFF0000, 0xFFFFFFFF00000000ULL};
    const unsigned long int S[] = {1, 2, 4, 8, 16, 32};
    int i;

    register unsigned int r = 0; // result of log2(v) will go here
    for (i = 5; i >= 0; i--) // unroll for speed...
    {
        if (x & b[i])
        {
            x >>= S[i];
            r |= S[i];
        } 
    }

    return(r);
}

/*
 * numbits_in_int
 * how many bits to represent an integer.
 *
// gcc only. 
// 
// http://gcc.gnu.org/onlinedocs/gcc-4.3.0/gcc/Other-Builtins.html 
// — Built-in Function: int __builtin_clz (unsigned int x) 
//    Returns the number of leading 0-bits in x, starting at the most significant bit position. If x is 0, the result is undefined.  

 Attempt to make machine independent, though dependent on gcc.

 Uses magic numbers.

 This is ~10x faster than ceil_log2(i) with power of 2 fixes.
 */
unsigned int numbits_in_int(unsigned long int xl) {

    unsigned long long xll = (unsigned long long ) xl;
    unsigned int firstbit = 0;

    if(xll==0) {
        // raise exception?
        error("ceil_log2(0) doesn't exist");
        exit(EXIT_FAILURE);
    }

    xll       &= 0xFFFFFFFFFFFFFFFFULL;
    firstbit = __builtin_clzll(xll);
    return(64-firstbit);

}

/*
 * get_numprocs
 *
 *     printf("Number of processors: %i\n", get_numprocs());
 *
 */
int get_numprocs() {

#ifdef DEBUG
    info("In numprocs");
#endif

    int numprocs     = -1;
    int numprocs_max = -1;

    //    FILE* fp;
    //    int scanfret;
    //    fp = popen ("grep -c \"^processor\" /proc/cpuinfo","r");
    //    scanfret = fscanf(fp,"%i",&numprocs);
    //    fclose(fp);
    //
    numprocs = sysconf(_SC_NPROCESSORS_ONLN);

    if (numprocs < 1)
    {
        error("Failed to find number of available cpus");
        fprintf(stderr,
                "Error number returned from sysconf(_SC_NPROCESSORS_ONLN):\n%s\n", 
                strerror (errno));
        exit (EXIT_FAILURE);
    }
    numprocs_max = sysconf(_SC_NPROCESSORS_CONF);
    if (numprocs_max < 1)
    {
        error("Failed to find processor configuration");
        fprintf(stderr, 
                "Error number returned from sysconf(_SC_NPROCESSORS_CONF):\n%s\n", 
                strerror (errno));
        exit (EXIT_FAILURE);
    }

    return numprocs;
}


/*
 * util_strreverse
 */
void util_strreverse(char* begin, char* end) {

    char aux;

    while(end>begin) {
        aux=*end, *end--=*begin, *begin++=aux;
    }
}

/*
 * isdigit
 */
int myisdigit(char c) {
    return(c == '0' || 
            c == '1' ||
            c == '2' ||
            c == '3' ||
            c == '4' ||
            c == '5' ||
            c == '6' ||
            c == '7' ||
            c == '8' ||
            c == '9');
}

// max function. returns value of larger a, b
int max(int a, int b) {
    return ( (a>b) ? a : b );
} 

// max function. returns smaller of a, b
int min(int a, int b) {
    return ( (a<b) ? a : b );
} 

// print some local compiler information
void machineSizes(void) {

    struct utsname name;
    uname(&name);

    int          whatis_int;
    unsigned int whatis_uint;
    long         whatis_lint;
    unsigned long whatis_ulint;
    unsigned long long whatis_ullint;
    unsigned short whatis_ushort;
    char         whatis_char;
    unsigned char         whatis_uchar;
    float        whatis_float;
    double       whatis_double;
    boolean         whatis_bool;

    // delicate types
    //    long long int whatis_llint;      // 'C standard says' longest int is 8 bytes (64 bits)
    long double   whatis_ldouble;

    printf("Arch: %4s\n",name.machine);
    printf("\n");
    printf( "RAND_MAX is: %d\n",RAND_MAX);
    printf( "CLOCKS_PER_SEC is: %ld\n", CLOCKS_PER_SEC);

    printf( "Size of int: %i\n",        (int)sizeof(whatis_int));
    printf( "Size of unsigned int:%i\n",(int)sizeof(whatis_uint));
    printf( "Size of long:%i\n",        (int)sizeof(whatis_lint));
    printf( "Size of unsigned long int:%i\n", (int)sizeof(whatis_ulint));
    printf( "Size of unsigned long long int:%i\n", (int)sizeof(whatis_ullint));
    printf( "Size of char:%i\n",(int)sizeof(whatis_char));
    printf( "Size of unsigned char:%i\n", (int)sizeof(whatis_uchar));
    printf( "Size of unsigned short:%i\n", (int)sizeof(whatis_ushort));
    printf( "Size of float:%i\n",(int)sizeof(whatis_float));
    printf( "Size of double:%i\n",(int)sizeof(whatis_double));
    printf( "Size of boolean:%i\n", (int)sizeof(whatis_bool));

    printf( "Delicate Types:\n");
    //    printf( "Size of long long int:%i\n", (int)sizeof(whatis_llint));
    printf( "Size of long double:%i\n", (int)sizeof(whatis_ldouble));
    printf("\n");
}

