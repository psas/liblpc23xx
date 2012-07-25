/*! \file lpc23xx-info.c
 */

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

#include <stdint.h>
#include "lpc23xx.h"

#include "lpc23xx-info.h"

struct liblpc23xx_info brd;

/*!
 * \mainpage liblpc23xx-0.1 API Reference
 *
 * \section intro Introduction
 *
 * liblpc23xx is an open source library used to develop embedded applications
 * on an <a href="http://www.nxp.com">NXP</a> LPC23xx microcontroller. The 
 * primary application area has been for avionics software developed by the 
 * <a href="http://psas.pdx.edu">Portland State Aerospace Society (PSAS)</a>
 *
 * This documentation is aimed at embedded application developers developing
 * firmware for systems incorporating a member of the lpc23xx family of 
 * devices. After reviewing this documentation, feedback and questions 
 * can be sent to the 
 * <a href="http://lists.psas.pdx.edu/mailman/listinfo/psas-avionics">PSAS psas-avionics mailing list</a>
 *
 *
 * \section features Library features
 *
 * - Common pll clock configurations
 * - Binary Semaphore implementation
 * - Interfaces to peripheral functions
 * - Examples of how to use APIs
 *
 * \section gettingstarted Getting Started
 * 
 * The top level directory contains a Makefile. It is assumed that the
 * user has an GCC cross compiler available. The path to the cross compiler
 * is listed in the Makefile and can be changed to the user's cross compiler
 * directory location.
 * 
 * A library: liblpc23xx.a will be created at the top level.
 *
 * Several of the module directories (lpc23xx-*) have tests (examples, actually) 
 * associated with them. 
\code
make tests
\endcode
 * will compile and link these tests to binary files which can be transfered to flash memory. 
 *
 * \section gitrepo Git Repository
 *
 * The source code is managed with <a href="http://git-scm.com/">Git</a>. The
 * main repository can be found at <a href="http://git.psas.pdx.edu/git">PSAS Git repository</a>.
 * A copy can be obtained with the command:
\code
git clone git://git.psas.pdx.edu/git/liblpc23xx.git
\endcode

    \section license License

     Unless otherwise noted the source code for this library is covered by
     the following license:

     Copyright (C) 2011 Keith Wilson.
    
     Permission is hereby granted, free of charge, to any person obtaining a
     copy of this software and associated documentation files (the "Software"),
     to deal in the Software without restriction, including without limitation
     the rights to use, copy, modify, merge, publish, distribute, sublicense,
     and/or sell copies of the Software, and to permit persons to whom the
     Software is furnished to do so, subject to the following conditions:
     
     The above copyright notice and this permission notice shall be included in
     all copies or substantial portions of the Software.
     
     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
     AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
     ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
     CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
     
     Except as contained in this notice, the names of the authors or their
     institutions shall not be used in advertising or otherwise to promote the
     sale, use or other dealings in this Software without prior written
     authorization from the authors.
 
 */

/*
 * infoquery_board
 */
char*    infoquery_boardtag(void) {
    return(brd.boardtag);
}




