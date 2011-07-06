
msc.elf:     file format elf32-littlearm


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
      bc:	ea0001e5 	b	858 <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	0000362e 	.word	0x0000362e
      c8:	40000200 	.word	0x40000200
      cc:	40000200 	.word	0x40000200
      d0:	40000200 	.word	0x40000200
      d4:	400004dc 	.word	0x400004dc

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
     410:	eb000a21 	bl	2c9c <__umodsi3>
     414:	e3500009 	cmp	r0, #9
     418:	c59d3000 	ldrgt	r3, [sp]
     41c:	c0800003 	addgt	r0, r0, r3
     420:	e2800030 	add	r0, r0, #48	; 0x30
     424:	e5690001 	strb	r0, [r9, #-1]!
     428:	e1a01007 	mov	r1, r7
     42c:	e1a00008 	mov	r0, r8
     430:	eb000981 	bl	2a3c <__aeabi_uidiv>
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
     684:	00002f98 	.word	0x00002f98

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

000007b4 <HandleClassRequest>:
     7b4:	e92d4030 	push	{r4, r5, lr}
     7b8:	e1d040b4 	ldrh	r4, [r0, #4]
     7bc:	e3540000 	cmp	r4, #0
     7c0:	0a000004 	beq	7d8 <HandleClassRequest+0x24>
     7c4:	e59f0080 	ldr	r0, [pc, #128]	; 84c <HandleClassRequest+0x98>
     7c8:	e1a01004 	mov	r1, r4
     7cc:	ebffffad 	bl	688 <printf>
     7d0:	e3a05000 	mov	r5, #0
     7d4:	ea00001a 	b	844 <HandleClassRequest+0x90>
     7d8:	e1d050b2 	ldrh	r5, [r0, #2]
     7dc:	e3550000 	cmp	r5, #0
     7e0:	0a000004 	beq	7f8 <HandleClassRequest+0x44>
     7e4:	e1a01005 	mov	r1, r5
     7e8:	e59f0060 	ldr	r0, [pc, #96]	; 850 <HandleClassRequest+0x9c>
     7ec:	ebffffa5 	bl	688 <printf>
     7f0:	e1a05004 	mov	r5, r4
     7f4:	ea000012 	b	844 <HandleClassRequest+0x90>
     7f8:	e5d03001 	ldrb	r3, [r0, #1]
     7fc:	e35300fe 	cmp	r3, #254	; 0xfe
     800:	0a000002 	beq	810 <HandleClassRequest+0x5c>
     804:	e35300ff 	cmp	r3, #255	; 0xff
     808:	1a00000b 	bne	83c <HandleClassRequest+0x88>
     80c:	ea000004 	b	824 <HandleClassRequest+0x70>
     810:	e5923000 	ldr	r3, [r2]
     814:	e5c35000 	strb	r5, [r3]
     818:	e3a05001 	mov	r5, #1
     81c:	e5815000 	str	r5, [r1]
     820:	ea000007 	b	844 <HandleClassRequest+0x90>
     824:	e1d030b6 	ldrh	r3, [r0, #6]
     828:	e3530000 	cmp	r3, #0
     82c:	1a000004 	bne	844 <HandleClassRequest+0x90>
     830:	eb000077 	bl	a14 <MSCBotReset>
     834:	e3a05001 	mov	r5, #1
     838:	ea000001 	b	844 <HandleClassRequest+0x90>
     83c:	e59f0010 	ldr	r0, [pc, #16]	; 854 <HandleClassRequest+0xa0>
     840:	ebffffd0 	bl	788 <puts>
     844:	e1a00005 	mov	r0, r5
     848:	e8bd8030 	pop	{r4, r5, pc}
     84c:	00002f9f 	.word	0x00002f9f
     850:	00002faf 	.word	0x00002faf
     854:	00002fbf 	.word	0x00002fbf

00000858 <main>:
     858:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     85c:	ebfffe28 	bl	104 <HalSysInit>
     860:	e3a00020 	mov	r0, #32
     864:	ebffff9c 	bl	6dc <ConsoleInit>
     868:	eb0002a5 	bl	1304 <BlockDevInit>
     86c:	e59f0054 	ldr	r0, [pc, #84]	; 8c8 <main+0x70>
     870:	ebffffc4 	bl	788 <puts>
     874:	eb000855 	bl	29d0 <USBInit>
     878:	e3a00020 	mov	r0, #32
     87c:	eb000516 	bl	1cdc <USBHwNakIntEnable>
     880:	e59f0044 	ldr	r0, [pc, #68]	; 8cc <main+0x74>
     884:	eb00074f 	bl	25c8 <USBRegisterDescriptors>
     888:	e59f2040 	ldr	r2, [pc, #64]	; 8d0 <main+0x78>
     88c:	e3a00001 	mov	r0, #1
     890:	e59f103c 	ldr	r1, [pc, #60]	; 8d4 <main+0x7c>
     894:	eb00072b 	bl	2548 <USBRegisterRequestHandler>
     898:	e3a00085 	mov	r0, #133	; 0x85
     89c:	e59f1034 	ldr	r1, [pc, #52]	; 8d8 <main+0x80>
     8a0:	eb0004cf 	bl	1be4 <USBHwRegisterEPIntHandler>
     8a4:	e3a00002 	mov	r0, #2
     8a8:	e59f102c 	ldr	r1, [pc, #44]	; 8dc <main+0x84>
     8ac:	eb0004cc 	bl	1be4 <USBHwRegisterEPIntHandler>
     8b0:	e59f0028 	ldr	r0, [pc, #40]	; 8e0 <main+0x88>
     8b4:	ebffffb3 	bl	788 <puts>
     8b8:	e3a00001 	mov	r0, #1
     8bc:	eb0004fa 	bl	1cac <USBHwConnect>
     8c0:	eb00058a 	bl	1ef0 <USBHwISR>
     8c4:	eafffffd 	b	8c0 <main+0x68>
     8c8:	00002fcf 	.word	0x00002fcf
     8cc:	00002e48 	.word	0x00002e48
     8d0:	40000200 	.word	0x40000200
     8d4:	000007b4 	.word	0x000007b4
     8d8:	00000d1c 	.word	0x00000d1c
     8dc:	00000a40 	.word	0x00000a40
     8e0:	00002fe6 	.word	0x00002fe6

000008e4 <BOTStall>:
     8e4:	e59f3024 	ldr	r3, [pc, #36]	; 910 <BOTStall+0x2c>
     8e8:	e1d320dc 	ldrsb	r2, [r3, #12]
     8ec:	e3520000 	cmp	r2, #0
     8f0:	ba000003 	blt	904 <BOTStall+0x20>
     8f4:	e5933008 	ldr	r3, [r3, #8]
     8f8:	e3530000 	cmp	r3, #0
     8fc:	13a00002 	movne	r0, #2
     900:	1a000000 	bne	908 <BOTStall+0x24>
     904:	e3a00085 	mov	r0, #133	; 0x85
     908:	e3a01001 	mov	r1, #1
     90c:	ea0004fa 	b	1cfc <USBHwEPStall>
     910:	40000204 	.word	0x40000204

00000914 <SendCSW>:
     914:	e92d4010 	push	{r4, lr}
     918:	e59f403c 	ldr	r4, [pc, #60]	; 95c <SendCSW+0x48>
     91c:	e5943020 	ldr	r3, [r4, #32]
     920:	e5942008 	ldr	r2, [r4, #8]
     924:	e0632002 	rsb	r2, r3, r2
     928:	e59f3030 	ldr	r3, [pc, #48]	; 960 <SendCSW+0x4c>
     92c:	e5843024 	str	r3, [r4, #36]	; 0x24
     930:	e5943004 	ldr	r3, [r4, #4]
     934:	e1a01000 	mov	r1, r0
     938:	e1c22fc2 	bic	r2, r2, r2, asr #31
     93c:	e5c40030 	strb	r0, [r4, #48]	; 0x30
     940:	e59f001c 	ldr	r0, [pc, #28]	; 964 <SendCSW+0x50>
     944:	e5843028 	str	r3, [r4, #40]	; 0x28
     948:	e584202c 	str	r2, [r4, #44]	; 0x2c
     94c:	ebffff4d 	bl	688 <printf>
     950:	e3a03003 	mov	r3, #3
     954:	e5843034 	str	r3, [r4, #52]	; 0x34
     958:	e8bd8010 	pop	{r4, pc}
     95c:	40000204 	.word	0x40000204
     960:	53425355 	.word	0x53425355
     964:	00003001 	.word	0x00003001

00000968 <HandleDataIn>:
     968:	e92d4030 	push	{r4, r5, lr}
     96c:	e59f4098 	ldr	r4, [pc, #152]	; a0c <HandleDataIn+0xa4>
     970:	e5d4100e 	ldrb	r1, [r4, #14]
     974:	e284000f 	add	r0, r4, #15
     978:	e2842038 	add	r2, r4, #56	; 0x38
     97c:	e892000c 	ldm	r2, {r2, r3}
     980:	eb0001bd 	bl	107c <SCSIHandleData>
     984:	e3500000 	cmp	r0, #0
     988:	e1a01000 	mov	r1, r0
     98c:	e5840038 	str	r0, [r4, #56]	; 0x38
     990:	1a000002 	bne	9a0 <HandleDataIn+0x38>
     994:	ebffffd2 	bl	8e4 <BOTStall>
     998:	e3a00001 	mov	r0, #1
     99c:	ea000018 	b	a04 <HandleDataIn+0x9c>
     9a0:	e594303c 	ldr	r3, [r4, #60]	; 0x3c
     9a4:	e5945020 	ldr	r5, [r4, #32]
     9a8:	e1530005 	cmp	r3, r5
     9ac:	2a000008 	bcs	9d4 <HandleDataIn+0x6c>
     9b0:	e0635005 	rsb	r5, r3, r5
     9b4:	e3550040 	cmp	r5, #64	; 0x40
     9b8:	23a05040 	movcs	r5, #64	; 0x40
     9bc:	e1a02005 	mov	r2, r5
     9c0:	e3a00085 	mov	r0, #133	; 0x85
     9c4:	eb0004d4 	bl	1d1c <USBHwEPWrite>
     9c8:	e594303c 	ldr	r3, [r4, #60]	; 0x3c
     9cc:	e0855003 	add	r5, r5, r3
     9d0:	e584503c 	str	r5, [r4, #60]	; 0x3c
     9d4:	e59f3030 	ldr	r3, [pc, #48]	; a0c <HandleDataIn+0xa4>
     9d8:	e593203c 	ldr	r2, [r3, #60]	; 0x3c
     9dc:	e5931020 	ldr	r1, [r3, #32]
     9e0:	e1520001 	cmp	r2, r1
     9e4:	18bd8030 	popne	{r4, r5, pc}
     9e8:	e5933008 	ldr	r3, [r3, #8]
     9ec:	e1520003 	cmp	r2, r3
     9f0:	0a000002 	beq	a00 <HandleDataIn+0x98>
     9f4:	e59f0014 	ldr	r0, [pc, #20]	; a10 <HandleDataIn+0xa8>
     9f8:	ebffff22 	bl	688 <printf>
     9fc:	ebffffb8 	bl	8e4 <BOTStall>
     a00:	e3a00000 	mov	r0, #0
     a04:	e8bd4030 	pop	{r4, r5, lr}
     a08:	eaffffc1 	b	914 <SendCSW>
     a0c:	40000204 	.word	0x40000204
     a10:	0000301d 	.word	0x0000301d

00000a14 <MSCBotReset>:
     a14:	e92d4010 	push	{r4, lr}
     a18:	e59f4018 	ldr	r4, [pc, #24]	; a38 <MSCBotReset+0x24>
     a1c:	e59f0018 	ldr	r0, [pc, #24]	; a3c <MSCBotReset+0x28>
     a20:	e5941034 	ldr	r1, [r4, #52]	; 0x34
     a24:	ebffff17 	bl	688 <printf>
     a28:	e3a03000 	mov	r3, #0
     a2c:	e5843034 	str	r3, [r4, #52]	; 0x34
     a30:	e8bd4010 	pop	{r4, lr}
     a34:	ea0000e8 	b	ddc <SCSIReset>
     a38:	40000204 	.word	0x40000204
     a3c:	0000302a 	.word	0x0000302a

00000a40 <MSCBotBulkOut>:
     a40:	e3110002 	tst	r1, #2
     a44:	e92d4037 	push	{r0, r1, r2, r4, r5, lr}
     a48:	e20000ff 	and	r0, r0, #255	; 0xff
     a4c:	1a0000a0 	bne	cd4 <MSCBotBulkOut+0x294>
     a50:	e59f3280 	ldr	r3, [pc, #640]	; cd8 <MSCBotBulkOut+0x298>
     a54:	e5931034 	ldr	r1, [r3, #52]	; 0x34
     a58:	e3510004 	cmp	r1, #4
     a5c:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
     a60:	ea00007f 	b	c64 <MSCBotBulkOut+0x224>
     a64:	00000a78 	.word	0x00000a78
     a68:	00000b90 	.word	0x00000b90
     a6c:	00000c28 	.word	0x00000c28
     a70:	00000c28 	.word	0x00000c28
     a74:	00000c54 	.word	0x00000c54
     a78:	e59f4258 	ldr	r4, [pc, #600]	; cd8 <MSCBotBulkOut+0x298>
     a7c:	e3a02020 	mov	r2, #32
     a80:	e1a01004 	mov	r1, r4
     a84:	eb0004c5 	bl	1da0 <USBHwEPRead>
     a88:	e350001f 	cmp	r0, #31
     a8c:	e1a01000 	mov	r1, r0
     a90:	e58d0008 	str	r0, [sp, #8]
     a94:	159f0240 	ldrne	r0, [pc, #576]	; cdc <MSCBotBulkOut+0x29c>
     a98:	1a00000e 	bne	ad8 <MSCBotBulkOut+0x98>
     a9c:	e5941000 	ldr	r1, [r4]
     aa0:	e59f3238 	ldr	r3, [pc, #568]	; ce0 <MSCBotBulkOut+0x2a0>
     aa4:	e1510003 	cmp	r1, r3
     aa8:	159f0234 	ldrne	r0, [pc, #564]	; ce4 <MSCBotBulkOut+0x2a4>
     aac:	1a000009 	bne	ad8 <MSCBotBulkOut+0x98>
     ab0:	e5d4500d 	ldrb	r5, [r4, #13]
     ab4:	e3550000 	cmp	r5, #0
     ab8:	159f0228 	ldrne	r0, [pc, #552]	; ce8 <MSCBotBulkOut+0x2a8>
     abc:	11a01005 	movne	r1, r5
     ac0:	1a000004 	bne	ad8 <MSCBotBulkOut+0x98>
     ac4:	e5d4100e 	ldrb	r1, [r4, #14]
     ac8:	e2413001 	sub	r3, r1, #1
     acc:	e353000f 	cmp	r3, #15
     ad0:	9a00006d 	bls	c8c <MSCBotBulkOut+0x24c>
     ad4:	e59f0210 	ldr	r0, [pc, #528]	; cec <MSCBotBulkOut+0x2ac>
     ad8:	ebfffeea 	bl	688 <printf>
     adc:	e3a00085 	mov	r0, #133	; 0x85
     ae0:	e3a01001 	mov	r1, #1
     ae4:	eb000484 	bl	1cfc <USBHwEPStall>
     ae8:	e3a00002 	mov	r0, #2
     aec:	e3a01001 	mov	r1, #1
     af0:	eb000481 	bl	1cfc <USBHwEPStall>
     af4:	e59f31dc 	ldr	r3, [pc, #476]	; cd8 <MSCBotBulkOut+0x298>
     af8:	e3a02004 	mov	r2, #4
     afc:	e5832034 	str	r2, [r3, #52]	; 0x34
     b00:	ea000073 	b	cd4 <MSCBotBulkOut+0x294>
     b04:	e59d3008 	ldr	r3, [sp, #8]
     b08:	e3530000 	cmp	r3, #0
     b0c:	da000009 	ble	b38 <MSCBotBulkOut+0xf8>
     b10:	e3150080 	tst	r5, #128	; 0x80
     b14:	e59d2004 	ldr	r2, [sp, #4]
     b18:	0a000002 	beq	b28 <MSCBotBulkOut+0xe8>
     b1c:	e3520000 	cmp	r2, #0
     b20:	1a000004 	bne	b38 <MSCBotBulkOut+0xf8>
     b24:	ea000001 	b	b30 <MSCBotBulkOut+0xf0>
     b28:	e3520000 	cmp	r2, #0
     b2c:	0a000001 	beq	b38 <MSCBotBulkOut+0xf8>
     b30:	e59f01b8 	ldr	r0, [pc, #440]	; cf0 <MSCBotBulkOut+0x2b0>
     b34:	ea000004 	b	b4c <MSCBotBulkOut+0x10c>
     b38:	e59f2198 	ldr	r2, [pc, #408]	; cd8 <MSCBotBulkOut+0x298>
     b3c:	e5921008 	ldr	r1, [r2, #8]
     b40:	e1530001 	cmp	r3, r1
     b44:	9a000004 	bls	b5c <MSCBotBulkOut+0x11c>
     b48:	e59f01a4 	ldr	r0, [pc, #420]	; cf4 <MSCBotBulkOut+0x2b4>
     b4c:	ebffff0d 	bl	788 <puts>
     b50:	ebffff63 	bl	8e4 <BOTStall>
     b54:	e3a00002 	mov	r0, #2
     b58:	ea000030 	b	c20 <MSCBotBulkOut+0x1e0>
     b5c:	e3530000 	cmp	r3, #0
     b60:	e5823020 	str	r3, [r2, #32]
     b64:	0a000004 	beq	b7c <MSCBotBulkOut+0x13c>
     b68:	e59d3004 	ldr	r3, [sp, #4]
     b6c:	e3530000 	cmp	r3, #0
     b70:	03a03001 	moveq	r3, #1
     b74:	05823034 	streq	r3, [r2, #52]	; 0x34
     b78:	0a000055 	beq	cd4 <MSCBotBulkOut+0x294>
     b7c:	e59f3154 	ldr	r3, [pc, #340]	; cd8 <MSCBotBulkOut+0x298>
     b80:	e3a02002 	mov	r2, #2
     b84:	e5832034 	str	r2, [r3, #52]	; 0x34
     b88:	ebffff76 	bl	968 <HandleDataIn>
     b8c:	ea000050 	b	cd4 <MSCBotBulkOut+0x294>
     b90:	e59f4140 	ldr	r4, [pc, #320]	; cd8 <MSCBotBulkOut+0x298>
     b94:	e594303c 	ldr	r3, [r4, #60]	; 0x3c
     b98:	e5942020 	ldr	r2, [r4, #32]
     b9c:	e1530002 	cmp	r3, r2
     ba0:	2a000012 	bcs	bf0 <MSCBotBulkOut+0x1b0>
     ba4:	e0632002 	rsb	r2, r3, r2
     ba8:	e5941038 	ldr	r1, [r4, #56]	; 0x38
     bac:	e3a00002 	mov	r0, #2
     bb0:	eb00047a 	bl	1da0 <USBHwEPRead>
     bb4:	e594303c 	ldr	r3, [r4, #60]	; 0x3c
     bb8:	e1a05000 	mov	r5, r0
     bbc:	e5d4100e 	ldrb	r1, [r4, #14]
     bc0:	e284000f 	add	r0, r4, #15
     bc4:	e5942038 	ldr	r2, [r4, #56]	; 0x38
     bc8:	eb00012b 	bl	107c <SCSIHandleData>
     bcc:	e3500000 	cmp	r0, #0
     bd0:	1594303c 	ldrne	r3, [r4, #60]	; 0x3c
     bd4:	10855003 	addne	r5, r5, r3
     bd8:	e5840038 	str	r0, [r4, #56]	; 0x38
     bdc:	1584503c 	strne	r5, [r4, #60]	; 0x3c
     be0:	1a000002 	bne	bf0 <MSCBotBulkOut+0x1b0>
     be4:	ebffff3e 	bl	8e4 <BOTStall>
     be8:	e3a00001 	mov	r0, #1
     bec:	ea00000b 	b	c20 <MSCBotBulkOut+0x1e0>
     bf0:	e59f30e0 	ldr	r3, [pc, #224]	; cd8 <MSCBotBulkOut+0x298>
     bf4:	e593203c 	ldr	r2, [r3, #60]	; 0x3c
     bf8:	e5931020 	ldr	r1, [r3, #32]
     bfc:	e1520001 	cmp	r2, r1
     c00:	1a000033 	bne	cd4 <MSCBotBulkOut+0x294>
     c04:	e5933008 	ldr	r3, [r3, #8]
     c08:	e1520003 	cmp	r2, r3
     c0c:	0a000002 	beq	c1c <MSCBotBulkOut+0x1dc>
     c10:	e59f00e0 	ldr	r0, [pc, #224]	; cf8 <MSCBotBulkOut+0x2b8>
     c14:	ebfffe9b 	bl	688 <printf>
     c18:	ebffff31 	bl	8e4 <BOTStall>
     c1c:	e3a00000 	mov	r0, #0
     c20:	ebffff3b 	bl	914 <SendCSW>
     c24:	ea00002a 	b	cd4 <MSCBotBulkOut+0x294>
     c28:	e3a01000 	mov	r1, #0
     c2c:	e1a02001 	mov	r2, r1
     c30:	eb00045a 	bl	1da0 <USBHwEPRead>
     c34:	e59f409c 	ldr	r4, [pc, #156]	; cd8 <MSCBotBulkOut+0x298>
     c38:	e1a02000 	mov	r2, r0
     c3c:	e5941034 	ldr	r1, [r4, #52]	; 0x34
     c40:	e59f00b4 	ldr	r0, [pc, #180]	; cfc <MSCBotBulkOut+0x2bc>
     c44:	ebfffe8f 	bl	688 <printf>
     c48:	e3a03000 	mov	r3, #0
     c4c:	e5843034 	str	r3, [r4, #52]	; 0x34
     c50:	ea00001f 	b	cd4 <MSCBotBulkOut+0x294>
     c54:	e3a00002 	mov	r0, #2
     c58:	e3a01001 	mov	r1, #1
     c5c:	eb000426 	bl	1cfc <USBHwEPStall>
     c60:	ea00001b 	b	cd4 <MSCBotBulkOut+0x294>
     c64:	e59f0094 	ldr	r0, [pc, #148]	; d00 <MSCBotBulkOut+0x2c0>
     c68:	ebfffe86 	bl	688 <printf>
     c6c:	e59f3090 	ldr	r3, [pc, #144]	; d04 <MSCBotBulkOut+0x2c4>
     c70:	e59f0090 	ldr	r0, [pc, #144]	; d08 <MSCBotBulkOut+0x2c8>
     c74:	e58d3000 	str	r3, [sp]
     c78:	e59f108c 	ldr	r1, [pc, #140]	; d0c <MSCBotBulkOut+0x2cc>
     c7c:	e59f208c 	ldr	r2, [pc, #140]	; d10 <MSCBotBulkOut+0x2d0>
     c80:	e59f308c 	ldr	r3, [pc, #140]	; d14 <MSCBotBulkOut+0x2d4>
     c84:	ebfffe7f 	bl	688 <printf>
     c88:	eafffffe 	b	c88 <MSCBotBulkOut+0x248>
     c8c:	e5d4200c 	ldrb	r2, [r4, #12]
     c90:	e5d4300f 	ldrb	r3, [r4, #15]
     c94:	e58d1000 	str	r1, [sp]
     c98:	e59f0078 	ldr	r0, [pc, #120]	; d18 <MSCBotBulkOut+0x2d8>
     c9c:	e5941008 	ldr	r1, [r4, #8]
     ca0:	ebfffe78 	bl	688 <printf>
     ca4:	e284000f 	add	r0, r4, #15
     ca8:	e5d4100e 	ldrb	r1, [r4, #14]
     cac:	e28d2008 	add	r2, sp, #8
     cb0:	e28d3004 	add	r3, sp, #4
     cb4:	e584503c 	str	r5, [r4, #60]	; 0x3c
     cb8:	e5845020 	str	r5, [r4, #32]
     cbc:	e5d4500c 	ldrb	r5, [r4, #12]
     cc0:	eb00004a 	bl	df0 <SCSIHandleCmd>
     cc4:	e3500000 	cmp	r0, #0
     cc8:	e5840038 	str	r0, [r4, #56]	; 0x38
     ccc:	1affff8c 	bne	b04 <MSCBotBulkOut+0xc4>
     cd0:	eaffffc3 	b	be4 <MSCBotBulkOut+0x1a4>
     cd4:	e8bd803e 	pop	{r1, r2, r3, r4, r5, pc}
     cd8:	40000204 	.word	0x40000204
     cdc:	00003041 	.word	0x00003041
     ce0:	43425355 	.word	0x43425355
     ce4:	00003056 	.word	0x00003056
     ce8:	0000306c 	.word	0x0000306c
     cec:	0000307c 	.word	0x0000307c
     cf0:	0000308f 	.word	0x0000308f
     cf4:	000030b5 	.word	0x000030b5
     cf8:	000030c6 	.word	0x000030c6
     cfc:	000030d4 	.word	0x000030d4
     d00:	000030f7 	.word	0x000030f7
     d04:	00000163 	.word	0x00000163
     d08:	00003109 	.word	0x00003109
     d0c:	0000312e 	.word	0x0000312e
     d10:	00003134 	.word	0x00003134
     d14:	00002ebc 	.word	0x00002ebc
     d18:	0000313e 	.word	0x0000313e

00000d1c <MSCBotBulkIn>:
     d1c:	e3110002 	tst	r1, #2
     d20:	e92d4011 	push	{r0, r4, lr}
     d24:	1a000023 	bne	db8 <MSCBotBulkIn+0x9c>
     d28:	e59f3090 	ldr	r3, [pc, #144]	; dc0 <MSCBotBulkIn+0xa4>
     d2c:	e5931034 	ldr	r1, [r3, #52]	; 0x34
     d30:	e3510004 	cmp	r1, #4
     d34:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
     d38:	ea000014 	b	d90 <MSCBotBulkIn+0x74>
     d3c:	00000db8 	.word	0x00000db8
     d40:	00000db8 	.word	0x00000db8
     d44:	00000d50 	.word	0x00000d50
     d48:	00000d5c 	.word	0x00000d5c
     d4c:	00000d7c 	.word	0x00000d7c
     d50:	e28dd004 	add	sp, sp, #4
     d54:	e8bd4010 	pop	{r4, lr}
     d58:	eaffff02 	b	968 <HandleDataIn>
     d5c:	e59f405c 	ldr	r4, [pc, #92]	; dc0 <MSCBotBulkIn+0xa4>
     d60:	e3a00085 	mov	r0, #133	; 0x85
     d64:	e2841024 	add	r1, r4, #36	; 0x24
     d68:	e3a0200d 	mov	r2, #13
     d6c:	eb0003ea 	bl	1d1c <USBHwEPWrite>
     d70:	e3a03000 	mov	r3, #0
     d74:	e5843034 	str	r3, [r4, #52]	; 0x34
     d78:	ea00000e 	b	db8 <MSCBotBulkIn+0x9c>
     d7c:	e3a00085 	mov	r0, #133	; 0x85
     d80:	e3a01001 	mov	r1, #1
     d84:	e28dd004 	add	sp, sp, #4
     d88:	e8bd4010 	pop	{r4, lr}
     d8c:	ea0003da 	b	1cfc <USBHwEPStall>
     d90:	e59f002c 	ldr	r0, [pc, #44]	; dc4 <MSCBotBulkIn+0xa8>
     d94:	ebfffe3b 	bl	688 <printf>
     d98:	e59f3028 	ldr	r3, [pc, #40]	; dc8 <MSCBotBulkIn+0xac>
     d9c:	e59f0028 	ldr	r0, [pc, #40]	; dcc <MSCBotBulkIn+0xb0>
     da0:	e58d3000 	str	r3, [sp]
     da4:	e59f1024 	ldr	r1, [pc, #36]	; dd0 <MSCBotBulkIn+0xb4>
     da8:	e59f2024 	ldr	r2, [pc, #36]	; dd4 <MSCBotBulkIn+0xb8>
     dac:	e59f3024 	ldr	r3, [pc, #36]	; dd8 <MSCBotBulkIn+0xbc>
     db0:	ebfffe34 	bl	688 <printf>
     db4:	eafffffe 	b	db4 <MSCBotBulkIn+0x98>
     db8:	e28dd004 	add	sp, sp, #4
     dbc:	e8bd8010 	pop	{r4, pc}
     dc0:	40000204 	.word	0x40000204
     dc4:	000030f7 	.word	0x000030f7
     dc8:	0000018f 	.word	0x0000018f
     dcc:	00003109 	.word	0x00003109
     dd0:	0000312e 	.word	0x0000312e
     dd4:	00003134 	.word	0x00003134
     dd8:	00002ecc 	.word	0x00002ecc

00000ddc <SCSIReset>:
     ddc:	e59f3008 	ldr	r3, [pc, #8]	; dec <SCSIReset+0x10>
     de0:	e3a02000 	mov	r2, #0
     de4:	e5832000 	str	r2, [r3]
     de8:	e12fff1e 	bx	lr
     dec:	40000244 	.word	0x40000244

00000df0 <SCSIHandleCmd>:
     df0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
     df4:	e1a06003 	mov	r6, r3
     df8:	e3a03001 	mov	r3, #1
     dfc:	e5863000 	str	r3, [r6]
     e00:	e59f3234 	ldr	r3, [pc, #564]	; 103c <SCSIHandleCmd+0x24c>
     e04:	e5d08000 	ldrb	r8, [r0]
     e08:	e20170ff 	and	r7, r1, #255	; 0xff
     e0c:	e7d312a8 	ldrb	r1, [r3, r8, lsr #5]
     e10:	e1570001 	cmp	r7, r1
     e14:	e1a04000 	mov	r4, r0
     e18:	e1a05002 	mov	r5, r2
     e1c:	2a000003 	bcs	e30 <SCSIHandleCmd+0x40>
     e20:	e59f0218 	ldr	r0, [pc, #536]	; 1040 <SCSIHandleCmd+0x250>
     e24:	ebfffe17 	bl	688 <printf>
     e28:	e3a06000 	mov	r6, #0
     e2c:	ea000080 	b	1034 <SCSIHandleCmd+0x244>
     e30:	e3580012 	cmp	r8, #18
     e34:	0a000024 	beq	ecc <SCSIHandleCmd+0xdc>
     e38:	8a000006 	bhi	e58 <SCSIHandleCmd+0x68>
     e3c:	e3580003 	cmp	r8, #3
     e40:	0a000013 	beq	e94 <SCSIHandleCmd+0xa4>
     e44:	e3580004 	cmp	r8, #4
     e48:	0a00001a 	beq	eb8 <SCSIHandleCmd+0xc8>
     e4c:	e3580000 	cmp	r8, #0
     e50:	0a00000b 	beq	e84 <SCSIHandleCmd+0x94>
     e54:	ea000063 	b	fe8 <SCSIHandleCmd+0x1f8>
     e58:	e3580028 	cmp	r8, #40	; 0x28
     e5c:	0a000025 	beq	ef8 <SCSIHandleCmd+0x108>
     e60:	8a000002 	bhi	e70 <SCSIHandleCmd+0x80>
     e64:	e3580025 	cmp	r8, #37	; 0x25
     e68:	1a00005e 	bne	fe8 <SCSIHandleCmd+0x1f8>
     e6c:	ea00001d 	b	ee8 <SCSIHandleCmd+0xf8>
     e70:	e358002a 	cmp	r8, #42	; 0x2a
     e74:	0a000030 	beq	f3c <SCSIHandleCmd+0x14c>
     e78:	e358002f 	cmp	r8, #47	; 0x2f
     e7c:	1a000059 	bne	fe8 <SCSIHandleCmd+0x1f8>
     e80:	ea000040 	b	f88 <SCSIHandleCmd+0x198>
     e84:	e59f01b8 	ldr	r0, [pc, #440]	; 1044 <SCSIHandleCmd+0x254>
     e88:	ebfffe3e 	bl	788 <puts>
     e8c:	e5858000 	str	r8, [r5]
     e90:	ea000066 	b	1030 <SCSIHandleCmd+0x240>
     e94:	e59f61ac 	ldr	r6, [pc, #428]	; 1048 <SCSIHandleCmd+0x258>
     e98:	e59f01ac 	ldr	r0, [pc, #428]	; 104c <SCSIHandleCmd+0x25c>
     e9c:	e4961004 	ldr	r1, [r6], #4
     ea0:	ebfffdf8 	bl	688 <printf>
     ea4:	e5d43004 	ldrb	r3, [r4, #4]
     ea8:	e3530012 	cmp	r3, #18
     eac:	23a03012 	movcs	r3, #18
     eb0:	e5853000 	str	r3, [r5]
     eb4:	ea00005e 	b	1034 <SCSIHandleCmd+0x244>
     eb8:	e59f0190 	ldr	r0, [pc, #400]	; 1050 <SCSIHandleCmd+0x260>
     ebc:	e5d41001 	ldrb	r1, [r4, #1]
     ec0:	ebfffdf0 	bl	688 <printf>
     ec4:	e3a03000 	mov	r3, #0
     ec8:	ea000004 	b	ee0 <SCSIHandleCmd+0xf0>
     ecc:	e59f0180 	ldr	r0, [pc, #384]	; 1054 <SCSIHandleCmd+0x264>
     ed0:	ebfffe2c 	bl	788 <puts>
     ed4:	e5d43004 	ldrb	r3, [r4, #4]
     ed8:	e3530024 	cmp	r3, #36	; 0x24
     edc:	23a03024 	movcs	r3, #36	; 0x24
     ee0:	e5853000 	str	r3, [r5]
     ee4:	ea000051 	b	1030 <SCSIHandleCmd+0x240>
     ee8:	e59f0168 	ldr	r0, [pc, #360]	; 1058 <SCSIHandleCmd+0x268>
     eec:	ebfffe25 	bl	788 <puts>
     ef0:	e3a03008 	mov	r3, #8
     ef4:	eafffff9 	b	ee0 <SCSIHandleCmd+0xf0>
     ef8:	e5d03008 	ldrb	r3, [r0, #8]
     efc:	e5d06007 	ldrb	r6, [r0, #7]
     f00:	e1836406 	orr	r6, r3, r6, lsl #8
     f04:	e5d03003 	ldrb	r3, [r0, #3]
     f08:	e5d02002 	ldrb	r2, [r0, #2]
     f0c:	e1a03803 	lsl	r3, r3, #16
     f10:	e1833c02 	orr	r3, r3, r2, lsl #24
     f14:	e5d02005 	ldrb	r2, [r0, #5]
     f18:	e5d01004 	ldrb	r1, [r0, #4]
     f1c:	e1833002 	orr	r3, r3, r2
     f20:	e59f0134 	ldr	r0, [pc, #308]	; 105c <SCSIHandleCmd+0x26c>
     f24:	e1a02006 	mov	r2, r6
     f28:	e1831401 	orr	r1, r3, r1, lsl #8
     f2c:	e1a06486 	lsl	r6, r6, #9
     f30:	ebfffdd4 	bl	688 <printf>
     f34:	e5856000 	str	r6, [r5]
     f38:	ea00003c 	b	1030 <SCSIHandleCmd+0x240>
     f3c:	e5d03008 	ldrb	r3, [r0, #8]
     f40:	e5d07007 	ldrb	r7, [r0, #7]
     f44:	e1837407 	orr	r7, r3, r7, lsl #8
     f48:	e5d03003 	ldrb	r3, [r0, #3]
     f4c:	e5d02002 	ldrb	r2, [r0, #2]
     f50:	e1a03803 	lsl	r3, r3, #16
     f54:	e1833c02 	orr	r3, r3, r2, lsl #24
     f58:	e5d02005 	ldrb	r2, [r0, #5]
     f5c:	e5d01004 	ldrb	r1, [r0, #4]
     f60:	e1833002 	orr	r3, r3, r2
     f64:	e1831401 	orr	r1, r3, r1, lsl #8
     f68:	e1a02007 	mov	r2, r7
     f6c:	e59f00ec 	ldr	r0, [pc, #236]	; 1060 <SCSIHandleCmd+0x270>
     f70:	ebfffdc4 	bl	688 <printf>
     f74:	e1a07487 	lsl	r7, r7, #9
     f78:	e3a03000 	mov	r3, #0
     f7c:	e5857000 	str	r7, [r5]
     f80:	e5863000 	str	r3, [r6]
     f84:	ea000029 	b	1030 <SCSIHandleCmd+0x240>
     f88:	e5d01003 	ldrb	r1, [r0, #3]
     f8c:	e5d03002 	ldrb	r3, [r0, #2]
     f90:	e1a01801 	lsl	r1, r1, #16
     f94:	e1811c03 	orr	r1, r1, r3, lsl #24
     f98:	e5d03005 	ldrb	r3, [r0, #5]
     f9c:	e5d0c004 	ldrb	ip, [r0, #4]
     fa0:	e5d02007 	ldrb	r2, [r0, #7]
     fa4:	e1811003 	orr	r1, r1, r3
     fa8:	e5d03008 	ldrb	r3, [r0, #8]
     fac:	e181140c 	orr	r1, r1, ip, lsl #8
     fb0:	e1832402 	orr	r2, r3, r2, lsl #8
     fb4:	e59f00a8 	ldr	r0, [pc, #168]	; 1064 <SCSIHandleCmd+0x274>
     fb8:	e3a06000 	mov	r6, #0
     fbc:	ebfffdb1 	bl	688 <printf>
     fc0:	e5856000 	str	r6, [r5]
     fc4:	e5d43001 	ldrb	r3, [r4, #1]
     fc8:	e3130002 	tst	r3, #2
     fcc:	0a000017 	beq	1030 <SCSIHandleCmd+0x240>
     fd0:	e59f0090 	ldr	r0, [pc, #144]	; 1068 <SCSIHandleCmd+0x278>
     fd4:	ebfffdeb 	bl	788 <puts>
     fd8:	e59f208c 	ldr	r2, [pc, #140]	; 106c <SCSIHandleCmd+0x27c>
     fdc:	e59f3064 	ldr	r3, [pc, #100]	; 1048 <SCSIHandleCmd+0x258>
     fe0:	e5832000 	str	r2, [r3]
     fe4:	ea000012 	b	1034 <SCSIHandleCmd+0x244>
     fe8:	e59f0080 	ldr	r0, [pc, #128]	; 1070 <SCSIHandleCmd+0x280>
     fec:	ebfffda5 	bl	688 <printf>
     ff0:	e3a06000 	mov	r6, #0
     ff4:	ea000003 	b	1008 <SCSIHandleCmd+0x218>
     ff8:	e7d41006 	ldrb	r1, [r4, r6]
     ffc:	e59f0070 	ldr	r0, [pc, #112]	; 1074 <SCSIHandleCmd+0x284>
    1000:	ebfffda0 	bl	688 <printf>
    1004:	e2866001 	add	r6, r6, #1
    1008:	e1560007 	cmp	r6, r7
    100c:	bafffff9 	blt	ff8 <SCSIHandleCmd+0x208>
    1010:	e3a0000a 	mov	r0, #10
    1014:	ebfffdc2 	bl	724 <putchar>
    1018:	e59f3028 	ldr	r3, [pc, #40]	; 1048 <SCSIHandleCmd+0x258>
    101c:	e3a02a52 	mov	r2, #335872	; 0x52000
    1020:	e3a06000 	mov	r6, #0
    1024:	e5832000 	str	r2, [r3]
    1028:	e5856000 	str	r6, [r5]
    102c:	ea000000 	b	1034 <SCSIHandleCmd+0x244>
    1030:	e59f6040 	ldr	r6, [pc, #64]	; 1078 <SCSIHandleCmd+0x288>
    1034:	e1a00006 	mov	r0, r6
    1038:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    103c:	00002edc 	.word	0x00002edc
    1040:	00003168 	.word	0x00003168
    1044:	00003188 	.word	0x00003188
    1048:	40000244 	.word	0x40000244
    104c:	00003198 	.word	0x00003198
    1050:	000031ae 	.word	0x000031ae
    1054:	000031c0 	.word	0x000031c0
    1058:	000031c8 	.word	0x000031c8
    105c:	000031d6 	.word	0x000031d6
    1060:	000031ee 	.word	0x000031ee
    1064:	00003207 	.word	0x00003207
    1068:	00003221 	.word	0x00003221
    106c:	00052400 	.word	0x00052400
    1070:	00003236 	.word	0x00003236
    1074:	00003247 	.word	0x00003247
    1078:	40000248 	.word	0x40000248

0000107c <SCSIHandleData>:
    107c:	e92d45f1 	push	{r0, r4, r5, r6, r7, r8, sl, lr}
    1080:	e5d05000 	ldrb	r5, [r0]
    1084:	e3550012 	cmp	r5, #18
    1088:	e1a04002 	mov	r4, r2
    108c:	e1a06003 	mov	r6, r3
    1090:	0a00002a 	beq	1140 <SCSIHandleData+0xc4>
    1094:	8a000006 	bhi	10b4 <SCSIHandleData+0x38>
    1098:	e3550003 	cmp	r5, #3
    109c:	0a000018 	beq	1104 <SCSIHandleData+0x88>
    10a0:	e3550004 	cmp	r5, #4
    10a4:	0a000074 	beq	127c <SCSIHandleData+0x200>
    10a8:	e3550000 	cmp	r5, #0
    10ac:	0a00000b 	beq	10e0 <SCSIHandleData+0x64>
    10b0:	ea00006c 	b	1268 <SCSIHandleData+0x1ec>
    10b4:	e3550028 	cmp	r5, #40	; 0x28
    10b8:	0a000037 	beq	119c <SCSIHandleData+0x120>
    10bc:	8a000002 	bhi	10cc <SCSIHandleData+0x50>
    10c0:	e3550025 	cmp	r5, #37	; 0x25
    10c4:	1a000067 	bne	1268 <SCSIHandleData+0x1ec>
    10c8:	ea000021 	b	1154 <SCSIHandleData+0xd8>
    10cc:	e355002a 	cmp	r5, #42	; 0x2a
    10d0:	0a000048 	beq	11f8 <SCSIHandleData+0x17c>
    10d4:	e355002f 	cmp	r5, #47	; 0x2f
    10d8:	1a000062 	bne	1268 <SCSIHandleData+0x1ec>
    10dc:	ea000066 	b	127c <SCSIHandleData+0x200>
    10e0:	e59f41a0 	ldr	r4, [pc, #416]	; 1288 <SCSIHandleData+0x20c>
    10e4:	e5943000 	ldr	r3, [r4]
    10e8:	e3530000 	cmp	r3, #0
    10ec:	02844004 	addeq	r4, r4, #4
    10f0:	0a000062 	beq	1280 <SCSIHandleData+0x204>
    10f4:	e59f0190 	ldr	r0, [pc, #400]	; 128c <SCSIHandleData+0x210>
    10f8:	ebfffda2 	bl	788 <puts>
    10fc:	e1a04005 	mov	r4, r5
    1100:	ea00005e 	b	1280 <SCSIHandleData+0x204>
    1104:	e59f517c 	ldr	r5, [pc, #380]	; 1288 <SCSIHandleData+0x20c>
    1108:	e1a00002 	mov	r0, r2
    110c:	e59f117c 	ldr	r1, [pc, #380]	; 1290 <SCSIHandleData+0x214>
    1110:	e3a02012 	mov	r2, #18
    1114:	eb000714 	bl	2d6c <memcpy>
    1118:	e5953000 	ldr	r3, [r5]
    111c:	e1a02823 	lsr	r2, r3, #16
    1120:	e5c42002 	strb	r2, [r4, #2]
    1124:	e1a02423 	lsr	r2, r3, #8
    1128:	e5c4300d 	strb	r3, [r4, #13]
    112c:	e5c4200c 	strb	r2, [r4, #12]
    1130:	e3a03000 	mov	r3, #0
    1134:	e1a04005 	mov	r4, r5
    1138:	e4843004 	str	r3, [r4], #4
    113c:	ea00004f 	b	1280 <SCSIHandleData+0x204>
    1140:	e1a00002 	mov	r0, r2
    1144:	e59f1148 	ldr	r1, [pc, #328]	; 1294 <SCSIHandleData+0x218>
    1148:	e3a02024 	mov	r2, #36	; 0x24
    114c:	eb000706 	bl	2d6c <memcpy>
    1150:	ea000049 	b	127c <SCSIHandleData+0x200>
    1154:	e1a0000d 	mov	r0, sp
    1158:	eb000072 	bl	1328 <BlockDevGetSize>
    115c:	e59d2000 	ldr	r2, [sp]
    1160:	e2422001 	sub	r2, r2, #1
    1164:	e1a014a2 	lsr	r1, r2, #9
    1168:	e1a00ca2 	lsr	r0, r2, #25
    116c:	e1a028a2 	lsr	r2, r2, #17
    1170:	e3a03000 	mov	r3, #0
    1174:	e5c42002 	strb	r2, [r4, #2]
    1178:	e3a02002 	mov	r2, #2
    117c:	e5c43000 	strb	r3, [r4]
    1180:	e5c40001 	strb	r0, [r4, #1]
    1184:	e5c41003 	strb	r1, [r4, #3]
    1188:	e5c43004 	strb	r3, [r4, #4]
    118c:	e5c43005 	strb	r3, [r4, #5]
    1190:	e5c42006 	strb	r2, [r4, #6]
    1194:	e5c43007 	strb	r3, [r4, #7]
    1198:	ea000037 	b	127c <SCSIHandleData+0x200>
    119c:	e1a04b83 	lsl	r4, r3, #23
    11a0:	e1b04ba4 	lsrs	r4, r4, #23
    11a4:	e5d08002 	ldrb	r8, [r0, #2]
    11a8:	e5d0a003 	ldrb	sl, [r0, #3]
    11ac:	e5d05004 	ldrb	r5, [r0, #4]
    11b0:	e5d07005 	ldrb	r7, [r0, #5]
    11b4:	1a000028 	bne	125c <SCSIHandleData+0x1e0>
    11b8:	e1a0a80a 	lsl	sl, sl, #16
    11bc:	e18a8c08 	orr	r8, sl, r8, lsl #24
    11c0:	e3a00052 	mov	r0, #82	; 0x52
    11c4:	e1887007 	orr	r7, r8, r7
    11c8:	ebfffd55 	bl	724 <putchar>
    11cc:	e1870405 	orr	r0, r7, r5, lsl #8
    11d0:	e59f50b0 	ldr	r5, [pc, #176]	; 1288 <SCSIHandleData+0x20c>
    11d4:	e08004a6 	add	r0, r0, r6, lsr #9
    11d8:	e2851004 	add	r1, r5, #4
    11dc:	eb00004d 	bl	1318 <BlockDevRead>
    11e0:	e3500000 	cmp	r0, #0
    11e4:	aa00001c 	bge	125c <SCSIHandleData+0x1e0>
    11e8:	e59f30a8 	ldr	r3, [pc, #168]	; 1298 <SCSIHandleData+0x21c>
    11ec:	e59f00a8 	ldr	r0, [pc, #168]	; 129c <SCSIHandleData+0x220>
    11f0:	e5853000 	str	r3, [r5]
    11f4:	ea000016 	b	1254 <SCSIHandleData+0x1d8>
    11f8:	e2834040 	add	r4, r3, #64	; 0x40
    11fc:	e1a04b84 	lsl	r4, r4, #23
    1200:	e1b04ba4 	lsrs	r4, r4, #23
    1204:	e5d08002 	ldrb	r8, [r0, #2]
    1208:	e5d0a003 	ldrb	sl, [r0, #3]
    120c:	e5d05004 	ldrb	r5, [r0, #4]
    1210:	e5d07005 	ldrb	r7, [r0, #5]
    1214:	1a000010 	bne	125c <SCSIHandleData+0x1e0>
    1218:	e1a0a80a 	lsl	sl, sl, #16
    121c:	e18a8c08 	orr	r8, sl, r8, lsl #24
    1220:	e3a00057 	mov	r0, #87	; 0x57
    1224:	e1887007 	orr	r7, r8, r7
    1228:	ebfffd3d 	bl	724 <putchar>
    122c:	e1870405 	orr	r0, r7, r5, lsl #8
    1230:	e59f5050 	ldr	r5, [pc, #80]	; 1288 <SCSIHandleData+0x20c>
    1234:	e08004a6 	add	r0, r0, r6, lsr #9
    1238:	e2851004 	add	r1, r5, #4
    123c:	eb000031 	bl	1308 <BlockDevWrite>
    1240:	e3500000 	cmp	r0, #0
    1244:	aa000004 	bge	125c <SCSIHandleData+0x1e0>
    1248:	e3a03bc3 	mov	r3, #199680	; 0x30c00
    124c:	e5853000 	str	r3, [r5]
    1250:	e59f0048 	ldr	r0, [pc, #72]	; 12a0 <SCSIHandleData+0x224>
    1254:	ebfffd4b 	bl	788 <puts>
    1258:	ea000008 	b	1280 <SCSIHandleData+0x204>
    125c:	e59f5040 	ldr	r5, [pc, #64]	; 12a4 <SCSIHandleData+0x228>
    1260:	e0854004 	add	r4, r5, r4
    1264:	ea000005 	b	1280 <SCSIHandleData+0x204>
    1268:	e59f3018 	ldr	r3, [pc, #24]	; 1288 <SCSIHandleData+0x20c>
    126c:	e3a02a52 	mov	r2, #335872	; 0x52000
    1270:	e5832000 	str	r2, [r3]
    1274:	e3a04000 	mov	r4, #0
    1278:	ea000000 	b	1280 <SCSIHandleData+0x204>
    127c:	e59f4020 	ldr	r4, [pc, #32]	; 12a4 <SCSIHandleData+0x228>
    1280:	e1a00004 	mov	r0, r4
    1284:	e8bd85f8 	pop	{r3, r4, r5, r6, r7, r8, sl, pc}
    1288:	40000244 	.word	0x40000244
    128c:	0000324d 	.word	0x0000324d
    1290:	00002ee4 	.word	0x00002ee4
    1294:	00002ef8 	.word	0x00002ef8
    1298:	00031100 	.word	0x00031100
    129c:	0000325d 	.word	0x0000325d
    12a0:	00003271 	.word	0x00003271
    12a4:	40000248 	.word	0x40000248

000012a8 <getsdbits>:
    12a8:	e261107f 	rsb	r1, r1, #127	; 0x7f
    12ac:	e211311e 	ands	r3, r1, #-2147483641	; 0x80000007
    12b0:	42433001 	submi	r3, r3, #1
    12b4:	41e03e83 	mvnmi	r3, r3, lsl #29
    12b8:	41e03ea3 	mvnmi	r3, r3, lsr #29
    12bc:	42833001 	addmi	r3, r3, #1
    12c0:	e3e0c000 	mvn	ip, #0
    12c4:	e0833002 	add	r3, r3, r2
    12c8:	e3510000 	cmp	r1, #0
    12cc:	e1e0c21c 	mvn	ip, ip, lsl r2
    12d0:	e2812007 	add	r2, r1, #7
    12d4:	b1a01002 	movlt	r1, r2
    12d8:	e2633000 	rsb	r3, r3, #0
    12dc:	e08011c1 	add	r1, r0, r1, asr #3
    12e0:	e3a02000 	mov	r2, #0
    12e4:	ea000002 	b	12f4 <getsdbits+0x4c>
    12e8:	e4d10001 	ldrb	r0, [r1], #1
    12ec:	e2833008 	add	r3, r3, #8
    12f0:	e1802402 	orr	r2, r0, r2, lsl #8
    12f4:	e3530000 	cmp	r3, #0
    12f8:	bafffffa 	blt	12e8 <getsdbits+0x40>
    12fc:	e00c0332 	and	r0, ip, r2, lsr r3
    1300:	e12fff1e 	bx	lr

00001304 <BlockDevInit>:
    1304:	ea000149 	b	1830 <SDInit>

00001308 <BlockDevWrite>:
    1308:	e1a03000 	mov	r3, r0
    130c:	e1a00001 	mov	r0, r1
    1310:	e1a01003 	mov	r1, r3
    1314:	ea0000c7 	b	1638 <SDWriteBlock>

00001318 <BlockDevRead>:
    1318:	e1a03000 	mov	r3, r0
    131c:	e1a00001 	mov	r0, r1
    1320:	e1a01003 	mov	r1, r3
    1324:	ea0000a7 	b	15c8 <SDReadBlock>

00001328 <BlockDevGetSize>:
    1328:	e92d40ff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, lr}
    132c:	e1a05000 	mov	r5, r0
    1330:	e1a0000d 	mov	r0, sp
    1334:	eb0000fd 	bl	1730 <SDReadCSD>
    1338:	e3500000 	cmp	r0, #0
    133c:	e1a0400d 	mov	r4, sp
    1340:	0a00002f 	beq	1404 <BlockDevGetSize+0xdc>
    1344:	e3a0107f 	mov	r1, #127	; 0x7f
    1348:	e1a0000d 	mov	r0, sp
    134c:	e3a02002 	mov	r2, #2
    1350:	ebffffd4 	bl	12a8 <getsdbits>
    1354:	e21010ff 	ands	r1, r0, #255	; 0xff
    1358:	0a000002 	beq	1368 <BlockDevGetSize+0x40>
    135c:	e3510001 	cmp	r1, #1
    1360:	1a000020 	bne	13e8 <BlockDevGetSize+0xc0>
    1364:	ea000017 	b	13c8 <BlockDevGetSize+0xa0>
    1368:	e3a01053 	mov	r1, #83	; 0x53
    136c:	e3a02004 	mov	r2, #4
    1370:	e1a0000d 	mov	r0, sp
    1374:	ebffffcb 	bl	12a8 <getsdbits>
    1378:	e3a01049 	mov	r1, #73	; 0x49
    137c:	e1a06000 	mov	r6, r0
    1380:	e3a0200c 	mov	r2, #12
    1384:	e1a0000d 	mov	r0, sp
    1388:	ebffffc6 	bl	12a8 <getsdbits>
    138c:	e3a01031 	mov	r1, #49	; 0x31
    1390:	e1a07000 	mov	r7, r0
    1394:	e3a02003 	mov	r2, #3
    1398:	e1a0000d 	mov	r0, sp
    139c:	ebffffc1 	bl	12a8 <getsdbits>
    13a0:	e3a03004 	mov	r3, #4
    13a4:	e20000ff 	and	r0, r0, #255	; 0xff
    13a8:	e1a00013 	lsl	r0, r3, r0
    13ac:	e1a06806 	lsl	r6, r6, #16
    13b0:	e2877001 	add	r7, r7, #1
    13b4:	e1a06826 	lsr	r6, r6, #16
    13b8:	e3a03001 	mov	r3, #1
    13bc:	e0070790 	mul	r7, r0, r7
    13c0:	e1a06613 	lsl	r6, r3, r6
    13c4:	ea00000b 	b	13f8 <BlockDevGetSize+0xd0>
    13c8:	e1a0000d 	mov	r0, sp
    13cc:	e3a01045 	mov	r1, #69	; 0x45
    13d0:	e3a02016 	mov	r2, #22
    13d4:	ebffffb3 	bl	12a8 <getsdbits>
    13d8:	e2807001 	add	r7, r0, #1
    13dc:	e1a07987 	lsl	r7, r7, #19
    13e0:	e3a06c02 	mov	r6, #512	; 0x200
    13e4:	ea000003 	b	13f8 <BlockDevGetSize+0xd0>
    13e8:	e59f001c 	ldr	r0, [pc, #28]	; 140c <BlockDevGetSize+0xe4>
    13ec:	ebfffca5 	bl	688 <printf>
    13f0:	e3a00000 	mov	r0, #0
    13f4:	ea000002 	b	1404 <BlockDevGetSize+0xdc>
    13f8:	e0060697 	mul	r6, r7, r6
    13fc:	e5856000 	str	r6, [r5]
    1400:	e3a00001 	mov	r0, #1
    1404:	e28dd010 	add	sp, sp, #16
    1408:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    140c:	00003286 	.word	0x00003286

00001410 <SDWaitResp>:
    1410:	e92d4071 	push	{r0, r4, r5, r6, lr}
    1414:	e3e03000 	mvn	r3, #0
    1418:	e28d5004 	add	r5, sp, #4
    141c:	e1a06000 	mov	r6, r0
    1420:	e5653001 	strb	r3, [r5, #-1]!
    1424:	e3a04000 	mov	r4, #0
    1428:	ea000007 	b	144c <SDWaitResp+0x3c>
    142c:	e3a00001 	mov	r0, #1
    1430:	e3a01000 	mov	r1, #0
    1434:	e1a02005 	mov	r2, r5
    1438:	eb00017e 	bl	1a38 <SPITransfer>
    143c:	e5dd3003 	ldrb	r3, [sp, #3]
    1440:	e35300ff 	cmp	r3, #255	; 0xff
    1444:	1a000002 	bne	1454 <SDWaitResp+0x44>
    1448:	e2844001 	add	r4, r4, #1
    144c:	e1540006 	cmp	r4, r6
    1450:	bafffff5 	blt	142c <SDWaitResp+0x1c>
    1454:	e5dd0003 	ldrb	r0, [sp, #3]
    1458:	e8bd8078 	pop	{r3, r4, r5, r6, pc}

0000145c <SDCommand>:
    145c:	e92d4033 	push	{r0, r1, r4, r5, lr}
    1460:	e1a04001 	mov	r4, r1
    1464:	e1a05000 	mov	r5, r0
    1468:	e3a01000 	mov	r1, #0
    146c:	e3a00001 	mov	r0, #1
    1470:	e28d2007 	add	r2, sp, #7
    1474:	eb00016f 	bl	1a38 <SPITransfer>
    1478:	e5dd1007 	ldrb	r1, [sp, #7]
    147c:	e35100ff 	cmp	r1, #255	; 0xff
    1480:	0a000003 	beq	1494 <SDCommand+0x38>
    1484:	e59f0058 	ldr	r0, [pc, #88]	; 14e4 <SDCommand+0x88>
    1488:	ebfffc7e 	bl	688 <printf>
    148c:	e5dd0007 	ldrb	r0, [sp, #7]
    1490:	ea000012 	b	14e0 <SDCommand+0x84>
    1494:	e3853040 	orr	r3, r5, #64	; 0x40
    1498:	e5cd3000 	strb	r3, [sp]
    149c:	e1a03c24 	lsr	r3, r4, #24
    14a0:	e3550008 	cmp	r5, #8
    14a4:	e5cd3001 	strb	r3, [sp, #1]
    14a8:	e1a03824 	lsr	r3, r4, #16
    14ac:	e5cd3002 	strb	r3, [sp, #2]
    14b0:	13a05095 	movne	r5, #149	; 0x95
    14b4:	e1a03424 	lsr	r3, r4, #8
    14b8:	03a05087 	moveq	r5, #135	; 0x87
    14bc:	e3a00006 	mov	r0, #6
    14c0:	e1a0100d 	mov	r1, sp
    14c4:	e3a02000 	mov	r2, #0
    14c8:	e5cd3003 	strb	r3, [sp, #3]
    14cc:	e5cd4004 	strb	r4, [sp, #4]
    14d0:	e5cd5005 	strb	r5, [sp, #5]
    14d4:	eb000157 	bl	1a38 <SPITransfer>
    14d8:	e3a00008 	mov	r0, #8
    14dc:	ebffffcb 	bl	1410 <SDWaitResp>
    14e0:	e8bd803c 	pop	{r2, r3, r4, r5, pc}
    14e4:	000032a3 	.word	0x000032a3

000014e8 <SDSendOpCond>:
    14e8:	e92d4030 	push	{r4, r5, lr}
    14ec:	e1a05000 	mov	r5, r0
    14f0:	e3a04b01 	mov	r4, #1024	; 0x400
    14f4:	e3a01000 	mov	r1, #0
    14f8:	e3a00037 	mov	r0, #55	; 0x37
    14fc:	ebffffd6 	bl	145c <SDCommand>
    1500:	e3a00029 	mov	r0, #41	; 0x29
    1504:	e1a01005 	mov	r1, r5
    1508:	ebffffd3 	bl	145c <SDCommand>
    150c:	e3500000 	cmp	r0, #0
    1510:	0a000005 	beq	152c <SDSendOpCond+0x44>
    1514:	e2544001 	subs	r4, r4, #1
    1518:	1afffff5 	bne	14f4 <SDSendOpCond+0xc>
    151c:	e59f0010 	ldr	r0, [pc, #16]	; 1534 <SDSendOpCond+0x4c>
    1520:	ebfffc98 	bl	788 <puts>
    1524:	e1a00004 	mov	r0, r4
    1528:	e8bd8030 	pop	{r4, r5, pc}
    152c:	e3a00001 	mov	r0, #1
    1530:	e8bd8030 	pop	{r4, r5, pc}
    1534:	000032b8 	.word	0x000032b8

00001538 <SDReadDataToken.clone.0>:
    1538:	e92d4030 	push	{r4, r5, lr}
    153c:	e1a04000 	mov	r4, r0
    1540:	e3a00b01 	mov	r0, #1024	; 0x400
    1544:	e1a05001 	mov	r5, r1
    1548:	ebffffb0 	bl	1410 <SDWaitResp>
    154c:	e35000fe 	cmp	r0, #254	; 0xfe
    1550:	e1a01000 	mov	r1, r0
    1554:	0a000003 	beq	1568 <SDReadDataToken.clone.0+0x30>
    1558:	e59f0030 	ldr	r0, [pc, #48]	; 1590 <SDReadDataToken.clone.0+0x58>
    155c:	ebfffc49 	bl	688 <printf>
    1560:	e3a00000 	mov	r0, #0
    1564:	e8bd8030 	pop	{r4, r5, pc}
    1568:	e1a00005 	mov	r0, r5
    156c:	e1a02004 	mov	r2, r4
    1570:	e3a01000 	mov	r1, #0
    1574:	eb00012f 	bl	1a38 <SPITransfer>
    1578:	e3a01000 	mov	r1, #0
    157c:	e3a00002 	mov	r0, #2
    1580:	e1a02001 	mov	r2, r1
    1584:	eb00012b 	bl	1a38 <SPITransfer>
    1588:	e3a00001 	mov	r0, #1
    158c:	e8bd8030 	pop	{r4, r5, pc}
    1590:	000032d0 	.word	0x000032d0

00001594 <SDExtraResp.clone.1>:
    1594:	e92d4011 	push	{r0, r4, lr}
    1598:	e3a01000 	mov	r1, #0
    159c:	e3a00004 	mov	r0, #4
    15a0:	e1a0200d 	mov	r2, sp
    15a4:	eb000123 	bl	1a38 <SPITransfer>
    15a8:	e28d4003 	add	r4, sp, #3
    15ac:	e24d3001 	sub	r3, sp, #1
    15b0:	e3a00000 	mov	r0, #0
    15b4:	e5f32001 	ldrb	r2, [r3, #1]!
    15b8:	e1530004 	cmp	r3, r4
    15bc:	e1820400 	orr	r0, r2, r0, lsl #8
    15c0:	1afffffb 	bne	15b4 <SDExtraResp.clone.1+0x20>
    15c4:	e8bd8018 	pop	{r3, r4, pc}

000015c8 <SDReadBlock>:
    15c8:	e59f305c 	ldr	r3, [pc, #92]	; 162c <SDReadBlock+0x64>
    15cc:	e5933000 	ldr	r3, [r3]
    15d0:	e3530003 	cmp	r3, #3
    15d4:	e92d4010 	push	{r4, lr}
    15d8:	11a01481 	lslne	r1, r1, #9
    15dc:	e1a04000 	mov	r4, r0
    15e0:	e3a00011 	mov	r0, #17
    15e4:	ebffff9c 	bl	145c <SDCommand>
    15e8:	e2501000 	subs	r1, r0, #0
    15ec:	0a000003 	beq	1600 <SDReadBlock+0x38>
    15f0:	e59f0038 	ldr	r0, [pc, #56]	; 1630 <SDReadBlock+0x68>
    15f4:	ebfffc23 	bl	688 <printf>
    15f8:	e3a00000 	mov	r0, #0
    15fc:	e8bd8010 	pop	{r4, pc}
    1600:	e1a00004 	mov	r0, r4
    1604:	e3a01c02 	mov	r1, #512	; 0x200
    1608:	ebffffca 	bl	1538 <SDReadDataToken.clone.0>
    160c:	e2504000 	subs	r4, r0, #0
    1610:	1a000003 	bne	1624 <SDReadBlock+0x5c>
    1614:	e59f0018 	ldr	r0, [pc, #24]	; 1634 <SDReadBlock+0x6c>
    1618:	ebfffc5a 	bl	788 <puts>
    161c:	e1a00004 	mov	r0, r4
    1620:	e8bd8010 	pop	{r4, pc}
    1624:	e3a00001 	mov	r0, #1
    1628:	e8bd8010 	pop	{r4, pc}
    162c:	40000448 	.word	0x40000448
    1630:	000032fd 	.word	0x000032fd
    1634:	00003325 	.word	0x00003325

00001638 <SDWriteBlock>:
    1638:	e59f30e0 	ldr	r3, [pc, #224]	; 1720 <SDWriteBlock+0xe8>
    163c:	e5933000 	ldr	r3, [r3]
    1640:	e3530003 	cmp	r3, #3
    1644:	e92d4071 	push	{r0, r4, r5, r6, lr}
    1648:	11a01481 	lslne	r1, r1, #9
    164c:	e1a06000 	mov	r6, r0
    1650:	e3a00018 	mov	r0, #24
    1654:	ebffff80 	bl	145c <SDCommand>
    1658:	e2504000 	subs	r4, r0, #0
    165c:	0a000004 	beq	1674 <SDWriteBlock+0x3c>
    1660:	e59f00bc 	ldr	r0, [pc, #188]	; 1724 <SDWriteBlock+0xec>
    1664:	e1a01004 	mov	r1, r4
    1668:	ebfffc06 	bl	688 <printf>
    166c:	e3a00000 	mov	r0, #0
    1670:	ea000029 	b	171c <SDWriteBlock+0xe4>
    1674:	e3e03001 	mvn	r3, #1
    1678:	e28d5004 	add	r5, sp, #4
    167c:	e5653001 	strb	r3, [r5, #-1]!
    1680:	e3a00001 	mov	r0, #1
    1684:	e1a01004 	mov	r1, r4
    1688:	e1a02004 	mov	r2, r4
    168c:	eb0000e9 	bl	1a38 <SPITransfer>
    1690:	e1a01005 	mov	r1, r5
    1694:	e3a00001 	mov	r0, #1
    1698:	e1a02004 	mov	r2, r4
    169c:	eb0000e5 	bl	1a38 <SPITransfer>
    16a0:	e3a00c02 	mov	r0, #512	; 0x200
    16a4:	e1a01006 	mov	r1, r6
    16a8:	e1a02004 	mov	r2, r4
    16ac:	eb0000e1 	bl	1a38 <SPITransfer>
    16b0:	e28d5002 	add	r5, sp, #2
    16b4:	e3a00002 	mov	r0, #2
    16b8:	e1a01004 	mov	r1, r4
    16bc:	e1a02004 	mov	r2, r4
    16c0:	eb0000dc 	bl	1a38 <SPITransfer>
    16c4:	e1a01004 	mov	r1, r4
    16c8:	e3a00001 	mov	r0, #1
    16cc:	e1a02005 	mov	r2, r5
    16d0:	eb0000d8 	bl	1a38 <SPITransfer>
    16d4:	e5dd1002 	ldrb	r1, [sp, #2]
    16d8:	e201301f 	and	r3, r1, #31
    16dc:	e3530005 	cmp	r3, #5
    16e0:	0a000005 	beq	16fc <SDWriteBlock+0xc4>
    16e4:	e59f003c 	ldr	r0, [pc, #60]	; 1728 <SDWriteBlock+0xf0>
    16e8:	ebfffbe6 	bl	688 <printf>
    16ec:	e59f0038 	ldr	r0, [pc, #56]	; 172c <SDWriteBlock+0xf4>
    16f0:	ebfffc24 	bl	788 <puts>
    16f4:	e1a00004 	mov	r0, r4
    16f8:	ea000007 	b	171c <SDWriteBlock+0xe4>
    16fc:	e3a00001 	mov	r0, #1
    1700:	e3a01000 	mov	r1, #0
    1704:	e1a02005 	mov	r2, r5
    1708:	eb0000ca 	bl	1a38 <SPITransfer>
    170c:	e5dd3002 	ldrb	r3, [sp, #2]
    1710:	e35300ff 	cmp	r3, #255	; 0xff
    1714:	1afffff8 	bne	16fc <SDWriteBlock+0xc4>
    1718:	e3a00001 	mov	r0, #1
    171c:	e8bd8078 	pop	{r3, r4, r5, r6, pc}
    1720:	40000448 	.word	0x40000448
    1724:	0000333d 	.word	0x0000333d
    1728:	0000335f 	.word	0x0000335f
    172c:	00003387 	.word	0x00003387

00001730 <SDReadCSD>:
    1730:	e92d4010 	push	{r4, lr}
    1734:	e3a01000 	mov	r1, #0
    1738:	e1a04000 	mov	r4, r0
    173c:	e3a00009 	mov	r0, #9
    1740:	ebffff45 	bl	145c <SDCommand>
    1744:	e2501000 	subs	r1, r0, #0
    1748:	0a000003 	beq	175c <SDReadCSD+0x2c>
    174c:	e59f0034 	ldr	r0, [pc, #52]	; 1788 <SDReadCSD+0x58>
    1750:	ebfffbcc 	bl	688 <printf>
    1754:	e3a00000 	mov	r0, #0
    1758:	e8bd8010 	pop	{r4, pc}
    175c:	e1a00004 	mov	r0, r4
    1760:	e3a01010 	mov	r1, #16
    1764:	ebffff73 	bl	1538 <SDReadDataToken.clone.0>
    1768:	e2504000 	subs	r4, r0, #0
    176c:	1a000003 	bne	1780 <SDReadCSD+0x50>
    1770:	e59f0014 	ldr	r0, [pc, #20]	; 178c <SDReadCSD+0x5c>
    1774:	ebfffc03 	bl	788 <puts>
    1778:	e1a00004 	mov	r0, r4
    177c:	e8bd8010 	pop	{r4, pc}
    1780:	e3a00001 	mov	r0, #1
    1784:	e8bd8010 	pop	{r4, pc}
    1788:	000033a0 	.word	0x000033a0
    178c:	00003325 	.word	0x00003325

00001790 <SDReadCID>:
    1790:	e92d4010 	push	{r4, lr}
    1794:	e3a01000 	mov	r1, #0
    1798:	e1a04000 	mov	r4, r0
    179c:	e3a0000a 	mov	r0, #10
    17a0:	ebffff2d 	bl	145c <SDCommand>
    17a4:	e2501000 	subs	r1, r0, #0
    17a8:	0a000003 	beq	17bc <SDReadCID+0x2c>
    17ac:	e59f0034 	ldr	r0, [pc, #52]	; 17e8 <SDReadCID+0x58>
    17b0:	ebfffbb4 	bl	688 <printf>
    17b4:	e3a00000 	mov	r0, #0
    17b8:	e8bd8010 	pop	{r4, pc}
    17bc:	e1a00004 	mov	r0, r4
    17c0:	e3a01010 	mov	r1, #16
    17c4:	ebffff5b 	bl	1538 <SDReadDataToken.clone.0>
    17c8:	e2504000 	subs	r4, r0, #0
    17cc:	1a000003 	bne	17e0 <SDReadCID+0x50>
    17d0:	e59f0014 	ldr	r0, [pc, #20]	; 17ec <SDReadCID+0x5c>
    17d4:	ebfffbeb 	bl	788 <puts>
    17d8:	e1a00004 	mov	r0, r4
    17dc:	e8bd8010 	pop	{r4, pc}
    17e0:	e3a00001 	mov	r0, #1
    17e4:	e8bd8010 	pop	{r4, pc}
    17e8:	000033bf 	.word	0x000033bf
    17ec:	00003325 	.word	0x00003325

000017f0 <SDReadOCR>:
    17f0:	e92d4010 	push	{r4, lr}
    17f4:	e3a01000 	mov	r1, #0
    17f8:	e1a04000 	mov	r4, r0
    17fc:	e3a0003a 	mov	r0, #58	; 0x3a
    1800:	ebffff15 	bl	145c <SDCommand>
    1804:	e2501000 	subs	r1, r0, #0
    1808:	0a000003 	beq	181c <SDReadOCR+0x2c>
    180c:	e59f0018 	ldr	r0, [pc, #24]	; 182c <SDReadOCR+0x3c>
    1810:	ebfffb9c 	bl	688 <printf>
    1814:	e3a00000 	mov	r0, #0
    1818:	e8bd8010 	pop	{r4, pc}
    181c:	ebffff5c 	bl	1594 <SDExtraResp.clone.1>
    1820:	e5840000 	str	r0, [r4]
    1824:	e3a00001 	mov	r0, #1
    1828:	e8bd8010 	pop	{r4, pc}
    182c:	000033de 	.word	0x000033de

00001830 <SDInit>:
    1830:	e59f3108 	ldr	r3, [pc, #264]	; 1940 <SDInit+0x110>
    1834:	e3a02000 	mov	r2, #0
    1838:	e92d4031 	push	{r0, r4, r5, lr}
    183c:	e5832000 	str	r2, [r3]
    1840:	eb00005f 	bl	19c4 <SPIInit>
    1844:	e59f00f8 	ldr	r0, [pc, #248]	; 1944 <SDInit+0x114>
    1848:	eb000044 	bl	1960 <SPISetSpeed>
    184c:	e3a0000a 	mov	r0, #10
    1850:	eb000093 	bl	1aa4 <SPITick>
    1854:	e3a05064 	mov	r5, #100	; 0x64
    1858:	e3a00000 	mov	r0, #0
    185c:	e1a01000 	mov	r1, r0
    1860:	ebfffefd 	bl	145c <SDCommand>
    1864:	e35000ff 	cmp	r0, #255	; 0xff
    1868:	e1a04000 	mov	r4, r0
    186c:	1a000002 	bne	187c <SDInit+0x4c>
    1870:	e2555001 	subs	r5, r5, #1
    1874:	1afffff7 	bne	1858 <SDInit+0x28>
    1878:	ea000001 	b	1884 <SDInit+0x54>
    187c:	e3500001 	cmp	r0, #1
    1880:	0a000002 	beq	1890 <SDInit+0x60>
    1884:	e59f00bc 	ldr	r0, [pc, #188]	; 1948 <SDInit+0x118>
    1888:	e1a01004 	mov	r1, r4
    188c:	ea00000a 	b	18bc <SDInit+0x8c>
    1890:	e59f50b4 	ldr	r5, [pc, #180]	; 194c <SDInit+0x11c>
    1894:	e3a00008 	mov	r0, #8
    1898:	e1a01005 	mov	r1, r5
    189c:	ebfffeee 	bl	145c <SDCommand>
    18a0:	e3500001 	cmp	r0, #1
    18a4:	1a000017 	bne	1908 <SDInit+0xd8>
    18a8:	ebffff39 	bl	1594 <SDExtraResp.clone.1>
    18ac:	e1500005 	cmp	r0, r5
    18b0:	e1a01000 	mov	r1, r0
    18b4:	0a000003 	beq	18c8 <SDInit+0x98>
    18b8:	e59f0090 	ldr	r0, [pc, #144]	; 1950 <SDInit+0x120>
    18bc:	ebfffb71 	bl	688 <printf>
    18c0:	e3a05000 	mov	r5, #0
    18c4:	ea00001b 	b	1938 <SDInit+0x108>
    18c8:	e3a00101 	mov	r0, #1073741824	; 0x40000000
    18cc:	ebffff05 	bl	14e8 <SDSendOpCond>
    18d0:	e2505000 	subs	r5, r0, #0
    18d4:	0a000011 	beq	1920 <SDInit+0xf0>
    18d8:	e1a0000d 	mov	r0, sp
    18dc:	ebffffc3 	bl	17f0 <SDReadOCR>
    18e0:	e2505000 	subs	r5, r0, #0
    18e4:	059f0068 	ldreq	r0, [pc, #104]	; 1954 <SDInit+0x124>
    18e8:	0a00000d 	beq	1924 <SDInit+0xf4>
    18ec:	e59d3000 	ldr	r3, [sp]
    18f0:	e3130101 	tst	r3, #1073741824	; 0x40000000
    18f4:	e59f3044 	ldr	r3, [pc, #68]	; 1940 <SDInit+0x110>
    18f8:	03a02002 	moveq	r2, #2
    18fc:	13a02003 	movne	r2, #3
    1900:	e5832000 	str	r2, [r3]
    1904:	ea000008 	b	192c <SDInit+0xfc>
    1908:	e3a00000 	mov	r0, #0
    190c:	ebfffef5 	bl	14e8 <SDSendOpCond>
    1910:	e2505000 	subs	r5, r0, #0
    1914:	159f3024 	ldrne	r3, [pc, #36]	; 1940 <SDInit+0x110>
    1918:	15834000 	strne	r4, [r3]
    191c:	1a000002 	bne	192c <SDInit+0xfc>
    1920:	e59f0030 	ldr	r0, [pc, #48]	; 1958 <SDInit+0x128>
    1924:	ebfffb97 	bl	788 <puts>
    1928:	ea000002 	b	1938 <SDInit+0x108>
    192c:	e59f0028 	ldr	r0, [pc, #40]	; 195c <SDInit+0x12c>
    1930:	eb00000a 	bl	1960 <SPISetSpeed>
    1934:	e3a05001 	mov	r5, #1
    1938:	e1a00005 	mov	r0, r5
    193c:	e8bd8038 	pop	{r3, r4, r5, pc}
    1940:	40000448 	.word	0x40000448
    1944:	00061a80 	.word	0x00061a80
    1948:	000033fd 	.word	0x000033fd
    194c:	000001aa 	.word	0x000001aa
    1950:	00003421 	.word	0x00003421
    1954:	00003448 	.word	0x00003448
    1958:	00003433 	.word	0x00003433
    195c:	017d7840 	.word	0x017d7840

00001960 <SPISetSpeed>:
    1960:	e92d4030 	push	{r4, r5, lr}
    1964:	e1a05000 	mov	r5, r0
    1968:	ebfffa33 	bl	23c <HalSysGetPCLK>
    196c:	e0800fa0 	add	r0, r0, r0, lsr #31
    1970:	e1a040c0 	asr	r4, r0, #1
    1974:	e2450001 	sub	r0, r5, #1
    1978:	e1a01005 	mov	r1, r5
    197c:	e0800004 	add	r0, r0, r4
    1980:	eb000473 	bl	2b54 <__aeabi_idiv>
    1984:	e59f2030 	ldr	r2, [pc, #48]	; 19bc <SPISetSpeed+0x5c>
    1988:	e3500004 	cmp	r0, #4
    198c:	a1a03000 	movge	r3, r0
    1990:	b3a03004 	movlt	r3, #4
    1994:	e1a01083 	lsl	r1, r3, #1
    1998:	e582100c 	str	r1, [r2, #12]
    199c:	e3a01ffa 	mov	r1, #1000	; 0x3e8
    19a0:	e0010193 	mul	r1, r3, r1
    19a4:	e1a00004 	mov	r0, r4
    19a8:	eb000469 	bl	2b54 <__aeabi_idiv>
    19ac:	e1a01000 	mov	r1, r0
    19b0:	e59f0008 	ldr	r0, [pc, #8]	; 19c0 <SPISetSpeed+0x60>
    19b4:	e8bd4030 	pop	{r4, r5, lr}
    19b8:	eafffb32 	b	688 <printf>
    19bc:	e0020000 	.word	0xe0020000
    19c0:	00003458 	.word	0x00003458

000019c4 <SPIInit>:
    19c4:	e59f3064 	ldr	r3, [pc, #100]	; 1a30 <SPIInit+0x6c>
    19c8:	e59320c4 	ldr	r2, [r3, #196]	; 0xc4
    19cc:	e3822c01 	orr	r2, r2, #256	; 0x100
    19d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    19d4:	e58320c4 	str	r2, [r3, #196]	; 0xc4
    19d8:	e2433975 	sub	r3, r3, #1916928	; 0x1d4000
    19dc:	e3a02501 	mov	r2, #4194304	; 0x400000
    19e0:	e5832004 	str	r2, [r3, #4]
    19e4:	e5932008 	ldr	r2, [r3, #8]
    19e8:	e3822501 	orr	r2, r2, #4194304	; 0x400000
    19ec:	e5832008 	str	r2, [r3, #8]
    19f0:	e3a00004 	mov	r0, #4
    19f4:	e3a01001 	mov	r1, #1
    19f8:	ebfffa12 	bl	248 <HalPinSelect>
    19fc:	e3a00005 	mov	r0, #5
    1a00:	e3a01001 	mov	r1, #1
    1a04:	ebfffa0f 	bl	248 <HalPinSelect>
    1a08:	e3a00006 	mov	r0, #6
    1a0c:	e3a01001 	mov	r1, #1
    1a10:	ebfffa0c 	bl	248 <HalPinSelect>
    1a14:	e3a00016 	mov	r0, #22
    1a18:	e3a01000 	mov	r1, #0
    1a1c:	ebfffa09 	bl	248 <HalPinSelect>
    1a20:	e59f300c 	ldr	r3, [pc, #12]	; 1a34 <SPIInit+0x70>
    1a24:	e3a02030 	mov	r2, #48	; 0x30
    1a28:	e5832000 	str	r2, [r3]
    1a2c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    1a30:	e01fc000 	.word	0xe01fc000
    1a34:	e0020000 	.word	0xe0020000

00001a38 <SPITransfer>:
    1a38:	e59f3060 	ldr	r3, [pc, #96]	; 1aa0 <SPITransfer+0x68>
    1a3c:	e3a0c501 	mov	ip, #4194304	; 0x400000
    1a40:	e92d4070 	push	{r4, r5, r6, lr}
    1a44:	e583c00c 	str	ip, [r3, #12]
    1a48:	e2433902 	sub	r3, r3, #32768	; 0x8000
    1a4c:	e24cc501 	sub	ip, ip, #4194304	; 0x400000
    1a50:	e3a050ff 	mov	r5, #255	; 0xff
    1a54:	e1a04003 	mov	r4, r3
    1a58:	ea00000a 	b	1a88 <SPITransfer+0x50>
    1a5c:	e3510000 	cmp	r1, #0
    1a60:	14d16001 	ldrbne	r6, [r1], #1
    1a64:	05835008 	streq	r5, [r3, #8]
    1a68:	15836008 	strne	r6, [r3, #8]
    1a6c:	e5936004 	ldr	r6, [r3, #4]
    1a70:	e3160080 	tst	r6, #128	; 0x80
    1a74:	0afffffc 	beq	1a6c <SPITransfer+0x34>
    1a78:	e3520000 	cmp	r2, #0
    1a7c:	15946008 	ldrne	r6, [r4, #8]
    1a80:	14c26001 	strbne	r6, [r2], #1
    1a84:	e28cc001 	add	ip, ip, #1
    1a88:	e15c0000 	cmp	ip, r0
    1a8c:	bafffff2 	blt	1a5c <SPITransfer+0x24>
    1a90:	e59f3008 	ldr	r3, [pc, #8]	; 1aa0 <SPITransfer+0x68>
    1a94:	e3a02501 	mov	r2, #4194304	; 0x400000
    1a98:	e5832004 	str	r2, [r3, #4]
    1a9c:	e8bd8070 	pop	{r4, r5, r6, pc}
    1aa0:	e0028000 	.word	0xe0028000

00001aa4 <SPITick>:
    1aa4:	e59f3034 	ldr	r3, [pc, #52]	; 1ae0 <SPITick+0x3c>
    1aa8:	e3a02501 	mov	r2, #4194304	; 0x400000
    1aac:	e5832004 	str	r2, [r3, #4]
    1ab0:	e3a010ff 	mov	r1, #255	; 0xff
    1ab4:	e3a03000 	mov	r3, #0
    1ab8:	e59f2024 	ldr	r2, [pc, #36]	; 1ae4 <SPITick+0x40>
    1abc:	ea000004 	b	1ad4 <SPITick+0x30>
    1ac0:	e5821008 	str	r1, [r2, #8]
    1ac4:	e592c004 	ldr	ip, [r2, #4]
    1ac8:	e31c0080 	tst	ip, #128	; 0x80
    1acc:	0afffffc 	beq	1ac4 <SPITick+0x20>
    1ad0:	e2833001 	add	r3, r3, #1
    1ad4:	e1530000 	cmp	r3, r0
    1ad8:	bafffff8 	blt	1ac0 <SPITick+0x1c>
    1adc:	e12fff1e 	bx	lr
    1ae0:	e0028000 	.word	0xe0028000
    1ae4:	e0020000 	.word	0xe0020000

00001ae8 <Wait4DevInt>:
    1ae8:	e59f3018 	ldr	r3, [pc, #24]	; 1b08 <Wait4DevInt+0x20>
    1aec:	e5132dff 	ldr	r2, [r3, #-3583]	; 0xdff
    1af0:	e0002002 	and	r2, r0, r2
    1af4:	e1520000 	cmp	r2, r0
    1af8:	1afffffb 	bne	1aec <Wait4DevInt+0x4>
    1afc:	e59f3004 	ldr	r3, [pc, #4]	; 1b08 <Wait4DevInt+0x20>
    1b00:	e5030df7 	str	r0, [r3, #-3575]	; 0xdf7
    1b04:	e12fff1e 	bx	lr
    1b08:	ffe0cfff 	.word	0xffe0cfff

00001b0c <USBHwCmd>:
    1b0c:	e59f3018 	ldr	r3, [pc, #24]	; 1b2c <USBHwCmd+0x20>
    1b10:	e1a00800 	lsl	r0, r0, #16
    1b14:	e3a02030 	mov	r2, #48	; 0x30
    1b18:	e3800c05 	orr	r0, r0, #1280	; 0x500
    1b1c:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    1b20:	e5030def 	str	r0, [r3, #-3567]	; 0xdef
    1b24:	e3a00010 	mov	r0, #16
    1b28:	eaffffee 	b	1ae8 <Wait4DevInt>
    1b2c:	ffe0cfff 	.word	0xffe0cfff

00001b30 <USBHwCmdWrite>:
    1b30:	e92d4010 	push	{r4, lr}
    1b34:	e1a04001 	mov	r4, r1
    1b38:	ebfffff3 	bl	1b0c <USBHwCmd>
    1b3c:	e1a04804 	lsl	r4, r4, #16
    1b40:	e59f3010 	ldr	r3, [pc, #16]	; 1b58 <USBHwCmdWrite+0x28>
    1b44:	e3844c01 	orr	r4, r4, #256	; 0x100
    1b48:	e3a00010 	mov	r0, #16
    1b4c:	e5034def 	str	r4, [r3, #-3567]	; 0xdef
    1b50:	e8bd4010 	pop	{r4, lr}
    1b54:	eaffffe3 	b	1ae8 <Wait4DevInt>
    1b58:	ffe0cfff 	.word	0xffe0cfff

00001b5c <USBHwCmdRead>:
    1b5c:	e92d4010 	push	{r4, lr}
    1b60:	e1a04000 	mov	r4, r0
    1b64:	e1a04804 	lsl	r4, r4, #16
    1b68:	ebffffe7 	bl	1b0c <USBHwCmd>
    1b6c:	e3843c02 	orr	r3, r4, #512	; 0x200
    1b70:	e59f4014 	ldr	r4, [pc, #20]	; 1b8c <USBHwCmdRead+0x30>
    1b74:	e3a00020 	mov	r0, #32
    1b78:	e5043def 	str	r3, [r4, #-3567]	; 0xdef
    1b7c:	ebffffd9 	bl	1ae8 <Wait4DevInt>
    1b80:	e5140deb 	ldr	r0, [r4, #-3563]	; 0xdeb
    1b84:	e20000ff 	and	r0, r0, #255	; 0xff
    1b88:	e8bd8010 	pop	{r4, pc}
    1b8c:	ffe0cfff 	.word	0xffe0cfff

00001b90 <USBHwEPConfig>:
    1b90:	e20030ff 	and	r3, r0, #255	; 0xff
    1b94:	e92d4010 	push	{r4, lr}
    1b98:	e1a033a3 	lsr	r3, r3, #7
    1b9c:	e200400f 	and	r4, r0, #15
    1ba0:	e1834084 	orr	r4, r3, r4, lsl #1
    1ba4:	e59f3034 	ldr	r3, [pc, #52]	; 1be0 <USBHwEPConfig+0x50>
    1ba8:	e5132dbb 	ldr	r2, [r3, #-3515]	; 0xdbb
    1bac:	e3a00001 	mov	r0, #1
    1bb0:	e1822410 	orr	r2, r2, r0, lsl r4
    1bb4:	e1a01801 	lsl	r1, r1, #16
    1bb8:	e1a01821 	lsr	r1, r1, #16
    1bbc:	e5032dbb 	str	r2, [r3, #-3515]	; 0xdbb
    1bc0:	e28000ff 	add	r0, r0, #255	; 0xff
    1bc4:	e5034db7 	str	r4, [r3, #-3511]	; 0xdb7
    1bc8:	e5031db3 	str	r1, [r3, #-3507]	; 0xdb3
    1bcc:	ebffffc5 	bl	1ae8 <Wait4DevInt>
    1bd0:	e3840040 	orr	r0, r4, #64	; 0x40
    1bd4:	e3a01000 	mov	r1, #0
    1bd8:	e8bd4010 	pop	{r4, lr}
    1bdc:	eaffffd3 	b	1b30 <USBHwCmdWrite>
    1be0:	ffe0cfff 	.word	0xffe0cfff

00001be4 <USBHwRegisterEPIntHandler>:
    1be4:	e20030ff 	and	r3, r0, #255	; 0xff
    1be8:	e1a023a3 	lsr	r2, r3, #7
    1bec:	e200000f 	and	r0, r0, #15
    1bf0:	e1820080 	orr	r0, r2, r0, lsl #1
    1bf4:	e59f2038 	ldr	r2, [pc, #56]	; 1c34 <USBHwRegisterEPIntHandler+0x50>
    1bf8:	e1a0c0a0 	lsr	ip, r0, #1
    1bfc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1c00:	e782110c 	str	r1, [r2, ip, lsl #2]
    1c04:	e59f202c 	ldr	r2, [pc, #44]	; 1c38 <USBHwRegisterEPIntHandler+0x54>
    1c08:	e5121dcb 	ldr	r1, [r2, #-3531]	; 0xdcb
    1c0c:	e3a0c001 	mov	ip, #1
    1c10:	e181001c 	orr	r0, r1, ip, lsl r0
    1c14:	e5020dcb 	str	r0, [r2, #-3531]	; 0xdcb
    1c18:	e5121dfb 	ldr	r1, [r2, #-3579]	; 0xdfb
    1c1c:	e59f0018 	ldr	r0, [pc, #24]	; 1c3c <USBHwRegisterEPIntHandler+0x58>
    1c20:	e3811004 	orr	r1, r1, #4
    1c24:	e5021dfb 	str	r1, [r2, #-3579]	; 0xdfb
    1c28:	e1a01003 	mov	r1, r3
    1c2c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1c30:	eafffa94 	b	688 <printf>
    1c34:	4000044c 	.word	0x4000044c
    1c38:	ffe0cfff 	.word	0xffe0cfff
    1c3c:	00003487 	.word	0x00003487

00001c40 <USBHwRegisterDevIntHandler>:
    1c40:	e59f3018 	ldr	r3, [pc, #24]	; 1c60 <USBHwRegisterDevIntHandler+0x20>
    1c44:	e5830040 	str	r0, [r3, #64]	; 0x40
    1c48:	e59f3014 	ldr	r3, [pc, #20]	; 1c64 <USBHwRegisterDevIntHandler+0x24>
    1c4c:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
    1c50:	e59f0010 	ldr	r0, [pc, #16]	; 1c68 <USBHwRegisterDevIntHandler+0x28>
    1c54:	e3822008 	orr	r2, r2, #8
    1c58:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
    1c5c:	eafffac9 	b	788 <puts>
    1c60:	4000044c 	.word	0x4000044c
    1c64:	ffe0cfff 	.word	0xffe0cfff
    1c68:	000034a7 	.word	0x000034a7

00001c6c <USBHwRegisterFrameHandler>:
    1c6c:	e59f3018 	ldr	r3, [pc, #24]	; 1c8c <USBHwRegisterFrameHandler+0x20>
    1c70:	e5830044 	str	r0, [r3, #68]	; 0x44
    1c74:	e59f3014 	ldr	r3, [pc, #20]	; 1c90 <USBHwRegisterFrameHandler+0x24>
    1c78:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
    1c7c:	e59f0010 	ldr	r0, [pc, #16]	; 1c94 <USBHwRegisterFrameHandler+0x28>
    1c80:	e3822001 	orr	r2, r2, #1
    1c84:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
    1c88:	eafffabe 	b	788 <puts>
    1c8c:	4000044c 	.word	0x4000044c
    1c90:	ffe0cfff 	.word	0xffe0cfff
    1c94:	000034cc 	.word	0x000034cc

00001c98 <USBHwSetAddress>:
    1c98:	e1e01c80 	mvn	r1, r0, lsl #25
    1c9c:	e1e01ca1 	mvn	r1, r1, lsr #25
    1ca0:	e20110ff 	and	r1, r1, #255	; 0xff
    1ca4:	e3a000d0 	mov	r0, #208	; 0xd0
    1ca8:	eaffffa0 	b	1b30 <USBHwCmdWrite>

00001cac <USBHwConnect>:
    1cac:	e2501000 	subs	r1, r0, #0
    1cb0:	159f3020 	ldrne	r3, [pc, #32]	; 1cd8 <USBHwConnect+0x2c>
    1cb4:	059f301c 	ldreq	r3, [pc, #28]	; 1cd8 <USBHwConnect+0x2c>
    1cb8:	13a02901 	movne	r2, #16384	; 0x4000
    1cbc:	03a02901 	moveq	r2, #16384	; 0x4000
    1cc0:	15032fe3 	strne	r2, [r3, #-4067]	; 0xfe3
    1cc4:	05032fe7 	streq	r2, [r3, #-4071]	; 0xfe7
    1cc8:	e3a000fe 	mov	r0, #254	; 0xfe
    1ccc:	e2511000 	subs	r1, r1, #0
    1cd0:	13a01001 	movne	r1, #1
    1cd4:	eaffff95 	b	1b30 <USBHwCmdWrite>
    1cd8:	3fffcfff 	.word	0x3fffcfff

00001cdc <USBHwNakIntEnable>:
    1cdc:	e20010ff 	and	r1, r0, #255	; 0xff
    1ce0:	e3a000f3 	mov	r0, #243	; 0xf3
    1ce4:	eaffff91 	b	1b30 <USBHwCmdWrite>

00001ce8 <USBHwEPGetStatus>:
    1ce8:	e20030ff 	and	r3, r0, #255	; 0xff
    1cec:	e1a033a3 	lsr	r3, r3, #7
    1cf0:	e200000f 	and	r0, r0, #15
    1cf4:	e1830080 	orr	r0, r3, r0, lsl #1
    1cf8:	eaffff97 	b	1b5c <USBHwCmdRead>

00001cfc <USBHwEPStall>:
    1cfc:	e20030ff 	and	r3, r0, #255	; 0xff
    1d00:	e1a033a3 	lsr	r3, r3, #7
    1d04:	e200000f 	and	r0, r0, #15
    1d08:	e1830080 	orr	r0, r3, r0, lsl #1
    1d0c:	e3800040 	orr	r0, r0, #64	; 0x40
    1d10:	e2511000 	subs	r1, r1, #0
    1d14:	13a01001 	movne	r1, #1
    1d18:	eaffff84 	b	1b30 <USBHwCmdWrite>

00001d1c <USBHwEPWrite>:
    1d1c:	e92d4010 	push	{r4, lr}
    1d20:	e1a04002 	mov	r4, r2
    1d24:	e20020ff 	and	r2, r0, #255	; 0xff
    1d28:	e200300f 	and	r3, r0, #15
    1d2c:	e1a003a2 	lsr	r0, r2, #7
    1d30:	e1800083 	orr	r0, r0, r3, lsl #1
    1d34:	e1a03103 	lsl	r3, r3, #2
    1d38:	e3832002 	orr	r2, r3, #2
    1d3c:	e59f3058 	ldr	r3, [pc, #88]	; 1d9c <USBHwEPWrite+0x80>
    1d40:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
    1d44:	e5034ddb 	str	r4, [r3, #-3547]	; 0xddb
    1d48:	ea000008 	b	1d70 <USBHwEPWrite+0x54>
    1d4c:	e5512002 	ldrb	r2, [r1, #-2]
    1d50:	e551c001 	ldrb	ip, [r1, #-1]
    1d54:	e1a02802 	lsl	r2, r2, #16
    1d58:	e1822c0c 	orr	r2, r2, ip, lsl #24
    1d5c:	e551c004 	ldrb	ip, [r1, #-4]
    1d60:	e182200c 	orr	r2, r2, ip
    1d64:	e551c003 	ldrb	ip, [r1, #-3]
    1d68:	e182240c 	orr	r2, r2, ip, lsl #8
    1d6c:	e5032de3 	str	r2, [r3, #-3555]	; 0xde3
    1d70:	e5132dd7 	ldr	r2, [r3, #-3543]	; 0xdd7
    1d74:	e2122002 	ands	r2, r2, #2
    1d78:	e2811004 	add	r1, r1, #4
    1d7c:	1afffff2 	bne	1d4c <USBHwEPWrite+0x30>
    1d80:	e59f3014 	ldr	r3, [pc, #20]	; 1d9c <USBHwEPWrite+0x80>
    1d84:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
    1d88:	ebffff5f 	bl	1b0c <USBHwCmd>
    1d8c:	e3a000fa 	mov	r0, #250	; 0xfa
    1d90:	ebffff5d 	bl	1b0c <USBHwCmd>
    1d94:	e1a00004 	mov	r0, r4
    1d98:	e8bd8010 	pop	{r4, pc}
    1d9c:	ffe0cfff 	.word	0xffe0cfff

00001da0 <USBHwEPRead>:
    1da0:	e200c0ff 	and	ip, r0, #255	; 0xff
    1da4:	e200000f 	and	r0, r0, #15
    1da8:	e92d4030 	push	{r4, r5, lr}
    1dac:	e59f3084 	ldr	r3, [pc, #132]	; 1e38 <USBHwEPRead+0x98>
    1db0:	e1a04100 	lsl	r4, r0, #2
    1db4:	e3844001 	orr	r4, r4, #1
    1db8:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
    1dbc:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
    1dc0:	e3140b02 	tst	r4, #2048	; 0x800
    1dc4:	0afffffc 	beq	1dbc <USBHwEPRead+0x1c>
    1dc8:	e3140b01 	tst	r4, #1024	; 0x400
    1dcc:	03e04000 	mvneq	r4, #0
    1dd0:	0a000016 	beq	1e30 <USBHwEPRead+0x90>
    1dd4:	e1a04b04 	lsl	r4, r4, #22
    1dd8:	e3a0e000 	mov	lr, #0
    1ddc:	e1a04b24 	lsr	r4, r4, #22
    1de0:	e1a0300e 	mov	r3, lr
    1de4:	e59f504c 	ldr	r5, [pc, #76]	; 1e38 <USBHwEPRead+0x98>
    1de8:	ea000006 	b	1e08 <USBHwEPRead+0x68>
    1dec:	e3130003 	tst	r3, #3
    1df0:	0515ede7 	ldreq	lr, [r5, #-3559]	; 0xde7
    1df4:	e3510000 	cmp	r1, #0
    1df8:	11530002 	cmpne	r3, r2
    1dfc:	b7c1e003 	strblt	lr, [r1, r3]
    1e00:	e1a0e42e 	lsr	lr, lr, #8
    1e04:	e2833001 	add	r3, r3, #1
    1e08:	e1530004 	cmp	r3, r4
    1e0c:	1afffff6 	bne	1dec <USBHwEPRead+0x4c>
    1e10:	e59f3020 	ldr	r3, [pc, #32]	; 1e38 <USBHwEPRead+0x98>
    1e14:	e3a02000 	mov	r2, #0
    1e18:	e1a0c3ac 	lsr	ip, ip, #7
    1e1c:	e18c0080 	orr	r0, ip, r0, lsl #1
    1e20:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
    1e24:	ebffff38 	bl	1b0c <USBHwCmd>
    1e28:	e3a000f2 	mov	r0, #242	; 0xf2
    1e2c:	ebffff36 	bl	1b0c <USBHwCmd>
    1e30:	e1a00004 	mov	r0, r4
    1e34:	e8bd8030 	pop	{r4, r5, pc}
    1e38:	ffe0cfff 	.word	0xffe0cfff

00001e3c <USBHwISOCEPRead>:
    1e3c:	e200c0ff 	and	ip, r0, #255	; 0xff
    1e40:	e200000f 	and	r0, r0, #15
    1e44:	e92d4030 	push	{r4, r5, lr}
    1e48:	e59f308c 	ldr	r3, [pc, #140]	; 1edc <USBHwISOCEPRead+0xa0>
    1e4c:	e1a04100 	lsl	r4, r0, #2
    1e50:	e3844001 	orr	r4, r4, #1
    1e54:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
    1e58:	e1a00000 	nop			; (mov r0, r0)
    1e5c:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
    1e60:	e2145b02 	ands	r5, r4, #2048	; 0x800
    1e64:	0a000001 	beq	1e70 <USBHwISOCEPRead+0x34>
    1e68:	e2145b01 	ands	r5, r4, #1024	; 0x400
    1e6c:	1a000002 	bne	1e7c <USBHwISOCEPRead+0x40>
    1e70:	e5035dd7 	str	r5, [r3, #-3543]	; 0xdd7
    1e74:	e3e04000 	mvn	r4, #0
    1e78:	ea000015 	b	1ed4 <USBHwISOCEPRead+0x98>
    1e7c:	e1a04b04 	lsl	r4, r4, #22
    1e80:	e3a05000 	mov	r5, #0
    1e84:	e1a04b24 	lsr	r4, r4, #22
    1e88:	e1a0e005 	mov	lr, r5
    1e8c:	ea000006 	b	1eac <USBHwISOCEPRead+0x70>
    1e90:	e31e0003 	tst	lr, #3
    1e94:	05135de7 	ldreq	r5, [r3, #-3559]	; 0xde7
    1e98:	e3510000 	cmp	r1, #0
    1e9c:	115e0002 	cmpne	lr, r2
    1ea0:	b7c1500e 	strblt	r5, [r1, lr]
    1ea4:	e1a05425 	lsr	r5, r5, #8
    1ea8:	e28ee001 	add	lr, lr, #1
    1eac:	e15e0004 	cmp	lr, r4
    1eb0:	1afffff6 	bne	1e90 <USBHwISOCEPRead+0x54>
    1eb4:	e59f3020 	ldr	r3, [pc, #32]	; 1edc <USBHwISOCEPRead+0xa0>
    1eb8:	e3a02000 	mov	r2, #0
    1ebc:	e1a0c3ac 	lsr	ip, ip, #7
    1ec0:	e18c0080 	orr	r0, ip, r0, lsl #1
    1ec4:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
    1ec8:	ebffff0f 	bl	1b0c <USBHwCmd>
    1ecc:	e3a000f2 	mov	r0, #242	; 0xf2
    1ed0:	ebffff0d 	bl	1b0c <USBHwCmd>
    1ed4:	e1a00004 	mov	r0, r4
    1ed8:	e8bd8030 	pop	{r4, r5, pc}
    1edc:	ffe0cfff 	.word	0xffe0cfff

00001ee0 <USBHwConfigDevice>:
    1ee0:	e2501000 	subs	r1, r0, #0
    1ee4:	13a01001 	movne	r1, #1
    1ee8:	e3a000d8 	mov	r0, #216	; 0xd8
    1eec:	eaffff0f 	b	1b30 <USBHwCmdWrite>

00001ef0 <USBHwISR>:
    1ef0:	e59f3120 	ldr	r3, [pc, #288]	; 2018 <USBHwISR+0x128>
    1ef4:	e3a02002 	mov	r2, #2
    1ef8:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
    1efc:	e5032fa7 	str	r2, [r3, #-4007]	; 0xfa7
    1f00:	e59f3114 	ldr	r3, [pc, #276]	; 201c <USBHwISR+0x12c>
    1f04:	e5134dff 	ldr	r4, [r3, #-3583]	; 0xdff
    1f08:	e3140001 	tst	r4, #1
    1f0c:	0a000009 	beq	1f38 <USBHwISR+0x48>
    1f10:	e3a02001 	mov	r2, #1
    1f14:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    1f18:	e59f3100 	ldr	r3, [pc, #256]	; 2020 <USBHwISR+0x130>
    1f1c:	e5935044 	ldr	r5, [r3, #68]	; 0x44
    1f20:	e3550000 	cmp	r5, #0
    1f24:	0a000003 	beq	1f38 <USBHwISR+0x48>
    1f28:	e3a000f5 	mov	r0, #245	; 0xf5
    1f2c:	ebffff0a 	bl	1b5c <USBHwCmdRead>
    1f30:	e1a0e00f 	mov	lr, pc
    1f34:	e12fff15 	bx	r5
    1f38:	e3140008 	tst	r4, #8
    1f3c:	0a000011 	beq	1f88 <USBHwISR+0x98>
    1f40:	e59f30d4 	ldr	r3, [pc, #212]	; 201c <USBHwISR+0x12c>
    1f44:	e3a02008 	mov	r2, #8
    1f48:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    1f4c:	e3a000fe 	mov	r0, #254	; 0xfe
    1f50:	ebffff01 	bl	1b5c <USBHwCmdRead>
    1f54:	e310001a 	tst	r0, #26
    1f58:	0a00000a 	beq	1f88 <USBHwISR+0x98>
    1f5c:	e59f30bc 	ldr	r3, [pc, #188]	; 2020 <USBHwISR+0x130>
    1f60:	e5933040 	ldr	r3, [r3, #64]	; 0x40
    1f64:	e3530000 	cmp	r3, #0
    1f68:	0a000006 	beq	1f88 <USBHwISR+0x98>
    1f6c:	e59f50a4 	ldr	r5, [pc, #164]	; 2018 <USBHwISR+0x128>
    1f70:	e3a06001 	mov	r6, #1
    1f74:	e5056fa7 	str	r6, [r5, #-4007]	; 0xfa7
    1f78:	e2000015 	and	r0, r0, #21
    1f7c:	e1a0e00f 	mov	lr, pc
    1f80:	e12fff13 	bx	r3
    1f84:	e5056fa3 	str	r6, [r5, #-4003]	; 0xfa3
    1f88:	e3140004 	tst	r4, #4
    1f8c:	0a00001d 	beq	2008 <USBHwISR+0x118>
    1f90:	e59f5084 	ldr	r5, [pc, #132]	; 201c <USBHwISR+0x12c>
    1f94:	e3a06004 	mov	r6, #4
    1f98:	e5056df7 	str	r6, [r5, #-3575]	; 0xdf7
    1f9c:	e59f807c 	ldr	r8, [pc, #124]	; 2020 <USBHwISR+0x130>
    1fa0:	e59f7070 	ldr	r7, [pc, #112]	; 2018 <USBHwISR+0x128>
    1fa4:	e3a04000 	mov	r4, #0
    1fa8:	e3a0a001 	mov	sl, #1
    1fac:	e1a0341a 	lsl	r3, sl, r4
    1fb0:	e5152dcf 	ldr	r2, [r5, #-3535]	; 0xdcf
    1fb4:	e1130002 	tst	r3, r2
    1fb8:	0a00000f 	beq	1ffc <USBHwISR+0x10c>
    1fbc:	e5053dc7 	str	r3, [r5, #-3527]	; 0xdc7
    1fc0:	e3a00020 	mov	r0, #32
    1fc4:	ebfffec7 	bl	1ae8 <Wait4DevInt>
    1fc8:	e1a020c4 	asr	r2, r4, #1
    1fcc:	e7983102 	ldr	r3, [r8, r2, lsl #2]
    1fd0:	e3530000 	cmp	r3, #0
    1fd4:	e5151deb 	ldr	r1, [r5, #-3563]	; 0xdeb
    1fd8:	0a000007 	beq	1ffc <USBHwISR+0x10c>
    1fdc:	e202200f 	and	r2, r2, #15
    1fe0:	e1820384 	orr	r0, r2, r4, lsl #7
    1fe4:	e5076fa7 	str	r6, [r7, #-4007]	; 0xfa7
    1fe8:	e200008f 	and	r0, r0, #143	; 0x8f
    1fec:	e201101f 	and	r1, r1, #31
    1ff0:	e1a0e00f 	mov	lr, pc
    1ff4:	e12fff13 	bx	r3
    1ff8:	e5076fa3 	str	r6, [r7, #-4003]	; 0xfa3
    1ffc:	e2844001 	add	r4, r4, #1
    2000:	e3540020 	cmp	r4, #32
    2004:	1affffe8 	bne	1fac <USBHwISR+0xbc>
    2008:	e59f3008 	ldr	r3, [pc, #8]	; 2018 <USBHwISR+0x128>
    200c:	e3a02002 	mov	r2, #2
    2010:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
    2014:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
    2018:	3fffcfff 	.word	0x3fffcfff
    201c:	ffe0cfff 	.word	0xffe0cfff
    2020:	4000044c 	.word	0x4000044c

00002024 <USBHwInit>:
    2024:	e59f312c 	ldr	r3, [pc, #300]	; 2158 <USBHwInit+0x134>
    2028:	e5932004 	ldr	r2, [r3, #4]
    202c:	e3c22103 	bic	r2, r2, #-1073741824	; 0xc0000000
    2030:	e3822101 	orr	r2, r2, #1073741824	; 0x40000000
    2034:	e92d4010 	push	{r4, lr}
    2038:	e5832004 	str	r2, [r3, #4]
    203c:	e593200c 	ldr	r2, [r3, #12]
    2040:	e3c22203 	bic	r2, r2, #805306368	; 0x30000000
    2044:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
    2048:	e583200c 	str	r2, [r3, #12]
    204c:	e5932000 	ldr	r2, [r3]
    2050:	e3c2230f 	bic	r2, r2, #1006632960	; 0x3c000000
    2054:	e3822301 	orr	r2, r2, #67108864	; 0x4000000
    2058:	e5832000 	str	r2, [r3]
    205c:	e59f30f8 	ldr	r3, [pc, #248]	; 215c <USBHwInit+0x138>
    2060:	e5132fff 	ldr	r2, [r3, #-4095]	; 0xfff
    2064:	e3822901 	orr	r2, r2, #16384	; 0x4000
    2068:	e5032fff 	str	r2, [r3, #-4095]	; 0xfff
    206c:	e3a02901 	mov	r2, #16384	; 0x4000
    2070:	e5032fe7 	str	r2, [r3, #-4071]	; 0xfe7
    2074:	e59f30e4 	ldr	r3, [pc, #228]	; 2160 <USBHwInit+0x13c>
    2078:	e59320c4 	ldr	r2, [r3, #196]	; 0xc4
    207c:	e3822102 	orr	r2, r2, #-2147483648	; 0x80000000
    2080:	e58320c4 	str	r2, [r3, #196]	; 0xc4
    2084:	e3a02005 	mov	r2, #5
    2088:	e5832108 	str	r2, [r3, #264]	; 0x108
    208c:	e59f30d0 	ldr	r3, [pc, #208]	; 2164 <USBHwInit+0x140>
    2090:	e2822015 	add	r2, r2, #21
    2094:	e503200b 	str	r2, [r3, #-11]
    2098:	e1a02003 	mov	r2, r3
    209c:	e5121007 	ldr	r1, [r2, #-7]
    20a0:	e311001a 	tst	r1, #26
    20a4:	e59f30b8 	ldr	r3, [pc, #184]	; 2164 <USBHwInit+0x140>
    20a8:	0afffffb 	beq	209c <USBHwInit+0x78>
    20ac:	e3a02003 	mov	r2, #3
    20b0:	e5032eef 	str	r2, [r3, #-3823]	; 0xeef
    20b4:	e3a04000 	mov	r4, #0
    20b8:	e3e02000 	mvn	r2, #0
    20bc:	e5034dfb 	str	r4, [r3, #-3579]	; 0xdfb
    20c0:	e1a00004 	mov	r0, r4
    20c4:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    20c8:	e5034dd3 	str	r4, [r3, #-3539]	; 0xdd3
    20cc:	e5034dcb 	str	r4, [r3, #-3531]	; 0xdcb
    20d0:	e5032dc7 	str	r2, [r3, #-3527]	; 0xdc7
    20d4:	e5034dbf 	str	r4, [r3, #-3519]	; 0xdbf
    20d8:	ebfffeff 	bl	1cdc <USBHwNakIntEnable>
    20dc:	e59f207c 	ldr	r2, [pc, #124]	; 2160 <USBHwInit+0x13c>
    20e0:	e59231a0 	ldr	r3, [r2, #416]	; 0x1a0
    20e4:	e59f106c 	ldr	r1, [pc, #108]	; 2158 <USBHwInit+0x134>
    20e8:	e3833001 	orr	r3, r3, #1
    20ec:	e58231a0 	str	r3, [r2, #416]	; 0x1a0
    20f0:	e5814028 	str	r4, [r1, #40]	; 0x28
    20f4:	e59f3060 	ldr	r3, [pc, #96]	; 215c <USBHwInit+0x138>
    20f8:	e5130fbf 	ldr	r0, [r3, #-4031]	; 0xfbf
    20fc:	e3800001 	orr	r0, r0, #1
    2100:	e5030fbf 	str	r0, [r3, #-4031]	; 0xfbf
    2104:	e3a00001 	mov	r0, #1
    2108:	e5030fa3 	str	r0, [r3, #-4003]	; 0xfa3
    210c:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
    2110:	e18cc000 	orr	ip, ip, r0
    2114:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
    2118:	e5814028 	str	r4, [r1, #40]	; 0x28
    211c:	e513cfbf 	ldr	ip, [r3, #-4031]	; 0xfbf
    2120:	e38cc002 	orr	ip, ip, #2
    2124:	e503cfbf 	str	ip, [r3, #-4031]	; 0xfbf
    2128:	e3a0c002 	mov	ip, #2
    212c:	e503cfa3 	str	ip, [r3, #-4003]	; 0xfa3
    2130:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
    2134:	e18cc000 	orr	ip, ip, r0
    2138:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
    213c:	e5814028 	str	r4, [r1, #40]	; 0x28
    2140:	e5132fbf 	ldr	r2, [r3, #-4031]	; 0xfbf
    2144:	e3822004 	orr	r2, r2, #4
    2148:	e5032fbf 	str	r2, [r3, #-4031]	; 0xfbf
    214c:	e3a02004 	mov	r2, #4
    2150:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
    2154:	e8bd8010 	pop	{r4, pc}
    2158:	e002c000 	.word	0xe002c000
    215c:	3fffcfff 	.word	0x3fffcfff
    2160:	e01fc000 	.word	0xe01fc000
    2164:	ffe0cfff 	.word	0xffe0cfff

00002168 <USBSetupDMADescriptor>:
    2168:	e92d4030 	push	{r4, r5, lr}
    216c:	e3a05000 	mov	r5, #0
    2170:	e5805004 	str	r5, [r0, #4]
    2174:	e5801000 	str	r1, [r0]
    2178:	e5905004 	ldr	r5, [r0, #4]
    217c:	e1a03b03 	lsl	r3, r3, #22
    2180:	e18558a3 	orr	r5, r5, r3, lsr #17
    2184:	e5805004 	str	r5, [r0, #4]
    2188:	e1dd40bc 	ldrh	r4, [sp, #12]
    218c:	e5903004 	ldr	r3, [r0, #4]
    2190:	e1834804 	orr	r4, r3, r4, lsl #16
    2194:	e5804004 	str	r4, [r0, #4]
    2198:	e21220ff 	ands	r2, r2, #255	; 0xff
    219c:	15903004 	ldrne	r3, [r0, #4]
    21a0:	13833010 	orrne	r3, r3, #16
    21a4:	15803004 	strne	r3, [r0, #4]
    21a8:	e3510000 	cmp	r1, #0
    21ac:	15903004 	ldrne	r3, [r0, #4]
    21b0:	13833004 	orrne	r3, r3, #4
    21b4:	15803004 	strne	r3, [r0, #4]
    21b8:	e28d3010 	add	r3, sp, #16
    21bc:	e8931008 	ldm	r3, {r3, ip}
    21c0:	e35c0000 	cmp	ip, #0
    21c4:	13520000 	cmpne	r2, #0
    21c8:	e5803008 	str	r3, [r0, #8]
    21cc:	e3a03000 	mov	r3, #0
    21d0:	1580c010 	strne	ip, [r0, #16]
    21d4:	e580300c 	str	r3, [r0, #12]
    21d8:	e8bd8030 	pop	{r4, r5, pc}

000021dc <USBDisableDMAForEndpoint>:
    21dc:	e20030ff 	and	r3, r0, #255	; 0xff
    21e0:	e1a033a3 	lsr	r3, r3, #7
    21e4:	e200000f 	and	r0, r0, #15
    21e8:	e1830080 	orr	r0, r3, r0, lsl #1
    21ec:	e3a03001 	mov	r3, #1
    21f0:	e1a00013 	lsl	r0, r3, r0
    21f4:	e59f3004 	ldr	r3, [pc, #4]	; 2200 <USBDisableDMAForEndpoint+0x24>
    21f8:	e5030d73 	str	r0, [r3, #-3443]	; 0xd73
    21fc:	e12fff1e 	bx	lr
    2200:	ffe0cfff 	.word	0xffe0cfff

00002204 <USBEnableDMAForEndpoint>:
    2204:	e20030ff 	and	r3, r0, #255	; 0xff
    2208:	e1a033a3 	lsr	r3, r3, #7
    220c:	e200000f 	and	r0, r0, #15
    2210:	e1830080 	orr	r0, r3, r0, lsl #1
    2214:	e3a03001 	mov	r3, #1
    2218:	e1a00013 	lsl	r0, r3, r0
    221c:	e59f3004 	ldr	r3, [pc, #4]	; 2228 <USBEnableDMAForEndpoint+0x24>
    2220:	e5030d77 	str	r0, [r3, #-3447]	; 0xd77
    2224:	e12fff1e 	bx	lr
    2228:	ffe0cfff 	.word	0xffe0cfff

0000222c <USBInitializeISOCFrameArray>:
    222c:	e1a03b03 	lsl	r3, r3, #22
    2230:	e1a02802 	lsl	r2, r2, #16
    2234:	e1a03b23 	lsr	r3, r3, #22
    2238:	e92d4010 	push	{r4, lr}
    223c:	e1a02822 	lsr	r2, r2, #16
    2240:	e3a0c000 	mov	ip, #0
    2244:	e3833902 	orr	r3, r3, #32768	; 0x8000
    2248:	ea000004 	b	2260 <USBInitializeISOCFrameArray+0x34>
    224c:	e1834804 	orr	r4, r3, r4, lsl #16
    2250:	e780410c 	str	r4, [r0, ip, lsl #2]
    2254:	e28cc001 	add	ip, ip, #1
    2258:	e1a0c80c 	lsl	ip, ip, #16
    225c:	e1a0c82c 	lsr	ip, ip, #16
    2260:	e08c4002 	add	r4, ip, r2
    2264:	e1a04804 	lsl	r4, r4, #16
    2268:	e15c0001 	cmp	ip, r1
    226c:	e1a04824 	lsr	r4, r4, #16
    2270:	3afffff5 	bcc	224c <USBInitializeISOCFrameArray+0x20>
    2274:	e8bd8010 	pop	{r4, pc}

00002278 <USBSetHeadDDForDMA>:
    2278:	e20030ff 	and	r3, r0, #255	; 0xff
    227c:	e1a033a3 	lsr	r3, r3, #7
    2280:	e200000f 	and	r0, r0, #15
    2284:	e1830080 	orr	r0, r3, r0, lsl #1
    2288:	e7812100 	str	r2, [r1, r0, lsl #2]
    228c:	e12fff1e 	bx	lr

00002290 <USBInitializeUSBDMA>:
    2290:	e3a03000 	mov	r3, #0
    2294:	e1a02003 	mov	r2, r3
    2298:	e7802003 	str	r2, [r0, r3]
    229c:	e2833004 	add	r3, r3, #4
    22a0:	e3530080 	cmp	r3, #128	; 0x80
    22a4:	1afffffb 	bne	2298 <USBInitializeUSBDMA+0x8>
    22a8:	e59f3004 	ldr	r3, [pc, #4]	; 22b4 <USBInitializeUSBDMA+0x24>
    22ac:	e5030d7f 	str	r0, [r3, #-3455]	; 0xd7f
    22b0:	e12fff1e 	bx	lr
    22b4:	ffe0cfff 	.word	0xffe0cfff

000022b8 <StallControlPipe>:
    22b8:	e92d4070 	push	{r4, r5, r6, lr}
    22bc:	e3a01001 	mov	r1, #1
    22c0:	e1a05000 	mov	r5, r0
    22c4:	e3a00080 	mov	r0, #128	; 0x80
    22c8:	ebfffe8b 	bl	1cfc <USBHwEPStall>
    22cc:	e59f002c 	ldr	r0, [pc, #44]	; 2300 <StallControlPipe+0x48>
    22d0:	ebfff8ec 	bl	688 <printf>
    22d4:	e59f6028 	ldr	r6, [pc, #40]	; 2304 <StallControlPipe+0x4c>
    22d8:	e59f4028 	ldr	r4, [pc, #40]	; 2308 <StallControlPipe+0x50>
    22dc:	e4d41001 	ldrb	r1, [r4], #1
    22e0:	e59f0024 	ldr	r0, [pc, #36]	; 230c <StallControlPipe+0x54>
    22e4:	ebfff8e7 	bl	688 <printf>
    22e8:	e1540006 	cmp	r4, r6
    22ec:	1afffffa 	bne	22dc <StallControlPipe+0x24>
    22f0:	e59f0018 	ldr	r0, [pc, #24]	; 2310 <StallControlPipe+0x58>
    22f4:	e1a01005 	mov	r1, r5
    22f8:	e8bd4070 	pop	{r4, r5, r6, lr}
    22fc:	eafff8e1 	b	688 <printf>
    2300:	000034e9 	.word	0x000034e9
    2304:	4000049c 	.word	0x4000049c
    2308:	40000494 	.word	0x40000494
    230c:	000034f4 	.word	0x000034f4
    2310:	000034fa 	.word	0x000034fa

00002314 <DataIn>:
    2314:	e92d4030 	push	{r4, r5, lr}
    2318:	e59f4034 	ldr	r4, [pc, #52]	; 2354 <DataIn+0x40>
    231c:	e5945008 	ldr	r5, [r4, #8]
    2320:	e3550040 	cmp	r5, #64	; 0x40
    2324:	a3a05040 	movge	r5, #64	; 0x40
    2328:	e1a02005 	mov	r2, r5
    232c:	e3a00080 	mov	r0, #128	; 0x80
    2330:	e594100c 	ldr	r1, [r4, #12]
    2334:	ebfffe78 	bl	1d1c <USBHwEPWrite>
    2338:	e594300c 	ldr	r3, [r4, #12]
    233c:	e0833005 	add	r3, r3, r5
    2340:	e584300c 	str	r3, [r4, #12]
    2344:	e5943008 	ldr	r3, [r4, #8]
    2348:	e0655003 	rsb	r5, r5, r3
    234c:	e5845008 	str	r5, [r4, #8]
    2350:	e8bd8030 	pop	{r4, r5, pc}
    2354:	40000494 	.word	0x40000494

00002358 <_HandleRequest.clone.0>:
    2358:	e92d4010 	push	{r4, lr}
    235c:	e59f003c 	ldr	r0, [pc, #60]	; 23a0 <_HandleRequest.clone.0+0x48>
    2360:	e5d01000 	ldrb	r1, [r0]
    2364:	e1a012a1 	lsr	r1, r1, #5
    2368:	e2011003 	and	r1, r1, #3
    236c:	e0803101 	add	r3, r0, r1, lsl #2
    2370:	e5934010 	ldr	r4, [r3, #16]
    2374:	e3540000 	cmp	r4, #0
    2378:	1a000003 	bne	238c <_HandleRequest.clone.0+0x34>
    237c:	e59f0020 	ldr	r0, [pc, #32]	; 23a4 <_HandleRequest.clone.0+0x4c>
    2380:	ebfff8c0 	bl	688 <printf>
    2384:	e1a00004 	mov	r0, r4
    2388:	e8bd8010 	pop	{r4, pc}
    238c:	e2801020 	add	r1, r0, #32
    2390:	e280200c 	add	r2, r0, #12
    2394:	e1a0e00f 	mov	lr, pc
    2398:	e12fff14 	bx	r4
    239c:	e8bd8010 	pop	{r4, pc}
    23a0:	40000494 	.word	0x40000494
    23a4:	00003505 	.word	0x00003505

000023a8 <USBHandleControlTransfer>:
    23a8:	e21030ff 	ands	r3, r0, #255	; 0xff
    23ac:	e92d4031 	push	{r0, r4, r5, lr}
    23b0:	e20150ff 	and	r5, r1, #255	; 0xff
    23b4:	1a00004a 	bne	24e4 <USBHandleControlTransfer+0x13c>
    23b8:	e2110004 	ands	r0, r1, #4
    23bc:	e59f415c 	ldr	r4, [pc, #348]	; 2520 <USBHandleControlTransfer+0x178>
    23c0:	0a00001e 	beq	2440 <USBHandleControlTransfer+0x98>
    23c4:	e1a00003 	mov	r0, r3
    23c8:	e3a02008 	mov	r2, #8
    23cc:	e1a01004 	mov	r1, r4
    23d0:	ebfffe72 	bl	1da0 <USBHwEPRead>
    23d4:	e59f0148 	ldr	r0, [pc, #328]	; 2524 <USBHandleControlTransfer+0x17c>
    23d8:	e5d41001 	ldrb	r1, [r4, #1]
    23dc:	ebfff8a9 	bl	688 <printf>
    23e0:	e5d42000 	ldrb	r2, [r4]
    23e4:	e1a031a2 	lsr	r3, r2, #3
    23e8:	e203300c 	and	r3, r3, #12
    23ec:	e0843003 	add	r3, r4, r3
    23f0:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    23f4:	e584300c 	str	r3, [r4, #12]
    23f8:	e1d430b6 	ldrh	r3, [r4, #6]
    23fc:	e3530000 	cmp	r3, #0
    2400:	e5843008 	str	r3, [r4, #8]
    2404:	e5843020 	str	r3, [r4, #32]
    2408:	0a000001 	beq	2414 <USBHandleControlTransfer+0x6c>
    240c:	e1b023a2 	lsrs	r2, r2, #7
    2410:	0a000040 	beq	2518 <USBHandleControlTransfer+0x170>
    2414:	ebffffcf 	bl	2358 <_HandleRequest.clone.0>
    2418:	e3500000 	cmp	r0, #0
    241c:	059f0104 	ldreq	r0, [pc, #260]	; 2528 <USBHandleControlTransfer+0x180>
    2420:	0a00001f 	beq	24a4 <USBHandleControlTransfer+0xfc>
    2424:	e59f30f4 	ldr	r3, [pc, #244]	; 2520 <USBHandleControlTransfer+0x178>
    2428:	e1d310b6 	ldrh	r1, [r3, #6]
    242c:	e5932020 	ldr	r2, [r3, #32]
    2430:	e1510002 	cmp	r1, r2
    2434:	d5831008 	strle	r1, [r3, #8]
    2438:	c5832008 	strgt	r2, [r3, #8]
    243c:	ea00002a 	b	24ec <USBHandleControlTransfer+0x144>
    2440:	e5942008 	ldr	r2, [r4, #8]
    2444:	e3520000 	cmp	r2, #0
    2448:	da00001a 	ble	24b8 <USBHandleControlTransfer+0x110>
    244c:	e594100c 	ldr	r1, [r4, #12]
    2450:	ebfffe52 	bl	1da0 <USBHwEPRead>
    2454:	e3500000 	cmp	r0, #0
    2458:	ba000012 	blt	24a8 <USBHandleControlTransfer+0x100>
    245c:	e594300c 	ldr	r3, [r4, #12]
    2460:	e0833000 	add	r3, r3, r0
    2464:	e584300c 	str	r3, [r4, #12]
    2468:	e5943008 	ldr	r3, [r4, #8]
    246c:	e0600003 	rsb	r0, r0, r3
    2470:	e3500000 	cmp	r0, #0
    2474:	e5840008 	str	r0, [r4, #8]
    2478:	1a000026 	bne	2518 <USBHandleControlTransfer+0x170>
    247c:	e5d43000 	ldrb	r3, [r4]
    2480:	e1a031a3 	lsr	r3, r3, #3
    2484:	e203300c 	and	r3, r3, #12
    2488:	e0843003 	add	r3, r4, r3
    248c:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    2490:	e584300c 	str	r3, [r4, #12]
    2494:	ebffffaf 	bl	2358 <_HandleRequest.clone.0>
    2498:	e3500000 	cmp	r0, #0
    249c:	1a000012 	bne	24ec <USBHandleControlTransfer+0x144>
    24a0:	e59f0084 	ldr	r0, [pc, #132]	; 252c <USBHandleControlTransfer+0x184>
    24a4:	ebfff8b7 	bl	788 <puts>
    24a8:	e1a00005 	mov	r0, r5
    24ac:	e28dd004 	add	sp, sp, #4
    24b0:	e8bd4030 	pop	{r4, r5, lr}
    24b4:	eaffff7f 	b	22b8 <StallControlPipe>
    24b8:	e1a01000 	mov	r1, r0
    24bc:	e1a02000 	mov	r2, r0
    24c0:	ebfffe36 	bl	1da0 <USBHwEPRead>
    24c4:	e59f3064 	ldr	r3, [pc, #100]	; 2530 <USBHandleControlTransfer+0x188>
    24c8:	e59f2064 	ldr	r2, [pc, #100]	; 2534 <USBHandleControlTransfer+0x18c>
    24cc:	e3500000 	cmp	r0, #0
    24d0:	d1a00002 	movle	r0, r2
    24d4:	c1a00003 	movgt	r0, r3
    24d8:	e28dd004 	add	sp, sp, #4
    24dc:	e8bd4030 	pop	{r4, r5, lr}
    24e0:	eafff868 	b	688 <printf>
    24e4:	e3530080 	cmp	r3, #128	; 0x80
    24e8:	1a000002 	bne	24f8 <USBHandleControlTransfer+0x150>
    24ec:	e28dd004 	add	sp, sp, #4
    24f0:	e8bd4030 	pop	{r4, r5, lr}
    24f4:	eaffff86 	b	2314 <DataIn>
    24f8:	e3a030d4 	mov	r3, #212	; 0xd4
    24fc:	e58d3000 	str	r3, [sp]
    2500:	e59f0030 	ldr	r0, [pc, #48]	; 2538 <USBHandleControlTransfer+0x190>
    2504:	e59f1030 	ldr	r1, [pc, #48]	; 253c <USBHandleControlTransfer+0x194>
    2508:	e59f2030 	ldr	r2, [pc, #48]	; 2540 <USBHandleControlTransfer+0x198>
    250c:	e59f3030 	ldr	r3, [pc, #48]	; 2544 <USBHandleControlTransfer+0x19c>
    2510:	ebfff85c 	bl	688 <printf>
    2514:	eafffffe 	b	2514 <USBHandleControlTransfer+0x16c>
    2518:	e28dd004 	add	sp, sp, #4
    251c:	e8bd8030 	pop	{r4, r5, pc}
    2520:	40000494 	.word	0x40000494
    2524:	00003522 	.word	0x00003522
    2528:	00003526 	.word	0x00003526
    252c:	0000353d 	.word	0x0000353d
    2530:	00003520 	.word	0x00003520
    2534:	000033dd 	.word	0x000033dd
    2538:	00003109 	.word	0x00003109
    253c:	0000312e 	.word	0x0000312e
    2540:	00003554 	.word	0x00003554
    2544:	00002f38 	.word	0x00002f38

00002548 <USBRegisterRequestHandler>:
    2548:	e92d4001 	push	{r0, lr}
    254c:	e3500000 	cmp	r0, #0
    2550:	aa000007 	bge	2574 <USBRegisterRequestHandler+0x2c>
    2554:	e3a030e2 	mov	r3, #226	; 0xe2
    2558:	e58d3000 	str	r3, [sp]
    255c:	e59f004c 	ldr	r0, [pc, #76]	; 25b0 <USBRegisterRequestHandler+0x68>
    2560:	e59f104c 	ldr	r1, [pc, #76]	; 25b4 <USBRegisterRequestHandler+0x6c>
    2564:	e59f204c 	ldr	r2, [pc, #76]	; 25b8 <USBRegisterRequestHandler+0x70>
    2568:	e59f304c 	ldr	r3, [pc, #76]	; 25bc <USBRegisterRequestHandler+0x74>
    256c:	ebfff845 	bl	688 <printf>
    2570:	eafffffe 	b	2570 <USBRegisterRequestHandler+0x28>
    2574:	e3500003 	cmp	r0, #3
    2578:	da000007 	ble	259c <USBRegisterRequestHandler+0x54>
    257c:	e3a030e3 	mov	r3, #227	; 0xe3
    2580:	e58d3000 	str	r3, [sp]
    2584:	e59f0024 	ldr	r0, [pc, #36]	; 25b0 <USBRegisterRequestHandler+0x68>
    2588:	e59f1030 	ldr	r1, [pc, #48]	; 25c0 <USBRegisterRequestHandler+0x78>
    258c:	e59f2024 	ldr	r2, [pc, #36]	; 25b8 <USBRegisterRequestHandler+0x70>
    2590:	e59f3024 	ldr	r3, [pc, #36]	; 25bc <USBRegisterRequestHandler+0x74>
    2594:	ebfff83b 	bl	688 <printf>
    2598:	eafffffe 	b	2598 <USBRegisterRequestHandler+0x50>
    259c:	e59f3020 	ldr	r3, [pc, #32]	; 25c4 <USBRegisterRequestHandler+0x7c>
    25a0:	e0830100 	add	r0, r3, r0, lsl #2
    25a4:	e5801010 	str	r1, [r0, #16]
    25a8:	e5802024 	str	r2, [r0, #36]	; 0x24
    25ac:	e8bd8008 	pop	{r3, pc}
    25b0:	00003109 	.word	0x00003109
    25b4:	00003561 	.word	0x00003561
    25b8:	00003554 	.word	0x00003554
    25bc:	00002f54 	.word	0x00002f54
    25c0:	0000356c 	.word	0x0000356c
    25c4:	40000494 	.word	0x40000494

000025c8 <USBRegisterDescriptors>:
    25c8:	e59f3004 	ldr	r3, [pc, #4]	; 25d4 <USBRegisterDescriptors+0xc>
    25cc:	e5830000 	str	r0, [r3]
    25d0:	e12fff1e 	bx	lr
    25d4:	400004c8 	.word	0x400004c8

000025d8 <USBGetDescriptor>:
    25d8:	e59fc09c 	ldr	ip, [pc, #156]	; 267c <USBGetDescriptor+0xa4>
    25dc:	e59cc000 	ldr	ip, [ip]
    25e0:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    25e4:	e1a00800 	lsl	r0, r0, #16
    25e8:	e35c0000 	cmp	ip, #0
    25ec:	e1a01820 	lsr	r1, r0, #16
    25f0:	11a05c20 	lsrne	r5, r0, #24
    25f4:	120160ff 	andne	r6, r1, #255	; 0xff
    25f8:	13a00000 	movne	r0, #0
    25fc:	1a000017 	bne	2660 <USBGetDescriptor+0x88>
    2600:	e3a0306e 	mov	r3, #110	; 0x6e
    2604:	e58d3000 	str	r3, [sp]
    2608:	e59f0070 	ldr	r0, [pc, #112]	; 2680 <USBGetDescriptor+0xa8>
    260c:	e59f1070 	ldr	r1, [pc, #112]	; 2684 <USBGetDescriptor+0xac>
    2610:	e59f2070 	ldr	r2, [pc, #112]	; 2688 <USBGetDescriptor+0xb0>
    2614:	e59f3070 	ldr	r3, [pc, #112]	; 268c <USBGetDescriptor+0xb4>
    2618:	ebfff81a 	bl	688 <printf>
    261c:	eafffffe 	b	261c <USBGetDescriptor+0x44>
    2620:	e5dc7001 	ldrb	r7, [ip, #1]
    2624:	e1570005 	cmp	r7, r5
    2628:	1a00000b 	bne	265c <USBGetDescriptor+0x84>
    262c:	e1500006 	cmp	r0, r6
    2630:	1a000008 	bne	2658 <USBGetDescriptor+0x80>
    2634:	e583c000 	str	ip, [r3]
    2638:	e3550002 	cmp	r5, #2
    263c:	05dc1003 	ldrbeq	r1, [ip, #3]
    2640:	05dc3002 	ldrbeq	r3, [ip, #2]
    2644:	15dc3000 	ldrbne	r3, [ip]
    2648:	01833401 	orreq	r3, r3, r1, lsl #8
    264c:	e5823000 	str	r3, [r2]
    2650:	e3a00001 	mov	r0, #1
    2654:	ea000007 	b	2678 <USBGetDescriptor+0xa0>
    2658:	e2800001 	add	r0, r0, #1
    265c:	e08cc004 	add	ip, ip, r4
    2660:	e5dc4000 	ldrb	r4, [ip]
    2664:	e3540000 	cmp	r4, #0
    2668:	1affffec 	bne	2620 <USBGetDescriptor+0x48>
    266c:	e59f001c 	ldr	r0, [pc, #28]	; 2690 <USBGetDescriptor+0xb8>
    2670:	ebfff804 	bl	688 <printf>
    2674:	e1a00004 	mov	r0, r4
    2678:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    267c:	400004c8 	.word	0x400004c8
    2680:	00003109 	.word	0x00003109
    2684:	00003576 	.word	0x00003576
    2688:	00003589 	.word	0x00003589
    268c:	00002f70 	.word	0x00002f70
    2690:	00003595 	.word	0x00003595

00002694 <USBHandleStandardRequest>:
    2694:	e59f32e4 	ldr	r3, [pc, #740]	; 2980 <USBHandleStandardRequest+0x2ec>
    2698:	e5933004 	ldr	r3, [r3, #4]
    269c:	e3530000 	cmp	r3, #0
    26a0:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    26a4:	e1a04000 	mov	r4, r0
    26a8:	e1a05001 	mov	r5, r1
    26ac:	e1a06002 	mov	r6, r2
    26b0:	0a000003 	beq	26c4 <USBHandleStandardRequest+0x30>
    26b4:	e1a0e00f 	mov	lr, pc
    26b8:	e12fff13 	bx	r3
    26bc:	e3500000 	cmp	r0, #0
    26c0:	1a000071 	bne	288c <USBHandleStandardRequest+0x1f8>
    26c4:	e5d43000 	ldrb	r3, [r4]
    26c8:	e203301f 	and	r3, r3, #31
    26cc:	e3530001 	cmp	r3, #1
    26d0:	0a000057 	beq	2834 <USBHandleStandardRequest+0x1a0>
    26d4:	e3530002 	cmp	r3, #2
    26d8:	0a000078 	beq	28c0 <USBHandleStandardRequest+0x22c>
    26dc:	e3530000 	cmp	r3, #0
    26e0:	1a0000a3 	bne	2974 <USBHandleStandardRequest+0x2e0>
    26e4:	e5d41001 	ldrb	r1, [r4, #1]
    26e8:	e5963000 	ldr	r3, [r6]
    26ec:	e3510009 	cmp	r1, #9
    26f0:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    26f4:	ea00004c 	b	282c <USBHandleStandardRequest+0x198>
    26f8:	00002878 	.word	0x00002878
    26fc:	00002974 	.word	0x00002974
    2700:	0000282c 	.word	0x0000282c
    2704:	00002974 	.word	0x00002974
    2708:	0000282c 	.word	0x0000282c
    270c:	00002720 	.word	0x00002720
    2710:	0000272c 	.word	0x0000272c
    2714:	00002820 	.word	0x00002820
    2718:	00002754 	.word	0x00002754
    271c:	00002760 	.word	0x00002760
    2720:	e5d40002 	ldrb	r0, [r4, #2]
    2724:	ebfffd5b 	bl	1c98 <USBHwSetAddress>
    2728:	ea000057 	b	288c <USBHandleStandardRequest+0x1f8>
    272c:	e1d410b2 	ldrh	r1, [r4, #2]
    2730:	e59f024c 	ldr	r0, [pc, #588]	; 2984 <USBHandleStandardRequest+0x2f0>
    2734:	ebfff7d3 	bl	688 <printf>
    2738:	e1d400b2 	ldrh	r0, [r4, #2]
    273c:	e1d410b4 	ldrh	r1, [r4, #4]
    2740:	e1a02005 	mov	r2, r5
    2744:	e1a03006 	mov	r3, r6
    2748:	e28dd004 	add	sp, sp, #4
    274c:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    2750:	eaffffa0 	b	25d8 <USBGetDescriptor>
    2754:	e59f2224 	ldr	r2, [pc, #548]	; 2980 <USBHandleStandardRequest+0x2ec>
    2758:	e5d22008 	ldrb	r2, [r2, #8]
    275c:	ea00004d 	b	2898 <USBHandleStandardRequest+0x204>
    2760:	e59f3218 	ldr	r3, [pc, #536]	; 2980 <USBHandleStandardRequest+0x2ec>
    2764:	e5935000 	ldr	r5, [r3]
    2768:	e3550000 	cmp	r5, #0
    276c:	e1d460b2 	ldrh	r6, [r4, #2]
    2770:	1a000007 	bne	2794 <USBHandleStandardRequest+0x100>
    2774:	e3a030a5 	mov	r3, #165	; 0xa5
    2778:	e58d3000 	str	r3, [sp]
    277c:	e59f0204 	ldr	r0, [pc, #516]	; 2988 <USBHandleStandardRequest+0x2f4>
    2780:	e59f1204 	ldr	r1, [pc, #516]	; 298c <USBHandleStandardRequest+0x2f8>
    2784:	e59f2204 	ldr	r2, [pc, #516]	; 2990 <USBHandleStandardRequest+0x2fc>
    2788:	e59f3204 	ldr	r3, [pc, #516]	; 2994 <USBHandleStandardRequest+0x300>
    278c:	ebfff7bd 	bl	688 <printf>
    2790:	eafffffe 	b	2790 <USBHandleStandardRequest+0xfc>
    2794:	e21660ff 	ands	r6, r6, #255	; 0xff
    2798:	13a030ff 	movne	r3, #255	; 0xff
    279c:	11a07003 	movne	r7, r3
    27a0:	01a00006 	moveq	r0, r6
    27a4:	1a000014 	bne	27fc <USBHandleStandardRequest+0x168>
    27a8:	ea000017 	b	280c <USBHandleStandardRequest+0x178>
    27ac:	e5d52001 	ldrb	r2, [r5, #1]
    27b0:	e3520004 	cmp	r2, #4
    27b4:	05d53003 	ldrbeq	r3, [r5, #3]
    27b8:	0a00000d 	beq	27f4 <USBHandleStandardRequest+0x160>
    27bc:	e3520005 	cmp	r2, #5
    27c0:	0a000002 	beq	27d0 <USBHandleStandardRequest+0x13c>
    27c4:	e3520002 	cmp	r2, #2
    27c8:	05d57005 	ldrbeq	r7, [r5, #5]
    27cc:	ea000008 	b	27f4 <USBHandleStandardRequest+0x160>
    27d0:	e3530000 	cmp	r3, #0
    27d4:	01570006 	cmpeq	r7, r6
    27d8:	1a000005 	bne	27f4 <USBHandleStandardRequest+0x160>
    27dc:	e5d53004 	ldrb	r3, [r5, #4]
    27e0:	e5d51005 	ldrb	r1, [r5, #5]
    27e4:	e5d50002 	ldrb	r0, [r5, #2]
    27e8:	e1831401 	orr	r1, r3, r1, lsl #8
    27ec:	ebfffce7 	bl	1b90 <USBHwEPConfig>
    27f0:	e3a03000 	mov	r3, #0
    27f4:	e5d52000 	ldrb	r2, [r5]
    27f8:	e0855002 	add	r5, r5, r2
    27fc:	e5d52000 	ldrb	r2, [r5]
    2800:	e3520000 	cmp	r2, #0
    2804:	1affffe8 	bne	27ac <USBHandleStandardRequest+0x118>
    2808:	e3a00001 	mov	r0, #1
    280c:	ebfffdb3 	bl	1ee0 <USBHwConfigDevice>
    2810:	e1d420b2 	ldrh	r2, [r4, #2]
    2814:	e59f3164 	ldr	r3, [pc, #356]	; 2980 <USBHandleStandardRequest+0x2ec>
    2818:	e5c32008 	strb	r2, [r3, #8]
    281c:	ea00001a 	b	288c <USBHandleStandardRequest+0x1f8>
    2820:	e59f0170 	ldr	r0, [pc, #368]	; 2998 <USBHandleStandardRequest+0x304>
    2824:	e3a01007 	mov	r1, #7
    2828:	ea000050 	b	2970 <USBHandleStandardRequest+0x2dc>
    282c:	e59f0168 	ldr	r0, [pc, #360]	; 299c <USBHandleStandardRequest+0x308>
    2830:	ea00004e 	b	2970 <USBHandleStandardRequest+0x2dc>
    2834:	e5d41001 	ldrb	r1, [r4, #1]
    2838:	e5963000 	ldr	r3, [r6]
    283c:	e351000b 	cmp	r1, #11
    2840:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    2844:	ea00001b 	b	28b8 <USBHandleStandardRequest+0x224>
    2848:	00002878 	.word	0x00002878
    284c:	00002974 	.word	0x00002974
    2850:	000028b8 	.word	0x000028b8
    2854:	00002974 	.word	0x00002974
    2858:	000028b8 	.word	0x000028b8
    285c:	000028b8 	.word	0x000028b8
    2860:	000028b8 	.word	0x000028b8
    2864:	000028b8 	.word	0x000028b8
    2868:	000028b8 	.word	0x000028b8
    286c:	000028b8 	.word	0x000028b8
    2870:	00002894 	.word	0x00002894
    2874:	000028a8 	.word	0x000028a8
    2878:	e3a02000 	mov	r2, #0
    287c:	e5c32000 	strb	r2, [r3]
    2880:	e5c32001 	strb	r2, [r3, #1]
    2884:	e3a03002 	mov	r3, #2
    2888:	e5853000 	str	r3, [r5]
    288c:	e3a00001 	mov	r0, #1
    2890:	ea000038 	b	2978 <USBHandleStandardRequest+0x2e4>
    2894:	e3a02000 	mov	r2, #0
    2898:	e3a00001 	mov	r0, #1
    289c:	e5c32000 	strb	r2, [r3]
    28a0:	e5850000 	str	r0, [r5]
    28a4:	ea000033 	b	2978 <USBHandleStandardRequest+0x2e4>
    28a8:	e1d430b2 	ldrh	r3, [r4, #2]
    28ac:	e3530000 	cmp	r3, #0
    28b0:	0afffff4 	beq	2888 <USBHandleStandardRequest+0x1f4>
    28b4:	ea00002e 	b	2974 <USBHandleStandardRequest+0x2e0>
    28b8:	e59f00e0 	ldr	r0, [pc, #224]	; 29a0 <USBHandleStandardRequest+0x30c>
    28bc:	ea00002b 	b	2970 <USBHandleStandardRequest+0x2dc>
    28c0:	e5d41001 	ldrb	r1, [r4, #1]
    28c4:	e5966000 	ldr	r6, [r6]
    28c8:	e351000c 	cmp	r1, #12
    28cc:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    28d0:	ea000025 	b	296c <USBHandleStandardRequest+0x2d8>
    28d4:	00002908 	.word	0x00002908
    28d8:	00002930 	.word	0x00002930
    28dc:	0000296c 	.word	0x0000296c
    28e0:	00002944 	.word	0x00002944
    28e4:	0000296c 	.word	0x0000296c
    28e8:	0000296c 	.word	0x0000296c
    28ec:	0000296c 	.word	0x0000296c
    28f0:	0000296c 	.word	0x0000296c
    28f4:	0000296c 	.word	0x0000296c
    28f8:	0000296c 	.word	0x0000296c
    28fc:	0000296c 	.word	0x0000296c
    2900:	0000296c 	.word	0x0000296c
    2904:	00002960 	.word	0x00002960
    2908:	e5d40004 	ldrb	r0, [r4, #4]
    290c:	ebfffcf5 	bl	1ce8 <USBHwEPGetStatus>
    2910:	e3100002 	tst	r0, #2
    2914:	03a03000 	moveq	r3, #0
    2918:	13a03001 	movne	r3, #1
    291c:	e5c63000 	strb	r3, [r6]
    2920:	e3a03000 	mov	r3, #0
    2924:	e5c63001 	strb	r3, [r6, #1]
    2928:	e2833002 	add	r3, r3, #2
    292c:	eaffffd5 	b	2888 <USBHandleStandardRequest+0x1f4>
    2930:	e1d410b2 	ldrh	r1, [r4, #2]
    2934:	e3510000 	cmp	r1, #0
    2938:	05d40004 	ldrbeq	r0, [r4, #4]
    293c:	1a00000c 	bne	2974 <USBHandleStandardRequest+0x2e0>
    2940:	ea000004 	b	2958 <USBHandleStandardRequest+0x2c4>
    2944:	e1d430b2 	ldrh	r3, [r4, #2]
    2948:	e3530000 	cmp	r3, #0
    294c:	1a000008 	bne	2974 <USBHandleStandardRequest+0x2e0>
    2950:	e5d40004 	ldrb	r0, [r4, #4]
    2954:	e3a01001 	mov	r1, #1
    2958:	ebfffce7 	bl	1cfc <USBHwEPStall>
    295c:	eaffffca 	b	288c <USBHandleStandardRequest+0x1f8>
    2960:	e59f003c 	ldr	r0, [pc, #60]	; 29a4 <USBHandleStandardRequest+0x310>
    2964:	e3a0100c 	mov	r1, #12
    2968:	ea000000 	b	2970 <USBHandleStandardRequest+0x2dc>
    296c:	e59f0034 	ldr	r0, [pc, #52]	; 29a8 <USBHandleStandardRequest+0x314>
    2970:	ebfff744 	bl	688 <printf>
    2974:	e3a00000 	mov	r0, #0
    2978:	e28dd004 	add	sp, sp, #4
    297c:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    2980:	400004c8 	.word	0x400004c8
    2984:	000035a9 	.word	0x000035a9
    2988:	00003109 	.word	0x00003109
    298c:	00003576 	.word	0x00003576
    2990:	00003589 	.word	0x00003589
    2994:	00002f84 	.word	0x00002f84
    2998:	000035ad 	.word	0x000035ad
    299c:	000035cc 	.word	0x000035cc
    29a0:	000035e3 	.word	0x000035e3
    29a4:	000035fd 	.word	0x000035fd
    29a8:	00003618 	.word	0x00003618

000029ac <USBRegisterCustomReqHandler>:
    29ac:	e59f3004 	ldr	r3, [pc, #4]	; 29b8 <USBRegisterCustomReqHandler+0xc>
    29b0:	e5830004 	str	r0, [r3, #4]
    29b4:	e12fff1e 	bx	lr
    29b8:	400004c8 	.word	0x400004c8

000029bc <HandleUsbReset>:
    29bc:	e3100010 	tst	r0, #16
    29c0:	012fff1e 	bxeq	lr
    29c4:	e59f0000 	ldr	r0, [pc, #0]	; 29cc <HandleUsbReset+0x10>
    29c8:	eafff72e 	b	688 <printf>
    29cc:	0000362b 	.word	0x0000362b

000029d0 <USBInit>:
    29d0:	e92d4010 	push	{r4, lr}
    29d4:	e59f4050 	ldr	r4, [pc, #80]	; 2a2c <USBInit+0x5c>
    29d8:	ebfffd91 	bl	2024 <USBHwInit>
    29dc:	e59f004c 	ldr	r0, [pc, #76]	; 2a30 <USBInit+0x60>
    29e0:	ebfffc96 	bl	1c40 <USBHwRegisterDevIntHandler>
    29e4:	e1a01004 	mov	r1, r4
    29e8:	e3a00000 	mov	r0, #0
    29ec:	ebfffc7c 	bl	1be4 <USBHwRegisterEPIntHandler>
    29f0:	e1a01004 	mov	r1, r4
    29f4:	e3a00080 	mov	r0, #128	; 0x80
    29f8:	ebfffc79 	bl	1be4 <USBHwRegisterEPIntHandler>
    29fc:	e3a00000 	mov	r0, #0
    2a00:	e3a01040 	mov	r1, #64	; 0x40
    2a04:	ebfffc61 	bl	1b90 <USBHwEPConfig>
    2a08:	e3a00080 	mov	r0, #128	; 0x80
    2a0c:	e3a01040 	mov	r1, #64	; 0x40
    2a10:	ebfffc5e 	bl	1b90 <USBHwEPConfig>
    2a14:	e3a00000 	mov	r0, #0
    2a18:	e59f1014 	ldr	r1, [pc, #20]	; 2a34 <USBInit+0x64>
    2a1c:	e59f2014 	ldr	r2, [pc, #20]	; 2a38 <USBInit+0x68>
    2a20:	ebfffec8 	bl	2548 <USBRegisterRequestHandler>
    2a24:	e3a00001 	mov	r0, #1
    2a28:	e8bd8010 	pop	{r4, pc}
    2a2c:	000023a8 	.word	0x000023a8
    2a30:	000029bc 	.word	0x000029bc
    2a34:	00002694 	.word	0x00002694
    2a38:	400004d4 	.word	0x400004d4

00002a3c <__aeabi_uidiv>:
    2a3c:	e2512001 	subs	r2, r1, #1
    2a40:	012fff1e 	bxeq	lr
    2a44:	3a000036 	bcc	2b24 <__aeabi_uidiv+0xe8>
    2a48:	e1500001 	cmp	r0, r1
    2a4c:	9a000022 	bls	2adc <__aeabi_uidiv+0xa0>
    2a50:	e1110002 	tst	r1, r2
    2a54:	0a000023 	beq	2ae8 <__aeabi_uidiv+0xac>
    2a58:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    2a5c:	01a01181 	lsleq	r1, r1, #3
    2a60:	03a03008 	moveq	r3, #8
    2a64:	13a03001 	movne	r3, #1
    2a68:	e3510201 	cmp	r1, #268435456	; 0x10000000
    2a6c:	31510000 	cmpcc	r1, r0
    2a70:	31a01201 	lslcc	r1, r1, #4
    2a74:	31a03203 	lslcc	r3, r3, #4
    2a78:	3afffffa 	bcc	2a68 <__aeabi_uidiv+0x2c>
    2a7c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    2a80:	31510000 	cmpcc	r1, r0
    2a84:	31a01081 	lslcc	r1, r1, #1
    2a88:	31a03083 	lslcc	r3, r3, #1
    2a8c:	3afffffa 	bcc	2a7c <__aeabi_uidiv+0x40>
    2a90:	e3a02000 	mov	r2, #0
    2a94:	e1500001 	cmp	r0, r1
    2a98:	20400001 	subcs	r0, r0, r1
    2a9c:	21822003 	orrcs	r2, r2, r3
    2aa0:	e15000a1 	cmp	r0, r1, lsr #1
    2aa4:	204000a1 	subcs	r0, r0, r1, lsr #1
    2aa8:	218220a3 	orrcs	r2, r2, r3, lsr #1
    2aac:	e1500121 	cmp	r0, r1, lsr #2
    2ab0:	20400121 	subcs	r0, r0, r1, lsr #2
    2ab4:	21822123 	orrcs	r2, r2, r3, lsr #2
    2ab8:	e15001a1 	cmp	r0, r1, lsr #3
    2abc:	204001a1 	subcs	r0, r0, r1, lsr #3
    2ac0:	218221a3 	orrcs	r2, r2, r3, lsr #3
    2ac4:	e3500000 	cmp	r0, #0
    2ac8:	11b03223 	lsrsne	r3, r3, #4
    2acc:	11a01221 	lsrne	r1, r1, #4
    2ad0:	1affffef 	bne	2a94 <__aeabi_uidiv+0x58>
    2ad4:	e1a00002 	mov	r0, r2
    2ad8:	e12fff1e 	bx	lr
    2adc:	03a00001 	moveq	r0, #1
    2ae0:	13a00000 	movne	r0, #0
    2ae4:	e12fff1e 	bx	lr
    2ae8:	e3510801 	cmp	r1, #65536	; 0x10000
    2aec:	21a01821 	lsrcs	r1, r1, #16
    2af0:	23a02010 	movcs	r2, #16
    2af4:	33a02000 	movcc	r2, #0
    2af8:	e3510c01 	cmp	r1, #256	; 0x100
    2afc:	21a01421 	lsrcs	r1, r1, #8
    2b00:	22822008 	addcs	r2, r2, #8
    2b04:	e3510010 	cmp	r1, #16
    2b08:	21a01221 	lsrcs	r1, r1, #4
    2b0c:	22822004 	addcs	r2, r2, #4
    2b10:	e3510004 	cmp	r1, #4
    2b14:	82822003 	addhi	r2, r2, #3
    2b18:	908220a1 	addls	r2, r2, r1, lsr #1
    2b1c:	e1a00230 	lsr	r0, r0, r2
    2b20:	e12fff1e 	bx	lr
    2b24:	e52de008 	str	lr, [sp, #-8]!
    2b28:	eb00008e 	bl	2d68 <__div0>
    2b2c:	e3a00000 	mov	r0, #0
    2b30:	e49df008 	ldr	pc, [sp], #8

00002b34 <__aeabi_uidivmod>:
    2b34:	e3510000 	cmp	r1, #0
    2b38:	0afffff9 	beq	2b24 <__aeabi_uidiv+0xe8>
    2b3c:	e92d4003 	push	{r0, r1, lr}
    2b40:	ebffffbd 	bl	2a3c <__aeabi_uidiv>
    2b44:	e8bd4006 	pop	{r1, r2, lr}
    2b48:	e0030092 	mul	r3, r2, r0
    2b4c:	e0411003 	sub	r1, r1, r3
    2b50:	e12fff1e 	bx	lr

00002b54 <__aeabi_idiv>:
    2b54:	e3510000 	cmp	r1, #0
    2b58:	0a000043 	beq	2c6c <.divsi3_skip_div0_test+0x110>

00002b5c <.divsi3_skip_div0_test>:
    2b5c:	e020c001 	eor	ip, r0, r1
    2b60:	42611000 	rsbmi	r1, r1, #0
    2b64:	e2512001 	subs	r2, r1, #1
    2b68:	0a000027 	beq	2c0c <.divsi3_skip_div0_test+0xb0>
    2b6c:	e1b03000 	movs	r3, r0
    2b70:	42603000 	rsbmi	r3, r0, #0
    2b74:	e1530001 	cmp	r3, r1
    2b78:	9a000026 	bls	2c18 <.divsi3_skip_div0_test+0xbc>
    2b7c:	e1110002 	tst	r1, r2
    2b80:	0a000028 	beq	2c28 <.divsi3_skip_div0_test+0xcc>
    2b84:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    2b88:	01a01181 	lsleq	r1, r1, #3
    2b8c:	03a02008 	moveq	r2, #8
    2b90:	13a02001 	movne	r2, #1
    2b94:	e3510201 	cmp	r1, #268435456	; 0x10000000
    2b98:	31510003 	cmpcc	r1, r3
    2b9c:	31a01201 	lslcc	r1, r1, #4
    2ba0:	31a02202 	lslcc	r2, r2, #4
    2ba4:	3afffffa 	bcc	2b94 <.divsi3_skip_div0_test+0x38>
    2ba8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    2bac:	31510003 	cmpcc	r1, r3
    2bb0:	31a01081 	lslcc	r1, r1, #1
    2bb4:	31a02082 	lslcc	r2, r2, #1
    2bb8:	3afffffa 	bcc	2ba8 <.divsi3_skip_div0_test+0x4c>
    2bbc:	e3a00000 	mov	r0, #0
    2bc0:	e1530001 	cmp	r3, r1
    2bc4:	20433001 	subcs	r3, r3, r1
    2bc8:	21800002 	orrcs	r0, r0, r2
    2bcc:	e15300a1 	cmp	r3, r1, lsr #1
    2bd0:	204330a1 	subcs	r3, r3, r1, lsr #1
    2bd4:	218000a2 	orrcs	r0, r0, r2, lsr #1
    2bd8:	e1530121 	cmp	r3, r1, lsr #2
    2bdc:	20433121 	subcs	r3, r3, r1, lsr #2
    2be0:	21800122 	orrcs	r0, r0, r2, lsr #2
    2be4:	e15301a1 	cmp	r3, r1, lsr #3
    2be8:	204331a1 	subcs	r3, r3, r1, lsr #3
    2bec:	218001a2 	orrcs	r0, r0, r2, lsr #3
    2bf0:	e3530000 	cmp	r3, #0
    2bf4:	11b02222 	lsrsne	r2, r2, #4
    2bf8:	11a01221 	lsrne	r1, r1, #4
    2bfc:	1affffef 	bne	2bc0 <.divsi3_skip_div0_test+0x64>
    2c00:	e35c0000 	cmp	ip, #0
    2c04:	42600000 	rsbmi	r0, r0, #0
    2c08:	e12fff1e 	bx	lr
    2c0c:	e13c0000 	teq	ip, r0
    2c10:	42600000 	rsbmi	r0, r0, #0
    2c14:	e12fff1e 	bx	lr
    2c18:	33a00000 	movcc	r0, #0
    2c1c:	01a00fcc 	asreq	r0, ip, #31
    2c20:	03800001 	orreq	r0, r0, #1
    2c24:	e12fff1e 	bx	lr
    2c28:	e3510801 	cmp	r1, #65536	; 0x10000
    2c2c:	21a01821 	lsrcs	r1, r1, #16
    2c30:	23a02010 	movcs	r2, #16
    2c34:	33a02000 	movcc	r2, #0
    2c38:	e3510c01 	cmp	r1, #256	; 0x100
    2c3c:	21a01421 	lsrcs	r1, r1, #8
    2c40:	22822008 	addcs	r2, r2, #8
    2c44:	e3510010 	cmp	r1, #16
    2c48:	21a01221 	lsrcs	r1, r1, #4
    2c4c:	22822004 	addcs	r2, r2, #4
    2c50:	e3510004 	cmp	r1, #4
    2c54:	82822003 	addhi	r2, r2, #3
    2c58:	908220a1 	addls	r2, r2, r1, lsr #1
    2c5c:	e35c0000 	cmp	ip, #0
    2c60:	e1a00233 	lsr	r0, r3, r2
    2c64:	42600000 	rsbmi	r0, r0, #0
    2c68:	e12fff1e 	bx	lr
    2c6c:	e52de008 	str	lr, [sp, #-8]!
    2c70:	eb00003c 	bl	2d68 <__div0>
    2c74:	e3a00000 	mov	r0, #0
    2c78:	e49df008 	ldr	pc, [sp], #8

00002c7c <__aeabi_idivmod>:
    2c7c:	e3510000 	cmp	r1, #0
    2c80:	0afffff9 	beq	2c6c <.divsi3_skip_div0_test+0x110>
    2c84:	e92d4003 	push	{r0, r1, lr}
    2c88:	ebffffb3 	bl	2b5c <.divsi3_skip_div0_test>
    2c8c:	e8bd4006 	pop	{r1, r2, lr}
    2c90:	e0030092 	mul	r3, r2, r0
    2c94:	e0411003 	sub	r1, r1, r3
    2c98:	e12fff1e 	bx	lr

00002c9c <__umodsi3>:
    2c9c:	e2512001 	subs	r2, r1, #1
    2ca0:	3a00002c 	bcc	2d58 <__umodsi3+0xbc>
    2ca4:	11500001 	cmpne	r0, r1
    2ca8:	03a00000 	moveq	r0, #0
    2cac:	81110002 	tsthi	r1, r2
    2cb0:	00000002 	andeq	r0, r0, r2
    2cb4:	912fff1e 	bxls	lr
    2cb8:	e3a02000 	mov	r2, #0
    2cbc:	e3510201 	cmp	r1, #268435456	; 0x10000000
    2cc0:	31510000 	cmpcc	r1, r0
    2cc4:	31a01201 	lslcc	r1, r1, #4
    2cc8:	32822004 	addcc	r2, r2, #4
    2ccc:	3afffffa 	bcc	2cbc <__umodsi3+0x20>
    2cd0:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    2cd4:	31510000 	cmpcc	r1, r0
    2cd8:	31a01081 	lslcc	r1, r1, #1
    2cdc:	32822001 	addcc	r2, r2, #1
    2ce0:	3afffffa 	bcc	2cd0 <__umodsi3+0x34>
    2ce4:	e2522003 	subs	r2, r2, #3
    2ce8:	ba00000e 	blt	2d28 <__umodsi3+0x8c>
    2cec:	e1500001 	cmp	r0, r1
    2cf0:	20400001 	subcs	r0, r0, r1
    2cf4:	e15000a1 	cmp	r0, r1, lsr #1
    2cf8:	204000a1 	subcs	r0, r0, r1, lsr #1
    2cfc:	e1500121 	cmp	r0, r1, lsr #2
    2d00:	20400121 	subcs	r0, r0, r1, lsr #2
    2d04:	e15001a1 	cmp	r0, r1, lsr #3
    2d08:	204001a1 	subcs	r0, r0, r1, lsr #3
    2d0c:	e3500001 	cmp	r0, #1
    2d10:	e1a01221 	lsr	r1, r1, #4
    2d14:	a2522004 	subsge	r2, r2, #4
    2d18:	aafffff3 	bge	2cec <__umodsi3+0x50>
    2d1c:	e3120003 	tst	r2, #3
    2d20:	13300000 	teqne	r0, #0
    2d24:	0a00000a 	beq	2d54 <__umodsi3+0xb8>
    2d28:	e3720002 	cmn	r2, #2
    2d2c:	ba000006 	blt	2d4c <__umodsi3+0xb0>
    2d30:	0a000002 	beq	2d40 <__umodsi3+0xa4>
    2d34:	e1500001 	cmp	r0, r1
    2d38:	20400001 	subcs	r0, r0, r1
    2d3c:	e1a010a1 	lsr	r1, r1, #1
    2d40:	e1500001 	cmp	r0, r1
    2d44:	20400001 	subcs	r0, r0, r1
    2d48:	e1a010a1 	lsr	r1, r1, #1
    2d4c:	e1500001 	cmp	r0, r1
    2d50:	20400001 	subcs	r0, r0, r1
    2d54:	e12fff1e 	bx	lr
    2d58:	e52de008 	str	lr, [sp, #-8]!
    2d5c:	eb000001 	bl	2d68 <__div0>
    2d60:	e3a00000 	mov	r0, #0
    2d64:	e49df008 	ldr	pc, [sp], #8

00002d68 <__div0>:
    2d68:	e12fff1e 	bx	lr

00002d6c <memcpy>:
    2d6c:	e352000f 	cmp	r2, #15
    2d70:	e92d0030 	push	{r4, r5}
    2d74:	e1a0c000 	mov	ip, r0
    2d78:	e1a04001 	mov	r4, r1
    2d7c:	9a000027 	bls	2e20 <memcpy+0xb4>
    2d80:	e1813000 	orr	r3, r1, r0
    2d84:	e3130003 	tst	r3, #3
    2d88:	1a000026 	bne	2e28 <memcpy+0xbc>
    2d8c:	e1a0c001 	mov	ip, r1
    2d90:	e1a03000 	mov	r3, r0
    2d94:	e1a04002 	mov	r4, r2
    2d98:	e59c5000 	ldr	r5, [ip]
    2d9c:	e5835000 	str	r5, [r3]
    2da0:	e59c5004 	ldr	r5, [ip, #4]
    2da4:	e5835004 	str	r5, [r3, #4]
    2da8:	e59c5008 	ldr	r5, [ip, #8]
    2dac:	e5835008 	str	r5, [r3, #8]
    2db0:	e2444010 	sub	r4, r4, #16
    2db4:	e59c500c 	ldr	r5, [ip, #12]
    2db8:	e354000f 	cmp	r4, #15
    2dbc:	e583500c 	str	r5, [r3, #12]
    2dc0:	e28cc010 	add	ip, ip, #16
    2dc4:	e2833010 	add	r3, r3, #16
    2dc8:	8afffff2 	bhi	2d98 <memcpy+0x2c>
    2dcc:	e2422010 	sub	r2, r2, #16
    2dd0:	e3c2400f 	bic	r4, r2, #15
    2dd4:	e202200f 	and	r2, r2, #15
    2dd8:	e2844010 	add	r4, r4, #16
    2ddc:	e3520003 	cmp	r2, #3
    2de0:	e080c004 	add	ip, r0, r4
    2de4:	e0814004 	add	r4, r1, r4
    2de8:	9a00000c 	bls	2e20 <memcpy+0xb4>
    2dec:	e3a03000 	mov	r3, #0
    2df0:	e7941003 	ldr	r1, [r4, r3]
    2df4:	e78c1003 	str	r1, [ip, r3]
    2df8:	e2833004 	add	r3, r3, #4
    2dfc:	e0631002 	rsb	r1, r3, r2
    2e00:	e3510003 	cmp	r1, #3
    2e04:	8afffff9 	bhi	2df0 <memcpy+0x84>
    2e08:	e2422004 	sub	r2, r2, #4
    2e0c:	e3c23003 	bic	r3, r2, #3
    2e10:	e2833004 	add	r3, r3, #4
    2e14:	e08cc003 	add	ip, ip, r3
    2e18:	e0844003 	add	r4, r4, r3
    2e1c:	e2022003 	and	r2, r2, #3
    2e20:	e3520000 	cmp	r2, #0
    2e24:	0a000005 	beq	2e40 <memcpy+0xd4>
    2e28:	e3a03000 	mov	r3, #0
    2e2c:	e7d41003 	ldrb	r1, [r4, r3]
    2e30:	e7cc1003 	strb	r1, [ip, r3]
    2e34:	e2833001 	add	r3, r3, #1
    2e38:	e1530002 	cmp	r3, r2
    2e3c:	1afffffa 	bne	2e2c <memcpy+0xc0>
    2e40:	e8bd0030 	pop	{r4, r5}
    2e44:	e12fff1e 	bx	lr

00002e48 <abDescriptors>:
    2e48:	02000112 40000000 0003ffff 02010100     .......@........
    2e58:	02090103 01010020 0932c000 02000004     .... .....2.....
    2e68:	00500608 02850507 07000040 40020205     ..P.....@......@
    2e78:	03040000 030e0409 0050004c 00550043     ........L.P.C.U.
    2e88:	00420053 00500312 006f0072 00750064     S.B...P.r.o.d.u.
    2e98:	00740063 031a0058 00450044 00440041     c.t.X...D.E.A.D.
    2ea8:	00300043 00450044 00410043 00450046     C.0.D.E.C.A.F.E.
    2eb8:	00000000                                ....

00002ebc <__FUNCTION__.1712>:
    2ebc:	4243534d 7542746f 754f6b6c 00000074     MSCBotBulkOut...

00002ecc <__FUNCTION__.1725>:
    2ecc:	4243534d 7542746f 6e496b6c 00000000     MSCBotBulkIn....

00002edc <aiCDBLen.1568>:
    2edc:	000a0a06 00000c10                       ........

00002ee4 <abSense>:
    2ee4:	00ff0070 0a000000 00000000 0000ffff     p...............
    2ef4:	00000000                                ....

00002ef8 <abInquiry>:
    2ef8:	02058000 0000001f 5543504c 20204253     ........LPCUSB  
    2f08:	7373614d 6f747320 65676172 20202020     Mass storage    
    2f18:	20312e30                                0.1 

00002f1c <__FUNCTION__.1347>:
    2f1c:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    2f2c:	6148746e 656c646e 00000072              ntHandler...

00002f38 <__FUNCTION__.1330>:
    2f38:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    2f48:	6e617254 72656673 00000000              Transfer....

00002f54 <__FUNCTION__.1337>:
    2f54:	52425355 73696765 52726574 65757165     USBRegisterReque
    2f64:	61487473 656c646e 00000072              stHandler...

00002f70 <__FUNCTION__.1326>:
    2f70:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    2f80:	00000000                                ....

00002f84 <__FUNCTION__.1340>:
    2f84:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    2f94:	006e6f69 6c756e28 4900296c 6c61766e     ion.(null).Inval
    2fa4:	69206469 25207864 49000a58 6c61766e     id idx %X..Inval
    2fb4:	76206469 25206c61 55000a58 6e61686e     id val %X..Unhan
    2fc4:	64656c64 616c6320 49007373 6974696e     dled class.Initi
    2fd4:	73696c61 20676e69 20425355 63617473     alising USB stac
    2fe4:	7453006b 69747261 5520676e 63204253     k.Starting USB c
    2ff4:	756d6d6f 6163696e 6e6f6974 57534300     ommunication.CSW
    3004:	7473203a 73757461 2c78253d 73657220     : status=%x, res
    3014:	65756469 0a64253d 61747300 6e696c6c     idue=%d..stallin
    3024:	49442067 4f42004e 65722054 20746573     g DIN.BOT reset 
    3034:	73206e69 65746174 0a642520 766e4900     in state %d..Inv
    3044:	64696c61 6e656c20 20687467 29642528     alid length (%d)
    3054:	6e49000a 696c6176 69732064 74616e67     ..Invalid signat
    3064:	20657275 000a7825 61766e49 2064696c     ure %x..Invalid 
    3074:	204e554c 000a6425 61766e49 2064696c     LUN %d..Invalid 
    3084:	6c204243 25206e65 48000a64 2074736f     CB len %d..Host 
    3094:	20646e61 69766564 64206563 67617369     and device disag
    30a4:	20656572 64206e6f 63657269 6e6f6974     ree on direction
    30b4:	67654e00 76697461 65722065 75646973     .Negative residu
    30c4:	74730065 696c6c61 4420676e 0054554f     e.stalling DOUT.
    30d4:	73616850 72652065 20726f72 73206e69     Phase error in s
    30e4:	65746174 2c642520 20642520 65747962     tate %d, %d byte
    30f4:	49000a73 6c61766e 73206469 65746174     s..Invalid state
    3104:	0a642520 73410a00 74726573 206e6f69      %d...Assertion 
    3114:	27732527 69616620 2064656c 25206e69     '%s' failed in %
    3124:	73253a73 21642523 4146000a 0045534c     s:%s#%d!..FALSE.
    3134:	5f63736d 2e746f62 42430063 6c203a57     msc_bot.c.CBW: l
    3144:	253d6e65 66202c64 7367616c 2c78253d     en=%d, flags=%x,
    3154:	646d6320 2c78253d 646d6320 3d6e656c      cmd=%x, cmdlen=
    3164:	000a6425 61766e49 2064696c 20424443     %d..Invalid CDB 
    3174:	206e656c 70786528 65746365 64252064     len (expected %d
    3184:	000a2129 54534554 494e5520 45522054     )!..TEST UNIT RE
    3194:	00594441 55514552 20545345 534e4553     ADY.REQUEST SENS
    31a4:	25282045 29583630 4f46000a 54414d52     E (%06X)..FORMAT
    31b4:	494e5520 30252054 000a5832 55514e49      UNIT %02X..INQU
    31c4:	00595249 44414552 50414320 54494341     IRY.READ CAPACIT
    31d4:	45520059 30314441 424c202c 64253d41     Y.READ10, LBA=%d
    31e4:	656c202c 64253d6e 5257000a 31455449     , len=%d..WRITE1
    31f4:	4c202c30 253d4142 6c202c64 253d6e65     0, LBA=%d, len=%
    3204:	56000a64 46495245 2c303159 41424c20     d..VERIFY10, LBA
    3214:	2c64253d 6e656c20 0a64253d 54594200     =%d, len=%d..BYT
    3224:	204b4843 20746f6e 70707573 6574726f     CHK not supporte
    3234:	6e550064 646e6168 2064656c 49534353     d.Unhandled SCSI
    3244:	2000203a 58323025 494e5500 4f4e2054     : . %02X.UNIT NO
    3254:	45522054 21594441 6f6c4200 65446b63     T READY!.BlockDe
    3264:	61655276 61662064 64656c69 6f6c4200     vRead failed.Blo
    3274:	65446b63 69725776 66206574 656c6961     ckDevWrite faile
    3284:	6e490064 696c6176 53432064 74732044     d.Invalid CSD st
    3294:	74637572 20657275 29642528 43000a21     ructure (%d)!..C
    32a4:	20647261 79737562 78302820 58323025     ard busy (0x%02X
    32b4:	000a2129 5f444d43 444e4553 5f504f5f     )!..CMD_SEND_OP_
    32c4:	444e4f43 69616620 0064656c 65707845     COND failed.Expe
    32d4:	64657463 61747320 62207472 6b636f6c     cted start block
    32e4:	6b6f7420 202c6e65 20746f67 69205825      token, got %X i
    32f4:	6574736e 0a216461 444d4300 4145525f     nstead!..CMD_REA
    3304:	49535f44 454c474e 4f4c425f 66204b43     D_SINGLE_BLOCK f
    3314:	656c6961 30282064 32302578 0a212958     ailed (0x%02X)!.
    3324:	52445300 44646165 54617461 6e656b6f     .SDReadDataToken
    3334:	69616620 2164656c 444d4300 4952575f      failed!.CMD_WRI
    3344:	425f4554 4b434f4c 69616620 2064656c     TE_BLOCK failed 
    3354:	25783028 29583230 52000a21 69656365     (0x%02X)!..Recei
    3364:	20646576 61746164 73657220 736e6f70     ved data respons
    3374:	72652065 20726f72 25783028 29583230     e error (0x%02X)
    3384:	53000a21 69725744 61446574 6f546174     !..SDWriteDataTo
    3394:	206e656b 6c696166 00216465 5f444d43     ken failed!.CMD_
    33a4:	444e4553 4453435f 69616620 2064656c     SEND_CSD failed 
    33b4:	25783028 29583230 43000a21 535f444d     (0x%02X)!..CMD_S
    33c4:	5f444e45 20444943 6c696166 28206465     END_CID failed (
    33d4:	30257830 21295832 4d43000a 45525f44     0x%02X)!..CMD_RE
    33e4:	4f5f4441 66205243 656c6961 30282064     AD_OCR failed (0
    33f4:	32302578 0a212958 444d4300 5f4f475f     x%02X)!..CMD_GO_
    3404:	454c4449 4154535f 66204554 656c6961     IDLE_STATE faile
    3414:	30282064 32302578 0a212958 444d4300     d (0x%02X)!..CMD
    3424:	61642038 30206174 38302578 53000a58     8 data 0x%08X..S
    3434:	6e655344 43704f64 20646e6f 6c696166     DSendOpCond fail
    3444:	00216465 64616552 2052434f 6c696166     ed!.ReadOCR fail
    3454:	00216465 666e6f43 72756769 53206465     ed!.Configured S
    3464:	20304950 20726f66 6b206425 000a7a48     PI0 for %d kHz..
    3474:	3c786469 75003233 77686273 63706c5f     idx<32.usbhw_lpc
    3484:	5200632e 73696765 65726574 61682064     .c.Registered ha
    3494:	656c646e 6f662072 50452072 25783020     ndler for EP 0x%
    34a4:	52000a78 73696765 65726574 61682064     x..Registered ha
    34b4:	656c646e 6f662072 65642072 65636976     ndler for device
    34c4:	61747320 00737574 69676552 72657473      status.Register
    34d4:	68206465 6c646e61 66207265 6620726f     ed handler for f
    34e4:	656d6172 41545300 6f204c4c 005b206e     rame.STALL on [.
    34f4:	32302520 205d0078 74617473 0a78253d      %02x.] stat=%x.
    3504:	206f4e00 646e6168 2072656c 20726f66     .No handler for 
    3514:	74716572 20657079 000a6425 2553003f     reqtype %d..?.S%
    3524:	485f0078 6c646e61 71655265 74736575     x._HandleRequest
    3534:	61662031 64656c69 61485f00 656c646e     1 failed._Handle
    3544:	75716552 32747365 69616620 0064656c     Request2 failed.
    3554:	63627375 72746e6f 632e6c6f 79546900     usbcontrol.c.iTy
    3564:	3e206570 0030203d 70795469 203c2065     pe >= 0.iType < 
    3574:	61700034 73654462 70697263 203d2120     4.pabDescrip != 
    3584:	4c4c554e 62737500 72647473 632e7165     NULL.usbstdreq.c
    3594:	73654400 78252063 746f6e20 756f6620     .Desc %x not fou
    35a4:	0a21646e 78254400 76654400 20656369     nd!..D%x.Device 
    35b4:	20716572 6e206425 6920746f 656c706d     req %d not imple
    35c4:	746e656d 000a6465 656c6c49 206c6167     mented..Illegal 
    35d4:	69766564 72206563 25207165 49000a64     device req %d..I
    35e4:	67656c6c 69206c61 7265746e 65636166     llegal interface
    35f4:	71657220 0a642520 20504500 20716572      req %d..EP req 
    3604:	6e206425 6920746f 656c706d 746e656d     %d not implement
    3614:	000a6465 656c6c49 206c6167 72205045     ed..Illegal EP r
    3624:	25207165 0a000a64 00000021                       eq %d...!.
