
hid.elf:     file format elf32-littlearm


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
      bc:	ea000217 	b	920 <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	00001e2e 	.word	0x00001e2e
      c8:	40000200 	.word	0x40000200
      cc:	40000258 	.word	0x40000258
      d0:	40000258 	.word	0x40000258
      d4:	400002f8 	.word	0x400002f8

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
     410:	eb00057e 	bl	1a10 <__umodsi3>
     414:	e3500009 	cmp	r0, #9
     418:	c59d3000 	ldrgt	r3, [sp]
     41c:	c0800003 	addgt	r0, r0, r3
     420:	e2800030 	add	r0, r0, #48	; 0x30
     424:	e5690001 	strb	r0, [r9, #-1]!
     428:	e1a01007 	mov	r1, r7
     42c:	e1a00008 	mov	r0, r8
     430:	eb000530 	bl	18f8 <__aeabi_uidiv>
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
     684:	00001bc8 	.word	0x00001bc8

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

000007b4 <HandleFrame>:
     7b4:	e92d4010 	push	{r4, lr}
     7b8:	e59f4044 	ldr	r4, [pc, #68]	; 804 <HandleFrame+0x50>
     7bc:	e5943000 	ldr	r3, [r4]
     7c0:	e2833001 	add	r3, r3, #1
     7c4:	e3530ffa 	cmp	r3, #1000	; 0x3e8
     7c8:	e5843000 	str	r3, [r4]
     7cc:	d8bd8010 	pople	{r4, pc}
     7d0:	e5943004 	ldr	r3, [r4, #4]
     7d4:	e59f102c 	ldr	r1, [pc, #44]	; 808 <HandleFrame+0x54>
     7d8:	e1a02443 	asr	r2, r3, #8
     7dc:	e5c12000 	strb	r2, [r1]
     7e0:	e5c13001 	strb	r3, [r1, #1]
     7e4:	e3a00081 	mov	r0, #129	; 0x81
     7e8:	e2833001 	add	r3, r3, #1
     7ec:	e3a02004 	mov	r2, #4
     7f0:	e5843004 	str	r3, [r4, #4]
     7f4:	eb0000f7 	bl	bd8 <USBHwEPWrite>
     7f8:	e3a03000 	mov	r3, #0
     7fc:	e5843000 	str	r3, [r4]
     800:	e8bd8010 	pop	{r4, pc}
     804:	40000258 	.word	0x40000258
     808:	40000200 	.word	0x40000200

0000080c <HandleClassRequest>:
     80c:	e92d4070 	push	{r4, r5, r6, lr}
     810:	e1a05001 	mov	r5, r1
     814:	e5d01001 	ldrb	r1, [r0, #1]
     818:	e3510002 	cmp	r1, #2
     81c:	e1a04000 	mov	r4, r0
     820:	e5926000 	ldr	r6, [r2]
     824:	0a000002 	beq	834 <HandleClassRequest+0x28>
     828:	e351000a 	cmp	r1, #10
     82c:	1a000019 	bne	898 <HandleClassRequest+0x8c>
     830:	ea00000d 	b	86c <HandleClassRequest+0x60>
     834:	e1d420b4 	ldrh	r2, [r4, #4]
     838:	e59f0068 	ldr	r0, [pc, #104]	; 8a8 <HandleClassRequest+0x9c>
     83c:	e1d410b2 	ldrh	r1, [r4, #2]
     840:	ebffff90 	bl	688 <printf>
     844:	e59f3060 	ldr	r3, [pc, #96]	; 8ac <HandleClassRequest+0xa0>
     848:	e5933008 	ldr	r3, [r3, #8]
     84c:	e2832003 	add	r2, r3, #3
     850:	e3530000 	cmp	r3, #0
     854:	b1a03002 	movlt	r3, r2
     858:	e1a03143 	asr	r3, r3, #2
     85c:	e3a00001 	mov	r0, #1
     860:	e5c63000 	strb	r3, [r6]
     864:	e5850000 	str	r0, [r5]
     868:	e8bd8070 	pop	{r4, r5, r6, pc}
     86c:	e1d420b4 	ldrh	r2, [r4, #4]
     870:	e59f0038 	ldr	r0, [pc, #56]	; 8b0 <HandleClassRequest+0xa4>
     874:	e1d410b2 	ldrh	r1, [r4, #2]
     878:	ebffff82 	bl	688 <printf>
     87c:	e1d420b2 	ldrh	r2, [r4, #2]
     880:	e59f3024 	ldr	r3, [pc, #36]	; 8ac <HandleClassRequest+0xa0>
     884:	e1a02422 	lsr	r2, r2, #8
     888:	e1a02102 	lsl	r2, r2, #2
     88c:	e5832008 	str	r2, [r3, #8]
     890:	e3a00001 	mov	r0, #1
     894:	e8bd8070 	pop	{r4, r5, r6, pc}
     898:	e59f0014 	ldr	r0, [pc, #20]	; 8b4 <HandleClassRequest+0xa8>
     89c:	ebffff79 	bl	688 <printf>
     8a0:	e3a00000 	mov	r0, #0
     8a4:	e8bd8070 	pop	{r4, r5, r6, pc}
     8a8:	00001bcf 	.word	0x00001bcf
     8ac:	40000258 	.word	0x40000258
     8b0:	00001be9 	.word	0x00001be9
     8b4:	00001c03 	.word	0x00001c03

000008b8 <HIDHandleStdReq>:
     8b8:	e92d4010 	push	{r4, lr}
     8bc:	e1a03002 	mov	r3, r2
     8c0:	e1a04001 	mov	r4, r1
     8c4:	e59f204c 	ldr	r2, [pc, #76]	; 918 <HIDHandleStdReq+0x60>
     8c8:	e1d010b0 	ldrh	r1, [r0]
     8cc:	e1510002 	cmp	r1, r2
     8d0:	e1a0c000 	mov	ip, r0
     8d4:	1a00000d 	bne	910 <HIDHandleStdReq+0x58>
     8d8:	e1d000b2 	ldrh	r0, [r0, #2]
     8dc:	e1a02420 	lsr	r2, r0, #8
     8e0:	e3520022 	cmp	r2, #34	; 0x22
     8e4:	1a000005 	bne	900 <HIDHandleStdReq+0x48>
     8e8:	e59f202c 	ldr	r2, [pc, #44]	; 91c <HIDHandleStdReq+0x64>
     8ec:	e5832000 	str	r2, [r3]
     8f0:	e3a0304d 	mov	r3, #77	; 0x4d
     8f4:	e5843000 	str	r3, [r4]
     8f8:	e3a00001 	mov	r0, #1
     8fc:	e8bd8010 	pop	{r4, pc}
     900:	e1dc10b4 	ldrh	r1, [ip, #4]
     904:	e1a02004 	mov	r2, r4
     908:	e8bd4010 	pop	{r4, lr}
     90c:	ea0002e0 	b	1494 <USBGetDescriptor>
     910:	e3a00000 	mov	r0, #0
     914:	e8bd8010 	pop	{r4, pc}
     918:	00000681 	.word	0x00000681
     91c:	40000208 	.word	0x40000208

00000920 <main>:
     920:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     924:	ebfffdf6 	bl	104 <HalSysInit>
     928:	e3a00027 	mov	r0, #39	; 0x27
     92c:	ebffff6a 	bl	6dc <ConsoleInit>
     930:	e59f0050 	ldr	r0, [pc, #80]	; 988 <main+0x68>
     934:	ebffff93 	bl	788 <puts>
     938:	eb0003d3 	bl	188c <USBInit>
     93c:	e59f0048 	ldr	r0, [pc, #72]	; 98c <main+0x6c>
     940:	eb0002cf 	bl	1484 <USBRegisterDescriptors>
     944:	e59f0044 	ldr	r0, [pc, #68]	; 990 <main+0x70>
     948:	eb0003c6 	bl	1868 <USBRegisterCustomReqHandler>
     94c:	e59f2040 	ldr	r2, [pc, #64]	; 994 <main+0x74>
     950:	e3a00001 	mov	r0, #1
     954:	e59f103c 	ldr	r1, [pc, #60]	; 998 <main+0x78>
     958:	eb0002a9 	bl	1404 <USBRegisterRequestHandler>
     95c:	e3a01000 	mov	r1, #0
     960:	e3a00081 	mov	r0, #129	; 0x81
     964:	eb00004d 	bl	aa0 <USBHwRegisterEPIntHandler>
     968:	e59f002c 	ldr	r0, [pc, #44]	; 99c <main+0x7c>
     96c:	eb00006d 	bl	b28 <USBHwRegisterFrameHandler>
     970:	e59f0028 	ldr	r0, [pc, #40]	; 9a0 <main+0x80>
     974:	ebffff83 	bl	788 <puts>
     978:	e3a00001 	mov	r0, #1
     97c:	eb000079 	bl	b68 <USBHwConnect>
     980:	eb000109 	bl	dac <USBHwISR>
     984:	eafffffd 	b	980 <main+0x60>
     988:	00001c17 	.word	0x00001c17
     98c:	00001ae0 	.word	0x00001ae0
     990:	000008b8 	.word	0x000008b8
     994:	40000264 	.word	0x40000264
     998:	0000080c 	.word	0x0000080c
     99c:	000007b4 	.word	0x000007b4
     9a0:	00001c2e 	.word	0x00001c2e

000009a4 <Wait4DevInt>:
     9a4:	e59f3018 	ldr	r3, [pc, #24]	; 9c4 <Wait4DevInt+0x20>
     9a8:	e5132dff 	ldr	r2, [r3, #-3583]	; 0xdff
     9ac:	e0002002 	and	r2, r0, r2
     9b0:	e1520000 	cmp	r2, r0
     9b4:	1afffffb 	bne	9a8 <Wait4DevInt+0x4>
     9b8:	e59f3004 	ldr	r3, [pc, #4]	; 9c4 <Wait4DevInt+0x20>
     9bc:	e5030df7 	str	r0, [r3, #-3575]	; 0xdf7
     9c0:	e12fff1e 	bx	lr
     9c4:	ffe0cfff 	.word	0xffe0cfff

000009c8 <USBHwCmd>:
     9c8:	e59f3018 	ldr	r3, [pc, #24]	; 9e8 <USBHwCmd+0x20>
     9cc:	e1a00800 	lsl	r0, r0, #16
     9d0:	e3a02030 	mov	r2, #48	; 0x30
     9d4:	e3800c05 	orr	r0, r0, #1280	; 0x500
     9d8:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     9dc:	e5030def 	str	r0, [r3, #-3567]	; 0xdef
     9e0:	e3a00010 	mov	r0, #16
     9e4:	eaffffee 	b	9a4 <Wait4DevInt>
     9e8:	ffe0cfff 	.word	0xffe0cfff

000009ec <USBHwCmdWrite>:
     9ec:	e92d4010 	push	{r4, lr}
     9f0:	e1a04001 	mov	r4, r1
     9f4:	ebfffff3 	bl	9c8 <USBHwCmd>
     9f8:	e1a04804 	lsl	r4, r4, #16
     9fc:	e59f3010 	ldr	r3, [pc, #16]	; a14 <USBHwCmdWrite+0x28>
     a00:	e3844c01 	orr	r4, r4, #256	; 0x100
     a04:	e3a00010 	mov	r0, #16
     a08:	e5034def 	str	r4, [r3, #-3567]	; 0xdef
     a0c:	e8bd4010 	pop	{r4, lr}
     a10:	eaffffe3 	b	9a4 <Wait4DevInt>
     a14:	ffe0cfff 	.word	0xffe0cfff

00000a18 <USBHwCmdRead>:
     a18:	e92d4010 	push	{r4, lr}
     a1c:	e1a04000 	mov	r4, r0
     a20:	e1a04804 	lsl	r4, r4, #16
     a24:	ebffffe7 	bl	9c8 <USBHwCmd>
     a28:	e3843c02 	orr	r3, r4, #512	; 0x200
     a2c:	e59f4014 	ldr	r4, [pc, #20]	; a48 <USBHwCmdRead+0x30>
     a30:	e3a00020 	mov	r0, #32
     a34:	e5043def 	str	r3, [r4, #-3567]	; 0xdef
     a38:	ebffffd9 	bl	9a4 <Wait4DevInt>
     a3c:	e5140deb 	ldr	r0, [r4, #-3563]	; 0xdeb
     a40:	e20000ff 	and	r0, r0, #255	; 0xff
     a44:	e8bd8010 	pop	{r4, pc}
     a48:	ffe0cfff 	.word	0xffe0cfff

00000a4c <USBHwEPConfig>:
     a4c:	e20030ff 	and	r3, r0, #255	; 0xff
     a50:	e92d4010 	push	{r4, lr}
     a54:	e1a033a3 	lsr	r3, r3, #7
     a58:	e200400f 	and	r4, r0, #15
     a5c:	e1834084 	orr	r4, r3, r4, lsl #1
     a60:	e59f3034 	ldr	r3, [pc, #52]	; a9c <USBHwEPConfig+0x50>
     a64:	e5132dbb 	ldr	r2, [r3, #-3515]	; 0xdbb
     a68:	e3a00001 	mov	r0, #1
     a6c:	e1822410 	orr	r2, r2, r0, lsl r4
     a70:	e1a01801 	lsl	r1, r1, #16
     a74:	e1a01821 	lsr	r1, r1, #16
     a78:	e5032dbb 	str	r2, [r3, #-3515]	; 0xdbb
     a7c:	e28000ff 	add	r0, r0, #255	; 0xff
     a80:	e5034db7 	str	r4, [r3, #-3511]	; 0xdb7
     a84:	e5031db3 	str	r1, [r3, #-3507]	; 0xdb3
     a88:	ebffffc5 	bl	9a4 <Wait4DevInt>
     a8c:	e3840040 	orr	r0, r4, #64	; 0x40
     a90:	e3a01000 	mov	r1, #0
     a94:	e8bd4010 	pop	{r4, lr}
     a98:	eaffffd3 	b	9ec <USBHwCmdWrite>
     a9c:	ffe0cfff 	.word	0xffe0cfff

00000aa0 <USBHwRegisterEPIntHandler>:
     aa0:	e20030ff 	and	r3, r0, #255	; 0xff
     aa4:	e1a023a3 	lsr	r2, r3, #7
     aa8:	e200000f 	and	r0, r0, #15
     aac:	e1820080 	orr	r0, r2, r0, lsl #1
     ab0:	e59f2038 	ldr	r2, [pc, #56]	; af0 <USBHwRegisterEPIntHandler+0x50>
     ab4:	e1a0c0a0 	lsr	ip, r0, #1
     ab8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     abc:	e782110c 	str	r1, [r2, ip, lsl #2]
     ac0:	e59f202c 	ldr	r2, [pc, #44]	; af4 <USBHwRegisterEPIntHandler+0x54>
     ac4:	e5121dcb 	ldr	r1, [r2, #-3531]	; 0xdcb
     ac8:	e3a0c001 	mov	ip, #1
     acc:	e181001c 	orr	r0, r1, ip, lsl r0
     ad0:	e5020dcb 	str	r0, [r2, #-3531]	; 0xdcb
     ad4:	e5121dfb 	ldr	r1, [r2, #-3579]	; 0xdfb
     ad8:	e59f0018 	ldr	r0, [pc, #24]	; af8 <USBHwRegisterEPIntHandler+0x58>
     adc:	e3811004 	orr	r1, r1, #4
     ae0:	e5021dfb 	str	r1, [r2, #-3579]	; 0xdfb
     ae4:	e1a01003 	mov	r1, r3
     ae8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     aec:	eafffee5 	b	688 <printf>
     af0:	40000268 	.word	0x40000268
     af4:	ffe0cfff 	.word	0xffe0cfff
     af8:	00001c81 	.word	0x00001c81

00000afc <USBHwRegisterDevIntHandler>:
     afc:	e59f3018 	ldr	r3, [pc, #24]	; b1c <USBHwRegisterDevIntHandler+0x20>
     b00:	e5830040 	str	r0, [r3, #64]	; 0x40
     b04:	e59f3014 	ldr	r3, [pc, #20]	; b20 <USBHwRegisterDevIntHandler+0x24>
     b08:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     b0c:	e59f0010 	ldr	r0, [pc, #16]	; b24 <USBHwRegisterDevIntHandler+0x28>
     b10:	e3822008 	orr	r2, r2, #8
     b14:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     b18:	eaffff1a 	b	788 <puts>
     b1c:	40000268 	.word	0x40000268
     b20:	ffe0cfff 	.word	0xffe0cfff
     b24:	00001ca1 	.word	0x00001ca1

00000b28 <USBHwRegisterFrameHandler>:
     b28:	e59f3018 	ldr	r3, [pc, #24]	; b48 <USBHwRegisterFrameHandler+0x20>
     b2c:	e5830044 	str	r0, [r3, #68]	; 0x44
     b30:	e59f3014 	ldr	r3, [pc, #20]	; b4c <USBHwRegisterFrameHandler+0x24>
     b34:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     b38:	e59f0010 	ldr	r0, [pc, #16]	; b50 <USBHwRegisterFrameHandler+0x28>
     b3c:	e3822001 	orr	r2, r2, #1
     b40:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     b44:	eaffff0f 	b	788 <puts>
     b48:	40000268 	.word	0x40000268
     b4c:	ffe0cfff 	.word	0xffe0cfff
     b50:	00001cc6 	.word	0x00001cc6

00000b54 <USBHwSetAddress>:
     b54:	e1e01c80 	mvn	r1, r0, lsl #25
     b58:	e1e01ca1 	mvn	r1, r1, lsr #25
     b5c:	e20110ff 	and	r1, r1, #255	; 0xff
     b60:	e3a000d0 	mov	r0, #208	; 0xd0
     b64:	eaffffa0 	b	9ec <USBHwCmdWrite>

00000b68 <USBHwConnect>:
     b68:	e2501000 	subs	r1, r0, #0
     b6c:	159f3020 	ldrne	r3, [pc, #32]	; b94 <USBHwConnect+0x2c>
     b70:	059f301c 	ldreq	r3, [pc, #28]	; b94 <USBHwConnect+0x2c>
     b74:	13a02901 	movne	r2, #16384	; 0x4000
     b78:	03a02901 	moveq	r2, #16384	; 0x4000
     b7c:	15032fe3 	strne	r2, [r3, #-4067]	; 0xfe3
     b80:	05032fe7 	streq	r2, [r3, #-4071]	; 0xfe7
     b84:	e3a000fe 	mov	r0, #254	; 0xfe
     b88:	e2511000 	subs	r1, r1, #0
     b8c:	13a01001 	movne	r1, #1
     b90:	eaffff95 	b	9ec <USBHwCmdWrite>
     b94:	3fffcfff 	.word	0x3fffcfff

00000b98 <USBHwNakIntEnable>:
     b98:	e20010ff 	and	r1, r0, #255	; 0xff
     b9c:	e3a000f3 	mov	r0, #243	; 0xf3
     ba0:	eaffff91 	b	9ec <USBHwCmdWrite>

00000ba4 <USBHwEPGetStatus>:
     ba4:	e20030ff 	and	r3, r0, #255	; 0xff
     ba8:	e1a033a3 	lsr	r3, r3, #7
     bac:	e200000f 	and	r0, r0, #15
     bb0:	e1830080 	orr	r0, r3, r0, lsl #1
     bb4:	eaffff97 	b	a18 <USBHwCmdRead>

00000bb8 <USBHwEPStall>:
     bb8:	e20030ff 	and	r3, r0, #255	; 0xff
     bbc:	e1a033a3 	lsr	r3, r3, #7
     bc0:	e200000f 	and	r0, r0, #15
     bc4:	e1830080 	orr	r0, r3, r0, lsl #1
     bc8:	e3800040 	orr	r0, r0, #64	; 0x40
     bcc:	e2511000 	subs	r1, r1, #0
     bd0:	13a01001 	movne	r1, #1
     bd4:	eaffff84 	b	9ec <USBHwCmdWrite>

00000bd8 <USBHwEPWrite>:
     bd8:	e92d4010 	push	{r4, lr}
     bdc:	e1a04002 	mov	r4, r2
     be0:	e20020ff 	and	r2, r0, #255	; 0xff
     be4:	e200300f 	and	r3, r0, #15
     be8:	e1a003a2 	lsr	r0, r2, #7
     bec:	e1800083 	orr	r0, r0, r3, lsl #1
     bf0:	e1a03103 	lsl	r3, r3, #2
     bf4:	e3832002 	orr	r2, r3, #2
     bf8:	e59f3058 	ldr	r3, [pc, #88]	; c58 <USBHwEPWrite+0x80>
     bfc:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     c00:	e5034ddb 	str	r4, [r3, #-3547]	; 0xddb
     c04:	ea000008 	b	c2c <USBHwEPWrite+0x54>
     c08:	e5512002 	ldrb	r2, [r1, #-2]
     c0c:	e551c001 	ldrb	ip, [r1, #-1]
     c10:	e1a02802 	lsl	r2, r2, #16
     c14:	e1822c0c 	orr	r2, r2, ip, lsl #24
     c18:	e551c004 	ldrb	ip, [r1, #-4]
     c1c:	e182200c 	orr	r2, r2, ip
     c20:	e551c003 	ldrb	ip, [r1, #-3]
     c24:	e182240c 	orr	r2, r2, ip, lsl #8
     c28:	e5032de3 	str	r2, [r3, #-3555]	; 0xde3
     c2c:	e5132dd7 	ldr	r2, [r3, #-3543]	; 0xdd7
     c30:	e2122002 	ands	r2, r2, #2
     c34:	e2811004 	add	r1, r1, #4
     c38:	1afffff2 	bne	c08 <USBHwEPWrite+0x30>
     c3c:	e59f3014 	ldr	r3, [pc, #20]	; c58 <USBHwEPWrite+0x80>
     c40:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     c44:	ebffff5f 	bl	9c8 <USBHwCmd>
     c48:	e3a000fa 	mov	r0, #250	; 0xfa
     c4c:	ebffff5d 	bl	9c8 <USBHwCmd>
     c50:	e1a00004 	mov	r0, r4
     c54:	e8bd8010 	pop	{r4, pc}
     c58:	ffe0cfff 	.word	0xffe0cfff

00000c5c <USBHwEPRead>:
     c5c:	e200c0ff 	and	ip, r0, #255	; 0xff
     c60:	e200000f 	and	r0, r0, #15
     c64:	e92d4030 	push	{r4, r5, lr}
     c68:	e59f3084 	ldr	r3, [pc, #132]	; cf4 <USBHwEPRead+0x98>
     c6c:	e1a04100 	lsl	r4, r0, #2
     c70:	e3844001 	orr	r4, r4, #1
     c74:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
     c78:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
     c7c:	e3140b02 	tst	r4, #2048	; 0x800
     c80:	0afffffc 	beq	c78 <USBHwEPRead+0x1c>
     c84:	e3140b01 	tst	r4, #1024	; 0x400
     c88:	03e04000 	mvneq	r4, #0
     c8c:	0a000016 	beq	cec <USBHwEPRead+0x90>
     c90:	e1a04b04 	lsl	r4, r4, #22
     c94:	e3a0e000 	mov	lr, #0
     c98:	e1a04b24 	lsr	r4, r4, #22
     c9c:	e1a0300e 	mov	r3, lr
     ca0:	e59f504c 	ldr	r5, [pc, #76]	; cf4 <USBHwEPRead+0x98>
     ca4:	ea000006 	b	cc4 <USBHwEPRead+0x68>
     ca8:	e3130003 	tst	r3, #3
     cac:	0515ede7 	ldreq	lr, [r5, #-3559]	; 0xde7
     cb0:	e3510000 	cmp	r1, #0
     cb4:	11530002 	cmpne	r3, r2
     cb8:	b7c1e003 	strblt	lr, [r1, r3]
     cbc:	e1a0e42e 	lsr	lr, lr, #8
     cc0:	e2833001 	add	r3, r3, #1
     cc4:	e1530004 	cmp	r3, r4
     cc8:	1afffff6 	bne	ca8 <USBHwEPRead+0x4c>
     ccc:	e59f3020 	ldr	r3, [pc, #32]	; cf4 <USBHwEPRead+0x98>
     cd0:	e3a02000 	mov	r2, #0
     cd4:	e1a0c3ac 	lsr	ip, ip, #7
     cd8:	e18c0080 	orr	r0, ip, r0, lsl #1
     cdc:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     ce0:	ebffff38 	bl	9c8 <USBHwCmd>
     ce4:	e3a000f2 	mov	r0, #242	; 0xf2
     ce8:	ebffff36 	bl	9c8 <USBHwCmd>
     cec:	e1a00004 	mov	r0, r4
     cf0:	e8bd8030 	pop	{r4, r5, pc}
     cf4:	ffe0cfff 	.word	0xffe0cfff

00000cf8 <USBHwISOCEPRead>:
     cf8:	e200c0ff 	and	ip, r0, #255	; 0xff
     cfc:	e200000f 	and	r0, r0, #15
     d00:	e92d4030 	push	{r4, r5, lr}
     d04:	e59f308c 	ldr	r3, [pc, #140]	; d98 <USBHwISOCEPRead+0xa0>
     d08:	e1a04100 	lsl	r4, r0, #2
     d0c:	e3844001 	orr	r4, r4, #1
     d10:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
     d14:	e1a00000 	nop			; (mov r0, r0)
     d18:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
     d1c:	e2145b02 	ands	r5, r4, #2048	; 0x800
     d20:	0a000001 	beq	d2c <USBHwISOCEPRead+0x34>
     d24:	e2145b01 	ands	r5, r4, #1024	; 0x400
     d28:	1a000002 	bne	d38 <USBHwISOCEPRead+0x40>
     d2c:	e5035dd7 	str	r5, [r3, #-3543]	; 0xdd7
     d30:	e3e04000 	mvn	r4, #0
     d34:	ea000015 	b	d90 <USBHwISOCEPRead+0x98>
     d38:	e1a04b04 	lsl	r4, r4, #22
     d3c:	e3a05000 	mov	r5, #0
     d40:	e1a04b24 	lsr	r4, r4, #22
     d44:	e1a0e005 	mov	lr, r5
     d48:	ea000006 	b	d68 <USBHwISOCEPRead+0x70>
     d4c:	e31e0003 	tst	lr, #3
     d50:	05135de7 	ldreq	r5, [r3, #-3559]	; 0xde7
     d54:	e3510000 	cmp	r1, #0
     d58:	115e0002 	cmpne	lr, r2
     d5c:	b7c1500e 	strblt	r5, [r1, lr]
     d60:	e1a05425 	lsr	r5, r5, #8
     d64:	e28ee001 	add	lr, lr, #1
     d68:	e15e0004 	cmp	lr, r4
     d6c:	1afffff6 	bne	d4c <USBHwISOCEPRead+0x54>
     d70:	e59f3020 	ldr	r3, [pc, #32]	; d98 <USBHwISOCEPRead+0xa0>
     d74:	e3a02000 	mov	r2, #0
     d78:	e1a0c3ac 	lsr	ip, ip, #7
     d7c:	e18c0080 	orr	r0, ip, r0, lsl #1
     d80:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     d84:	ebffff0f 	bl	9c8 <USBHwCmd>
     d88:	e3a000f2 	mov	r0, #242	; 0xf2
     d8c:	ebffff0d 	bl	9c8 <USBHwCmd>
     d90:	e1a00004 	mov	r0, r4
     d94:	e8bd8030 	pop	{r4, r5, pc}
     d98:	ffe0cfff 	.word	0xffe0cfff

00000d9c <USBHwConfigDevice>:
     d9c:	e2501000 	subs	r1, r0, #0
     da0:	13a01001 	movne	r1, #1
     da4:	e3a000d8 	mov	r0, #216	; 0xd8
     da8:	eaffff0f 	b	9ec <USBHwCmdWrite>

00000dac <USBHwISR>:
     dac:	e59f3120 	ldr	r3, [pc, #288]	; ed4 <USBHwISR+0x128>
     db0:	e3a02002 	mov	r2, #2
     db4:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
     db8:	e5032fa7 	str	r2, [r3, #-4007]	; 0xfa7
     dbc:	e59f3114 	ldr	r3, [pc, #276]	; ed8 <USBHwISR+0x12c>
     dc0:	e5134dff 	ldr	r4, [r3, #-3583]	; 0xdff
     dc4:	e3140001 	tst	r4, #1
     dc8:	0a000009 	beq	df4 <USBHwISR+0x48>
     dcc:	e3a02001 	mov	r2, #1
     dd0:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     dd4:	e59f3100 	ldr	r3, [pc, #256]	; edc <USBHwISR+0x130>
     dd8:	e5935044 	ldr	r5, [r3, #68]	; 0x44
     ddc:	e3550000 	cmp	r5, #0
     de0:	0a000003 	beq	df4 <USBHwISR+0x48>
     de4:	e3a000f5 	mov	r0, #245	; 0xf5
     de8:	ebffff0a 	bl	a18 <USBHwCmdRead>
     dec:	e1a0e00f 	mov	lr, pc
     df0:	e12fff15 	bx	r5
     df4:	e3140008 	tst	r4, #8
     df8:	0a000011 	beq	e44 <USBHwISR+0x98>
     dfc:	e59f30d4 	ldr	r3, [pc, #212]	; ed8 <USBHwISR+0x12c>
     e00:	e3a02008 	mov	r2, #8
     e04:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     e08:	e3a000fe 	mov	r0, #254	; 0xfe
     e0c:	ebffff01 	bl	a18 <USBHwCmdRead>
     e10:	e310001a 	tst	r0, #26
     e14:	0a00000a 	beq	e44 <USBHwISR+0x98>
     e18:	e59f30bc 	ldr	r3, [pc, #188]	; edc <USBHwISR+0x130>
     e1c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
     e20:	e3530000 	cmp	r3, #0
     e24:	0a000006 	beq	e44 <USBHwISR+0x98>
     e28:	e59f50a4 	ldr	r5, [pc, #164]	; ed4 <USBHwISR+0x128>
     e2c:	e3a06001 	mov	r6, #1
     e30:	e5056fa7 	str	r6, [r5, #-4007]	; 0xfa7
     e34:	e2000015 	and	r0, r0, #21
     e38:	e1a0e00f 	mov	lr, pc
     e3c:	e12fff13 	bx	r3
     e40:	e5056fa3 	str	r6, [r5, #-4003]	; 0xfa3
     e44:	e3140004 	tst	r4, #4
     e48:	0a00001d 	beq	ec4 <USBHwISR+0x118>
     e4c:	e59f5084 	ldr	r5, [pc, #132]	; ed8 <USBHwISR+0x12c>
     e50:	e3a06004 	mov	r6, #4
     e54:	e5056df7 	str	r6, [r5, #-3575]	; 0xdf7
     e58:	e59f807c 	ldr	r8, [pc, #124]	; edc <USBHwISR+0x130>
     e5c:	e59f7070 	ldr	r7, [pc, #112]	; ed4 <USBHwISR+0x128>
     e60:	e3a04000 	mov	r4, #0
     e64:	e3a0a001 	mov	sl, #1
     e68:	e1a0341a 	lsl	r3, sl, r4
     e6c:	e5152dcf 	ldr	r2, [r5, #-3535]	; 0xdcf
     e70:	e1130002 	tst	r3, r2
     e74:	0a00000f 	beq	eb8 <USBHwISR+0x10c>
     e78:	e5053dc7 	str	r3, [r5, #-3527]	; 0xdc7
     e7c:	e3a00020 	mov	r0, #32
     e80:	ebfffec7 	bl	9a4 <Wait4DevInt>
     e84:	e1a020c4 	asr	r2, r4, #1
     e88:	e7983102 	ldr	r3, [r8, r2, lsl #2]
     e8c:	e3530000 	cmp	r3, #0
     e90:	e5151deb 	ldr	r1, [r5, #-3563]	; 0xdeb
     e94:	0a000007 	beq	eb8 <USBHwISR+0x10c>
     e98:	e202200f 	and	r2, r2, #15
     e9c:	e1820384 	orr	r0, r2, r4, lsl #7
     ea0:	e5076fa7 	str	r6, [r7, #-4007]	; 0xfa7
     ea4:	e200008f 	and	r0, r0, #143	; 0x8f
     ea8:	e201101f 	and	r1, r1, #31
     eac:	e1a0e00f 	mov	lr, pc
     eb0:	e12fff13 	bx	r3
     eb4:	e5076fa3 	str	r6, [r7, #-4003]	; 0xfa3
     eb8:	e2844001 	add	r4, r4, #1
     ebc:	e3540020 	cmp	r4, #32
     ec0:	1affffe8 	bne	e68 <USBHwISR+0xbc>
     ec4:	e59f3008 	ldr	r3, [pc, #8]	; ed4 <USBHwISR+0x128>
     ec8:	e3a02002 	mov	r2, #2
     ecc:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
     ed0:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
     ed4:	3fffcfff 	.word	0x3fffcfff
     ed8:	ffe0cfff 	.word	0xffe0cfff
     edc:	40000268 	.word	0x40000268

00000ee0 <USBHwInit>:
     ee0:	e59f312c 	ldr	r3, [pc, #300]	; 1014 <USBHwInit+0x134>
     ee4:	e5932004 	ldr	r2, [r3, #4]
     ee8:	e3c22103 	bic	r2, r2, #-1073741824	; 0xc0000000
     eec:	e3822101 	orr	r2, r2, #1073741824	; 0x40000000
     ef0:	e92d4010 	push	{r4, lr}
     ef4:	e5832004 	str	r2, [r3, #4]
     ef8:	e593200c 	ldr	r2, [r3, #12]
     efc:	e3c22203 	bic	r2, r2, #805306368	; 0x30000000
     f00:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
     f04:	e583200c 	str	r2, [r3, #12]
     f08:	e5932000 	ldr	r2, [r3]
     f0c:	e3c2230f 	bic	r2, r2, #1006632960	; 0x3c000000
     f10:	e3822301 	orr	r2, r2, #67108864	; 0x4000000
     f14:	e5832000 	str	r2, [r3]
     f18:	e59f30f8 	ldr	r3, [pc, #248]	; 1018 <USBHwInit+0x138>
     f1c:	e5132fff 	ldr	r2, [r3, #-4095]	; 0xfff
     f20:	e3822901 	orr	r2, r2, #16384	; 0x4000
     f24:	e5032fff 	str	r2, [r3, #-4095]	; 0xfff
     f28:	e3a02901 	mov	r2, #16384	; 0x4000
     f2c:	e5032fe7 	str	r2, [r3, #-4071]	; 0xfe7
     f30:	e59f30e4 	ldr	r3, [pc, #228]	; 101c <USBHwInit+0x13c>
     f34:	e59320c4 	ldr	r2, [r3, #196]	; 0xc4
     f38:	e3822102 	orr	r2, r2, #-2147483648	; 0x80000000
     f3c:	e58320c4 	str	r2, [r3, #196]	; 0xc4
     f40:	e3a02005 	mov	r2, #5
     f44:	e5832108 	str	r2, [r3, #264]	; 0x108
     f48:	e59f30d0 	ldr	r3, [pc, #208]	; 1020 <USBHwInit+0x140>
     f4c:	e2822015 	add	r2, r2, #21
     f50:	e503200b 	str	r2, [r3, #-11]
     f54:	e1a02003 	mov	r2, r3
     f58:	e5121007 	ldr	r1, [r2, #-7]
     f5c:	e311001a 	tst	r1, #26
     f60:	e59f30b8 	ldr	r3, [pc, #184]	; 1020 <USBHwInit+0x140>
     f64:	0afffffb 	beq	f58 <USBHwInit+0x78>
     f68:	e3a02003 	mov	r2, #3
     f6c:	e5032eef 	str	r2, [r3, #-3823]	; 0xeef
     f70:	e3a04000 	mov	r4, #0
     f74:	e3e02000 	mvn	r2, #0
     f78:	e5034dfb 	str	r4, [r3, #-3579]	; 0xdfb
     f7c:	e1a00004 	mov	r0, r4
     f80:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     f84:	e5034dd3 	str	r4, [r3, #-3539]	; 0xdd3
     f88:	e5034dcb 	str	r4, [r3, #-3531]	; 0xdcb
     f8c:	e5032dc7 	str	r2, [r3, #-3527]	; 0xdc7
     f90:	e5034dbf 	str	r4, [r3, #-3519]	; 0xdbf
     f94:	ebfffeff 	bl	b98 <USBHwNakIntEnable>
     f98:	e59f207c 	ldr	r2, [pc, #124]	; 101c <USBHwInit+0x13c>
     f9c:	e59231a0 	ldr	r3, [r2, #416]	; 0x1a0
     fa0:	e59f106c 	ldr	r1, [pc, #108]	; 1014 <USBHwInit+0x134>
     fa4:	e3833001 	orr	r3, r3, #1
     fa8:	e58231a0 	str	r3, [r2, #416]	; 0x1a0
     fac:	e5814028 	str	r4, [r1, #40]	; 0x28
     fb0:	e59f3060 	ldr	r3, [pc, #96]	; 1018 <USBHwInit+0x138>
     fb4:	e5130fbf 	ldr	r0, [r3, #-4031]	; 0xfbf
     fb8:	e3800001 	orr	r0, r0, #1
     fbc:	e5030fbf 	str	r0, [r3, #-4031]	; 0xfbf
     fc0:	e3a00001 	mov	r0, #1
     fc4:	e5030fa3 	str	r0, [r3, #-4003]	; 0xfa3
     fc8:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
     fcc:	e18cc000 	orr	ip, ip, r0
     fd0:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
     fd4:	e5814028 	str	r4, [r1, #40]	; 0x28
     fd8:	e513cfbf 	ldr	ip, [r3, #-4031]	; 0xfbf
     fdc:	e38cc002 	orr	ip, ip, #2
     fe0:	e503cfbf 	str	ip, [r3, #-4031]	; 0xfbf
     fe4:	e3a0c002 	mov	ip, #2
     fe8:	e503cfa3 	str	ip, [r3, #-4003]	; 0xfa3
     fec:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
     ff0:	e18cc000 	orr	ip, ip, r0
     ff4:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
     ff8:	e5814028 	str	r4, [r1, #40]	; 0x28
     ffc:	e5132fbf 	ldr	r2, [r3, #-4031]	; 0xfbf
    1000:	e3822004 	orr	r2, r2, #4
    1004:	e5032fbf 	str	r2, [r3, #-4031]	; 0xfbf
    1008:	e3a02004 	mov	r2, #4
    100c:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
    1010:	e8bd8010 	pop	{r4, pc}
    1014:	e002c000 	.word	0xe002c000
    1018:	3fffcfff 	.word	0x3fffcfff
    101c:	e01fc000 	.word	0xe01fc000
    1020:	ffe0cfff 	.word	0xffe0cfff

00001024 <USBSetupDMADescriptor>:
    1024:	e92d4030 	push	{r4, r5, lr}
    1028:	e3a05000 	mov	r5, #0
    102c:	e5805004 	str	r5, [r0, #4]
    1030:	e5801000 	str	r1, [r0]
    1034:	e5905004 	ldr	r5, [r0, #4]
    1038:	e1a03b03 	lsl	r3, r3, #22
    103c:	e18558a3 	orr	r5, r5, r3, lsr #17
    1040:	e5805004 	str	r5, [r0, #4]
    1044:	e1dd40bc 	ldrh	r4, [sp, #12]
    1048:	e5903004 	ldr	r3, [r0, #4]
    104c:	e1834804 	orr	r4, r3, r4, lsl #16
    1050:	e5804004 	str	r4, [r0, #4]
    1054:	e21220ff 	ands	r2, r2, #255	; 0xff
    1058:	15903004 	ldrne	r3, [r0, #4]
    105c:	13833010 	orrne	r3, r3, #16
    1060:	15803004 	strne	r3, [r0, #4]
    1064:	e3510000 	cmp	r1, #0
    1068:	15903004 	ldrne	r3, [r0, #4]
    106c:	13833004 	orrne	r3, r3, #4
    1070:	15803004 	strne	r3, [r0, #4]
    1074:	e28d3010 	add	r3, sp, #16
    1078:	e8931008 	ldm	r3, {r3, ip}
    107c:	e35c0000 	cmp	ip, #0
    1080:	13520000 	cmpne	r2, #0
    1084:	e5803008 	str	r3, [r0, #8]
    1088:	e3a03000 	mov	r3, #0
    108c:	1580c010 	strne	ip, [r0, #16]
    1090:	e580300c 	str	r3, [r0, #12]
    1094:	e8bd8030 	pop	{r4, r5, pc}

00001098 <USBDisableDMAForEndpoint>:
    1098:	e20030ff 	and	r3, r0, #255	; 0xff
    109c:	e1a033a3 	lsr	r3, r3, #7
    10a0:	e200000f 	and	r0, r0, #15
    10a4:	e1830080 	orr	r0, r3, r0, lsl #1
    10a8:	e3a03001 	mov	r3, #1
    10ac:	e1a00013 	lsl	r0, r3, r0
    10b0:	e59f3004 	ldr	r3, [pc, #4]	; 10bc <USBDisableDMAForEndpoint+0x24>
    10b4:	e5030d73 	str	r0, [r3, #-3443]	; 0xd73
    10b8:	e12fff1e 	bx	lr
    10bc:	ffe0cfff 	.word	0xffe0cfff

000010c0 <USBEnableDMAForEndpoint>:
    10c0:	e20030ff 	and	r3, r0, #255	; 0xff
    10c4:	e1a033a3 	lsr	r3, r3, #7
    10c8:	e200000f 	and	r0, r0, #15
    10cc:	e1830080 	orr	r0, r3, r0, lsl #1
    10d0:	e3a03001 	mov	r3, #1
    10d4:	e1a00013 	lsl	r0, r3, r0
    10d8:	e59f3004 	ldr	r3, [pc, #4]	; 10e4 <USBEnableDMAForEndpoint+0x24>
    10dc:	e5030d77 	str	r0, [r3, #-3447]	; 0xd77
    10e0:	e12fff1e 	bx	lr
    10e4:	ffe0cfff 	.word	0xffe0cfff

000010e8 <USBInitializeISOCFrameArray>:
    10e8:	e1a03b03 	lsl	r3, r3, #22
    10ec:	e1a02802 	lsl	r2, r2, #16
    10f0:	e1a03b23 	lsr	r3, r3, #22
    10f4:	e92d4010 	push	{r4, lr}
    10f8:	e1a02822 	lsr	r2, r2, #16
    10fc:	e3a0c000 	mov	ip, #0
    1100:	e3833902 	orr	r3, r3, #32768	; 0x8000
    1104:	ea000004 	b	111c <USBInitializeISOCFrameArray+0x34>
    1108:	e1834804 	orr	r4, r3, r4, lsl #16
    110c:	e780410c 	str	r4, [r0, ip, lsl #2]
    1110:	e28cc001 	add	ip, ip, #1
    1114:	e1a0c80c 	lsl	ip, ip, #16
    1118:	e1a0c82c 	lsr	ip, ip, #16
    111c:	e08c4002 	add	r4, ip, r2
    1120:	e1a04804 	lsl	r4, r4, #16
    1124:	e15c0001 	cmp	ip, r1
    1128:	e1a04824 	lsr	r4, r4, #16
    112c:	3afffff5 	bcc	1108 <USBInitializeISOCFrameArray+0x20>
    1130:	e8bd8010 	pop	{r4, pc}

00001134 <USBSetHeadDDForDMA>:
    1134:	e20030ff 	and	r3, r0, #255	; 0xff
    1138:	e1a033a3 	lsr	r3, r3, #7
    113c:	e200000f 	and	r0, r0, #15
    1140:	e1830080 	orr	r0, r3, r0, lsl #1
    1144:	e7812100 	str	r2, [r1, r0, lsl #2]
    1148:	e12fff1e 	bx	lr

0000114c <USBInitializeUSBDMA>:
    114c:	e3a03000 	mov	r3, #0
    1150:	e1a02003 	mov	r2, r3
    1154:	e7802003 	str	r2, [r0, r3]
    1158:	e2833004 	add	r3, r3, #4
    115c:	e3530080 	cmp	r3, #128	; 0x80
    1160:	1afffffb 	bne	1154 <USBInitializeUSBDMA+0x8>
    1164:	e59f3004 	ldr	r3, [pc, #4]	; 1170 <USBInitializeUSBDMA+0x24>
    1168:	e5030d7f 	str	r0, [r3, #-3455]	; 0xd7f
    116c:	e12fff1e 	bx	lr
    1170:	ffe0cfff 	.word	0xffe0cfff

00001174 <StallControlPipe>:
    1174:	e92d4070 	push	{r4, r5, r6, lr}
    1178:	e3a01001 	mov	r1, #1
    117c:	e1a05000 	mov	r5, r0
    1180:	e3a00080 	mov	r0, #128	; 0x80
    1184:	ebfffe8b 	bl	bb8 <USBHwEPStall>
    1188:	e59f002c 	ldr	r0, [pc, #44]	; 11bc <StallControlPipe+0x48>
    118c:	ebfffd3d 	bl	688 <printf>
    1190:	e59f6028 	ldr	r6, [pc, #40]	; 11c0 <StallControlPipe+0x4c>
    1194:	e59f4028 	ldr	r4, [pc, #40]	; 11c4 <StallControlPipe+0x50>
    1198:	e4d41001 	ldrb	r1, [r4], #1
    119c:	e59f0024 	ldr	r0, [pc, #36]	; 11c8 <StallControlPipe+0x54>
    11a0:	ebfffd38 	bl	688 <printf>
    11a4:	e1540006 	cmp	r4, r6
    11a8:	1afffffa 	bne	1198 <StallControlPipe+0x24>
    11ac:	e59f0018 	ldr	r0, [pc, #24]	; 11cc <StallControlPipe+0x58>
    11b0:	e1a01005 	mov	r1, r5
    11b4:	e8bd4070 	pop	{r4, r5, r6, lr}
    11b8:	eafffd32 	b	688 <printf>
    11bc:	00001ce3 	.word	0x00001ce3
    11c0:	400002b8 	.word	0x400002b8
    11c4:	400002b0 	.word	0x400002b0
    11c8:	00001cee 	.word	0x00001cee
    11cc:	00001cf4 	.word	0x00001cf4

000011d0 <DataIn>:
    11d0:	e92d4030 	push	{r4, r5, lr}
    11d4:	e59f4034 	ldr	r4, [pc, #52]	; 1210 <DataIn+0x40>
    11d8:	e5945008 	ldr	r5, [r4, #8]
    11dc:	e3550040 	cmp	r5, #64	; 0x40
    11e0:	a3a05040 	movge	r5, #64	; 0x40
    11e4:	e1a02005 	mov	r2, r5
    11e8:	e3a00080 	mov	r0, #128	; 0x80
    11ec:	e594100c 	ldr	r1, [r4, #12]
    11f0:	ebfffe78 	bl	bd8 <USBHwEPWrite>
    11f4:	e594300c 	ldr	r3, [r4, #12]
    11f8:	e0833005 	add	r3, r3, r5
    11fc:	e584300c 	str	r3, [r4, #12]
    1200:	e5943008 	ldr	r3, [r4, #8]
    1204:	e0655003 	rsb	r5, r5, r3
    1208:	e5845008 	str	r5, [r4, #8]
    120c:	e8bd8030 	pop	{r4, r5, pc}
    1210:	400002b0 	.word	0x400002b0

00001214 <_HandleRequest.clone.0>:
    1214:	e92d4010 	push	{r4, lr}
    1218:	e59f003c 	ldr	r0, [pc, #60]	; 125c <_HandleRequest.clone.0+0x48>
    121c:	e5d01000 	ldrb	r1, [r0]
    1220:	e1a012a1 	lsr	r1, r1, #5
    1224:	e2011003 	and	r1, r1, #3
    1228:	e0803101 	add	r3, r0, r1, lsl #2
    122c:	e5934010 	ldr	r4, [r3, #16]
    1230:	e3540000 	cmp	r4, #0
    1234:	1a000003 	bne	1248 <_HandleRequest.clone.0+0x34>
    1238:	e59f0020 	ldr	r0, [pc, #32]	; 1260 <_HandleRequest.clone.0+0x4c>
    123c:	ebfffd11 	bl	688 <printf>
    1240:	e1a00004 	mov	r0, r4
    1244:	e8bd8010 	pop	{r4, pc}
    1248:	e2801020 	add	r1, r0, #32
    124c:	e280200c 	add	r2, r0, #12
    1250:	e1a0e00f 	mov	lr, pc
    1254:	e12fff14 	bx	r4
    1258:	e8bd8010 	pop	{r4, pc}
    125c:	400002b0 	.word	0x400002b0
    1260:	00001cff 	.word	0x00001cff

00001264 <USBHandleControlTransfer>:
    1264:	e21030ff 	ands	r3, r0, #255	; 0xff
    1268:	e92d4031 	push	{r0, r4, r5, lr}
    126c:	e20150ff 	and	r5, r1, #255	; 0xff
    1270:	1a00004a 	bne	13a0 <USBHandleControlTransfer+0x13c>
    1274:	e2110004 	ands	r0, r1, #4
    1278:	e59f415c 	ldr	r4, [pc, #348]	; 13dc <USBHandleControlTransfer+0x178>
    127c:	0a00001e 	beq	12fc <USBHandleControlTransfer+0x98>
    1280:	e1a00003 	mov	r0, r3
    1284:	e3a02008 	mov	r2, #8
    1288:	e1a01004 	mov	r1, r4
    128c:	ebfffe72 	bl	c5c <USBHwEPRead>
    1290:	e59f0148 	ldr	r0, [pc, #328]	; 13e0 <USBHandleControlTransfer+0x17c>
    1294:	e5d41001 	ldrb	r1, [r4, #1]
    1298:	ebfffcfa 	bl	688 <printf>
    129c:	e5d42000 	ldrb	r2, [r4]
    12a0:	e1a031a2 	lsr	r3, r2, #3
    12a4:	e203300c 	and	r3, r3, #12
    12a8:	e0843003 	add	r3, r4, r3
    12ac:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    12b0:	e584300c 	str	r3, [r4, #12]
    12b4:	e1d430b6 	ldrh	r3, [r4, #6]
    12b8:	e3530000 	cmp	r3, #0
    12bc:	e5843008 	str	r3, [r4, #8]
    12c0:	e5843020 	str	r3, [r4, #32]
    12c4:	0a000001 	beq	12d0 <USBHandleControlTransfer+0x6c>
    12c8:	e1b023a2 	lsrs	r2, r2, #7
    12cc:	0a000040 	beq	13d4 <USBHandleControlTransfer+0x170>
    12d0:	ebffffcf 	bl	1214 <_HandleRequest.clone.0>
    12d4:	e3500000 	cmp	r0, #0
    12d8:	059f0104 	ldreq	r0, [pc, #260]	; 13e4 <USBHandleControlTransfer+0x180>
    12dc:	0a00001f 	beq	1360 <USBHandleControlTransfer+0xfc>
    12e0:	e59f30f4 	ldr	r3, [pc, #244]	; 13dc <USBHandleControlTransfer+0x178>
    12e4:	e1d310b6 	ldrh	r1, [r3, #6]
    12e8:	e5932020 	ldr	r2, [r3, #32]
    12ec:	e1510002 	cmp	r1, r2
    12f0:	d5831008 	strle	r1, [r3, #8]
    12f4:	c5832008 	strgt	r2, [r3, #8]
    12f8:	ea00002a 	b	13a8 <USBHandleControlTransfer+0x144>
    12fc:	e5942008 	ldr	r2, [r4, #8]
    1300:	e3520000 	cmp	r2, #0
    1304:	da00001a 	ble	1374 <USBHandleControlTransfer+0x110>
    1308:	e594100c 	ldr	r1, [r4, #12]
    130c:	ebfffe52 	bl	c5c <USBHwEPRead>
    1310:	e3500000 	cmp	r0, #0
    1314:	ba000012 	blt	1364 <USBHandleControlTransfer+0x100>
    1318:	e594300c 	ldr	r3, [r4, #12]
    131c:	e0833000 	add	r3, r3, r0
    1320:	e584300c 	str	r3, [r4, #12]
    1324:	e5943008 	ldr	r3, [r4, #8]
    1328:	e0600003 	rsb	r0, r0, r3
    132c:	e3500000 	cmp	r0, #0
    1330:	e5840008 	str	r0, [r4, #8]
    1334:	1a000026 	bne	13d4 <USBHandleControlTransfer+0x170>
    1338:	e5d43000 	ldrb	r3, [r4]
    133c:	e1a031a3 	lsr	r3, r3, #3
    1340:	e203300c 	and	r3, r3, #12
    1344:	e0843003 	add	r3, r4, r3
    1348:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    134c:	e584300c 	str	r3, [r4, #12]
    1350:	ebffffaf 	bl	1214 <_HandleRequest.clone.0>
    1354:	e3500000 	cmp	r0, #0
    1358:	1a000012 	bne	13a8 <USBHandleControlTransfer+0x144>
    135c:	e59f0084 	ldr	r0, [pc, #132]	; 13e8 <USBHandleControlTransfer+0x184>
    1360:	ebfffd08 	bl	788 <puts>
    1364:	e1a00005 	mov	r0, r5
    1368:	e28dd004 	add	sp, sp, #4
    136c:	e8bd4030 	pop	{r4, r5, lr}
    1370:	eaffff7f 	b	1174 <StallControlPipe>
    1374:	e1a01000 	mov	r1, r0
    1378:	e1a02000 	mov	r2, r0
    137c:	ebfffe36 	bl	c5c <USBHwEPRead>
    1380:	e59f3064 	ldr	r3, [pc, #100]	; 13ec <USBHandleControlTransfer+0x188>
    1384:	e59f2064 	ldr	r2, [pc, #100]	; 13f0 <USBHandleControlTransfer+0x18c>
    1388:	e3500000 	cmp	r0, #0
    138c:	d1a00002 	movle	r0, r2
    1390:	c1a00003 	movgt	r0, r3
    1394:	e28dd004 	add	sp, sp, #4
    1398:	e8bd4030 	pop	{r4, r5, lr}
    139c:	eafffcb9 	b	688 <printf>
    13a0:	e3530080 	cmp	r3, #128	; 0x80
    13a4:	1a000002 	bne	13b4 <USBHandleControlTransfer+0x150>
    13a8:	e28dd004 	add	sp, sp, #4
    13ac:	e8bd4030 	pop	{r4, r5, lr}
    13b0:	eaffff86 	b	11d0 <DataIn>
    13b4:	e3a030d4 	mov	r3, #212	; 0xd4
    13b8:	e58d3000 	str	r3, [sp]
    13bc:	e59f0030 	ldr	r0, [pc, #48]	; 13f4 <USBHandleControlTransfer+0x190>
    13c0:	e59f1030 	ldr	r1, [pc, #48]	; 13f8 <USBHandleControlTransfer+0x194>
    13c4:	e59f2030 	ldr	r2, [pc, #48]	; 13fc <USBHandleControlTransfer+0x198>
    13c8:	e59f3030 	ldr	r3, [pc, #48]	; 1400 <USBHandleControlTransfer+0x19c>
    13cc:	ebfffcad 	bl	688 <printf>
    13d0:	eafffffe 	b	13d0 <USBHandleControlTransfer+0x16c>
    13d4:	e28dd004 	add	sp, sp, #4
    13d8:	e8bd8030 	pop	{r4, r5, pc}
    13dc:	400002b0 	.word	0x400002b0
    13e0:	00001d1c 	.word	0x00001d1c
    13e4:	00001d20 	.word	0x00001d20
    13e8:	00001d37 	.word	0x00001d37
    13ec:	00001d1a 	.word	0x00001d1a
    13f0:	00001c6d 	.word	0x00001c6d
    13f4:	00001c49 	.word	0x00001c49
    13f8:	00001d4e 	.word	0x00001d4e
    13fc:	00001d54 	.word	0x00001d54
    1400:	00001b68 	.word	0x00001b68

00001404 <USBRegisterRequestHandler>:
    1404:	e92d4001 	push	{r0, lr}
    1408:	e3500000 	cmp	r0, #0
    140c:	aa000007 	bge	1430 <USBRegisterRequestHandler+0x2c>
    1410:	e3a030e2 	mov	r3, #226	; 0xe2
    1414:	e58d3000 	str	r3, [sp]
    1418:	e59f004c 	ldr	r0, [pc, #76]	; 146c <USBRegisterRequestHandler+0x68>
    141c:	e59f104c 	ldr	r1, [pc, #76]	; 1470 <USBRegisterRequestHandler+0x6c>
    1420:	e59f204c 	ldr	r2, [pc, #76]	; 1474 <USBRegisterRequestHandler+0x70>
    1424:	e59f304c 	ldr	r3, [pc, #76]	; 1478 <USBRegisterRequestHandler+0x74>
    1428:	ebfffc96 	bl	688 <printf>
    142c:	eafffffe 	b	142c <USBRegisterRequestHandler+0x28>
    1430:	e3500003 	cmp	r0, #3
    1434:	da000007 	ble	1458 <USBRegisterRequestHandler+0x54>
    1438:	e3a030e3 	mov	r3, #227	; 0xe3
    143c:	e58d3000 	str	r3, [sp]
    1440:	e59f0024 	ldr	r0, [pc, #36]	; 146c <USBRegisterRequestHandler+0x68>
    1444:	e59f1030 	ldr	r1, [pc, #48]	; 147c <USBRegisterRequestHandler+0x78>
    1448:	e59f2024 	ldr	r2, [pc, #36]	; 1474 <USBRegisterRequestHandler+0x70>
    144c:	e59f3024 	ldr	r3, [pc, #36]	; 1478 <USBRegisterRequestHandler+0x74>
    1450:	ebfffc8c 	bl	688 <printf>
    1454:	eafffffe 	b	1454 <USBRegisterRequestHandler+0x50>
    1458:	e59f3020 	ldr	r3, [pc, #32]	; 1480 <USBRegisterRequestHandler+0x7c>
    145c:	e0830100 	add	r0, r3, r0, lsl #2
    1460:	e5801010 	str	r1, [r0, #16]
    1464:	e5802024 	str	r2, [r0, #36]	; 0x24
    1468:	e8bd8008 	pop	{r3, pc}
    146c:	00001c49 	.word	0x00001c49
    1470:	00001d61 	.word	0x00001d61
    1474:	00001d54 	.word	0x00001d54
    1478:	00001b84 	.word	0x00001b84
    147c:	00001d6c 	.word	0x00001d6c
    1480:	400002b0 	.word	0x400002b0

00001484 <USBRegisterDescriptors>:
    1484:	e59f3004 	ldr	r3, [pc, #4]	; 1490 <USBRegisterDescriptors+0xc>
    1488:	e5830000 	str	r0, [r3]
    148c:	e12fff1e 	bx	lr
    1490:	400002e4 	.word	0x400002e4

00001494 <USBGetDescriptor>:
    1494:	e59fc09c 	ldr	ip, [pc, #156]	; 1538 <USBGetDescriptor+0xa4>
    1498:	e59cc000 	ldr	ip, [ip]
    149c:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    14a0:	e1a00800 	lsl	r0, r0, #16
    14a4:	e35c0000 	cmp	ip, #0
    14a8:	e1a01820 	lsr	r1, r0, #16
    14ac:	11a05c20 	lsrne	r5, r0, #24
    14b0:	120160ff 	andne	r6, r1, #255	; 0xff
    14b4:	13a00000 	movne	r0, #0
    14b8:	1a000017 	bne	151c <USBGetDescriptor+0x88>
    14bc:	e3a0306e 	mov	r3, #110	; 0x6e
    14c0:	e58d3000 	str	r3, [sp]
    14c4:	e59f0070 	ldr	r0, [pc, #112]	; 153c <USBGetDescriptor+0xa8>
    14c8:	e59f1070 	ldr	r1, [pc, #112]	; 1540 <USBGetDescriptor+0xac>
    14cc:	e59f2070 	ldr	r2, [pc, #112]	; 1544 <USBGetDescriptor+0xb0>
    14d0:	e59f3070 	ldr	r3, [pc, #112]	; 1548 <USBGetDescriptor+0xb4>
    14d4:	ebfffc6b 	bl	688 <printf>
    14d8:	eafffffe 	b	14d8 <USBGetDescriptor+0x44>
    14dc:	e5dc7001 	ldrb	r7, [ip, #1]
    14e0:	e1570005 	cmp	r7, r5
    14e4:	1a00000b 	bne	1518 <USBGetDescriptor+0x84>
    14e8:	e1500006 	cmp	r0, r6
    14ec:	1a000008 	bne	1514 <USBGetDescriptor+0x80>
    14f0:	e583c000 	str	ip, [r3]
    14f4:	e3550002 	cmp	r5, #2
    14f8:	05dc1003 	ldrbeq	r1, [ip, #3]
    14fc:	05dc3002 	ldrbeq	r3, [ip, #2]
    1500:	15dc3000 	ldrbne	r3, [ip]
    1504:	01833401 	orreq	r3, r3, r1, lsl #8
    1508:	e5823000 	str	r3, [r2]
    150c:	e3a00001 	mov	r0, #1
    1510:	ea000007 	b	1534 <USBGetDescriptor+0xa0>
    1514:	e2800001 	add	r0, r0, #1
    1518:	e08cc004 	add	ip, ip, r4
    151c:	e5dc4000 	ldrb	r4, [ip]
    1520:	e3540000 	cmp	r4, #0
    1524:	1affffec 	bne	14dc <USBGetDescriptor+0x48>
    1528:	e59f001c 	ldr	r0, [pc, #28]	; 154c <USBGetDescriptor+0xb8>
    152c:	ebfffc55 	bl	688 <printf>
    1530:	e1a00004 	mov	r0, r4
    1534:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    1538:	400002e4 	.word	0x400002e4
    153c:	00001c49 	.word	0x00001c49
    1540:	00001d76 	.word	0x00001d76
    1544:	00001d89 	.word	0x00001d89
    1548:	00001ba0 	.word	0x00001ba0
    154c:	00001d95 	.word	0x00001d95

00001550 <USBHandleStandardRequest>:
    1550:	e59f32e4 	ldr	r3, [pc, #740]	; 183c <USBHandleStandardRequest+0x2ec>
    1554:	e5933004 	ldr	r3, [r3, #4]
    1558:	e3530000 	cmp	r3, #0
    155c:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    1560:	e1a04000 	mov	r4, r0
    1564:	e1a05001 	mov	r5, r1
    1568:	e1a06002 	mov	r6, r2
    156c:	0a000003 	beq	1580 <USBHandleStandardRequest+0x30>
    1570:	e1a0e00f 	mov	lr, pc
    1574:	e12fff13 	bx	r3
    1578:	e3500000 	cmp	r0, #0
    157c:	1a000071 	bne	1748 <USBHandleStandardRequest+0x1f8>
    1580:	e5d43000 	ldrb	r3, [r4]
    1584:	e203301f 	and	r3, r3, #31
    1588:	e3530001 	cmp	r3, #1
    158c:	0a000057 	beq	16f0 <USBHandleStandardRequest+0x1a0>
    1590:	e3530002 	cmp	r3, #2
    1594:	0a000078 	beq	177c <USBHandleStandardRequest+0x22c>
    1598:	e3530000 	cmp	r3, #0
    159c:	1a0000a3 	bne	1830 <USBHandleStandardRequest+0x2e0>
    15a0:	e5d41001 	ldrb	r1, [r4, #1]
    15a4:	e5963000 	ldr	r3, [r6]
    15a8:	e3510009 	cmp	r1, #9
    15ac:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    15b0:	ea00004c 	b	16e8 <USBHandleStandardRequest+0x198>
    15b4:	00001734 	.word	0x00001734
    15b8:	00001830 	.word	0x00001830
    15bc:	000016e8 	.word	0x000016e8
    15c0:	00001830 	.word	0x00001830
    15c4:	000016e8 	.word	0x000016e8
    15c8:	000015dc 	.word	0x000015dc
    15cc:	000015e8 	.word	0x000015e8
    15d0:	000016dc 	.word	0x000016dc
    15d4:	00001610 	.word	0x00001610
    15d8:	0000161c 	.word	0x0000161c
    15dc:	e5d40002 	ldrb	r0, [r4, #2]
    15e0:	ebfffd5b 	bl	b54 <USBHwSetAddress>
    15e4:	ea000057 	b	1748 <USBHandleStandardRequest+0x1f8>
    15e8:	e1d410b2 	ldrh	r1, [r4, #2]
    15ec:	e59f024c 	ldr	r0, [pc, #588]	; 1840 <USBHandleStandardRequest+0x2f0>
    15f0:	ebfffc24 	bl	688 <printf>
    15f4:	e1d400b2 	ldrh	r0, [r4, #2]
    15f8:	e1d410b4 	ldrh	r1, [r4, #4]
    15fc:	e1a02005 	mov	r2, r5
    1600:	e1a03006 	mov	r3, r6
    1604:	e28dd004 	add	sp, sp, #4
    1608:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    160c:	eaffffa0 	b	1494 <USBGetDescriptor>
    1610:	e59f2224 	ldr	r2, [pc, #548]	; 183c <USBHandleStandardRequest+0x2ec>
    1614:	e5d22008 	ldrb	r2, [r2, #8]
    1618:	ea00004d 	b	1754 <USBHandleStandardRequest+0x204>
    161c:	e59f3218 	ldr	r3, [pc, #536]	; 183c <USBHandleStandardRequest+0x2ec>
    1620:	e5935000 	ldr	r5, [r3]
    1624:	e3550000 	cmp	r5, #0
    1628:	e1d460b2 	ldrh	r6, [r4, #2]
    162c:	1a000007 	bne	1650 <USBHandleStandardRequest+0x100>
    1630:	e3a030a5 	mov	r3, #165	; 0xa5
    1634:	e58d3000 	str	r3, [sp]
    1638:	e59f0204 	ldr	r0, [pc, #516]	; 1844 <USBHandleStandardRequest+0x2f4>
    163c:	e59f1204 	ldr	r1, [pc, #516]	; 1848 <USBHandleStandardRequest+0x2f8>
    1640:	e59f2204 	ldr	r2, [pc, #516]	; 184c <USBHandleStandardRequest+0x2fc>
    1644:	e59f3204 	ldr	r3, [pc, #516]	; 1850 <USBHandleStandardRequest+0x300>
    1648:	ebfffc0e 	bl	688 <printf>
    164c:	eafffffe 	b	164c <USBHandleStandardRequest+0xfc>
    1650:	e21660ff 	ands	r6, r6, #255	; 0xff
    1654:	13a030ff 	movne	r3, #255	; 0xff
    1658:	11a07003 	movne	r7, r3
    165c:	01a00006 	moveq	r0, r6
    1660:	1a000014 	bne	16b8 <USBHandleStandardRequest+0x168>
    1664:	ea000017 	b	16c8 <USBHandleStandardRequest+0x178>
    1668:	e5d52001 	ldrb	r2, [r5, #1]
    166c:	e3520004 	cmp	r2, #4
    1670:	05d53003 	ldrbeq	r3, [r5, #3]
    1674:	0a00000d 	beq	16b0 <USBHandleStandardRequest+0x160>
    1678:	e3520005 	cmp	r2, #5
    167c:	0a000002 	beq	168c <USBHandleStandardRequest+0x13c>
    1680:	e3520002 	cmp	r2, #2
    1684:	05d57005 	ldrbeq	r7, [r5, #5]
    1688:	ea000008 	b	16b0 <USBHandleStandardRequest+0x160>
    168c:	e3530000 	cmp	r3, #0
    1690:	01570006 	cmpeq	r7, r6
    1694:	1a000005 	bne	16b0 <USBHandleStandardRequest+0x160>
    1698:	e5d53004 	ldrb	r3, [r5, #4]
    169c:	e5d51005 	ldrb	r1, [r5, #5]
    16a0:	e5d50002 	ldrb	r0, [r5, #2]
    16a4:	e1831401 	orr	r1, r3, r1, lsl #8
    16a8:	ebfffce7 	bl	a4c <USBHwEPConfig>
    16ac:	e3a03000 	mov	r3, #0
    16b0:	e5d52000 	ldrb	r2, [r5]
    16b4:	e0855002 	add	r5, r5, r2
    16b8:	e5d52000 	ldrb	r2, [r5]
    16bc:	e3520000 	cmp	r2, #0
    16c0:	1affffe8 	bne	1668 <USBHandleStandardRequest+0x118>
    16c4:	e3a00001 	mov	r0, #1
    16c8:	ebfffdb3 	bl	d9c <USBHwConfigDevice>
    16cc:	e1d420b2 	ldrh	r2, [r4, #2]
    16d0:	e59f3164 	ldr	r3, [pc, #356]	; 183c <USBHandleStandardRequest+0x2ec>
    16d4:	e5c32008 	strb	r2, [r3, #8]
    16d8:	ea00001a 	b	1748 <USBHandleStandardRequest+0x1f8>
    16dc:	e59f0170 	ldr	r0, [pc, #368]	; 1854 <USBHandleStandardRequest+0x304>
    16e0:	e3a01007 	mov	r1, #7
    16e4:	ea000050 	b	182c <USBHandleStandardRequest+0x2dc>
    16e8:	e59f0168 	ldr	r0, [pc, #360]	; 1858 <USBHandleStandardRequest+0x308>
    16ec:	ea00004e 	b	182c <USBHandleStandardRequest+0x2dc>
    16f0:	e5d41001 	ldrb	r1, [r4, #1]
    16f4:	e5963000 	ldr	r3, [r6]
    16f8:	e351000b 	cmp	r1, #11
    16fc:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1700:	ea00001b 	b	1774 <USBHandleStandardRequest+0x224>
    1704:	00001734 	.word	0x00001734
    1708:	00001830 	.word	0x00001830
    170c:	00001774 	.word	0x00001774
    1710:	00001830 	.word	0x00001830
    1714:	00001774 	.word	0x00001774
    1718:	00001774 	.word	0x00001774
    171c:	00001774 	.word	0x00001774
    1720:	00001774 	.word	0x00001774
    1724:	00001774 	.word	0x00001774
    1728:	00001774 	.word	0x00001774
    172c:	00001750 	.word	0x00001750
    1730:	00001764 	.word	0x00001764
    1734:	e3a02000 	mov	r2, #0
    1738:	e5c32000 	strb	r2, [r3]
    173c:	e5c32001 	strb	r2, [r3, #1]
    1740:	e3a03002 	mov	r3, #2
    1744:	e5853000 	str	r3, [r5]
    1748:	e3a00001 	mov	r0, #1
    174c:	ea000038 	b	1834 <USBHandleStandardRequest+0x2e4>
    1750:	e3a02000 	mov	r2, #0
    1754:	e3a00001 	mov	r0, #1
    1758:	e5c32000 	strb	r2, [r3]
    175c:	e5850000 	str	r0, [r5]
    1760:	ea000033 	b	1834 <USBHandleStandardRequest+0x2e4>
    1764:	e1d430b2 	ldrh	r3, [r4, #2]
    1768:	e3530000 	cmp	r3, #0
    176c:	0afffff4 	beq	1744 <USBHandleStandardRequest+0x1f4>
    1770:	ea00002e 	b	1830 <USBHandleStandardRequest+0x2e0>
    1774:	e59f00e0 	ldr	r0, [pc, #224]	; 185c <USBHandleStandardRequest+0x30c>
    1778:	ea00002b 	b	182c <USBHandleStandardRequest+0x2dc>
    177c:	e5d41001 	ldrb	r1, [r4, #1]
    1780:	e5966000 	ldr	r6, [r6]
    1784:	e351000c 	cmp	r1, #12
    1788:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    178c:	ea000025 	b	1828 <USBHandleStandardRequest+0x2d8>
    1790:	000017c4 	.word	0x000017c4
    1794:	000017ec 	.word	0x000017ec
    1798:	00001828 	.word	0x00001828
    179c:	00001800 	.word	0x00001800
    17a0:	00001828 	.word	0x00001828
    17a4:	00001828 	.word	0x00001828
    17a8:	00001828 	.word	0x00001828
    17ac:	00001828 	.word	0x00001828
    17b0:	00001828 	.word	0x00001828
    17b4:	00001828 	.word	0x00001828
    17b8:	00001828 	.word	0x00001828
    17bc:	00001828 	.word	0x00001828
    17c0:	0000181c 	.word	0x0000181c
    17c4:	e5d40004 	ldrb	r0, [r4, #4]
    17c8:	ebfffcf5 	bl	ba4 <USBHwEPGetStatus>
    17cc:	e3100002 	tst	r0, #2
    17d0:	03a03000 	moveq	r3, #0
    17d4:	13a03001 	movne	r3, #1
    17d8:	e5c63000 	strb	r3, [r6]
    17dc:	e3a03000 	mov	r3, #0
    17e0:	e5c63001 	strb	r3, [r6, #1]
    17e4:	e2833002 	add	r3, r3, #2
    17e8:	eaffffd5 	b	1744 <USBHandleStandardRequest+0x1f4>
    17ec:	e1d410b2 	ldrh	r1, [r4, #2]
    17f0:	e3510000 	cmp	r1, #0
    17f4:	05d40004 	ldrbeq	r0, [r4, #4]
    17f8:	1a00000c 	bne	1830 <USBHandleStandardRequest+0x2e0>
    17fc:	ea000004 	b	1814 <USBHandleStandardRequest+0x2c4>
    1800:	e1d430b2 	ldrh	r3, [r4, #2]
    1804:	e3530000 	cmp	r3, #0
    1808:	1a000008 	bne	1830 <USBHandleStandardRequest+0x2e0>
    180c:	e5d40004 	ldrb	r0, [r4, #4]
    1810:	e3a01001 	mov	r1, #1
    1814:	ebfffce7 	bl	bb8 <USBHwEPStall>
    1818:	eaffffca 	b	1748 <USBHandleStandardRequest+0x1f8>
    181c:	e59f003c 	ldr	r0, [pc, #60]	; 1860 <USBHandleStandardRequest+0x310>
    1820:	e3a0100c 	mov	r1, #12
    1824:	ea000000 	b	182c <USBHandleStandardRequest+0x2dc>
    1828:	e59f0034 	ldr	r0, [pc, #52]	; 1864 <USBHandleStandardRequest+0x314>
    182c:	ebfffb95 	bl	688 <printf>
    1830:	e3a00000 	mov	r0, #0
    1834:	e28dd004 	add	sp, sp, #4
    1838:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    183c:	400002e4 	.word	0x400002e4
    1840:	00001da9 	.word	0x00001da9
    1844:	00001c49 	.word	0x00001c49
    1848:	00001d76 	.word	0x00001d76
    184c:	00001d89 	.word	0x00001d89
    1850:	00001bb4 	.word	0x00001bb4
    1854:	00001dad 	.word	0x00001dad
    1858:	00001dcc 	.word	0x00001dcc
    185c:	00001de3 	.word	0x00001de3
    1860:	00001dfd 	.word	0x00001dfd
    1864:	00001e18 	.word	0x00001e18

00001868 <USBRegisterCustomReqHandler>:
    1868:	e59f3004 	ldr	r3, [pc, #4]	; 1874 <USBRegisterCustomReqHandler+0xc>
    186c:	e5830004 	str	r0, [r3, #4]
    1870:	e12fff1e 	bx	lr
    1874:	400002e4 	.word	0x400002e4

00001878 <HandleUsbReset>:
    1878:	e3100010 	tst	r0, #16
    187c:	012fff1e 	bxeq	lr
    1880:	e59f0000 	ldr	r0, [pc, #0]	; 1888 <HandleUsbReset+0x10>
    1884:	eafffb7f 	b	688 <printf>
    1888:	00001e2b 	.word	0x00001e2b

0000188c <USBInit>:
    188c:	e92d4010 	push	{r4, lr}
    1890:	e59f4050 	ldr	r4, [pc, #80]	; 18e8 <USBInit+0x5c>
    1894:	ebfffd91 	bl	ee0 <USBHwInit>
    1898:	e59f004c 	ldr	r0, [pc, #76]	; 18ec <USBInit+0x60>
    189c:	ebfffc96 	bl	afc <USBHwRegisterDevIntHandler>
    18a0:	e1a01004 	mov	r1, r4
    18a4:	e3a00000 	mov	r0, #0
    18a8:	ebfffc7c 	bl	aa0 <USBHwRegisterEPIntHandler>
    18ac:	e1a01004 	mov	r1, r4
    18b0:	e3a00080 	mov	r0, #128	; 0x80
    18b4:	ebfffc79 	bl	aa0 <USBHwRegisterEPIntHandler>
    18b8:	e3a00000 	mov	r0, #0
    18bc:	e3a01040 	mov	r1, #64	; 0x40
    18c0:	ebfffc61 	bl	a4c <USBHwEPConfig>
    18c4:	e3a00080 	mov	r0, #128	; 0x80
    18c8:	e3a01040 	mov	r1, #64	; 0x40
    18cc:	ebfffc5e 	bl	a4c <USBHwEPConfig>
    18d0:	e3a00000 	mov	r0, #0
    18d4:	e59f1014 	ldr	r1, [pc, #20]	; 18f0 <USBInit+0x64>
    18d8:	e59f2014 	ldr	r2, [pc, #20]	; 18f4 <USBInit+0x68>
    18dc:	ebfffec8 	bl	1404 <USBRegisterRequestHandler>
    18e0:	e3a00001 	mov	r0, #1
    18e4:	e8bd8010 	pop	{r4, pc}
    18e8:	00001264 	.word	0x00001264
    18ec:	00001878 	.word	0x00001878
    18f0:	00001550 	.word	0x00001550
    18f4:	400002f0 	.word	0x400002f0

000018f8 <__aeabi_uidiv>:
    18f8:	e2512001 	subs	r2, r1, #1
    18fc:	012fff1e 	bxeq	lr
    1900:	3a000036 	bcc	19e0 <__aeabi_uidiv+0xe8>
    1904:	e1500001 	cmp	r0, r1
    1908:	9a000022 	bls	1998 <__aeabi_uidiv+0xa0>
    190c:	e1110002 	tst	r1, r2
    1910:	0a000023 	beq	19a4 <__aeabi_uidiv+0xac>
    1914:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1918:	01a01181 	lsleq	r1, r1, #3
    191c:	03a03008 	moveq	r3, #8
    1920:	13a03001 	movne	r3, #1
    1924:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1928:	31510000 	cmpcc	r1, r0
    192c:	31a01201 	lslcc	r1, r1, #4
    1930:	31a03203 	lslcc	r3, r3, #4
    1934:	3afffffa 	bcc	1924 <__aeabi_uidiv+0x2c>
    1938:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    193c:	31510000 	cmpcc	r1, r0
    1940:	31a01081 	lslcc	r1, r1, #1
    1944:	31a03083 	lslcc	r3, r3, #1
    1948:	3afffffa 	bcc	1938 <__aeabi_uidiv+0x40>
    194c:	e3a02000 	mov	r2, #0
    1950:	e1500001 	cmp	r0, r1
    1954:	20400001 	subcs	r0, r0, r1
    1958:	21822003 	orrcs	r2, r2, r3
    195c:	e15000a1 	cmp	r0, r1, lsr #1
    1960:	204000a1 	subcs	r0, r0, r1, lsr #1
    1964:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1968:	e1500121 	cmp	r0, r1, lsr #2
    196c:	20400121 	subcs	r0, r0, r1, lsr #2
    1970:	21822123 	orrcs	r2, r2, r3, lsr #2
    1974:	e15001a1 	cmp	r0, r1, lsr #3
    1978:	204001a1 	subcs	r0, r0, r1, lsr #3
    197c:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1980:	e3500000 	cmp	r0, #0
    1984:	11b03223 	lsrsne	r3, r3, #4
    1988:	11a01221 	lsrne	r1, r1, #4
    198c:	1affffef 	bne	1950 <__aeabi_uidiv+0x58>
    1990:	e1a00002 	mov	r0, r2
    1994:	e12fff1e 	bx	lr
    1998:	03a00001 	moveq	r0, #1
    199c:	13a00000 	movne	r0, #0
    19a0:	e12fff1e 	bx	lr
    19a4:	e3510801 	cmp	r1, #65536	; 0x10000
    19a8:	21a01821 	lsrcs	r1, r1, #16
    19ac:	23a02010 	movcs	r2, #16
    19b0:	33a02000 	movcc	r2, #0
    19b4:	e3510c01 	cmp	r1, #256	; 0x100
    19b8:	21a01421 	lsrcs	r1, r1, #8
    19bc:	22822008 	addcs	r2, r2, #8
    19c0:	e3510010 	cmp	r1, #16
    19c4:	21a01221 	lsrcs	r1, r1, #4
    19c8:	22822004 	addcs	r2, r2, #4
    19cc:	e3510004 	cmp	r1, #4
    19d0:	82822003 	addhi	r2, r2, #3
    19d4:	908220a1 	addls	r2, r2, r1, lsr #1
    19d8:	e1a00230 	lsr	r0, r0, r2
    19dc:	e12fff1e 	bx	lr
    19e0:	e52de008 	str	lr, [sp, #-8]!
    19e4:	eb00003c 	bl	1adc <__div0>
    19e8:	e3a00000 	mov	r0, #0
    19ec:	e49df008 	ldr	pc, [sp], #8

000019f0 <__aeabi_uidivmod>:
    19f0:	e3510000 	cmp	r1, #0
    19f4:	0afffff9 	beq	19e0 <__aeabi_uidiv+0xe8>
    19f8:	e92d4003 	push	{r0, r1, lr}
    19fc:	ebffffbd 	bl	18f8 <__aeabi_uidiv>
    1a00:	e8bd4006 	pop	{r1, r2, lr}
    1a04:	e0030092 	mul	r3, r2, r0
    1a08:	e0411003 	sub	r1, r1, r3
    1a0c:	e12fff1e 	bx	lr

00001a10 <__umodsi3>:
    1a10:	e2512001 	subs	r2, r1, #1
    1a14:	3a00002c 	bcc	1acc <__umodsi3+0xbc>
    1a18:	11500001 	cmpne	r0, r1
    1a1c:	03a00000 	moveq	r0, #0
    1a20:	81110002 	tsthi	r1, r2
    1a24:	00000002 	andeq	r0, r0, r2
    1a28:	912fff1e 	bxls	lr
    1a2c:	e3a02000 	mov	r2, #0
    1a30:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1a34:	31510000 	cmpcc	r1, r0
    1a38:	31a01201 	lslcc	r1, r1, #4
    1a3c:	32822004 	addcc	r2, r2, #4
    1a40:	3afffffa 	bcc	1a30 <__umodsi3+0x20>
    1a44:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1a48:	31510000 	cmpcc	r1, r0
    1a4c:	31a01081 	lslcc	r1, r1, #1
    1a50:	32822001 	addcc	r2, r2, #1
    1a54:	3afffffa 	bcc	1a44 <__umodsi3+0x34>
    1a58:	e2522003 	subs	r2, r2, #3
    1a5c:	ba00000e 	blt	1a9c <__umodsi3+0x8c>
    1a60:	e1500001 	cmp	r0, r1
    1a64:	20400001 	subcs	r0, r0, r1
    1a68:	e15000a1 	cmp	r0, r1, lsr #1
    1a6c:	204000a1 	subcs	r0, r0, r1, lsr #1
    1a70:	e1500121 	cmp	r0, r1, lsr #2
    1a74:	20400121 	subcs	r0, r0, r1, lsr #2
    1a78:	e15001a1 	cmp	r0, r1, lsr #3
    1a7c:	204001a1 	subcs	r0, r0, r1, lsr #3
    1a80:	e3500001 	cmp	r0, #1
    1a84:	e1a01221 	lsr	r1, r1, #4
    1a88:	a2522004 	subsge	r2, r2, #4
    1a8c:	aafffff3 	bge	1a60 <__umodsi3+0x50>
    1a90:	e3120003 	tst	r2, #3
    1a94:	13300000 	teqne	r0, #0
    1a98:	0a00000a 	beq	1ac8 <__umodsi3+0xb8>
    1a9c:	e3720002 	cmn	r2, #2
    1aa0:	ba000006 	blt	1ac0 <__umodsi3+0xb0>
    1aa4:	0a000002 	beq	1ab4 <__umodsi3+0xa4>
    1aa8:	e1500001 	cmp	r0, r1
    1aac:	20400001 	subcs	r0, r0, r1
    1ab0:	e1a010a1 	lsr	r1, r1, #1
    1ab4:	e1500001 	cmp	r0, r1
    1ab8:	20400001 	subcs	r0, r0, r1
    1abc:	e1a010a1 	lsr	r1, r1, #1
    1ac0:	e1500001 	cmp	r0, r1
    1ac4:	20400001 	subcs	r0, r0, r1
    1ac8:	e12fff1e 	bx	lr
    1acc:	e52de008 	str	lr, [sp, #-8]!
    1ad0:	eb000001 	bl	1adc <__div0>
    1ad4:	e3a00000 	mov	r0, #0
    1ad8:	e49df008 	ldr	pc, [sp], #8

00001adc <__div0>:
    1adc:	e12fff1e 	bx	lr

00001ae0 <abDescriptors>:
    1ae0:	01100112 40000000 0001ffff 02010100     .......@........
    1af0:	02090103 01010022 09328000 01000004     ....".....2.....
    1b00:	00000003 01102109 4d220100 81050700     .....!...."M....
    1b10:	0a004003 04090304 004c030e 00430050     .@........L.P.C.
    1b20:	00530055 03120042 00720050 0064006f     U.S.B...P.r.o.d.
    1b30:	00630075 00580074 00440312 00410045     u.c.t.X...D.E.A.
    1b40:	00430044 00440030 00000045              D.C.0.D.E...

00001b4c <__FUNCTION__.1347>:
    1b4c:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    1b5c:	6148746e 656c646e 00000072              ntHandler...

00001b68 <__FUNCTION__.1330>:
    1b68:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    1b78:	6e617254 72656673 00000000              Transfer....

00001b84 <__FUNCTION__.1337>:
    1b84:	52425355 73696765 52726574 65757165     USBRegisterReque
    1b94:	61487473 656c646e 00000072              stHandler...

00001ba0 <__FUNCTION__.1326>:
    1ba0:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    1bb0:	00000000                                ....

00001bb4 <__FUNCTION__.1340>:
    1bb4:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    1bc4:	006e6f69 6c756e28 4700296c 49205445     ion.(null).GET I
    1bd4:	2c454c44 6c617620 2c58253d 78646920     DLE, val=%X, idx
    1be4:	0a58253d 54455300 4c444920 76202c45     =%X..SET IDLE, v
    1bf4:	253d6c61 69202c58 253d7864 55000a58     al=%X, idx=%X..U
    1c04:	6e61686e 64656c64 616c6320 25207373     nhandled class %
    1c14:	49000a58 6974696e 73696c61 20676e69     X..Initialising 
    1c24:	20425355 63617473 7453006b 69747261     USB stack.Starti
    1c34:	5520676e 63204253 756d6d6f 6163696e     ng USB communica
    1c44:	6e6f6974 73410a00 74726573 206e6f69     tion..Assertion 
    1c54:	27732527 69616620 2064656c 25206e69     '%s' failed in %
    1c64:	73253a73 21642523 6469000a 32333c78     s:%s#%d!..idx<32
    1c74:	62737500 6c5f7768 632e6370 67655200     .usbhw_lpc.c.Reg
    1c84:	65747369 20646572 646e6168 2072656c     istered handler 
    1c94:	20726f66 30205045 0a782578 67655200     for EP 0x%x..Reg
    1ca4:	65747369 20646572 646e6168 2072656c     istered handler 
    1cb4:	20726f66 69766564 73206563 75746174     for device statu
    1cc4:	65520073 74736967 64657265 6e616820     s.Registered han
    1cd4:	72656c64 726f6620 61726620 5300656d     dler for frame.S
    1ce4:	4c4c4154 206e6f20 2520005b 00783230     TALL on [. %02x.
    1cf4:	7473205d 253d7461 4e000a78 6168206f     ] stat=%x..No ha
    1d04:	656c646e 6f662072 65722072 70797471     ndler for reqtyp
    1d14:	64252065 003f000a 00782553 6e61485f     e %d..?.S%x._Han
    1d24:	52656c64 65757165 20317473 6c696166     dleRequest1 fail
    1d34:	5f006465 646e6148 6552656c 73657571     ed._HandleReques
    1d44:	66203274 656c6961 41460064 0045534c     t2 failed.FALSE.
    1d54:	63627375 72746e6f 632e6c6f 79546900     usbcontrol.c.iTy
    1d64:	3e206570 0030203d 70795469 203c2065     pe >= 0.iType < 
    1d74:	61700034 73654462 70697263 203d2120     4.pabDescrip != 
    1d84:	4c4c554e 62737500 72647473 632e7165     NULL.usbstdreq.c
    1d94:	73654400 78252063 746f6e20 756f6620     .Desc %x not fou
    1da4:	0a21646e 78254400 76654400 20656369     nd!..D%x.Device 
    1db4:	20716572 6e206425 6920746f 656c706d     req %d not imple
    1dc4:	746e656d 000a6465 656c6c49 206c6167     mented..Illegal 
    1dd4:	69766564 72206563 25207165 49000a64     device req %d..I
    1de4:	67656c6c 69206c61 7265746e 65636166     llegal interface
    1df4:	71657220 0a642520 20504500 20716572      req %d..EP req 
    1e04:	6e206425 6920746f 656c706d 746e656d     %d not implement
    1e14:	000a6465 656c6c49 206c6167 72205045     ed..Illegal EP r
    1e24:	25207165 0a000a64 00000021                       eq %d...!.
