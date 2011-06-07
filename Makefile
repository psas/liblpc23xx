
#
# Makefile for liblpc23xx 
#

NAME            := liblpc23xx

CC              := arm-elf-gcc
LD              := arm-elf-ld -v
AR              := arm-elf-ar rvs
AS              := arm-elf-as
CP              := arm-elf-objcopy
OD              := arm-elf-objdump

TYPE            ?= lpc23xx

TARGET          ?= OLIMEXLPCP2378REVA
# TARGET          = -DLPC2368PSASGFE

DEBUG           ?=
#DEBUG           = -DDEBUG
 
INCLUDE         := -I.\
                   -I./include\
                   -I./lpc23xx-info/include\
                   -I./lpc23xx-pll/include\
                   -I./lpc23xx-uart/include\
                   -I./lpc23xx-i2c/include

HS              :=  $(wildcard ./include/*.h)\
                    $(wildcard ./lpc23xx-info/include/*.h)\
                    $(wildcard ./lpc23xx-pll/include/*.h)\
                    $(wildcard ./lpc23xx-uart/include/*.h)\
                    $(wildcard ./lpc23xx-i2c/include/*.h)

LIBS            = $(NAME).a

TESTS           = ./lpc23xx-pll/test/lpc23xx-pll-test.hex\
	          ./lpc23xx-uart/test/lpc23xx-uart-test.hex

ASRCS           := $(wildcard lpc23xx-pll/*.s)\
   		   $(wildcard lpc23xx-uart/*.s)\
                   $(wildcard lpc23xx-i2c/*.s)

CSRCS           := $(wildcard lpc23xx-info/*.c)\
		   $(wildcard lpc23xx-pll/*.c)\
		   $(wildcard lpc23xx-uart/*.c)\
		   $(wildcard lpc23xx-i2c/*.c)

COBJS           = $(CSRCS:.c=.o)

AOBJS           = $(ASRCS:.s=.o)
                  
CFLAGS          = $(INCLUDE) $(DEBUG) -D$(TARGET) -c -Wall -fno-common -O0 -g -mcpu=arm7tdmi-s

AFLAGS          = -g  -ahls -mapcs-32

ASFLAGS         = -S -c -g $(INCLUDE)

LDFLAGS         = -T $(TYPE).ld -nostartfiles -Map $(NAME).map

CPFLAGS         := -O binary
HEXFLAGS        := -O ihex
ODFLAGS         := -x --syms

 
.PHONY: clean allclean rebuild

.SUFFIXES : .c .cpp .s

.c.o :
	@echo "======== COMPILING $@ ========================"
	$(CC) $(CFLAGS) -o $(<:.c=.o) -c $<

.s.o :
	@echo "======== COMPILING $@ ========================"
	$(AS) $(AFLAGS) -o $@ $< > $*.lst
        
all: $(LIBS) $(TESTS) Makefile

$(COBJS): $(HS)

$(LIBS): $(AOBJS) $(COBJS)
	@echo "========= Making Library $@ ========================"
	$(AR) $@ $(AOBJS) $(COBJS)

$(TESTS): 
	@echo "========= Recursive make: $(@D) ========================"
	$(MAKE) TARGET=$(TARGET) -s -C $(@D) $(@F)

$(NAME).s: $(NAME).c
	@echo "========= Combined Assembler and Source for $@ =================="
	$(CC) $(ASFLAGS) -o $@ $(NAME).c

clean:
	$(RM)  $(LIBS) $(AOBJS) $(COBJS) $(COBJS) \
	*.map *.hex *.bin *.lst *~ ./include/*~ a.out 

allclean: clean
	$(MAKE) -s -C lpc23xx-pll/test clean
	$(MAKE) -s -C lpc23xx-uart/test clean

rebuild: allclean
	$(MAKE)





