
NAME            := lpc23xx-uart-test
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
                   -I$(LIBDIR)/lpc23xx-pll/include

TYPE            ?= lpc23xx

TARGET          ?=

DEBUG           ?=
#DEBUG           = -DDEBUG
                  
CFLAGS          = $(INCLUDE) $(DEBUG) $(TARGET) -c -Wall -fno-common -O0 -g -mcpu=arm7tdmi-s

AFLAGS          = -g  -ahls -mapcs-32

ASFLAGS         = -S -c -g $(INCLUDE)

LDFLAGS          = -T $(TYPE).ld -nostartfiles -Map $(NAME).map

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
	$(AS) $(AFLAGS) -o $@ $< > $*.lst
        
all:  $(PROGS) $(EXLIBS) $(NAME).hex Makefile

$(COBJS): include/*.h

$(EXLIBS):
	@echo "========= Recursive make: $(@D)    ========================"
	$(MAKE) TARGET=$(TARGET) -s -C $(@D) $(@F)

$(PROGS): $(AOBJS) $(COBJS) $(EXLIBS)
	@echo "========= LINKING $@ ========================"
	$(LD) $(LDFLAGS) -o $@ $(AOBJS) $(COBJS) $(EXLIBS)

$(NAME).s: $(NAME).c
	@echo "========= Combined Assembler and Source for $@ =================="
	$(CC) $(ASFLAGS) -o $@ $(NAME).c

$(NAME).hex: $(NAME).out
	@echo "========= hex file for $@ =================="
	$(CP) $(HEXFLAGS) $(NAME).out $(NAME).hex
		
$(NAME).bin: $(NAME).out
	@echo "========= bin file for $@ =================="
	$(CP) $(CPFLAGS) $(NAME).out $(NAME).bin
	$(OD) $(ODFLAGS) $(NAME).out > $(NAME).dmp

clean:
	$(RM) $(EXLIBS) $(PROGS) $(AOBJS) $(COBJS) \
	*.map *.hex *.bin *.lst *~ ./include/*~ a.out 

allclean: clean
	$(MAKE)  -s -C $(LIBDIR) allclean

rebuild: allclean
	$(MAKE)

