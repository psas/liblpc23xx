
isoc_io_dma_sample.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_startup>:
       0:	e59ff018 	ldr	pc, [pc, #24]	; 20 <Reset_Addr>
       4:	e59ff018 	ldr	pc, [pc, #24]	; 24 <Undef_Addr>
       8:	e59ff018 	ldr	pc, [pc, #24]	; 28 <SWI_Addr>
       c:	e59ff018 	ldr	pc, [pc, #24]	; 2c <PAbt_Addr>
      10:	e59ff018 	ldr	pc, [pc, #24]	; 30 <DAbt_Addr>
      14:	e1a00000 	nop			; (mov r0, r0)
      18:	e51ff120 	ldr	pc, [pc, #-288]	; ffffff00 <outputIsocFrameArray+0x802ffa00>
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
      bc:	ea00025a 	b	a2c <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	00002006 	.word	0x00002006
      c8:	40000200 	.word	0x40000200
      cc:	40000202 	.word	0x40000202
      d0:	40000204 	.word	0x40000204
      d4:	400002b8 	.word	0x400002b8

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
     410:	eb000606 	bl	1c30 <__umodsi3>
     414:	e3500009 	cmp	r0, #9
     418:	c59d3000 	ldrgt	r3, [sp]
     41c:	c0800003 	addgt	r0, r0, r3
     420:	e2800030 	add	r0, r0, #48	; 0x30
     424:	e5690001 	strb	r0, [r9, #-1]!
     428:	e1a01007 	mov	r1, r7
     42c:	e1a00008 	mov	r0, r8
     430:	eb0005b8 	bl	1b18 <__aeabi_uidiv>
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
     684:	00001de8 	.word	0x00001de8

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
     7b4:	e3a00001 	mov	r0, #1
     7b8:	e12fff1e 	bx	lr

000007bc <USBDevIntHandler>:
     7bc:	e20000ff 	and	r0, r0, #255	; 0xff
     7c0:	e59f302c 	ldr	r3, [pc, #44]	; 7f4 <USBDevIntHandler+0x38>
     7c4:	e3500004 	cmp	r0, #4
     7c8:	e5c30000 	strb	r0, [r3]
     7cc:	0a000004 	beq	7e4 <USBDevIntHandler+0x28>
     7d0:	e3500010 	cmp	r0, #16
     7d4:	0a000002 	beq	7e4 <USBDevIntHandler+0x28>
     7d8:	e3500001 	cmp	r0, #1
     7dc:	05830004 	streq	r0, [r3, #4]
     7e0:	e12fff1e 	bx	lr
     7e4:	e59f3008 	ldr	r3, [pc, #8]	; 7f4 <USBDevIntHandler+0x38>
     7e8:	e3a02000 	mov	r2, #0
     7ec:	e5832004 	str	r2, [r3, #4]
     7f0:	e12fff1e 	bx	lr
     7f4:	40000204 	.word	0x40000204

000007f8 <USBIntHandler>:
     7f8:	e24ee004 	sub	lr, lr, #4
     7fc:	e92d41ff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
     800:	e14f1000 	mrs	r1, SPSR
     804:	e92d0002 	push	{r1}
     808:	eb0001ef 	bl	fcc <USBHwISR>
     80c:	e3a02000 	mov	r2, #0
     810:	e3e03000 	mvn	r3, #0
     814:	e50320ff 	str	r2, [r3, #-255]	; 0xff
     818:	e8bd0002 	pop	{r1}
     81c:	e161f001 	msr	SPSR_c, r1
     820:	e8fd81ff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}^

00000824 <resetDMATransfer>:
     824:	e92d4ff7 	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
     828:	e59db030 	ldr	fp, [sp, #48]	; 0x30
     82c:	e20040ff 	and	r4, r0, #255	; 0xff
     830:	e59d5034 	ldr	r5, [sp, #52]	; 0x34
     834:	e1a00004 	mov	r0, r4
     838:	e1a08001 	mov	r8, r1
     83c:	e1a06002 	mov	r6, r2
     840:	e1a07003 	mov	r7, r3
     844:	e59da038 	ldr	sl, [sp, #56]	; 0x38
     848:	e59d903c 	ldr	r9, [sp, #60]	; 0x3c
     84c:	eb000299 	bl	12b8 <USBDisableDMAForEndpoint>
     850:	e1a0380b 	lsl	r3, fp, #16
     854:	e1a00006 	mov	r0, r6
     858:	e1a01007 	mov	r1, r7
     85c:	e1d520b0 	ldrh	r2, [r5]
     860:	e1a03823 	lsr	r3, r3, #16
     864:	eb0002a7 	bl	1308 <USBInitializeISOCFrameArray>
     868:	e1a07807 	lsl	r7, r7, #16
     86c:	e1d530b0 	ldrh	r3, [r5]
     870:	e1a07827 	lsr	r7, r7, #16
     874:	e0873003 	add	r3, r7, r3
     878:	e1c530b0 	strh	r3, [r5]
     87c:	e1a0380a 	lsl	r3, sl, #16
     880:	e1a00008 	mov	r0, r8
     884:	e1a03823 	lsr	r3, r3, #16
     888:	e3a01000 	mov	r1, #0
     88c:	e3a02001 	mov	r2, #1
     890:	e88d0280 	stm	sp, {r7, r9}
     894:	e58d6008 	str	r6, [sp, #8]
     898:	eb000269 	bl	1244 <USBSetupDMADescriptor>
     89c:	e1a00004 	mov	r0, r4
     8a0:	e59f1014 	ldr	r1, [pc, #20]	; 8bc <resetDMATransfer+0x98>
     8a4:	e1a02008 	mov	r2, r8
     8a8:	eb0002a9 	bl	1354 <USBSetHeadDDForDMA>
     8ac:	e1a00004 	mov	r0, r4
     8b0:	e28dd00c 	add	sp, sp, #12
     8b4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     8b8:	ea000288 	b	12e0 <USBEnableDMAForEndpoint>
     8bc:	7fd00000 	.word	0x7fd00000

000008c0 <USBFrameHandler>:
     8c0:	e92d400f 	push	{r0, r1, r2, r3, lr}
     8c4:	e59f3148 	ldr	r3, [pc, #328]	; a14 <USBFrameHandler+0x154>
     8c8:	e5932004 	ldr	r2, [r3, #4]
     8cc:	e3520000 	cmp	r2, #0
     8d0:	0a00004e 	beq	a10 <USBFrameHandler+0x150>
     8d4:	e5932008 	ldr	r2, [r3, #8]
     8d8:	e3520efa 	cmp	r2, #4000	; 0xfa0
     8dc:	b2822001 	addlt	r2, r2, #1
     8e0:	b5832008 	strlt	r2, [r3, #8]
     8e4:	ba000049 	blt	a10 <USBFrameHandler+0x150>
     8e8:	e59f2128 	ldr	r2, [pc, #296]	; a18 <USBFrameHandler+0x158>
     8ec:	e592208c 	ldr	r2, [r2, #140]	; 0x8c
     8f0:	e1a020a2 	lsr	r2, r2, #1
     8f4:	e202200f 	and	r2, r2, #15
     8f8:	e3520002 	cmp	r2, #2
     8fc:	0a000002 	beq	90c <USBFrameHandler+0x4c>
     900:	e593300c 	ldr	r3, [r3, #12]
     904:	e3530000 	cmp	r3, #0
     908:	1a000017 	bne	96c <USBFrameHandler+0xac>
     90c:	e59f3100 	ldr	r3, [pc, #256]	; a14 <USBFrameHandler+0x154>
     910:	e593200c 	ldr	r2, [r3, #12]
     914:	e3520000 	cmp	r2, #0
     918:	02822001 	addeq	r2, r2, #1
     91c:	0583200c 	streq	r2, [r3, #12]
     920:	e59f20ec 	ldr	r2, [pc, #236]	; a14 <USBFrameHandler+0x154>
     924:	e5923010 	ldr	r3, [r2, #16]
     928:	e2833001 	add	r3, r3, #1
     92c:	e5823010 	str	r3, [r2, #16]
     930:	e59f20e0 	ldr	r2, [pc, #224]	; a18 <USBFrameHandler+0x158>
     934:	e5823094 	str	r3, [r2, #148]	; 0x94
     938:	e3a03004 	mov	r3, #4
     93c:	e58d3000 	str	r3, [sp]
     940:	e59f30d4 	ldr	r3, [pc, #212]	; a1c <USBFrameHandler+0x15c>
     944:	e2821094 	add	r1, r2, #148	; 0x94
     948:	e58d3004 	str	r3, [sp, #4]
     94c:	e3a03080 	mov	r3, #128	; 0x80
     950:	e58d3008 	str	r3, [sp, #8]
     954:	e58d100c 	str	r1, [sp, #12]
     958:	e3a00083 	mov	r0, #131	; 0x83
     95c:	e0821003 	add	r1, r2, r3
     960:	e2822fa5 	add	r2, r2, #660	; 0x294
     964:	e3a03001 	mov	r3, #1
     968:	ebffffad 	bl	824 <resetDMATransfer>
     96c:	e59f30a4 	ldr	r3, [pc, #164]	; a18 <USBFrameHandler+0x158>
     970:	e59332b0 	ldr	r3, [r3, #688]	; 0x2b0
     974:	e1a030a3 	lsr	r3, r3, #1
     978:	e203300f 	and	r3, r3, #15
     97c:	e3530002 	cmp	r3, #2
     980:	0a000003 	beq	994 <USBFrameHandler+0xd4>
     984:	e59f3088 	ldr	r3, [pc, #136]	; a14 <USBFrameHandler+0x154>
     988:	e5933014 	ldr	r3, [r3, #20]
     98c:	e3530000 	cmp	r3, #0
     990:	1a00001e 	bne	a10 <USBFrameHandler+0x150>
     994:	e59f3078 	ldr	r3, [pc, #120]	; a14 <USBFrameHandler+0x154>
     998:	e5932014 	ldr	r2, [r3, #20]
     99c:	e3520000 	cmp	r2, #0
     9a0:	02822001 	addeq	r2, r2, #1
     9a4:	05832014 	streq	r2, [r3, #20]
     9a8:	0a000008 	beq	9d0 <USBFrameHandler+0x110>
     9ac:	e59f3064 	ldr	r3, [pc, #100]	; a18 <USBFrameHandler+0x158>
     9b0:	e5d33300 	ldrb	r3, [r3, #768]	; 0x300
     9b4:	e3530000 	cmp	r3, #0
     9b8:	159f3060 	ldrne	r3, [pc, #96]	; a20 <USBFrameHandler+0x160>
     9bc:	059f305c 	ldreq	r3, [pc, #92]	; a20 <USBFrameHandler+0x160>
     9c0:	13a02b01 	movne	r2, #1024	; 0x400
     9c4:	03a02b01 	moveq	r2, #1024	; 0x400
     9c8:	15832004 	strne	r2, [r3, #4]
     9cc:	0583200c 	streq	r2, [r3, #12]
     9d0:	e59f303c 	ldr	r3, [pc, #60]	; a14 <USBFrameHandler+0x154>
     9d4:	e5932018 	ldr	r2, [r3, #24]
     9d8:	e2822001 	add	r2, r2, #1
     9dc:	e5832018 	str	r2, [r3, #24]
     9e0:	e59f2034 	ldr	r2, [pc, #52]	; a1c <USBFrameHandler+0x15c>
     9e4:	e58d2004 	str	r2, [sp, #4]
     9e8:	e59f2034 	ldr	r2, [pc, #52]	; a24 <USBFrameHandler+0x164>
     9ec:	e3a03080 	mov	r3, #128	; 0x80
     9f0:	e58d3000 	str	r3, [sp]
     9f4:	e58d3008 	str	r3, [sp, #8]
     9f8:	e58d200c 	str	r2, [sp, #12]
     9fc:	e3a00006 	mov	r0, #6
     a00:	e59f1020 	ldr	r1, [pc, #32]	; a28 <USBFrameHandler+0x168>
     a04:	e2822c02 	add	r2, r2, #512	; 0x200
     a08:	e3a03004 	mov	r3, #4
     a0c:	ebffff84 	bl	824 <resetDMATransfer>
     a10:	e8bd800f 	pop	{r0, r1, r2, r3, pc}
     a14:	40000204 	.word	0x40000204
     a18:	7fd00000 	.word	0x7fd00000
     a1c:	40000200 	.word	0x40000200
     a20:	e0028000 	.word	0xe0028000
     a24:	7fd00300 	.word	0x7fd00300
     a28:	7fd002a4 	.word	0x7fd002a4

00000a2c <main>:
     a2c:	e92d4070 	push	{r4, r5, r6, lr}
     a30:	e59f40e4 	ldr	r4, [pc, #228]	; b1c <main+0xf0>
     a34:	e5943008 	ldr	r3, [r4, #8]
     a38:	e3833b01 	orr	r3, r3, #1024	; 0x400
     a3c:	e5843008 	str	r3, [r4, #8]
     a40:	e5943008 	ldr	r3, [r4, #8]
     a44:	e3833b02 	orr	r3, r3, #2048	; 0x800
     a48:	e5843008 	str	r3, [r4, #8]
     a4c:	ebfffdac 	bl	104 <HalSysInit>
     a50:	e3a00027 	mov	r0, #39	; 0x27
     a54:	ebffff20 	bl	6dc <ConsoleInit>
     a58:	e59f00c0 	ldr	r0, [pc, #192]	; b20 <main+0xf4>
     a5c:	ebffff49 	bl	788 <puts>
     a60:	eb000411 	bl	1aac <USBInit>
     a64:	e59f00b8 	ldr	r0, [pc, #184]	; b24 <main+0xf8>
     a68:	eb00030d 	bl	16a4 <USBRegisterDescriptors>
     a6c:	e59f20b4 	ldr	r2, [pc, #180]	; b28 <main+0xfc>
     a70:	e3a00001 	mov	r0, #1
     a74:	e59f10b0 	ldr	r1, [pc, #176]	; b2c <main+0x100>
     a78:	eb0002e9 	bl	1624 <USBRegisterRequestHandler>
     a7c:	e3a01000 	mov	r1, #0
     a80:	e3a00081 	mov	r0, #129	; 0x81
     a84:	eb00008d 	bl	cc0 <USBHwRegisterEPIntHandler>
     a88:	e59f00a0 	ldr	r0, [pc, #160]	; b30 <main+0x104>
     a8c:	eb0000ad 	bl	d48 <USBHwRegisterFrameHandler>
     a90:	e59f009c 	ldr	r0, [pc, #156]	; b34 <main+0x108>
     a94:	eb0000a0 	bl	d1c <USBHwRegisterDevIntHandler>
     a98:	e59f0098 	ldr	r0, [pc, #152]	; b38 <main+0x10c>
     a9c:	e3a05000 	mov	r5, #0
     aa0:	e5c05094 	strb	r5, [r0, #148]	; 0x94
     aa4:	eb000230 	bl	136c <USBInitializeUSBDMA>
     aa8:	e3a00083 	mov	r0, #131	; 0x83
     aac:	eb00020b 	bl	12e0 <USBEnableDMAForEndpoint>
     ab0:	e59f0084 	ldr	r0, [pc, #132]	; b3c <main+0x110>
     ab4:	ebffff33 	bl	788 <puts>
     ab8:	e59f2080 	ldr	r2, [pc, #128]	; b40 <main+0x114>
     abc:	e3e03000 	mvn	r3, #0
     ac0:	e3a06001 	mov	r6, #1
     ac4:	e5036da7 	str	r6, [r3, #-3495]	; 0xda7
     ac8:	e5032ea7 	str	r2, [r3, #-3751]	; 0xea7
     acc:	e5132ff3 	ldr	r2, [r3, #-4083]	; 0xff3
     ad0:	e3c22501 	bic	r2, r2, #4194304	; 0x400000
     ad4:	e5032ff3 	str	r2, [r3, #-4083]	; 0xff3
     ad8:	e5132fef 	ldr	r2, [r3, #-4079]	; 0xfef
     adc:	e3822501 	orr	r2, r2, #4194304	; 0x400000
     ae0:	e5032fef 	str	r2, [r3, #-4079]	; 0xfef
     ae4:	eb000023 	bl	b78 <enableIRQ>
     ae8:	e1a00006 	mov	r0, r6
     aec:	eb0000a5 	bl	d88 <USBHwConnect>
     af0:	e59f104c 	ldr	r1, [pc, #76]	; b44 <main+0x118>
     af4:	e59f204c 	ldr	r2, [pc, #76]	; b48 <main+0x11c>
     af8:	e3a03b02 	mov	r3, #2048	; 0x800
     afc:	e2855001 	add	r5, r5, #1
     b00:	e1550001 	cmp	r5, r1
     b04:	05843004 	streq	r3, [r4, #4]
     b08:	0afffffb 	beq	afc <main+0xd0>
     b0c:	e1550002 	cmp	r5, r2
     b10:	c584300c 	strgt	r3, [r4, #12]
     b14:	c3a05000 	movgt	r5, #0
     b18:	eafffff7 	b	afc <main+0xd0>
     b1c:	e0028000 	.word	0xe0028000
     b20:	00001def 	.word	0x00001def
     b24:	00001d00 	.word	0x00001d00
     b28:	40000220 	.word	0x40000220
     b2c:	000007b4 	.word	0x000007b4
     b30:	000008c0 	.word	0x000008c0
     b34:	000007bc 	.word	0x000007bc
     b38:	7fd00000 	.word	0x7fd00000
     b3c:	00001e06 	.word	0x00001e06
     b40:	000007f8 	.word	0x000007f8
     b44:	00030d40 	.word	0x00030d40
     b48:	00061a7f 	.word	0x00061a7f

00000b4c <disableIRQ>:
     b4c:	e10f0000 	mrs	r0, CPSR
     b50:	e3803080 	orr	r3, r0, #128	; 0x80
     b54:	e129f003 	msr	CPSR_fc, r3
     b58:	e12fff1e 	bx	lr

00000b5c <restoreIRQ>:
     b5c:	e10f3000 	mrs	r3, CPSR
     b60:	e3c32080 	bic	r2, r3, #128	; 0x80
     b64:	e2000080 	and	r0, r0, #128	; 0x80
     b68:	e1820000 	orr	r0, r2, r0
     b6c:	e129f000 	msr	CPSR_fc, r0
     b70:	e1a00003 	mov	r0, r3
     b74:	e12fff1e 	bx	lr

00000b78 <enableIRQ>:
     b78:	e10f0000 	mrs	r0, CPSR
     b7c:	e3c03080 	bic	r3, r0, #128	; 0x80
     b80:	e129f003 	msr	CPSR_fc, r3
     b84:	e12fff1e 	bx	lr

00000b88 <disableFIQ>:
     b88:	e10f0000 	mrs	r0, CPSR
     b8c:	e3803040 	orr	r3, r0, #64	; 0x40
     b90:	e129f003 	msr	CPSR_fc, r3
     b94:	e12fff1e 	bx	lr

00000b98 <restoreFIQ>:
     b98:	e10f3000 	mrs	r3, CPSR
     b9c:	e3c32040 	bic	r2, r3, #64	; 0x40
     ba0:	e2000040 	and	r0, r0, #64	; 0x40
     ba4:	e1820000 	orr	r0, r2, r0
     ba8:	e129f000 	msr	CPSR_fc, r0
     bac:	e1a00003 	mov	r0, r3
     bb0:	e12fff1e 	bx	lr

00000bb4 <enableFIQ>:
     bb4:	e10f0000 	mrs	r0, CPSR
     bb8:	e3c03040 	bic	r3, r0, #64	; 0x40
     bbc:	e129f003 	msr	CPSR_fc, r3
     bc0:	e12fff1e 	bx	lr

00000bc4 <Wait4DevInt>:
     bc4:	e59f3018 	ldr	r3, [pc, #24]	; be4 <Wait4DevInt+0x20>
     bc8:	e5132dff 	ldr	r2, [r3, #-3583]	; 0xdff
     bcc:	e0002002 	and	r2, r0, r2
     bd0:	e1520000 	cmp	r2, r0
     bd4:	1afffffb 	bne	bc8 <Wait4DevInt+0x4>
     bd8:	e59f3004 	ldr	r3, [pc, #4]	; be4 <Wait4DevInt+0x20>
     bdc:	e5030df7 	str	r0, [r3, #-3575]	; 0xdf7
     be0:	e12fff1e 	bx	lr
     be4:	ffe0cfff 	.word	0xffe0cfff

00000be8 <USBHwCmd>:
     be8:	e59f3018 	ldr	r3, [pc, #24]	; c08 <USBHwCmd+0x20>
     bec:	e1a00800 	lsl	r0, r0, #16
     bf0:	e3a02030 	mov	r2, #48	; 0x30
     bf4:	e3800c05 	orr	r0, r0, #1280	; 0x500
     bf8:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     bfc:	e5030def 	str	r0, [r3, #-3567]	; 0xdef
     c00:	e3a00010 	mov	r0, #16
     c04:	eaffffee 	b	bc4 <Wait4DevInt>
     c08:	ffe0cfff 	.word	0xffe0cfff

00000c0c <USBHwCmdWrite>:
     c0c:	e92d4010 	push	{r4, lr}
     c10:	e1a04001 	mov	r4, r1
     c14:	ebfffff3 	bl	be8 <USBHwCmd>
     c18:	e1a04804 	lsl	r4, r4, #16
     c1c:	e59f3010 	ldr	r3, [pc, #16]	; c34 <USBHwCmdWrite+0x28>
     c20:	e3844c01 	orr	r4, r4, #256	; 0x100
     c24:	e3a00010 	mov	r0, #16
     c28:	e5034def 	str	r4, [r3, #-3567]	; 0xdef
     c2c:	e8bd4010 	pop	{r4, lr}
     c30:	eaffffe3 	b	bc4 <Wait4DevInt>
     c34:	ffe0cfff 	.word	0xffe0cfff

00000c38 <USBHwCmdRead>:
     c38:	e92d4010 	push	{r4, lr}
     c3c:	e1a04000 	mov	r4, r0
     c40:	e1a04804 	lsl	r4, r4, #16
     c44:	ebffffe7 	bl	be8 <USBHwCmd>
     c48:	e3843c02 	orr	r3, r4, #512	; 0x200
     c4c:	e59f4014 	ldr	r4, [pc, #20]	; c68 <USBHwCmdRead+0x30>
     c50:	e3a00020 	mov	r0, #32
     c54:	e5043def 	str	r3, [r4, #-3567]	; 0xdef
     c58:	ebffffd9 	bl	bc4 <Wait4DevInt>
     c5c:	e5140deb 	ldr	r0, [r4, #-3563]	; 0xdeb
     c60:	e20000ff 	and	r0, r0, #255	; 0xff
     c64:	e8bd8010 	pop	{r4, pc}
     c68:	ffe0cfff 	.word	0xffe0cfff

00000c6c <USBHwEPConfig>:
     c6c:	e20030ff 	and	r3, r0, #255	; 0xff
     c70:	e92d4010 	push	{r4, lr}
     c74:	e1a033a3 	lsr	r3, r3, #7
     c78:	e200400f 	and	r4, r0, #15
     c7c:	e1834084 	orr	r4, r3, r4, lsl #1
     c80:	e59f3034 	ldr	r3, [pc, #52]	; cbc <USBHwEPConfig+0x50>
     c84:	e5132dbb 	ldr	r2, [r3, #-3515]	; 0xdbb
     c88:	e3a00001 	mov	r0, #1
     c8c:	e1822410 	orr	r2, r2, r0, lsl r4
     c90:	e1a01801 	lsl	r1, r1, #16
     c94:	e1a01821 	lsr	r1, r1, #16
     c98:	e5032dbb 	str	r2, [r3, #-3515]	; 0xdbb
     c9c:	e28000ff 	add	r0, r0, #255	; 0xff
     ca0:	e5034db7 	str	r4, [r3, #-3511]	; 0xdb7
     ca4:	e5031db3 	str	r1, [r3, #-3507]	; 0xdb3
     ca8:	ebffffc5 	bl	bc4 <Wait4DevInt>
     cac:	e3840040 	orr	r0, r4, #64	; 0x40
     cb0:	e3a01000 	mov	r1, #0
     cb4:	e8bd4010 	pop	{r4, lr}
     cb8:	eaffffd3 	b	c0c <USBHwCmdWrite>
     cbc:	ffe0cfff 	.word	0xffe0cfff

00000cc0 <USBHwRegisterEPIntHandler>:
     cc0:	e20030ff 	and	r3, r0, #255	; 0xff
     cc4:	e1a023a3 	lsr	r2, r3, #7
     cc8:	e200000f 	and	r0, r0, #15
     ccc:	e1820080 	orr	r0, r2, r0, lsl #1
     cd0:	e59f2038 	ldr	r2, [pc, #56]	; d10 <USBHwRegisterEPIntHandler+0x50>
     cd4:	e1a0c0a0 	lsr	ip, r0, #1
     cd8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     cdc:	e782110c 	str	r1, [r2, ip, lsl #2]
     ce0:	e59f202c 	ldr	r2, [pc, #44]	; d14 <USBHwRegisterEPIntHandler+0x54>
     ce4:	e5121dcb 	ldr	r1, [r2, #-3531]	; 0xdcb
     ce8:	e3a0c001 	mov	ip, #1
     cec:	e181001c 	orr	r0, r1, ip, lsl r0
     cf0:	e5020dcb 	str	r0, [r2, #-3531]	; 0xdcb
     cf4:	e5121dfb 	ldr	r1, [r2, #-3579]	; 0xdfb
     cf8:	e59f0018 	ldr	r0, [pc, #24]	; d18 <USBHwRegisterEPIntHandler+0x58>
     cfc:	e3811004 	orr	r1, r1, #4
     d00:	e5021dfb 	str	r1, [r2, #-3579]	; 0xdfb
     d04:	e1a01003 	mov	r1, r3
     d08:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     d0c:	eafffe5d 	b	688 <printf>
     d10:	40000228 	.word	0x40000228
     d14:	ffe0cfff 	.word	0xffe0cfff
     d18:	00001e59 	.word	0x00001e59

00000d1c <USBHwRegisterDevIntHandler>:
     d1c:	e59f3018 	ldr	r3, [pc, #24]	; d3c <USBHwRegisterDevIntHandler+0x20>
     d20:	e5830040 	str	r0, [r3, #64]	; 0x40
     d24:	e59f3014 	ldr	r3, [pc, #20]	; d40 <USBHwRegisterDevIntHandler+0x24>
     d28:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     d2c:	e59f0010 	ldr	r0, [pc, #16]	; d44 <USBHwRegisterDevIntHandler+0x28>
     d30:	e3822008 	orr	r2, r2, #8
     d34:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     d38:	eafffe92 	b	788 <puts>
     d3c:	40000228 	.word	0x40000228
     d40:	ffe0cfff 	.word	0xffe0cfff
     d44:	00001e79 	.word	0x00001e79

00000d48 <USBHwRegisterFrameHandler>:
     d48:	e59f3018 	ldr	r3, [pc, #24]	; d68 <USBHwRegisterFrameHandler+0x20>
     d4c:	e5830044 	str	r0, [r3, #68]	; 0x44
     d50:	e59f3014 	ldr	r3, [pc, #20]	; d6c <USBHwRegisterFrameHandler+0x24>
     d54:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     d58:	e59f0010 	ldr	r0, [pc, #16]	; d70 <USBHwRegisterFrameHandler+0x28>
     d5c:	e3822001 	orr	r2, r2, #1
     d60:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     d64:	eafffe87 	b	788 <puts>
     d68:	40000228 	.word	0x40000228
     d6c:	ffe0cfff 	.word	0xffe0cfff
     d70:	00001e9e 	.word	0x00001e9e

00000d74 <USBHwSetAddress>:
     d74:	e1e01c80 	mvn	r1, r0, lsl #25
     d78:	e1e01ca1 	mvn	r1, r1, lsr #25
     d7c:	e20110ff 	and	r1, r1, #255	; 0xff
     d80:	e3a000d0 	mov	r0, #208	; 0xd0
     d84:	eaffffa0 	b	c0c <USBHwCmdWrite>

00000d88 <USBHwConnect>:
     d88:	e2501000 	subs	r1, r0, #0
     d8c:	159f3020 	ldrne	r3, [pc, #32]	; db4 <USBHwConnect+0x2c>
     d90:	059f301c 	ldreq	r3, [pc, #28]	; db4 <USBHwConnect+0x2c>
     d94:	13a02901 	movne	r2, #16384	; 0x4000
     d98:	03a02901 	moveq	r2, #16384	; 0x4000
     d9c:	15032fe3 	strne	r2, [r3, #-4067]	; 0xfe3
     da0:	05032fe7 	streq	r2, [r3, #-4071]	; 0xfe7
     da4:	e3a000fe 	mov	r0, #254	; 0xfe
     da8:	e2511000 	subs	r1, r1, #0
     dac:	13a01001 	movne	r1, #1
     db0:	eaffff95 	b	c0c <USBHwCmdWrite>
     db4:	3fffcfff 	.word	0x3fffcfff

00000db8 <USBHwNakIntEnable>:
     db8:	e20010ff 	and	r1, r0, #255	; 0xff
     dbc:	e3a000f3 	mov	r0, #243	; 0xf3
     dc0:	eaffff91 	b	c0c <USBHwCmdWrite>

00000dc4 <USBHwEPGetStatus>:
     dc4:	e20030ff 	and	r3, r0, #255	; 0xff
     dc8:	e1a033a3 	lsr	r3, r3, #7
     dcc:	e200000f 	and	r0, r0, #15
     dd0:	e1830080 	orr	r0, r3, r0, lsl #1
     dd4:	eaffff97 	b	c38 <USBHwCmdRead>

00000dd8 <USBHwEPStall>:
     dd8:	e20030ff 	and	r3, r0, #255	; 0xff
     ddc:	e1a033a3 	lsr	r3, r3, #7
     de0:	e200000f 	and	r0, r0, #15
     de4:	e1830080 	orr	r0, r3, r0, lsl #1
     de8:	e3800040 	orr	r0, r0, #64	; 0x40
     dec:	e2511000 	subs	r1, r1, #0
     df0:	13a01001 	movne	r1, #1
     df4:	eaffff84 	b	c0c <USBHwCmdWrite>

00000df8 <USBHwEPWrite>:
     df8:	e92d4010 	push	{r4, lr}
     dfc:	e1a04002 	mov	r4, r2
     e00:	e20020ff 	and	r2, r0, #255	; 0xff
     e04:	e200300f 	and	r3, r0, #15
     e08:	e1a003a2 	lsr	r0, r2, #7
     e0c:	e1800083 	orr	r0, r0, r3, lsl #1
     e10:	e1a03103 	lsl	r3, r3, #2
     e14:	e3832002 	orr	r2, r3, #2
     e18:	e59f3058 	ldr	r3, [pc, #88]	; e78 <USBHwEPWrite+0x80>
     e1c:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     e20:	e5034ddb 	str	r4, [r3, #-3547]	; 0xddb
     e24:	ea000008 	b	e4c <USBHwEPWrite+0x54>
     e28:	e5512002 	ldrb	r2, [r1, #-2]
     e2c:	e551c001 	ldrb	ip, [r1, #-1]
     e30:	e1a02802 	lsl	r2, r2, #16
     e34:	e1822c0c 	orr	r2, r2, ip, lsl #24
     e38:	e551c004 	ldrb	ip, [r1, #-4]
     e3c:	e182200c 	orr	r2, r2, ip
     e40:	e551c003 	ldrb	ip, [r1, #-3]
     e44:	e182240c 	orr	r2, r2, ip, lsl #8
     e48:	e5032de3 	str	r2, [r3, #-3555]	; 0xde3
     e4c:	e5132dd7 	ldr	r2, [r3, #-3543]	; 0xdd7
     e50:	e2122002 	ands	r2, r2, #2
     e54:	e2811004 	add	r1, r1, #4
     e58:	1afffff2 	bne	e28 <USBHwEPWrite+0x30>
     e5c:	e59f3014 	ldr	r3, [pc, #20]	; e78 <USBHwEPWrite+0x80>
     e60:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     e64:	ebffff5f 	bl	be8 <USBHwCmd>
     e68:	e3a000fa 	mov	r0, #250	; 0xfa
     e6c:	ebffff5d 	bl	be8 <USBHwCmd>
     e70:	e1a00004 	mov	r0, r4
     e74:	e8bd8010 	pop	{r4, pc}
     e78:	ffe0cfff 	.word	0xffe0cfff

00000e7c <USBHwEPRead>:
     e7c:	e200c0ff 	and	ip, r0, #255	; 0xff
     e80:	e200000f 	and	r0, r0, #15
     e84:	e92d4030 	push	{r4, r5, lr}
     e88:	e59f3084 	ldr	r3, [pc, #132]	; f14 <USBHwEPRead+0x98>
     e8c:	e1a04100 	lsl	r4, r0, #2
     e90:	e3844001 	orr	r4, r4, #1
     e94:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
     e98:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
     e9c:	e3140b02 	tst	r4, #2048	; 0x800
     ea0:	0afffffc 	beq	e98 <USBHwEPRead+0x1c>
     ea4:	e3140b01 	tst	r4, #1024	; 0x400
     ea8:	03e04000 	mvneq	r4, #0
     eac:	0a000016 	beq	f0c <USBHwEPRead+0x90>
     eb0:	e1a04b04 	lsl	r4, r4, #22
     eb4:	e3a0e000 	mov	lr, #0
     eb8:	e1a04b24 	lsr	r4, r4, #22
     ebc:	e1a0300e 	mov	r3, lr
     ec0:	e59f504c 	ldr	r5, [pc, #76]	; f14 <USBHwEPRead+0x98>
     ec4:	ea000006 	b	ee4 <USBHwEPRead+0x68>
     ec8:	e3130003 	tst	r3, #3
     ecc:	0515ede7 	ldreq	lr, [r5, #-3559]	; 0xde7
     ed0:	e3510000 	cmp	r1, #0
     ed4:	11530002 	cmpne	r3, r2
     ed8:	b7c1e003 	strblt	lr, [r1, r3]
     edc:	e1a0e42e 	lsr	lr, lr, #8
     ee0:	e2833001 	add	r3, r3, #1
     ee4:	e1530004 	cmp	r3, r4
     ee8:	1afffff6 	bne	ec8 <USBHwEPRead+0x4c>
     eec:	e59f3020 	ldr	r3, [pc, #32]	; f14 <USBHwEPRead+0x98>
     ef0:	e3a02000 	mov	r2, #0
     ef4:	e1a0c3ac 	lsr	ip, ip, #7
     ef8:	e18c0080 	orr	r0, ip, r0, lsl #1
     efc:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     f00:	ebffff38 	bl	be8 <USBHwCmd>
     f04:	e3a000f2 	mov	r0, #242	; 0xf2
     f08:	ebffff36 	bl	be8 <USBHwCmd>
     f0c:	e1a00004 	mov	r0, r4
     f10:	e8bd8030 	pop	{r4, r5, pc}
     f14:	ffe0cfff 	.word	0xffe0cfff

00000f18 <USBHwISOCEPRead>:
     f18:	e200c0ff 	and	ip, r0, #255	; 0xff
     f1c:	e200000f 	and	r0, r0, #15
     f20:	e92d4030 	push	{r4, r5, lr}
     f24:	e59f308c 	ldr	r3, [pc, #140]	; fb8 <USBHwISOCEPRead+0xa0>
     f28:	e1a04100 	lsl	r4, r0, #2
     f2c:	e3844001 	orr	r4, r4, #1
     f30:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
     f34:	e1a00000 	nop			; (mov r0, r0)
     f38:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
     f3c:	e2145b02 	ands	r5, r4, #2048	; 0x800
     f40:	0a000001 	beq	f4c <USBHwISOCEPRead+0x34>
     f44:	e2145b01 	ands	r5, r4, #1024	; 0x400
     f48:	1a000002 	bne	f58 <USBHwISOCEPRead+0x40>
     f4c:	e5035dd7 	str	r5, [r3, #-3543]	; 0xdd7
     f50:	e3e04000 	mvn	r4, #0
     f54:	ea000015 	b	fb0 <USBHwISOCEPRead+0x98>
     f58:	e1a04b04 	lsl	r4, r4, #22
     f5c:	e3a05000 	mov	r5, #0
     f60:	e1a04b24 	lsr	r4, r4, #22
     f64:	e1a0e005 	mov	lr, r5
     f68:	ea000006 	b	f88 <USBHwISOCEPRead+0x70>
     f6c:	e31e0003 	tst	lr, #3
     f70:	05135de7 	ldreq	r5, [r3, #-3559]	; 0xde7
     f74:	e3510000 	cmp	r1, #0
     f78:	115e0002 	cmpne	lr, r2
     f7c:	b7c1500e 	strblt	r5, [r1, lr]
     f80:	e1a05425 	lsr	r5, r5, #8
     f84:	e28ee001 	add	lr, lr, #1
     f88:	e15e0004 	cmp	lr, r4
     f8c:	1afffff6 	bne	f6c <USBHwISOCEPRead+0x54>
     f90:	e59f3020 	ldr	r3, [pc, #32]	; fb8 <USBHwISOCEPRead+0xa0>
     f94:	e3a02000 	mov	r2, #0
     f98:	e1a0c3ac 	lsr	ip, ip, #7
     f9c:	e18c0080 	orr	r0, ip, r0, lsl #1
     fa0:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     fa4:	ebffff0f 	bl	be8 <USBHwCmd>
     fa8:	e3a000f2 	mov	r0, #242	; 0xf2
     fac:	ebffff0d 	bl	be8 <USBHwCmd>
     fb0:	e1a00004 	mov	r0, r4
     fb4:	e8bd8030 	pop	{r4, r5, pc}
     fb8:	ffe0cfff 	.word	0xffe0cfff

00000fbc <USBHwConfigDevice>:
     fbc:	e2501000 	subs	r1, r0, #0
     fc0:	13a01001 	movne	r1, #1
     fc4:	e3a000d8 	mov	r0, #216	; 0xd8
     fc8:	eaffff0f 	b	c0c <USBHwCmdWrite>

00000fcc <USBHwISR>:
     fcc:	e59f3120 	ldr	r3, [pc, #288]	; 10f4 <USBHwISR+0x128>
     fd0:	e3a02002 	mov	r2, #2
     fd4:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
     fd8:	e5032fa7 	str	r2, [r3, #-4007]	; 0xfa7
     fdc:	e59f3114 	ldr	r3, [pc, #276]	; 10f8 <USBHwISR+0x12c>
     fe0:	e5134dff 	ldr	r4, [r3, #-3583]	; 0xdff
     fe4:	e3140001 	tst	r4, #1
     fe8:	0a000009 	beq	1014 <USBHwISR+0x48>
     fec:	e3a02001 	mov	r2, #1
     ff0:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     ff4:	e59f3100 	ldr	r3, [pc, #256]	; 10fc <USBHwISR+0x130>
     ff8:	e5935044 	ldr	r5, [r3, #68]	; 0x44
     ffc:	e3550000 	cmp	r5, #0
    1000:	0a000003 	beq	1014 <USBHwISR+0x48>
    1004:	e3a000f5 	mov	r0, #245	; 0xf5
    1008:	ebffff0a 	bl	c38 <USBHwCmdRead>
    100c:	e1a0e00f 	mov	lr, pc
    1010:	e12fff15 	bx	r5
    1014:	e3140008 	tst	r4, #8
    1018:	0a000011 	beq	1064 <USBHwISR+0x98>
    101c:	e59f30d4 	ldr	r3, [pc, #212]	; 10f8 <USBHwISR+0x12c>
    1020:	e3a02008 	mov	r2, #8
    1024:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    1028:	e3a000fe 	mov	r0, #254	; 0xfe
    102c:	ebffff01 	bl	c38 <USBHwCmdRead>
    1030:	e310001a 	tst	r0, #26
    1034:	0a00000a 	beq	1064 <USBHwISR+0x98>
    1038:	e59f30bc 	ldr	r3, [pc, #188]	; 10fc <USBHwISR+0x130>
    103c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
    1040:	e3530000 	cmp	r3, #0
    1044:	0a000006 	beq	1064 <USBHwISR+0x98>
    1048:	e59f50a4 	ldr	r5, [pc, #164]	; 10f4 <USBHwISR+0x128>
    104c:	e3a06001 	mov	r6, #1
    1050:	e5056fa7 	str	r6, [r5, #-4007]	; 0xfa7
    1054:	e2000015 	and	r0, r0, #21
    1058:	e1a0e00f 	mov	lr, pc
    105c:	e12fff13 	bx	r3
    1060:	e5056fa3 	str	r6, [r5, #-4003]	; 0xfa3
    1064:	e3140004 	tst	r4, #4
    1068:	0a00001d 	beq	10e4 <USBHwISR+0x118>
    106c:	e59f5084 	ldr	r5, [pc, #132]	; 10f8 <USBHwISR+0x12c>
    1070:	e3a06004 	mov	r6, #4
    1074:	e5056df7 	str	r6, [r5, #-3575]	; 0xdf7
    1078:	e59f807c 	ldr	r8, [pc, #124]	; 10fc <USBHwISR+0x130>
    107c:	e59f7070 	ldr	r7, [pc, #112]	; 10f4 <USBHwISR+0x128>
    1080:	e3a04000 	mov	r4, #0
    1084:	e3a0a001 	mov	sl, #1
    1088:	e1a0341a 	lsl	r3, sl, r4
    108c:	e5152dcf 	ldr	r2, [r5, #-3535]	; 0xdcf
    1090:	e1130002 	tst	r3, r2
    1094:	0a00000f 	beq	10d8 <USBHwISR+0x10c>
    1098:	e5053dc7 	str	r3, [r5, #-3527]	; 0xdc7
    109c:	e3a00020 	mov	r0, #32
    10a0:	ebfffec7 	bl	bc4 <Wait4DevInt>
    10a4:	e1a020c4 	asr	r2, r4, #1
    10a8:	e7983102 	ldr	r3, [r8, r2, lsl #2]
    10ac:	e3530000 	cmp	r3, #0
    10b0:	e5151deb 	ldr	r1, [r5, #-3563]	; 0xdeb
    10b4:	0a000007 	beq	10d8 <USBHwISR+0x10c>
    10b8:	e202200f 	and	r2, r2, #15
    10bc:	e1820384 	orr	r0, r2, r4, lsl #7
    10c0:	e5076fa7 	str	r6, [r7, #-4007]	; 0xfa7
    10c4:	e200008f 	and	r0, r0, #143	; 0x8f
    10c8:	e201101f 	and	r1, r1, #31
    10cc:	e1a0e00f 	mov	lr, pc
    10d0:	e12fff13 	bx	r3
    10d4:	e5076fa3 	str	r6, [r7, #-4003]	; 0xfa3
    10d8:	e2844001 	add	r4, r4, #1
    10dc:	e3540020 	cmp	r4, #32
    10e0:	1affffe8 	bne	1088 <USBHwISR+0xbc>
    10e4:	e59f3008 	ldr	r3, [pc, #8]	; 10f4 <USBHwISR+0x128>
    10e8:	e3a02002 	mov	r2, #2
    10ec:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
    10f0:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
    10f4:	3fffcfff 	.word	0x3fffcfff
    10f8:	ffe0cfff 	.word	0xffe0cfff
    10fc:	40000228 	.word	0x40000228

00001100 <USBHwInit>:
    1100:	e59f312c 	ldr	r3, [pc, #300]	; 1234 <USBHwInit+0x134>
    1104:	e5932004 	ldr	r2, [r3, #4]
    1108:	e3c22103 	bic	r2, r2, #-1073741824	; 0xc0000000
    110c:	e3822101 	orr	r2, r2, #1073741824	; 0x40000000
    1110:	e92d4010 	push	{r4, lr}
    1114:	e5832004 	str	r2, [r3, #4]
    1118:	e593200c 	ldr	r2, [r3, #12]
    111c:	e3c22203 	bic	r2, r2, #805306368	; 0x30000000
    1120:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
    1124:	e583200c 	str	r2, [r3, #12]
    1128:	e5932000 	ldr	r2, [r3]
    112c:	e3c2230f 	bic	r2, r2, #1006632960	; 0x3c000000
    1130:	e3822301 	orr	r2, r2, #67108864	; 0x4000000
    1134:	e5832000 	str	r2, [r3]
    1138:	e59f30f8 	ldr	r3, [pc, #248]	; 1238 <USBHwInit+0x138>
    113c:	e5132fff 	ldr	r2, [r3, #-4095]	; 0xfff
    1140:	e3822901 	orr	r2, r2, #16384	; 0x4000
    1144:	e5032fff 	str	r2, [r3, #-4095]	; 0xfff
    1148:	e3a02901 	mov	r2, #16384	; 0x4000
    114c:	e5032fe7 	str	r2, [r3, #-4071]	; 0xfe7
    1150:	e59f30e4 	ldr	r3, [pc, #228]	; 123c <USBHwInit+0x13c>
    1154:	e59320c4 	ldr	r2, [r3, #196]	; 0xc4
    1158:	e3822102 	orr	r2, r2, #-2147483648	; 0x80000000
    115c:	e58320c4 	str	r2, [r3, #196]	; 0xc4
    1160:	e3a02005 	mov	r2, #5
    1164:	e5832108 	str	r2, [r3, #264]	; 0x108
    1168:	e59f30d0 	ldr	r3, [pc, #208]	; 1240 <USBHwInit+0x140>
    116c:	e2822015 	add	r2, r2, #21
    1170:	e503200b 	str	r2, [r3, #-11]
    1174:	e1a02003 	mov	r2, r3
    1178:	e5121007 	ldr	r1, [r2, #-7]
    117c:	e311001a 	tst	r1, #26
    1180:	e59f30b8 	ldr	r3, [pc, #184]	; 1240 <USBHwInit+0x140>
    1184:	0afffffb 	beq	1178 <USBHwInit+0x78>
    1188:	e3a02003 	mov	r2, #3
    118c:	e5032eef 	str	r2, [r3, #-3823]	; 0xeef
    1190:	e3a04000 	mov	r4, #0
    1194:	e3e02000 	mvn	r2, #0
    1198:	e5034dfb 	str	r4, [r3, #-3579]	; 0xdfb
    119c:	e1a00004 	mov	r0, r4
    11a0:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    11a4:	e5034dd3 	str	r4, [r3, #-3539]	; 0xdd3
    11a8:	e5034dcb 	str	r4, [r3, #-3531]	; 0xdcb
    11ac:	e5032dc7 	str	r2, [r3, #-3527]	; 0xdc7
    11b0:	e5034dbf 	str	r4, [r3, #-3519]	; 0xdbf
    11b4:	ebfffeff 	bl	db8 <USBHwNakIntEnable>
    11b8:	e59f207c 	ldr	r2, [pc, #124]	; 123c <USBHwInit+0x13c>
    11bc:	e59231a0 	ldr	r3, [r2, #416]	; 0x1a0
    11c0:	e59f106c 	ldr	r1, [pc, #108]	; 1234 <USBHwInit+0x134>
    11c4:	e3833001 	orr	r3, r3, #1
    11c8:	e58231a0 	str	r3, [r2, #416]	; 0x1a0
    11cc:	e5814028 	str	r4, [r1, #40]	; 0x28
    11d0:	e59f3060 	ldr	r3, [pc, #96]	; 1238 <USBHwInit+0x138>
    11d4:	e5130fbf 	ldr	r0, [r3, #-4031]	; 0xfbf
    11d8:	e3800001 	orr	r0, r0, #1
    11dc:	e5030fbf 	str	r0, [r3, #-4031]	; 0xfbf
    11e0:	e3a00001 	mov	r0, #1
    11e4:	e5030fa3 	str	r0, [r3, #-4003]	; 0xfa3
    11e8:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
    11ec:	e18cc000 	orr	ip, ip, r0
    11f0:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
    11f4:	e5814028 	str	r4, [r1, #40]	; 0x28
    11f8:	e513cfbf 	ldr	ip, [r3, #-4031]	; 0xfbf
    11fc:	e38cc002 	orr	ip, ip, #2
    1200:	e503cfbf 	str	ip, [r3, #-4031]	; 0xfbf
    1204:	e3a0c002 	mov	ip, #2
    1208:	e503cfa3 	str	ip, [r3, #-4003]	; 0xfa3
    120c:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
    1210:	e18cc000 	orr	ip, ip, r0
    1214:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
    1218:	e5814028 	str	r4, [r1, #40]	; 0x28
    121c:	e5132fbf 	ldr	r2, [r3, #-4031]	; 0xfbf
    1220:	e3822004 	orr	r2, r2, #4
    1224:	e5032fbf 	str	r2, [r3, #-4031]	; 0xfbf
    1228:	e3a02004 	mov	r2, #4
    122c:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
    1230:	e8bd8010 	pop	{r4, pc}
    1234:	e002c000 	.word	0xe002c000
    1238:	3fffcfff 	.word	0x3fffcfff
    123c:	e01fc000 	.word	0xe01fc000
    1240:	ffe0cfff 	.word	0xffe0cfff

00001244 <USBSetupDMADescriptor>:
    1244:	e92d4030 	push	{r4, r5, lr}
    1248:	e3a05000 	mov	r5, #0
    124c:	e5805004 	str	r5, [r0, #4]
    1250:	e5801000 	str	r1, [r0]
    1254:	e5905004 	ldr	r5, [r0, #4]
    1258:	e1a03b03 	lsl	r3, r3, #22
    125c:	e18558a3 	orr	r5, r5, r3, lsr #17
    1260:	e5805004 	str	r5, [r0, #4]
    1264:	e1dd40bc 	ldrh	r4, [sp, #12]
    1268:	e5903004 	ldr	r3, [r0, #4]
    126c:	e1834804 	orr	r4, r3, r4, lsl #16
    1270:	e5804004 	str	r4, [r0, #4]
    1274:	e21220ff 	ands	r2, r2, #255	; 0xff
    1278:	15903004 	ldrne	r3, [r0, #4]
    127c:	13833010 	orrne	r3, r3, #16
    1280:	15803004 	strne	r3, [r0, #4]
    1284:	e3510000 	cmp	r1, #0
    1288:	15903004 	ldrne	r3, [r0, #4]
    128c:	13833004 	orrne	r3, r3, #4
    1290:	15803004 	strne	r3, [r0, #4]
    1294:	e28d3010 	add	r3, sp, #16
    1298:	e8931008 	ldm	r3, {r3, ip}
    129c:	e35c0000 	cmp	ip, #0
    12a0:	13520000 	cmpne	r2, #0
    12a4:	e5803008 	str	r3, [r0, #8]
    12a8:	e3a03000 	mov	r3, #0
    12ac:	1580c010 	strne	ip, [r0, #16]
    12b0:	e580300c 	str	r3, [r0, #12]
    12b4:	e8bd8030 	pop	{r4, r5, pc}

000012b8 <USBDisableDMAForEndpoint>:
    12b8:	e20030ff 	and	r3, r0, #255	; 0xff
    12bc:	e1a033a3 	lsr	r3, r3, #7
    12c0:	e200000f 	and	r0, r0, #15
    12c4:	e1830080 	orr	r0, r3, r0, lsl #1
    12c8:	e3a03001 	mov	r3, #1
    12cc:	e1a00013 	lsl	r0, r3, r0
    12d0:	e59f3004 	ldr	r3, [pc, #4]	; 12dc <USBDisableDMAForEndpoint+0x24>
    12d4:	e5030d73 	str	r0, [r3, #-3443]	; 0xd73
    12d8:	e12fff1e 	bx	lr
    12dc:	ffe0cfff 	.word	0xffe0cfff

000012e0 <USBEnableDMAForEndpoint>:
    12e0:	e20030ff 	and	r3, r0, #255	; 0xff
    12e4:	e1a033a3 	lsr	r3, r3, #7
    12e8:	e200000f 	and	r0, r0, #15
    12ec:	e1830080 	orr	r0, r3, r0, lsl #1
    12f0:	e3a03001 	mov	r3, #1
    12f4:	e1a00013 	lsl	r0, r3, r0
    12f8:	e59f3004 	ldr	r3, [pc, #4]	; 1304 <USBEnableDMAForEndpoint+0x24>
    12fc:	e5030d77 	str	r0, [r3, #-3447]	; 0xd77
    1300:	e12fff1e 	bx	lr
    1304:	ffe0cfff 	.word	0xffe0cfff

00001308 <USBInitializeISOCFrameArray>:
    1308:	e1a03b03 	lsl	r3, r3, #22
    130c:	e1a02802 	lsl	r2, r2, #16
    1310:	e1a03b23 	lsr	r3, r3, #22
    1314:	e92d4010 	push	{r4, lr}
    1318:	e1a02822 	lsr	r2, r2, #16
    131c:	e3a0c000 	mov	ip, #0
    1320:	e3833902 	orr	r3, r3, #32768	; 0x8000
    1324:	ea000004 	b	133c <USBInitializeISOCFrameArray+0x34>
    1328:	e1834804 	orr	r4, r3, r4, lsl #16
    132c:	e780410c 	str	r4, [r0, ip, lsl #2]
    1330:	e28cc001 	add	ip, ip, #1
    1334:	e1a0c80c 	lsl	ip, ip, #16
    1338:	e1a0c82c 	lsr	ip, ip, #16
    133c:	e08c4002 	add	r4, ip, r2
    1340:	e1a04804 	lsl	r4, r4, #16
    1344:	e15c0001 	cmp	ip, r1
    1348:	e1a04824 	lsr	r4, r4, #16
    134c:	3afffff5 	bcc	1328 <USBInitializeISOCFrameArray+0x20>
    1350:	e8bd8010 	pop	{r4, pc}

00001354 <USBSetHeadDDForDMA>:
    1354:	e20030ff 	and	r3, r0, #255	; 0xff
    1358:	e1a033a3 	lsr	r3, r3, #7
    135c:	e200000f 	and	r0, r0, #15
    1360:	e1830080 	orr	r0, r3, r0, lsl #1
    1364:	e7812100 	str	r2, [r1, r0, lsl #2]
    1368:	e12fff1e 	bx	lr

0000136c <USBInitializeUSBDMA>:
    136c:	e3a03000 	mov	r3, #0
    1370:	e1a02003 	mov	r2, r3
    1374:	e7802003 	str	r2, [r0, r3]
    1378:	e2833004 	add	r3, r3, #4
    137c:	e3530080 	cmp	r3, #128	; 0x80
    1380:	1afffffb 	bne	1374 <USBInitializeUSBDMA+0x8>
    1384:	e59f3004 	ldr	r3, [pc, #4]	; 1390 <USBInitializeUSBDMA+0x24>
    1388:	e5030d7f 	str	r0, [r3, #-3455]	; 0xd7f
    138c:	e12fff1e 	bx	lr
    1390:	ffe0cfff 	.word	0xffe0cfff

00001394 <StallControlPipe>:
    1394:	e92d4070 	push	{r4, r5, r6, lr}
    1398:	e3a01001 	mov	r1, #1
    139c:	e1a05000 	mov	r5, r0
    13a0:	e3a00080 	mov	r0, #128	; 0x80
    13a4:	ebfffe8b 	bl	dd8 <USBHwEPStall>
    13a8:	e59f002c 	ldr	r0, [pc, #44]	; 13dc <StallControlPipe+0x48>
    13ac:	ebfffcb5 	bl	688 <printf>
    13b0:	e59f6028 	ldr	r6, [pc, #40]	; 13e0 <StallControlPipe+0x4c>
    13b4:	e59f4028 	ldr	r4, [pc, #40]	; 13e4 <StallControlPipe+0x50>
    13b8:	e4d41001 	ldrb	r1, [r4], #1
    13bc:	e59f0024 	ldr	r0, [pc, #36]	; 13e8 <StallControlPipe+0x54>
    13c0:	ebfffcb0 	bl	688 <printf>
    13c4:	e1540006 	cmp	r4, r6
    13c8:	1afffffa 	bne	13b8 <StallControlPipe+0x24>
    13cc:	e59f0018 	ldr	r0, [pc, #24]	; 13ec <StallControlPipe+0x58>
    13d0:	e1a01005 	mov	r1, r5
    13d4:	e8bd4070 	pop	{r4, r5, r6, lr}
    13d8:	eafffcaa 	b	688 <printf>
    13dc:	00001ebb 	.word	0x00001ebb
    13e0:	40000278 	.word	0x40000278
    13e4:	40000270 	.word	0x40000270
    13e8:	00001ec6 	.word	0x00001ec6
    13ec:	00001ecc 	.word	0x00001ecc

000013f0 <DataIn>:
    13f0:	e92d4030 	push	{r4, r5, lr}
    13f4:	e59f4034 	ldr	r4, [pc, #52]	; 1430 <DataIn+0x40>
    13f8:	e5945008 	ldr	r5, [r4, #8]
    13fc:	e3550040 	cmp	r5, #64	; 0x40
    1400:	a3a05040 	movge	r5, #64	; 0x40
    1404:	e1a02005 	mov	r2, r5
    1408:	e3a00080 	mov	r0, #128	; 0x80
    140c:	e594100c 	ldr	r1, [r4, #12]
    1410:	ebfffe78 	bl	df8 <USBHwEPWrite>
    1414:	e594300c 	ldr	r3, [r4, #12]
    1418:	e0833005 	add	r3, r3, r5
    141c:	e584300c 	str	r3, [r4, #12]
    1420:	e5943008 	ldr	r3, [r4, #8]
    1424:	e0655003 	rsb	r5, r5, r3
    1428:	e5845008 	str	r5, [r4, #8]
    142c:	e8bd8030 	pop	{r4, r5, pc}
    1430:	40000270 	.word	0x40000270

00001434 <_HandleRequest.clone.0>:
    1434:	e92d4010 	push	{r4, lr}
    1438:	e59f003c 	ldr	r0, [pc, #60]	; 147c <_HandleRequest.clone.0+0x48>
    143c:	e5d01000 	ldrb	r1, [r0]
    1440:	e1a012a1 	lsr	r1, r1, #5
    1444:	e2011003 	and	r1, r1, #3
    1448:	e0803101 	add	r3, r0, r1, lsl #2
    144c:	e5934010 	ldr	r4, [r3, #16]
    1450:	e3540000 	cmp	r4, #0
    1454:	1a000003 	bne	1468 <_HandleRequest.clone.0+0x34>
    1458:	e59f0020 	ldr	r0, [pc, #32]	; 1480 <_HandleRequest.clone.0+0x4c>
    145c:	ebfffc89 	bl	688 <printf>
    1460:	e1a00004 	mov	r0, r4
    1464:	e8bd8010 	pop	{r4, pc}
    1468:	e2801020 	add	r1, r0, #32
    146c:	e280200c 	add	r2, r0, #12
    1470:	e1a0e00f 	mov	lr, pc
    1474:	e12fff14 	bx	r4
    1478:	e8bd8010 	pop	{r4, pc}
    147c:	40000270 	.word	0x40000270
    1480:	00001ed7 	.word	0x00001ed7

00001484 <USBHandleControlTransfer>:
    1484:	e21030ff 	ands	r3, r0, #255	; 0xff
    1488:	e92d4031 	push	{r0, r4, r5, lr}
    148c:	e20150ff 	and	r5, r1, #255	; 0xff
    1490:	1a00004a 	bne	15c0 <USBHandleControlTransfer+0x13c>
    1494:	e2110004 	ands	r0, r1, #4
    1498:	e59f415c 	ldr	r4, [pc, #348]	; 15fc <USBHandleControlTransfer+0x178>
    149c:	0a00001e 	beq	151c <USBHandleControlTransfer+0x98>
    14a0:	e1a00003 	mov	r0, r3
    14a4:	e3a02008 	mov	r2, #8
    14a8:	e1a01004 	mov	r1, r4
    14ac:	ebfffe72 	bl	e7c <USBHwEPRead>
    14b0:	e59f0148 	ldr	r0, [pc, #328]	; 1600 <USBHandleControlTransfer+0x17c>
    14b4:	e5d41001 	ldrb	r1, [r4, #1]
    14b8:	ebfffc72 	bl	688 <printf>
    14bc:	e5d42000 	ldrb	r2, [r4]
    14c0:	e1a031a2 	lsr	r3, r2, #3
    14c4:	e203300c 	and	r3, r3, #12
    14c8:	e0843003 	add	r3, r4, r3
    14cc:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    14d0:	e584300c 	str	r3, [r4, #12]
    14d4:	e1d430b6 	ldrh	r3, [r4, #6]
    14d8:	e3530000 	cmp	r3, #0
    14dc:	e5843008 	str	r3, [r4, #8]
    14e0:	e5843020 	str	r3, [r4, #32]
    14e4:	0a000001 	beq	14f0 <USBHandleControlTransfer+0x6c>
    14e8:	e1b023a2 	lsrs	r2, r2, #7
    14ec:	0a000040 	beq	15f4 <USBHandleControlTransfer+0x170>
    14f0:	ebffffcf 	bl	1434 <_HandleRequest.clone.0>
    14f4:	e3500000 	cmp	r0, #0
    14f8:	059f0104 	ldreq	r0, [pc, #260]	; 1604 <USBHandleControlTransfer+0x180>
    14fc:	0a00001f 	beq	1580 <USBHandleControlTransfer+0xfc>
    1500:	e59f30f4 	ldr	r3, [pc, #244]	; 15fc <USBHandleControlTransfer+0x178>
    1504:	e1d310b6 	ldrh	r1, [r3, #6]
    1508:	e5932020 	ldr	r2, [r3, #32]
    150c:	e1510002 	cmp	r1, r2
    1510:	d5831008 	strle	r1, [r3, #8]
    1514:	c5832008 	strgt	r2, [r3, #8]
    1518:	ea00002a 	b	15c8 <USBHandleControlTransfer+0x144>
    151c:	e5942008 	ldr	r2, [r4, #8]
    1520:	e3520000 	cmp	r2, #0
    1524:	da00001a 	ble	1594 <USBHandleControlTransfer+0x110>
    1528:	e594100c 	ldr	r1, [r4, #12]
    152c:	ebfffe52 	bl	e7c <USBHwEPRead>
    1530:	e3500000 	cmp	r0, #0
    1534:	ba000012 	blt	1584 <USBHandleControlTransfer+0x100>
    1538:	e594300c 	ldr	r3, [r4, #12]
    153c:	e0833000 	add	r3, r3, r0
    1540:	e584300c 	str	r3, [r4, #12]
    1544:	e5943008 	ldr	r3, [r4, #8]
    1548:	e0600003 	rsb	r0, r0, r3
    154c:	e3500000 	cmp	r0, #0
    1550:	e5840008 	str	r0, [r4, #8]
    1554:	1a000026 	bne	15f4 <USBHandleControlTransfer+0x170>
    1558:	e5d43000 	ldrb	r3, [r4]
    155c:	e1a031a3 	lsr	r3, r3, #3
    1560:	e203300c 	and	r3, r3, #12
    1564:	e0843003 	add	r3, r4, r3
    1568:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    156c:	e584300c 	str	r3, [r4, #12]
    1570:	ebffffaf 	bl	1434 <_HandleRequest.clone.0>
    1574:	e3500000 	cmp	r0, #0
    1578:	1a000012 	bne	15c8 <USBHandleControlTransfer+0x144>
    157c:	e59f0084 	ldr	r0, [pc, #132]	; 1608 <USBHandleControlTransfer+0x184>
    1580:	ebfffc80 	bl	788 <puts>
    1584:	e1a00005 	mov	r0, r5
    1588:	e28dd004 	add	sp, sp, #4
    158c:	e8bd4030 	pop	{r4, r5, lr}
    1590:	eaffff7f 	b	1394 <StallControlPipe>
    1594:	e1a01000 	mov	r1, r0
    1598:	e1a02000 	mov	r2, r0
    159c:	ebfffe36 	bl	e7c <USBHwEPRead>
    15a0:	e59f3064 	ldr	r3, [pc, #100]	; 160c <USBHandleControlTransfer+0x188>
    15a4:	e59f2064 	ldr	r2, [pc, #100]	; 1610 <USBHandleControlTransfer+0x18c>
    15a8:	e3500000 	cmp	r0, #0
    15ac:	d1a00002 	movle	r0, r2
    15b0:	c1a00003 	movgt	r0, r3
    15b4:	e28dd004 	add	sp, sp, #4
    15b8:	e8bd4030 	pop	{r4, r5, lr}
    15bc:	eafffc31 	b	688 <printf>
    15c0:	e3530080 	cmp	r3, #128	; 0x80
    15c4:	1a000002 	bne	15d4 <USBHandleControlTransfer+0x150>
    15c8:	e28dd004 	add	sp, sp, #4
    15cc:	e8bd4030 	pop	{r4, r5, lr}
    15d0:	eaffff86 	b	13f0 <DataIn>
    15d4:	e3a030d4 	mov	r3, #212	; 0xd4
    15d8:	e58d3000 	str	r3, [sp]
    15dc:	e59f0030 	ldr	r0, [pc, #48]	; 1614 <USBHandleControlTransfer+0x190>
    15e0:	e59f1030 	ldr	r1, [pc, #48]	; 1618 <USBHandleControlTransfer+0x194>
    15e4:	e59f2030 	ldr	r2, [pc, #48]	; 161c <USBHandleControlTransfer+0x198>
    15e8:	e59f3030 	ldr	r3, [pc, #48]	; 1620 <USBHandleControlTransfer+0x19c>
    15ec:	ebfffc25 	bl	688 <printf>
    15f0:	eafffffe 	b	15f0 <USBHandleControlTransfer+0x16c>
    15f4:	e28dd004 	add	sp, sp, #4
    15f8:	e8bd8030 	pop	{r4, r5, pc}
    15fc:	40000270 	.word	0x40000270
    1600:	00001ef4 	.word	0x00001ef4
    1604:	00001ef8 	.word	0x00001ef8
    1608:	00001f0f 	.word	0x00001f0f
    160c:	00001ef2 	.word	0x00001ef2
    1610:	00001e45 	.word	0x00001e45
    1614:	00001e21 	.word	0x00001e21
    1618:	00001f26 	.word	0x00001f26
    161c:	00001f2c 	.word	0x00001f2c
    1620:	00001d88 	.word	0x00001d88

00001624 <USBRegisterRequestHandler>:
    1624:	e92d4001 	push	{r0, lr}
    1628:	e3500000 	cmp	r0, #0
    162c:	aa000007 	bge	1650 <USBRegisterRequestHandler+0x2c>
    1630:	e3a030e2 	mov	r3, #226	; 0xe2
    1634:	e58d3000 	str	r3, [sp]
    1638:	e59f004c 	ldr	r0, [pc, #76]	; 168c <USBRegisterRequestHandler+0x68>
    163c:	e59f104c 	ldr	r1, [pc, #76]	; 1690 <USBRegisterRequestHandler+0x6c>
    1640:	e59f204c 	ldr	r2, [pc, #76]	; 1694 <USBRegisterRequestHandler+0x70>
    1644:	e59f304c 	ldr	r3, [pc, #76]	; 1698 <USBRegisterRequestHandler+0x74>
    1648:	ebfffc0e 	bl	688 <printf>
    164c:	eafffffe 	b	164c <USBRegisterRequestHandler+0x28>
    1650:	e3500003 	cmp	r0, #3
    1654:	da000007 	ble	1678 <USBRegisterRequestHandler+0x54>
    1658:	e3a030e3 	mov	r3, #227	; 0xe3
    165c:	e58d3000 	str	r3, [sp]
    1660:	e59f0024 	ldr	r0, [pc, #36]	; 168c <USBRegisterRequestHandler+0x68>
    1664:	e59f1030 	ldr	r1, [pc, #48]	; 169c <USBRegisterRequestHandler+0x78>
    1668:	e59f2024 	ldr	r2, [pc, #36]	; 1694 <USBRegisterRequestHandler+0x70>
    166c:	e59f3024 	ldr	r3, [pc, #36]	; 1698 <USBRegisterRequestHandler+0x74>
    1670:	ebfffc04 	bl	688 <printf>
    1674:	eafffffe 	b	1674 <USBRegisterRequestHandler+0x50>
    1678:	e59f3020 	ldr	r3, [pc, #32]	; 16a0 <USBRegisterRequestHandler+0x7c>
    167c:	e0830100 	add	r0, r3, r0, lsl #2
    1680:	e5801010 	str	r1, [r0, #16]
    1684:	e5802024 	str	r2, [r0, #36]	; 0x24
    1688:	e8bd8008 	pop	{r3, pc}
    168c:	00001e21 	.word	0x00001e21
    1690:	00001f39 	.word	0x00001f39
    1694:	00001f2c 	.word	0x00001f2c
    1698:	00001da4 	.word	0x00001da4
    169c:	00001f44 	.word	0x00001f44
    16a0:	40000270 	.word	0x40000270

000016a4 <USBRegisterDescriptors>:
    16a4:	e59f3004 	ldr	r3, [pc, #4]	; 16b0 <USBRegisterDescriptors+0xc>
    16a8:	e5830000 	str	r0, [r3]
    16ac:	e12fff1e 	bx	lr
    16b0:	400002a4 	.word	0x400002a4

000016b4 <USBGetDescriptor>:
    16b4:	e59fc09c 	ldr	ip, [pc, #156]	; 1758 <USBGetDescriptor+0xa4>
    16b8:	e59cc000 	ldr	ip, [ip]
    16bc:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    16c0:	e1a00800 	lsl	r0, r0, #16
    16c4:	e35c0000 	cmp	ip, #0
    16c8:	e1a01820 	lsr	r1, r0, #16
    16cc:	11a05c20 	lsrne	r5, r0, #24
    16d0:	120160ff 	andne	r6, r1, #255	; 0xff
    16d4:	13a00000 	movne	r0, #0
    16d8:	1a000017 	bne	173c <USBGetDescriptor+0x88>
    16dc:	e3a0306e 	mov	r3, #110	; 0x6e
    16e0:	e58d3000 	str	r3, [sp]
    16e4:	e59f0070 	ldr	r0, [pc, #112]	; 175c <USBGetDescriptor+0xa8>
    16e8:	e59f1070 	ldr	r1, [pc, #112]	; 1760 <USBGetDescriptor+0xac>
    16ec:	e59f2070 	ldr	r2, [pc, #112]	; 1764 <USBGetDescriptor+0xb0>
    16f0:	e59f3070 	ldr	r3, [pc, #112]	; 1768 <USBGetDescriptor+0xb4>
    16f4:	ebfffbe3 	bl	688 <printf>
    16f8:	eafffffe 	b	16f8 <USBGetDescriptor+0x44>
    16fc:	e5dc7001 	ldrb	r7, [ip, #1]
    1700:	e1570005 	cmp	r7, r5
    1704:	1a00000b 	bne	1738 <USBGetDescriptor+0x84>
    1708:	e1500006 	cmp	r0, r6
    170c:	1a000008 	bne	1734 <USBGetDescriptor+0x80>
    1710:	e583c000 	str	ip, [r3]
    1714:	e3550002 	cmp	r5, #2
    1718:	05dc1003 	ldrbeq	r1, [ip, #3]
    171c:	05dc3002 	ldrbeq	r3, [ip, #2]
    1720:	15dc3000 	ldrbne	r3, [ip]
    1724:	01833401 	orreq	r3, r3, r1, lsl #8
    1728:	e5823000 	str	r3, [r2]
    172c:	e3a00001 	mov	r0, #1
    1730:	ea000007 	b	1754 <USBGetDescriptor+0xa0>
    1734:	e2800001 	add	r0, r0, #1
    1738:	e08cc004 	add	ip, ip, r4
    173c:	e5dc4000 	ldrb	r4, [ip]
    1740:	e3540000 	cmp	r4, #0
    1744:	1affffec 	bne	16fc <USBGetDescriptor+0x48>
    1748:	e59f001c 	ldr	r0, [pc, #28]	; 176c <USBGetDescriptor+0xb8>
    174c:	ebfffbcd 	bl	688 <printf>
    1750:	e1a00004 	mov	r0, r4
    1754:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    1758:	400002a4 	.word	0x400002a4
    175c:	00001e21 	.word	0x00001e21
    1760:	00001f4e 	.word	0x00001f4e
    1764:	00001f61 	.word	0x00001f61
    1768:	00001dc0 	.word	0x00001dc0
    176c:	00001f6d 	.word	0x00001f6d

00001770 <USBHandleStandardRequest>:
    1770:	e59f32e4 	ldr	r3, [pc, #740]	; 1a5c <USBHandleStandardRequest+0x2ec>
    1774:	e5933004 	ldr	r3, [r3, #4]
    1778:	e3530000 	cmp	r3, #0
    177c:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    1780:	e1a04000 	mov	r4, r0
    1784:	e1a05001 	mov	r5, r1
    1788:	e1a06002 	mov	r6, r2
    178c:	0a000003 	beq	17a0 <USBHandleStandardRequest+0x30>
    1790:	e1a0e00f 	mov	lr, pc
    1794:	e12fff13 	bx	r3
    1798:	e3500000 	cmp	r0, #0
    179c:	1a000071 	bne	1968 <USBHandleStandardRequest+0x1f8>
    17a0:	e5d43000 	ldrb	r3, [r4]
    17a4:	e203301f 	and	r3, r3, #31
    17a8:	e3530001 	cmp	r3, #1
    17ac:	0a000057 	beq	1910 <USBHandleStandardRequest+0x1a0>
    17b0:	e3530002 	cmp	r3, #2
    17b4:	0a000078 	beq	199c <USBHandleStandardRequest+0x22c>
    17b8:	e3530000 	cmp	r3, #0
    17bc:	1a0000a3 	bne	1a50 <USBHandleStandardRequest+0x2e0>
    17c0:	e5d41001 	ldrb	r1, [r4, #1]
    17c4:	e5963000 	ldr	r3, [r6]
    17c8:	e3510009 	cmp	r1, #9
    17cc:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    17d0:	ea00004c 	b	1908 <USBHandleStandardRequest+0x198>
    17d4:	00001954 	.word	0x00001954
    17d8:	00001a50 	.word	0x00001a50
    17dc:	00001908 	.word	0x00001908
    17e0:	00001a50 	.word	0x00001a50
    17e4:	00001908 	.word	0x00001908
    17e8:	000017fc 	.word	0x000017fc
    17ec:	00001808 	.word	0x00001808
    17f0:	000018fc 	.word	0x000018fc
    17f4:	00001830 	.word	0x00001830
    17f8:	0000183c 	.word	0x0000183c
    17fc:	e5d40002 	ldrb	r0, [r4, #2]
    1800:	ebfffd5b 	bl	d74 <USBHwSetAddress>
    1804:	ea000057 	b	1968 <USBHandleStandardRequest+0x1f8>
    1808:	e1d410b2 	ldrh	r1, [r4, #2]
    180c:	e59f024c 	ldr	r0, [pc, #588]	; 1a60 <USBHandleStandardRequest+0x2f0>
    1810:	ebfffb9c 	bl	688 <printf>
    1814:	e1d400b2 	ldrh	r0, [r4, #2]
    1818:	e1d410b4 	ldrh	r1, [r4, #4]
    181c:	e1a02005 	mov	r2, r5
    1820:	e1a03006 	mov	r3, r6
    1824:	e28dd004 	add	sp, sp, #4
    1828:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    182c:	eaffffa0 	b	16b4 <USBGetDescriptor>
    1830:	e59f2224 	ldr	r2, [pc, #548]	; 1a5c <USBHandleStandardRequest+0x2ec>
    1834:	e5d22008 	ldrb	r2, [r2, #8]
    1838:	ea00004d 	b	1974 <USBHandleStandardRequest+0x204>
    183c:	e59f3218 	ldr	r3, [pc, #536]	; 1a5c <USBHandleStandardRequest+0x2ec>
    1840:	e5935000 	ldr	r5, [r3]
    1844:	e3550000 	cmp	r5, #0
    1848:	e1d460b2 	ldrh	r6, [r4, #2]
    184c:	1a000007 	bne	1870 <USBHandleStandardRequest+0x100>
    1850:	e3a030a5 	mov	r3, #165	; 0xa5
    1854:	e58d3000 	str	r3, [sp]
    1858:	e59f0204 	ldr	r0, [pc, #516]	; 1a64 <USBHandleStandardRequest+0x2f4>
    185c:	e59f1204 	ldr	r1, [pc, #516]	; 1a68 <USBHandleStandardRequest+0x2f8>
    1860:	e59f2204 	ldr	r2, [pc, #516]	; 1a6c <USBHandleStandardRequest+0x2fc>
    1864:	e59f3204 	ldr	r3, [pc, #516]	; 1a70 <USBHandleStandardRequest+0x300>
    1868:	ebfffb86 	bl	688 <printf>
    186c:	eafffffe 	b	186c <USBHandleStandardRequest+0xfc>
    1870:	e21660ff 	ands	r6, r6, #255	; 0xff
    1874:	13a030ff 	movne	r3, #255	; 0xff
    1878:	11a07003 	movne	r7, r3
    187c:	01a00006 	moveq	r0, r6
    1880:	1a000014 	bne	18d8 <USBHandleStandardRequest+0x168>
    1884:	ea000017 	b	18e8 <USBHandleStandardRequest+0x178>
    1888:	e5d52001 	ldrb	r2, [r5, #1]
    188c:	e3520004 	cmp	r2, #4
    1890:	05d53003 	ldrbeq	r3, [r5, #3]
    1894:	0a00000d 	beq	18d0 <USBHandleStandardRequest+0x160>
    1898:	e3520005 	cmp	r2, #5
    189c:	0a000002 	beq	18ac <USBHandleStandardRequest+0x13c>
    18a0:	e3520002 	cmp	r2, #2
    18a4:	05d57005 	ldrbeq	r7, [r5, #5]
    18a8:	ea000008 	b	18d0 <USBHandleStandardRequest+0x160>
    18ac:	e3530000 	cmp	r3, #0
    18b0:	01570006 	cmpeq	r7, r6
    18b4:	1a000005 	bne	18d0 <USBHandleStandardRequest+0x160>
    18b8:	e5d53004 	ldrb	r3, [r5, #4]
    18bc:	e5d51005 	ldrb	r1, [r5, #5]
    18c0:	e5d50002 	ldrb	r0, [r5, #2]
    18c4:	e1831401 	orr	r1, r3, r1, lsl #8
    18c8:	ebfffce7 	bl	c6c <USBHwEPConfig>
    18cc:	e3a03000 	mov	r3, #0
    18d0:	e5d52000 	ldrb	r2, [r5]
    18d4:	e0855002 	add	r5, r5, r2
    18d8:	e5d52000 	ldrb	r2, [r5]
    18dc:	e3520000 	cmp	r2, #0
    18e0:	1affffe8 	bne	1888 <USBHandleStandardRequest+0x118>
    18e4:	e3a00001 	mov	r0, #1
    18e8:	ebfffdb3 	bl	fbc <USBHwConfigDevice>
    18ec:	e1d420b2 	ldrh	r2, [r4, #2]
    18f0:	e59f3164 	ldr	r3, [pc, #356]	; 1a5c <USBHandleStandardRequest+0x2ec>
    18f4:	e5c32008 	strb	r2, [r3, #8]
    18f8:	ea00001a 	b	1968 <USBHandleStandardRequest+0x1f8>
    18fc:	e59f0170 	ldr	r0, [pc, #368]	; 1a74 <USBHandleStandardRequest+0x304>
    1900:	e3a01007 	mov	r1, #7
    1904:	ea000050 	b	1a4c <USBHandleStandardRequest+0x2dc>
    1908:	e59f0168 	ldr	r0, [pc, #360]	; 1a78 <USBHandleStandardRequest+0x308>
    190c:	ea00004e 	b	1a4c <USBHandleStandardRequest+0x2dc>
    1910:	e5d41001 	ldrb	r1, [r4, #1]
    1914:	e5963000 	ldr	r3, [r6]
    1918:	e351000b 	cmp	r1, #11
    191c:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1920:	ea00001b 	b	1994 <USBHandleStandardRequest+0x224>
    1924:	00001954 	.word	0x00001954
    1928:	00001a50 	.word	0x00001a50
    192c:	00001994 	.word	0x00001994
    1930:	00001a50 	.word	0x00001a50
    1934:	00001994 	.word	0x00001994
    1938:	00001994 	.word	0x00001994
    193c:	00001994 	.word	0x00001994
    1940:	00001994 	.word	0x00001994
    1944:	00001994 	.word	0x00001994
    1948:	00001994 	.word	0x00001994
    194c:	00001970 	.word	0x00001970
    1950:	00001984 	.word	0x00001984
    1954:	e3a02000 	mov	r2, #0
    1958:	e5c32000 	strb	r2, [r3]
    195c:	e5c32001 	strb	r2, [r3, #1]
    1960:	e3a03002 	mov	r3, #2
    1964:	e5853000 	str	r3, [r5]
    1968:	e3a00001 	mov	r0, #1
    196c:	ea000038 	b	1a54 <USBHandleStandardRequest+0x2e4>
    1970:	e3a02000 	mov	r2, #0
    1974:	e3a00001 	mov	r0, #1
    1978:	e5c32000 	strb	r2, [r3]
    197c:	e5850000 	str	r0, [r5]
    1980:	ea000033 	b	1a54 <USBHandleStandardRequest+0x2e4>
    1984:	e1d430b2 	ldrh	r3, [r4, #2]
    1988:	e3530000 	cmp	r3, #0
    198c:	0afffff4 	beq	1964 <USBHandleStandardRequest+0x1f4>
    1990:	ea00002e 	b	1a50 <USBHandleStandardRequest+0x2e0>
    1994:	e59f00e0 	ldr	r0, [pc, #224]	; 1a7c <USBHandleStandardRequest+0x30c>
    1998:	ea00002b 	b	1a4c <USBHandleStandardRequest+0x2dc>
    199c:	e5d41001 	ldrb	r1, [r4, #1]
    19a0:	e5966000 	ldr	r6, [r6]
    19a4:	e351000c 	cmp	r1, #12
    19a8:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    19ac:	ea000025 	b	1a48 <USBHandleStandardRequest+0x2d8>
    19b0:	000019e4 	.word	0x000019e4
    19b4:	00001a0c 	.word	0x00001a0c
    19b8:	00001a48 	.word	0x00001a48
    19bc:	00001a20 	.word	0x00001a20
    19c0:	00001a48 	.word	0x00001a48
    19c4:	00001a48 	.word	0x00001a48
    19c8:	00001a48 	.word	0x00001a48
    19cc:	00001a48 	.word	0x00001a48
    19d0:	00001a48 	.word	0x00001a48
    19d4:	00001a48 	.word	0x00001a48
    19d8:	00001a48 	.word	0x00001a48
    19dc:	00001a48 	.word	0x00001a48
    19e0:	00001a3c 	.word	0x00001a3c
    19e4:	e5d40004 	ldrb	r0, [r4, #4]
    19e8:	ebfffcf5 	bl	dc4 <USBHwEPGetStatus>
    19ec:	e3100002 	tst	r0, #2
    19f0:	03a03000 	moveq	r3, #0
    19f4:	13a03001 	movne	r3, #1
    19f8:	e5c63000 	strb	r3, [r6]
    19fc:	e3a03000 	mov	r3, #0
    1a00:	e5c63001 	strb	r3, [r6, #1]
    1a04:	e2833002 	add	r3, r3, #2
    1a08:	eaffffd5 	b	1964 <USBHandleStandardRequest+0x1f4>
    1a0c:	e1d410b2 	ldrh	r1, [r4, #2]
    1a10:	e3510000 	cmp	r1, #0
    1a14:	05d40004 	ldrbeq	r0, [r4, #4]
    1a18:	1a00000c 	bne	1a50 <USBHandleStandardRequest+0x2e0>
    1a1c:	ea000004 	b	1a34 <USBHandleStandardRequest+0x2c4>
    1a20:	e1d430b2 	ldrh	r3, [r4, #2]
    1a24:	e3530000 	cmp	r3, #0
    1a28:	1a000008 	bne	1a50 <USBHandleStandardRequest+0x2e0>
    1a2c:	e5d40004 	ldrb	r0, [r4, #4]
    1a30:	e3a01001 	mov	r1, #1
    1a34:	ebfffce7 	bl	dd8 <USBHwEPStall>
    1a38:	eaffffca 	b	1968 <USBHandleStandardRequest+0x1f8>
    1a3c:	e59f003c 	ldr	r0, [pc, #60]	; 1a80 <USBHandleStandardRequest+0x310>
    1a40:	e3a0100c 	mov	r1, #12
    1a44:	ea000000 	b	1a4c <USBHandleStandardRequest+0x2dc>
    1a48:	e59f0034 	ldr	r0, [pc, #52]	; 1a84 <USBHandleStandardRequest+0x314>
    1a4c:	ebfffb0d 	bl	688 <printf>
    1a50:	e3a00000 	mov	r0, #0
    1a54:	e28dd004 	add	sp, sp, #4
    1a58:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    1a5c:	400002a4 	.word	0x400002a4
    1a60:	00001f81 	.word	0x00001f81
    1a64:	00001e21 	.word	0x00001e21
    1a68:	00001f4e 	.word	0x00001f4e
    1a6c:	00001f61 	.word	0x00001f61
    1a70:	00001dd4 	.word	0x00001dd4
    1a74:	00001f85 	.word	0x00001f85
    1a78:	00001fa4 	.word	0x00001fa4
    1a7c:	00001fbb 	.word	0x00001fbb
    1a80:	00001fd5 	.word	0x00001fd5
    1a84:	00001ff0 	.word	0x00001ff0

00001a88 <USBRegisterCustomReqHandler>:
    1a88:	e59f3004 	ldr	r3, [pc, #4]	; 1a94 <USBRegisterCustomReqHandler+0xc>
    1a8c:	e5830004 	str	r0, [r3, #4]
    1a90:	e12fff1e 	bx	lr
    1a94:	400002a4 	.word	0x400002a4

00001a98 <HandleUsbReset>:
    1a98:	e3100010 	tst	r0, #16
    1a9c:	012fff1e 	bxeq	lr
    1aa0:	e59f0000 	ldr	r0, [pc, #0]	; 1aa8 <HandleUsbReset+0x10>
    1aa4:	eafffaf7 	b	688 <printf>
    1aa8:	00002003 	.word	0x00002003

00001aac <USBInit>:
    1aac:	e92d4010 	push	{r4, lr}
    1ab0:	e59f4050 	ldr	r4, [pc, #80]	; 1b08 <USBInit+0x5c>
    1ab4:	ebfffd91 	bl	1100 <USBHwInit>
    1ab8:	e59f004c 	ldr	r0, [pc, #76]	; 1b0c <USBInit+0x60>
    1abc:	ebfffc96 	bl	d1c <USBHwRegisterDevIntHandler>
    1ac0:	e1a01004 	mov	r1, r4
    1ac4:	e3a00000 	mov	r0, #0
    1ac8:	ebfffc7c 	bl	cc0 <USBHwRegisterEPIntHandler>
    1acc:	e1a01004 	mov	r1, r4
    1ad0:	e3a00080 	mov	r0, #128	; 0x80
    1ad4:	ebfffc79 	bl	cc0 <USBHwRegisterEPIntHandler>
    1ad8:	e3a00000 	mov	r0, #0
    1adc:	e3a01040 	mov	r1, #64	; 0x40
    1ae0:	ebfffc61 	bl	c6c <USBHwEPConfig>
    1ae4:	e3a00080 	mov	r0, #128	; 0x80
    1ae8:	e3a01040 	mov	r1, #64	; 0x40
    1aec:	ebfffc5e 	bl	c6c <USBHwEPConfig>
    1af0:	e3a00000 	mov	r0, #0
    1af4:	e59f1014 	ldr	r1, [pc, #20]	; 1b10 <USBInit+0x64>
    1af8:	e59f2014 	ldr	r2, [pc, #20]	; 1b14 <USBInit+0x68>
    1afc:	ebfffec8 	bl	1624 <USBRegisterRequestHandler>
    1b00:	e3a00001 	mov	r0, #1
    1b04:	e8bd8010 	pop	{r4, pc}
    1b08:	00001484 	.word	0x00001484
    1b0c:	00001a98 	.word	0x00001a98
    1b10:	00001770 	.word	0x00001770
    1b14:	400002b0 	.word	0x400002b0

00001b18 <__aeabi_uidiv>:
    1b18:	e2512001 	subs	r2, r1, #1
    1b1c:	012fff1e 	bxeq	lr
    1b20:	3a000036 	bcc	1c00 <__aeabi_uidiv+0xe8>
    1b24:	e1500001 	cmp	r0, r1
    1b28:	9a000022 	bls	1bb8 <__aeabi_uidiv+0xa0>
    1b2c:	e1110002 	tst	r1, r2
    1b30:	0a000023 	beq	1bc4 <__aeabi_uidiv+0xac>
    1b34:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1b38:	01a01181 	lsleq	r1, r1, #3
    1b3c:	03a03008 	moveq	r3, #8
    1b40:	13a03001 	movne	r3, #1
    1b44:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1b48:	31510000 	cmpcc	r1, r0
    1b4c:	31a01201 	lslcc	r1, r1, #4
    1b50:	31a03203 	lslcc	r3, r3, #4
    1b54:	3afffffa 	bcc	1b44 <__aeabi_uidiv+0x2c>
    1b58:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1b5c:	31510000 	cmpcc	r1, r0
    1b60:	31a01081 	lslcc	r1, r1, #1
    1b64:	31a03083 	lslcc	r3, r3, #1
    1b68:	3afffffa 	bcc	1b58 <__aeabi_uidiv+0x40>
    1b6c:	e3a02000 	mov	r2, #0
    1b70:	e1500001 	cmp	r0, r1
    1b74:	20400001 	subcs	r0, r0, r1
    1b78:	21822003 	orrcs	r2, r2, r3
    1b7c:	e15000a1 	cmp	r0, r1, lsr #1
    1b80:	204000a1 	subcs	r0, r0, r1, lsr #1
    1b84:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1b88:	e1500121 	cmp	r0, r1, lsr #2
    1b8c:	20400121 	subcs	r0, r0, r1, lsr #2
    1b90:	21822123 	orrcs	r2, r2, r3, lsr #2
    1b94:	e15001a1 	cmp	r0, r1, lsr #3
    1b98:	204001a1 	subcs	r0, r0, r1, lsr #3
    1b9c:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1ba0:	e3500000 	cmp	r0, #0
    1ba4:	11b03223 	lsrsne	r3, r3, #4
    1ba8:	11a01221 	lsrne	r1, r1, #4
    1bac:	1affffef 	bne	1b70 <__aeabi_uidiv+0x58>
    1bb0:	e1a00002 	mov	r0, r2
    1bb4:	e12fff1e 	bx	lr
    1bb8:	03a00001 	moveq	r0, #1
    1bbc:	13a00000 	movne	r0, #0
    1bc0:	e12fff1e 	bx	lr
    1bc4:	e3510801 	cmp	r1, #65536	; 0x10000
    1bc8:	21a01821 	lsrcs	r1, r1, #16
    1bcc:	23a02010 	movcs	r2, #16
    1bd0:	33a02000 	movcc	r2, #0
    1bd4:	e3510c01 	cmp	r1, #256	; 0x100
    1bd8:	21a01421 	lsrcs	r1, r1, #8
    1bdc:	22822008 	addcs	r2, r2, #8
    1be0:	e3510010 	cmp	r1, #16
    1be4:	21a01221 	lsrcs	r1, r1, #4
    1be8:	22822004 	addcs	r2, r2, #4
    1bec:	e3510004 	cmp	r1, #4
    1bf0:	82822003 	addhi	r2, r2, #3
    1bf4:	908220a1 	addls	r2, r2, r1, lsr #1
    1bf8:	e1a00230 	lsr	r0, r0, r2
    1bfc:	e12fff1e 	bx	lr
    1c00:	e52de008 	str	lr, [sp, #-8]!
    1c04:	eb00003c 	bl	1cfc <__div0>
    1c08:	e3a00000 	mov	r0, #0
    1c0c:	e49df008 	ldr	pc, [sp], #8

00001c10 <__aeabi_uidivmod>:
    1c10:	e3510000 	cmp	r1, #0
    1c14:	0afffff9 	beq	1c00 <__aeabi_uidiv+0xe8>
    1c18:	e92d4003 	push	{r0, r1, lr}
    1c1c:	ebffffbd 	bl	1b18 <__aeabi_uidiv>
    1c20:	e8bd4006 	pop	{r1, r2, lr}
    1c24:	e0030092 	mul	r3, r2, r0
    1c28:	e0411003 	sub	r1, r1, r3
    1c2c:	e12fff1e 	bx	lr

00001c30 <__umodsi3>:
    1c30:	e2512001 	subs	r2, r1, #1
    1c34:	3a00002c 	bcc	1cec <__umodsi3+0xbc>
    1c38:	11500001 	cmpne	r0, r1
    1c3c:	03a00000 	moveq	r0, #0
    1c40:	81110002 	tsthi	r1, r2
    1c44:	00000002 	andeq	r0, r0, r2
    1c48:	912fff1e 	bxls	lr
    1c4c:	e3a02000 	mov	r2, #0
    1c50:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1c54:	31510000 	cmpcc	r1, r0
    1c58:	31a01201 	lslcc	r1, r1, #4
    1c5c:	32822004 	addcc	r2, r2, #4
    1c60:	3afffffa 	bcc	1c50 <__umodsi3+0x20>
    1c64:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1c68:	31510000 	cmpcc	r1, r0
    1c6c:	31a01081 	lslcc	r1, r1, #1
    1c70:	32822001 	addcc	r2, r2, #1
    1c74:	3afffffa 	bcc	1c64 <__umodsi3+0x34>
    1c78:	e2522003 	subs	r2, r2, #3
    1c7c:	ba00000e 	blt	1cbc <__umodsi3+0x8c>
    1c80:	e1500001 	cmp	r0, r1
    1c84:	20400001 	subcs	r0, r0, r1
    1c88:	e15000a1 	cmp	r0, r1, lsr #1
    1c8c:	204000a1 	subcs	r0, r0, r1, lsr #1
    1c90:	e1500121 	cmp	r0, r1, lsr #2
    1c94:	20400121 	subcs	r0, r0, r1, lsr #2
    1c98:	e15001a1 	cmp	r0, r1, lsr #3
    1c9c:	204001a1 	subcs	r0, r0, r1, lsr #3
    1ca0:	e3500001 	cmp	r0, #1
    1ca4:	e1a01221 	lsr	r1, r1, #4
    1ca8:	a2522004 	subsge	r2, r2, #4
    1cac:	aafffff3 	bge	1c80 <__umodsi3+0x50>
    1cb0:	e3120003 	tst	r2, #3
    1cb4:	13300000 	teqne	r0, #0
    1cb8:	0a00000a 	beq	1ce8 <__umodsi3+0xb8>
    1cbc:	e3720002 	cmn	r2, #2
    1cc0:	ba000006 	blt	1ce0 <__umodsi3+0xb0>
    1cc4:	0a000002 	beq	1cd4 <__umodsi3+0xa4>
    1cc8:	e1500001 	cmp	r0, r1
    1ccc:	20400001 	subcs	r0, r0, r1
    1cd0:	e1a010a1 	lsr	r1, r1, #1
    1cd4:	e1500001 	cmp	r0, r1
    1cd8:	20400001 	subcs	r0, r0, r1
    1cdc:	e1a010a1 	lsr	r1, r1, #1
    1ce0:	e1500001 	cmp	r0, r1
    1ce4:	20400001 	subcs	r0, r0, r1
    1ce8:	e12fff1e 	bx	lr
    1cec:	e52de008 	str	lr, [sp, #-8]!
    1cf0:	eb000001 	bl	1cfc <__div0>
    1cf4:	e3a00000 	mov	r0, #0
    1cf8:	e49df008 	ldr	pc, [sp], #8

00001cfc <__div0>:
    1cfc:	e12fff1e 	bx	lr

00001d00 <abDescriptors>:
    1d00:	01010112 40000002 0005ffff 02010100     .......@........
    1d10:	02090103 01010020 0932c000 02000004     .... .....2.....
    1d20:	000000ff 0d060507 07010080 800d8305     ................
    1d30:	03040100 030e0409 0050004c 00550043     ........L.P.C.U.
    1d40:	00420053 00550314 00420053 00650053     S.B...U.S.B.S.e.
    1d50:	00690072 006c0061 00440312 00410045     r.i.a.l...D.E.A.
    1d60:	00430044 00440030 00000045              D.C.0.D.E...

00001d6c <__FUNCTION__.1347>:
    1d6c:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    1d7c:	6148746e 656c646e 00000072              ntHandler...

00001d88 <__FUNCTION__.1330>:
    1d88:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    1d98:	6e617254 72656673 00000000              Transfer....

00001da4 <__FUNCTION__.1337>:
    1da4:	52425355 73696765 52726574 65757165     USBRegisterReque
    1db4:	61487473 656c646e 00000072              stHandler...

00001dc0 <__FUNCTION__.1326>:
    1dc0:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    1dd0:	00000000                                ....

00001dd4 <__FUNCTION__.1340>:
    1dd4:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    1de4:	006e6f69 6c756e28 4900296c 6974696e     ion.(null).Initi
    1df4:	73696c61 20676e69 20425355 63617473     alising USB stac
    1e04:	7453006b 69747261 5520676e 63204253     k.Starting USB c
    1e14:	756d6d6f 6163696e 6e6f6974 73410a00     ommunication..As
    1e24:	74726573 206e6f69 27732527 69616620     sertion '%s' fai
    1e34:	2064656c 25206e69 73253a73 21642523     led in %s:%s#%d!
    1e44:	6469000a 32333c78 62737500 6c5f7768     ..idx<32.usbhw_l
    1e54:	632e6370 67655200 65747369 20646572     pc.c.Registered 
    1e64:	646e6168 2072656c 20726f66 30205045     handler for EP 0
    1e74:	0a782578 67655200 65747369 20646572     x%x..Registered 
    1e84:	646e6168 2072656c 20726f66 69766564     handler for devi
    1e94:	73206563 75746174 65520073 74736967     ce status.Regist
    1ea4:	64657265 6e616820 72656c64 726f6620     ered handler for
    1eb4:	61726620 5300656d 4c4c4154 206e6f20      frame.STALL on 
    1ec4:	2520005b 00783230 7473205d 253d7461     [. %02x.] stat=%
    1ed4:	4e000a78 6168206f 656c646e 6f662072     x..No handler fo
    1ee4:	65722072 70797471 64252065 003f000a     r reqtype %d..?.
    1ef4:	00782553 6e61485f 52656c64 65757165     S%x._HandleReque
    1f04:	20317473 6c696166 5f006465 646e6148     st1 failed._Hand
    1f14:	6552656c 73657571 66203274 656c6961     leRequest2 faile
    1f24:	41460064 0045534c 63627375 72746e6f     d.FALSE.usbcontr
    1f34:	632e6c6f 79546900 3e206570 0030203d     ol.c.iType >= 0.
    1f44:	70795469 203c2065 61700034 73654462     iType < 4.pabDes
    1f54:	70697263 203d2120 4c4c554e 62737500     crip != NULL.usb
    1f64:	72647473 632e7165 73654400 78252063     stdreq.c.Desc %x
    1f74:	746f6e20 756f6620 0a21646e 78254400      not found!..D%x
    1f84:	76654400 20656369 20716572 6e206425     .Device req %d n
    1f94:	6920746f 656c706d 746e656d 000a6465     ot implemented..
    1fa4:	656c6c49 206c6167 69766564 72206563     Illegal device r
    1fb4:	25207165 49000a64 67656c6c 69206c61     eq %d..Illegal i
    1fc4:	7265746e 65636166 71657220 0a642520     nterface req %d.
    1fd4:	20504500 20716572 6e206425 6920746f     .EP req %d not i
    1fe4:	656c706d 746e656d 000a6465 656c6c49     mplemented..Ille
    1ff4:	206c6167 72205045 25207165 0a000a64     gal EP req %d...
    2004:	00000021                                         !.
