
#
# Makefile for lpc23xx-uart-test
#

NAME            := serial-test
LIBDIR          := ../..

INCLUDE         := -I.\
                   -I./include\
                   -I../include\
                   -I$(LIBDIR)/include\
                   -I$(LIBDIR)/lpc23xx-mam/include\
                   -I$(LIBDIR)/lpc23xx-pll/include\
                   -I$(LIBDIR)/lpc23xx-util/include\
                   -I$(LIBDIR)/lpc23xx-vic/include\
                   -I$(LIBDIR)/lpc23xx-uart/include

#CSRCS           = serial-fifo.c
DEBUG           = -DDEBUG_USB
include $(LIBDIR)/include/common-test-make.mk
