
#
# Makefile for lpc23xx-uart-test
#

NAME            := lpc23xx-uart-test
LIBDIR          := ../..

CC              := arm-elf-gcc
LD              := arm-elf-ld
AR              := arm-elf-ar
AS              := arm-elf-as
CP              := arm-elf-objcopy
OD              := arm-elf-objdump

INCLUDE         := -I.\
                   -I./include\
                   -I../include\
                   -I$(LIBDIR)/include\
                   -I$(LIBDIR)/lpc23xx-pll/include

include $(LIBDIR)/include/common-test-make.mk
