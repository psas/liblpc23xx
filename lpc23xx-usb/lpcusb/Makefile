LIBNAME	= usbstack

# Select your target
#TARGET = LPC214x
TARGET = LPC23xx

# If you are using port B on the LPC2378 uncomment out the next line (Used on the Olimex 2378 Dev Board)
LPC2378_PORT = -DLPC2378_PORTB

# Package definitions
PKG_NAME	= target
DATE		= $$(date +%Y%m%d)

# Tool definitions
CC      = arm-elf-gcc
LD      = arm-elf-ld -v
AR      = arm-elf-ar
AS      = arm-elf-as
CP      = arm-elf-objcopy
OD		= arm-elf-objdump
RM		= rm
TAR		= tar

CFLAGS  = -I./ -I../ -c -W -Wall -Os -g -DDEBUG -D$(TARGET) $(LPC2378_PORT) -mcpu=arm7tdmi
ARFLAGS = -rcs

LIBSRCS = usbhw_lpc.c usbcontrol.c usbstdreq.c usbinit.c
LIBOBJS = $(LIBSRCS:.c=.o)

all: depend lib examples

clean:
	$(RM) -f $(LIBNAME).a $(LIBOBJS) .depend
	make -C examples clean

examples:
	make -C examples

# build lib
lib: $(LIBNAME).a

$(LIBNAME).a: $(LIBOBJS)
	$(AR) $(ARFLAGS) $@ $^

# Builds release tar file
dist: clean
	cd .. && $(TAR) --exclude={CVS,cvs,.svn} -cvzf $(PKG_NAME)-$(DATE).tar.gz $(PKG_NAME)

# recompile if the Makefile changes
$(LIBOBJS): Makefile

# dependency checking
depend: $(LIBSRCS)
	$(CC) $(CFLAGS) -MM $^ > .depend || rm -f .depend

# phony targets
.PHONY: all clean examples depend

-include .depend
