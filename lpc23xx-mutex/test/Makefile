
NAME            := lpc23xx-mutex-test
LIBDIR          := ../..

#CC              := arm-elf-gcc
#LD              := arm-elf-ld
#AR              := arm-elf-ar rvs
#AS              := arm-elf-as
#CP              := arm-elf-objcopy
#OD              := arm-elf-objdump

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
                   -I$(LIBDIR)/lpc23xx-pll/include\
                   -I$(LIBDIR)/lpc23xx-uart/include\
                   -I$(LIBDIR)/lpc23xx-mutex/include


include $(LIBDIR)/include/common-test-make.mk
