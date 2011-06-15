
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

TYPE            ?= lpc23xx

DEBUG           ?=
#DEBUG          = -DDEBUG

#CFLAGS          = $(INCLUDE) $(DEBUG) -g -c -Wall -flto -fno-common -O0 -mcpu=arm7tdmi-s
CFLAGS          = $(INCLUDE) $(DEBUG) -g -c -Wall       -fno-common -O2 -mcpu=arm7tdmi-s

ASFLAGS         = -g -ahls -mfloat-abi=softfp $(INCLUDE)

LDFLAGS         = -T $(TYPE).ld -nostartfiles -Map $(NAME).map

CPFLAGS         := -O binary
HEXFLAGS        := -O ihex
ODFLAGS         := -x --syms

ASRCS           := boot.s

CSRCS           := $(NAME).c hwsys.c

COBJS           = $(CSRCS:.c=.o)

AOBJS           = $(ASRCS:.s=.o)

EXLIBS          = $(LIBDIR)/liblpc23xx.a

PROGS           = $(NAME).out

.PHONY: clean

.SUFFIXES : .c .cpp .s

.c.o :
	@echo "======== COMPILING $@ ========================"
	$(CC) $(CFLAGS) -c $<

.s.o :
	@echo "======== COMPILING $@ ========================"
	$(AS) $(ASFLAGS) -o $@ $< > $*.lst
        
all:  $(PROGS) $(EXLIBS) $(NAME).hex $(NAME).sdump Makefile

$(COBJS): include/*.h

$(EXLIBS):
	@echo "========= Recursive make: $(@D)    ========================"
	$(MAKE) TARGET=$(TARGET) -s -C $(@D) $(@F)

$(PROGS): $(AOBJS) $(COBJS) $(EXLIBS)
	@echo "========= LINKING $@ ========================"
	$(LD) $(LDFLAGS) -o $@ $(AOBJS) $(COBJS) $(EXLIBS)

$(NAME).sdump: $(NAME).c
	@echo "========= Combined Assembler and Source for $< =================="
	$(CC) -c -g $(INCLUDE) -Wa,-ahl=$@ $<

$(NAME).hex: $(NAME).out
	@echo "========= hex file for $< =================="
	$(CP) $(HEXFLAGS) $< $@

$(NAME).bin: $(NAME).out
	@echo "========= bin file for $< =================="
	$(CP) $(CPFLAGS) $< $@
	$(OD) $(ODFLAGS) $< > $(NAME).dmp

clean:
	$(RM) $(EXLIBS) $(PROGS) $(AOBJS) $(COBJS) $(NAME).sdump \
	*.map *.hex *.bin *.lst *~ ./include/*~ a.out 

allclean: clean
	$(MAKE)  -s -C $(LIBDIR) allclean

rebuild: allclean
	$(MAKE)

