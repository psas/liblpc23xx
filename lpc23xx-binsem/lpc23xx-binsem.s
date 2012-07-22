
/* Copyright (C) 2011 Keith Wilson.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */

.text

# generate 32 bit ARM 
.code           32

# align on 4 byte (word) boundary
.align          4

# defining constants
.equ LOCKED    , 0
.equ UNLOCKED  , 1

# renaming registers
binsem_addr .req r0
ticks       .req r1

/*
 * init_binsem
 *  r0 contains address of semaphore, need to initialize semaphore to non-zero value
 *  prior to using.
 *
 * In C define prototype: void init_binsem(uint32_t *binsem_addr);
 */
.global init_binsem
init_binsem:
    ### prolog ###
    stmdb sp!, {r4-r11}

    mov r4, binsem_addr

    ldr r5, =UNLOCKED
    swp r5, r5, [r4]

    ### epilog ###
    ldmia sp!, {r4-r11}

    mov r0, #0
    mov pc, lr

/*
 * is_binsem_locked
 * input: r0 contains binsem_addr
 *
 * return: 1 if locked 
 *         0 if not locked 
 * in C define prototype: uint32_t is_binsem_locked(uint32_t* binsem_addr);
 */
.global is_binsem_locked
is_binsem_locked:
    ### prolog ###
    # store multiple, decrement before. '!' says to write back new value to sp
    stmdb sp!, {r4-r11}

    mov r4, binsem_addr

    ldr r5, [r4]
    cmp r5, #LOCKED
    beq is_locked
    nop
    nop
    b   not_locked
    nop
    nop

is_locked:
    mov r0, #1
    b end_is_binsem_locked
    nop
    nop

not_locked:
    mov r0, #0

end_is_binsem_locked:

    ### epilog ###
    # load multiple, increment after. '!' says to write back new value to sp
    ldmia sp!, {r4-r11}

    # lr contains address of next instruction after function
    mov pc, lr


/*
 * get_binsem
 * in: binsem_addr is r0
 *      wait_count is r1
 * return: a '1' for successful lock
 *         a '0' if wait for ticks count and not successful
 * In C define prototype: uint32_t get_binsem(uint32_t* binsem_addr, uint32_t wait_count);
 */ 
.global get_binsem
get_binsem:
    ### prolog ###
    # store multiple, decrement before. '!' says to write back new value to sp
    stmdb sp!, {r4-r11}

    mov r4, binsem_addr
    mov r5, ticks
    # minimum wait is one count.
    add r5, #0x1

    ldr r6, =LOCKED

spin_lock:
    # r1 is an indirect address (note '[' and ']')
    swp r6, r6, [r4]
    # use immediate value of LOCKED constant
    cmp r6, #LOCKED
    beq waitcount
    nop
    nop
    b gotlock
    nop
    nop

waitcount:
    sub r5, #0x1
    cmp r5, #0x0
    beq timeout
    nop
    nop
    b spin_lock
    nop
    nop

gotlock:
    mov r0, #1
    b end_get_binsem
    nop
    nop

timeout:
    mov r0, #0

end_get_binsem:

    ### epilog ###
    ldmia sp!, {r4-r11}

    # lr contains address of next instruction after function
    mov pc, lr

/*
 * release_binsem
 * input: r0 is binsem_addr
 * returns a '1' for release of locked binary semaphore
 * returns a '0' for release of unlocked binary semaphore
 * in C define prototype: uint32_t release_binsem(uint32_t* binsem_addr);
 */ 
.global release_binsem
release_binsem:
    ### prolog ###
    stmdb sp!, {r4-r11}

    mov r4, binsem_addr
  
    ldr r5, =UNLOCKED
   
    swp r5, r5, [r4]
    
    cmp r5, #UNLOCKED
    beq was_not_locked
    nop
    nop
    b released_lock
    nop
    nop
 
released_lock:
    mov r0, #1
    b end_release_binsem
    nop
    nop

was_not_locked:
    mov r0, #0

end_release_binsem:
    ### epilog ###
    ldmia sp!, {r4-r11}

    mov pc, lr

.end

