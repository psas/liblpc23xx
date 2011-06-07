#!/usr/bin/env python

# Calculate baud rate parameters for lpc23xx uart0/2/3
# see page 426 lpc23xx manual rev.03 august 2009

from __future__ import division

import os
from operator import itemgetter, attrgetter
from optparse import OptionParser
import re

import sys
import datetime

class MissingOption(Exception):
   def __init__(self, value):
       self.value = value
   def __str__(self):
       return repr(self.value)

class NoFRestVal(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value)

class BadPclkDiv(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value)

def inttobin(n):
    bs = ''
    if n < 0:  raise ValueError, "must be a greater than 0 "
    if n == 0: return '0'
    while n > 0:
        bs = str(n % 2) + bs
        n  = n >> 1
    return bs
 
def calc_baud(pclk, dlm, dll, divadd, mulval):

    actual = pclk/((16 * (256 * dlm + dll)) * (1+(divadd/mulval)))
    return actual 


def table_a(fr):
    tab = {1.000: (0,1)   ,  1.067: (1,15)  , 1.071: (1,14)  , 1.077: (1,13) , 1.083: (1,12)  , 1.091: (1,11) , 1.100: (1,10)  ,\
           1.111: (1,9)   ,  1.125: (1,8)   , 1.133: (2,15)  , 1.143: (1,7)  , 1.154: (2,13)  , 1.167: (1,6)  , 1.182: (2,11)  , 1.200: (1,5) ,\
           1.214: (3,14)  ,  1.222: (2,9)   , 1.231: (3,13)  , 1.250: (1,4)  , 1.267: (4,15)  , 1.273: (3,11) , 1.286: (2,7)   , 1.300: (3,10),\
           1.308: (4,13)  ,  1.333: (1,3)   , 1.357: (5,14)  , 1.364: (4,11) , 1.375: (3,8)   , 1.385: (5,13) , 1.400: (2,5)   ,\
           1.417: (5,12)  ,  1.429: (3,7)   , 1.444: (4,9)   , 1.455: (5,11) , 1.462: (6,13)  , 1.467: (7,15) , 1.500: (1,2)   ,\
           1.533: (8,15)  ,  1.538: (7,13)  , 1.545: (6,11)  , 1.566: (5,9)  , 1.571: (4,7)   , 1.583: (7,12) , 1.600: (3,5)   ,\
           1.615: (8,13)  ,  1.625: (5,8)   , 1.636: (7,11)  , 1.643: (9,14) , 1.667: (2,3)   , 1.692: (9,13) , 1.700: (7,10)  ,\
           1.714: (5,7)   ,  1.727: (8,11)  , 1.733: (11,15) , 1.750: (3,4)  , 1.769: (10,13) , 1.778: (7,9)  , 1.786: (11,14) , 1.800: (4,5),\
           1.818: (9,11)  ,  1.833: (5,6)   , 1.846: (11,13) , 1.857: (6,7)  , 1.867: (13,15) , 1.889: (8,9)  , 1.900: (9,10)  ,\
           1.923: (12,13) ,  1.929: (13,14) , 1.933: (14,15)   }

    difference = 2
    bestmatch  = (0,0)
    for k,v in tab.iteritems():
        if abs(fr - k) < difference:
            difference = abs(fr-k)
            bestmatch  = v
        
    return(bestmatch)



def find_frest(pclk, baud_req):

    frest_vals = [1.5,1.4,1.6,1.3,1.7,1.2,1.8,1.1,1.9]
    i          = 0
    frest      = 0
    while (frest < 1.1 or frest > 1.9) and i<len(frest_vals):
        frest = frest_vals[i]
        dlest = int(pclk/(16 * baud_req * frest))
        frest = pclk/(16 * baud_req * dlest)
        i     = i+1

    if i==len(frest_vals) and (frest< 1.1 or frest > 1.9):
        print "frest is: " ++ str(frest)
        msg    = "No value found for FRest"
        raise NoFRestVal(msg)

    return(round(frest,3), dlest)

if __name__ == "__main__":

    try:
        default_baud_req    = 0

        default_cclk        = 60e6

        default_pclk_div    = 0 

        usage = "usage: %prog --baud_req int --cclk int --pclk_div int [-h|--help]"

        parser = OptionParser(usage=usage)

        parser.add_option("-b", "--baud_req",\
                dest ="baud_req",\
                help ="Requested baud rate. Default=" + str(default_baud_req),\
                default = default_baud_req)
        parser.add_option("-c","--cclk",\
                dest   ="cclk",\
                help   ="cclk value. Default=" + str(default_cclk),\
                default = default_cclk)
        parser.add_option("-d","--pclk_div",\
                dest   ="pclk_div",\
                help   ="PCLK divider. (1,2,4 or 8). Default=" + str(default_pclk_div),\
                default = default_pclk_div)

        (options, args) = parser.parse_args()

        progname        = os.path.basename(sys.argv[0])
        progname        = os.path.join(sys.path[0],progname)
        run_command     = " ".join(sys.argv)
        now             = datetime.datetime.today()
        now             = now.strftime("%Y-%m-%d--%H-%M")

        baud_req        = int(options.baud_req)
        cclk            = int(options.cclk    )
        pclk_div        = int(options.pclk_div)

        if baud_req==default_baud_req or baud_req == "":
            print "\n" + usage + "\n" 
            raise MissingOption("No baud rate value supplied.")           

        if pclk_div==default_pclk_div or pclk_div == "":
            print "\n" + usage + "\n" 
            raise MissingOption("No pclk_divider value entered.")           

        print "command: "
        print run_command + "\n"

        print "baud_req is:\t" + str(baud_req)
        print "cclk is:\t" + str(cclk)
        print "pclk_div is:\t" + str(pclk_div)
        print "\n"

        if (pclk_div != 1) and (pclk_div != 2) and (pclk_div != 4) and (pclk_div != 8):
            msg = "Bad Pclk Divide Value: must be 1, 2, 4 or 8 for uart"
            raise BadPclkDiv(msg)

        frest_val = 0

        pclk  = cclk/pclk_div
        print "pclk is:\t" + str(pclk)

        dlest_val = pclk/(16 * baud_req)

        if dlest_val.is_integer():
            divaddval = 0
            mulval    = 1
            dlest     = int(dlest_val)
        else:
            (frest_val, dlest) = find_frest(pclk, baud_req)
            (divaddval,mulval) = table_a(frest_val)

        dlest_hi = (dlest & 0xFF00) >> 8
        dlest_lo = (dlest & 0x00FF)

        baud_actual = calc_baud(pclk, dlest_hi, dlest_lo, divaddval, mulval)

        print "frest_val\t= " + str(frest_val)

        print "DLL\t\t= " + str(dlest_lo) + "\t0b" + inttobin(dlest_lo)
        print "DLM\t\t= " + str(dlest_hi) + "\t0b" + inttobin(dlest_hi)
        print "DIVADDVAL\t= " + str(divaddval)
        print "MULTVAL\t\t= " + str(mulval)

        print "ACTUAL BAUD\t= " + str(baud_actual)

        relerror = ((baud_req/baud_actual) - 1) * 100
        print "Relative error\t= " + str(relerror) + "%"


        print "Done."

    except KeyboardInterrupt:
        print "\nQuitting"



