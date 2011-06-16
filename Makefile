
#
# Makefile for liblpc23xx.a
#

NAME            := liblpc23xx

CC              := arm-elf-gcc
LD              := arm-elf-ld
AR              := arm-elf-ar
AS              := arm-elf-as
CP              := arm-elf-objcopy
OD              := arm-elf-objdump


#CC              := arm-linux-gnueabi-gcc
#LD              := arm-linux-gnueabi-ld
#AR              := arm-linux-gnueabi-ar
#AS              := arm-linux-gnueabi-as
#CP              := arm-linux-gnueabi-objcopy
#OD              := arm-linux-gnueabi-objdump

DEBUG           ?=
#DEBUG           = -DDEBUG
 
INCLUDE         := -I.\
                   -I./include\
                   -I./lpc23xx-info/include\
                   -I./lpc23xx-pll/include\
                   -I./lpc23xx-uart/include\
                   -I./lpc23xx-binsem/include
#                   -I./lpc23xx-i2c/include

HS              :=  $(wildcard ./include/*.h)\
                    $(wildcard ./lpc23xx-info/include/*.h)\
                    $(wildcard ./lpc23xx-pll/include/*.h)\
                    $(wildcard ./lpc23xx-binsem/include/*.h)\
                    $(wildcard ./lpc23xx-uart/include/*.h)
#                    $(wildcard ./lpc23xx-i2c/include/*.h)

LIBS            = $(NAME).a

TESTS           = ./lpc23xx-pll/test/lpc23xx-pll-test.hex\
	          ./lpc23xx-binsem/test/lpc23xx-binsem-test.hex\
	          ./lpc23xx-uart/test/lpc23xx-uart-test.hex

ASRCS           := $(wildcard lpc23xx-pll/*.s)\
   		   $(wildcard lpc23xx-uart/*.s)\
   		   $(wildcard lpc23xx-binsem/*.s)
#                   $(wildcard lpc23xx-i2c/*.s)

CSRCS           := $(wildcard lpc23xx-info/*.c)\
		   $(wildcard lpc23xx-pll/*.c)\
		   $(wildcard lpc23xx-uart/*.c)\
   		   $(wildcard lpc23xx-binsem/*.c)
#		   $(wildcard lpc23xx-i2c/*.c)

COBJS           = $(CSRCS:.c=.o)

AOBJS           = $(ASRCS:.s=.o)
                  
#CFLAGS          = $(INCLUDE) $(DEBUG) -fwhopr -flto -c -Wall -fno-common -O0 -g -mcpu=arm7tdmi-s
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

