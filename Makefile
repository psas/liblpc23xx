
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
                   -I./lpc23xx-util/include\
                   -I./lpc23xx-vic/include\
                   -I./lpc23xx-binsem/include\
                   -I./lpcusb

HS              :=  $(wildcard ./include/*.h)\
                    $(wildcard ./lpc23xx-*/include/*.h)

LIBS            = $(NAME).a

USBLIB          = ./lpcusb/usbstack.a

USBTESTS        = ./lpcusb/examples/serial.hex

TESTS           = ./lpc23xx-pll/test/lpc23xx-pll-test.hex\
	          ./lpc23xx-binsem/test/lpc23xx-binsem-test.hex\
	          ./lpc23xx-uart/test/lpc23xx-uart-test.hex

ASRCS           := $(wildcard lpc23xx-*/*.s)

CSRCS           := $(wildcard lpc23xx-*/*.c)

COBJS           = $(CSRCS:.c=.o)

AOBJS           = $(ASRCS:.s=.o)
                  
CFLAGS          = $(INCLUDE) $(DEBUG) -ggdb -c -Wall -Werror -mfloat-abi=softfp -fno-common -O2 -mcpu=arm7tdmi-s

ARCHIVEFLAGS    = rvs

ASFLAGS         = -ggdb -ahls -mfloat-abi=softfp $(INCLUDE) 
 
.PHONY: clean allclean rebuild

.SUFFIXES : .c .cpp .s

.c.o :
	@echo "======== COMPILING $@ ========================"
	$(CC) $(CFLAGS) -o $(<:.c=.o) -c $<

.s.o :
	@echo "======== COMPILING $@ ========================"
	$(AS) $(ASFLAGS) -o $@ $< > $*.lst
        
all: $(LIBS) Makefile

tests: $(TESTS) $(USBTESTS)

$(COBJS): $(HS)

$(USBLIB):
	@echo "========= Recursive make: $(@D)    ========================"
	$(MAKE) -s -C $(@D) $(@F)

$(LIBS): $(AOBJS) $(COBJS) $(USBLIB)
	@echo "========= Making Library $@ ========================"
	$(AR) $(ARCHIVEFLAGS) $@ $(AOBJS) $(COBJS)

$(USBTESTS): $(USBLIBS)
	@echo "========= Recursive make: $(@D) ========================"
	$(MAKE) -s -C $(@D)


$(TESTS): $(LIBS)
	@echo "========= Recursive make: $(@D) ========================"
	$(MAKE) -s -C $(@D) $(@F)

clean:
	$(RM)  $(LIBS) $(AOBJS) $(COBJS) $(COBJS) $(USBLIB)\
	lpc23xx*/*.lst *.map *.hex *.bin *.lst *~ ./include/*~ a.out 
	$(MAKE) -s -C lpc23xx-pll/test clean
	$(MAKE) -s -C lpc23xx-uart/test clean
	$(MAKE) -s -C lpc23xx-binsem/test clean
	$(MAKE) -s -C lpcusb clean
	$(MAKE) -s -C lpcusb/examples clean

allclean: clean
	
rebuild: allclean
	$(MAKE)

