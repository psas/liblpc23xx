#include "lpc23xx.h"
#include "lpc23xx-power.h"
#include "lpc23xx-pll.h"

void inline POWER_ON(pconp_peripheral perf){
    PCONP = (PCONP | perf) & PCONP_MASK;
}
void inline POWER_OFF(pconp_peripheral perf){
    PCONP &= PCONP_MASK & ~(perf);
}

void inline ENABLE_WAKE_ON(intwake_bits module){
    INTWAKE = (INTWAKE | module) & INTWAKE_MASK;
}

void inline DISABLE_WAKE_ON(intwake_bits module){
    INTWAKE &= ~(module) & INTWAKE_MASK;
}


void safe_sleep(unsigned int intwake){
    /*
     * Save PLL state
     * Save active interrupts
     * Disable interrupts
     * Set INTWAKE
     * Sleep
     * Restore pll
     * Restore interrupts
     */
    Freq saved_freq = pllquery_cclk_mhz();
//    vic_cpu_disable_interrupts()?
    unsigned int saved_VICIntEnable = VICIntEnable;
    VICIntEnClr = 0xFFFFFFFF;

    INTWAKE = (INTWAKE | intwake) & INTWAKE_MASK;
    SLEEP_MODE;

    pllstart(saved_freq);
    VICIntEnable = saved_VICIntEnable;

}

void safe_power_down(unsigned int intwake){
    /*
     * Save PLL state
     * Save active interrupts
     * Disable interrupts
     * Set INTWAKE
     * Sleep
     * Restore pll
     * Restore interrupts
     */
    //todo: deal with MAM
    Freq saved_freq = pllquery_cclk_mhz();
    unsigned int saved_VICIntEnable = VICIntEnable;
    VICIntEnClr = 0xFFFFFFFF;

    INTWAKE = (INTWAKE | intwake) & INTWAKE_MASK;
    POWER_DOWN_MODE;

    pllstart(saved_freq);
    VICIntEnable = saved_VICIntEnable;

}
