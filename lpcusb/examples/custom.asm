
custom.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_startup>:
       0:	e59ff018 	ldr	pc, [pc, #24]	; 20 <Reset_Addr>
       4:	e59ff018 	ldr	pc, [pc, #24]	; 24 <Undef_Addr>
       8:	e59ff018 	ldr	pc, [pc, #24]	; 28 <SWI_Addr>
       c:	e59ff018 	ldr	pc, [pc, #24]	; 2c <PAbt_Addr>
      10:	e59ff018 	ldr	pc, [pc, #24]	; 30 <DAbt_Addr>
      14:	e1a00000 	nop			; (mov r0, r0)
      18:	e51ff120 	ldr	pc, [pc, #-288]	; ffffff00 <_stack_end+0xbfff8024>
      1c:	e59ff014 	ldr	pc, [pc, #20]	; 38 <FIQ_Addr>

00000020 <Reset_Addr>:
      20:	00000040 	.word	0x00000040

00000024 <Undef_Addr>:
      24:	00000100 	.word	0x00000100

00000028 <SWI_Addr>:
      28:	000000fc 	.word	0x000000fc

0000002c <PAbt_Addr>:
      2c:	00000100 	.word	0x00000100

00000030 <DAbt_Addr>:
      30:	00000100 	.word	0x00000100

00000034 <IRQ_Addr>:
      34:	000000f4 	.word	0x000000f4

00000038 <FIQ_Addr>:
      38:	000000f8 	.word	0x000000f8
      3c:	00000000 	.word	0x00000000

00000040 <Reset_Handler>:
      40:	e59f0078 	ldr	r0, [pc, #120]	; c0 <I_BIT+0x40>
      44:	e321f0db 	msr	CPSR_c, #219	; 0xdb
      48:	e1a0d000 	mov	sp, r0
      4c:	e2400040 	sub	r0, r0, #64	; 0x40
      50:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
      54:	e1a0d000 	mov	sp, r0
      58:	e2400040 	sub	r0, r0, #64	; 0x40
      5c:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
      60:	e1a0d000 	mov	sp, r0
      64:	e2400040 	sub	r0, r0, #64	; 0x40
      68:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
      6c:	e1a0d000 	mov	sp, r0
      70:	e2400c01 	sub	r0, r0, #256	; 0x100
      74:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
      78:	e1a0d000 	mov	sp, r0
      7c:	e2400b01 	sub	r0, r0, #1024	; 0x400
      80:	e321f0df 	msr	CPSR_c, #223	; 0xdf
      84:	e1a0d000 	mov	sp, r0
      88:	e59f1034 	ldr	r1, [pc, #52]	; c4 <I_BIT+0x44>
      8c:	e59f2034 	ldr	r2, [pc, #52]	; c8 <I_BIT+0x48>
      90:	e59f3034 	ldr	r3, [pc, #52]	; cc <I_BIT+0x4c>
      94:	e1520003 	cmp	r2, r3
      98:	34910004 	ldrcc	r0, [r1], #4
      9c:	34820004 	strcc	r0, [r2], #4
      a0:	3afffffb 	bcc	94 <I_BIT+0x14>
      a4:	e3a00000 	mov	r0, #0
      a8:	e59f1020 	ldr	r1, [pc, #32]	; d0 <I_BIT+0x50>
      ac:	e59f2020 	ldr	r2, [pc, #32]	; d4 <I_BIT+0x54>
      b0:	e1510002 	cmp	r1, r2
      b4:	34810004 	strcc	r0, [r1], #4
      b8:	3afffffc 	bcc	b0 <I_BIT+0x30>
      bc:	ea00020e 	b	8fc <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	00001e0e 	.word	0x00001e0e
      c8:	40000200 	.word	0x40000200
      cc:	40000200 	.word	0x40000200
      d0:	40000200 	.word	0x40000200
      d4:	400002a0 	.word	0x400002a0

000000d8 <feed>:
      d8:	e59f3010 	ldr	r3, [pc, #16]	; f0 <feed+0x18>
      dc:	e3a020aa 	mov	r2, #170	; 0xaa
      e0:	e583208c 	str	r2, [r3, #140]	; 0x8c
      e4:	e3a02055 	mov	r2, #85	; 0x55
      e8:	e583208c 	str	r2, [r3, #140]	; 0x8c
      ec:	e12fff1e 	bx	lr
      f0:	e01fc000 	.word	0xe01fc000

000000f4 <IRQ_Routine>:
      f4:	eafffffe 	b	f4 <IRQ_Routine>

000000f8 <FIQ_Routine>:
      f8:	eafffffe 	b	f8 <FIQ_Routine>

000000fc <SWI_Routine>:
      fc:	eafffffe 	b	fc <SWI_Routine>

00000100 <UNDEF_Routine>:
     100:	eafffffe 	b	100 <UNDEF_Routine>

00000104 <HalSysInit>:
     104:	e59f30bc 	ldr	r3, [pc, #188]	; 1c8 <HalSysInit+0xc4>
     108:	e59321a0 	ldr	r2, [r3, #416]	; 0x1a0
     10c:	e3822001 	orr	r2, r2, #1
     110:	e92d4030 	push	{r4, r5, lr}
     114:	e58321a0 	str	r2, [r3, #416]	; 0x1a0
     118:	e59f20ac 	ldr	r2, [pc, #172]	; 1cc <HalSysInit+0xc8>
     11c:	e3a01000 	mov	r1, #0
     120:	e5821028 	str	r1, [r2, #40]	; 0x28
     124:	e59f20a4 	ldr	r2, [pc, #164]	; 1d0 <HalSysInit+0xcc>
     128:	e5121fbf 	ldr	r1, [r2, #-4031]	; 0xfbf
     12c:	e38110ff 	orr	r1, r1, #255	; 0xff
     130:	e5021fbf 	str	r1, [r2, #-4031]	; 0xfbf
     134:	e5121fa3 	ldr	r1, [r2, #-4003]	; 0xfa3
     138:	e38110ff 	orr	r1, r1, #255	; 0xff
     13c:	e5021fa3 	str	r1, [r2, #-4003]	; 0xfa3
     140:	e3a02005 	mov	r2, #5
     144:	e5832104 	str	r2, [r3, #260]	; 0x104
     148:	e59321a0 	ldr	r2, [r3, #416]	; 0x1a0
     14c:	e3822020 	orr	r2, r2, #32
     150:	e58321a0 	str	r2, [r3, #416]	; 0x1a0
     154:	e59321a0 	ldr	r2, [r3, #416]	; 0x1a0
     158:	e3120040 	tst	r2, #64	; 0x40
     15c:	e59f4064 	ldr	r4, [pc, #100]	; 1c8 <HalSysInit+0xc4>
     160:	0afffffb 	beq	154 <HalSysInit+0x50>
     164:	e3a05001 	mov	r5, #1
     168:	e3a0300b 	mov	r3, #11
     16c:	e584510c 	str	r5, [r4, #268]	; 0x10c
     170:	e5843084 	str	r3, [r4, #132]	; 0x84
     174:	ebffffd7 	bl	d8 <feed>
     178:	e5845080 	str	r5, [r4, #128]	; 0x80
     17c:	ebffffd5 	bl	d8 <feed>
     180:	e5943088 	ldr	r3, [r4, #136]	; 0x88
     184:	e3130301 	tst	r3, #67108864	; 0x4000000
     188:	e59f5038 	ldr	r5, [pc, #56]	; 1c8 <HalSysInit+0xc4>
     18c:	0afffffb 	beq	180 <HalSysInit+0x7c>
     190:	e3a03003 	mov	r3, #3
     194:	e5853080 	str	r3, [r5, #128]	; 0x80
     198:	ebffffce 	bl	d8 <feed>
     19c:	e5952088 	ldr	r2, [r5, #136]	; 0x88
     1a0:	e3120402 	tst	r2, #33554432	; 0x2000000
     1a4:	e59f301c 	ldr	r3, [pc, #28]	; 1c8 <HalSysInit+0xc4>
     1a8:	0afffffb 	beq	19c <HalSysInit+0x98>
     1ac:	e3a02003 	mov	r2, #3
     1b0:	e5832004 	str	r2, [r3, #4]
     1b4:	e3a02002 	mov	r2, #2
     1b8:	e5832000 	str	r2, [r3]
     1bc:	e282203e 	add	r2, r2, #62	; 0x3e
     1c0:	e58321a8 	str	r2, [r3, #424]	; 0x1a8
     1c4:	e8bd8030 	pop	{r4, r5, pc}
     1c8:	e01fc000 	.word	0xe01fc000
     1cc:	e002c000 	.word	0xe002c000
     1d0:	3fffcfff 	.word	0x3fffcfff

000001d4 <HalSysPinSelect>:
     1d4:	e20000ff 	and	r0, r0, #255	; 0xff
     1d8:	e350000f 	cmp	r0, #15
     1dc:	e20110ff 	and	r1, r1, #255	; 0xff
     1e0:	8a000007 	bhi	204 <HalSysPinSelect+0x30>
     1e4:	e59f3040 	ldr	r3, [pc, #64]	; 22c <HalSysPinSelect+0x58>
     1e8:	e5932000 	ldr	r2, [r3]
     1ec:	e1a00080 	lsl	r0, r0, #1
     1f0:	e3a0c003 	mov	ip, #3
     1f4:	e1c2201c 	bic	r2, r2, ip, lsl r0
     1f8:	e1820011 	orr	r0, r2, r1, lsl r0
     1fc:	e5830000 	str	r0, [r3]
     200:	e12fff1e 	bx	lr
     204:	e59f3020 	ldr	r3, [pc, #32]	; 22c <HalSysPinSelect+0x58>
     208:	e2400010 	sub	r0, r0, #16
     20c:	e5932004 	ldr	r2, [r3, #4]
     210:	e20000ff 	and	r0, r0, #255	; 0xff
     214:	e1a00080 	lsl	r0, r0, #1
     218:	e3a0c003 	mov	ip, #3
     21c:	e1c2201c 	bic	r2, r2, ip, lsl r0
     220:	e1820011 	orr	r0, r2, r1, lsl r0
     224:	e5830004 	str	r0, [r3, #4]
     228:	e12fff1e 	bx	lr
     22c:	e002c000 	.word	0xe002c000

00000230 <HalSysGetCCLK>:
     230:	e59f0000 	ldr	r0, [pc, #0]	; 238 <HalSysGetCCLK+0x8>
     234:	e12fff1e 	bx	lr
     238:	03938700 	.word	0x03938700

0000023c <HalSysGetPCLK>:
     23c:	e59f0000 	ldr	r0, [pc, #0]	; 244 <HalSysGetPCLK+0x8>
     240:	e12fff1e 	bx	lr
     244:	03938700 	.word	0x03938700

00000248 <HalPinSelect>:
     248:	e20000ff 	and	r0, r0, #255	; 0xff
     24c:	e350000f 	cmp	r0, #15
     250:	e20110ff 	and	r1, r1, #255	; 0xff
     254:	8a000007 	bhi	278 <HalPinSelect+0x30>
     258:	e59f3040 	ldr	r3, [pc, #64]	; 2a0 <HalPinSelect+0x58>
     25c:	e5932000 	ldr	r2, [r3]
     260:	e1a00080 	lsl	r0, r0, #1
     264:	e3a0c003 	mov	ip, #3
     268:	e1c2201c 	bic	r2, r2, ip, lsl r0
     26c:	e1820011 	orr	r0, r2, r1, lsl r0
     270:	e5830000 	str	r0, [r3]
     274:	e12fff1e 	bx	lr
     278:	e59f3020 	ldr	r3, [pc, #32]	; 2a0 <HalPinSelect+0x58>
     27c:	e2400010 	sub	r0, r0, #16
     280:	e5932004 	ldr	r2, [r3, #4]
     284:	e20000ff 	and	r0, r0, #255	; 0xff
     288:	e1a00080 	lsl	r0, r0, #1
     28c:	e3a0c003 	mov	ip, #3
     290:	e1c2201c 	bic	r2, r2, ip, lsl r0
     294:	e1820011 	orr	r0, r2, r1, lsl r0
     298:	e5830004 	str	r0, [r3, #4]
     29c:	e12fff1e 	bx	lr
     2a0:	e002c000 	.word	0xe002c000

000002a4 <printchar>:
     2a4:	e3500000 	cmp	r0, #0
     2a8:	0a000005 	beq	2c4 <printchar+0x20>
     2ac:	e5903000 	ldr	r3, [r0]
     2b0:	e5c31000 	strb	r1, [r3]
     2b4:	e5903000 	ldr	r3, [r0]
     2b8:	e2833001 	add	r3, r3, #1
     2bc:	e5803000 	str	r3, [r0]
     2c0:	e12fff1e 	bx	lr
     2c4:	e1a00001 	mov	r0, r1
     2c8:	ea000115 	b	724 <putchar>

000002cc <prints>:
     2cc:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
     2d0:	e2526000 	subs	r6, r2, #0
     2d4:	e1a04000 	mov	r4, r0
     2d8:	e1a05001 	mov	r5, r1
     2dc:	c3a02000 	movgt	r2, #0
     2e0:	ca000001 	bgt	2ec <prints+0x20>
     2e4:	ea00000a 	b	314 <prints+0x48>
     2e8:	e2822001 	add	r2, r2, #1
     2ec:	e7d51002 	ldrb	r1, [r5, r2]
     2f0:	e3510000 	cmp	r1, #0
     2f4:	1afffffb 	bne	2e8 <prints+0x1c>
     2f8:	e1520006 	cmp	r2, r6
     2fc:	b0626006 	rsblt	r6, r2, r6
     300:	a1a06001 	movge	r6, r1
     304:	e3130002 	tst	r3, #2
     308:	03a08020 	moveq	r8, #32
     30c:	13a08030 	movne	r8, #48	; 0x30
     310:	ea000000 	b	318 <prints+0x4c>
     314:	e3a08020 	mov	r8, #32
     318:	e2137001 	ands	r7, r3, #1
     31c:	13a07000 	movne	r7, #0
     320:	1a00000b 	bne	354 <prints+0x88>
     324:	ea000004 	b	33c <prints+0x70>
     328:	e1a00004 	mov	r0, r4
     32c:	e1a01008 	mov	r1, r8
     330:	ebffffdb 	bl	2a4 <printchar>
     334:	e2877001 	add	r7, r7, #1
     338:	e2466001 	sub	r6, r6, #1
     33c:	e3560000 	cmp	r6, #0
     340:	cafffff8 	bgt	328 <prints+0x5c>
     344:	ea000002 	b	354 <prints+0x88>
     348:	e1a00004 	mov	r0, r4
     34c:	ebffffd4 	bl	2a4 <printchar>
     350:	e2877001 	add	r7, r7, #1
     354:	e4d51001 	ldrb	r1, [r5], #1
     358:	e3510000 	cmp	r1, #0
     35c:	1afffff9 	bne	348 <prints+0x7c>
     360:	ea000004 	b	378 <prints+0xac>
     364:	e1a00004 	mov	r0, r4
     368:	e1a01008 	mov	r1, r8
     36c:	ebffffcc 	bl	2a4 <printchar>
     370:	e2877001 	add	r7, r7, #1
     374:	e2466001 	sub	r6, r6, #1
     378:	e3560000 	cmp	r6, #0
     37c:	cafffff8 	bgt	364 <prints+0x98>
     380:	e1a00007 	mov	r0, r7
     384:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00000388 <printi>:
     388:	e92d4fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
     38c:	e2518000 	subs	r8, r1, #0
     390:	e1a05000 	mov	r5, r0
     394:	e1a07002 	mov	r7, r2
     398:	e59da034 	ldr	sl, [sp, #52]	; 0x34
     39c:	e59d6038 	ldr	r6, [sp, #56]	; 0x38
     3a0:	1a000007 	bne	3c4 <printi+0x3c>
     3a4:	e3a03030 	mov	r3, #48	; 0x30
     3a8:	e5cd3004 	strb	r3, [sp, #4]
     3ac:	e5cd1005 	strb	r1, [sp, #5]
     3b0:	e1a0200a 	mov	r2, sl
     3b4:	e28d1004 	add	r1, sp, #4
     3b8:	e1a03006 	mov	r3, r6
     3bc:	ebffffc2 	bl	2cc <prints>
     3c0:	ea000035 	b	49c <SVC_STACK_SIZE+0x9c>
     3c4:	e2534000 	subs	r4, r3, #0
     3c8:	13a04001 	movne	r4, #1
     3cc:	e352000a 	cmp	r2, #10
     3d0:	13a04000 	movne	r4, #0
     3d4:	e3540000 	cmp	r4, #0
     3d8:	0a000003 	beq	3ec <printi+0x64>
     3dc:	e3580000 	cmp	r8, #0
     3e0:	b2688000 	rsblt	r8, r8, #0
     3e4:	b3a04001 	movlt	r4, #1
     3e8:	a3a04000 	movge	r4, #0
     3ec:	e3a03000 	mov	r3, #0
     3f0:	e5cd300f 	strb	r3, [sp, #15]
     3f4:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
     3f8:	e243303a 	sub	r3, r3, #58	; 0x3a
     3fc:	e28d900f 	add	r9, sp, #15
     400:	e58d3000 	str	r3, [sp]
     404:	ea00000b 	b	438 <SVC_STACK_SIZE+0x38>
     408:	e1a00008 	mov	r0, r8
     40c:	e1a01007 	mov	r1, r7
     410:	eb000574 	bl	19e8 <__umodsi3>
     414:	e3500009 	cmp	r0, #9
     418:	c59d3000 	ldrgt	r3, [sp]
     41c:	c0800003 	addgt	r0, r0, r3
     420:	e2800030 	add	r0, r0, #48	; 0x30
     424:	e5690001 	strb	r0, [r9, #-1]!
     428:	e1a01007 	mov	r1, r7
     42c:	e1a00008 	mov	r0, r8
     430:	eb000526 	bl	18d0 <__aeabi_uidiv>
     434:	e1a08000 	mov	r8, r0
     438:	e3580000 	cmp	r8, #0
     43c:	e1a0b009 	mov	fp, r9
     440:	1afffff0 	bne	408 <SVC_STACK_SIZE+0x8>
     444:	e3540000 	cmp	r4, #0
     448:	0a00000d 	beq	484 <SVC_STACK_SIZE+0x84>
     44c:	e35a0000 	cmp	sl, #0
     450:	0a000007 	beq	474 <SVC_STACK_SIZE+0x74>
     454:	e3160002 	tst	r6, #2
     458:	0a000005 	beq	474 <SVC_STACK_SIZE+0x74>
     45c:	e1a00005 	mov	r0, r5
     460:	e3a0102d 	mov	r1, #45	; 0x2d
     464:	ebffff8e 	bl	2a4 <printchar>
     468:	e24aa001 	sub	sl, sl, #1
     46c:	e3a04001 	mov	r4, #1
     470:	ea000003 	b	484 <SVC_STACK_SIZE+0x84>
     474:	e3a0302d 	mov	r3, #45	; 0x2d
     478:	e5493001 	strb	r3, [r9, #-1]
     47c:	e249b001 	sub	fp, r9, #1
     480:	e3a04000 	mov	r4, #0
     484:	e1a00005 	mov	r0, r5
     488:	e1a0100b 	mov	r1, fp
     48c:	e1a0200a 	mov	r2, sl
     490:	e1a03006 	mov	r3, r6
     494:	ebffff8c 	bl	2cc <prints>
     498:	e0800004 	add	r0, r0, r4
     49c:	e28dd010 	add	sp, sp, #16
     4a0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000004a4 <print>:
     4a4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     4a8:	e3a04000 	mov	r4, #0
     4ac:	e24dd014 	sub	sp, sp, #20
     4b0:	e1a06000 	mov	r6, r0
     4b4:	e1a05001 	mov	r5, r1
     4b8:	e58d200c 	str	r2, [sp, #12]
     4bc:	e1a08004 	mov	r8, r4
     4c0:	e3a0a00a 	mov	sl, #10
     4c4:	e28db010 	add	fp, sp, #16
     4c8:	e3a07061 	mov	r7, #97	; 0x61
     4cc:	ea000062 	b	65c <print+0x1b8>
     4d0:	e3530025 	cmp	r3, #37	; 0x25
     4d4:	1a00005b 	bne	648 <print+0x1a4>
     4d8:	e5f53001 	ldrb	r3, [r5, #1]!
     4dc:	e3530000 	cmp	r3, #0
     4e0:	0a000060 	beq	668 <print+0x1c4>
     4e4:	e3530025 	cmp	r3, #37	; 0x25
     4e8:	0a000056 	beq	648 <print+0x1a4>
     4ec:	e353002d 	cmp	r3, #45	; 0x2d
     4f0:	02855001 	addeq	r5, r5, #1
     4f4:	03a03001 	moveq	r3, #1
     4f8:	13a03000 	movne	r3, #0
     4fc:	ea000000 	b	504 <print+0x60>
     500:	e3833002 	orr	r3, r3, #2
     504:	e1a09005 	mov	r9, r5
     508:	e4d52001 	ldrb	r2, [r5], #1
     50c:	e3520030 	cmp	r2, #48	; 0x30
     510:	0afffffa 	beq	500 <print+0x5c>
     514:	e3a02000 	mov	r2, #0
     518:	ea000000 	b	520 <print+0x7c>
     51c:	e022c29a 	mla	r2, sl, r2, ip
     520:	e5d91000 	ldrb	r1, [r9]
     524:	e241c030 	sub	ip, r1, #48	; 0x30
     528:	e20c00ff 	and	r0, ip, #255	; 0xff
     52c:	e3500009 	cmp	r0, #9
     530:	e1a05009 	mov	r5, r9
     534:	e2899001 	add	r9, r9, #1
     538:	9afffff7 	bls	51c <print+0x78>
     53c:	e3510073 	cmp	r1, #115	; 0x73
     540:	1a000008 	bne	568 <print+0xc4>
     544:	e59d100c 	ldr	r1, [sp, #12]
     548:	e2810004 	add	r0, r1, #4
     54c:	e5911000 	ldr	r1, [r1]
     550:	e59fc12c 	ldr	ip, [pc, #300]	; 684 <print+0x1e0>
     554:	e3510000 	cmp	r1, #0
     558:	e58d000c 	str	r0, [sp, #12]
     55c:	01a0100c 	moveq	r1, ip
     560:	e1a00006 	mov	r0, r6
     564:	ea000035 	b	640 <print+0x19c>
     568:	e3510064 	cmp	r1, #100	; 0x64
     56c:	1a00000a 	bne	59c <print+0xf8>
     570:	e59d100c 	ldr	r1, [sp, #12]
     574:	e88d008c 	stm	sp, {r2, r3, r7}
     578:	e2810004 	add	r0, r1, #4
     57c:	e5911000 	ldr	r1, [r1]
     580:	e58d000c 	str	r0, [sp, #12]
     584:	e3a0200a 	mov	r2, #10
     588:	e1a00006 	mov	r0, r6
     58c:	e3a03001 	mov	r3, #1
     590:	ebffff7c 	bl	388 <printi>
     594:	e0844000 	add	r4, r4, r0
     598:	ea00002e 	b	658 <print+0x1b4>
     59c:	e3510078 	cmp	r1, #120	; 0x78
     5a0:	1a000004 	bne	5b8 <print+0x114>
     5a4:	e59d100c 	ldr	r1, [sp, #12]
     5a8:	e2810004 	add	r0, r1, #4
     5ac:	e58d000c 	str	r0, [sp, #12]
     5b0:	e88d008c 	stm	sp, {r2, r3, r7}
     5b4:	ea000008 	b	5dc <print+0x138>
     5b8:	e3510058 	cmp	r1, #88	; 0x58
     5bc:	1a00000a 	bne	5ec <print+0x148>
     5c0:	e59d100c 	ldr	r1, [sp, #12]
     5c4:	e58d3004 	str	r3, [sp, #4]
     5c8:	e2810004 	add	r0, r1, #4
     5cc:	e3a03041 	mov	r3, #65	; 0x41
     5d0:	e58d000c 	str	r0, [sp, #12]
     5d4:	e58d2000 	str	r2, [sp]
     5d8:	e58d3008 	str	r3, [sp, #8]
     5dc:	e1a00006 	mov	r0, r6
     5e0:	e5911000 	ldr	r1, [r1]
     5e4:	e3a02010 	mov	r2, #16
     5e8:	ea000008 	b	610 <print+0x16c>
     5ec:	e3510075 	cmp	r1, #117	; 0x75
     5f0:	1a000008 	bne	618 <print+0x174>
     5f4:	e59d100c 	ldr	r1, [sp, #12]
     5f8:	e88d008c 	stm	sp, {r2, r3, r7}
     5fc:	e2810004 	add	r0, r1, #4
     600:	e5911000 	ldr	r1, [r1]
     604:	e58d000c 	str	r0, [sp, #12]
     608:	e3a0200a 	mov	r2, #10
     60c:	e1a00006 	mov	r0, r6
     610:	e3a03000 	mov	r3, #0
     614:	eaffffdd 	b	590 <print+0xec>
     618:	e3510063 	cmp	r1, #99	; 0x63
     61c:	1a00000d 	bne	658 <print+0x1b4>
     620:	e59d100c 	ldr	r1, [sp, #12]
     624:	e2810004 	add	r0, r1, #4
     628:	e5911000 	ldr	r1, [r1]
     62c:	e5cd8011 	strb	r8, [sp, #17]
     630:	e58d000c 	str	r0, [sp, #12]
     634:	e5cd1010 	strb	r1, [sp, #16]
     638:	e1a00006 	mov	r0, r6
     63c:	e1a0100b 	mov	r1, fp
     640:	ebffff21 	bl	2cc <prints>
     644:	eaffffd2 	b	594 <print+0xf0>
     648:	e1a00006 	mov	r0, r6
     64c:	e5d51000 	ldrb	r1, [r5]
     650:	ebffff13 	bl	2a4 <printchar>
     654:	e2844001 	add	r4, r4, #1
     658:	e2855001 	add	r5, r5, #1
     65c:	e5d53000 	ldrb	r3, [r5]
     660:	e3530000 	cmp	r3, #0
     664:	1affff99 	bne	4d0 <print+0x2c>
     668:	e3560000 	cmp	r6, #0
     66c:	15963000 	ldrne	r3, [r6]
     670:	13a02000 	movne	r2, #0
     674:	15c32000 	strbne	r2, [r3]
     678:	e1a00004 	mov	r0, r4
     67c:	e28dd014 	add	sp, sp, #20
     680:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     684:	00001ba8 	.word	0x00001ba8

00000688 <printf>:
     688:	e92d000f 	push	{r0, r1, r2, r3}
     68c:	e92d4001 	push	{r0, lr}
     690:	e59d1008 	ldr	r1, [sp, #8]
     694:	e28d200c 	add	r2, sp, #12
     698:	e3a00000 	mov	r0, #0
     69c:	e58d2000 	str	r2, [sp]
     6a0:	ebffff7f 	bl	4a4 <print>
     6a4:	e8bd4008 	pop	{r3, lr}
     6a8:	e28dd010 	add	sp, sp, #16
     6ac:	e12fff1e 	bx	lr

000006b0 <sprintf>:
     6b0:	e92d000e 	push	{r1, r2, r3}
     6b4:	e92d4003 	push	{r0, r1, lr}
     6b8:	e59d100c 	ldr	r1, [sp, #12]
     6bc:	e58d0000 	str	r0, [sp]
     6c0:	e28d2010 	add	r2, sp, #16
     6c4:	e1a0000d 	mov	r0, sp
     6c8:	e58d2004 	str	r2, [sp, #4]
     6cc:	ebffff74 	bl	4a4 <print>
     6d0:	e8bd400c 	pop	{r2, r3, lr}
     6d4:	e28dd00c 	add	sp, sp, #12
     6d8:	e12fff1e 	bx	lr

000006dc <ConsoleInit>:
     6dc:	e59f303c 	ldr	r3, [pc, #60]	; 720 <ConsoleInit+0x44>
     6e0:	e5932000 	ldr	r2, [r3]
     6e4:	e3c220f0 	bic	r2, r2, #240	; 0xf0
     6e8:	e3822050 	orr	r2, r2, #80	; 0x50
     6ec:	e5832000 	str	r2, [r3]
     6f0:	e2433802 	sub	r3, r3, #131072	; 0x20000
     6f4:	e3a02083 	mov	r2, #131	; 0x83
     6f8:	e583200c 	str	r2, [r3, #12]
     6fc:	e20020ff 	and	r2, r0, #255	; 0xff
     700:	e5832000 	str	r2, [r3]
     704:	e1a00440 	asr	r0, r0, #8
     708:	e3a02003 	mov	r2, #3
     70c:	e5830004 	str	r0, [r3, #4]
     710:	e583200c 	str	r2, [r3, #12]
     714:	e3a02001 	mov	r2, #1
     718:	e5832008 	str	r2, [r3, #8]
     71c:	e12fff1e 	bx	lr
     720:	e002c000 	.word	0xe002c000

00000724 <putchar>:
     724:	e350000a 	cmp	r0, #10
     728:	1a000006 	bne	748 <putchar+0x24>
     72c:	e59f3030 	ldr	r3, [pc, #48]	; 764 <putchar+0x40>
     730:	e5932014 	ldr	r2, [r3, #20]
     734:	e3120020 	tst	r2, #32
     738:	0afffffc 	beq	730 <putchar+0xc>
     73c:	e59f3020 	ldr	r3, [pc, #32]	; 764 <putchar+0x40>
     740:	e3a0200d 	mov	r2, #13
     744:	e5832000 	str	r2, [r3]
     748:	e59f3014 	ldr	r3, [pc, #20]	; 764 <putchar+0x40>
     74c:	e5932014 	ldr	r2, [r3, #20]
     750:	e3120020 	tst	r2, #32
     754:	0afffffc 	beq	74c <putchar+0x28>
     758:	e59f3004 	ldr	r3, [pc, #4]	; 764 <putchar+0x40>
     75c:	e5830000 	str	r0, [r3]
     760:	e12fff1e 	bx	lr
     764:	e000c000 	.word	0xe000c000

00000768 <getchar>:
     768:	e59f3014 	ldr	r3, [pc, #20]	; 784 <getchar+0x1c>
     76c:	e5932014 	ldr	r2, [r3, #20]
     770:	e3120001 	tst	r2, #1
     774:	0afffffc 	beq	76c <getchar+0x4>
     778:	e59f3004 	ldr	r3, [pc, #4]	; 784 <getchar+0x1c>
     77c:	e5930000 	ldr	r0, [r3]
     780:	e12fff1e 	bx	lr
     784:	e000c000 	.word	0xe000c000

00000788 <puts>:
     788:	e92d4010 	push	{r4, lr}
     78c:	e1a04000 	mov	r4, r0
     790:	ea000000 	b	798 <puts+0x10>
     794:	ebffffe2 	bl	724 <putchar>
     798:	e4d40001 	ldrb	r0, [r4], #1
     79c:	e3500000 	cmp	r0, #0
     7a0:	1afffffb 	bne	794 <puts+0xc>
     7a4:	e280000a 	add	r0, r0, #10
     7a8:	ebffffdd 	bl	724 <putchar>
     7ac:	e3a00001 	mov	r0, #1
     7b0:	e8bd8010 	pop	{r4, pc}

000007b4 <_HandleBulkOut>:
     7b4:	e3a01000 	mov	r1, #0
     7b8:	e1a02001 	mov	r2, r1
     7bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     7c0:	e20000ff 	and	r0, r0, #255	; 0xff
     7c4:	eb00011a 	bl	c34 <USBHwEPRead>
     7c8:	e59f3028 	ldr	r3, [pc, #40]	; 7f8 <_HandleBulkOut+0x44>
     7cc:	e5932000 	ldr	r2, [r3]
     7d0:	e0802002 	add	r2, r0, r2
     7d4:	e5832000 	str	r2, [r3]
     7d8:	e5932004 	ldr	r2, [r3, #4]
     7dc:	e0600002 	rsb	r0, r0, r2
     7e0:	e3500000 	cmp	r0, #0
     7e4:	e5830004 	str	r0, [r3, #4]
     7e8:	149df004 	popne	{pc}		; (ldrne pc, [sp], #4)
     7ec:	e59f0008 	ldr	r0, [pc, #8]	; 7fc <_HandleBulkOut+0x48>
     7f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     7f4:	eaffffe3 	b	788 <puts>
     7f8:	40000200 	.word	0x40000200
     7fc:	00001baf 	.word	0x00001baf

00000800 <_HandleBulkIn>:
     800:	e92d4030 	push	{r4, r5, lr}
     804:	e59f404c 	ldr	r4, [pc, #76]	; 858 <_HandleBulkIn+0x58>
     808:	e5945004 	ldr	r5, [r4, #4]
     80c:	e3550040 	cmp	r5, #64	; 0x40
     810:	23a05040 	movcs	r5, #64	; 0x40
     814:	e3550000 	cmp	r5, #0
     818:	e20000ff 	and	r0, r0, #255	; 0xff
     81c:	1a000002 	bne	82c <_HandleBulkIn+0x2c>
     820:	e59f0034 	ldr	r0, [pc, #52]	; 85c <_HandleBulkIn+0x5c>
     824:	e8bd4030 	pop	{r4, r5, lr}
     828:	eaffffd6 	b	788 <puts>
     82c:	e1a02005 	mov	r2, r5
     830:	e5941000 	ldr	r1, [r4]
     834:	eb0000dd 	bl	bb0 <USBHwEPWrite>
     838:	e5943000 	ldr	r3, [r4]
     83c:	e5942004 	ldr	r2, [r4, #4]
     840:	e0853003 	add	r3, r5, r3
     844:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
     848:	e0655002 	rsb	r5, r5, r2
     84c:	e3c3373e 	bic	r3, r3, #16252928	; 0xf80000
     850:	e8840028 	stm	r4, {r3, r5}
     854:	e8bd8030 	pop	{r4, r5, pc}
     858:	40000200 	.word	0x40000200
     85c:	00001baf 	.word	0x00001baf

00000860 <HandleVendorRequest>:
     860:	e92d4030 	push	{r4, r5, lr}
     864:	e5d04001 	ldrb	r4, [r0, #1]
     868:	e3540001 	cmp	r4, #1
     86c:	e1a05001 	mov	r5, r1
     870:	e5922000 	ldr	r2, [r2]
     874:	0a000002 	beq	884 <HandleVendorRequest+0x24>
     878:	e3540002 	cmp	r4, #2
     87c:	1a000015 	bne	8d8 <HandleVendorRequest+0x78>
     880:	ea00000b 	b	8b4 <HandleVendorRequest+0x54>
     884:	e59f3060 	ldr	r3, [pc, #96]	; 8ec <HandleVendorRequest+0x8c>
     888:	e8920006 	ldm	r2, {r1, r2}
     88c:	e59f005c 	ldr	r0, [pc, #92]	; 8f0 <HandleVendorRequest+0x90>
     890:	e8830006 	stm	r3, {r1, r2}
     894:	ebffff7b 	bl	688 <printf>
     898:	e3a00082 	mov	r0, #130	; 0x82
     89c:	e3a01000 	mov	r1, #0
     8a0:	ebffffd6 	bl	800 <_HandleBulkIn>
     8a4:	e3a03000 	mov	r3, #0
     8a8:	e5853000 	str	r3, [r5]
     8ac:	e1a00004 	mov	r0, r4
     8b0:	e8bd8030 	pop	{r4, r5, pc}
     8b4:	e59f3030 	ldr	r3, [pc, #48]	; 8ec <HandleVendorRequest+0x8c>
     8b8:	e8920006 	ldm	r2, {r1, r2}
     8bc:	e59f0030 	ldr	r0, [pc, #48]	; 8f4 <HandleVendorRequest+0x94>
     8c0:	e8830006 	stm	r3, {r1, r2}
     8c4:	ebffff6f 	bl	688 <printf>
     8c8:	e3a03000 	mov	r3, #0
     8cc:	e5853000 	str	r3, [r5]
     8d0:	e3a00001 	mov	r0, #1
     8d4:	e8bd8030 	pop	{r4, r5, pc}
     8d8:	e1a01004 	mov	r1, r4
     8dc:	e59f0014 	ldr	r0, [pc, #20]	; 8f8 <HandleVendorRequest+0x98>
     8e0:	ebffff68 	bl	688 <printf>
     8e4:	e3a00000 	mov	r0, #0
     8e8:	e8bd8030 	pop	{r4, r5, pc}
     8ec:	40000200 	.word	0x40000200
     8f0:	00001bb4 	.word	0x00001bb4
     8f4:	00001bcb 	.word	0x00001bcb
     8f8:	00001be3 	.word	0x00001be3

000008fc <main>:
     8fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     900:	ebfffdff 	bl	104 <HalSysInit>
     904:	e3a00027 	mov	r0, #39	; 0x27
     908:	ebffff73 	bl	6dc <ConsoleInit>
     90c:	e59f004c 	ldr	r0, [pc, #76]	; 960 <main+0x64>
     910:	ebffff9c 	bl	788 <puts>
     914:	eb0003d2 	bl	1864 <USBInit>
     918:	e59f0044 	ldr	r0, [pc, #68]	; 964 <main+0x68>
     91c:	eb0002ce 	bl	145c <USBRegisterDescriptors>
     920:	e59f2040 	ldr	r2, [pc, #64]	; 968 <main+0x6c>
     924:	e3a00002 	mov	r0, #2
     928:	e59f103c 	ldr	r1, [pc, #60]	; 96c <main+0x70>
     92c:	eb0002aa 	bl	13dc <USBRegisterRequestHandler>
     930:	e3a00082 	mov	r0, #130	; 0x82
     934:	e59f1034 	ldr	r1, [pc, #52]	; 970 <main+0x74>
     938:	eb00004e 	bl	a78 <USBHwRegisterEPIntHandler>
     93c:	e3a00005 	mov	r0, #5
     940:	e59f102c 	ldr	r1, [pc, #44]	; 974 <main+0x78>
     944:	eb00004b 	bl	a78 <USBHwRegisterEPIntHandler>
     948:	e59f0028 	ldr	r0, [pc, #40]	; 978 <main+0x7c>
     94c:	ebffff8d 	bl	788 <puts>
     950:	e3a00001 	mov	r0, #1
     954:	eb000079 	bl	b40 <USBHwConnect>
     958:	eb000109 	bl	d84 <USBHwISR>
     95c:	eafffffd 	b	958 <main+0x5c>
     960:	00001bf7 	.word	0x00001bf7
     964:	00001ab8 	.word	0x00001ab8
     968:	40000208 	.word	0x40000208
     96c:	00000860 	.word	0x00000860
     970:	00000800 	.word	0x00000800
     974:	000007b4 	.word	0x000007b4
     978:	00001c0e 	.word	0x00001c0e

0000097c <Wait4DevInt>:
     97c:	e59f3018 	ldr	r3, [pc, #24]	; 99c <Wait4DevInt+0x20>
     980:	e5132dff 	ldr	r2, [r3, #-3583]	; 0xdff
     984:	e0002002 	and	r2, r0, r2
     988:	e1520000 	cmp	r2, r0
     98c:	1afffffb 	bne	980 <Wait4DevInt+0x4>
     990:	e59f3004 	ldr	r3, [pc, #4]	; 99c <Wait4DevInt+0x20>
     994:	e5030df7 	str	r0, [r3, #-3575]	; 0xdf7
     998:	e12fff1e 	bx	lr
     99c:	ffe0cfff 	.word	0xffe0cfff

000009a0 <USBHwCmd>:
     9a0:	e59f3018 	ldr	r3, [pc, #24]	; 9c0 <USBHwCmd+0x20>
     9a4:	e1a00800 	lsl	r0, r0, #16
     9a8:	e3a02030 	mov	r2, #48	; 0x30
     9ac:	e3800c05 	orr	r0, r0, #1280	; 0x500
     9b0:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     9b4:	e5030def 	str	r0, [r3, #-3567]	; 0xdef
     9b8:	e3a00010 	mov	r0, #16
     9bc:	eaffffee 	b	97c <Wait4DevInt>
     9c0:	ffe0cfff 	.word	0xffe0cfff

000009c4 <USBHwCmdWrite>:
     9c4:	e92d4010 	push	{r4, lr}
     9c8:	e1a04001 	mov	r4, r1
     9cc:	ebfffff3 	bl	9a0 <USBHwCmd>
     9d0:	e1a04804 	lsl	r4, r4, #16
     9d4:	e59f3010 	ldr	r3, [pc, #16]	; 9ec <USBHwCmdWrite+0x28>
     9d8:	e3844c01 	orr	r4, r4, #256	; 0x100
     9dc:	e3a00010 	mov	r0, #16
     9e0:	e5034def 	str	r4, [r3, #-3567]	; 0xdef
     9e4:	e8bd4010 	pop	{r4, lr}
     9e8:	eaffffe3 	b	97c <Wait4DevInt>
     9ec:	ffe0cfff 	.word	0xffe0cfff

000009f0 <USBHwCmdRead>:
     9f0:	e92d4010 	push	{r4, lr}
     9f4:	e1a04000 	mov	r4, r0
     9f8:	e1a04804 	lsl	r4, r4, #16
     9fc:	ebffffe7 	bl	9a0 <USBHwCmd>
     a00:	e3843c02 	orr	r3, r4, #512	; 0x200
     a04:	e59f4014 	ldr	r4, [pc, #20]	; a20 <USBHwCmdRead+0x30>
     a08:	e3a00020 	mov	r0, #32
     a0c:	e5043def 	str	r3, [r4, #-3567]	; 0xdef
     a10:	ebffffd9 	bl	97c <Wait4DevInt>
     a14:	e5140deb 	ldr	r0, [r4, #-3563]	; 0xdeb
     a18:	e20000ff 	and	r0, r0, #255	; 0xff
     a1c:	e8bd8010 	pop	{r4, pc}
     a20:	ffe0cfff 	.word	0xffe0cfff

00000a24 <USBHwEPConfig>:
     a24:	e20030ff 	and	r3, r0, #255	; 0xff
     a28:	e92d4010 	push	{r4, lr}
     a2c:	e1a033a3 	lsr	r3, r3, #7
     a30:	e200400f 	and	r4, r0, #15
     a34:	e1834084 	orr	r4, r3, r4, lsl #1
     a38:	e59f3034 	ldr	r3, [pc, #52]	; a74 <USBHwEPConfig+0x50>
     a3c:	e5132dbb 	ldr	r2, [r3, #-3515]	; 0xdbb
     a40:	e3a00001 	mov	r0, #1
     a44:	e1822410 	orr	r2, r2, r0, lsl r4
     a48:	e1a01801 	lsl	r1, r1, #16
     a4c:	e1a01821 	lsr	r1, r1, #16
     a50:	e5032dbb 	str	r2, [r3, #-3515]	; 0xdbb
     a54:	e28000ff 	add	r0, r0, #255	; 0xff
     a58:	e5034db7 	str	r4, [r3, #-3511]	; 0xdb7
     a5c:	e5031db3 	str	r1, [r3, #-3507]	; 0xdb3
     a60:	ebffffc5 	bl	97c <Wait4DevInt>
     a64:	e3840040 	orr	r0, r4, #64	; 0x40
     a68:	e3a01000 	mov	r1, #0
     a6c:	e8bd4010 	pop	{r4, lr}
     a70:	eaffffd3 	b	9c4 <USBHwCmdWrite>
     a74:	ffe0cfff 	.word	0xffe0cfff

00000a78 <USBHwRegisterEPIntHandler>:
     a78:	e20030ff 	and	r3, r0, #255	; 0xff
     a7c:	e1a023a3 	lsr	r2, r3, #7
     a80:	e200000f 	and	r0, r0, #15
     a84:	e1820080 	orr	r0, r2, r0, lsl #1
     a88:	e59f2038 	ldr	r2, [pc, #56]	; ac8 <USBHwRegisterEPIntHandler+0x50>
     a8c:	e1a0c0a0 	lsr	ip, r0, #1
     a90:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     a94:	e782110c 	str	r1, [r2, ip, lsl #2]
     a98:	e59f202c 	ldr	r2, [pc, #44]	; acc <USBHwRegisterEPIntHandler+0x54>
     a9c:	e5121dcb 	ldr	r1, [r2, #-3531]	; 0xdcb
     aa0:	e3a0c001 	mov	ip, #1
     aa4:	e181001c 	orr	r0, r1, ip, lsl r0
     aa8:	e5020dcb 	str	r0, [r2, #-3531]	; 0xdcb
     aac:	e5121dfb 	ldr	r1, [r2, #-3579]	; 0xdfb
     ab0:	e59f0018 	ldr	r0, [pc, #24]	; ad0 <USBHwRegisterEPIntHandler+0x58>
     ab4:	e3811004 	orr	r1, r1, #4
     ab8:	e5021dfb 	str	r1, [r2, #-3579]	; 0xdfb
     abc:	e1a01003 	mov	r1, r3
     ac0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ac4:	eafffeef 	b	688 <printf>
     ac8:	40000210 	.word	0x40000210
     acc:	ffe0cfff 	.word	0xffe0cfff
     ad0:	00001c61 	.word	0x00001c61

00000ad4 <USBHwRegisterDevIntHandler>:
     ad4:	e59f3018 	ldr	r3, [pc, #24]	; af4 <USBHwRegisterDevIntHandler+0x20>
     ad8:	e5830040 	str	r0, [r3, #64]	; 0x40
     adc:	e59f3014 	ldr	r3, [pc, #20]	; af8 <USBHwRegisterDevIntHandler+0x24>
     ae0:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     ae4:	e59f0010 	ldr	r0, [pc, #16]	; afc <USBHwRegisterDevIntHandler+0x28>
     ae8:	e3822008 	orr	r2, r2, #8
     aec:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     af0:	eaffff24 	b	788 <puts>
     af4:	40000210 	.word	0x40000210
     af8:	ffe0cfff 	.word	0xffe0cfff
     afc:	00001c81 	.word	0x00001c81

00000b00 <USBHwRegisterFrameHandler>:
     b00:	e59f3018 	ldr	r3, [pc, #24]	; b20 <USBHwRegisterFrameHandler+0x20>
     b04:	e5830044 	str	r0, [r3, #68]	; 0x44
     b08:	e59f3014 	ldr	r3, [pc, #20]	; b24 <USBHwRegisterFrameHandler+0x24>
     b0c:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     b10:	e59f0010 	ldr	r0, [pc, #16]	; b28 <USBHwRegisterFrameHandler+0x28>
     b14:	e3822001 	orr	r2, r2, #1
     b18:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     b1c:	eaffff19 	b	788 <puts>
     b20:	40000210 	.word	0x40000210
     b24:	ffe0cfff 	.word	0xffe0cfff
     b28:	00001ca6 	.word	0x00001ca6

00000b2c <USBHwSetAddress>:
     b2c:	e1e01c80 	mvn	r1, r0, lsl #25
     b30:	e1e01ca1 	mvn	r1, r1, lsr #25
     b34:	e20110ff 	and	r1, r1, #255	; 0xff
     b38:	e3a000d0 	mov	r0, #208	; 0xd0
     b3c:	eaffffa0 	b	9c4 <USBHwCmdWrite>

00000b40 <USBHwConnect>:
     b40:	e2501000 	subs	r1, r0, #0
     b44:	159f3020 	ldrne	r3, [pc, #32]	; b6c <USBHwConnect+0x2c>
     b48:	059f301c 	ldreq	r3, [pc, #28]	; b6c <USBHwConnect+0x2c>
     b4c:	13a02901 	movne	r2, #16384	; 0x4000
     b50:	03a02901 	moveq	r2, #16384	; 0x4000
     b54:	15032fe3 	strne	r2, [r3, #-4067]	; 0xfe3
     b58:	05032fe7 	streq	r2, [r3, #-4071]	; 0xfe7
     b5c:	e3a000fe 	mov	r0, #254	; 0xfe
     b60:	e2511000 	subs	r1, r1, #0
     b64:	13a01001 	movne	r1, #1
     b68:	eaffff95 	b	9c4 <USBHwCmdWrite>
     b6c:	3fffcfff 	.word	0x3fffcfff

00000b70 <USBHwNakIntEnable>:
     b70:	e20010ff 	and	r1, r0, #255	; 0xff
     b74:	e3a000f3 	mov	r0, #243	; 0xf3
     b78:	eaffff91 	b	9c4 <USBHwCmdWrite>

00000b7c <USBHwEPGetStatus>:
     b7c:	e20030ff 	and	r3, r0, #255	; 0xff
     b80:	e1a033a3 	lsr	r3, r3, #7
     b84:	e200000f 	and	r0, r0, #15
     b88:	e1830080 	orr	r0, r3, r0, lsl #1
     b8c:	eaffff97 	b	9f0 <USBHwCmdRead>

00000b90 <USBHwEPStall>:
     b90:	e20030ff 	and	r3, r0, #255	; 0xff
     b94:	e1a033a3 	lsr	r3, r3, #7
     b98:	e200000f 	and	r0, r0, #15
     b9c:	e1830080 	orr	r0, r3, r0, lsl #1
     ba0:	e3800040 	orr	r0, r0, #64	; 0x40
     ba4:	e2511000 	subs	r1, r1, #0
     ba8:	13a01001 	movne	r1, #1
     bac:	eaffff84 	b	9c4 <USBHwCmdWrite>

00000bb0 <USBHwEPWrite>:
     bb0:	e92d4010 	push	{r4, lr}
     bb4:	e1a04002 	mov	r4, r2
     bb8:	e20020ff 	and	r2, r0, #255	; 0xff
     bbc:	e200300f 	and	r3, r0, #15
     bc0:	e1a003a2 	lsr	r0, r2, #7
     bc4:	e1800083 	orr	r0, r0, r3, lsl #1
     bc8:	e1a03103 	lsl	r3, r3, #2
     bcc:	e3832002 	orr	r2, r3, #2
     bd0:	e59f3058 	ldr	r3, [pc, #88]	; c30 <USBHwEPWrite+0x80>
     bd4:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     bd8:	e5034ddb 	str	r4, [r3, #-3547]	; 0xddb
     bdc:	ea000008 	b	c04 <USBHwEPWrite+0x54>
     be0:	e5512002 	ldrb	r2, [r1, #-2]
     be4:	e551c001 	ldrb	ip, [r1, #-1]
     be8:	e1a02802 	lsl	r2, r2, #16
     bec:	e1822c0c 	orr	r2, r2, ip, lsl #24
     bf0:	e551c004 	ldrb	ip, [r1, #-4]
     bf4:	e182200c 	orr	r2, r2, ip
     bf8:	e551c003 	ldrb	ip, [r1, #-3]
     bfc:	e182240c 	orr	r2, r2, ip, lsl #8
     c00:	e5032de3 	str	r2, [r3, #-3555]	; 0xde3
     c04:	e5132dd7 	ldr	r2, [r3, #-3543]	; 0xdd7
     c08:	e2122002 	ands	r2, r2, #2
     c0c:	e2811004 	add	r1, r1, #4
     c10:	1afffff2 	bne	be0 <USBHwEPWrite+0x30>
     c14:	e59f3014 	ldr	r3, [pc, #20]	; c30 <USBHwEPWrite+0x80>
     c18:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     c1c:	ebffff5f 	bl	9a0 <USBHwCmd>
     c20:	e3a000fa 	mov	r0, #250	; 0xfa
     c24:	ebffff5d 	bl	9a0 <USBHwCmd>
     c28:	e1a00004 	mov	r0, r4
     c2c:	e8bd8010 	pop	{r4, pc}
     c30:	ffe0cfff 	.word	0xffe0cfff

00000c34 <USBHwEPRead>:
     c34:	e200c0ff 	and	ip, r0, #255	; 0xff
     c38:	e200000f 	and	r0, r0, #15
     c3c:	e92d4030 	push	{r4, r5, lr}
     c40:	e59f3084 	ldr	r3, [pc, #132]	; ccc <USBHwEPRead+0x98>
     c44:	e1a04100 	lsl	r4, r0, #2
     c48:	e3844001 	orr	r4, r4, #1
     c4c:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
     c50:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
     c54:	e3140b02 	tst	r4, #2048	; 0x800
     c58:	0afffffc 	beq	c50 <USBHwEPRead+0x1c>
     c5c:	e3140b01 	tst	r4, #1024	; 0x400
     c60:	03e04000 	mvneq	r4, #0
     c64:	0a000016 	beq	cc4 <USBHwEPRead+0x90>
     c68:	e1a04b04 	lsl	r4, r4, #22
     c6c:	e3a0e000 	mov	lr, #0
     c70:	e1a04b24 	lsr	r4, r4, #22
     c74:	e1a0300e 	mov	r3, lr
     c78:	e59f504c 	ldr	r5, [pc, #76]	; ccc <USBHwEPRead+0x98>
     c7c:	ea000006 	b	c9c <USBHwEPRead+0x68>
     c80:	e3130003 	tst	r3, #3
     c84:	0515ede7 	ldreq	lr, [r5, #-3559]	; 0xde7
     c88:	e3510000 	cmp	r1, #0
     c8c:	11530002 	cmpne	r3, r2
     c90:	b7c1e003 	strblt	lr, [r1, r3]
     c94:	e1a0e42e 	lsr	lr, lr, #8
     c98:	e2833001 	add	r3, r3, #1
     c9c:	e1530004 	cmp	r3, r4
     ca0:	1afffff6 	bne	c80 <USBHwEPRead+0x4c>
     ca4:	e59f3020 	ldr	r3, [pc, #32]	; ccc <USBHwEPRead+0x98>
     ca8:	e3a02000 	mov	r2, #0
     cac:	e1a0c3ac 	lsr	ip, ip, #7
     cb0:	e18c0080 	orr	r0, ip, r0, lsl #1
     cb4:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     cb8:	ebffff38 	bl	9a0 <USBHwCmd>
     cbc:	e3a000f2 	mov	r0, #242	; 0xf2
     cc0:	ebffff36 	bl	9a0 <USBHwCmd>
     cc4:	e1a00004 	mov	r0, r4
     cc8:	e8bd8030 	pop	{r4, r5, pc}
     ccc:	ffe0cfff 	.word	0xffe0cfff

00000cd0 <USBHwISOCEPRead>:
     cd0:	e200c0ff 	and	ip, r0, #255	; 0xff
     cd4:	e200000f 	and	r0, r0, #15
     cd8:	e92d4030 	push	{r4, r5, lr}
     cdc:	e59f308c 	ldr	r3, [pc, #140]	; d70 <USBHwISOCEPRead+0xa0>
     ce0:	e1a04100 	lsl	r4, r0, #2
     ce4:	e3844001 	orr	r4, r4, #1
     ce8:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
     cec:	e1a00000 	nop			; (mov r0, r0)
     cf0:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
     cf4:	e2145b02 	ands	r5, r4, #2048	; 0x800
     cf8:	0a000001 	beq	d04 <USBHwISOCEPRead+0x34>
     cfc:	e2145b01 	ands	r5, r4, #1024	; 0x400
     d00:	1a000002 	bne	d10 <USBHwISOCEPRead+0x40>
     d04:	e5035dd7 	str	r5, [r3, #-3543]	; 0xdd7
     d08:	e3e04000 	mvn	r4, #0
     d0c:	ea000015 	b	d68 <USBHwISOCEPRead+0x98>
     d10:	e1a04b04 	lsl	r4, r4, #22
     d14:	e3a05000 	mov	r5, #0
     d18:	e1a04b24 	lsr	r4, r4, #22
     d1c:	e1a0e005 	mov	lr, r5
     d20:	ea000006 	b	d40 <USBHwISOCEPRead+0x70>
     d24:	e31e0003 	tst	lr, #3
     d28:	05135de7 	ldreq	r5, [r3, #-3559]	; 0xde7
     d2c:	e3510000 	cmp	r1, #0
     d30:	115e0002 	cmpne	lr, r2
     d34:	b7c1500e 	strblt	r5, [r1, lr]
     d38:	e1a05425 	lsr	r5, r5, #8
     d3c:	e28ee001 	add	lr, lr, #1
     d40:	e15e0004 	cmp	lr, r4
     d44:	1afffff6 	bne	d24 <USBHwISOCEPRead+0x54>
     d48:	e59f3020 	ldr	r3, [pc, #32]	; d70 <USBHwISOCEPRead+0xa0>
     d4c:	e3a02000 	mov	r2, #0
     d50:	e1a0c3ac 	lsr	ip, ip, #7
     d54:	e18c0080 	orr	r0, ip, r0, lsl #1
     d58:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     d5c:	ebffff0f 	bl	9a0 <USBHwCmd>
     d60:	e3a000f2 	mov	r0, #242	; 0xf2
     d64:	ebffff0d 	bl	9a0 <USBHwCmd>
     d68:	e1a00004 	mov	r0, r4
     d6c:	e8bd8030 	pop	{r4, r5, pc}
     d70:	ffe0cfff 	.word	0xffe0cfff

00000d74 <USBHwConfigDevice>:
     d74:	e2501000 	subs	r1, r0, #0
     d78:	13a01001 	movne	r1, #1
     d7c:	e3a000d8 	mov	r0, #216	; 0xd8
     d80:	eaffff0f 	b	9c4 <USBHwCmdWrite>

00000d84 <USBHwISR>:
     d84:	e59f3120 	ldr	r3, [pc, #288]	; eac <USBHwISR+0x128>
     d88:	e3a02002 	mov	r2, #2
     d8c:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
     d90:	e5032fa7 	str	r2, [r3, #-4007]	; 0xfa7
     d94:	e59f3114 	ldr	r3, [pc, #276]	; eb0 <USBHwISR+0x12c>
     d98:	e5134dff 	ldr	r4, [r3, #-3583]	; 0xdff
     d9c:	e3140001 	tst	r4, #1
     da0:	0a000009 	beq	dcc <USBHwISR+0x48>
     da4:	e3a02001 	mov	r2, #1
     da8:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     dac:	e59f3100 	ldr	r3, [pc, #256]	; eb4 <USBHwISR+0x130>
     db0:	e5935044 	ldr	r5, [r3, #68]	; 0x44
     db4:	e3550000 	cmp	r5, #0
     db8:	0a000003 	beq	dcc <USBHwISR+0x48>
     dbc:	e3a000f5 	mov	r0, #245	; 0xf5
     dc0:	ebffff0a 	bl	9f0 <USBHwCmdRead>
     dc4:	e1a0e00f 	mov	lr, pc
     dc8:	e12fff15 	bx	r5
     dcc:	e3140008 	tst	r4, #8
     dd0:	0a000011 	beq	e1c <USBHwISR+0x98>
     dd4:	e59f30d4 	ldr	r3, [pc, #212]	; eb0 <USBHwISR+0x12c>
     dd8:	e3a02008 	mov	r2, #8
     ddc:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     de0:	e3a000fe 	mov	r0, #254	; 0xfe
     de4:	ebffff01 	bl	9f0 <USBHwCmdRead>
     de8:	e310001a 	tst	r0, #26
     dec:	0a00000a 	beq	e1c <USBHwISR+0x98>
     df0:	e59f30bc 	ldr	r3, [pc, #188]	; eb4 <USBHwISR+0x130>
     df4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
     df8:	e3530000 	cmp	r3, #0
     dfc:	0a000006 	beq	e1c <USBHwISR+0x98>
     e00:	e59f50a4 	ldr	r5, [pc, #164]	; eac <USBHwISR+0x128>
     e04:	e3a06001 	mov	r6, #1
     e08:	e5056fa7 	str	r6, [r5, #-4007]	; 0xfa7
     e0c:	e2000015 	and	r0, r0, #21
     e10:	e1a0e00f 	mov	lr, pc
     e14:	e12fff13 	bx	r3
     e18:	e5056fa3 	str	r6, [r5, #-4003]	; 0xfa3
     e1c:	e3140004 	tst	r4, #4
     e20:	0a00001d 	beq	e9c <USBHwISR+0x118>
     e24:	e59f5084 	ldr	r5, [pc, #132]	; eb0 <USBHwISR+0x12c>
     e28:	e3a06004 	mov	r6, #4
     e2c:	e5056df7 	str	r6, [r5, #-3575]	; 0xdf7
     e30:	e59f807c 	ldr	r8, [pc, #124]	; eb4 <USBHwISR+0x130>
     e34:	e59f7070 	ldr	r7, [pc, #112]	; eac <USBHwISR+0x128>
     e38:	e3a04000 	mov	r4, #0
     e3c:	e3a0a001 	mov	sl, #1
     e40:	e1a0341a 	lsl	r3, sl, r4
     e44:	e5152dcf 	ldr	r2, [r5, #-3535]	; 0xdcf
     e48:	e1130002 	tst	r3, r2
     e4c:	0a00000f 	beq	e90 <USBHwISR+0x10c>
     e50:	e5053dc7 	str	r3, [r5, #-3527]	; 0xdc7
     e54:	e3a00020 	mov	r0, #32
     e58:	ebfffec7 	bl	97c <Wait4DevInt>
     e5c:	e1a020c4 	asr	r2, r4, #1
     e60:	e7983102 	ldr	r3, [r8, r2, lsl #2]
     e64:	e3530000 	cmp	r3, #0
     e68:	e5151deb 	ldr	r1, [r5, #-3563]	; 0xdeb
     e6c:	0a000007 	beq	e90 <USBHwISR+0x10c>
     e70:	e202200f 	and	r2, r2, #15
     e74:	e1820384 	orr	r0, r2, r4, lsl #7
     e78:	e5076fa7 	str	r6, [r7, #-4007]	; 0xfa7
     e7c:	e200008f 	and	r0, r0, #143	; 0x8f
     e80:	e201101f 	and	r1, r1, #31
     e84:	e1a0e00f 	mov	lr, pc
     e88:	e12fff13 	bx	r3
     e8c:	e5076fa3 	str	r6, [r7, #-4003]	; 0xfa3
     e90:	e2844001 	add	r4, r4, #1
     e94:	e3540020 	cmp	r4, #32
     e98:	1affffe8 	bne	e40 <USBHwISR+0xbc>
     e9c:	e59f3008 	ldr	r3, [pc, #8]	; eac <USBHwISR+0x128>
     ea0:	e3a02002 	mov	r2, #2
     ea4:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
     ea8:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
     eac:	3fffcfff 	.word	0x3fffcfff
     eb0:	ffe0cfff 	.word	0xffe0cfff
     eb4:	40000210 	.word	0x40000210

00000eb8 <USBHwInit>:
     eb8:	e59f312c 	ldr	r3, [pc, #300]	; fec <USBHwInit+0x134>
     ebc:	e5932004 	ldr	r2, [r3, #4]
     ec0:	e3c22103 	bic	r2, r2, #-1073741824	; 0xc0000000
     ec4:	e3822101 	orr	r2, r2, #1073741824	; 0x40000000
     ec8:	e92d4010 	push	{r4, lr}
     ecc:	e5832004 	str	r2, [r3, #4]
     ed0:	e593200c 	ldr	r2, [r3, #12]
     ed4:	e3c22203 	bic	r2, r2, #805306368	; 0x30000000
     ed8:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
     edc:	e583200c 	str	r2, [r3, #12]
     ee0:	e5932000 	ldr	r2, [r3]
     ee4:	e3c2230f 	bic	r2, r2, #1006632960	; 0x3c000000
     ee8:	e3822301 	orr	r2, r2, #67108864	; 0x4000000
     eec:	e5832000 	str	r2, [r3]
     ef0:	e59f30f8 	ldr	r3, [pc, #248]	; ff0 <USBHwInit+0x138>
     ef4:	e5132fff 	ldr	r2, [r3, #-4095]	; 0xfff
     ef8:	e3822901 	orr	r2, r2, #16384	; 0x4000
     efc:	e5032fff 	str	r2, [r3, #-4095]	; 0xfff
     f00:	e3a02901 	mov	r2, #16384	; 0x4000
     f04:	e5032fe7 	str	r2, [r3, #-4071]	; 0xfe7
     f08:	e59f30e4 	ldr	r3, [pc, #228]	; ff4 <USBHwInit+0x13c>
     f0c:	e59320c4 	ldr	r2, [r3, #196]	; 0xc4
     f10:	e3822102 	orr	r2, r2, #-2147483648	; 0x80000000
     f14:	e58320c4 	str	r2, [r3, #196]	; 0xc4
     f18:	e3a02005 	mov	r2, #5
     f1c:	e5832108 	str	r2, [r3, #264]	; 0x108
     f20:	e59f30d0 	ldr	r3, [pc, #208]	; ff8 <USBHwInit+0x140>
     f24:	e2822015 	add	r2, r2, #21
     f28:	e503200b 	str	r2, [r3, #-11]
     f2c:	e1a02003 	mov	r2, r3
     f30:	e5121007 	ldr	r1, [r2, #-7]
     f34:	e311001a 	tst	r1, #26
     f38:	e59f30b8 	ldr	r3, [pc, #184]	; ff8 <USBHwInit+0x140>
     f3c:	0afffffb 	beq	f30 <USBHwInit+0x78>
     f40:	e3a02003 	mov	r2, #3
     f44:	e5032eef 	str	r2, [r3, #-3823]	; 0xeef
     f48:	e3a04000 	mov	r4, #0
     f4c:	e3e02000 	mvn	r2, #0
     f50:	e5034dfb 	str	r4, [r3, #-3579]	; 0xdfb
     f54:	e1a00004 	mov	r0, r4
     f58:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     f5c:	e5034dd3 	str	r4, [r3, #-3539]	; 0xdd3
     f60:	e5034dcb 	str	r4, [r3, #-3531]	; 0xdcb
     f64:	e5032dc7 	str	r2, [r3, #-3527]	; 0xdc7
     f68:	e5034dbf 	str	r4, [r3, #-3519]	; 0xdbf
     f6c:	ebfffeff 	bl	b70 <USBHwNakIntEnable>
     f70:	e59f207c 	ldr	r2, [pc, #124]	; ff4 <USBHwInit+0x13c>
     f74:	e59231a0 	ldr	r3, [r2, #416]	; 0x1a0
     f78:	e59f106c 	ldr	r1, [pc, #108]	; fec <USBHwInit+0x134>
     f7c:	e3833001 	orr	r3, r3, #1
     f80:	e58231a0 	str	r3, [r2, #416]	; 0x1a0
     f84:	e5814028 	str	r4, [r1, #40]	; 0x28
     f88:	e59f3060 	ldr	r3, [pc, #96]	; ff0 <USBHwInit+0x138>
     f8c:	e5130fbf 	ldr	r0, [r3, #-4031]	; 0xfbf
     f90:	e3800001 	orr	r0, r0, #1
     f94:	e5030fbf 	str	r0, [r3, #-4031]	; 0xfbf
     f98:	e3a00001 	mov	r0, #1
     f9c:	e5030fa3 	str	r0, [r3, #-4003]	; 0xfa3
     fa0:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
     fa4:	e18cc000 	orr	ip, ip, r0
     fa8:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
     fac:	e5814028 	str	r4, [r1, #40]	; 0x28
     fb0:	e513cfbf 	ldr	ip, [r3, #-4031]	; 0xfbf
     fb4:	e38cc002 	orr	ip, ip, #2
     fb8:	e503cfbf 	str	ip, [r3, #-4031]	; 0xfbf
     fbc:	e3a0c002 	mov	ip, #2
     fc0:	e503cfa3 	str	ip, [r3, #-4003]	; 0xfa3
     fc4:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
     fc8:	e18cc000 	orr	ip, ip, r0
     fcc:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
     fd0:	e5814028 	str	r4, [r1, #40]	; 0x28
     fd4:	e5132fbf 	ldr	r2, [r3, #-4031]	; 0xfbf
     fd8:	e3822004 	orr	r2, r2, #4
     fdc:	e5032fbf 	str	r2, [r3, #-4031]	; 0xfbf
     fe0:	e3a02004 	mov	r2, #4
     fe4:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
     fe8:	e8bd8010 	pop	{r4, pc}
     fec:	e002c000 	.word	0xe002c000
     ff0:	3fffcfff 	.word	0x3fffcfff
     ff4:	e01fc000 	.word	0xe01fc000
     ff8:	ffe0cfff 	.word	0xffe0cfff

00000ffc <USBSetupDMADescriptor>:
     ffc:	e92d4030 	push	{r4, r5, lr}
    1000:	e3a05000 	mov	r5, #0
    1004:	e5805004 	str	r5, [r0, #4]
    1008:	e5801000 	str	r1, [r0]
    100c:	e5905004 	ldr	r5, [r0, #4]
    1010:	e1a03b03 	lsl	r3, r3, #22
    1014:	e18558a3 	orr	r5, r5, r3, lsr #17
    1018:	e5805004 	str	r5, [r0, #4]
    101c:	e1dd40bc 	ldrh	r4, [sp, #12]
    1020:	e5903004 	ldr	r3, [r0, #4]
    1024:	e1834804 	orr	r4, r3, r4, lsl #16
    1028:	e5804004 	str	r4, [r0, #4]
    102c:	e21220ff 	ands	r2, r2, #255	; 0xff
    1030:	15903004 	ldrne	r3, [r0, #4]
    1034:	13833010 	orrne	r3, r3, #16
    1038:	15803004 	strne	r3, [r0, #4]
    103c:	e3510000 	cmp	r1, #0
    1040:	15903004 	ldrne	r3, [r0, #4]
    1044:	13833004 	orrne	r3, r3, #4
    1048:	15803004 	strne	r3, [r0, #4]
    104c:	e28d3010 	add	r3, sp, #16
    1050:	e8931008 	ldm	r3, {r3, ip}
    1054:	e35c0000 	cmp	ip, #0
    1058:	13520000 	cmpne	r2, #0
    105c:	e5803008 	str	r3, [r0, #8]
    1060:	e3a03000 	mov	r3, #0
    1064:	1580c010 	strne	ip, [r0, #16]
    1068:	e580300c 	str	r3, [r0, #12]
    106c:	e8bd8030 	pop	{r4, r5, pc}

00001070 <USBDisableDMAForEndpoint>:
    1070:	e20030ff 	and	r3, r0, #255	; 0xff
    1074:	e1a033a3 	lsr	r3, r3, #7
    1078:	e200000f 	and	r0, r0, #15
    107c:	e1830080 	orr	r0, r3, r0, lsl #1
    1080:	e3a03001 	mov	r3, #1
    1084:	e1a00013 	lsl	r0, r3, r0
    1088:	e59f3004 	ldr	r3, [pc, #4]	; 1094 <USBDisableDMAForEndpoint+0x24>
    108c:	e5030d73 	str	r0, [r3, #-3443]	; 0xd73
    1090:	e12fff1e 	bx	lr
    1094:	ffe0cfff 	.word	0xffe0cfff

00001098 <USBEnableDMAForEndpoint>:
    1098:	e20030ff 	and	r3, r0, #255	; 0xff
    109c:	e1a033a3 	lsr	r3, r3, #7
    10a0:	e200000f 	and	r0, r0, #15
    10a4:	e1830080 	orr	r0, r3, r0, lsl #1
    10a8:	e3a03001 	mov	r3, #1
    10ac:	e1a00013 	lsl	r0, r3, r0
    10b0:	e59f3004 	ldr	r3, [pc, #4]	; 10bc <USBEnableDMAForEndpoint+0x24>
    10b4:	e5030d77 	str	r0, [r3, #-3447]	; 0xd77
    10b8:	e12fff1e 	bx	lr
    10bc:	ffe0cfff 	.word	0xffe0cfff

000010c0 <USBInitializeISOCFrameArray>:
    10c0:	e1a03b03 	lsl	r3, r3, #22
    10c4:	e1a02802 	lsl	r2, r2, #16
    10c8:	e1a03b23 	lsr	r3, r3, #22
    10cc:	e92d4010 	push	{r4, lr}
    10d0:	e1a02822 	lsr	r2, r2, #16
    10d4:	e3a0c000 	mov	ip, #0
    10d8:	e3833902 	orr	r3, r3, #32768	; 0x8000
    10dc:	ea000004 	b	10f4 <USBInitializeISOCFrameArray+0x34>
    10e0:	e1834804 	orr	r4, r3, r4, lsl #16
    10e4:	e780410c 	str	r4, [r0, ip, lsl #2]
    10e8:	e28cc001 	add	ip, ip, #1
    10ec:	e1a0c80c 	lsl	ip, ip, #16
    10f0:	e1a0c82c 	lsr	ip, ip, #16
    10f4:	e08c4002 	add	r4, ip, r2
    10f8:	e1a04804 	lsl	r4, r4, #16
    10fc:	e15c0001 	cmp	ip, r1
    1100:	e1a04824 	lsr	r4, r4, #16
    1104:	3afffff5 	bcc	10e0 <USBInitializeISOCFrameArray+0x20>
    1108:	e8bd8010 	pop	{r4, pc}

0000110c <USBSetHeadDDForDMA>:
    110c:	e20030ff 	and	r3, r0, #255	; 0xff
    1110:	e1a033a3 	lsr	r3, r3, #7
    1114:	e200000f 	and	r0, r0, #15
    1118:	e1830080 	orr	r0, r3, r0, lsl #1
    111c:	e7812100 	str	r2, [r1, r0, lsl #2]
    1120:	e12fff1e 	bx	lr

00001124 <USBInitializeUSBDMA>:
    1124:	e3a03000 	mov	r3, #0
    1128:	e1a02003 	mov	r2, r3
    112c:	e7802003 	str	r2, [r0, r3]
    1130:	e2833004 	add	r3, r3, #4
    1134:	e3530080 	cmp	r3, #128	; 0x80
    1138:	1afffffb 	bne	112c <USBInitializeUSBDMA+0x8>
    113c:	e59f3004 	ldr	r3, [pc, #4]	; 1148 <USBInitializeUSBDMA+0x24>
    1140:	e5030d7f 	str	r0, [r3, #-3455]	; 0xd7f
    1144:	e12fff1e 	bx	lr
    1148:	ffe0cfff 	.word	0xffe0cfff

0000114c <StallControlPipe>:
    114c:	e92d4070 	push	{r4, r5, r6, lr}
    1150:	e3a01001 	mov	r1, #1
    1154:	e1a05000 	mov	r5, r0
    1158:	e3a00080 	mov	r0, #128	; 0x80
    115c:	ebfffe8b 	bl	b90 <USBHwEPStall>
    1160:	e59f002c 	ldr	r0, [pc, #44]	; 1194 <StallControlPipe+0x48>
    1164:	ebfffd47 	bl	688 <printf>
    1168:	e59f6028 	ldr	r6, [pc, #40]	; 1198 <StallControlPipe+0x4c>
    116c:	e59f4028 	ldr	r4, [pc, #40]	; 119c <StallControlPipe+0x50>
    1170:	e4d41001 	ldrb	r1, [r4], #1
    1174:	e59f0024 	ldr	r0, [pc, #36]	; 11a0 <StallControlPipe+0x54>
    1178:	ebfffd42 	bl	688 <printf>
    117c:	e1540006 	cmp	r4, r6
    1180:	1afffffa 	bne	1170 <StallControlPipe+0x24>
    1184:	e59f0018 	ldr	r0, [pc, #24]	; 11a4 <StallControlPipe+0x58>
    1188:	e1a01005 	mov	r1, r5
    118c:	e8bd4070 	pop	{r4, r5, r6, lr}
    1190:	eafffd3c 	b	688 <printf>
    1194:	00001cc3 	.word	0x00001cc3
    1198:	40000260 	.word	0x40000260
    119c:	40000258 	.word	0x40000258
    11a0:	00001cce 	.word	0x00001cce
    11a4:	00001cd4 	.word	0x00001cd4

000011a8 <DataIn>:
    11a8:	e92d4030 	push	{r4, r5, lr}
    11ac:	e59f4034 	ldr	r4, [pc, #52]	; 11e8 <DataIn+0x40>
    11b0:	e5945008 	ldr	r5, [r4, #8]
    11b4:	e3550040 	cmp	r5, #64	; 0x40
    11b8:	a3a05040 	movge	r5, #64	; 0x40
    11bc:	e1a02005 	mov	r2, r5
    11c0:	e3a00080 	mov	r0, #128	; 0x80
    11c4:	e594100c 	ldr	r1, [r4, #12]
    11c8:	ebfffe78 	bl	bb0 <USBHwEPWrite>
    11cc:	e594300c 	ldr	r3, [r4, #12]
    11d0:	e0833005 	add	r3, r3, r5
    11d4:	e584300c 	str	r3, [r4, #12]
    11d8:	e5943008 	ldr	r3, [r4, #8]
    11dc:	e0655003 	rsb	r5, r5, r3
    11e0:	e5845008 	str	r5, [r4, #8]
    11e4:	e8bd8030 	pop	{r4, r5, pc}
    11e8:	40000258 	.word	0x40000258

000011ec <_HandleRequest.clone.0>:
    11ec:	e92d4010 	push	{r4, lr}
    11f0:	e59f003c 	ldr	r0, [pc, #60]	; 1234 <_HandleRequest.clone.0+0x48>
    11f4:	e5d01000 	ldrb	r1, [r0]
    11f8:	e1a012a1 	lsr	r1, r1, #5
    11fc:	e2011003 	and	r1, r1, #3
    1200:	e0803101 	add	r3, r0, r1, lsl #2
    1204:	e5934010 	ldr	r4, [r3, #16]
    1208:	e3540000 	cmp	r4, #0
    120c:	1a000003 	bne	1220 <_HandleRequest.clone.0+0x34>
    1210:	e59f0020 	ldr	r0, [pc, #32]	; 1238 <_HandleRequest.clone.0+0x4c>
    1214:	ebfffd1b 	bl	688 <printf>
    1218:	e1a00004 	mov	r0, r4
    121c:	e8bd8010 	pop	{r4, pc}
    1220:	e2801020 	add	r1, r0, #32
    1224:	e280200c 	add	r2, r0, #12
    1228:	e1a0e00f 	mov	lr, pc
    122c:	e12fff14 	bx	r4
    1230:	e8bd8010 	pop	{r4, pc}
    1234:	40000258 	.word	0x40000258
    1238:	00001cdf 	.word	0x00001cdf

0000123c <USBHandleControlTransfer>:
    123c:	e21030ff 	ands	r3, r0, #255	; 0xff
    1240:	e92d4031 	push	{r0, r4, r5, lr}
    1244:	e20150ff 	and	r5, r1, #255	; 0xff
    1248:	1a00004a 	bne	1378 <USBHandleControlTransfer+0x13c>
    124c:	e2110004 	ands	r0, r1, #4
    1250:	e59f415c 	ldr	r4, [pc, #348]	; 13b4 <USBHandleControlTransfer+0x178>
    1254:	0a00001e 	beq	12d4 <USBHandleControlTransfer+0x98>
    1258:	e1a00003 	mov	r0, r3
    125c:	e3a02008 	mov	r2, #8
    1260:	e1a01004 	mov	r1, r4
    1264:	ebfffe72 	bl	c34 <USBHwEPRead>
    1268:	e59f0148 	ldr	r0, [pc, #328]	; 13b8 <USBHandleControlTransfer+0x17c>
    126c:	e5d41001 	ldrb	r1, [r4, #1]
    1270:	ebfffd04 	bl	688 <printf>
    1274:	e5d42000 	ldrb	r2, [r4]
    1278:	e1a031a2 	lsr	r3, r2, #3
    127c:	e203300c 	and	r3, r3, #12
    1280:	e0843003 	add	r3, r4, r3
    1284:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    1288:	e584300c 	str	r3, [r4, #12]
    128c:	e1d430b6 	ldrh	r3, [r4, #6]
    1290:	e3530000 	cmp	r3, #0
    1294:	e5843008 	str	r3, [r4, #8]
    1298:	e5843020 	str	r3, [r4, #32]
    129c:	0a000001 	beq	12a8 <USBHandleControlTransfer+0x6c>
    12a0:	e1b023a2 	lsrs	r2, r2, #7
    12a4:	0a000040 	beq	13ac <USBHandleControlTransfer+0x170>
    12a8:	ebffffcf 	bl	11ec <_HandleRequest.clone.0>
    12ac:	e3500000 	cmp	r0, #0
    12b0:	059f0104 	ldreq	r0, [pc, #260]	; 13bc <USBHandleControlTransfer+0x180>
    12b4:	0a00001f 	beq	1338 <USBHandleControlTransfer+0xfc>
    12b8:	e59f30f4 	ldr	r3, [pc, #244]	; 13b4 <USBHandleControlTransfer+0x178>
    12bc:	e1d310b6 	ldrh	r1, [r3, #6]
    12c0:	e5932020 	ldr	r2, [r3, #32]
    12c4:	e1510002 	cmp	r1, r2
    12c8:	d5831008 	strle	r1, [r3, #8]
    12cc:	c5832008 	strgt	r2, [r3, #8]
    12d0:	ea00002a 	b	1380 <USBHandleControlTransfer+0x144>
    12d4:	e5942008 	ldr	r2, [r4, #8]
    12d8:	e3520000 	cmp	r2, #0
    12dc:	da00001a 	ble	134c <USBHandleControlTransfer+0x110>
    12e0:	e594100c 	ldr	r1, [r4, #12]
    12e4:	ebfffe52 	bl	c34 <USBHwEPRead>
    12e8:	e3500000 	cmp	r0, #0
    12ec:	ba000012 	blt	133c <USBHandleControlTransfer+0x100>
    12f0:	e594300c 	ldr	r3, [r4, #12]
    12f4:	e0833000 	add	r3, r3, r0
    12f8:	e584300c 	str	r3, [r4, #12]
    12fc:	e5943008 	ldr	r3, [r4, #8]
    1300:	e0600003 	rsb	r0, r0, r3
    1304:	e3500000 	cmp	r0, #0
    1308:	e5840008 	str	r0, [r4, #8]
    130c:	1a000026 	bne	13ac <USBHandleControlTransfer+0x170>
    1310:	e5d43000 	ldrb	r3, [r4]
    1314:	e1a031a3 	lsr	r3, r3, #3
    1318:	e203300c 	and	r3, r3, #12
    131c:	e0843003 	add	r3, r4, r3
    1320:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    1324:	e584300c 	str	r3, [r4, #12]
    1328:	ebffffaf 	bl	11ec <_HandleRequest.clone.0>
    132c:	e3500000 	cmp	r0, #0
    1330:	1a000012 	bne	1380 <USBHandleControlTransfer+0x144>
    1334:	e59f0084 	ldr	r0, [pc, #132]	; 13c0 <USBHandleControlTransfer+0x184>
    1338:	ebfffd12 	bl	788 <puts>
    133c:	e1a00005 	mov	r0, r5
    1340:	e28dd004 	add	sp, sp, #4
    1344:	e8bd4030 	pop	{r4, r5, lr}
    1348:	eaffff7f 	b	114c <StallControlPipe>
    134c:	e1a01000 	mov	r1, r0
    1350:	e1a02000 	mov	r2, r0
    1354:	ebfffe36 	bl	c34 <USBHwEPRead>
    1358:	e59f3064 	ldr	r3, [pc, #100]	; 13c4 <USBHandleControlTransfer+0x188>
    135c:	e59f2064 	ldr	r2, [pc, #100]	; 13c8 <USBHandleControlTransfer+0x18c>
    1360:	e3500000 	cmp	r0, #0
    1364:	d1a00002 	movle	r0, r2
    1368:	c1a00003 	movgt	r0, r3
    136c:	e28dd004 	add	sp, sp, #4
    1370:	e8bd4030 	pop	{r4, r5, lr}
    1374:	eafffcc3 	b	688 <printf>
    1378:	e3530080 	cmp	r3, #128	; 0x80
    137c:	1a000002 	bne	138c <USBHandleControlTransfer+0x150>
    1380:	e28dd004 	add	sp, sp, #4
    1384:	e8bd4030 	pop	{r4, r5, lr}
    1388:	eaffff86 	b	11a8 <DataIn>
    138c:	e3a030d4 	mov	r3, #212	; 0xd4
    1390:	e58d3000 	str	r3, [sp]
    1394:	e59f0030 	ldr	r0, [pc, #48]	; 13cc <USBHandleControlTransfer+0x190>
    1398:	e59f1030 	ldr	r1, [pc, #48]	; 13d0 <USBHandleControlTransfer+0x194>
    139c:	e59f2030 	ldr	r2, [pc, #48]	; 13d4 <USBHandleControlTransfer+0x198>
    13a0:	e59f3030 	ldr	r3, [pc, #48]	; 13d8 <USBHandleControlTransfer+0x19c>
    13a4:	ebfffcb7 	bl	688 <printf>
    13a8:	eafffffe 	b	13a8 <USBHandleControlTransfer+0x16c>
    13ac:	e28dd004 	add	sp, sp, #4
    13b0:	e8bd8030 	pop	{r4, r5, pc}
    13b4:	40000258 	.word	0x40000258
    13b8:	00001cfc 	.word	0x00001cfc
    13bc:	00001d00 	.word	0x00001d00
    13c0:	00001d17 	.word	0x00001d17
    13c4:	00001cfa 	.word	0x00001cfa
    13c8:	00001c4d 	.word	0x00001c4d
    13cc:	00001c29 	.word	0x00001c29
    13d0:	00001d2e 	.word	0x00001d2e
    13d4:	00001d34 	.word	0x00001d34
    13d8:	00001b48 	.word	0x00001b48

000013dc <USBRegisterRequestHandler>:
    13dc:	e92d4001 	push	{r0, lr}
    13e0:	e3500000 	cmp	r0, #0
    13e4:	aa000007 	bge	1408 <USBRegisterRequestHandler+0x2c>
    13e8:	e3a030e2 	mov	r3, #226	; 0xe2
    13ec:	e58d3000 	str	r3, [sp]
    13f0:	e59f004c 	ldr	r0, [pc, #76]	; 1444 <USBRegisterRequestHandler+0x68>
    13f4:	e59f104c 	ldr	r1, [pc, #76]	; 1448 <USBRegisterRequestHandler+0x6c>
    13f8:	e59f204c 	ldr	r2, [pc, #76]	; 144c <USBRegisterRequestHandler+0x70>
    13fc:	e59f304c 	ldr	r3, [pc, #76]	; 1450 <USBRegisterRequestHandler+0x74>
    1400:	ebfffca0 	bl	688 <printf>
    1404:	eafffffe 	b	1404 <USBRegisterRequestHandler+0x28>
    1408:	e3500003 	cmp	r0, #3
    140c:	da000007 	ble	1430 <USBRegisterRequestHandler+0x54>
    1410:	e3a030e3 	mov	r3, #227	; 0xe3
    1414:	e58d3000 	str	r3, [sp]
    1418:	e59f0024 	ldr	r0, [pc, #36]	; 1444 <USBRegisterRequestHandler+0x68>
    141c:	e59f1030 	ldr	r1, [pc, #48]	; 1454 <USBRegisterRequestHandler+0x78>
    1420:	e59f2024 	ldr	r2, [pc, #36]	; 144c <USBRegisterRequestHandler+0x70>
    1424:	e59f3024 	ldr	r3, [pc, #36]	; 1450 <USBRegisterRequestHandler+0x74>
    1428:	ebfffc96 	bl	688 <printf>
    142c:	eafffffe 	b	142c <USBRegisterRequestHandler+0x50>
    1430:	e59f3020 	ldr	r3, [pc, #32]	; 1458 <USBRegisterRequestHandler+0x7c>
    1434:	e0830100 	add	r0, r3, r0, lsl #2
    1438:	e5801010 	str	r1, [r0, #16]
    143c:	e5802024 	str	r2, [r0, #36]	; 0x24
    1440:	e8bd8008 	pop	{r3, pc}
    1444:	00001c29 	.word	0x00001c29
    1448:	00001d41 	.word	0x00001d41
    144c:	00001d34 	.word	0x00001d34
    1450:	00001b64 	.word	0x00001b64
    1454:	00001d4c 	.word	0x00001d4c
    1458:	40000258 	.word	0x40000258

0000145c <USBRegisterDescriptors>:
    145c:	e59f3004 	ldr	r3, [pc, #4]	; 1468 <USBRegisterDescriptors+0xc>
    1460:	e5830000 	str	r0, [r3]
    1464:	e12fff1e 	bx	lr
    1468:	4000028c 	.word	0x4000028c

0000146c <USBGetDescriptor>:
    146c:	e59fc09c 	ldr	ip, [pc, #156]	; 1510 <USBGetDescriptor+0xa4>
    1470:	e59cc000 	ldr	ip, [ip]
    1474:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    1478:	e1a00800 	lsl	r0, r0, #16
    147c:	e35c0000 	cmp	ip, #0
    1480:	e1a01820 	lsr	r1, r0, #16
    1484:	11a05c20 	lsrne	r5, r0, #24
    1488:	120160ff 	andne	r6, r1, #255	; 0xff
    148c:	13a00000 	movne	r0, #0
    1490:	1a000017 	bne	14f4 <USBGetDescriptor+0x88>
    1494:	e3a0306e 	mov	r3, #110	; 0x6e
    1498:	e58d3000 	str	r3, [sp]
    149c:	e59f0070 	ldr	r0, [pc, #112]	; 1514 <USBGetDescriptor+0xa8>
    14a0:	e59f1070 	ldr	r1, [pc, #112]	; 1518 <USBGetDescriptor+0xac>
    14a4:	e59f2070 	ldr	r2, [pc, #112]	; 151c <USBGetDescriptor+0xb0>
    14a8:	e59f3070 	ldr	r3, [pc, #112]	; 1520 <USBGetDescriptor+0xb4>
    14ac:	ebfffc75 	bl	688 <printf>
    14b0:	eafffffe 	b	14b0 <USBGetDescriptor+0x44>
    14b4:	e5dc7001 	ldrb	r7, [ip, #1]
    14b8:	e1570005 	cmp	r7, r5
    14bc:	1a00000b 	bne	14f0 <USBGetDescriptor+0x84>
    14c0:	e1500006 	cmp	r0, r6
    14c4:	1a000008 	bne	14ec <USBGetDescriptor+0x80>
    14c8:	e583c000 	str	ip, [r3]
    14cc:	e3550002 	cmp	r5, #2
    14d0:	05dc1003 	ldrbeq	r1, [ip, #3]
    14d4:	05dc3002 	ldrbeq	r3, [ip, #2]
    14d8:	15dc3000 	ldrbne	r3, [ip]
    14dc:	01833401 	orreq	r3, r3, r1, lsl #8
    14e0:	e5823000 	str	r3, [r2]
    14e4:	e3a00001 	mov	r0, #1
    14e8:	ea000007 	b	150c <USBGetDescriptor+0xa0>
    14ec:	e2800001 	add	r0, r0, #1
    14f0:	e08cc004 	add	ip, ip, r4
    14f4:	e5dc4000 	ldrb	r4, [ip]
    14f8:	e3540000 	cmp	r4, #0
    14fc:	1affffec 	bne	14b4 <USBGetDescriptor+0x48>
    1500:	e59f001c 	ldr	r0, [pc, #28]	; 1524 <USBGetDescriptor+0xb8>
    1504:	ebfffc5f 	bl	688 <printf>
    1508:	e1a00004 	mov	r0, r4
    150c:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    1510:	4000028c 	.word	0x4000028c
    1514:	00001c29 	.word	0x00001c29
    1518:	00001d56 	.word	0x00001d56
    151c:	00001d69 	.word	0x00001d69
    1520:	00001b80 	.word	0x00001b80
    1524:	00001d75 	.word	0x00001d75

00001528 <USBHandleStandardRequest>:
    1528:	e59f32e4 	ldr	r3, [pc, #740]	; 1814 <USBHandleStandardRequest+0x2ec>
    152c:	e5933004 	ldr	r3, [r3, #4]
    1530:	e3530000 	cmp	r3, #0
    1534:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    1538:	e1a04000 	mov	r4, r0
    153c:	e1a05001 	mov	r5, r1
    1540:	e1a06002 	mov	r6, r2
    1544:	0a000003 	beq	1558 <USBHandleStandardRequest+0x30>
    1548:	e1a0e00f 	mov	lr, pc
    154c:	e12fff13 	bx	r3
    1550:	e3500000 	cmp	r0, #0
    1554:	1a000071 	bne	1720 <USBHandleStandardRequest+0x1f8>
    1558:	e5d43000 	ldrb	r3, [r4]
    155c:	e203301f 	and	r3, r3, #31
    1560:	e3530001 	cmp	r3, #1
    1564:	0a000057 	beq	16c8 <USBHandleStandardRequest+0x1a0>
    1568:	e3530002 	cmp	r3, #2
    156c:	0a000078 	beq	1754 <USBHandleStandardRequest+0x22c>
    1570:	e3530000 	cmp	r3, #0
    1574:	1a0000a3 	bne	1808 <USBHandleStandardRequest+0x2e0>
    1578:	e5d41001 	ldrb	r1, [r4, #1]
    157c:	e5963000 	ldr	r3, [r6]
    1580:	e3510009 	cmp	r1, #9
    1584:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1588:	ea00004c 	b	16c0 <USBHandleStandardRequest+0x198>
    158c:	0000170c 	.word	0x0000170c
    1590:	00001808 	.word	0x00001808
    1594:	000016c0 	.word	0x000016c0
    1598:	00001808 	.word	0x00001808
    159c:	000016c0 	.word	0x000016c0
    15a0:	000015b4 	.word	0x000015b4
    15a4:	000015c0 	.word	0x000015c0
    15a8:	000016b4 	.word	0x000016b4
    15ac:	000015e8 	.word	0x000015e8
    15b0:	000015f4 	.word	0x000015f4
    15b4:	e5d40002 	ldrb	r0, [r4, #2]
    15b8:	ebfffd5b 	bl	b2c <USBHwSetAddress>
    15bc:	ea000057 	b	1720 <USBHandleStandardRequest+0x1f8>
    15c0:	e1d410b2 	ldrh	r1, [r4, #2]
    15c4:	e59f024c 	ldr	r0, [pc, #588]	; 1818 <USBHandleStandardRequest+0x2f0>
    15c8:	ebfffc2e 	bl	688 <printf>
    15cc:	e1d400b2 	ldrh	r0, [r4, #2]
    15d0:	e1d410b4 	ldrh	r1, [r4, #4]
    15d4:	e1a02005 	mov	r2, r5
    15d8:	e1a03006 	mov	r3, r6
    15dc:	e28dd004 	add	sp, sp, #4
    15e0:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    15e4:	eaffffa0 	b	146c <USBGetDescriptor>
    15e8:	e59f2224 	ldr	r2, [pc, #548]	; 1814 <USBHandleStandardRequest+0x2ec>
    15ec:	e5d22008 	ldrb	r2, [r2, #8]
    15f0:	ea00004d 	b	172c <USBHandleStandardRequest+0x204>
    15f4:	e59f3218 	ldr	r3, [pc, #536]	; 1814 <USBHandleStandardRequest+0x2ec>
    15f8:	e5935000 	ldr	r5, [r3]
    15fc:	e3550000 	cmp	r5, #0
    1600:	e1d460b2 	ldrh	r6, [r4, #2]
    1604:	1a000007 	bne	1628 <USBHandleStandardRequest+0x100>
    1608:	e3a030a5 	mov	r3, #165	; 0xa5
    160c:	e58d3000 	str	r3, [sp]
    1610:	e59f0204 	ldr	r0, [pc, #516]	; 181c <USBHandleStandardRequest+0x2f4>
    1614:	e59f1204 	ldr	r1, [pc, #516]	; 1820 <USBHandleStandardRequest+0x2f8>
    1618:	e59f2204 	ldr	r2, [pc, #516]	; 1824 <USBHandleStandardRequest+0x2fc>
    161c:	e59f3204 	ldr	r3, [pc, #516]	; 1828 <USBHandleStandardRequest+0x300>
    1620:	ebfffc18 	bl	688 <printf>
    1624:	eafffffe 	b	1624 <USBHandleStandardRequest+0xfc>
    1628:	e21660ff 	ands	r6, r6, #255	; 0xff
    162c:	13a030ff 	movne	r3, #255	; 0xff
    1630:	11a07003 	movne	r7, r3
    1634:	01a00006 	moveq	r0, r6
    1638:	1a000014 	bne	1690 <USBHandleStandardRequest+0x168>
    163c:	ea000017 	b	16a0 <USBHandleStandardRequest+0x178>
    1640:	e5d52001 	ldrb	r2, [r5, #1]
    1644:	e3520004 	cmp	r2, #4
    1648:	05d53003 	ldrbeq	r3, [r5, #3]
    164c:	0a00000d 	beq	1688 <USBHandleStandardRequest+0x160>
    1650:	e3520005 	cmp	r2, #5
    1654:	0a000002 	beq	1664 <USBHandleStandardRequest+0x13c>
    1658:	e3520002 	cmp	r2, #2
    165c:	05d57005 	ldrbeq	r7, [r5, #5]
    1660:	ea000008 	b	1688 <USBHandleStandardRequest+0x160>
    1664:	e3530000 	cmp	r3, #0
    1668:	01570006 	cmpeq	r7, r6
    166c:	1a000005 	bne	1688 <USBHandleStandardRequest+0x160>
    1670:	e5d53004 	ldrb	r3, [r5, #4]
    1674:	e5d51005 	ldrb	r1, [r5, #5]
    1678:	e5d50002 	ldrb	r0, [r5, #2]
    167c:	e1831401 	orr	r1, r3, r1, lsl #8
    1680:	ebfffce7 	bl	a24 <USBHwEPConfig>
    1684:	e3a03000 	mov	r3, #0
    1688:	e5d52000 	ldrb	r2, [r5]
    168c:	e0855002 	add	r5, r5, r2
    1690:	e5d52000 	ldrb	r2, [r5]
    1694:	e3520000 	cmp	r2, #0
    1698:	1affffe8 	bne	1640 <USBHandleStandardRequest+0x118>
    169c:	e3a00001 	mov	r0, #1
    16a0:	ebfffdb3 	bl	d74 <USBHwConfigDevice>
    16a4:	e1d420b2 	ldrh	r2, [r4, #2]
    16a8:	e59f3164 	ldr	r3, [pc, #356]	; 1814 <USBHandleStandardRequest+0x2ec>
    16ac:	e5c32008 	strb	r2, [r3, #8]
    16b0:	ea00001a 	b	1720 <USBHandleStandardRequest+0x1f8>
    16b4:	e59f0170 	ldr	r0, [pc, #368]	; 182c <USBHandleStandardRequest+0x304>
    16b8:	e3a01007 	mov	r1, #7
    16bc:	ea000050 	b	1804 <USBHandleStandardRequest+0x2dc>
    16c0:	e59f0168 	ldr	r0, [pc, #360]	; 1830 <USBHandleStandardRequest+0x308>
    16c4:	ea00004e 	b	1804 <USBHandleStandardRequest+0x2dc>
    16c8:	e5d41001 	ldrb	r1, [r4, #1]
    16cc:	e5963000 	ldr	r3, [r6]
    16d0:	e351000b 	cmp	r1, #11
    16d4:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    16d8:	ea00001b 	b	174c <USBHandleStandardRequest+0x224>
    16dc:	0000170c 	.word	0x0000170c
    16e0:	00001808 	.word	0x00001808
    16e4:	0000174c 	.word	0x0000174c
    16e8:	00001808 	.word	0x00001808
    16ec:	0000174c 	.word	0x0000174c
    16f0:	0000174c 	.word	0x0000174c
    16f4:	0000174c 	.word	0x0000174c
    16f8:	0000174c 	.word	0x0000174c
    16fc:	0000174c 	.word	0x0000174c
    1700:	0000174c 	.word	0x0000174c
    1704:	00001728 	.word	0x00001728
    1708:	0000173c 	.word	0x0000173c
    170c:	e3a02000 	mov	r2, #0
    1710:	e5c32000 	strb	r2, [r3]
    1714:	e5c32001 	strb	r2, [r3, #1]
    1718:	e3a03002 	mov	r3, #2
    171c:	e5853000 	str	r3, [r5]
    1720:	e3a00001 	mov	r0, #1
    1724:	ea000038 	b	180c <USBHandleStandardRequest+0x2e4>
    1728:	e3a02000 	mov	r2, #0
    172c:	e3a00001 	mov	r0, #1
    1730:	e5c32000 	strb	r2, [r3]
    1734:	e5850000 	str	r0, [r5]
    1738:	ea000033 	b	180c <USBHandleStandardRequest+0x2e4>
    173c:	e1d430b2 	ldrh	r3, [r4, #2]
    1740:	e3530000 	cmp	r3, #0
    1744:	0afffff4 	beq	171c <USBHandleStandardRequest+0x1f4>
    1748:	ea00002e 	b	1808 <USBHandleStandardRequest+0x2e0>
    174c:	e59f00e0 	ldr	r0, [pc, #224]	; 1834 <USBHandleStandardRequest+0x30c>
    1750:	ea00002b 	b	1804 <USBHandleStandardRequest+0x2dc>
    1754:	e5d41001 	ldrb	r1, [r4, #1]
    1758:	e5966000 	ldr	r6, [r6]
    175c:	e351000c 	cmp	r1, #12
    1760:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1764:	ea000025 	b	1800 <USBHandleStandardRequest+0x2d8>
    1768:	0000179c 	.word	0x0000179c
    176c:	000017c4 	.word	0x000017c4
    1770:	00001800 	.word	0x00001800
    1774:	000017d8 	.word	0x000017d8
    1778:	00001800 	.word	0x00001800
    177c:	00001800 	.word	0x00001800
    1780:	00001800 	.word	0x00001800
    1784:	00001800 	.word	0x00001800
    1788:	00001800 	.word	0x00001800
    178c:	00001800 	.word	0x00001800
    1790:	00001800 	.word	0x00001800
    1794:	00001800 	.word	0x00001800
    1798:	000017f4 	.word	0x000017f4
    179c:	e5d40004 	ldrb	r0, [r4, #4]
    17a0:	ebfffcf5 	bl	b7c <USBHwEPGetStatus>
    17a4:	e3100002 	tst	r0, #2
    17a8:	03a03000 	moveq	r3, #0
    17ac:	13a03001 	movne	r3, #1
    17b0:	e5c63000 	strb	r3, [r6]
    17b4:	e3a03000 	mov	r3, #0
    17b8:	e5c63001 	strb	r3, [r6, #1]
    17bc:	e2833002 	add	r3, r3, #2
    17c0:	eaffffd5 	b	171c <USBHandleStandardRequest+0x1f4>
    17c4:	e1d410b2 	ldrh	r1, [r4, #2]
    17c8:	e3510000 	cmp	r1, #0
    17cc:	05d40004 	ldrbeq	r0, [r4, #4]
    17d0:	1a00000c 	bne	1808 <USBHandleStandardRequest+0x2e0>
    17d4:	ea000004 	b	17ec <USBHandleStandardRequest+0x2c4>
    17d8:	e1d430b2 	ldrh	r3, [r4, #2]
    17dc:	e3530000 	cmp	r3, #0
    17e0:	1a000008 	bne	1808 <USBHandleStandardRequest+0x2e0>
    17e4:	e5d40004 	ldrb	r0, [r4, #4]
    17e8:	e3a01001 	mov	r1, #1
    17ec:	ebfffce7 	bl	b90 <USBHwEPStall>
    17f0:	eaffffca 	b	1720 <USBHandleStandardRequest+0x1f8>
    17f4:	e59f003c 	ldr	r0, [pc, #60]	; 1838 <USBHandleStandardRequest+0x310>
    17f8:	e3a0100c 	mov	r1, #12
    17fc:	ea000000 	b	1804 <USBHandleStandardRequest+0x2dc>
    1800:	e59f0034 	ldr	r0, [pc, #52]	; 183c <USBHandleStandardRequest+0x314>
    1804:	ebfffb9f 	bl	688 <printf>
    1808:	e3a00000 	mov	r0, #0
    180c:	e28dd004 	add	sp, sp, #4
    1810:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    1814:	4000028c 	.word	0x4000028c
    1818:	00001d89 	.word	0x00001d89
    181c:	00001c29 	.word	0x00001c29
    1820:	00001d56 	.word	0x00001d56
    1824:	00001d69 	.word	0x00001d69
    1828:	00001b94 	.word	0x00001b94
    182c:	00001d8d 	.word	0x00001d8d
    1830:	00001dac 	.word	0x00001dac
    1834:	00001dc3 	.word	0x00001dc3
    1838:	00001ddd 	.word	0x00001ddd
    183c:	00001df8 	.word	0x00001df8

00001840 <USBRegisterCustomReqHandler>:
    1840:	e59f3004 	ldr	r3, [pc, #4]	; 184c <USBRegisterCustomReqHandler+0xc>
    1844:	e5830004 	str	r0, [r3, #4]
    1848:	e12fff1e 	bx	lr
    184c:	4000028c 	.word	0x4000028c

00001850 <HandleUsbReset>:
    1850:	e3100010 	tst	r0, #16
    1854:	012fff1e 	bxeq	lr
    1858:	e59f0000 	ldr	r0, [pc, #0]	; 1860 <HandleUsbReset+0x10>
    185c:	eafffb89 	b	688 <printf>
    1860:	00001e0b 	.word	0x00001e0b

00001864 <USBInit>:
    1864:	e92d4010 	push	{r4, lr}
    1868:	e59f4050 	ldr	r4, [pc, #80]	; 18c0 <USBInit+0x5c>
    186c:	ebfffd91 	bl	eb8 <USBHwInit>
    1870:	e59f004c 	ldr	r0, [pc, #76]	; 18c4 <USBInit+0x60>
    1874:	ebfffc96 	bl	ad4 <USBHwRegisterDevIntHandler>
    1878:	e1a01004 	mov	r1, r4
    187c:	e3a00000 	mov	r0, #0
    1880:	ebfffc7c 	bl	a78 <USBHwRegisterEPIntHandler>
    1884:	e1a01004 	mov	r1, r4
    1888:	e3a00080 	mov	r0, #128	; 0x80
    188c:	ebfffc79 	bl	a78 <USBHwRegisterEPIntHandler>
    1890:	e3a00000 	mov	r0, #0
    1894:	e3a01040 	mov	r1, #64	; 0x40
    1898:	ebfffc61 	bl	a24 <USBHwEPConfig>
    189c:	e3a00080 	mov	r0, #128	; 0x80
    18a0:	e3a01040 	mov	r1, #64	; 0x40
    18a4:	ebfffc5e 	bl	a24 <USBHwEPConfig>
    18a8:	e3a00000 	mov	r0, #0
    18ac:	e59f1014 	ldr	r1, [pc, #20]	; 18c8 <USBInit+0x64>
    18b0:	e59f2014 	ldr	r2, [pc, #20]	; 18cc <USBInit+0x68>
    18b4:	ebfffec8 	bl	13dc <USBRegisterRequestHandler>
    18b8:	e3a00001 	mov	r0, #1
    18bc:	e8bd8010 	pop	{r4, pc}
    18c0:	0000123c 	.word	0x0000123c
    18c4:	00001850 	.word	0x00001850
    18c8:	00001528 	.word	0x00001528
    18cc:	40000298 	.word	0x40000298

000018d0 <__aeabi_uidiv>:
    18d0:	e2512001 	subs	r2, r1, #1
    18d4:	012fff1e 	bxeq	lr
    18d8:	3a000036 	bcc	19b8 <__aeabi_uidiv+0xe8>
    18dc:	e1500001 	cmp	r0, r1
    18e0:	9a000022 	bls	1970 <__aeabi_uidiv+0xa0>
    18e4:	e1110002 	tst	r1, r2
    18e8:	0a000023 	beq	197c <__aeabi_uidiv+0xac>
    18ec:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    18f0:	01a01181 	lsleq	r1, r1, #3
    18f4:	03a03008 	moveq	r3, #8
    18f8:	13a03001 	movne	r3, #1
    18fc:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1900:	31510000 	cmpcc	r1, r0
    1904:	31a01201 	lslcc	r1, r1, #4
    1908:	31a03203 	lslcc	r3, r3, #4
    190c:	3afffffa 	bcc	18fc <__aeabi_uidiv+0x2c>
    1910:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1914:	31510000 	cmpcc	r1, r0
    1918:	31a01081 	lslcc	r1, r1, #1
    191c:	31a03083 	lslcc	r3, r3, #1
    1920:	3afffffa 	bcc	1910 <__aeabi_uidiv+0x40>
    1924:	e3a02000 	mov	r2, #0
    1928:	e1500001 	cmp	r0, r1
    192c:	20400001 	subcs	r0, r0, r1
    1930:	21822003 	orrcs	r2, r2, r3
    1934:	e15000a1 	cmp	r0, r1, lsr #1
    1938:	204000a1 	subcs	r0, r0, r1, lsr #1
    193c:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1940:	e1500121 	cmp	r0, r1, lsr #2
    1944:	20400121 	subcs	r0, r0, r1, lsr #2
    1948:	21822123 	orrcs	r2, r2, r3, lsr #2
    194c:	e15001a1 	cmp	r0, r1, lsr #3
    1950:	204001a1 	subcs	r0, r0, r1, lsr #3
    1954:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1958:	e3500000 	cmp	r0, #0
    195c:	11b03223 	lsrsne	r3, r3, #4
    1960:	11a01221 	lsrne	r1, r1, #4
    1964:	1affffef 	bne	1928 <__aeabi_uidiv+0x58>
    1968:	e1a00002 	mov	r0, r2
    196c:	e12fff1e 	bx	lr
    1970:	03a00001 	moveq	r0, #1
    1974:	13a00000 	movne	r0, #0
    1978:	e12fff1e 	bx	lr
    197c:	e3510801 	cmp	r1, #65536	; 0x10000
    1980:	21a01821 	lsrcs	r1, r1, #16
    1984:	23a02010 	movcs	r2, #16
    1988:	33a02000 	movcc	r2, #0
    198c:	e3510c01 	cmp	r1, #256	; 0x100
    1990:	21a01421 	lsrcs	r1, r1, #8
    1994:	22822008 	addcs	r2, r2, #8
    1998:	e3510010 	cmp	r1, #16
    199c:	21a01221 	lsrcs	r1, r1, #4
    19a0:	22822004 	addcs	r2, r2, #4
    19a4:	e3510004 	cmp	r1, #4
    19a8:	82822003 	addhi	r2, r2, #3
    19ac:	908220a1 	addls	r2, r2, r1, lsr #1
    19b0:	e1a00230 	lsr	r0, r0, r2
    19b4:	e12fff1e 	bx	lr
    19b8:	e52de008 	str	lr, [sp, #-8]!
    19bc:	eb00003c 	bl	1ab4 <__div0>
    19c0:	e3a00000 	mov	r0, #0
    19c4:	e49df008 	ldr	pc, [sp], #8

000019c8 <__aeabi_uidivmod>:
    19c8:	e3510000 	cmp	r1, #0
    19cc:	0afffff9 	beq	19b8 <__aeabi_uidiv+0xe8>
    19d0:	e92d4003 	push	{r0, r1, lr}
    19d4:	ebffffbd 	bl	18d0 <__aeabi_uidiv>
    19d8:	e8bd4006 	pop	{r1, r2, lr}
    19dc:	e0030092 	mul	r3, r2, r0
    19e0:	e0411003 	sub	r1, r1, r3
    19e4:	e12fff1e 	bx	lr

000019e8 <__umodsi3>:
    19e8:	e2512001 	subs	r2, r1, #1
    19ec:	3a00002c 	bcc	1aa4 <__umodsi3+0xbc>
    19f0:	11500001 	cmpne	r0, r1
    19f4:	03a00000 	moveq	r0, #0
    19f8:	81110002 	tsthi	r1, r2
    19fc:	00000002 	andeq	r0, r0, r2
    1a00:	912fff1e 	bxls	lr
    1a04:	e3a02000 	mov	r2, #0
    1a08:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1a0c:	31510000 	cmpcc	r1, r0
    1a10:	31a01201 	lslcc	r1, r1, #4
    1a14:	32822004 	addcc	r2, r2, #4
    1a18:	3afffffa 	bcc	1a08 <__umodsi3+0x20>
    1a1c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1a20:	31510000 	cmpcc	r1, r0
    1a24:	31a01081 	lslcc	r1, r1, #1
    1a28:	32822001 	addcc	r2, r2, #1
    1a2c:	3afffffa 	bcc	1a1c <__umodsi3+0x34>
    1a30:	e2522003 	subs	r2, r2, #3
    1a34:	ba00000e 	blt	1a74 <__umodsi3+0x8c>
    1a38:	e1500001 	cmp	r0, r1
    1a3c:	20400001 	subcs	r0, r0, r1
    1a40:	e15000a1 	cmp	r0, r1, lsr #1
    1a44:	204000a1 	subcs	r0, r0, r1, lsr #1
    1a48:	e1500121 	cmp	r0, r1, lsr #2
    1a4c:	20400121 	subcs	r0, r0, r1, lsr #2
    1a50:	e15001a1 	cmp	r0, r1, lsr #3
    1a54:	204001a1 	subcs	r0, r0, r1, lsr #3
    1a58:	e3500001 	cmp	r0, #1
    1a5c:	e1a01221 	lsr	r1, r1, #4
    1a60:	a2522004 	subsge	r2, r2, #4
    1a64:	aafffff3 	bge	1a38 <__umodsi3+0x50>
    1a68:	e3120003 	tst	r2, #3
    1a6c:	13300000 	teqne	r0, #0
    1a70:	0a00000a 	beq	1aa0 <__umodsi3+0xb8>
    1a74:	e3720002 	cmn	r2, #2
    1a78:	ba000006 	blt	1a98 <__umodsi3+0xb0>
    1a7c:	0a000002 	beq	1a8c <__umodsi3+0xa4>
    1a80:	e1500001 	cmp	r0, r1
    1a84:	20400001 	subcs	r0, r0, r1
    1a88:	e1a010a1 	lsr	r1, r1, #1
    1a8c:	e1500001 	cmp	r0, r1
    1a90:	20400001 	subcs	r0, r0, r1
    1a94:	e1a010a1 	lsr	r1, r1, #1
    1a98:	e1500001 	cmp	r0, r1
    1a9c:	20400001 	subcs	r0, r0, r1
    1aa0:	e12fff1e 	bx	lr
    1aa4:	e52de008 	str	lr, [sp, #-8]!
    1aa8:	eb000001 	bl	1ab4 <__div0>
    1aac:	e3a00000 	mov	r0, #0
    1ab0:	e49df008 	ldr	pc, [sp], #8

00001ab4 <__div0>:
    1ab4:	e12fff1e 	bx	lr

00001ab8 <abDescriptors>:
    1ab8:	02000112 400000ff 0004ffff 02010100     .......@........
    1ac8:	02090103 01010020 09328000 02000004     .... .....2.....
    1ad8:	000000ff 02820507 07000040 40020505     ........@......@
    1ae8:	03040000 030e0409 0050004c 00550043     ........L.P.C.U.
    1af8:	00420053 004d031a 006d0065 0072006f     S.B...M.e.m.o.r.
    1b08:	00410079 00630063 00730065 03120073     y.A.c.c.e.s.s...
    1b18:	00450044 00440041 00300043 00450044     D.E.A.D.C.0.D.E.
    1b28:	00000000                                ....

00001b2c <__FUNCTION__.1347>:
    1b2c:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    1b3c:	6148746e 656c646e 00000072              ntHandler...

00001b48 <__FUNCTION__.1330>:
    1b48:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    1b58:	6e617254 72656673 00000000              Transfer....

00001b64 <__FUNCTION__.1337>:
    1b64:	52425355 73696765 52726574 65757165     USBRegisterReque
    1b74:	61487473 656c646e 00000072              stHandler...

00001b80 <__FUNCTION__.1326>:
    1b80:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    1b90:	00000000                                ....

00001b94 <__FUNCTION__.1340>:
    1b94:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    1ba4:	006e6f69 6c756e28 6400296c 00656e6f     ion.(null).done.
    1bb4:	44414552 6461203a 253d7264 6c202c58     READ: addr=%X, l
    1bc4:	253d6e65 57000a64 45544952 6461203a     en=%d..WRITE: ad
    1bd4:	253d7264 6c202c58 253d6e65 55000a64     dr=%X, len=%d..U
    1be4:	6e61686e 64656c64 616c6320 25207373     nhandled class %
    1bf4:	49000a58 6974696e 73696c61 20676e69     X..Initialising 
    1c04:	20425355 63617473 7453006b 69747261     USB stack.Starti
    1c14:	5520676e 63204253 756d6d6f 6163696e     ng USB communica
    1c24:	6e6f6974 73410a00 74726573 206e6f69     tion..Assertion 
    1c34:	27732527 69616620 2064656c 25206e69     '%s' failed in %
    1c44:	73253a73 21642523 6469000a 32333c78     s:%s#%d!..idx<32
    1c54:	62737500 6c5f7768 632e6370 67655200     .usbhw_lpc.c.Reg
    1c64:	65747369 20646572 646e6168 2072656c     istered handler 
    1c74:	20726f66 30205045 0a782578 67655200     for EP 0x%x..Reg
    1c84:	65747369 20646572 646e6168 2072656c     istered handler 
    1c94:	20726f66 69766564 73206563 75746174     for device statu
    1ca4:	65520073 74736967 64657265 6e616820     s.Registered han
    1cb4:	72656c64 726f6620 61726620 5300656d     dler for frame.S
    1cc4:	4c4c4154 206e6f20 2520005b 00783230     TALL on [. %02x.
    1cd4:	7473205d 253d7461 4e000a78 6168206f     ] stat=%x..No ha
    1ce4:	656c646e 6f662072 65722072 70797471     ndler for reqtyp
    1cf4:	64252065 003f000a 00782553 6e61485f     e %d..?.S%x._Han
    1d04:	52656c64 65757165 20317473 6c696166     dleRequest1 fail
    1d14:	5f006465 646e6148 6552656c 73657571     ed._HandleReques
    1d24:	66203274 656c6961 41460064 0045534c     t2 failed.FALSE.
    1d34:	63627375 72746e6f 632e6c6f 79546900     usbcontrol.c.iTy
    1d44:	3e206570 0030203d 70795469 203c2065     pe >= 0.iType < 
    1d54:	61700034 73654462 70697263 203d2120     4.pabDescrip != 
    1d64:	4c4c554e 62737500 72647473 632e7165     NULL.usbstdreq.c
    1d74:	73654400 78252063 746f6e20 756f6620     .Desc %x not fou
    1d84:	0a21646e 78254400 76654400 20656369     nd!..D%x.Device 
    1d94:	20716572 6e206425 6920746f 656c706d     req %d not imple
    1da4:	746e656d 000a6465 656c6c49 206c6167     mented..Illegal 
    1db4:	69766564 72206563 25207165 49000a64     device req %d..I
    1dc4:	67656c6c 69206c61 7265746e 65636166     llegal interface
    1dd4:	71657220 0a642520 20504500 20716572      req %d..EP req 
    1de4:	6e206425 6920746f 656c706d 746e656d     %d not implement
    1df4:	000a6465 656c6c49 206c6167 72205045     ed..Illegal EP r
    1e04:	25207165 0a000a64 00000021                       eq %d...!.
