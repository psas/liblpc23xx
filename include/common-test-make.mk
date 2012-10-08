
#
# common-test-make.mk
# Common test build flow for makefiles in test directories
#
# make syntax->  include $(LIBDIR)/include/common-test-make.mk

CROSS           ?= /opt/cross

#########
# this is the default, make LPC23XX_PART=LPC2368 will over-ride
#LPC23XX_PART    ?= LPC2378
LPC23XX_PART   ?= -DGFE_LPC2368

CC              := $(CROSS)/bin/arm-elf-gcc
LD              := $(CROSS)/bin/arm-elf-ld
AR              := $(CROSS)/bin/arm-elf-ar
AS              := $(CROSS)/bin/arm-elf-as
CP              := $(CROSS)/bin/arm-elf-objcopy
OD              := $(CROSS)/bin/arm-elf-objdump

GCC_VERSION     := $(shell $(CC) --version | grep ^$(CROSSNAME)-gcc | sed 's/^.* //g')

TYPE            := lpc23xx

#DEBUG           = -DDEBUG

#CFLAGS          = $(INCLUDE) $(DEBUG) -g -c -Wall -flto -fno-common -O0 -mcpu=arm7tdmi-s
CFLAGS          ?= $(INCLUDE) $(DEBUG) $(LPC23XX_PART) -g3 -c -Wall -Werror -fno-common -O3 -mfloat-abi=softfp -mcpu=arm7tdmi-s

ASFLAGS         ?= -g -ahls -mfloat-abi=softfp $(INCLUDE)

LDFLAGS         ?= -T $(TYPE).ld -nostartfiles -Map $(NAME).map

CPFLAGS         := -O binary
HEXFLAGS        := -O ihex
ODFLAGS         := --syms -S -l 

ASRCS           := $(ASRCS) boot.s

CSRCS           := $(CSRCS) $(NAME).c hwsys.c

COBJS           = $(CSRCS:.c=.o)

AOBJS           = $(ASRCS:.s=.o)

EXLIBS          = $(LIBDIR)/liblpc23xx.a

PROGS           = $(NAME).out

.PHONY: clean

.SUFFIXES : .c .cpp .s

.c.o :
	@echo "-------- COMPILING $@ "
	@$(CC) $(CFLAGS) $<

.s.o :
	@echo "-------- COMPILING $@ "
	@$(AS) $(ASFLAGS) -o $@ $< > $*.lst

all:  $(PROGS) $(EXLIBS) $(NAME).hex $(NAME).dump Makefile

$(COBJS): include/*.h

$(EXLIBS):
	@echo "------- Recursive make: $(@D) --------------------"
	@$(MAKE) DEBUG=$(DEBUG) LPC23XX_PART=$(LPC23XX_PART) -s -C $(@D) $(@F)

$(PROGS): $(AOBJS) $(COBJS) $(EXLIBS)
	@echo "--------- LINKING $@ "
	@$(LD) $(LDFLAGS) -o $@ $(AOBJS) $(COBJS) $(EXLIBS) -L$(CROSS)/arm-elf/lib -lc -lm  -lgcc -L$(CROSS)/lib/gcc/arm-elf/$(GCC_VERSION)

$(NAME).sdump: $(NAME).c
	@echo "--------- Combined Assembler and Source for $< "
	@$(CC) -c -g $(INCLUDE) -Wa,-ahl=$@ $<

$(NAME).hex: $(NAME).out
	@echo "----------- hex file for $< "
	@$(CP) $(HEXFLAGS) $< $@

$(NAME).dump: $(NAME).out
	@echo "--------- dump file for $< "
	@$(OD) $(ODFLAGS) $< > $@

$(NAME).bin: $(NAME).out
	@echo "--------- bin file for $< "
	@$(CP) $(CPFLAGS) $< $@
	@$(OD) $(ODFLAGS) $< > $(NAME).dmp

clean:
	$(RM) $(EXLIBS) $(PROGS) $(AOBJS) $(COBJS) $(NAME).*dump \
	*.map *.hex *.bin *.lst *~ ./include/*~ a.out 

allclean: clean
	$(MAKE) -s -C $(LIBDIR) allclean

rebuild: allclean
	$(MAKE)

