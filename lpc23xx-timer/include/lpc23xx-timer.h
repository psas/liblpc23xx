
/*
 * lpc23xx-timer.h
 */

#ifndef _LPC23XX_TIMER_H
#define _LPC23XX_TIMER_H

#define         PCONP_PCTIM0                  1
#define         PCONP_PCTIM1                  2
#define         PCONP_PCTIM2                  22
#define         PCONP_PCTIM3                  23

#define         TIMER_0_PWR_ON          (PCONP = (PCONP |  (1<<PCONP_PCTIM0)))
#define         TIMER_0_PWR_OFF         (PCONP = (PCONP & ~(1<<PCONP_PCTIM0)))

#define         TIMER_1_PWR_ON          (PCONP = (PCONP |  (1<<PCONP_PCTIM1)))
#define         TIMER_1_PWR_OFF         (PCONP = (PCONP & ~(1<<PCONP_PCTIM1)))

#define         TIMER_2_PWR_ON          (PCONP = (PCONP |  (1<<PCONP_PCTIM2)))
#define         TIMER_2_PWR_OFF         (PCONP = (PCONP & ~(1<<PCONP_PCTIM2)))

#define         TIMER_3_PWR_ON          (PCONP = (PCONP |  (1<<PCONP_PCTIM3)))
#define         TIMER_3_PWR_OFF         (PCONP = (PCONP & ~(1<<PCONP_PCTIM3)))

#define         PCLKSEL0_PCLK_TIMER0    2
#define         PCLKSEL0_PCLK_TIMER1    4

#define         PCLKSEL1_PCLK_TIMER2    12
#define         PCLKSEL1_PCLK_TIMER3    14


#define         TIMER_0_CLK_IS_CCLK_DIV1    ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_TIMER0)) |(0x1 << PCLKSEL0_PCLK_TIMER0)) )
#define         TIMER_0_CLK_IS_CCLK_DIV2    ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_TIMER0)) |(0x2 << PCLKSEL0_PCLK_TIMER0)) )
#define         TIMER_0_CLK_IS_CCLK_DIV4    ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_TIMER0)) |(0x0 << PCLKSEL0_PCLK_TIMER0)) )
#define         TIMER_0_CLK_IS_CCLK_DIV8    ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_TIMER0)) |(0x3 << PCLKSEL0_PCLK_TIMER0)) )

#define         TIMER_1_CLK_IS_CCLK_DIV1    ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_TIMER1)) |(0x1 << PCLKSEL0_PCLK_TIMER1)) )
#define         TIMER_1_CLK_IS_CCLK_DIV2    ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_TIMER1)) |(0x2 << PCLKSEL0_PCLK_TIMER1)) )
#define         TIMER_1_CLK_IS_CCLK_DIV4    ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_TIMER1)) |(0x0 << PCLKSEL0_PCLK_TIMER1)) )
#define         TIMER_1_CLK_IS_CCLK_DIV8    ( PCLKSEL0 = ((PCLKSEL0 & ~(0x3<<PCLKSEL0_PCLK_TIMER1)) |(0x3 << PCLKSEL0_PCLK_TIMER1)) )


#define         TIMER_2_CLK_IS_CCLK_DIV1    ( PCLKSEL1 = ((PCLKSEL1 & ~(0x3<<PCLKSEL1_PCLK_TIMER2)) |(0x1 << PCLKSEL1_PCLK_TIMER2)) )
#define         TIMER_2_CLK_IS_CCLK_DIV2    ( PCLKSEL1 = ((PCLKSEL1 & ~(0x3<<PCLKSEL1_PCLK_TIMER2)) |(0x2 << PCLKSEL1_PCLK_TIMER2)) )
#define         TIMER_2_CLK_IS_CCLK_DIV4    ( PCLKSEL1 = ((PCLKSEL1 & ~(0x3<<PCLKSEL1_PCLK_TIMER2)) |(0x0 << PCLKSEL1_PCLK_TIMER2)) )
#define         TIMER_2_CLK_IS_CCLK_DIV8    ( PCLKSEL1 = ((PCLKSEL1 & ~(0x3<<PCLKSEL1_PCLK_TIMER2)) |(0x3 << PCLKSEL1_PCLK_TIMER2)) )


#define         TIMER_3_CLK_IS_CCLK_DIV1    ( PCLKSEL1 = ((PCLKSEL1 & ~(0x3<<PCLKSEL1_PCLK_TIMER3)) |(0x1 << PCLKSEL1_PCLK_TIMER3)) )
#define         TIMER_3_CLK_IS_CCLK_DIV2    ( PCLKSEL1 = ((PCLKSEL1 & ~(0x3<<PCLKSEL1_PCLK_TIMER3)) |(0x2 << PCLKSEL1_PCLK_TIMER3)) )
#define         TIMER_3_CLK_IS_CCLK_DIV4    ( PCLKSEL1 = ((PCLKSEL1 & ~(0x3<<PCLKSEL1_PCLK_TIMER3)) |(0x0 << PCLKSEL1_PCLK_TIMER3)) )
#define         TIMER_3_CLK_IS_CCLK_DIV8    ( PCLKSEL1 = ((PCLKSEL1 & ~(0x3<<PCLKSEL1_PCLK_TIMER3)) |(0x3 << PCLKSEL1_PCLK_TIMER3)) )

#define         RESET_TIMER0            (T0TCR = 0x3)
#define         RESET_TIMER1            (T1TCR = 0x3)
#define         RESET_TIMER2            (T2TCR = 0x3)
#define         RESET_TIMER3            (T3TCR = 0x3)

#define         START_TIMER0            (T0TCR = 0x1)
#define         START_TIMER1            (T1TCR = 0x1)
#define         START_TIMER2            (T2TCR = 0x1)
#define         START_TIMER3            (T3TCR = 0x1)

#define         STOP_TIMER0             (T0TCR = 0x0)
#define         STOP_TIMER1             (T1TCR = 0x0)
#define         STOP_TIMER2             (T2TCR = 0x0)
#define         STOP_TIMER3             (T3TCR = 0x0)

typedef enum { TIMER_0, TIMER_1, TIMER_2, TIMER_3 } timer_channel;

void timer_init(timer_channel channel, uint32_t prescale, pclk_scale scale) ;


#endif



