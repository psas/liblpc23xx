
#
# Makefile for lpc23xx-uart-test
#

NAME            := lpc23xx-uart-test
LIBDIR          := ../..

CC              := arm-linux-gnueabi-gcc
LD              := arm-linux-gnueabi-ld -v
AR              := arm-linux-gnueabi-ar rvs
AS              := arm-linux-gnueabi-as
CP              := arm-linux-gnueabi-objcopy
OD              := arm-linux-gnueabi-objdump

INCLUDE         := -I.\
                   -I./include\
                   -I../include\
                   -I$(LIBDIR)/include\
                   -I$(LIBDIR)/lpc23xx-pll/include

include $(LIBDIR)/include/common-test-make.mk
