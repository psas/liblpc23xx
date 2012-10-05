
/* Copyright (C) 2011 Keith Wilson.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */


/*
 * lpc23xx-timer.h
 */

#ifndef _LPC23XX_TIMER_H
#define _LPC23XX_TIMER_H

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
void timer_disable(timer_channel channel) ;


#endif



