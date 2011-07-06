
serial.elf:     file format elf32-littlearm


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
      bc:	ea00026f 	b	a80 <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	000022fb 	.word	0x000022fb
      c8:	40000200 	.word	0x40000200
      cc:	40000208 	.word	0x40000208
      d0:	40000208 	.word	0x40000208
      d4:	40000400 	.word	0x40000400

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
     410:	eb000660 	bl	1d98 <__umodsi3>
     414:	e3500009 	cmp	r0, #9
     418:	c59d3000 	ldrgt	r3, [sp]
     41c:	c0800003 	addgt	r0, r0, r3
     420:	e2800030 	add	r0, r0, #48	; 0x30
     424:	e5690001 	strb	r0, [r9, #-1]!
     428:	e1a01007 	mov	r1, r7
     42c:	e1a00008 	mov	r0, r8
     430:	eb000612 	bl	1c80 <__aeabi_uidiv>
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
     684:	00002058 	.word	0x00002058

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

000007b4 <USBDevIntHandler>:
     7b4:	e3100010 	tst	r0, #16
     7b8:	159f3008 	ldrne	r3, [pc, #8]	; 7c8 <USBDevIntHandler+0x14>
     7bc:	13a02000 	movne	r2, #0
     7c0:	15832000 	strne	r2, [r3]
     7c4:	e12fff1e 	bx	lr
     7c8:	40000208 	.word	0x40000208

000007cc <USBIntHandler>:
     7cc:	e24ee004 	sub	lr, lr, #4
     7d0:	e92d500f 	push	{r0, r1, r2, r3, ip, lr}
     7d4:	eb000256 	bl	1134 <USBHwISR>
     7d8:	e3a02000 	mov	r2, #0
     7dc:	e3e03000 	mvn	r3, #0
     7e0:	e50320ff 	str	r2, [r3, #-255]	; 0xff
     7e4:	e8fd900f 	ldm	sp!, {r0, r1, r2, r3, ip, pc}^

000007e8 <SendNextBulkIn>:
     7e8:	e3a02000 	mov	r2, #0
     7ec:	e59f306c 	ldr	r3, [pc, #108]	; 860 <SendNextBulkIn+0x78>
     7f0:	e1510002 	cmp	r1, r2
     7f4:	e92d4070 	push	{r4, r5, r6, lr}
     7f8:	e5832000 	str	r2, [r3]
     7fc:	e59f505c 	ldr	r5, [pc, #92]	; 860 <SendNextBulkIn+0x78>
     800:	15832004 	strne	r2, [r3, #4]
     804:	e5954004 	ldr	r4, [r5, #4]
     808:	e3540000 	cmp	r4, #0
     80c:	e1a06000 	mov	r6, r0
     810:	18bd8070 	popne	{r4, r5, r6, pc}
     814:	e2855014 	add	r5, r5, #20
     818:	e59f0044 	ldr	r0, [pc, #68]	; 864 <SendNextBulkIn+0x7c>
     81c:	e0851004 	add	r1, r5, r4
     820:	eb0000f4 	bl	bf8 <fifo_get>
     824:	e3500000 	cmp	r0, #0
     828:	0a000002 	beq	838 <SendNextBulkIn+0x50>
     82c:	e2844001 	add	r4, r4, #1
     830:	e3540040 	cmp	r4, #64	; 0x40
     834:	1afffff7 	bne	818 <SendNextBulkIn+0x30>
     838:	e59f5020 	ldr	r5, [pc, #32]	; 860 <SendNextBulkIn+0x78>
     83c:	e1a00006 	mov	r0, r6
     840:	e2851014 	add	r1, r5, #20
     844:	e1a02004 	mov	r2, r4
     848:	eb0001c4 	bl	f60 <USBHwEPWrite>
     84c:	e3a03001 	mov	r3, #1
     850:	e354003f 	cmp	r4, #63	; 0x3f
     854:	e5853000 	str	r3, [r5]
     858:	d5853004 	strle	r3, [r5, #4]
     85c:	e8bd8070 	pop	{r4, r5, r6, pc}
     860:	40000208 	.word	0x40000208
     864:	40000210 	.word	0x40000210

00000868 <USBFrameHandler>:
     868:	e59f002c 	ldr	r0, [pc, #44]	; 89c <USBFrameHandler+0x34>
     86c:	e5903000 	ldr	r3, [r0]
     870:	e3530000 	cmp	r3, #0
     874:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     878:	149df004 	popne	{pc}		; (ldrne pc, [sp], #4)
     87c:	e2800008 	add	r0, r0, #8
     880:	eb0000f0 	bl	c48 <fifo_avail>
     884:	e3500000 	cmp	r0, #0
     888:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
     88c:	e3a00082 	mov	r0, #130	; 0x82
     890:	e3a01001 	mov	r1, #1
     894:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     898:	eaffffd2 	b	7e8 <SendNextBulkIn>
     89c:	40000208 	.word	0x40000208

000008a0 <BulkIn>:
     8a0:	e20000ff 	and	r0, r0, #255	; 0xff
     8a4:	e3a01000 	mov	r1, #0
     8a8:	eaffffce 	b	7e8 <SendNextBulkIn>

000008ac <BulkOut>:
     8ac:	e92d4071 	push	{r0, r4, r5, r6, lr}
     8b0:	e20040ff 	and	r4, r0, #255	; 0xff
     8b4:	e59f006c 	ldr	r0, [pc, #108]	; 928 <BulkOut+0x7c>
     8b8:	eb0000ef 	bl	c7c <fifo_free>
     8bc:	e350003f 	cmp	r0, #63	; 0x3f
     8c0:	da000017 	ble	924 <BulkOut+0x78>
     8c4:	e1a00004 	mov	r0, r4
     8c8:	e59f105c 	ldr	r1, [pc, #92]	; 92c <BulkOut+0x80>
     8cc:	e3a02040 	mov	r2, #64	; 0x40
     8d0:	eb0001c3 	bl	fe4 <USBHwEPRead>
     8d4:	e3a04000 	mov	r4, #0
     8d8:	e1a06000 	mov	r6, r0
     8dc:	e59f5048 	ldr	r5, [pc, #72]	; 92c <BulkOut+0x80>
     8e0:	ea00000d 	b	91c <BulkOut+0x70>
     8e4:	e59f003c 	ldr	r0, [pc, #60]	; 928 <BulkOut+0x7c>
     8e8:	e7d51004 	ldrb	r1, [r5, r4]
     8ec:	eb0000ae 	bl	bac <fifo_put>
     8f0:	e3500000 	cmp	r0, #0
     8f4:	1a000007 	bne	918 <BulkOut+0x6c>
     8f8:	e3a030f9 	mov	r3, #249	; 0xf9
     8fc:	e58d3000 	str	r3, [sp]
     900:	e59f0028 	ldr	r0, [pc, #40]	; 930 <BulkOut+0x84>
     904:	e59f1028 	ldr	r1, [pc, #40]	; 934 <BulkOut+0x88>
     908:	e59f2028 	ldr	r2, [pc, #40]	; 938 <BulkOut+0x8c>
     90c:	e59f3028 	ldr	r3, [pc, #40]	; 93c <BulkOut+0x90>
     910:	ebffff5c 	bl	688 <printf>
     914:	eafffffe 	b	914 <BulkOut+0x68>
     918:	e2844001 	add	r4, r4, #1
     91c:	e1540006 	cmp	r4, r6
     920:	baffffef 	blt	8e4 <BulkOut+0x38>
     924:	e8bd8078 	pop	{r3, r4, r5, r6, pc}
     928:	4000025c 	.word	0x4000025c
     92c:	4000021c 	.word	0x4000021c
     930:	0000205f 	.word	0x0000205f
     934:	00002084 	.word	0x00002084
     938:	0000208a 	.word	0x0000208a
     93c:	00001f44 	.word	0x00001f44

00000940 <HandleClassRequest>:
     940:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
     944:	e1a07002 	mov	r7, r2
     948:	e5d02001 	ldrb	r2, [r0, #1]
     94c:	e3520021 	cmp	r2, #33	; 0x21
     950:	e1a03000 	mov	r3, r0
     954:	e1a05001 	mov	r5, r1
     958:	0a000015 	beq	9b4 <HandleClassRequest+0x74>
     95c:	e3520022 	cmp	r2, #34	; 0x22
     960:	0a00001b 	beq	9d4 <HandleClassRequest+0x94>
     964:	e3520020 	cmp	r2, #32
     968:	13a00000 	movne	r0, #0
     96c:	1a00001c 	bne	9e4 <HandleClassRequest+0xa4>
     970:	e59f4070 	ldr	r4, [pc, #112]	; 9e8 <HandleClassRequest+0xa8>
     974:	e3a06007 	mov	r6, #7
     978:	e59f006c 	ldr	r0, [pc, #108]	; 9ec <HandleClassRequest+0xac>
     97c:	ebffff81 	bl	788 <puts>
     980:	e5971000 	ldr	r1, [r7]
     984:	e1a02006 	mov	r2, r6
     988:	e1a00004 	mov	r0, r4
     98c:	eb000535 	bl	1e68 <memcpy>
     990:	e5856000 	str	r6, [r5]
     994:	e5d41006 	ldrb	r1, [r4, #6]
     998:	e5d42004 	ldrb	r2, [r4, #4]
     99c:	e58d1000 	str	r1, [sp]
     9a0:	e5d43005 	ldrb	r3, [r4, #5]
     9a4:	e5941000 	ldr	r1, [r4]
     9a8:	e59f0040 	ldr	r0, [pc, #64]	; 9f0 <HandleClassRequest+0xb0>
     9ac:	ebffff35 	bl	688 <printf>
     9b0:	ea000005 	b	9cc <HandleClassRequest+0x8c>
     9b4:	e59f0038 	ldr	r0, [pc, #56]	; 9f4 <HandleClassRequest+0xb4>
     9b8:	ebffff72 	bl	788 <puts>
     9bc:	e59f3024 	ldr	r3, [pc, #36]	; 9e8 <HandleClassRequest+0xa8>
     9c0:	e5873000 	str	r3, [r7]
     9c4:	e3a03007 	mov	r3, #7
     9c8:	e5853000 	str	r3, [r5]
     9cc:	e3a00001 	mov	r0, #1
     9d0:	ea000003 	b	9e4 <HandleClassRequest+0xa4>
     9d4:	e1d310b2 	ldrh	r1, [r3, #2]
     9d8:	e59f0018 	ldr	r0, [pc, #24]	; 9f8 <HandleClassRequest+0xb8>
     9dc:	ebffff29 	bl	688 <printf>
     9e0:	eafffff9 	b	9cc <HandleClassRequest+0x8c>
     9e4:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
     9e8:	40000200 	.word	0x40000200
     9ec:	00002098 	.word	0x00002098
     9f0:	000020a8 	.word	0x000020a8
     9f4:	000020e4 	.word	0x000020e4
     9f8:	000020f4 	.word	0x000020f4

000009fc <VCOM_init>:
     9fc:	e92d4010 	push	{r4, lr}
     a00:	e59f4028 	ldr	r4, [pc, #40]	; a30 <VCOM_init+0x34>
     a04:	e2840008 	add	r0, r4, #8
     a08:	e2841060 	add	r1, r4, #96	; 0x60
     a0c:	eb000061 	bl	b98 <fifo_init>
     a10:	e2840054 	add	r0, r4, #84	; 0x54
     a14:	e28410e0 	add	r1, r4, #224	; 0xe0
     a18:	eb00005e 	bl	b98 <fifo_init>
     a1c:	e3a03000 	mov	r3, #0
     a20:	e5843000 	str	r3, [r4]
     a24:	e2833001 	add	r3, r3, #1
     a28:	e5843004 	str	r3, [r4, #4]
     a2c:	e8bd8010 	pop	{r4, pc}
     a30:	40000208 	.word	0x40000208

00000a34 <VCOM_putchar>:
     a34:	e92d4010 	push	{r4, lr}
     a38:	e20010ff 	and	r1, r0, #255	; 0xff
     a3c:	e1a04000 	mov	r4, r0
     a40:	e59f0010 	ldr	r0, [pc, #16]	; a58 <VCOM_putchar+0x24>
     a44:	eb000058 	bl	bac <fifo_put>
     a48:	e3500000 	cmp	r0, #0
     a4c:	11a00004 	movne	r0, r4
     a50:	03e00000 	mvneq	r0, #0
     a54:	e8bd8010 	pop	{r4, pc}
     a58:	40000210 	.word	0x40000210

00000a5c <VCOM_getchar>:
     a5c:	e92d4001 	push	{r0, lr}
     a60:	e59f0014 	ldr	r0, [pc, #20]	; a7c <VCOM_getchar+0x20>
     a64:	e28d1003 	add	r1, sp, #3
     a68:	eb000062 	bl	bf8 <fifo_get>
     a6c:	e3500000 	cmp	r0, #0
     a70:	15dd0003 	ldrbne	r0, [sp, #3]
     a74:	03e00000 	mvneq	r0, #0
     a78:	e8bd8008 	pop	{r3, pc}
     a7c:	4000025c 	.word	0x4000025c

00000a80 <main>:
     a80:	e92d4010 	push	{r4, lr}
     a84:	ebfffd9e 	bl	104 <HalSysInit>
     a88:	e3a00027 	mov	r0, #39	; 0x27
     a8c:	ebffff12 	bl	6dc <ConsoleInit>
     a90:	e59f00d8 	ldr	r0, [pc, #216]	; b70 <main+0xf0>
     a94:	ebffff3b 	bl	788 <puts>
     a98:	eb00045d 	bl	1c14 <USBInit>
     a9c:	e59f00d0 	ldr	r0, [pc, #208]	; b74 <main+0xf4>
     aa0:	eb000359 	bl	180c <USBRegisterDescriptors>
     aa4:	e59f20cc 	ldr	r2, [pc, #204]	; b78 <main+0xf8>
     aa8:	e3a00001 	mov	r0, #1
     aac:	e59f10c8 	ldr	r1, [pc, #200]	; b7c <main+0xfc>
     ab0:	eb000335 	bl	178c <USBRegisterRequestHandler>
     ab4:	e3a00081 	mov	r0, #129	; 0x81
     ab8:	e3a01000 	mov	r1, #0
     abc:	eb0000d9 	bl	e28 <USBHwRegisterEPIntHandler>
     ac0:	e3a00082 	mov	r0, #130	; 0x82
     ac4:	e59f10b4 	ldr	r1, [pc, #180]	; b80 <main+0x100>
     ac8:	eb0000d6 	bl	e28 <USBHwRegisterEPIntHandler>
     acc:	e59f10b0 	ldr	r1, [pc, #176]	; b84 <main+0x104>
     ad0:	e3a00005 	mov	r0, #5
     ad4:	eb0000d3 	bl	e28 <USBHwRegisterEPIntHandler>
     ad8:	e59f00a8 	ldr	r0, [pc, #168]	; b88 <main+0x108>
     adc:	eb0000f3 	bl	eb0 <USBHwRegisterFrameHandler>
     ae0:	e59f00a4 	ldr	r0, [pc, #164]	; b8c <main+0x10c>
     ae4:	eb0000e6 	bl	e84 <USBHwRegisterDevIntHandler>
     ae8:	ebffffc3 	bl	9fc <VCOM_init>
     aec:	e59f009c 	ldr	r0, [pc, #156]	; b90 <main+0x110>
     af0:	ebffff24 	bl	788 <puts>
     af4:	e59f2098 	ldr	r2, [pc, #152]	; b94 <main+0x114>
     af8:	e3e03000 	mvn	r3, #0
     afc:	e3a04001 	mov	r4, #1
     b00:	e5034da7 	str	r4, [r3, #-3495]	; 0xda7
     b04:	e5032ea7 	str	r2, [r3, #-3751]	; 0xea7
     b08:	e5132ff3 	ldr	r2, [r3, #-4083]	; 0xff3
     b0c:	e3c22501 	bic	r2, r2, #4194304	; 0x400000
     b10:	e5032ff3 	str	r2, [r3, #-4083]	; 0xff3
     b14:	e5132fef 	ldr	r2, [r3, #-4079]	; 0xfef
     b18:	e3822501 	orr	r2, r2, #4194304	; 0x400000
     b1c:	e5032fef 	str	r2, [r3, #-4079]	; 0xfef
     b20:	eb00006e 	bl	ce0 <enableIRQ>
     b24:	e1a00004 	mov	r0, r4
     b28:	eb0000f0 	bl	ef0 <USBHwConnect>
     b2c:	ebffffca 	bl	a5c <VCOM_getchar>
     b30:	e3700001 	cmn	r0, #1
     b34:	e1a04000 	mov	r4, r0
     b38:	0afffffb 	beq	b2c <main+0xac>
     b3c:	e2403009 	sub	r3, r0, #9
     b40:	e350000d 	cmp	r0, #13
     b44:	13530001 	cmpne	r3, #1
     b48:	9a000003 	bls	b5c <main+0xdc>
     b4c:	e2403020 	sub	r3, r0, #32
     b50:	e353005e 	cmp	r3, #94	; 0x5e
     b54:	83a0002e 	movhi	r0, #46	; 0x2e
     b58:	8a000000 	bhi	b60 <main+0xe0>
     b5c:	e1a00004 	mov	r0, r4
     b60:	ebfffeef 	bl	724 <putchar>
     b64:	e1a00004 	mov	r0, r4
     b68:	ebffffb1 	bl	a34 <VCOM_putchar>
     b6c:	eaffffee 	b	b2c <main+0xac>
     b70:	0000210f 	.word	0x0000210f
     b74:	00001f4c 	.word	0x00001f4c
     b78:	40000368 	.word	0x40000368
     b7c:	00000940 	.word	0x00000940
     b80:	000008a0 	.word	0x000008a0
     b84:	000008ac 	.word	0x000008ac
     b88:	00000868 	.word	0x00000868
     b8c:	000007b4 	.word	0x000007b4
     b90:	00002126 	.word	0x00002126
     b94:	000007cc 	.word	0x000007cc

00000b98 <fifo_init>:
     b98:	e3a03000 	mov	r3, #0
     b9c:	e5803000 	str	r3, [r0]
     ba0:	e5803004 	str	r3, [r0, #4]
     ba4:	e5801008 	str	r1, [r0, #8]
     ba8:	e12fff1e 	bx	lr

00000bac <fifo_put>:
     bac:	e5902000 	ldr	r2, [r0]
     bb0:	e59f303c 	ldr	r3, [pc, #60]	; bf4 <fifo_put+0x48>
     bb4:	e282c001 	add	ip, r2, #1
     bb8:	e00c3003 	and	r3, ip, r3
     bbc:	e3530000 	cmp	r3, #0
     bc0:	b2433001 	sublt	r3, r3, #1
     bc4:	b1e03c83 	mvnlt	r3, r3, lsl #25
     bc8:	e590c004 	ldr	ip, [r0, #4]
     bcc:	b1e03ca3 	mvnlt	r3, r3, lsr #25
     bd0:	b2833001 	addlt	r3, r3, #1
     bd4:	e153000c 	cmp	r3, ip
     bd8:	1590c008 	ldrne	ip, [r0, #8]
     bdc:	e20110ff 	and	r1, r1, #255	; 0xff
     be0:	17cc1002 	strbne	r1, [ip, r2]
     be4:	03a00000 	moveq	r0, #0
     be8:	15803000 	strne	r3, [r0]
     bec:	13a00001 	movne	r0, #1
     bf0:	e12fff1e 	bx	lr
     bf4:	8000007f 	.word	0x8000007f

00000bf8 <fifo_get>:
     bf8:	e890000c 	ldm	r0, {r2, r3}
     bfc:	e1520003 	cmp	r2, r3
     c00:	0a00000d 	beq	c3c <fifo_get+0x44>
     c04:	e5902008 	ldr	r2, [r0, #8]
     c08:	e7d22003 	ldrb	r2, [r2, r3]
     c0c:	e5c12000 	strb	r2, [r1]
     c10:	e2832001 	add	r2, r3, #1
     c14:	e59f3028 	ldr	r3, [pc, #40]	; c44 <fifo_get+0x4c>
     c18:	e0023003 	and	r3, r2, r3
     c1c:	e3530000 	cmp	r3, #0
     c20:	b2433001 	sublt	r3, r3, #1
     c24:	b1e03c83 	mvnlt	r3, r3, lsl #25
     c28:	b1e03ca3 	mvnlt	r3, r3, lsr #25
     c2c:	b2833001 	addlt	r3, r3, #1
     c30:	e5803004 	str	r3, [r0, #4]
     c34:	e3a00001 	mov	r0, #1
     c38:	e12fff1e 	bx	lr
     c3c:	e3a00000 	mov	r0, #0
     c40:	e12fff1e 	bx	lr
     c44:	8000007f 	.word	0x8000007f

00000c48 <fifo_avail>:
     c48:	e5903000 	ldr	r3, [r0]
     c4c:	e5902004 	ldr	r2, [r0, #4]
     c50:	e2833080 	add	r3, r3, #128	; 0x80
     c54:	e59f001c 	ldr	r0, [pc, #28]	; c78 <fifo_avail+0x30>
     c58:	e0623003 	rsb	r3, r2, r3
     c5c:	e0030000 	and	r0, r3, r0
     c60:	e3500000 	cmp	r0, #0
     c64:	b2400001 	sublt	r0, r0, #1
     c68:	b1e00c80 	mvnlt	r0, r0, lsl #25
     c6c:	b1e00ca0 	mvnlt	r0, r0, lsr #25
     c70:	b2800001 	addlt	r0, r0, #1
     c74:	e12fff1e 	bx	lr
     c78:	8000007f 	.word	0x8000007f

00000c7c <fifo_free>:
     c7c:	e5903000 	ldr	r3, [r0]
     c80:	e5902004 	ldr	r2, [r0, #4]
     c84:	e2833080 	add	r3, r3, #128	; 0x80
     c88:	e59f0020 	ldr	r0, [pc, #32]	; cb0 <fifo_free+0x34>
     c8c:	e0623003 	rsb	r3, r2, r3
     c90:	e0030000 	and	r0, r3, r0
     c94:	e3500000 	cmp	r0, #0
     c98:	b2400001 	sublt	r0, r0, #1
     c9c:	b1e00c80 	mvnlt	r0, r0, lsl #25
     ca0:	b1e00ca0 	mvnlt	r0, r0, lsr #25
     ca4:	b2800001 	addlt	r0, r0, #1
     ca8:	e260007f 	rsb	r0, r0, #127	; 0x7f
     cac:	e12fff1e 	bx	lr
     cb0:	8000007f 	.word	0x8000007f

00000cb4 <disableIRQ>:
     cb4:	e10f0000 	mrs	r0, CPSR
     cb8:	e3803080 	orr	r3, r0, #128	; 0x80
     cbc:	e129f003 	msr	CPSR_fc, r3
     cc0:	e12fff1e 	bx	lr

00000cc4 <restoreIRQ>:
     cc4:	e10f3000 	mrs	r3, CPSR
     cc8:	e3c32080 	bic	r2, r3, #128	; 0x80
     ccc:	e2000080 	and	r0, r0, #128	; 0x80
     cd0:	e1820000 	orr	r0, r2, r0
     cd4:	e129f000 	msr	CPSR_fc, r0
     cd8:	e1a00003 	mov	r0, r3
     cdc:	e12fff1e 	bx	lr

00000ce0 <enableIRQ>:
     ce0:	e10f0000 	mrs	r0, CPSR
     ce4:	e3c03080 	bic	r3, r0, #128	; 0x80
     ce8:	e129f003 	msr	CPSR_fc, r3
     cec:	e12fff1e 	bx	lr

00000cf0 <disableFIQ>:
     cf0:	e10f0000 	mrs	r0, CPSR
     cf4:	e3803040 	orr	r3, r0, #64	; 0x40
     cf8:	e129f003 	msr	CPSR_fc, r3
     cfc:	e12fff1e 	bx	lr

00000d00 <restoreFIQ>:
     d00:	e10f3000 	mrs	r3, CPSR
     d04:	e3c32040 	bic	r2, r3, #64	; 0x40
     d08:	e2000040 	and	r0, r0, #64	; 0x40
     d0c:	e1820000 	orr	r0, r2, r0
     d10:	e129f000 	msr	CPSR_fc, r0
     d14:	e1a00003 	mov	r0, r3
     d18:	e12fff1e 	bx	lr

00000d1c <enableFIQ>:
     d1c:	e10f0000 	mrs	r0, CPSR
     d20:	e3c03040 	bic	r3, r0, #64	; 0x40
     d24:	e129f003 	msr	CPSR_fc, r3
     d28:	e12fff1e 	bx	lr

00000d2c <Wait4DevInt>:
     d2c:	e59f3018 	ldr	r3, [pc, #24]	; d4c <Wait4DevInt+0x20>
     d30:	e5132dff 	ldr	r2, [r3, #-3583]	; 0xdff
     d34:	e0002002 	and	r2, r0, r2
     d38:	e1520000 	cmp	r2, r0
     d3c:	1afffffb 	bne	d30 <Wait4DevInt+0x4>
     d40:	e59f3004 	ldr	r3, [pc, #4]	; d4c <Wait4DevInt+0x20>
     d44:	e5030df7 	str	r0, [r3, #-3575]	; 0xdf7
     d48:	e12fff1e 	bx	lr
     d4c:	ffe0cfff 	.word	0xffe0cfff

00000d50 <USBHwCmd>:
     d50:	e59f3018 	ldr	r3, [pc, #24]	; d70 <USBHwCmd+0x20>
     d54:	e1a00800 	lsl	r0, r0, #16
     d58:	e3a02030 	mov	r2, #48	; 0x30
     d5c:	e3800c05 	orr	r0, r0, #1280	; 0x500
     d60:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     d64:	e5030def 	str	r0, [r3, #-3567]	; 0xdef
     d68:	e3a00010 	mov	r0, #16
     d6c:	eaffffee 	b	d2c <Wait4DevInt>
     d70:	ffe0cfff 	.word	0xffe0cfff

00000d74 <USBHwCmdWrite>:
     d74:	e92d4010 	push	{r4, lr}
     d78:	e1a04001 	mov	r4, r1
     d7c:	ebfffff3 	bl	d50 <USBHwCmd>
     d80:	e1a04804 	lsl	r4, r4, #16
     d84:	e59f3010 	ldr	r3, [pc, #16]	; d9c <USBHwCmdWrite+0x28>
     d88:	e3844c01 	orr	r4, r4, #256	; 0x100
     d8c:	e3a00010 	mov	r0, #16
     d90:	e5034def 	str	r4, [r3, #-3567]	; 0xdef
     d94:	e8bd4010 	pop	{r4, lr}
     d98:	eaffffe3 	b	d2c <Wait4DevInt>
     d9c:	ffe0cfff 	.word	0xffe0cfff

00000da0 <USBHwCmdRead>:
     da0:	e92d4010 	push	{r4, lr}
     da4:	e1a04000 	mov	r4, r0
     da8:	e1a04804 	lsl	r4, r4, #16
     dac:	ebffffe7 	bl	d50 <USBHwCmd>
     db0:	e3843c02 	orr	r3, r4, #512	; 0x200
     db4:	e59f4014 	ldr	r4, [pc, #20]	; dd0 <USBHwCmdRead+0x30>
     db8:	e3a00020 	mov	r0, #32
     dbc:	e5043def 	str	r3, [r4, #-3567]	; 0xdef
     dc0:	ebffffd9 	bl	d2c <Wait4DevInt>
     dc4:	e5140deb 	ldr	r0, [r4, #-3563]	; 0xdeb
     dc8:	e20000ff 	and	r0, r0, #255	; 0xff
     dcc:	e8bd8010 	pop	{r4, pc}
     dd0:	ffe0cfff 	.word	0xffe0cfff

00000dd4 <USBHwEPConfig>:
     dd4:	e20030ff 	and	r3, r0, #255	; 0xff
     dd8:	e92d4010 	push	{r4, lr}
     ddc:	e1a033a3 	lsr	r3, r3, #7
     de0:	e200400f 	and	r4, r0, #15
     de4:	e1834084 	orr	r4, r3, r4, lsl #1
     de8:	e59f3034 	ldr	r3, [pc, #52]	; e24 <USBHwEPConfig+0x50>
     dec:	e5132dbb 	ldr	r2, [r3, #-3515]	; 0xdbb
     df0:	e3a00001 	mov	r0, #1
     df4:	e1822410 	orr	r2, r2, r0, lsl r4
     df8:	e1a01801 	lsl	r1, r1, #16
     dfc:	e1a01821 	lsr	r1, r1, #16
     e00:	e5032dbb 	str	r2, [r3, #-3515]	; 0xdbb
     e04:	e28000ff 	add	r0, r0, #255	; 0xff
     e08:	e5034db7 	str	r4, [r3, #-3511]	; 0xdb7
     e0c:	e5031db3 	str	r1, [r3, #-3507]	; 0xdb3
     e10:	ebffffc5 	bl	d2c <Wait4DevInt>
     e14:	e3840040 	orr	r0, r4, #64	; 0x40
     e18:	e3a01000 	mov	r1, #0
     e1c:	e8bd4010 	pop	{r4, lr}
     e20:	eaffffd3 	b	d74 <USBHwCmdWrite>
     e24:	ffe0cfff 	.word	0xffe0cfff

00000e28 <USBHwRegisterEPIntHandler>:
     e28:	e20030ff 	and	r3, r0, #255	; 0xff
     e2c:	e1a023a3 	lsr	r2, r3, #7
     e30:	e200000f 	and	r0, r0, #15
     e34:	e1820080 	orr	r0, r2, r0, lsl #1
     e38:	e59f2038 	ldr	r2, [pc, #56]	; e78 <USBHwRegisterEPIntHandler+0x50>
     e3c:	e1a0c0a0 	lsr	ip, r0, #1
     e40:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e44:	e782110c 	str	r1, [r2, ip, lsl #2]
     e48:	e59f202c 	ldr	r2, [pc, #44]	; e7c <USBHwRegisterEPIntHandler+0x54>
     e4c:	e5121dcb 	ldr	r1, [r2, #-3531]	; 0xdcb
     e50:	e3a0c001 	mov	ip, #1
     e54:	e181001c 	orr	r0, r1, ip, lsl r0
     e58:	e5020dcb 	str	r0, [r2, #-3531]	; 0xdcb
     e5c:	e5121dfb 	ldr	r1, [r2, #-3579]	; 0xdfb
     e60:	e59f0018 	ldr	r0, [pc, #24]	; e80 <USBHwRegisterEPIntHandler+0x58>
     e64:	e3811004 	orr	r1, r1, #4
     e68:	e5021dfb 	str	r1, [r2, #-3579]	; 0xdfb
     e6c:	e1a01003 	mov	r1, r3
     e70:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e74:	eafffe03 	b	688 <printf>
     e78:	40000370 	.word	0x40000370
     e7c:	ffe0cfff 	.word	0xffe0cfff
     e80:	00002154 	.word	0x00002154

00000e84 <USBHwRegisterDevIntHandler>:
     e84:	e59f3018 	ldr	r3, [pc, #24]	; ea4 <USBHwRegisterDevIntHandler+0x20>
     e88:	e5830040 	str	r0, [r3, #64]	; 0x40
     e8c:	e59f3014 	ldr	r3, [pc, #20]	; ea8 <USBHwRegisterDevIntHandler+0x24>
     e90:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     e94:	e59f0010 	ldr	r0, [pc, #16]	; eac <USBHwRegisterDevIntHandler+0x28>
     e98:	e3822008 	orr	r2, r2, #8
     e9c:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     ea0:	eafffe38 	b	788 <puts>
     ea4:	40000370 	.word	0x40000370
     ea8:	ffe0cfff 	.word	0xffe0cfff
     eac:	00002174 	.word	0x00002174

00000eb0 <USBHwRegisterFrameHandler>:
     eb0:	e59f3018 	ldr	r3, [pc, #24]	; ed0 <USBHwRegisterFrameHandler+0x20>
     eb4:	e5830044 	str	r0, [r3, #68]	; 0x44
     eb8:	e59f3014 	ldr	r3, [pc, #20]	; ed4 <USBHwRegisterFrameHandler+0x24>
     ebc:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     ec0:	e59f0010 	ldr	r0, [pc, #16]	; ed8 <USBHwRegisterFrameHandler+0x28>
     ec4:	e3822001 	orr	r2, r2, #1
     ec8:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     ecc:	eafffe2d 	b	788 <puts>
     ed0:	40000370 	.word	0x40000370
     ed4:	ffe0cfff 	.word	0xffe0cfff
     ed8:	00002199 	.word	0x00002199

00000edc <USBHwSetAddress>:
     edc:	e1e01c80 	mvn	r1, r0, lsl #25
     ee0:	e1e01ca1 	mvn	r1, r1, lsr #25
     ee4:	e20110ff 	and	r1, r1, #255	; 0xff
     ee8:	e3a000d0 	mov	r0, #208	; 0xd0
     eec:	eaffffa0 	b	d74 <USBHwCmdWrite>

00000ef0 <USBHwConnect>:
     ef0:	e2501000 	subs	r1, r0, #0
     ef4:	159f3020 	ldrne	r3, [pc, #32]	; f1c <USBHwConnect+0x2c>
     ef8:	059f301c 	ldreq	r3, [pc, #28]	; f1c <USBHwConnect+0x2c>
     efc:	13a02901 	movne	r2, #16384	; 0x4000
     f00:	03a02901 	moveq	r2, #16384	; 0x4000
     f04:	15032fe3 	strne	r2, [r3, #-4067]	; 0xfe3
     f08:	05032fe7 	streq	r2, [r3, #-4071]	; 0xfe7
     f0c:	e3a000fe 	mov	r0, #254	; 0xfe
     f10:	e2511000 	subs	r1, r1, #0
     f14:	13a01001 	movne	r1, #1
     f18:	eaffff95 	b	d74 <USBHwCmdWrite>
     f1c:	3fffcfff 	.word	0x3fffcfff

00000f20 <USBHwNakIntEnable>:
     f20:	e20010ff 	and	r1, r0, #255	; 0xff
     f24:	e3a000f3 	mov	r0, #243	; 0xf3
     f28:	eaffff91 	b	d74 <USBHwCmdWrite>

00000f2c <USBHwEPGetStatus>:
     f2c:	e20030ff 	and	r3, r0, #255	; 0xff
     f30:	e1a033a3 	lsr	r3, r3, #7
     f34:	e200000f 	and	r0, r0, #15
     f38:	e1830080 	orr	r0, r3, r0, lsl #1
     f3c:	eaffff97 	b	da0 <USBHwCmdRead>

00000f40 <USBHwEPStall>:
     f40:	e20030ff 	and	r3, r0, #255	; 0xff
     f44:	e1a033a3 	lsr	r3, r3, #7
     f48:	e200000f 	and	r0, r0, #15
     f4c:	e1830080 	orr	r0, r3, r0, lsl #1
     f50:	e3800040 	orr	r0, r0, #64	; 0x40
     f54:	e2511000 	subs	r1, r1, #0
     f58:	13a01001 	movne	r1, #1
     f5c:	eaffff84 	b	d74 <USBHwCmdWrite>

00000f60 <USBHwEPWrite>:
     f60:	e92d4010 	push	{r4, lr}
     f64:	e1a04002 	mov	r4, r2
     f68:	e20020ff 	and	r2, r0, #255	; 0xff
     f6c:	e200300f 	and	r3, r0, #15
     f70:	e1a003a2 	lsr	r0, r2, #7
     f74:	e1800083 	orr	r0, r0, r3, lsl #1
     f78:	e1a03103 	lsl	r3, r3, #2
     f7c:	e3832002 	orr	r2, r3, #2
     f80:	e59f3058 	ldr	r3, [pc, #88]	; fe0 <USBHwEPWrite+0x80>
     f84:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     f88:	e5034ddb 	str	r4, [r3, #-3547]	; 0xddb
     f8c:	ea000008 	b	fb4 <USBHwEPWrite+0x54>
     f90:	e5512002 	ldrb	r2, [r1, #-2]
     f94:	e551c001 	ldrb	ip, [r1, #-1]
     f98:	e1a02802 	lsl	r2, r2, #16
     f9c:	e1822c0c 	orr	r2, r2, ip, lsl #24
     fa0:	e551c004 	ldrb	ip, [r1, #-4]
     fa4:	e182200c 	orr	r2, r2, ip
     fa8:	e551c003 	ldrb	ip, [r1, #-3]
     fac:	e182240c 	orr	r2, r2, ip, lsl #8
     fb0:	e5032de3 	str	r2, [r3, #-3555]	; 0xde3
     fb4:	e5132dd7 	ldr	r2, [r3, #-3543]	; 0xdd7
     fb8:	e2122002 	ands	r2, r2, #2
     fbc:	e2811004 	add	r1, r1, #4
     fc0:	1afffff2 	bne	f90 <USBHwEPWrite+0x30>
     fc4:	e59f3014 	ldr	r3, [pc, #20]	; fe0 <USBHwEPWrite+0x80>
     fc8:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     fcc:	ebffff5f 	bl	d50 <USBHwCmd>
     fd0:	e3a000fa 	mov	r0, #250	; 0xfa
     fd4:	ebffff5d 	bl	d50 <USBHwCmd>
     fd8:	e1a00004 	mov	r0, r4
     fdc:	e8bd8010 	pop	{r4, pc}
     fe0:	ffe0cfff 	.word	0xffe0cfff

00000fe4 <USBHwEPRead>:
     fe4:	e200c0ff 	and	ip, r0, #255	; 0xff
     fe8:	e200000f 	and	r0, r0, #15
     fec:	e92d4030 	push	{r4, r5, lr}
     ff0:	e59f3084 	ldr	r3, [pc, #132]	; 107c <USBHwEPRead+0x98>
     ff4:	e1a04100 	lsl	r4, r0, #2
     ff8:	e3844001 	orr	r4, r4, #1
     ffc:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
    1000:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
    1004:	e3140b02 	tst	r4, #2048	; 0x800
    1008:	0afffffc 	beq	1000 <USBHwEPRead+0x1c>
    100c:	e3140b01 	tst	r4, #1024	; 0x400
    1010:	03e04000 	mvneq	r4, #0
    1014:	0a000016 	beq	1074 <USBHwEPRead+0x90>
    1018:	e1a04b04 	lsl	r4, r4, #22
    101c:	e3a0e000 	mov	lr, #0
    1020:	e1a04b24 	lsr	r4, r4, #22
    1024:	e1a0300e 	mov	r3, lr
    1028:	e59f504c 	ldr	r5, [pc, #76]	; 107c <USBHwEPRead+0x98>
    102c:	ea000006 	b	104c <USBHwEPRead+0x68>
    1030:	e3130003 	tst	r3, #3
    1034:	0515ede7 	ldreq	lr, [r5, #-3559]	; 0xde7
    1038:	e3510000 	cmp	r1, #0
    103c:	11530002 	cmpne	r3, r2
    1040:	b7c1e003 	strblt	lr, [r1, r3]
    1044:	e1a0e42e 	lsr	lr, lr, #8
    1048:	e2833001 	add	r3, r3, #1
    104c:	e1530004 	cmp	r3, r4
    1050:	1afffff6 	bne	1030 <USBHwEPRead+0x4c>
    1054:	e59f3020 	ldr	r3, [pc, #32]	; 107c <USBHwEPRead+0x98>
    1058:	e3a02000 	mov	r2, #0
    105c:	e1a0c3ac 	lsr	ip, ip, #7
    1060:	e18c0080 	orr	r0, ip, r0, lsl #1
    1064:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
    1068:	ebffff38 	bl	d50 <USBHwCmd>
    106c:	e3a000f2 	mov	r0, #242	; 0xf2
    1070:	ebffff36 	bl	d50 <USBHwCmd>
    1074:	e1a00004 	mov	r0, r4
    1078:	e8bd8030 	pop	{r4, r5, pc}
    107c:	ffe0cfff 	.word	0xffe0cfff

00001080 <USBHwISOCEPRead>:
    1080:	e200c0ff 	and	ip, r0, #255	; 0xff
    1084:	e200000f 	and	r0, r0, #15
    1088:	e92d4030 	push	{r4, r5, lr}
    108c:	e59f308c 	ldr	r3, [pc, #140]	; 1120 <USBHwISOCEPRead+0xa0>
    1090:	e1a04100 	lsl	r4, r0, #2
    1094:	e3844001 	orr	r4, r4, #1
    1098:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
    109c:	e1a00000 	nop			; (mov r0, r0)
    10a0:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
    10a4:	e2145b02 	ands	r5, r4, #2048	; 0x800
    10a8:	0a000001 	beq	10b4 <USBHwISOCEPRead+0x34>
    10ac:	e2145b01 	ands	r5, r4, #1024	; 0x400
    10b0:	1a000002 	bne	10c0 <USBHwISOCEPRead+0x40>
    10b4:	e5035dd7 	str	r5, [r3, #-3543]	; 0xdd7
    10b8:	e3e04000 	mvn	r4, #0
    10bc:	ea000015 	b	1118 <USBHwISOCEPRead+0x98>
    10c0:	e1a04b04 	lsl	r4, r4, #22
    10c4:	e3a05000 	mov	r5, #0
    10c8:	e1a04b24 	lsr	r4, r4, #22
    10cc:	e1a0e005 	mov	lr, r5
    10d0:	ea000006 	b	10f0 <USBHwISOCEPRead+0x70>
    10d4:	e31e0003 	tst	lr, #3
    10d8:	05135de7 	ldreq	r5, [r3, #-3559]	; 0xde7
    10dc:	e3510000 	cmp	r1, #0
    10e0:	115e0002 	cmpne	lr, r2
    10e4:	b7c1500e 	strblt	r5, [r1, lr]
    10e8:	e1a05425 	lsr	r5, r5, #8
    10ec:	e28ee001 	add	lr, lr, #1
    10f0:	e15e0004 	cmp	lr, r4
    10f4:	1afffff6 	bne	10d4 <USBHwISOCEPRead+0x54>
    10f8:	e59f3020 	ldr	r3, [pc, #32]	; 1120 <USBHwISOCEPRead+0xa0>
    10fc:	e3a02000 	mov	r2, #0
    1100:	e1a0c3ac 	lsr	ip, ip, #7
    1104:	e18c0080 	orr	r0, ip, r0, lsl #1
    1108:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
    110c:	ebffff0f 	bl	d50 <USBHwCmd>
    1110:	e3a000f2 	mov	r0, #242	; 0xf2
    1114:	ebffff0d 	bl	d50 <USBHwCmd>
    1118:	e1a00004 	mov	r0, r4
    111c:	e8bd8030 	pop	{r4, r5, pc}
    1120:	ffe0cfff 	.word	0xffe0cfff

00001124 <USBHwConfigDevice>:
    1124:	e2501000 	subs	r1, r0, #0
    1128:	13a01001 	movne	r1, #1
    112c:	e3a000d8 	mov	r0, #216	; 0xd8
    1130:	eaffff0f 	b	d74 <USBHwCmdWrite>

00001134 <USBHwISR>:
    1134:	e59f3120 	ldr	r3, [pc, #288]	; 125c <USBHwISR+0x128>
    1138:	e3a02002 	mov	r2, #2
    113c:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
    1140:	e5032fa7 	str	r2, [r3, #-4007]	; 0xfa7
    1144:	e59f3114 	ldr	r3, [pc, #276]	; 1260 <USBHwISR+0x12c>
    1148:	e5134dff 	ldr	r4, [r3, #-3583]	; 0xdff
    114c:	e3140001 	tst	r4, #1
    1150:	0a000009 	beq	117c <USBHwISR+0x48>
    1154:	e3a02001 	mov	r2, #1
    1158:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    115c:	e59f3100 	ldr	r3, [pc, #256]	; 1264 <USBHwISR+0x130>
    1160:	e5935044 	ldr	r5, [r3, #68]	; 0x44
    1164:	e3550000 	cmp	r5, #0
    1168:	0a000003 	beq	117c <USBHwISR+0x48>
    116c:	e3a000f5 	mov	r0, #245	; 0xf5
    1170:	ebffff0a 	bl	da0 <USBHwCmdRead>
    1174:	e1a0e00f 	mov	lr, pc
    1178:	e12fff15 	bx	r5
    117c:	e3140008 	tst	r4, #8
    1180:	0a000011 	beq	11cc <USBHwISR+0x98>
    1184:	e59f30d4 	ldr	r3, [pc, #212]	; 1260 <USBHwISR+0x12c>
    1188:	e3a02008 	mov	r2, #8
    118c:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    1190:	e3a000fe 	mov	r0, #254	; 0xfe
    1194:	ebffff01 	bl	da0 <USBHwCmdRead>
    1198:	e310001a 	tst	r0, #26
    119c:	0a00000a 	beq	11cc <USBHwISR+0x98>
    11a0:	e59f30bc 	ldr	r3, [pc, #188]	; 1264 <USBHwISR+0x130>
    11a4:	e5933040 	ldr	r3, [r3, #64]	; 0x40
    11a8:	e3530000 	cmp	r3, #0
    11ac:	0a000006 	beq	11cc <USBHwISR+0x98>
    11b0:	e59f50a4 	ldr	r5, [pc, #164]	; 125c <USBHwISR+0x128>
    11b4:	e3a06001 	mov	r6, #1
    11b8:	e5056fa7 	str	r6, [r5, #-4007]	; 0xfa7
    11bc:	e2000015 	and	r0, r0, #21
    11c0:	e1a0e00f 	mov	lr, pc
    11c4:	e12fff13 	bx	r3
    11c8:	e5056fa3 	str	r6, [r5, #-4003]	; 0xfa3
    11cc:	e3140004 	tst	r4, #4
    11d0:	0a00001d 	beq	124c <USBHwISR+0x118>
    11d4:	e59f5084 	ldr	r5, [pc, #132]	; 1260 <USBHwISR+0x12c>
    11d8:	e3a06004 	mov	r6, #4
    11dc:	e5056df7 	str	r6, [r5, #-3575]	; 0xdf7
    11e0:	e59f807c 	ldr	r8, [pc, #124]	; 1264 <USBHwISR+0x130>
    11e4:	e59f7070 	ldr	r7, [pc, #112]	; 125c <USBHwISR+0x128>
    11e8:	e3a04000 	mov	r4, #0
    11ec:	e3a0a001 	mov	sl, #1
    11f0:	e1a0341a 	lsl	r3, sl, r4
    11f4:	e5152dcf 	ldr	r2, [r5, #-3535]	; 0xdcf
    11f8:	e1130002 	tst	r3, r2
    11fc:	0a00000f 	beq	1240 <USBHwISR+0x10c>
    1200:	e5053dc7 	str	r3, [r5, #-3527]	; 0xdc7
    1204:	e3a00020 	mov	r0, #32
    1208:	ebfffec7 	bl	d2c <Wait4DevInt>
    120c:	e1a020c4 	asr	r2, r4, #1
    1210:	e7983102 	ldr	r3, [r8, r2, lsl #2]
    1214:	e3530000 	cmp	r3, #0
    1218:	e5151deb 	ldr	r1, [r5, #-3563]	; 0xdeb
    121c:	0a000007 	beq	1240 <USBHwISR+0x10c>
    1220:	e202200f 	and	r2, r2, #15
    1224:	e1820384 	orr	r0, r2, r4, lsl #7
    1228:	e5076fa7 	str	r6, [r7, #-4007]	; 0xfa7
    122c:	e200008f 	and	r0, r0, #143	; 0x8f
    1230:	e201101f 	and	r1, r1, #31
    1234:	e1a0e00f 	mov	lr, pc
    1238:	e12fff13 	bx	r3
    123c:	e5076fa3 	str	r6, [r7, #-4003]	; 0xfa3
    1240:	e2844001 	add	r4, r4, #1
    1244:	e3540020 	cmp	r4, #32
    1248:	1affffe8 	bne	11f0 <USBHwISR+0xbc>
    124c:	e59f3008 	ldr	r3, [pc, #8]	; 125c <USBHwISR+0x128>
    1250:	e3a02002 	mov	r2, #2
    1254:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
    1258:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
    125c:	3fffcfff 	.word	0x3fffcfff
    1260:	ffe0cfff 	.word	0xffe0cfff
    1264:	40000370 	.word	0x40000370

00001268 <USBHwInit>:
    1268:	e59f312c 	ldr	r3, [pc, #300]	; 139c <USBHwInit+0x134>
    126c:	e5932004 	ldr	r2, [r3, #4]
    1270:	e3c22103 	bic	r2, r2, #-1073741824	; 0xc0000000
    1274:	e3822101 	orr	r2, r2, #1073741824	; 0x40000000
    1278:	e92d4010 	push	{r4, lr}
    127c:	e5832004 	str	r2, [r3, #4]
    1280:	e593200c 	ldr	r2, [r3, #12]
    1284:	e3c22203 	bic	r2, r2, #805306368	; 0x30000000
    1288:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
    128c:	e583200c 	str	r2, [r3, #12]
    1290:	e5932000 	ldr	r2, [r3]
    1294:	e3c2230f 	bic	r2, r2, #1006632960	; 0x3c000000
    1298:	e3822301 	orr	r2, r2, #67108864	; 0x4000000
    129c:	e5832000 	str	r2, [r3]
    12a0:	e59f30f8 	ldr	r3, [pc, #248]	; 13a0 <USBHwInit+0x138>
    12a4:	e5132fff 	ldr	r2, [r3, #-4095]	; 0xfff
    12a8:	e3822901 	orr	r2, r2, #16384	; 0x4000
    12ac:	e5032fff 	str	r2, [r3, #-4095]	; 0xfff
    12b0:	e3a02901 	mov	r2, #16384	; 0x4000
    12b4:	e5032fe7 	str	r2, [r3, #-4071]	; 0xfe7
    12b8:	e59f30e4 	ldr	r3, [pc, #228]	; 13a4 <USBHwInit+0x13c>
    12bc:	e59320c4 	ldr	r2, [r3, #196]	; 0xc4
    12c0:	e3822102 	orr	r2, r2, #-2147483648	; 0x80000000
    12c4:	e58320c4 	str	r2, [r3, #196]	; 0xc4
    12c8:	e3a02005 	mov	r2, #5
    12cc:	e5832108 	str	r2, [r3, #264]	; 0x108
    12d0:	e59f30d0 	ldr	r3, [pc, #208]	; 13a8 <USBHwInit+0x140>
    12d4:	e2822015 	add	r2, r2, #21
    12d8:	e503200b 	str	r2, [r3, #-11]
    12dc:	e1a02003 	mov	r2, r3
    12e0:	e5121007 	ldr	r1, [r2, #-7]
    12e4:	e311001a 	tst	r1, #26
    12e8:	e59f30b8 	ldr	r3, [pc, #184]	; 13a8 <USBHwInit+0x140>
    12ec:	0afffffb 	beq	12e0 <USBHwInit+0x78>
    12f0:	e3a02003 	mov	r2, #3
    12f4:	e5032eef 	str	r2, [r3, #-3823]	; 0xeef
    12f8:	e3a04000 	mov	r4, #0
    12fc:	e3e02000 	mvn	r2, #0
    1300:	e5034dfb 	str	r4, [r3, #-3579]	; 0xdfb
    1304:	e1a00004 	mov	r0, r4
    1308:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    130c:	e5034dd3 	str	r4, [r3, #-3539]	; 0xdd3
    1310:	e5034dcb 	str	r4, [r3, #-3531]	; 0xdcb
    1314:	e5032dc7 	str	r2, [r3, #-3527]	; 0xdc7
    1318:	e5034dbf 	str	r4, [r3, #-3519]	; 0xdbf
    131c:	ebfffeff 	bl	f20 <USBHwNakIntEnable>
    1320:	e59f207c 	ldr	r2, [pc, #124]	; 13a4 <USBHwInit+0x13c>
    1324:	e59231a0 	ldr	r3, [r2, #416]	; 0x1a0
    1328:	e59f106c 	ldr	r1, [pc, #108]	; 139c <USBHwInit+0x134>
    132c:	e3833001 	orr	r3, r3, #1
    1330:	e58231a0 	str	r3, [r2, #416]	; 0x1a0
    1334:	e5814028 	str	r4, [r1, #40]	; 0x28
    1338:	e59f3060 	ldr	r3, [pc, #96]	; 13a0 <USBHwInit+0x138>
    133c:	e5130fbf 	ldr	r0, [r3, #-4031]	; 0xfbf
    1340:	e3800001 	orr	r0, r0, #1
    1344:	e5030fbf 	str	r0, [r3, #-4031]	; 0xfbf
    1348:	e3a00001 	mov	r0, #1
    134c:	e5030fa3 	str	r0, [r3, #-4003]	; 0xfa3
    1350:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
    1354:	e18cc000 	orr	ip, ip, r0
    1358:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
    135c:	e5814028 	str	r4, [r1, #40]	; 0x28
    1360:	e513cfbf 	ldr	ip, [r3, #-4031]	; 0xfbf
    1364:	e38cc002 	orr	ip, ip, #2
    1368:	e503cfbf 	str	ip, [r3, #-4031]	; 0xfbf
    136c:	e3a0c002 	mov	ip, #2
    1370:	e503cfa3 	str	ip, [r3, #-4003]	; 0xfa3
    1374:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
    1378:	e18cc000 	orr	ip, ip, r0
    137c:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
    1380:	e5814028 	str	r4, [r1, #40]	; 0x28
    1384:	e5132fbf 	ldr	r2, [r3, #-4031]	; 0xfbf
    1388:	e3822004 	orr	r2, r2, #4
    138c:	e5032fbf 	str	r2, [r3, #-4031]	; 0xfbf
    1390:	e3a02004 	mov	r2, #4
    1394:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
    1398:	e8bd8010 	pop	{r4, pc}
    139c:	e002c000 	.word	0xe002c000
    13a0:	3fffcfff 	.word	0x3fffcfff
    13a4:	e01fc000 	.word	0xe01fc000
    13a8:	ffe0cfff 	.word	0xffe0cfff

000013ac <USBSetupDMADescriptor>:
    13ac:	e92d4030 	push	{r4, r5, lr}
    13b0:	e3a05000 	mov	r5, #0
    13b4:	e5805004 	str	r5, [r0, #4]
    13b8:	e5801000 	str	r1, [r0]
    13bc:	e5905004 	ldr	r5, [r0, #4]
    13c0:	e1a03b03 	lsl	r3, r3, #22
    13c4:	e18558a3 	orr	r5, r5, r3, lsr #17
    13c8:	e5805004 	str	r5, [r0, #4]
    13cc:	e1dd40bc 	ldrh	r4, [sp, #12]
    13d0:	e5903004 	ldr	r3, [r0, #4]
    13d4:	e1834804 	orr	r4, r3, r4, lsl #16
    13d8:	e5804004 	str	r4, [r0, #4]
    13dc:	e21220ff 	ands	r2, r2, #255	; 0xff
    13e0:	15903004 	ldrne	r3, [r0, #4]
    13e4:	13833010 	orrne	r3, r3, #16
    13e8:	15803004 	strne	r3, [r0, #4]
    13ec:	e3510000 	cmp	r1, #0
    13f0:	15903004 	ldrne	r3, [r0, #4]
    13f4:	13833004 	orrne	r3, r3, #4
    13f8:	15803004 	strne	r3, [r0, #4]
    13fc:	e28d3010 	add	r3, sp, #16
    1400:	e8931008 	ldm	r3, {r3, ip}
    1404:	e35c0000 	cmp	ip, #0
    1408:	13520000 	cmpne	r2, #0
    140c:	e5803008 	str	r3, [r0, #8]
    1410:	e3a03000 	mov	r3, #0
    1414:	1580c010 	strne	ip, [r0, #16]
    1418:	e580300c 	str	r3, [r0, #12]
    141c:	e8bd8030 	pop	{r4, r5, pc}

00001420 <USBDisableDMAForEndpoint>:
    1420:	e20030ff 	and	r3, r0, #255	; 0xff
    1424:	e1a033a3 	lsr	r3, r3, #7
    1428:	e200000f 	and	r0, r0, #15
    142c:	e1830080 	orr	r0, r3, r0, lsl #1
    1430:	e3a03001 	mov	r3, #1
    1434:	e1a00013 	lsl	r0, r3, r0
    1438:	e59f3004 	ldr	r3, [pc, #4]	; 1444 <USBDisableDMAForEndpoint+0x24>
    143c:	e5030d73 	str	r0, [r3, #-3443]	; 0xd73
    1440:	e12fff1e 	bx	lr
    1444:	ffe0cfff 	.word	0xffe0cfff

00001448 <USBEnableDMAForEndpoint>:
    1448:	e20030ff 	and	r3, r0, #255	; 0xff
    144c:	e1a033a3 	lsr	r3, r3, #7
    1450:	e200000f 	and	r0, r0, #15
    1454:	e1830080 	orr	r0, r3, r0, lsl #1
    1458:	e3a03001 	mov	r3, #1
    145c:	e1a00013 	lsl	r0, r3, r0
    1460:	e59f3004 	ldr	r3, [pc, #4]	; 146c <USBEnableDMAForEndpoint+0x24>
    1464:	e5030d77 	str	r0, [r3, #-3447]	; 0xd77
    1468:	e12fff1e 	bx	lr
    146c:	ffe0cfff 	.word	0xffe0cfff

00001470 <USBInitializeISOCFrameArray>:
    1470:	e1a03b03 	lsl	r3, r3, #22
    1474:	e1a02802 	lsl	r2, r2, #16
    1478:	e1a03b23 	lsr	r3, r3, #22
    147c:	e92d4010 	push	{r4, lr}
    1480:	e1a02822 	lsr	r2, r2, #16
    1484:	e3a0c000 	mov	ip, #0
    1488:	e3833902 	orr	r3, r3, #32768	; 0x8000
    148c:	ea000004 	b	14a4 <USBInitializeISOCFrameArray+0x34>
    1490:	e1834804 	orr	r4, r3, r4, lsl #16
    1494:	e780410c 	str	r4, [r0, ip, lsl #2]
    1498:	e28cc001 	add	ip, ip, #1
    149c:	e1a0c80c 	lsl	ip, ip, #16
    14a0:	e1a0c82c 	lsr	ip, ip, #16
    14a4:	e08c4002 	add	r4, ip, r2
    14a8:	e1a04804 	lsl	r4, r4, #16
    14ac:	e15c0001 	cmp	ip, r1
    14b0:	e1a04824 	lsr	r4, r4, #16
    14b4:	3afffff5 	bcc	1490 <USBInitializeISOCFrameArray+0x20>
    14b8:	e8bd8010 	pop	{r4, pc}

000014bc <USBSetHeadDDForDMA>:
    14bc:	e20030ff 	and	r3, r0, #255	; 0xff
    14c0:	e1a033a3 	lsr	r3, r3, #7
    14c4:	e200000f 	and	r0, r0, #15
    14c8:	e1830080 	orr	r0, r3, r0, lsl #1
    14cc:	e7812100 	str	r2, [r1, r0, lsl #2]
    14d0:	e12fff1e 	bx	lr

000014d4 <USBInitializeUSBDMA>:
    14d4:	e3a03000 	mov	r3, #0
    14d8:	e1a02003 	mov	r2, r3
    14dc:	e7802003 	str	r2, [r0, r3]
    14e0:	e2833004 	add	r3, r3, #4
    14e4:	e3530080 	cmp	r3, #128	; 0x80
    14e8:	1afffffb 	bne	14dc <USBInitializeUSBDMA+0x8>
    14ec:	e59f3004 	ldr	r3, [pc, #4]	; 14f8 <USBInitializeUSBDMA+0x24>
    14f0:	e5030d7f 	str	r0, [r3, #-3455]	; 0xd7f
    14f4:	e12fff1e 	bx	lr
    14f8:	ffe0cfff 	.word	0xffe0cfff

000014fc <StallControlPipe>:
    14fc:	e92d4070 	push	{r4, r5, r6, lr}
    1500:	e3a01001 	mov	r1, #1
    1504:	e1a05000 	mov	r5, r0
    1508:	e3a00080 	mov	r0, #128	; 0x80
    150c:	ebfffe8b 	bl	f40 <USBHwEPStall>
    1510:	e59f002c 	ldr	r0, [pc, #44]	; 1544 <StallControlPipe+0x48>
    1514:	ebfffc5b 	bl	688 <printf>
    1518:	e59f6028 	ldr	r6, [pc, #40]	; 1548 <StallControlPipe+0x4c>
    151c:	e59f4028 	ldr	r4, [pc, #40]	; 154c <StallControlPipe+0x50>
    1520:	e4d41001 	ldrb	r1, [r4], #1
    1524:	e59f0024 	ldr	r0, [pc, #36]	; 1550 <StallControlPipe+0x54>
    1528:	ebfffc56 	bl	688 <printf>
    152c:	e1540006 	cmp	r4, r6
    1530:	1afffffa 	bne	1520 <StallControlPipe+0x24>
    1534:	e59f0018 	ldr	r0, [pc, #24]	; 1554 <StallControlPipe+0x58>
    1538:	e1a01005 	mov	r1, r5
    153c:	e8bd4070 	pop	{r4, r5, r6, lr}
    1540:	eafffc50 	b	688 <printf>
    1544:	000021b6 	.word	0x000021b6
    1548:	400003c0 	.word	0x400003c0
    154c:	400003b8 	.word	0x400003b8
    1550:	000021c1 	.word	0x000021c1
    1554:	000021c7 	.word	0x000021c7

00001558 <DataIn>:
    1558:	e92d4030 	push	{r4, r5, lr}
    155c:	e59f4034 	ldr	r4, [pc, #52]	; 1598 <DataIn+0x40>
    1560:	e5945008 	ldr	r5, [r4, #8]
    1564:	e3550040 	cmp	r5, #64	; 0x40
    1568:	a3a05040 	movge	r5, #64	; 0x40
    156c:	e1a02005 	mov	r2, r5
    1570:	e3a00080 	mov	r0, #128	; 0x80
    1574:	e594100c 	ldr	r1, [r4, #12]
    1578:	ebfffe78 	bl	f60 <USBHwEPWrite>
    157c:	e594300c 	ldr	r3, [r4, #12]
    1580:	e0833005 	add	r3, r3, r5
    1584:	e584300c 	str	r3, [r4, #12]
    1588:	e5943008 	ldr	r3, [r4, #8]
    158c:	e0655003 	rsb	r5, r5, r3
    1590:	e5845008 	str	r5, [r4, #8]
    1594:	e8bd8030 	pop	{r4, r5, pc}
    1598:	400003b8 	.word	0x400003b8

0000159c <_HandleRequest.clone.0>:
    159c:	e92d4010 	push	{r4, lr}
    15a0:	e59f003c 	ldr	r0, [pc, #60]	; 15e4 <_HandleRequest.clone.0+0x48>
    15a4:	e5d01000 	ldrb	r1, [r0]
    15a8:	e1a012a1 	lsr	r1, r1, #5
    15ac:	e2011003 	and	r1, r1, #3
    15b0:	e0803101 	add	r3, r0, r1, lsl #2
    15b4:	e5934010 	ldr	r4, [r3, #16]
    15b8:	e3540000 	cmp	r4, #0
    15bc:	1a000003 	bne	15d0 <_HandleRequest.clone.0+0x34>
    15c0:	e59f0020 	ldr	r0, [pc, #32]	; 15e8 <_HandleRequest.clone.0+0x4c>
    15c4:	ebfffc2f 	bl	688 <printf>
    15c8:	e1a00004 	mov	r0, r4
    15cc:	e8bd8010 	pop	{r4, pc}
    15d0:	e2801020 	add	r1, r0, #32
    15d4:	e280200c 	add	r2, r0, #12
    15d8:	e1a0e00f 	mov	lr, pc
    15dc:	e12fff14 	bx	r4
    15e0:	e8bd8010 	pop	{r4, pc}
    15e4:	400003b8 	.word	0x400003b8
    15e8:	000021d2 	.word	0x000021d2

000015ec <USBHandleControlTransfer>:
    15ec:	e21030ff 	ands	r3, r0, #255	; 0xff
    15f0:	e92d4031 	push	{r0, r4, r5, lr}
    15f4:	e20150ff 	and	r5, r1, #255	; 0xff
    15f8:	1a00004a 	bne	1728 <USBHandleControlTransfer+0x13c>
    15fc:	e2110004 	ands	r0, r1, #4
    1600:	e59f415c 	ldr	r4, [pc, #348]	; 1764 <USBHandleControlTransfer+0x178>
    1604:	0a00001e 	beq	1684 <USBHandleControlTransfer+0x98>
    1608:	e1a00003 	mov	r0, r3
    160c:	e3a02008 	mov	r2, #8
    1610:	e1a01004 	mov	r1, r4
    1614:	ebfffe72 	bl	fe4 <USBHwEPRead>
    1618:	e59f0148 	ldr	r0, [pc, #328]	; 1768 <USBHandleControlTransfer+0x17c>
    161c:	e5d41001 	ldrb	r1, [r4, #1]
    1620:	ebfffc18 	bl	688 <printf>
    1624:	e5d42000 	ldrb	r2, [r4]
    1628:	e1a031a2 	lsr	r3, r2, #3
    162c:	e203300c 	and	r3, r3, #12
    1630:	e0843003 	add	r3, r4, r3
    1634:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    1638:	e584300c 	str	r3, [r4, #12]
    163c:	e1d430b6 	ldrh	r3, [r4, #6]
    1640:	e3530000 	cmp	r3, #0
    1644:	e5843008 	str	r3, [r4, #8]
    1648:	e5843020 	str	r3, [r4, #32]
    164c:	0a000001 	beq	1658 <USBHandleControlTransfer+0x6c>
    1650:	e1b023a2 	lsrs	r2, r2, #7
    1654:	0a000040 	beq	175c <USBHandleControlTransfer+0x170>
    1658:	ebffffcf 	bl	159c <_HandleRequest.clone.0>
    165c:	e3500000 	cmp	r0, #0
    1660:	059f0104 	ldreq	r0, [pc, #260]	; 176c <USBHandleControlTransfer+0x180>
    1664:	0a00001f 	beq	16e8 <USBHandleControlTransfer+0xfc>
    1668:	e59f30f4 	ldr	r3, [pc, #244]	; 1764 <USBHandleControlTransfer+0x178>
    166c:	e1d310b6 	ldrh	r1, [r3, #6]
    1670:	e5932020 	ldr	r2, [r3, #32]
    1674:	e1510002 	cmp	r1, r2
    1678:	d5831008 	strle	r1, [r3, #8]
    167c:	c5832008 	strgt	r2, [r3, #8]
    1680:	ea00002a 	b	1730 <USBHandleControlTransfer+0x144>
    1684:	e5942008 	ldr	r2, [r4, #8]
    1688:	e3520000 	cmp	r2, #0
    168c:	da00001a 	ble	16fc <USBHandleControlTransfer+0x110>
    1690:	e594100c 	ldr	r1, [r4, #12]
    1694:	ebfffe52 	bl	fe4 <USBHwEPRead>
    1698:	e3500000 	cmp	r0, #0
    169c:	ba000012 	blt	16ec <USBHandleControlTransfer+0x100>
    16a0:	e594300c 	ldr	r3, [r4, #12]
    16a4:	e0833000 	add	r3, r3, r0
    16a8:	e584300c 	str	r3, [r4, #12]
    16ac:	e5943008 	ldr	r3, [r4, #8]
    16b0:	e0600003 	rsb	r0, r0, r3
    16b4:	e3500000 	cmp	r0, #0
    16b8:	e5840008 	str	r0, [r4, #8]
    16bc:	1a000026 	bne	175c <USBHandleControlTransfer+0x170>
    16c0:	e5d43000 	ldrb	r3, [r4]
    16c4:	e1a031a3 	lsr	r3, r3, #3
    16c8:	e203300c 	and	r3, r3, #12
    16cc:	e0843003 	add	r3, r4, r3
    16d0:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    16d4:	e584300c 	str	r3, [r4, #12]
    16d8:	ebffffaf 	bl	159c <_HandleRequest.clone.0>
    16dc:	e3500000 	cmp	r0, #0
    16e0:	1a000012 	bne	1730 <USBHandleControlTransfer+0x144>
    16e4:	e59f0084 	ldr	r0, [pc, #132]	; 1770 <USBHandleControlTransfer+0x184>
    16e8:	ebfffc26 	bl	788 <puts>
    16ec:	e1a00005 	mov	r0, r5
    16f0:	e28dd004 	add	sp, sp, #4
    16f4:	e8bd4030 	pop	{r4, r5, lr}
    16f8:	eaffff7f 	b	14fc <StallControlPipe>
    16fc:	e1a01000 	mov	r1, r0
    1700:	e1a02000 	mov	r2, r0
    1704:	ebfffe36 	bl	fe4 <USBHwEPRead>
    1708:	e59f3064 	ldr	r3, [pc, #100]	; 1774 <USBHandleControlTransfer+0x188>
    170c:	e59f2064 	ldr	r2, [pc, #100]	; 1778 <USBHandleControlTransfer+0x18c>
    1710:	e3500000 	cmp	r0, #0
    1714:	d1a00002 	movle	r0, r2
    1718:	c1a00003 	movgt	r0, r3
    171c:	e28dd004 	add	sp, sp, #4
    1720:	e8bd4030 	pop	{r4, r5, lr}
    1724:	eafffbd7 	b	688 <printf>
    1728:	e3530080 	cmp	r3, #128	; 0x80
    172c:	1a000002 	bne	173c <USBHandleControlTransfer+0x150>
    1730:	e28dd004 	add	sp, sp, #4
    1734:	e8bd4030 	pop	{r4, r5, lr}
    1738:	eaffff86 	b	1558 <DataIn>
    173c:	e3a030d4 	mov	r3, #212	; 0xd4
    1740:	e58d3000 	str	r3, [sp]
    1744:	e59f0030 	ldr	r0, [pc, #48]	; 177c <USBHandleControlTransfer+0x190>
    1748:	e59f1030 	ldr	r1, [pc, #48]	; 1780 <USBHandleControlTransfer+0x194>
    174c:	e59f2030 	ldr	r2, [pc, #48]	; 1784 <USBHandleControlTransfer+0x198>
    1750:	e59f3030 	ldr	r3, [pc, #48]	; 1788 <USBHandleControlTransfer+0x19c>
    1754:	ebfffbcb 	bl	688 <printf>
    1758:	eafffffe 	b	1758 <USBHandleControlTransfer+0x16c>
    175c:	e28dd004 	add	sp, sp, #4
    1760:	e8bd8030 	pop	{r4, r5, pc}
    1764:	400003b8 	.word	0x400003b8
    1768:	000021ef 	.word	0x000021ef
    176c:	000021f3 	.word	0x000021f3
    1770:	0000220a 	.word	0x0000220a
    1774:	000021ed 	.word	0x000021ed
    1778:	00002083 	.word	0x00002083
    177c:	0000205f 	.word	0x0000205f
    1780:	00002084 	.word	0x00002084
    1784:	00002221 	.word	0x00002221
    1788:	00001ff8 	.word	0x00001ff8

0000178c <USBRegisterRequestHandler>:
    178c:	e92d4001 	push	{r0, lr}
    1790:	e3500000 	cmp	r0, #0
    1794:	aa000007 	bge	17b8 <USBRegisterRequestHandler+0x2c>
    1798:	e3a030e2 	mov	r3, #226	; 0xe2
    179c:	e58d3000 	str	r3, [sp]
    17a0:	e59f004c 	ldr	r0, [pc, #76]	; 17f4 <USBRegisterRequestHandler+0x68>
    17a4:	e59f104c 	ldr	r1, [pc, #76]	; 17f8 <USBRegisterRequestHandler+0x6c>
    17a8:	e59f204c 	ldr	r2, [pc, #76]	; 17fc <USBRegisterRequestHandler+0x70>
    17ac:	e59f304c 	ldr	r3, [pc, #76]	; 1800 <USBRegisterRequestHandler+0x74>
    17b0:	ebfffbb4 	bl	688 <printf>
    17b4:	eafffffe 	b	17b4 <USBRegisterRequestHandler+0x28>
    17b8:	e3500003 	cmp	r0, #3
    17bc:	da000007 	ble	17e0 <USBRegisterRequestHandler+0x54>
    17c0:	e3a030e3 	mov	r3, #227	; 0xe3
    17c4:	e58d3000 	str	r3, [sp]
    17c8:	e59f0024 	ldr	r0, [pc, #36]	; 17f4 <USBRegisterRequestHandler+0x68>
    17cc:	e59f1030 	ldr	r1, [pc, #48]	; 1804 <USBRegisterRequestHandler+0x78>
    17d0:	e59f2024 	ldr	r2, [pc, #36]	; 17fc <USBRegisterRequestHandler+0x70>
    17d4:	e59f3024 	ldr	r3, [pc, #36]	; 1800 <USBRegisterRequestHandler+0x74>
    17d8:	ebfffbaa 	bl	688 <printf>
    17dc:	eafffffe 	b	17dc <USBRegisterRequestHandler+0x50>
    17e0:	e59f3020 	ldr	r3, [pc, #32]	; 1808 <USBRegisterRequestHandler+0x7c>
    17e4:	e0830100 	add	r0, r3, r0, lsl #2
    17e8:	e5801010 	str	r1, [r0, #16]
    17ec:	e5802024 	str	r2, [r0, #36]	; 0x24
    17f0:	e8bd8008 	pop	{r3, pc}
    17f4:	0000205f 	.word	0x0000205f
    17f8:	0000222e 	.word	0x0000222e
    17fc:	00002221 	.word	0x00002221
    1800:	00002014 	.word	0x00002014
    1804:	00002239 	.word	0x00002239
    1808:	400003b8 	.word	0x400003b8

0000180c <USBRegisterDescriptors>:
    180c:	e59f3004 	ldr	r3, [pc, #4]	; 1818 <USBRegisterDescriptors+0xc>
    1810:	e5830000 	str	r0, [r3]
    1814:	e12fff1e 	bx	lr
    1818:	400003ec 	.word	0x400003ec

0000181c <USBGetDescriptor>:
    181c:	e59fc09c 	ldr	ip, [pc, #156]	; 18c0 <USBGetDescriptor+0xa4>
    1820:	e59cc000 	ldr	ip, [ip]
    1824:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    1828:	e1a00800 	lsl	r0, r0, #16
    182c:	e35c0000 	cmp	ip, #0
    1830:	e1a01820 	lsr	r1, r0, #16
    1834:	11a05c20 	lsrne	r5, r0, #24
    1838:	120160ff 	andne	r6, r1, #255	; 0xff
    183c:	13a00000 	movne	r0, #0
    1840:	1a000017 	bne	18a4 <USBGetDescriptor+0x88>
    1844:	e3a0306e 	mov	r3, #110	; 0x6e
    1848:	e58d3000 	str	r3, [sp]
    184c:	e59f0070 	ldr	r0, [pc, #112]	; 18c4 <USBGetDescriptor+0xa8>
    1850:	e59f1070 	ldr	r1, [pc, #112]	; 18c8 <USBGetDescriptor+0xac>
    1854:	e59f2070 	ldr	r2, [pc, #112]	; 18cc <USBGetDescriptor+0xb0>
    1858:	e59f3070 	ldr	r3, [pc, #112]	; 18d0 <USBGetDescriptor+0xb4>
    185c:	ebfffb89 	bl	688 <printf>
    1860:	eafffffe 	b	1860 <USBGetDescriptor+0x44>
    1864:	e5dc7001 	ldrb	r7, [ip, #1]
    1868:	e1570005 	cmp	r7, r5
    186c:	1a00000b 	bne	18a0 <USBGetDescriptor+0x84>
    1870:	e1500006 	cmp	r0, r6
    1874:	1a000008 	bne	189c <USBGetDescriptor+0x80>
    1878:	e583c000 	str	ip, [r3]
    187c:	e3550002 	cmp	r5, #2
    1880:	05dc1003 	ldrbeq	r1, [ip, #3]
    1884:	05dc3002 	ldrbeq	r3, [ip, #2]
    1888:	15dc3000 	ldrbne	r3, [ip]
    188c:	01833401 	orreq	r3, r3, r1, lsl #8
    1890:	e5823000 	str	r3, [r2]
    1894:	e3a00001 	mov	r0, #1
    1898:	ea000007 	b	18bc <USBGetDescriptor+0xa0>
    189c:	e2800001 	add	r0, r0, #1
    18a0:	e08cc004 	add	ip, ip, r4
    18a4:	e5dc4000 	ldrb	r4, [ip]
    18a8:	e3540000 	cmp	r4, #0
    18ac:	1affffec 	bne	1864 <USBGetDescriptor+0x48>
    18b0:	e59f001c 	ldr	r0, [pc, #28]	; 18d4 <USBGetDescriptor+0xb8>
    18b4:	ebfffb73 	bl	688 <printf>
    18b8:	e1a00004 	mov	r0, r4
    18bc:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    18c0:	400003ec 	.word	0x400003ec
    18c4:	0000205f 	.word	0x0000205f
    18c8:	00002243 	.word	0x00002243
    18cc:	00002256 	.word	0x00002256
    18d0:	00002030 	.word	0x00002030
    18d4:	00002262 	.word	0x00002262

000018d8 <USBHandleStandardRequest>:
    18d8:	e59f32e4 	ldr	r3, [pc, #740]	; 1bc4 <USBHandleStandardRequest+0x2ec>
    18dc:	e5933004 	ldr	r3, [r3, #4]
    18e0:	e3530000 	cmp	r3, #0
    18e4:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    18e8:	e1a04000 	mov	r4, r0
    18ec:	e1a05001 	mov	r5, r1
    18f0:	e1a06002 	mov	r6, r2
    18f4:	0a000003 	beq	1908 <USBHandleStandardRequest+0x30>
    18f8:	e1a0e00f 	mov	lr, pc
    18fc:	e12fff13 	bx	r3
    1900:	e3500000 	cmp	r0, #0
    1904:	1a000071 	bne	1ad0 <USBHandleStandardRequest+0x1f8>
    1908:	e5d43000 	ldrb	r3, [r4]
    190c:	e203301f 	and	r3, r3, #31
    1910:	e3530001 	cmp	r3, #1
    1914:	0a000057 	beq	1a78 <USBHandleStandardRequest+0x1a0>
    1918:	e3530002 	cmp	r3, #2
    191c:	0a000078 	beq	1b04 <USBHandleStandardRequest+0x22c>
    1920:	e3530000 	cmp	r3, #0
    1924:	1a0000a3 	bne	1bb8 <USBHandleStandardRequest+0x2e0>
    1928:	e5d41001 	ldrb	r1, [r4, #1]
    192c:	e5963000 	ldr	r3, [r6]
    1930:	e3510009 	cmp	r1, #9
    1934:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1938:	ea00004c 	b	1a70 <USBHandleStandardRequest+0x198>
    193c:	00001abc 	.word	0x00001abc
    1940:	00001bb8 	.word	0x00001bb8
    1944:	00001a70 	.word	0x00001a70
    1948:	00001bb8 	.word	0x00001bb8
    194c:	00001a70 	.word	0x00001a70
    1950:	00001964 	.word	0x00001964
    1954:	00001970 	.word	0x00001970
    1958:	00001a64 	.word	0x00001a64
    195c:	00001998 	.word	0x00001998
    1960:	000019a4 	.word	0x000019a4
    1964:	e5d40002 	ldrb	r0, [r4, #2]
    1968:	ebfffd5b 	bl	edc <USBHwSetAddress>
    196c:	ea000057 	b	1ad0 <USBHandleStandardRequest+0x1f8>
    1970:	e1d410b2 	ldrh	r1, [r4, #2]
    1974:	e59f024c 	ldr	r0, [pc, #588]	; 1bc8 <USBHandleStandardRequest+0x2f0>
    1978:	ebfffb42 	bl	688 <printf>
    197c:	e1d400b2 	ldrh	r0, [r4, #2]
    1980:	e1d410b4 	ldrh	r1, [r4, #4]
    1984:	e1a02005 	mov	r2, r5
    1988:	e1a03006 	mov	r3, r6
    198c:	e28dd004 	add	sp, sp, #4
    1990:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    1994:	eaffffa0 	b	181c <USBGetDescriptor>
    1998:	e59f2224 	ldr	r2, [pc, #548]	; 1bc4 <USBHandleStandardRequest+0x2ec>
    199c:	e5d22008 	ldrb	r2, [r2, #8]
    19a0:	ea00004d 	b	1adc <USBHandleStandardRequest+0x204>
    19a4:	e59f3218 	ldr	r3, [pc, #536]	; 1bc4 <USBHandleStandardRequest+0x2ec>
    19a8:	e5935000 	ldr	r5, [r3]
    19ac:	e3550000 	cmp	r5, #0
    19b0:	e1d460b2 	ldrh	r6, [r4, #2]
    19b4:	1a000007 	bne	19d8 <USBHandleStandardRequest+0x100>
    19b8:	e3a030a5 	mov	r3, #165	; 0xa5
    19bc:	e58d3000 	str	r3, [sp]
    19c0:	e59f0204 	ldr	r0, [pc, #516]	; 1bcc <USBHandleStandardRequest+0x2f4>
    19c4:	e59f1204 	ldr	r1, [pc, #516]	; 1bd0 <USBHandleStandardRequest+0x2f8>
    19c8:	e59f2204 	ldr	r2, [pc, #516]	; 1bd4 <USBHandleStandardRequest+0x2fc>
    19cc:	e59f3204 	ldr	r3, [pc, #516]	; 1bd8 <USBHandleStandardRequest+0x300>
    19d0:	ebfffb2c 	bl	688 <printf>
    19d4:	eafffffe 	b	19d4 <USBHandleStandardRequest+0xfc>
    19d8:	e21660ff 	ands	r6, r6, #255	; 0xff
    19dc:	13a030ff 	movne	r3, #255	; 0xff
    19e0:	11a07003 	movne	r7, r3
    19e4:	01a00006 	moveq	r0, r6
    19e8:	1a000014 	bne	1a40 <USBHandleStandardRequest+0x168>
    19ec:	ea000017 	b	1a50 <USBHandleStandardRequest+0x178>
    19f0:	e5d52001 	ldrb	r2, [r5, #1]
    19f4:	e3520004 	cmp	r2, #4
    19f8:	05d53003 	ldrbeq	r3, [r5, #3]
    19fc:	0a00000d 	beq	1a38 <USBHandleStandardRequest+0x160>
    1a00:	e3520005 	cmp	r2, #5
    1a04:	0a000002 	beq	1a14 <USBHandleStandardRequest+0x13c>
    1a08:	e3520002 	cmp	r2, #2
    1a0c:	05d57005 	ldrbeq	r7, [r5, #5]
    1a10:	ea000008 	b	1a38 <USBHandleStandardRequest+0x160>
    1a14:	e3530000 	cmp	r3, #0
    1a18:	01570006 	cmpeq	r7, r6
    1a1c:	1a000005 	bne	1a38 <USBHandleStandardRequest+0x160>
    1a20:	e5d53004 	ldrb	r3, [r5, #4]
    1a24:	e5d51005 	ldrb	r1, [r5, #5]
    1a28:	e5d50002 	ldrb	r0, [r5, #2]
    1a2c:	e1831401 	orr	r1, r3, r1, lsl #8
    1a30:	ebfffce7 	bl	dd4 <USBHwEPConfig>
    1a34:	e3a03000 	mov	r3, #0
    1a38:	e5d52000 	ldrb	r2, [r5]
    1a3c:	e0855002 	add	r5, r5, r2
    1a40:	e5d52000 	ldrb	r2, [r5]
    1a44:	e3520000 	cmp	r2, #0
    1a48:	1affffe8 	bne	19f0 <USBHandleStandardRequest+0x118>
    1a4c:	e3a00001 	mov	r0, #1
    1a50:	ebfffdb3 	bl	1124 <USBHwConfigDevice>
    1a54:	e1d420b2 	ldrh	r2, [r4, #2]
    1a58:	e59f3164 	ldr	r3, [pc, #356]	; 1bc4 <USBHandleStandardRequest+0x2ec>
    1a5c:	e5c32008 	strb	r2, [r3, #8]
    1a60:	ea00001a 	b	1ad0 <USBHandleStandardRequest+0x1f8>
    1a64:	e59f0170 	ldr	r0, [pc, #368]	; 1bdc <USBHandleStandardRequest+0x304>
    1a68:	e3a01007 	mov	r1, #7
    1a6c:	ea000050 	b	1bb4 <USBHandleStandardRequest+0x2dc>
    1a70:	e59f0168 	ldr	r0, [pc, #360]	; 1be0 <USBHandleStandardRequest+0x308>
    1a74:	ea00004e 	b	1bb4 <USBHandleStandardRequest+0x2dc>
    1a78:	e5d41001 	ldrb	r1, [r4, #1]
    1a7c:	e5963000 	ldr	r3, [r6]
    1a80:	e351000b 	cmp	r1, #11
    1a84:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1a88:	ea00001b 	b	1afc <USBHandleStandardRequest+0x224>
    1a8c:	00001abc 	.word	0x00001abc
    1a90:	00001bb8 	.word	0x00001bb8
    1a94:	00001afc 	.word	0x00001afc
    1a98:	00001bb8 	.word	0x00001bb8
    1a9c:	00001afc 	.word	0x00001afc
    1aa0:	00001afc 	.word	0x00001afc
    1aa4:	00001afc 	.word	0x00001afc
    1aa8:	00001afc 	.word	0x00001afc
    1aac:	00001afc 	.word	0x00001afc
    1ab0:	00001afc 	.word	0x00001afc
    1ab4:	00001ad8 	.word	0x00001ad8
    1ab8:	00001aec 	.word	0x00001aec
    1abc:	e3a02000 	mov	r2, #0
    1ac0:	e5c32000 	strb	r2, [r3]
    1ac4:	e5c32001 	strb	r2, [r3, #1]
    1ac8:	e3a03002 	mov	r3, #2
    1acc:	e5853000 	str	r3, [r5]
    1ad0:	e3a00001 	mov	r0, #1
    1ad4:	ea000038 	b	1bbc <USBHandleStandardRequest+0x2e4>
    1ad8:	e3a02000 	mov	r2, #0
    1adc:	e3a00001 	mov	r0, #1
    1ae0:	e5c32000 	strb	r2, [r3]
    1ae4:	e5850000 	str	r0, [r5]
    1ae8:	ea000033 	b	1bbc <USBHandleStandardRequest+0x2e4>
    1aec:	e1d430b2 	ldrh	r3, [r4, #2]
    1af0:	e3530000 	cmp	r3, #0
    1af4:	0afffff4 	beq	1acc <USBHandleStandardRequest+0x1f4>
    1af8:	ea00002e 	b	1bb8 <USBHandleStandardRequest+0x2e0>
    1afc:	e59f00e0 	ldr	r0, [pc, #224]	; 1be4 <USBHandleStandardRequest+0x30c>
    1b00:	ea00002b 	b	1bb4 <USBHandleStandardRequest+0x2dc>
    1b04:	e5d41001 	ldrb	r1, [r4, #1]
    1b08:	e5966000 	ldr	r6, [r6]
    1b0c:	e351000c 	cmp	r1, #12
    1b10:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1b14:	ea000025 	b	1bb0 <USBHandleStandardRequest+0x2d8>
    1b18:	00001b4c 	.word	0x00001b4c
    1b1c:	00001b74 	.word	0x00001b74
    1b20:	00001bb0 	.word	0x00001bb0
    1b24:	00001b88 	.word	0x00001b88
    1b28:	00001bb0 	.word	0x00001bb0
    1b2c:	00001bb0 	.word	0x00001bb0
    1b30:	00001bb0 	.word	0x00001bb0
    1b34:	00001bb0 	.word	0x00001bb0
    1b38:	00001bb0 	.word	0x00001bb0
    1b3c:	00001bb0 	.word	0x00001bb0
    1b40:	00001bb0 	.word	0x00001bb0
    1b44:	00001bb0 	.word	0x00001bb0
    1b48:	00001ba4 	.word	0x00001ba4
    1b4c:	e5d40004 	ldrb	r0, [r4, #4]
    1b50:	ebfffcf5 	bl	f2c <USBHwEPGetStatus>
    1b54:	e3100002 	tst	r0, #2
    1b58:	03a03000 	moveq	r3, #0
    1b5c:	13a03001 	movne	r3, #1
    1b60:	e5c63000 	strb	r3, [r6]
    1b64:	e3a03000 	mov	r3, #0
    1b68:	e5c63001 	strb	r3, [r6, #1]
    1b6c:	e2833002 	add	r3, r3, #2
    1b70:	eaffffd5 	b	1acc <USBHandleStandardRequest+0x1f4>
    1b74:	e1d410b2 	ldrh	r1, [r4, #2]
    1b78:	e3510000 	cmp	r1, #0
    1b7c:	05d40004 	ldrbeq	r0, [r4, #4]
    1b80:	1a00000c 	bne	1bb8 <USBHandleStandardRequest+0x2e0>
    1b84:	ea000004 	b	1b9c <USBHandleStandardRequest+0x2c4>
    1b88:	e1d430b2 	ldrh	r3, [r4, #2]
    1b8c:	e3530000 	cmp	r3, #0
    1b90:	1a000008 	bne	1bb8 <USBHandleStandardRequest+0x2e0>
    1b94:	e5d40004 	ldrb	r0, [r4, #4]
    1b98:	e3a01001 	mov	r1, #1
    1b9c:	ebfffce7 	bl	f40 <USBHwEPStall>
    1ba0:	eaffffca 	b	1ad0 <USBHandleStandardRequest+0x1f8>
    1ba4:	e59f003c 	ldr	r0, [pc, #60]	; 1be8 <USBHandleStandardRequest+0x310>
    1ba8:	e3a0100c 	mov	r1, #12
    1bac:	ea000000 	b	1bb4 <USBHandleStandardRequest+0x2dc>
    1bb0:	e59f0034 	ldr	r0, [pc, #52]	; 1bec <USBHandleStandardRequest+0x314>
    1bb4:	ebfffab3 	bl	688 <printf>
    1bb8:	e3a00000 	mov	r0, #0
    1bbc:	e28dd004 	add	sp, sp, #4
    1bc0:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    1bc4:	400003ec 	.word	0x400003ec
    1bc8:	00002276 	.word	0x00002276
    1bcc:	0000205f 	.word	0x0000205f
    1bd0:	00002243 	.word	0x00002243
    1bd4:	00002256 	.word	0x00002256
    1bd8:	00002044 	.word	0x00002044
    1bdc:	0000227a 	.word	0x0000227a
    1be0:	00002299 	.word	0x00002299
    1be4:	000022b0 	.word	0x000022b0
    1be8:	000022ca 	.word	0x000022ca
    1bec:	000022e5 	.word	0x000022e5

00001bf0 <USBRegisterCustomReqHandler>:
    1bf0:	e59f3004 	ldr	r3, [pc, #4]	; 1bfc <USBRegisterCustomReqHandler+0xc>
    1bf4:	e5830004 	str	r0, [r3, #4]
    1bf8:	e12fff1e 	bx	lr
    1bfc:	400003ec 	.word	0x400003ec

00001c00 <HandleUsbReset>:
    1c00:	e3100010 	tst	r0, #16
    1c04:	012fff1e 	bxeq	lr
    1c08:	e59f0000 	ldr	r0, [pc, #0]	; 1c10 <HandleUsbReset+0x10>
    1c0c:	eafffa9d 	b	688 <printf>
    1c10:	000022f8 	.word	0x000022f8

00001c14 <USBInit>:
    1c14:	e92d4010 	push	{r4, lr}
    1c18:	e59f4050 	ldr	r4, [pc, #80]	; 1c70 <USBInit+0x5c>
    1c1c:	ebfffd91 	bl	1268 <USBHwInit>
    1c20:	e59f004c 	ldr	r0, [pc, #76]	; 1c74 <USBInit+0x60>
    1c24:	ebfffc96 	bl	e84 <USBHwRegisterDevIntHandler>
    1c28:	e1a01004 	mov	r1, r4
    1c2c:	e3a00000 	mov	r0, #0
    1c30:	ebfffc7c 	bl	e28 <USBHwRegisterEPIntHandler>
    1c34:	e1a01004 	mov	r1, r4
    1c38:	e3a00080 	mov	r0, #128	; 0x80
    1c3c:	ebfffc79 	bl	e28 <USBHwRegisterEPIntHandler>
    1c40:	e3a00000 	mov	r0, #0
    1c44:	e3a01040 	mov	r1, #64	; 0x40
    1c48:	ebfffc61 	bl	dd4 <USBHwEPConfig>
    1c4c:	e3a00080 	mov	r0, #128	; 0x80
    1c50:	e3a01040 	mov	r1, #64	; 0x40
    1c54:	ebfffc5e 	bl	dd4 <USBHwEPConfig>
    1c58:	e3a00000 	mov	r0, #0
    1c5c:	e59f1014 	ldr	r1, [pc, #20]	; 1c78 <USBInit+0x64>
    1c60:	e59f2014 	ldr	r2, [pc, #20]	; 1c7c <USBInit+0x68>
    1c64:	ebfffec8 	bl	178c <USBRegisterRequestHandler>
    1c68:	e3a00001 	mov	r0, #1
    1c6c:	e8bd8010 	pop	{r4, pc}
    1c70:	000015ec 	.word	0x000015ec
    1c74:	00001c00 	.word	0x00001c00
    1c78:	000018d8 	.word	0x000018d8
    1c7c:	400003f8 	.word	0x400003f8

00001c80 <__aeabi_uidiv>:
    1c80:	e2512001 	subs	r2, r1, #1
    1c84:	012fff1e 	bxeq	lr
    1c88:	3a000036 	bcc	1d68 <__aeabi_uidiv+0xe8>
    1c8c:	e1500001 	cmp	r0, r1
    1c90:	9a000022 	bls	1d20 <__aeabi_uidiv+0xa0>
    1c94:	e1110002 	tst	r1, r2
    1c98:	0a000023 	beq	1d2c <__aeabi_uidiv+0xac>
    1c9c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1ca0:	01a01181 	lsleq	r1, r1, #3
    1ca4:	03a03008 	moveq	r3, #8
    1ca8:	13a03001 	movne	r3, #1
    1cac:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1cb0:	31510000 	cmpcc	r1, r0
    1cb4:	31a01201 	lslcc	r1, r1, #4
    1cb8:	31a03203 	lslcc	r3, r3, #4
    1cbc:	3afffffa 	bcc	1cac <__aeabi_uidiv+0x2c>
    1cc0:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1cc4:	31510000 	cmpcc	r1, r0
    1cc8:	31a01081 	lslcc	r1, r1, #1
    1ccc:	31a03083 	lslcc	r3, r3, #1
    1cd0:	3afffffa 	bcc	1cc0 <__aeabi_uidiv+0x40>
    1cd4:	e3a02000 	mov	r2, #0
    1cd8:	e1500001 	cmp	r0, r1
    1cdc:	20400001 	subcs	r0, r0, r1
    1ce0:	21822003 	orrcs	r2, r2, r3
    1ce4:	e15000a1 	cmp	r0, r1, lsr #1
    1ce8:	204000a1 	subcs	r0, r0, r1, lsr #1
    1cec:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1cf0:	e1500121 	cmp	r0, r1, lsr #2
    1cf4:	20400121 	subcs	r0, r0, r1, lsr #2
    1cf8:	21822123 	orrcs	r2, r2, r3, lsr #2
    1cfc:	e15001a1 	cmp	r0, r1, lsr #3
    1d00:	204001a1 	subcs	r0, r0, r1, lsr #3
    1d04:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1d08:	e3500000 	cmp	r0, #0
    1d0c:	11b03223 	lsrsne	r3, r3, #4
    1d10:	11a01221 	lsrne	r1, r1, #4
    1d14:	1affffef 	bne	1cd8 <__aeabi_uidiv+0x58>
    1d18:	e1a00002 	mov	r0, r2
    1d1c:	e12fff1e 	bx	lr
    1d20:	03a00001 	moveq	r0, #1
    1d24:	13a00000 	movne	r0, #0
    1d28:	e12fff1e 	bx	lr
    1d2c:	e3510801 	cmp	r1, #65536	; 0x10000
    1d30:	21a01821 	lsrcs	r1, r1, #16
    1d34:	23a02010 	movcs	r2, #16
    1d38:	33a02000 	movcc	r2, #0
    1d3c:	e3510c01 	cmp	r1, #256	; 0x100
    1d40:	21a01421 	lsrcs	r1, r1, #8
    1d44:	22822008 	addcs	r2, r2, #8
    1d48:	e3510010 	cmp	r1, #16
    1d4c:	21a01221 	lsrcs	r1, r1, #4
    1d50:	22822004 	addcs	r2, r2, #4
    1d54:	e3510004 	cmp	r1, #4
    1d58:	82822003 	addhi	r2, r2, #3
    1d5c:	908220a1 	addls	r2, r2, r1, lsr #1
    1d60:	e1a00230 	lsr	r0, r0, r2
    1d64:	e12fff1e 	bx	lr
    1d68:	e52de008 	str	lr, [sp, #-8]!
    1d6c:	eb00003c 	bl	1e64 <__div0>
    1d70:	e3a00000 	mov	r0, #0
    1d74:	e49df008 	ldr	pc, [sp], #8

00001d78 <__aeabi_uidivmod>:
    1d78:	e3510000 	cmp	r1, #0
    1d7c:	0afffff9 	beq	1d68 <__aeabi_uidiv+0xe8>
    1d80:	e92d4003 	push	{r0, r1, lr}
    1d84:	ebffffbd 	bl	1c80 <__aeabi_uidiv>
    1d88:	e8bd4006 	pop	{r1, r2, lr}
    1d8c:	e0030092 	mul	r3, r2, r0
    1d90:	e0411003 	sub	r1, r1, r3
    1d94:	e12fff1e 	bx	lr

00001d98 <__umodsi3>:
    1d98:	e2512001 	subs	r2, r1, #1
    1d9c:	3a00002c 	bcc	1e54 <__umodsi3+0xbc>
    1da0:	11500001 	cmpne	r0, r1
    1da4:	03a00000 	moveq	r0, #0
    1da8:	81110002 	tsthi	r1, r2
    1dac:	00000002 	andeq	r0, r0, r2
    1db0:	912fff1e 	bxls	lr
    1db4:	e3a02000 	mov	r2, #0
    1db8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1dbc:	31510000 	cmpcc	r1, r0
    1dc0:	31a01201 	lslcc	r1, r1, #4
    1dc4:	32822004 	addcc	r2, r2, #4
    1dc8:	3afffffa 	bcc	1db8 <__umodsi3+0x20>
    1dcc:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1dd0:	31510000 	cmpcc	r1, r0
    1dd4:	31a01081 	lslcc	r1, r1, #1
    1dd8:	32822001 	addcc	r2, r2, #1
    1ddc:	3afffffa 	bcc	1dcc <__umodsi3+0x34>
    1de0:	e2522003 	subs	r2, r2, #3
    1de4:	ba00000e 	blt	1e24 <__umodsi3+0x8c>
    1de8:	e1500001 	cmp	r0, r1
    1dec:	20400001 	subcs	r0, r0, r1
    1df0:	e15000a1 	cmp	r0, r1, lsr #1
    1df4:	204000a1 	subcs	r0, r0, r1, lsr #1
    1df8:	e1500121 	cmp	r0, r1, lsr #2
    1dfc:	20400121 	subcs	r0, r0, r1, lsr #2
    1e00:	e15001a1 	cmp	r0, r1, lsr #3
    1e04:	204001a1 	subcs	r0, r0, r1, lsr #3
    1e08:	e3500001 	cmp	r0, #1
    1e0c:	e1a01221 	lsr	r1, r1, #4
    1e10:	a2522004 	subsge	r2, r2, #4
    1e14:	aafffff3 	bge	1de8 <__umodsi3+0x50>
    1e18:	e3120003 	tst	r2, #3
    1e1c:	13300000 	teqne	r0, #0
    1e20:	0a00000a 	beq	1e50 <__umodsi3+0xb8>
    1e24:	e3720002 	cmn	r2, #2
    1e28:	ba000006 	blt	1e48 <__umodsi3+0xb0>
    1e2c:	0a000002 	beq	1e3c <__umodsi3+0xa4>
    1e30:	e1500001 	cmp	r0, r1
    1e34:	20400001 	subcs	r0, r0, r1
    1e38:	e1a010a1 	lsr	r1, r1, #1
    1e3c:	e1500001 	cmp	r0, r1
    1e40:	20400001 	subcs	r0, r0, r1
    1e44:	e1a010a1 	lsr	r1, r1, #1
    1e48:	e1500001 	cmp	r0, r1
    1e4c:	20400001 	subcs	r0, r0, r1
    1e50:	e12fff1e 	bx	lr
    1e54:	e52de008 	str	lr, [sp, #-8]!
    1e58:	eb000001 	bl	1e64 <__div0>
    1e5c:	e3a00000 	mov	r0, #0
    1e60:	e49df008 	ldr	pc, [sp], #8

00001e64 <__div0>:
    1e64:	e12fff1e 	bx	lr

00001e68 <memcpy>:
    1e68:	e352000f 	cmp	r2, #15
    1e6c:	e92d0030 	push	{r4, r5}
    1e70:	e1a0c000 	mov	ip, r0
    1e74:	e1a04001 	mov	r4, r1
    1e78:	9a000027 	bls	1f1c <memcpy+0xb4>
    1e7c:	e1813000 	orr	r3, r1, r0
    1e80:	e3130003 	tst	r3, #3
    1e84:	1a000026 	bne	1f24 <memcpy+0xbc>
    1e88:	e1a0c001 	mov	ip, r1
    1e8c:	e1a03000 	mov	r3, r0
    1e90:	e1a04002 	mov	r4, r2
    1e94:	e59c5000 	ldr	r5, [ip]
    1e98:	e5835000 	str	r5, [r3]
    1e9c:	e59c5004 	ldr	r5, [ip, #4]
    1ea0:	e5835004 	str	r5, [r3, #4]
    1ea4:	e59c5008 	ldr	r5, [ip, #8]
    1ea8:	e5835008 	str	r5, [r3, #8]
    1eac:	e2444010 	sub	r4, r4, #16
    1eb0:	e59c500c 	ldr	r5, [ip, #12]
    1eb4:	e354000f 	cmp	r4, #15
    1eb8:	e583500c 	str	r5, [r3, #12]
    1ebc:	e28cc010 	add	ip, ip, #16
    1ec0:	e2833010 	add	r3, r3, #16
    1ec4:	8afffff2 	bhi	1e94 <memcpy+0x2c>
    1ec8:	e2422010 	sub	r2, r2, #16
    1ecc:	e3c2400f 	bic	r4, r2, #15
    1ed0:	e202200f 	and	r2, r2, #15
    1ed4:	e2844010 	add	r4, r4, #16
    1ed8:	e3520003 	cmp	r2, #3
    1edc:	e080c004 	add	ip, r0, r4
    1ee0:	e0814004 	add	r4, r1, r4
    1ee4:	9a00000c 	bls	1f1c <memcpy+0xb4>
    1ee8:	e3a03000 	mov	r3, #0
    1eec:	e7941003 	ldr	r1, [r4, r3]
    1ef0:	e78c1003 	str	r1, [ip, r3]
    1ef4:	e2833004 	add	r3, r3, #4
    1ef8:	e0631002 	rsb	r1, r3, r2
    1efc:	e3510003 	cmp	r1, #3
    1f00:	8afffff9 	bhi	1eec <memcpy+0x84>
    1f04:	e2422004 	sub	r2, r2, #4
    1f08:	e3c23003 	bic	r3, r2, #3
    1f0c:	e2833004 	add	r3, r3, #4
    1f10:	e08cc003 	add	ip, ip, r3
    1f14:	e0844003 	add	r4, r4, r3
    1f18:	e2022003 	and	r2, r2, #3
    1f1c:	e3520000 	cmp	r2, #0
    1f20:	0a000005 	beq	1f3c <memcpy+0xd4>
    1f24:	e3a03000 	mov	r3, #0
    1f28:	e7d41003 	ldrb	r1, [r4, r3]
    1f2c:	e7cc1003 	strb	r1, [ip, r3]
    1f30:	e2833001 	add	r3, r3, #1
    1f34:	e1530002 	cmp	r3, r2
    1f38:	1afffffa 	bne	1f28 <memcpy+0xc0>
    1f3c:	e8bd0030 	pop	{r4, r5}
    1f40:	e12fff1e 	bx	lr

00001f44 <__FUNCTION__.1696>:
    1f44:	6b6c7542 0074754f                       BulkOut.

00001f4c <abDescriptors>:
    1f4c:	01010112 40000002 0005ffff 02010100     .......@........
    1f5c:	02090103 01020043 0932c000 01000004     ....C.....2.....
    1f6c:	00010202 10002405 01240501 24040101     .....$....$....$
    1f7c:	24050202 07010006 08038105 04090a00     ...$............
    1f8c:	0a020001 07000000 40020505 05070000     ...........@....
    1f9c:	00400282 09030400 4c030e04 43005000     ..@........L.P.C
    1fac:	53005500 14004200 53005503 53004200     .U.S.B...U.S.B.S
    1fbc:	72006500 61006900 12006c00 45004403     .e.r.i.a.l...D.E
    1fcc:	44004100 30004300 45004400 00000000     .A.D.C.0.D.E....

00001fdc <__FUNCTION__.1347>:
    1fdc:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    1fec:	6148746e 656c646e 00000072              ntHandler...

00001ff8 <__FUNCTION__.1330>:
    1ff8:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    2008:	6e617254 72656673 00000000              Transfer....

00002014 <__FUNCTION__.1337>:
    2014:	52425355 73696765 52726574 65757165     USBRegisterReque
    2024:	61487473 656c646e 00000072              stHandler...

00002030 <__FUNCTION__.1326>:
    2030:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    2040:	00000000                                ....

00002044 <__FUNCTION__.1340>:
    2044:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    2054:	006e6f69 6c756e28 0a00296c 65737341     ion.(null)..Asse
    2064:	6f697472 2527206e 66202773 656c6961     rtion '%s' faile
    2074:	6e692064 3a732520 25237325 000a2164     d in %s:%s#%d!..
    2084:	534c4146 616d0045 735f6e69 61697265     FALSE.main_seria
    2094:	00632e6c 5f544553 454e494c 444f435f     l.c.SET_LINE_COD
    20a4:	00474e49 54447764 74615245 75253d65     ING.dwDTERate=%u
    20b4:	4362202c 46726168 616d726f 75253d74     , bCharFormat=%u
    20c4:	5062202c 74697261 70795479 75253d65     , bParityType=%u
    20d4:	4462202c 42617461 3d737469 000a7525     , bDataBits=%u..
    20e4:	5f544547 454e494c 444f435f 00474e49     GET_LINE_CODING.
    20f4:	5f544553 544e4f43 5f4c4f52 454e494c     SET_CONTROL_LINE
    2104:	4154535f 25204554 49000a58 6974696e     _STATE %X..Initi
    2114:	73696c61 20676e69 20425355 63617473     alising USB stac
    2124:	7453006b 69747261 5520676e 63204253     k.Starting USB c
    2134:	756d6d6f 6163696e 6e6f6974 78646900     ommunication.idx
    2144:	0032333c 68627375 706c5f77 00632e63     <32.usbhw_lpc.c.
    2154:	69676552 72657473 68206465 6c646e61     Registered handl
    2164:	66207265 4520726f 78302050 000a7825     er for EP 0x%x..
    2174:	69676552 72657473 68206465 6c646e61     Registered handl
    2184:	66207265 6420726f 63697665 74732065     er for device st
    2194:	73757461 67655200 65747369 20646572     atus.Registered 
    21a4:	646e6168 2072656c 20726f66 6d617266     handler for fram
    21b4:	54530065 204c4c41 5b206e6f 30252000     e.STALL on [. %0
    21c4:	5d007832 61747320 78253d74 6f4e000a     2x.] stat=%x..No
    21d4:	6e616820 72656c64 726f6620 71657220      handler for req
    21e4:	65707974 0a642520 53003f00 5f007825     type %d..?.S%x._
    21f4:	646e6148 6552656c 73657571 66203174     HandleRequest1 f
    2204:	656c6961 485f0064 6c646e61 71655265     ailed._HandleReq
    2214:	74736575 61662032 64656c69 62737500     uest2 failed.usb
    2224:	746e6f63 2e6c6f72 54690063 20657079     control.c.iType 
    2234:	30203d3e 79546900 3c206570 70003420     >= 0.iType < 4.p
    2244:	65446261 69726373 3d212070 4c554e20     abDescrip != NUL
    2254:	7375004c 64747362 2e716572 65440063     L.usbstdreq.c.De
    2264:	25206373 6f6e2078 6f662074 21646e75     sc %x not found!
    2274:	2544000a 65440078 65636976 71657220     ..D%x.Device req
    2284:	20642520 20746f6e 6c706d69 6e656d65      %d not implemen
    2294:	0a646574 6c6c4900 6c616765 76656420     ted..Illegal dev
    22a4:	20656369 20716572 000a6425 656c6c49     ice req %d..Ille
    22b4:	206c6167 65746e69 63616672 65722065     gal interface re
    22c4:	64252071 5045000a 71657220 20642520     q %d..EP req %d 
    22d4:	20746f6e 6c706d69 6e656d65 0a646574     not implemented.
    22e4:	6c6c4900 6c616765 20504520 20716572     .Illegal EP req 
    22f4:	000a6425 0000210a                                %d...!.
