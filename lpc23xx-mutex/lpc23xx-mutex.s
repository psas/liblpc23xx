
/*
 * lpc23xx-mutex.s
 **
 * Tue 14 June 2011 16:46:03 (PDT)
 * initial experiment using SWP instruction and building a .o from .s
 * no provision for spinlock count, will spin forever if no lock available.
 **
 */

/*
 * in C define prototype: uint32_t get_mutex(int r0, int r1);
 * in C define prototype: uint32_t get_mutex(uint32_t &mutex, uint32_t wait_count);
 
 * eabi says r0-r3 are reserved for calling and return
 * http://en.wikipedia.org/wiki/Application_binary_interface#EABI
 *  The EABI standard dictates that the ARM Stack be
 *  "Full Descending" which means that stores need to decrement beforehand and loads must increment
 *  afterward. You can use the actual addressing types "DB" and "IA" or just "FD" on the assembly instructions.
 */

/*
 * FOR ARM:
 * sp is r13
 * lr is r14
 * pc is r15
 */

.text

.code        32

# align on 4 byte (word) boundary
.align       4

# defining constants
.equ LOCKED   , 0
.equ INITMUTEX, 1

# renaming registers
mutex_addr .req r0

#inputb .req r1
#inputc .req r2
#inputd .req r3

# r0 contains address of semaphore, need to initialize semaphore to non-zero value
# prior to using.

.global init_mutex
init_mutex:
    # prolog
    # store multiple, decrement before. '!' says to write back new value to sp
    stmdb sp!, {r4-r11}

    mov r1, mutex_addr
    ldr r0, =INITMUTEX

    str r0, [r1]

    # epilog
    # load multiple, increment after. '!' says to write back new value to sp
    ldmia sp!, {r4-r11}

    # return value goes into r0, here it's zero
    # return value into r0
    mov r0, #0
    # lr contains address of next instruction after function
    mov pc, lr


# c call
.global get_mutex
get_mutex:
    # prolog
    # store multiple, decrement before. '!' says to write back new value to sp
    stmdb sp!, {r4-r11}

    mov r1, mutex_addr

    # address of LOCKED immediate value
    ldr r0, =LOCKED

spin_lock:
    # r1 is an indirect address (note '[' and ']' 
    swp r0, r0, [r1]
    # use immediate value of LOCKED constant
    cmp r0, #LOCKED
    beq spin_lock

    # epilog
    # load multiple, increment after. '!' says to write back new value to sp
    ldmia sp!, {r4-r11}

    # return value goes into r0, here it's zero
    # return value into r0
    mov r0, #0
    # lr contains address of next instruction after function
    mov pc, lr
.end


