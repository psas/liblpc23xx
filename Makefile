
#
# Makefile for liblpc23xx.a
#

NAME            := liblpc23xx

CROSS           := /opt/cross

CC              := $(CROSS)/bin/arm-elf-gcc
LD              := $(CROSS)/bin/arm-elf-ld
AR              := $(CROSS)/bin/arm-elf-ar
AS              := $(CROSS)/bin/arm-elf-as
CP              := $(CROSS)/bin/arm-elf-objcopy
OD              := $(CROSS)/bin/arm-elf-objdump

DEBUG           ?=
#DEBUG           = -DDEBUG
 
INCLUDE         := -I.\
                   -I./include\
                   -I./lpc23xx-info/include\
                   -I./lpc23xx-i2c/include\
                   -I./lpc23xx-mam/include\
                   -I./lpc23xx-pll/include\
                   -I./lpc23xx-uart/include\
                   -I./lpc23xx-usb/include\
                   -I./lpc23xx-util/include\
                   -I./lpc23xx-vic/include\
                   -I./lpc23xx-binsem/include

HS              :=  $(wildcard ./include/*.h)\
                    $(wildcard ./lpc23xx-binsem/include/*.h)\
                    $(wildcard ./lpc23xx-info/include/*.h)\
                    $(wildcard ./lpc23xx-i2c/include/*.h)\
                    $(wildcard ./lpc23xx-mam/include/*.h)\
                    $(wildcard ./lpc23xx-pll/include/*.h)\
                    $(wildcard ./lpc23xx-uart/include/*.h)\
                    $(wildcard ./lpc23xx-usb/include/*.h)\
                    $(wildcard ./lpc23xx-util/include/*.h)\
                    $(wildcard ./lpc23xx-vic/include/*.h)

LIBS            = $(NAME).a

TESTS           = ./lpc23xx-pll/test/lpc23xx-pll-test.hex\
	          ./lpc23xx-binsem/test/lpc23xx-binsem-test.hex\
	          ./lpc23xx-uart/test/lpc23xx-uart-test.hex

ASRCS           := $(wildcard lpc23xx-pll/*.s)\
   		   $(wildcard lpc23xx-util/*.s)\
   		   $(wildcard lpc23xx-uart/*.s)\
   		   $(wildcard lpc23xx-binsem/*.s)

CSRCS           := $(wildcard lpc23xx-info/*.c)\
   		   $(wildcard lpc23xx-i2c/*.c)\
   		   $(wildcard lpc23xx-mam/*.c)\
   		   $(wildcard lpc23xx-binsem/*.c)\
		   $(wildcard lpc23xx-pll/*.c)\
		   $(wildcard lpc23xx-uart/*.c)\
		   $(wildcard lpc23xx-usb/*.c)\
   		   $(wildcard lpc23xx-util/*.c)\
   		   $(wildcard lpc23xx-vic/*.c)

COBJS           = $(CSRCS:.c=.o)

AOBJS           = $(ASRCS:.s=.o)
                  
CFLAGS          = $(INCLUDE) $(DEBUG) -g -c -Wall -Werror -mfloat-abi=softfp -fno-common -O2 -mcpu=arm7tdmi-s

ARCHIVEFLAGS    = rvs

ASFLAGS         = -g -ahls -mfloat-abi=softfp $(INCLUDE) 
 
.PHONY: clean allclean rebuild

.SUFFIXES : .c .cpp .s

.c.o :
	@echo "======== COMPILING $@ ========================"
	$(CC) $(CFLAGS) -o $(<:.c=.o) -c $<

.s.o :
	@echo "======== COMPILING $@ ========================"
	$(AS) $(ASFLAGS) -o $@ $< > $*.lst
        
all: $(LIBS) $(TESTS) Makefile

$(COBJS): $(HS)

$(LIBS): $(AOBJS) $(COBJS)
	@echo "========= Making Library $@ ========================"
	$(AR) $(ARCHIVEFLAGS) $@ $(AOBJS) $(COBJS)

$(TESTS): $(LIBS)
	@echo "========= Recursive make: $(@D) ========================"
	$(MAKE) -s -C $(@D) $(@F)

clean:
	$(RM)  $(LIBS) $(AOBJS) $(COBJS) $(COBJS) \
	lpc23xx*/*.lst *.map *.hex *.bin *.lst *~ ./include/*~ a.out 
	$(MAKE) -s -C lpc23xx-pll/test clean
	$(MAKE) -s -C lpc23xx-uart/test clean
	$(MAKE) -s -C lpc23xx-binsem/test clean

allclean: clean
	
rebuild: allclean
	$(MAKE)

