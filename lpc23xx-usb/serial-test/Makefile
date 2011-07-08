LIBNAME	= ../../liblpc23xx
APPNAME = serial-test

#Select target
#TARGET=LPC214x
TARGET=LPC23xx


# Tool definitions
CC      = arm-elf-gcc
LD      = arm-elf-ld -v
AR      = arm-elf-ar
AS      = arm-elf-as
CP      = arm-elf-objcopy
OD		= arm-elf-objdump
RM		= rm

# Tool flags
CFLAGS  = -I./include -I../include -c -W -Wall -Os -g -DDEBUG -D$(TARGET) -mcpu=arm7tdmi
ASFLAGS = -ahls -mapcs-32 -Wa,--defsym,$(TARGET)=1 
LFLAGS  =  -nostartfiles --warn-common
CPFLAGS = -O ihex
ODFLAGS	= -x --syms

LINKFILE	= lpc23xx.ld

CSRCS	= halsys.c printf.c console.c
#OBJS 	= crt.o $(CSRCS:.c=.o)
OBJS 	= boot.o $(CSRCS:.c=.o)

EXAMPLES = serial-test

all: depend $(EXAMPLES)

serial-test: $(OBJS) serial-test.o serial_fifo.o armVIC.o $(LIBNAME).a


$(EXAMPLES):
	@ echo "Building $@ example..."
	$(CC) -T $(LINKFILE) $(LFLAGS) $^ -o $@.elf -Wl,-Map,$@.map
	$(CP) $(CPFLAGS) $@.elf $@.hex
	$(OD) $(ODFLAGS) $@.elf > $@.dmp
	$(OD) -d $@.elf >$@.asm

boot.o: boot.s
	@ echo ".assembling"
	$(CC) -c $(ASFLAGS) -Wa,-ahlms=boot.lst boot.s -o boot.o


crt.o: crt.s
	@ echo ".assembling"
	$(CC) -c $(ASFLAGS) -Wa,-ahlms=crt.lst crt.s -o crt.o

clean:
	rm -f *.hex *.elf *.o *.lst *.dmp *.map .depend *.asm

# recompile if the Makefile changes
$(OBJS): Makefile

# dependency checking
depend: $(CSRCS)
	$(CC) $(CFLAGS) -MM $^ > .depend || rm -f .depend

# phony targets
.PHONY: clean

-include .depend

