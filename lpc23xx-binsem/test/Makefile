
NAME            := lpc23xx-binsem-test
LIBDIR          := ../..

CC              := arm-linux-gnueabi-gcc
LD              := arm-linux-gnueabi-ld 
AR              := arm-linux-gnueabi-ar
AS              := arm-linux-gnueabi-as
CP              := arm-linux-gnueabi-objcopy
OD              := arm-linux-gnueabi-objdump

INCLUDE         := -I.\
                   -I./include\
                   -I../include\
                   -I$(LIBDIR)/include\
                   -I$(LIBDIR)/lpc23xx-pll/include\
                   -I$(LIBDIR)/lpc23xx-uart/include\
                   -I$(LIBDIR)/lpc23xx-binsem/include


include $(LIBDIR)/include/common-test-make.mk
