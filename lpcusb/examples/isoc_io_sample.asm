
isoc_io_sample.elf:     file format elf32-littlearm


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
      bc:	ea0001fd 	b	8b8 <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	00001e82 	.word	0x00001e82
      c8:	40000200 	.word	0x40000200
      cc:	40000200 	.word	0x40000200
      d0:	40000200 	.word	0x40000200
      d4:	400006a8 	.word	0x400006a8

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
     410:	eb0005a5 	bl	1aac <__umodsi3>
     414:	e3500009 	cmp	r0, #9
     418:	c59d3000 	ldrgt	r3, [sp]
     41c:	c0800003 	addgt	r0, r0, r3
     420:	e2800030 	add	r0, r0, #48	; 0x30
     424:	e5690001 	strb	r0, [r9, #-1]!
     428:	e1a01007 	mov	r1, r7
     42c:	e1a00008 	mov	r0, r8
     430:	eb000557 	bl	1994 <__aeabi_uidiv>
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
     684:	00001c64 	.word	0x00001c64

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
     7f4:	40000200 	.word	0x40000200

000007f8 <USBIntHandler>:
     7f8:	e24ee004 	sub	lr, lr, #4
     7fc:	e92d41ff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
     800:	e14f1000 	mrs	r1, SPSR
     804:	e92d0002 	push	{r1}
     808:	eb00018e 	bl	e48 <USBHwISR>
     80c:	e3a02000 	mov	r2, #0
     810:	e3e03000 	mvn	r3, #0
     814:	e50320ff 	str	r2, [r3, #-255]	; 0xff
     818:	e8bd0002 	pop	{r1}
     81c:	e161f001 	msr	SPSR_c, r1
     820:	e8fd81ff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}^

00000824 <USBFrameHandler>:
     824:	e59f307c 	ldr	r3, [pc, #124]	; 8a8 <USBFrameHandler+0x84>
     828:	e5932004 	ldr	r2, [r3, #4]
     82c:	e3520000 	cmp	r2, #0
     830:	e92d4010 	push	{r4, lr}
     834:	08bd8010 	popeq	{r4, pc}
     838:	e5932008 	ldr	r2, [r3, #8]
     83c:	e3520efa 	cmp	r2, #4000	; 0xfa0
     840:	b2822001 	addlt	r2, r2, #1
     844:	b5832008 	strlt	r2, [r3, #8]
     848:	b8bd8010 	poplt	{r4, pc}
     84c:	e59f1058 	ldr	r1, [pc, #88]	; 8ac <USBFrameHandler+0x88>
     850:	e5913000 	ldr	r3, [r1]
     854:	e59f4054 	ldr	r4, [pc, #84]	; 8b0 <USBFrameHandler+0x8c>
     858:	e2833001 	add	r3, r3, #1
     85c:	e5813000 	str	r3, [r1]
     860:	e3a02004 	mov	r2, #4
     864:	e3a00083 	mov	r0, #131	; 0x83
     868:	eb000101 	bl	c74 <USBHwEPWrite>
     86c:	e3a00006 	mov	r0, #6
     870:	e1a01004 	mov	r1, r4
     874:	e3a02b01 	mov	r2, #1024	; 0x400
     878:	eb000145 	bl	d94 <USBHwISOCEPRead>
     87c:	e3500000 	cmp	r0, #0
     880:	d8bd8010 	pople	{r4, pc}
     884:	e5d43000 	ldrb	r3, [r4]
     888:	e3530000 	cmp	r3, #0
     88c:	159f3020 	ldrne	r3, [pc, #32]	; 8b4 <USBFrameHandler+0x90>
     890:	059f301c 	ldreq	r3, [pc, #28]	; 8b4 <USBFrameHandler+0x90>
     894:	13a02702 	movne	r2, #524288	; 0x80000
     898:	03a02702 	moveq	r2, #524288	; 0x80000
     89c:	15032fc7 	strne	r2, [r3, #-4039]	; 0xfc7
     8a0:	05032fc3 	streq	r2, [r3, #-4035]	; 0xfc3
     8a4:	e8bd8010 	pop	{r4, pc}
     8a8:	40000200 	.word	0x40000200
     8ac:	400006a4 	.word	0x400006a4
     8b0:	400002a4 	.word	0x400002a4
     8b4:	3fffcfff 	.word	0x3fffcfff

000008b8 <main>:
     8b8:	e59f30d4 	ldr	r3, [pc, #212]	; 994 <main+0xdc>
     8bc:	e59321a0 	ldr	r2, [r3, #416]	; 0x1a0
     8c0:	e3822001 	orr	r2, r2, #1
     8c4:	e92d4030 	push	{r4, r5, lr}
     8c8:	e58321a0 	str	r2, [r3, #416]	; 0x1a0
     8cc:	e59f30c4 	ldr	r3, [pc, #196]	; 998 <main+0xe0>
     8d0:	e5132fdf 	ldr	r2, [r3, #-4063]	; 0xfdf
     8d4:	e3822702 	orr	r2, r2, #524288	; 0x80000
     8d8:	e5032fdf 	str	r2, [r3, #-4063]	; 0xfdf
     8dc:	ebfffe08 	bl	104 <HalSysInit>
     8e0:	e3a0001a 	mov	r0, #26
     8e4:	ebffff7c 	bl	6dc <ConsoleInit>
     8e8:	e59f00ac 	ldr	r0, [pc, #172]	; 99c <main+0xe4>
     8ec:	ebffffa5 	bl	788 <puts>
     8f0:	eb00040c 	bl	1928 <USBInit>
     8f4:	e59f00a4 	ldr	r0, [pc, #164]	; 9a0 <main+0xe8>
     8f8:	eb000308 	bl	1520 <USBRegisterDescriptors>
     8fc:	e59f20a0 	ldr	r2, [pc, #160]	; 9a4 <main+0xec>
     900:	e3a00001 	mov	r0, #1
     904:	e59f109c 	ldr	r1, [pc, #156]	; 9a8 <main+0xf0>
     908:	eb0002e4 	bl	14a0 <USBRegisterRequestHandler>
     90c:	e3a01000 	mov	r1, #0
     910:	e3a00081 	mov	r0, #129	; 0x81
     914:	eb000088 	bl	b3c <USBHwRegisterEPIntHandler>
     918:	e59f008c 	ldr	r0, [pc, #140]	; 9ac <main+0xf4>
     91c:	eb0000a8 	bl	bc4 <USBHwRegisterFrameHandler>
     920:	e59f0088 	ldr	r0, [pc, #136]	; 9b0 <main+0xf8>
     924:	eb00009b 	bl	b98 <USBHwRegisterDevIntHandler>
     928:	e59f3084 	ldr	r3, [pc, #132]	; 9b4 <main+0xfc>
     92c:	e3a04000 	mov	r4, #0
     930:	e5834000 	str	r4, [r3]
     934:	e59f007c 	ldr	r0, [pc, #124]	; 9b8 <main+0x100>
     938:	ebffff92 	bl	788 <puts>
     93c:	e59f2078 	ldr	r2, [pc, #120]	; 9bc <main+0x104>
     940:	e3e03000 	mvn	r3, #0
     944:	e3a05001 	mov	r5, #1
     948:	e5035da7 	str	r5, [r3, #-3495]	; 0xda7
     94c:	e5032ea7 	str	r2, [r3, #-3751]	; 0xea7
     950:	e5132ff3 	ldr	r2, [r3, #-4083]	; 0xff3
     954:	e3c22501 	bic	r2, r2, #4194304	; 0x400000
     958:	e5032ff3 	str	r2, [r3, #-4083]	; 0xff3
     95c:	e5132fef 	ldr	r2, [r3, #-4079]	; 0xfef
     960:	e3822501 	orr	r2, r2, #4194304	; 0x400000
     964:	e5032fef 	str	r2, [r3, #-4079]	; 0xfef
     968:	eb000021 	bl	9f4 <enableIRQ>
     96c:	e1a00005 	mov	r0, r5
     970:	eb0000a3 	bl	c04 <USBHwConnect>
     974:	e59f2044 	ldr	r2, [pc, #68]	; 9c0 <main+0x108>
     978:	e59f3044 	ldr	r3, [pc, #68]	; 9c4 <main+0x10c>
     97c:	e2844001 	add	r4, r4, #1
     980:	e1540002 	cmp	r4, r2
     984:	0afffffc 	beq	97c <main+0xc4>
     988:	e1540003 	cmp	r4, r3
     98c:	c3a04000 	movgt	r4, #0
     990:	eafffff9 	b	97c <main+0xc4>
     994:	e01fc000 	.word	0xe01fc000
     998:	3fffcfff 	.word	0x3fffcfff
     99c:	00001c6b 	.word	0x00001c6b
     9a0:	00001b7c 	.word	0x00001b7c
     9a4:	4000020c 	.word	0x4000020c
     9a8:	000007b4 	.word	0x000007b4
     9ac:	00000824 	.word	0x00000824
     9b0:	000007bc 	.word	0x000007bc
     9b4:	400006a4 	.word	0x400006a4
     9b8:	00001c82 	.word	0x00001c82
     9bc:	000007f8 	.word	0x000007f8
     9c0:	00030d40 	.word	0x00030d40
     9c4:	00061a7f 	.word	0x00061a7f

000009c8 <disableIRQ>:
     9c8:	e10f0000 	mrs	r0, CPSR
     9cc:	e3803080 	orr	r3, r0, #128	; 0x80
     9d0:	e129f003 	msr	CPSR_fc, r3
     9d4:	e12fff1e 	bx	lr

000009d8 <restoreIRQ>:
     9d8:	e10f3000 	mrs	r3, CPSR
     9dc:	e3c32080 	bic	r2, r3, #128	; 0x80
     9e0:	e2000080 	and	r0, r0, #128	; 0x80
     9e4:	e1820000 	orr	r0, r2, r0
     9e8:	e129f000 	msr	CPSR_fc, r0
     9ec:	e1a00003 	mov	r0, r3
     9f0:	e12fff1e 	bx	lr

000009f4 <enableIRQ>:
     9f4:	e10f0000 	mrs	r0, CPSR
     9f8:	e3c03080 	bic	r3, r0, #128	; 0x80
     9fc:	e129f003 	msr	CPSR_fc, r3
     a00:	e12fff1e 	bx	lr

00000a04 <disableFIQ>:
     a04:	e10f0000 	mrs	r0, CPSR
     a08:	e3803040 	orr	r3, r0, #64	; 0x40
     a0c:	e129f003 	msr	CPSR_fc, r3
     a10:	e12fff1e 	bx	lr

00000a14 <restoreFIQ>:
     a14:	e10f3000 	mrs	r3, CPSR
     a18:	e3c32040 	bic	r2, r3, #64	; 0x40
     a1c:	e2000040 	and	r0, r0, #64	; 0x40
     a20:	e1820000 	orr	r0, r2, r0
     a24:	e129f000 	msr	CPSR_fc, r0
     a28:	e1a00003 	mov	r0, r3
     a2c:	e12fff1e 	bx	lr

00000a30 <enableFIQ>:
     a30:	e10f0000 	mrs	r0, CPSR
     a34:	e3c03040 	bic	r3, r0, #64	; 0x40
     a38:	e129f003 	msr	CPSR_fc, r3
     a3c:	e12fff1e 	bx	lr

00000a40 <Wait4DevInt>:
     a40:	e59f3018 	ldr	r3, [pc, #24]	; a60 <Wait4DevInt+0x20>
     a44:	e5132dff 	ldr	r2, [r3, #-3583]	; 0xdff
     a48:	e0002002 	and	r2, r0, r2
     a4c:	e1520000 	cmp	r2, r0
     a50:	1afffffb 	bne	a44 <Wait4DevInt+0x4>
     a54:	e59f3004 	ldr	r3, [pc, #4]	; a60 <Wait4DevInt+0x20>
     a58:	e5030df7 	str	r0, [r3, #-3575]	; 0xdf7
     a5c:	e12fff1e 	bx	lr
     a60:	ffe0cfff 	.word	0xffe0cfff

00000a64 <USBHwCmd>:
     a64:	e59f3018 	ldr	r3, [pc, #24]	; a84 <USBHwCmd+0x20>
     a68:	e1a00800 	lsl	r0, r0, #16
     a6c:	e3a02030 	mov	r2, #48	; 0x30
     a70:	e3800c05 	orr	r0, r0, #1280	; 0x500
     a74:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     a78:	e5030def 	str	r0, [r3, #-3567]	; 0xdef
     a7c:	e3a00010 	mov	r0, #16
     a80:	eaffffee 	b	a40 <Wait4DevInt>
     a84:	ffe0cfff 	.word	0xffe0cfff

00000a88 <USBHwCmdWrite>:
     a88:	e92d4010 	push	{r4, lr}
     a8c:	e1a04001 	mov	r4, r1
     a90:	ebfffff3 	bl	a64 <USBHwCmd>
     a94:	e1a04804 	lsl	r4, r4, #16
     a98:	e59f3010 	ldr	r3, [pc, #16]	; ab0 <USBHwCmdWrite+0x28>
     a9c:	e3844c01 	orr	r4, r4, #256	; 0x100
     aa0:	e3a00010 	mov	r0, #16
     aa4:	e5034def 	str	r4, [r3, #-3567]	; 0xdef
     aa8:	e8bd4010 	pop	{r4, lr}
     aac:	eaffffe3 	b	a40 <Wait4DevInt>
     ab0:	ffe0cfff 	.word	0xffe0cfff

00000ab4 <USBHwCmdRead>:
     ab4:	e92d4010 	push	{r4, lr}
     ab8:	e1a04000 	mov	r4, r0
     abc:	e1a04804 	lsl	r4, r4, #16
     ac0:	ebffffe7 	bl	a64 <USBHwCmd>
     ac4:	e3843c02 	orr	r3, r4, #512	; 0x200
     ac8:	e59f4014 	ldr	r4, [pc, #20]	; ae4 <USBHwCmdRead+0x30>
     acc:	e3a00020 	mov	r0, #32
     ad0:	e5043def 	str	r3, [r4, #-3567]	; 0xdef
     ad4:	ebffffd9 	bl	a40 <Wait4DevInt>
     ad8:	e5140deb 	ldr	r0, [r4, #-3563]	; 0xdeb
     adc:	e20000ff 	and	r0, r0, #255	; 0xff
     ae0:	e8bd8010 	pop	{r4, pc}
     ae4:	ffe0cfff 	.word	0xffe0cfff

00000ae8 <USBHwEPConfig>:
     ae8:	e20030ff 	and	r3, r0, #255	; 0xff
     aec:	e92d4010 	push	{r4, lr}
     af0:	e1a033a3 	lsr	r3, r3, #7
     af4:	e200400f 	and	r4, r0, #15
     af8:	e1834084 	orr	r4, r3, r4, lsl #1
     afc:	e59f3034 	ldr	r3, [pc, #52]	; b38 <USBHwEPConfig+0x50>
     b00:	e5132dbb 	ldr	r2, [r3, #-3515]	; 0xdbb
     b04:	e3a00001 	mov	r0, #1
     b08:	e1822410 	orr	r2, r2, r0, lsl r4
     b0c:	e1a01801 	lsl	r1, r1, #16
     b10:	e1a01821 	lsr	r1, r1, #16
     b14:	e5032dbb 	str	r2, [r3, #-3515]	; 0xdbb
     b18:	e28000ff 	add	r0, r0, #255	; 0xff
     b1c:	e5034db7 	str	r4, [r3, #-3511]	; 0xdb7
     b20:	e5031db3 	str	r1, [r3, #-3507]	; 0xdb3
     b24:	ebffffc5 	bl	a40 <Wait4DevInt>
     b28:	e3840040 	orr	r0, r4, #64	; 0x40
     b2c:	e3a01000 	mov	r1, #0
     b30:	e8bd4010 	pop	{r4, lr}
     b34:	eaffffd3 	b	a88 <USBHwCmdWrite>
     b38:	ffe0cfff 	.word	0xffe0cfff

00000b3c <USBHwRegisterEPIntHandler>:
     b3c:	e20030ff 	and	r3, r0, #255	; 0xff
     b40:	e1a023a3 	lsr	r2, r3, #7
     b44:	e200000f 	and	r0, r0, #15
     b48:	e1820080 	orr	r0, r2, r0, lsl #1
     b4c:	e59f2038 	ldr	r2, [pc, #56]	; b8c <USBHwRegisterEPIntHandler+0x50>
     b50:	e1a0c0a0 	lsr	ip, r0, #1
     b54:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     b58:	e782110c 	str	r1, [r2, ip, lsl #2]
     b5c:	e59f202c 	ldr	r2, [pc, #44]	; b90 <USBHwRegisterEPIntHandler+0x54>
     b60:	e5121dcb 	ldr	r1, [r2, #-3531]	; 0xdcb
     b64:	e3a0c001 	mov	ip, #1
     b68:	e181001c 	orr	r0, r1, ip, lsl r0
     b6c:	e5020dcb 	str	r0, [r2, #-3531]	; 0xdcb
     b70:	e5121dfb 	ldr	r1, [r2, #-3579]	; 0xdfb
     b74:	e59f0018 	ldr	r0, [pc, #24]	; b94 <USBHwRegisterEPIntHandler+0x58>
     b78:	e3811004 	orr	r1, r1, #4
     b7c:	e5021dfb 	str	r1, [r2, #-3579]	; 0xdfb
     b80:	e1a01003 	mov	r1, r3
     b84:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     b88:	eafffebe 	b	688 <printf>
     b8c:	40000214 	.word	0x40000214
     b90:	ffe0cfff 	.word	0xffe0cfff
     b94:	00001cd5 	.word	0x00001cd5

00000b98 <USBHwRegisterDevIntHandler>:
     b98:	e59f3018 	ldr	r3, [pc, #24]	; bb8 <USBHwRegisterDevIntHandler+0x20>
     b9c:	e5830040 	str	r0, [r3, #64]	; 0x40
     ba0:	e59f3014 	ldr	r3, [pc, #20]	; bbc <USBHwRegisterDevIntHandler+0x24>
     ba4:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     ba8:	e59f0010 	ldr	r0, [pc, #16]	; bc0 <USBHwRegisterDevIntHandler+0x28>
     bac:	e3822008 	orr	r2, r2, #8
     bb0:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     bb4:	eafffef3 	b	788 <puts>
     bb8:	40000214 	.word	0x40000214
     bbc:	ffe0cfff 	.word	0xffe0cfff
     bc0:	00001cf5 	.word	0x00001cf5

00000bc4 <USBHwRegisterFrameHandler>:
     bc4:	e59f3018 	ldr	r3, [pc, #24]	; be4 <USBHwRegisterFrameHandler+0x20>
     bc8:	e5830044 	str	r0, [r3, #68]	; 0x44
     bcc:	e59f3014 	ldr	r3, [pc, #20]	; be8 <USBHwRegisterFrameHandler+0x24>
     bd0:	e5132dfb 	ldr	r2, [r3, #-3579]	; 0xdfb
     bd4:	e59f0010 	ldr	r0, [pc, #16]	; bec <USBHwRegisterFrameHandler+0x28>
     bd8:	e3822001 	orr	r2, r2, #1
     bdc:	e5032dfb 	str	r2, [r3, #-3579]	; 0xdfb
     be0:	eafffee8 	b	788 <puts>
     be4:	40000214 	.word	0x40000214
     be8:	ffe0cfff 	.word	0xffe0cfff
     bec:	00001d1a 	.word	0x00001d1a

00000bf0 <USBHwSetAddress>:
     bf0:	e1e01c80 	mvn	r1, r0, lsl #25
     bf4:	e1e01ca1 	mvn	r1, r1, lsr #25
     bf8:	e20110ff 	and	r1, r1, #255	; 0xff
     bfc:	e3a000d0 	mov	r0, #208	; 0xd0
     c00:	eaffffa0 	b	a88 <USBHwCmdWrite>

00000c04 <USBHwConnect>:
     c04:	e2501000 	subs	r1, r0, #0
     c08:	159f3020 	ldrne	r3, [pc, #32]	; c30 <USBHwConnect+0x2c>
     c0c:	059f301c 	ldreq	r3, [pc, #28]	; c30 <USBHwConnect+0x2c>
     c10:	13a02901 	movne	r2, #16384	; 0x4000
     c14:	03a02901 	moveq	r2, #16384	; 0x4000
     c18:	15032fe3 	strne	r2, [r3, #-4067]	; 0xfe3
     c1c:	05032fe7 	streq	r2, [r3, #-4071]	; 0xfe7
     c20:	e3a000fe 	mov	r0, #254	; 0xfe
     c24:	e2511000 	subs	r1, r1, #0
     c28:	13a01001 	movne	r1, #1
     c2c:	eaffff95 	b	a88 <USBHwCmdWrite>
     c30:	3fffcfff 	.word	0x3fffcfff

00000c34 <USBHwNakIntEnable>:
     c34:	e20010ff 	and	r1, r0, #255	; 0xff
     c38:	e3a000f3 	mov	r0, #243	; 0xf3
     c3c:	eaffff91 	b	a88 <USBHwCmdWrite>

00000c40 <USBHwEPGetStatus>:
     c40:	e20030ff 	and	r3, r0, #255	; 0xff
     c44:	e1a033a3 	lsr	r3, r3, #7
     c48:	e200000f 	and	r0, r0, #15
     c4c:	e1830080 	orr	r0, r3, r0, lsl #1
     c50:	eaffff97 	b	ab4 <USBHwCmdRead>

00000c54 <USBHwEPStall>:
     c54:	e20030ff 	and	r3, r0, #255	; 0xff
     c58:	e1a033a3 	lsr	r3, r3, #7
     c5c:	e200000f 	and	r0, r0, #15
     c60:	e1830080 	orr	r0, r3, r0, lsl #1
     c64:	e3800040 	orr	r0, r0, #64	; 0x40
     c68:	e2511000 	subs	r1, r1, #0
     c6c:	13a01001 	movne	r1, #1
     c70:	eaffff84 	b	a88 <USBHwCmdWrite>

00000c74 <USBHwEPWrite>:
     c74:	e92d4010 	push	{r4, lr}
     c78:	e1a04002 	mov	r4, r2
     c7c:	e20020ff 	and	r2, r0, #255	; 0xff
     c80:	e200300f 	and	r3, r0, #15
     c84:	e1a003a2 	lsr	r0, r2, #7
     c88:	e1800083 	orr	r0, r0, r3, lsl #1
     c8c:	e1a03103 	lsl	r3, r3, #2
     c90:	e3832002 	orr	r2, r3, #2
     c94:	e59f3058 	ldr	r3, [pc, #88]	; cf4 <USBHwEPWrite+0x80>
     c98:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     c9c:	e5034ddb 	str	r4, [r3, #-3547]	; 0xddb
     ca0:	ea000008 	b	cc8 <USBHwEPWrite+0x54>
     ca4:	e5512002 	ldrb	r2, [r1, #-2]
     ca8:	e551c001 	ldrb	ip, [r1, #-1]
     cac:	e1a02802 	lsl	r2, r2, #16
     cb0:	e1822c0c 	orr	r2, r2, ip, lsl #24
     cb4:	e551c004 	ldrb	ip, [r1, #-4]
     cb8:	e182200c 	orr	r2, r2, ip
     cbc:	e551c003 	ldrb	ip, [r1, #-3]
     cc0:	e182240c 	orr	r2, r2, ip, lsl #8
     cc4:	e5032de3 	str	r2, [r3, #-3555]	; 0xde3
     cc8:	e5132dd7 	ldr	r2, [r3, #-3543]	; 0xdd7
     ccc:	e2122002 	ands	r2, r2, #2
     cd0:	e2811004 	add	r1, r1, #4
     cd4:	1afffff2 	bne	ca4 <USBHwEPWrite+0x30>
     cd8:	e59f3014 	ldr	r3, [pc, #20]	; cf4 <USBHwEPWrite+0x80>
     cdc:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     ce0:	ebffff5f 	bl	a64 <USBHwCmd>
     ce4:	e3a000fa 	mov	r0, #250	; 0xfa
     ce8:	ebffff5d 	bl	a64 <USBHwCmd>
     cec:	e1a00004 	mov	r0, r4
     cf0:	e8bd8010 	pop	{r4, pc}
     cf4:	ffe0cfff 	.word	0xffe0cfff

00000cf8 <USBHwEPRead>:
     cf8:	e200c0ff 	and	ip, r0, #255	; 0xff
     cfc:	e200000f 	and	r0, r0, #15
     d00:	e92d4030 	push	{r4, r5, lr}
     d04:	e59f3084 	ldr	r3, [pc, #132]	; d90 <USBHwEPRead+0x98>
     d08:	e1a04100 	lsl	r4, r0, #2
     d0c:	e3844001 	orr	r4, r4, #1
     d10:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
     d14:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
     d18:	e3140b02 	tst	r4, #2048	; 0x800
     d1c:	0afffffc 	beq	d14 <USBHwEPRead+0x1c>
     d20:	e3140b01 	tst	r4, #1024	; 0x400
     d24:	03e04000 	mvneq	r4, #0
     d28:	0a000016 	beq	d88 <USBHwEPRead+0x90>
     d2c:	e1a04b04 	lsl	r4, r4, #22
     d30:	e3a0e000 	mov	lr, #0
     d34:	e1a04b24 	lsr	r4, r4, #22
     d38:	e1a0300e 	mov	r3, lr
     d3c:	e59f504c 	ldr	r5, [pc, #76]	; d90 <USBHwEPRead+0x98>
     d40:	ea000006 	b	d60 <USBHwEPRead+0x68>
     d44:	e3130003 	tst	r3, #3
     d48:	0515ede7 	ldreq	lr, [r5, #-3559]	; 0xde7
     d4c:	e3510000 	cmp	r1, #0
     d50:	11530002 	cmpne	r3, r2
     d54:	b7c1e003 	strblt	lr, [r1, r3]
     d58:	e1a0e42e 	lsr	lr, lr, #8
     d5c:	e2833001 	add	r3, r3, #1
     d60:	e1530004 	cmp	r3, r4
     d64:	1afffff6 	bne	d44 <USBHwEPRead+0x4c>
     d68:	e59f3020 	ldr	r3, [pc, #32]	; d90 <USBHwEPRead+0x98>
     d6c:	e3a02000 	mov	r2, #0
     d70:	e1a0c3ac 	lsr	ip, ip, #7
     d74:	e18c0080 	orr	r0, ip, r0, lsl #1
     d78:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     d7c:	ebffff38 	bl	a64 <USBHwCmd>
     d80:	e3a000f2 	mov	r0, #242	; 0xf2
     d84:	ebffff36 	bl	a64 <USBHwCmd>
     d88:	e1a00004 	mov	r0, r4
     d8c:	e8bd8030 	pop	{r4, r5, pc}
     d90:	ffe0cfff 	.word	0xffe0cfff

00000d94 <USBHwISOCEPRead>:
     d94:	e200c0ff 	and	ip, r0, #255	; 0xff
     d98:	e200000f 	and	r0, r0, #15
     d9c:	e92d4030 	push	{r4, r5, lr}
     da0:	e59f308c 	ldr	r3, [pc, #140]	; e34 <USBHwISOCEPRead+0xa0>
     da4:	e1a04100 	lsl	r4, r0, #2
     da8:	e3844001 	orr	r4, r4, #1
     dac:	e5034dd7 	str	r4, [r3, #-3543]	; 0xdd7
     db0:	e1a00000 	nop			; (mov r0, r0)
     db4:	e5134ddf 	ldr	r4, [r3, #-3551]	; 0xddf
     db8:	e2145b02 	ands	r5, r4, #2048	; 0x800
     dbc:	0a000001 	beq	dc8 <USBHwISOCEPRead+0x34>
     dc0:	e2145b01 	ands	r5, r4, #1024	; 0x400
     dc4:	1a000002 	bne	dd4 <USBHwISOCEPRead+0x40>
     dc8:	e5035dd7 	str	r5, [r3, #-3543]	; 0xdd7
     dcc:	e3e04000 	mvn	r4, #0
     dd0:	ea000015 	b	e2c <USBHwISOCEPRead+0x98>
     dd4:	e1a04b04 	lsl	r4, r4, #22
     dd8:	e3a05000 	mov	r5, #0
     ddc:	e1a04b24 	lsr	r4, r4, #22
     de0:	e1a0e005 	mov	lr, r5
     de4:	ea000006 	b	e04 <USBHwISOCEPRead+0x70>
     de8:	e31e0003 	tst	lr, #3
     dec:	05135de7 	ldreq	r5, [r3, #-3559]	; 0xde7
     df0:	e3510000 	cmp	r1, #0
     df4:	115e0002 	cmpne	lr, r2
     df8:	b7c1500e 	strblt	r5, [r1, lr]
     dfc:	e1a05425 	lsr	r5, r5, #8
     e00:	e28ee001 	add	lr, lr, #1
     e04:	e15e0004 	cmp	lr, r4
     e08:	1afffff6 	bne	de8 <USBHwISOCEPRead+0x54>
     e0c:	e59f3020 	ldr	r3, [pc, #32]	; e34 <USBHwISOCEPRead+0xa0>
     e10:	e3a02000 	mov	r2, #0
     e14:	e1a0c3ac 	lsr	ip, ip, #7
     e18:	e18c0080 	orr	r0, ip, r0, lsl #1
     e1c:	e5032dd7 	str	r2, [r3, #-3543]	; 0xdd7
     e20:	ebffff0f 	bl	a64 <USBHwCmd>
     e24:	e3a000f2 	mov	r0, #242	; 0xf2
     e28:	ebffff0d 	bl	a64 <USBHwCmd>
     e2c:	e1a00004 	mov	r0, r4
     e30:	e8bd8030 	pop	{r4, r5, pc}
     e34:	ffe0cfff 	.word	0xffe0cfff

00000e38 <USBHwConfigDevice>:
     e38:	e2501000 	subs	r1, r0, #0
     e3c:	13a01001 	movne	r1, #1
     e40:	e3a000d8 	mov	r0, #216	; 0xd8
     e44:	eaffff0f 	b	a88 <USBHwCmdWrite>

00000e48 <USBHwISR>:
     e48:	e59f3120 	ldr	r3, [pc, #288]	; f70 <USBHwISR+0x128>
     e4c:	e3a02002 	mov	r2, #2
     e50:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
     e54:	e5032fa7 	str	r2, [r3, #-4007]	; 0xfa7
     e58:	e59f3114 	ldr	r3, [pc, #276]	; f74 <USBHwISR+0x12c>
     e5c:	e5134dff 	ldr	r4, [r3, #-3583]	; 0xdff
     e60:	e3140001 	tst	r4, #1
     e64:	0a000009 	beq	e90 <USBHwISR+0x48>
     e68:	e3a02001 	mov	r2, #1
     e6c:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     e70:	e59f3100 	ldr	r3, [pc, #256]	; f78 <USBHwISR+0x130>
     e74:	e5935044 	ldr	r5, [r3, #68]	; 0x44
     e78:	e3550000 	cmp	r5, #0
     e7c:	0a000003 	beq	e90 <USBHwISR+0x48>
     e80:	e3a000f5 	mov	r0, #245	; 0xf5
     e84:	ebffff0a 	bl	ab4 <USBHwCmdRead>
     e88:	e1a0e00f 	mov	lr, pc
     e8c:	e12fff15 	bx	r5
     e90:	e3140008 	tst	r4, #8
     e94:	0a000011 	beq	ee0 <USBHwISR+0x98>
     e98:	e59f30d4 	ldr	r3, [pc, #212]	; f74 <USBHwISR+0x12c>
     e9c:	e3a02008 	mov	r2, #8
     ea0:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
     ea4:	e3a000fe 	mov	r0, #254	; 0xfe
     ea8:	ebffff01 	bl	ab4 <USBHwCmdRead>
     eac:	e310001a 	tst	r0, #26
     eb0:	0a00000a 	beq	ee0 <USBHwISR+0x98>
     eb4:	e59f30bc 	ldr	r3, [pc, #188]	; f78 <USBHwISR+0x130>
     eb8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
     ebc:	e3530000 	cmp	r3, #0
     ec0:	0a000006 	beq	ee0 <USBHwISR+0x98>
     ec4:	e59f50a4 	ldr	r5, [pc, #164]	; f70 <USBHwISR+0x128>
     ec8:	e3a06001 	mov	r6, #1
     ecc:	e5056fa7 	str	r6, [r5, #-4007]	; 0xfa7
     ed0:	e2000015 	and	r0, r0, #21
     ed4:	e1a0e00f 	mov	lr, pc
     ed8:	e12fff13 	bx	r3
     edc:	e5056fa3 	str	r6, [r5, #-4003]	; 0xfa3
     ee0:	e3140004 	tst	r4, #4
     ee4:	0a00001d 	beq	f60 <USBHwISR+0x118>
     ee8:	e59f5084 	ldr	r5, [pc, #132]	; f74 <USBHwISR+0x12c>
     eec:	e3a06004 	mov	r6, #4
     ef0:	e5056df7 	str	r6, [r5, #-3575]	; 0xdf7
     ef4:	e59f807c 	ldr	r8, [pc, #124]	; f78 <USBHwISR+0x130>
     ef8:	e59f7070 	ldr	r7, [pc, #112]	; f70 <USBHwISR+0x128>
     efc:	e3a04000 	mov	r4, #0
     f00:	e3a0a001 	mov	sl, #1
     f04:	e1a0341a 	lsl	r3, sl, r4
     f08:	e5152dcf 	ldr	r2, [r5, #-3535]	; 0xdcf
     f0c:	e1130002 	tst	r3, r2
     f10:	0a00000f 	beq	f54 <USBHwISR+0x10c>
     f14:	e5053dc7 	str	r3, [r5, #-3527]	; 0xdc7
     f18:	e3a00020 	mov	r0, #32
     f1c:	ebfffec7 	bl	a40 <Wait4DevInt>
     f20:	e1a020c4 	asr	r2, r4, #1
     f24:	e7983102 	ldr	r3, [r8, r2, lsl #2]
     f28:	e3530000 	cmp	r3, #0
     f2c:	e5151deb 	ldr	r1, [r5, #-3563]	; 0xdeb
     f30:	0a000007 	beq	f54 <USBHwISR+0x10c>
     f34:	e202200f 	and	r2, r2, #15
     f38:	e1820384 	orr	r0, r2, r4, lsl #7
     f3c:	e5076fa7 	str	r6, [r7, #-4007]	; 0xfa7
     f40:	e200008f 	and	r0, r0, #143	; 0x8f
     f44:	e201101f 	and	r1, r1, #31
     f48:	e1a0e00f 	mov	lr, pc
     f4c:	e12fff13 	bx	r3
     f50:	e5076fa3 	str	r6, [r7, #-4003]	; 0xfa3
     f54:	e2844001 	add	r4, r4, #1
     f58:	e3540020 	cmp	r4, #32
     f5c:	1affffe8 	bne	f04 <USBHwISR+0xbc>
     f60:	e59f3008 	ldr	r3, [pc, #8]	; f70 <USBHwISR+0x128>
     f64:	e3a02002 	mov	r2, #2
     f68:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
     f6c:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
     f70:	3fffcfff 	.word	0x3fffcfff
     f74:	ffe0cfff 	.word	0xffe0cfff
     f78:	40000214 	.word	0x40000214

00000f7c <USBHwInit>:
     f7c:	e59f312c 	ldr	r3, [pc, #300]	; 10b0 <USBHwInit+0x134>
     f80:	e5932004 	ldr	r2, [r3, #4]
     f84:	e3c22103 	bic	r2, r2, #-1073741824	; 0xc0000000
     f88:	e3822101 	orr	r2, r2, #1073741824	; 0x40000000
     f8c:	e92d4010 	push	{r4, lr}
     f90:	e5832004 	str	r2, [r3, #4]
     f94:	e593200c 	ldr	r2, [r3, #12]
     f98:	e3c22203 	bic	r2, r2, #805306368	; 0x30000000
     f9c:	e3822202 	orr	r2, r2, #536870912	; 0x20000000
     fa0:	e583200c 	str	r2, [r3, #12]
     fa4:	e5932000 	ldr	r2, [r3]
     fa8:	e3c2230f 	bic	r2, r2, #1006632960	; 0x3c000000
     fac:	e3822301 	orr	r2, r2, #67108864	; 0x4000000
     fb0:	e5832000 	str	r2, [r3]
     fb4:	e59f30f8 	ldr	r3, [pc, #248]	; 10b4 <USBHwInit+0x138>
     fb8:	e5132fff 	ldr	r2, [r3, #-4095]	; 0xfff
     fbc:	e3822901 	orr	r2, r2, #16384	; 0x4000
     fc0:	e5032fff 	str	r2, [r3, #-4095]	; 0xfff
     fc4:	e3a02901 	mov	r2, #16384	; 0x4000
     fc8:	e5032fe7 	str	r2, [r3, #-4071]	; 0xfe7
     fcc:	e59f30e4 	ldr	r3, [pc, #228]	; 10b8 <USBHwInit+0x13c>
     fd0:	e59320c4 	ldr	r2, [r3, #196]	; 0xc4
     fd4:	e3822102 	orr	r2, r2, #-2147483648	; 0x80000000
     fd8:	e58320c4 	str	r2, [r3, #196]	; 0xc4
     fdc:	e3a02005 	mov	r2, #5
     fe0:	e5832108 	str	r2, [r3, #264]	; 0x108
     fe4:	e59f30d0 	ldr	r3, [pc, #208]	; 10bc <USBHwInit+0x140>
     fe8:	e2822015 	add	r2, r2, #21
     fec:	e503200b 	str	r2, [r3, #-11]
     ff0:	e1a02003 	mov	r2, r3
     ff4:	e5121007 	ldr	r1, [r2, #-7]
     ff8:	e311001a 	tst	r1, #26
     ffc:	e59f30b8 	ldr	r3, [pc, #184]	; 10bc <USBHwInit+0x140>
    1000:	0afffffb 	beq	ff4 <USBHwInit+0x78>
    1004:	e3a02003 	mov	r2, #3
    1008:	e5032eef 	str	r2, [r3, #-3823]	; 0xeef
    100c:	e3a04000 	mov	r4, #0
    1010:	e3e02000 	mvn	r2, #0
    1014:	e5034dfb 	str	r4, [r3, #-3579]	; 0xdfb
    1018:	e1a00004 	mov	r0, r4
    101c:	e5032df7 	str	r2, [r3, #-3575]	; 0xdf7
    1020:	e5034dd3 	str	r4, [r3, #-3539]	; 0xdd3
    1024:	e5034dcb 	str	r4, [r3, #-3531]	; 0xdcb
    1028:	e5032dc7 	str	r2, [r3, #-3527]	; 0xdc7
    102c:	e5034dbf 	str	r4, [r3, #-3519]	; 0xdbf
    1030:	ebfffeff 	bl	c34 <USBHwNakIntEnable>
    1034:	e59f207c 	ldr	r2, [pc, #124]	; 10b8 <USBHwInit+0x13c>
    1038:	e59231a0 	ldr	r3, [r2, #416]	; 0x1a0
    103c:	e59f106c 	ldr	r1, [pc, #108]	; 10b0 <USBHwInit+0x134>
    1040:	e3833001 	orr	r3, r3, #1
    1044:	e58231a0 	str	r3, [r2, #416]	; 0x1a0
    1048:	e5814028 	str	r4, [r1, #40]	; 0x28
    104c:	e59f3060 	ldr	r3, [pc, #96]	; 10b4 <USBHwInit+0x138>
    1050:	e5130fbf 	ldr	r0, [r3, #-4031]	; 0xfbf
    1054:	e3800001 	orr	r0, r0, #1
    1058:	e5030fbf 	str	r0, [r3, #-4031]	; 0xfbf
    105c:	e3a00001 	mov	r0, #1
    1060:	e5030fa3 	str	r0, [r3, #-4003]	; 0xfa3
    1064:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
    1068:	e18cc000 	orr	ip, ip, r0
    106c:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
    1070:	e5814028 	str	r4, [r1, #40]	; 0x28
    1074:	e513cfbf 	ldr	ip, [r3, #-4031]	; 0xfbf
    1078:	e38cc002 	orr	ip, ip, #2
    107c:	e503cfbf 	str	ip, [r3, #-4031]	; 0xfbf
    1080:	e3a0c002 	mov	ip, #2
    1084:	e503cfa3 	str	ip, [r3, #-4003]	; 0xfa3
    1088:	e592c1a0 	ldr	ip, [r2, #416]	; 0x1a0
    108c:	e18cc000 	orr	ip, ip, r0
    1090:	e582c1a0 	str	ip, [r2, #416]	; 0x1a0
    1094:	e5814028 	str	r4, [r1, #40]	; 0x28
    1098:	e5132fbf 	ldr	r2, [r3, #-4031]	; 0xfbf
    109c:	e3822004 	orr	r2, r2, #4
    10a0:	e5032fbf 	str	r2, [r3, #-4031]	; 0xfbf
    10a4:	e3a02004 	mov	r2, #4
    10a8:	e5032fa3 	str	r2, [r3, #-4003]	; 0xfa3
    10ac:	e8bd8010 	pop	{r4, pc}
    10b0:	e002c000 	.word	0xe002c000
    10b4:	3fffcfff 	.word	0x3fffcfff
    10b8:	e01fc000 	.word	0xe01fc000
    10bc:	ffe0cfff 	.word	0xffe0cfff

000010c0 <USBSetupDMADescriptor>:
    10c0:	e92d4030 	push	{r4, r5, lr}
    10c4:	e3a05000 	mov	r5, #0
    10c8:	e5805004 	str	r5, [r0, #4]
    10cc:	e5801000 	str	r1, [r0]
    10d0:	e5905004 	ldr	r5, [r0, #4]
    10d4:	e1a03b03 	lsl	r3, r3, #22
    10d8:	e18558a3 	orr	r5, r5, r3, lsr #17
    10dc:	e5805004 	str	r5, [r0, #4]
    10e0:	e1dd40bc 	ldrh	r4, [sp, #12]
    10e4:	e5903004 	ldr	r3, [r0, #4]
    10e8:	e1834804 	orr	r4, r3, r4, lsl #16
    10ec:	e5804004 	str	r4, [r0, #4]
    10f0:	e21220ff 	ands	r2, r2, #255	; 0xff
    10f4:	15903004 	ldrne	r3, [r0, #4]
    10f8:	13833010 	orrne	r3, r3, #16
    10fc:	15803004 	strne	r3, [r0, #4]
    1100:	e3510000 	cmp	r1, #0
    1104:	15903004 	ldrne	r3, [r0, #4]
    1108:	13833004 	orrne	r3, r3, #4
    110c:	15803004 	strne	r3, [r0, #4]
    1110:	e28d3010 	add	r3, sp, #16
    1114:	e8931008 	ldm	r3, {r3, ip}
    1118:	e35c0000 	cmp	ip, #0
    111c:	13520000 	cmpne	r2, #0
    1120:	e5803008 	str	r3, [r0, #8]
    1124:	e3a03000 	mov	r3, #0
    1128:	1580c010 	strne	ip, [r0, #16]
    112c:	e580300c 	str	r3, [r0, #12]
    1130:	e8bd8030 	pop	{r4, r5, pc}

00001134 <USBDisableDMAForEndpoint>:
    1134:	e20030ff 	and	r3, r0, #255	; 0xff
    1138:	e1a033a3 	lsr	r3, r3, #7
    113c:	e200000f 	and	r0, r0, #15
    1140:	e1830080 	orr	r0, r3, r0, lsl #1
    1144:	e3a03001 	mov	r3, #1
    1148:	e1a00013 	lsl	r0, r3, r0
    114c:	e59f3004 	ldr	r3, [pc, #4]	; 1158 <USBDisableDMAForEndpoint+0x24>
    1150:	e5030d73 	str	r0, [r3, #-3443]	; 0xd73
    1154:	e12fff1e 	bx	lr
    1158:	ffe0cfff 	.word	0xffe0cfff

0000115c <USBEnableDMAForEndpoint>:
    115c:	e20030ff 	and	r3, r0, #255	; 0xff
    1160:	e1a033a3 	lsr	r3, r3, #7
    1164:	e200000f 	and	r0, r0, #15
    1168:	e1830080 	orr	r0, r3, r0, lsl #1
    116c:	e3a03001 	mov	r3, #1
    1170:	e1a00013 	lsl	r0, r3, r0
    1174:	e59f3004 	ldr	r3, [pc, #4]	; 1180 <USBEnableDMAForEndpoint+0x24>
    1178:	e5030d77 	str	r0, [r3, #-3447]	; 0xd77
    117c:	e12fff1e 	bx	lr
    1180:	ffe0cfff 	.word	0xffe0cfff

00001184 <USBInitializeISOCFrameArray>:
    1184:	e1a03b03 	lsl	r3, r3, #22
    1188:	e1a02802 	lsl	r2, r2, #16
    118c:	e1a03b23 	lsr	r3, r3, #22
    1190:	e92d4010 	push	{r4, lr}
    1194:	e1a02822 	lsr	r2, r2, #16
    1198:	e3a0c000 	mov	ip, #0
    119c:	e3833902 	orr	r3, r3, #32768	; 0x8000
    11a0:	ea000004 	b	11b8 <USBInitializeISOCFrameArray+0x34>
    11a4:	e1834804 	orr	r4, r3, r4, lsl #16
    11a8:	e780410c 	str	r4, [r0, ip, lsl #2]
    11ac:	e28cc001 	add	ip, ip, #1
    11b0:	e1a0c80c 	lsl	ip, ip, #16
    11b4:	e1a0c82c 	lsr	ip, ip, #16
    11b8:	e08c4002 	add	r4, ip, r2
    11bc:	e1a04804 	lsl	r4, r4, #16
    11c0:	e15c0001 	cmp	ip, r1
    11c4:	e1a04824 	lsr	r4, r4, #16
    11c8:	3afffff5 	bcc	11a4 <USBInitializeISOCFrameArray+0x20>
    11cc:	e8bd8010 	pop	{r4, pc}

000011d0 <USBSetHeadDDForDMA>:
    11d0:	e20030ff 	and	r3, r0, #255	; 0xff
    11d4:	e1a033a3 	lsr	r3, r3, #7
    11d8:	e200000f 	and	r0, r0, #15
    11dc:	e1830080 	orr	r0, r3, r0, lsl #1
    11e0:	e7812100 	str	r2, [r1, r0, lsl #2]
    11e4:	e12fff1e 	bx	lr

000011e8 <USBInitializeUSBDMA>:
    11e8:	e3a03000 	mov	r3, #0
    11ec:	e1a02003 	mov	r2, r3
    11f0:	e7802003 	str	r2, [r0, r3]
    11f4:	e2833004 	add	r3, r3, #4
    11f8:	e3530080 	cmp	r3, #128	; 0x80
    11fc:	1afffffb 	bne	11f0 <USBInitializeUSBDMA+0x8>
    1200:	e59f3004 	ldr	r3, [pc, #4]	; 120c <USBInitializeUSBDMA+0x24>
    1204:	e5030d7f 	str	r0, [r3, #-3455]	; 0xd7f
    1208:	e12fff1e 	bx	lr
    120c:	ffe0cfff 	.word	0xffe0cfff

00001210 <StallControlPipe>:
    1210:	e92d4070 	push	{r4, r5, r6, lr}
    1214:	e3a01001 	mov	r1, #1
    1218:	e1a05000 	mov	r5, r0
    121c:	e3a00080 	mov	r0, #128	; 0x80
    1220:	ebfffe8b 	bl	c54 <USBHwEPStall>
    1224:	e59f002c 	ldr	r0, [pc, #44]	; 1258 <StallControlPipe+0x48>
    1228:	ebfffd16 	bl	688 <printf>
    122c:	e59f6028 	ldr	r6, [pc, #40]	; 125c <StallControlPipe+0x4c>
    1230:	e59f4028 	ldr	r4, [pc, #40]	; 1260 <StallControlPipe+0x50>
    1234:	e4d41001 	ldrb	r1, [r4], #1
    1238:	e59f0024 	ldr	r0, [pc, #36]	; 1264 <StallControlPipe+0x54>
    123c:	ebfffd11 	bl	688 <printf>
    1240:	e1540006 	cmp	r4, r6
    1244:	1afffffa 	bne	1234 <StallControlPipe+0x24>
    1248:	e59f0018 	ldr	r0, [pc, #24]	; 1268 <StallControlPipe+0x58>
    124c:	e1a01005 	mov	r1, r5
    1250:	e8bd4070 	pop	{r4, r5, r6, lr}
    1254:	eafffd0b 	b	688 <printf>
    1258:	00001d37 	.word	0x00001d37
    125c:	40000264 	.word	0x40000264
    1260:	4000025c 	.word	0x4000025c
    1264:	00001d42 	.word	0x00001d42
    1268:	00001d48 	.word	0x00001d48

0000126c <DataIn>:
    126c:	e92d4030 	push	{r4, r5, lr}
    1270:	e59f4034 	ldr	r4, [pc, #52]	; 12ac <DataIn+0x40>
    1274:	e5945008 	ldr	r5, [r4, #8]
    1278:	e3550040 	cmp	r5, #64	; 0x40
    127c:	a3a05040 	movge	r5, #64	; 0x40
    1280:	e1a02005 	mov	r2, r5
    1284:	e3a00080 	mov	r0, #128	; 0x80
    1288:	e594100c 	ldr	r1, [r4, #12]
    128c:	ebfffe78 	bl	c74 <USBHwEPWrite>
    1290:	e594300c 	ldr	r3, [r4, #12]
    1294:	e0833005 	add	r3, r3, r5
    1298:	e584300c 	str	r3, [r4, #12]
    129c:	e5943008 	ldr	r3, [r4, #8]
    12a0:	e0655003 	rsb	r5, r5, r3
    12a4:	e5845008 	str	r5, [r4, #8]
    12a8:	e8bd8030 	pop	{r4, r5, pc}
    12ac:	4000025c 	.word	0x4000025c

000012b0 <_HandleRequest.clone.0>:
    12b0:	e92d4010 	push	{r4, lr}
    12b4:	e59f003c 	ldr	r0, [pc, #60]	; 12f8 <_HandleRequest.clone.0+0x48>
    12b8:	e5d01000 	ldrb	r1, [r0]
    12bc:	e1a012a1 	lsr	r1, r1, #5
    12c0:	e2011003 	and	r1, r1, #3
    12c4:	e0803101 	add	r3, r0, r1, lsl #2
    12c8:	e5934010 	ldr	r4, [r3, #16]
    12cc:	e3540000 	cmp	r4, #0
    12d0:	1a000003 	bne	12e4 <_HandleRequest.clone.0+0x34>
    12d4:	e59f0020 	ldr	r0, [pc, #32]	; 12fc <_HandleRequest.clone.0+0x4c>
    12d8:	ebfffcea 	bl	688 <printf>
    12dc:	e1a00004 	mov	r0, r4
    12e0:	e8bd8010 	pop	{r4, pc}
    12e4:	e2801020 	add	r1, r0, #32
    12e8:	e280200c 	add	r2, r0, #12
    12ec:	e1a0e00f 	mov	lr, pc
    12f0:	e12fff14 	bx	r4
    12f4:	e8bd8010 	pop	{r4, pc}
    12f8:	4000025c 	.word	0x4000025c
    12fc:	00001d53 	.word	0x00001d53

00001300 <USBHandleControlTransfer>:
    1300:	e21030ff 	ands	r3, r0, #255	; 0xff
    1304:	e92d4031 	push	{r0, r4, r5, lr}
    1308:	e20150ff 	and	r5, r1, #255	; 0xff
    130c:	1a00004a 	bne	143c <USBHandleControlTransfer+0x13c>
    1310:	e2110004 	ands	r0, r1, #4
    1314:	e59f415c 	ldr	r4, [pc, #348]	; 1478 <USBHandleControlTransfer+0x178>
    1318:	0a00001e 	beq	1398 <USBHandleControlTransfer+0x98>
    131c:	e1a00003 	mov	r0, r3
    1320:	e3a02008 	mov	r2, #8
    1324:	e1a01004 	mov	r1, r4
    1328:	ebfffe72 	bl	cf8 <USBHwEPRead>
    132c:	e59f0148 	ldr	r0, [pc, #328]	; 147c <USBHandleControlTransfer+0x17c>
    1330:	e5d41001 	ldrb	r1, [r4, #1]
    1334:	ebfffcd3 	bl	688 <printf>
    1338:	e5d42000 	ldrb	r2, [r4]
    133c:	e1a031a2 	lsr	r3, r2, #3
    1340:	e203300c 	and	r3, r3, #12
    1344:	e0843003 	add	r3, r4, r3
    1348:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    134c:	e584300c 	str	r3, [r4, #12]
    1350:	e1d430b6 	ldrh	r3, [r4, #6]
    1354:	e3530000 	cmp	r3, #0
    1358:	e5843008 	str	r3, [r4, #8]
    135c:	e5843020 	str	r3, [r4, #32]
    1360:	0a000001 	beq	136c <USBHandleControlTransfer+0x6c>
    1364:	e1b023a2 	lsrs	r2, r2, #7
    1368:	0a000040 	beq	1470 <USBHandleControlTransfer+0x170>
    136c:	ebffffcf 	bl	12b0 <_HandleRequest.clone.0>
    1370:	e3500000 	cmp	r0, #0
    1374:	059f0104 	ldreq	r0, [pc, #260]	; 1480 <USBHandleControlTransfer+0x180>
    1378:	0a00001f 	beq	13fc <USBHandleControlTransfer+0xfc>
    137c:	e59f30f4 	ldr	r3, [pc, #244]	; 1478 <USBHandleControlTransfer+0x178>
    1380:	e1d310b6 	ldrh	r1, [r3, #6]
    1384:	e5932020 	ldr	r2, [r3, #32]
    1388:	e1510002 	cmp	r1, r2
    138c:	d5831008 	strle	r1, [r3, #8]
    1390:	c5832008 	strgt	r2, [r3, #8]
    1394:	ea00002a 	b	1444 <USBHandleControlTransfer+0x144>
    1398:	e5942008 	ldr	r2, [r4, #8]
    139c:	e3520000 	cmp	r2, #0
    13a0:	da00001a 	ble	1410 <USBHandleControlTransfer+0x110>
    13a4:	e594100c 	ldr	r1, [r4, #12]
    13a8:	ebfffe52 	bl	cf8 <USBHwEPRead>
    13ac:	e3500000 	cmp	r0, #0
    13b0:	ba000012 	blt	1400 <USBHandleControlTransfer+0x100>
    13b4:	e594300c 	ldr	r3, [r4, #12]
    13b8:	e0833000 	add	r3, r3, r0
    13bc:	e584300c 	str	r3, [r4, #12]
    13c0:	e5943008 	ldr	r3, [r4, #8]
    13c4:	e0600003 	rsb	r0, r0, r3
    13c8:	e3500000 	cmp	r0, #0
    13cc:	e5840008 	str	r0, [r4, #8]
    13d0:	1a000026 	bne	1470 <USBHandleControlTransfer+0x170>
    13d4:	e5d43000 	ldrb	r3, [r4]
    13d8:	e1a031a3 	lsr	r3, r3, #3
    13dc:	e203300c 	and	r3, r3, #12
    13e0:	e0843003 	add	r3, r4, r3
    13e4:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    13e8:	e584300c 	str	r3, [r4, #12]
    13ec:	ebffffaf 	bl	12b0 <_HandleRequest.clone.0>
    13f0:	e3500000 	cmp	r0, #0
    13f4:	1a000012 	bne	1444 <USBHandleControlTransfer+0x144>
    13f8:	e59f0084 	ldr	r0, [pc, #132]	; 1484 <USBHandleControlTransfer+0x184>
    13fc:	ebfffce1 	bl	788 <puts>
    1400:	e1a00005 	mov	r0, r5
    1404:	e28dd004 	add	sp, sp, #4
    1408:	e8bd4030 	pop	{r4, r5, lr}
    140c:	eaffff7f 	b	1210 <StallControlPipe>
    1410:	e1a01000 	mov	r1, r0
    1414:	e1a02000 	mov	r2, r0
    1418:	ebfffe36 	bl	cf8 <USBHwEPRead>
    141c:	e59f3064 	ldr	r3, [pc, #100]	; 1488 <USBHandleControlTransfer+0x188>
    1420:	e59f2064 	ldr	r2, [pc, #100]	; 148c <USBHandleControlTransfer+0x18c>
    1424:	e3500000 	cmp	r0, #0
    1428:	d1a00002 	movle	r0, r2
    142c:	c1a00003 	movgt	r0, r3
    1430:	e28dd004 	add	sp, sp, #4
    1434:	e8bd4030 	pop	{r4, r5, lr}
    1438:	eafffc92 	b	688 <printf>
    143c:	e3530080 	cmp	r3, #128	; 0x80
    1440:	1a000002 	bne	1450 <USBHandleControlTransfer+0x150>
    1444:	e28dd004 	add	sp, sp, #4
    1448:	e8bd4030 	pop	{r4, r5, lr}
    144c:	eaffff86 	b	126c <DataIn>
    1450:	e3a030d4 	mov	r3, #212	; 0xd4
    1454:	e58d3000 	str	r3, [sp]
    1458:	e59f0030 	ldr	r0, [pc, #48]	; 1490 <USBHandleControlTransfer+0x190>
    145c:	e59f1030 	ldr	r1, [pc, #48]	; 1494 <USBHandleControlTransfer+0x194>
    1460:	e59f2030 	ldr	r2, [pc, #48]	; 1498 <USBHandleControlTransfer+0x198>
    1464:	e59f3030 	ldr	r3, [pc, #48]	; 149c <USBHandleControlTransfer+0x19c>
    1468:	ebfffc86 	bl	688 <printf>
    146c:	eafffffe 	b	146c <USBHandleControlTransfer+0x16c>
    1470:	e28dd004 	add	sp, sp, #4
    1474:	e8bd8030 	pop	{r4, r5, pc}
    1478:	4000025c 	.word	0x4000025c
    147c:	00001d70 	.word	0x00001d70
    1480:	00001d74 	.word	0x00001d74
    1484:	00001d8b 	.word	0x00001d8b
    1488:	00001d6e 	.word	0x00001d6e
    148c:	00001cc1 	.word	0x00001cc1
    1490:	00001c9d 	.word	0x00001c9d
    1494:	00001da2 	.word	0x00001da2
    1498:	00001da8 	.word	0x00001da8
    149c:	00001c04 	.word	0x00001c04

000014a0 <USBRegisterRequestHandler>:
    14a0:	e92d4001 	push	{r0, lr}
    14a4:	e3500000 	cmp	r0, #0
    14a8:	aa000007 	bge	14cc <USBRegisterRequestHandler+0x2c>
    14ac:	e3a030e2 	mov	r3, #226	; 0xe2
    14b0:	e58d3000 	str	r3, [sp]
    14b4:	e59f004c 	ldr	r0, [pc, #76]	; 1508 <USBRegisterRequestHandler+0x68>
    14b8:	e59f104c 	ldr	r1, [pc, #76]	; 150c <USBRegisterRequestHandler+0x6c>
    14bc:	e59f204c 	ldr	r2, [pc, #76]	; 1510 <USBRegisterRequestHandler+0x70>
    14c0:	e59f304c 	ldr	r3, [pc, #76]	; 1514 <USBRegisterRequestHandler+0x74>
    14c4:	ebfffc6f 	bl	688 <printf>
    14c8:	eafffffe 	b	14c8 <USBRegisterRequestHandler+0x28>
    14cc:	e3500003 	cmp	r0, #3
    14d0:	da000007 	ble	14f4 <USBRegisterRequestHandler+0x54>
    14d4:	e3a030e3 	mov	r3, #227	; 0xe3
    14d8:	e58d3000 	str	r3, [sp]
    14dc:	e59f0024 	ldr	r0, [pc, #36]	; 1508 <USBRegisterRequestHandler+0x68>
    14e0:	e59f1030 	ldr	r1, [pc, #48]	; 1518 <USBRegisterRequestHandler+0x78>
    14e4:	e59f2024 	ldr	r2, [pc, #36]	; 1510 <USBRegisterRequestHandler+0x70>
    14e8:	e59f3024 	ldr	r3, [pc, #36]	; 1514 <USBRegisterRequestHandler+0x74>
    14ec:	ebfffc65 	bl	688 <printf>
    14f0:	eafffffe 	b	14f0 <USBRegisterRequestHandler+0x50>
    14f4:	e59f3020 	ldr	r3, [pc, #32]	; 151c <USBRegisterRequestHandler+0x7c>
    14f8:	e0830100 	add	r0, r3, r0, lsl #2
    14fc:	e5801010 	str	r1, [r0, #16]
    1500:	e5802024 	str	r2, [r0, #36]	; 0x24
    1504:	e8bd8008 	pop	{r3, pc}
    1508:	00001c9d 	.word	0x00001c9d
    150c:	00001db5 	.word	0x00001db5
    1510:	00001da8 	.word	0x00001da8
    1514:	00001c20 	.word	0x00001c20
    1518:	00001dc0 	.word	0x00001dc0
    151c:	4000025c 	.word	0x4000025c

00001520 <USBRegisterDescriptors>:
    1520:	e59f3004 	ldr	r3, [pc, #4]	; 152c <USBRegisterDescriptors+0xc>
    1524:	e5830000 	str	r0, [r3]
    1528:	e12fff1e 	bx	lr
    152c:	40000290 	.word	0x40000290

00001530 <USBGetDescriptor>:
    1530:	e59fc09c 	ldr	ip, [pc, #156]	; 15d4 <USBGetDescriptor+0xa4>
    1534:	e59cc000 	ldr	ip, [ip]
    1538:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    153c:	e1a00800 	lsl	r0, r0, #16
    1540:	e35c0000 	cmp	ip, #0
    1544:	e1a01820 	lsr	r1, r0, #16
    1548:	11a05c20 	lsrne	r5, r0, #24
    154c:	120160ff 	andne	r6, r1, #255	; 0xff
    1550:	13a00000 	movne	r0, #0
    1554:	1a000017 	bne	15b8 <USBGetDescriptor+0x88>
    1558:	e3a0306e 	mov	r3, #110	; 0x6e
    155c:	e58d3000 	str	r3, [sp]
    1560:	e59f0070 	ldr	r0, [pc, #112]	; 15d8 <USBGetDescriptor+0xa8>
    1564:	e59f1070 	ldr	r1, [pc, #112]	; 15dc <USBGetDescriptor+0xac>
    1568:	e59f2070 	ldr	r2, [pc, #112]	; 15e0 <USBGetDescriptor+0xb0>
    156c:	e59f3070 	ldr	r3, [pc, #112]	; 15e4 <USBGetDescriptor+0xb4>
    1570:	ebfffc44 	bl	688 <printf>
    1574:	eafffffe 	b	1574 <USBGetDescriptor+0x44>
    1578:	e5dc7001 	ldrb	r7, [ip, #1]
    157c:	e1570005 	cmp	r7, r5
    1580:	1a00000b 	bne	15b4 <USBGetDescriptor+0x84>
    1584:	e1500006 	cmp	r0, r6
    1588:	1a000008 	bne	15b0 <USBGetDescriptor+0x80>
    158c:	e583c000 	str	ip, [r3]
    1590:	e3550002 	cmp	r5, #2
    1594:	05dc1003 	ldrbeq	r1, [ip, #3]
    1598:	05dc3002 	ldrbeq	r3, [ip, #2]
    159c:	15dc3000 	ldrbne	r3, [ip]
    15a0:	01833401 	orreq	r3, r3, r1, lsl #8
    15a4:	e5823000 	str	r3, [r2]
    15a8:	e3a00001 	mov	r0, #1
    15ac:	ea000007 	b	15d0 <USBGetDescriptor+0xa0>
    15b0:	e2800001 	add	r0, r0, #1
    15b4:	e08cc004 	add	ip, ip, r4
    15b8:	e5dc4000 	ldrb	r4, [ip]
    15bc:	e3540000 	cmp	r4, #0
    15c0:	1affffec 	bne	1578 <USBGetDescriptor+0x48>
    15c4:	e59f001c 	ldr	r0, [pc, #28]	; 15e8 <USBGetDescriptor+0xb8>
    15c8:	ebfffc2e 	bl	688 <printf>
    15cc:	e1a00004 	mov	r0, r4
    15d0:	e8bd80f8 	pop	{r3, r4, r5, r6, r7, pc}
    15d4:	40000290 	.word	0x40000290
    15d8:	00001c9d 	.word	0x00001c9d
    15dc:	00001dca 	.word	0x00001dca
    15e0:	00001ddd 	.word	0x00001ddd
    15e4:	00001c3c 	.word	0x00001c3c
    15e8:	00001de9 	.word	0x00001de9

000015ec <USBHandleStandardRequest>:
    15ec:	e59f32e4 	ldr	r3, [pc, #740]	; 18d8 <USBHandleStandardRequest+0x2ec>
    15f0:	e5933004 	ldr	r3, [r3, #4]
    15f4:	e3530000 	cmp	r3, #0
    15f8:	e92d40f1 	push	{r0, r4, r5, r6, r7, lr}
    15fc:	e1a04000 	mov	r4, r0
    1600:	e1a05001 	mov	r5, r1
    1604:	e1a06002 	mov	r6, r2
    1608:	0a000003 	beq	161c <USBHandleStandardRequest+0x30>
    160c:	e1a0e00f 	mov	lr, pc
    1610:	e12fff13 	bx	r3
    1614:	e3500000 	cmp	r0, #0
    1618:	1a000071 	bne	17e4 <USBHandleStandardRequest+0x1f8>
    161c:	e5d43000 	ldrb	r3, [r4]
    1620:	e203301f 	and	r3, r3, #31
    1624:	e3530001 	cmp	r3, #1
    1628:	0a000057 	beq	178c <USBHandleStandardRequest+0x1a0>
    162c:	e3530002 	cmp	r3, #2
    1630:	0a000078 	beq	1818 <USBHandleStandardRequest+0x22c>
    1634:	e3530000 	cmp	r3, #0
    1638:	1a0000a3 	bne	18cc <USBHandleStandardRequest+0x2e0>
    163c:	e5d41001 	ldrb	r1, [r4, #1]
    1640:	e5963000 	ldr	r3, [r6]
    1644:	e3510009 	cmp	r1, #9
    1648:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    164c:	ea00004c 	b	1784 <USBHandleStandardRequest+0x198>
    1650:	000017d0 	.word	0x000017d0
    1654:	000018cc 	.word	0x000018cc
    1658:	00001784 	.word	0x00001784
    165c:	000018cc 	.word	0x000018cc
    1660:	00001784 	.word	0x00001784
    1664:	00001678 	.word	0x00001678
    1668:	00001684 	.word	0x00001684
    166c:	00001778 	.word	0x00001778
    1670:	000016ac 	.word	0x000016ac
    1674:	000016b8 	.word	0x000016b8
    1678:	e5d40002 	ldrb	r0, [r4, #2]
    167c:	ebfffd5b 	bl	bf0 <USBHwSetAddress>
    1680:	ea000057 	b	17e4 <USBHandleStandardRequest+0x1f8>
    1684:	e1d410b2 	ldrh	r1, [r4, #2]
    1688:	e59f024c 	ldr	r0, [pc, #588]	; 18dc <USBHandleStandardRequest+0x2f0>
    168c:	ebfffbfd 	bl	688 <printf>
    1690:	e1d400b2 	ldrh	r0, [r4, #2]
    1694:	e1d410b4 	ldrh	r1, [r4, #4]
    1698:	e1a02005 	mov	r2, r5
    169c:	e1a03006 	mov	r3, r6
    16a0:	e28dd004 	add	sp, sp, #4
    16a4:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    16a8:	eaffffa0 	b	1530 <USBGetDescriptor>
    16ac:	e59f2224 	ldr	r2, [pc, #548]	; 18d8 <USBHandleStandardRequest+0x2ec>
    16b0:	e5d22008 	ldrb	r2, [r2, #8]
    16b4:	ea00004d 	b	17f0 <USBHandleStandardRequest+0x204>
    16b8:	e59f3218 	ldr	r3, [pc, #536]	; 18d8 <USBHandleStandardRequest+0x2ec>
    16bc:	e5935000 	ldr	r5, [r3]
    16c0:	e3550000 	cmp	r5, #0
    16c4:	e1d460b2 	ldrh	r6, [r4, #2]
    16c8:	1a000007 	bne	16ec <USBHandleStandardRequest+0x100>
    16cc:	e3a030a5 	mov	r3, #165	; 0xa5
    16d0:	e58d3000 	str	r3, [sp]
    16d4:	e59f0204 	ldr	r0, [pc, #516]	; 18e0 <USBHandleStandardRequest+0x2f4>
    16d8:	e59f1204 	ldr	r1, [pc, #516]	; 18e4 <USBHandleStandardRequest+0x2f8>
    16dc:	e59f2204 	ldr	r2, [pc, #516]	; 18e8 <USBHandleStandardRequest+0x2fc>
    16e0:	e59f3204 	ldr	r3, [pc, #516]	; 18ec <USBHandleStandardRequest+0x300>
    16e4:	ebfffbe7 	bl	688 <printf>
    16e8:	eafffffe 	b	16e8 <USBHandleStandardRequest+0xfc>
    16ec:	e21660ff 	ands	r6, r6, #255	; 0xff
    16f0:	13a030ff 	movne	r3, #255	; 0xff
    16f4:	11a07003 	movne	r7, r3
    16f8:	01a00006 	moveq	r0, r6
    16fc:	1a000014 	bne	1754 <USBHandleStandardRequest+0x168>
    1700:	ea000017 	b	1764 <USBHandleStandardRequest+0x178>
    1704:	e5d52001 	ldrb	r2, [r5, #1]
    1708:	e3520004 	cmp	r2, #4
    170c:	05d53003 	ldrbeq	r3, [r5, #3]
    1710:	0a00000d 	beq	174c <USBHandleStandardRequest+0x160>
    1714:	e3520005 	cmp	r2, #5
    1718:	0a000002 	beq	1728 <USBHandleStandardRequest+0x13c>
    171c:	e3520002 	cmp	r2, #2
    1720:	05d57005 	ldrbeq	r7, [r5, #5]
    1724:	ea000008 	b	174c <USBHandleStandardRequest+0x160>
    1728:	e3530000 	cmp	r3, #0
    172c:	01570006 	cmpeq	r7, r6
    1730:	1a000005 	bne	174c <USBHandleStandardRequest+0x160>
    1734:	e5d53004 	ldrb	r3, [r5, #4]
    1738:	e5d51005 	ldrb	r1, [r5, #5]
    173c:	e5d50002 	ldrb	r0, [r5, #2]
    1740:	e1831401 	orr	r1, r3, r1, lsl #8
    1744:	ebfffce7 	bl	ae8 <USBHwEPConfig>
    1748:	e3a03000 	mov	r3, #0
    174c:	e5d52000 	ldrb	r2, [r5]
    1750:	e0855002 	add	r5, r5, r2
    1754:	e5d52000 	ldrb	r2, [r5]
    1758:	e3520000 	cmp	r2, #0
    175c:	1affffe8 	bne	1704 <USBHandleStandardRequest+0x118>
    1760:	e3a00001 	mov	r0, #1
    1764:	ebfffdb3 	bl	e38 <USBHwConfigDevice>
    1768:	e1d420b2 	ldrh	r2, [r4, #2]
    176c:	e59f3164 	ldr	r3, [pc, #356]	; 18d8 <USBHandleStandardRequest+0x2ec>
    1770:	e5c32008 	strb	r2, [r3, #8]
    1774:	ea00001a 	b	17e4 <USBHandleStandardRequest+0x1f8>
    1778:	e59f0170 	ldr	r0, [pc, #368]	; 18f0 <USBHandleStandardRequest+0x304>
    177c:	e3a01007 	mov	r1, #7
    1780:	ea000050 	b	18c8 <USBHandleStandardRequest+0x2dc>
    1784:	e59f0168 	ldr	r0, [pc, #360]	; 18f4 <USBHandleStandardRequest+0x308>
    1788:	ea00004e 	b	18c8 <USBHandleStandardRequest+0x2dc>
    178c:	e5d41001 	ldrb	r1, [r4, #1]
    1790:	e5963000 	ldr	r3, [r6]
    1794:	e351000b 	cmp	r1, #11
    1798:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    179c:	ea00001b 	b	1810 <USBHandleStandardRequest+0x224>
    17a0:	000017d0 	.word	0x000017d0
    17a4:	000018cc 	.word	0x000018cc
    17a8:	00001810 	.word	0x00001810
    17ac:	000018cc 	.word	0x000018cc
    17b0:	00001810 	.word	0x00001810
    17b4:	00001810 	.word	0x00001810
    17b8:	00001810 	.word	0x00001810
    17bc:	00001810 	.word	0x00001810
    17c0:	00001810 	.word	0x00001810
    17c4:	00001810 	.word	0x00001810
    17c8:	000017ec 	.word	0x000017ec
    17cc:	00001800 	.word	0x00001800
    17d0:	e3a02000 	mov	r2, #0
    17d4:	e5c32000 	strb	r2, [r3]
    17d8:	e5c32001 	strb	r2, [r3, #1]
    17dc:	e3a03002 	mov	r3, #2
    17e0:	e5853000 	str	r3, [r5]
    17e4:	e3a00001 	mov	r0, #1
    17e8:	ea000038 	b	18d0 <USBHandleStandardRequest+0x2e4>
    17ec:	e3a02000 	mov	r2, #0
    17f0:	e3a00001 	mov	r0, #1
    17f4:	e5c32000 	strb	r2, [r3]
    17f8:	e5850000 	str	r0, [r5]
    17fc:	ea000033 	b	18d0 <USBHandleStandardRequest+0x2e4>
    1800:	e1d430b2 	ldrh	r3, [r4, #2]
    1804:	e3530000 	cmp	r3, #0
    1808:	0afffff4 	beq	17e0 <USBHandleStandardRequest+0x1f4>
    180c:	ea00002e 	b	18cc <USBHandleStandardRequest+0x2e0>
    1810:	e59f00e0 	ldr	r0, [pc, #224]	; 18f8 <USBHandleStandardRequest+0x30c>
    1814:	ea00002b 	b	18c8 <USBHandleStandardRequest+0x2dc>
    1818:	e5d41001 	ldrb	r1, [r4, #1]
    181c:	e5966000 	ldr	r6, [r6]
    1820:	e351000c 	cmp	r1, #12
    1824:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1828:	ea000025 	b	18c4 <USBHandleStandardRequest+0x2d8>
    182c:	00001860 	.word	0x00001860
    1830:	00001888 	.word	0x00001888
    1834:	000018c4 	.word	0x000018c4
    1838:	0000189c 	.word	0x0000189c
    183c:	000018c4 	.word	0x000018c4
    1840:	000018c4 	.word	0x000018c4
    1844:	000018c4 	.word	0x000018c4
    1848:	000018c4 	.word	0x000018c4
    184c:	000018c4 	.word	0x000018c4
    1850:	000018c4 	.word	0x000018c4
    1854:	000018c4 	.word	0x000018c4
    1858:	000018c4 	.word	0x000018c4
    185c:	000018b8 	.word	0x000018b8
    1860:	e5d40004 	ldrb	r0, [r4, #4]
    1864:	ebfffcf5 	bl	c40 <USBHwEPGetStatus>
    1868:	e3100002 	tst	r0, #2
    186c:	03a03000 	moveq	r3, #0
    1870:	13a03001 	movne	r3, #1
    1874:	e5c63000 	strb	r3, [r6]
    1878:	e3a03000 	mov	r3, #0
    187c:	e5c63001 	strb	r3, [r6, #1]
    1880:	e2833002 	add	r3, r3, #2
    1884:	eaffffd5 	b	17e0 <USBHandleStandardRequest+0x1f4>
    1888:	e1d410b2 	ldrh	r1, [r4, #2]
    188c:	e3510000 	cmp	r1, #0
    1890:	05d40004 	ldrbeq	r0, [r4, #4]
    1894:	1a00000c 	bne	18cc <USBHandleStandardRequest+0x2e0>
    1898:	ea000004 	b	18b0 <USBHandleStandardRequest+0x2c4>
    189c:	e1d430b2 	ldrh	r3, [r4, #2]
    18a0:	e3530000 	cmp	r3, #0
    18a4:	1a000008 	bne	18cc <USBHandleStandardRequest+0x2e0>
    18a8:	e5d40004 	ldrb	r0, [r4, #4]
    18ac:	e3a01001 	mov	r1, #1
    18b0:	ebfffce7 	bl	c54 <USBHwEPStall>
    18b4:	eaffffca 	b	17e4 <USBHandleStandardRequest+0x1f8>
    18b8:	e59f003c 	ldr	r0, [pc, #60]	; 18fc <USBHandleStandardRequest+0x310>
    18bc:	e3a0100c 	mov	r1, #12
    18c0:	ea000000 	b	18c8 <USBHandleStandardRequest+0x2dc>
    18c4:	e59f0034 	ldr	r0, [pc, #52]	; 1900 <USBHandleStandardRequest+0x314>
    18c8:	ebfffb6e 	bl	688 <printf>
    18cc:	e3a00000 	mov	r0, #0
    18d0:	e28dd004 	add	sp, sp, #4
    18d4:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    18d8:	40000290 	.word	0x40000290
    18dc:	00001dfd 	.word	0x00001dfd
    18e0:	00001c9d 	.word	0x00001c9d
    18e4:	00001dca 	.word	0x00001dca
    18e8:	00001ddd 	.word	0x00001ddd
    18ec:	00001c50 	.word	0x00001c50
    18f0:	00001e01 	.word	0x00001e01
    18f4:	00001e20 	.word	0x00001e20
    18f8:	00001e37 	.word	0x00001e37
    18fc:	00001e51 	.word	0x00001e51
    1900:	00001e6c 	.word	0x00001e6c

00001904 <USBRegisterCustomReqHandler>:
    1904:	e59f3004 	ldr	r3, [pc, #4]	; 1910 <USBRegisterCustomReqHandler+0xc>
    1908:	e5830004 	str	r0, [r3, #4]
    190c:	e12fff1e 	bx	lr
    1910:	40000290 	.word	0x40000290

00001914 <HandleUsbReset>:
    1914:	e3100010 	tst	r0, #16
    1918:	012fff1e 	bxeq	lr
    191c:	e59f0000 	ldr	r0, [pc, #0]	; 1924 <HandleUsbReset+0x10>
    1920:	eafffb58 	b	688 <printf>
    1924:	00001e7f 	.word	0x00001e7f

00001928 <USBInit>:
    1928:	e92d4010 	push	{r4, lr}
    192c:	e59f4050 	ldr	r4, [pc, #80]	; 1984 <USBInit+0x5c>
    1930:	ebfffd91 	bl	f7c <USBHwInit>
    1934:	e59f004c 	ldr	r0, [pc, #76]	; 1988 <USBInit+0x60>
    1938:	ebfffc96 	bl	b98 <USBHwRegisterDevIntHandler>
    193c:	e1a01004 	mov	r1, r4
    1940:	e3a00000 	mov	r0, #0
    1944:	ebfffc7c 	bl	b3c <USBHwRegisterEPIntHandler>
    1948:	e1a01004 	mov	r1, r4
    194c:	e3a00080 	mov	r0, #128	; 0x80
    1950:	ebfffc79 	bl	b3c <USBHwRegisterEPIntHandler>
    1954:	e3a00000 	mov	r0, #0
    1958:	e3a01040 	mov	r1, #64	; 0x40
    195c:	ebfffc61 	bl	ae8 <USBHwEPConfig>
    1960:	e3a00080 	mov	r0, #128	; 0x80
    1964:	e3a01040 	mov	r1, #64	; 0x40
    1968:	ebfffc5e 	bl	ae8 <USBHwEPConfig>
    196c:	e3a00000 	mov	r0, #0
    1970:	e59f1014 	ldr	r1, [pc, #20]	; 198c <USBInit+0x64>
    1974:	e59f2014 	ldr	r2, [pc, #20]	; 1990 <USBInit+0x68>
    1978:	ebfffec8 	bl	14a0 <USBRegisterRequestHandler>
    197c:	e3a00001 	mov	r0, #1
    1980:	e8bd8010 	pop	{r4, pc}
    1984:	00001300 	.word	0x00001300
    1988:	00001914 	.word	0x00001914
    198c:	000015ec 	.word	0x000015ec
    1990:	4000029c 	.word	0x4000029c

00001994 <__aeabi_uidiv>:
    1994:	e2512001 	subs	r2, r1, #1
    1998:	012fff1e 	bxeq	lr
    199c:	3a000036 	bcc	1a7c <__aeabi_uidiv+0xe8>
    19a0:	e1500001 	cmp	r0, r1
    19a4:	9a000022 	bls	1a34 <__aeabi_uidiv+0xa0>
    19a8:	e1110002 	tst	r1, r2
    19ac:	0a000023 	beq	1a40 <__aeabi_uidiv+0xac>
    19b0:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    19b4:	01a01181 	lsleq	r1, r1, #3
    19b8:	03a03008 	moveq	r3, #8
    19bc:	13a03001 	movne	r3, #1
    19c0:	e3510201 	cmp	r1, #268435456	; 0x10000000
    19c4:	31510000 	cmpcc	r1, r0
    19c8:	31a01201 	lslcc	r1, r1, #4
    19cc:	31a03203 	lslcc	r3, r3, #4
    19d0:	3afffffa 	bcc	19c0 <__aeabi_uidiv+0x2c>
    19d4:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    19d8:	31510000 	cmpcc	r1, r0
    19dc:	31a01081 	lslcc	r1, r1, #1
    19e0:	31a03083 	lslcc	r3, r3, #1
    19e4:	3afffffa 	bcc	19d4 <__aeabi_uidiv+0x40>
    19e8:	e3a02000 	mov	r2, #0
    19ec:	e1500001 	cmp	r0, r1
    19f0:	20400001 	subcs	r0, r0, r1
    19f4:	21822003 	orrcs	r2, r2, r3
    19f8:	e15000a1 	cmp	r0, r1, lsr #1
    19fc:	204000a1 	subcs	r0, r0, r1, lsr #1
    1a00:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1a04:	e1500121 	cmp	r0, r1, lsr #2
    1a08:	20400121 	subcs	r0, r0, r1, lsr #2
    1a0c:	21822123 	orrcs	r2, r2, r3, lsr #2
    1a10:	e15001a1 	cmp	r0, r1, lsr #3
    1a14:	204001a1 	subcs	r0, r0, r1, lsr #3
    1a18:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1a1c:	e3500000 	cmp	r0, #0
    1a20:	11b03223 	lsrsne	r3, r3, #4
    1a24:	11a01221 	lsrne	r1, r1, #4
    1a28:	1affffef 	bne	19ec <__aeabi_uidiv+0x58>
    1a2c:	e1a00002 	mov	r0, r2
    1a30:	e12fff1e 	bx	lr
    1a34:	03a00001 	moveq	r0, #1
    1a38:	13a00000 	movne	r0, #0
    1a3c:	e12fff1e 	bx	lr
    1a40:	e3510801 	cmp	r1, #65536	; 0x10000
    1a44:	21a01821 	lsrcs	r1, r1, #16
    1a48:	23a02010 	movcs	r2, #16
    1a4c:	33a02000 	movcc	r2, #0
    1a50:	e3510c01 	cmp	r1, #256	; 0x100
    1a54:	21a01421 	lsrcs	r1, r1, #8
    1a58:	22822008 	addcs	r2, r2, #8
    1a5c:	e3510010 	cmp	r1, #16
    1a60:	21a01221 	lsrcs	r1, r1, #4
    1a64:	22822004 	addcs	r2, r2, #4
    1a68:	e3510004 	cmp	r1, #4
    1a6c:	82822003 	addhi	r2, r2, #3
    1a70:	908220a1 	addls	r2, r2, r1, lsr #1
    1a74:	e1a00230 	lsr	r0, r0, r2
    1a78:	e12fff1e 	bx	lr
    1a7c:	e52de008 	str	lr, [sp, #-8]!
    1a80:	eb00003c 	bl	1b78 <__div0>
    1a84:	e3a00000 	mov	r0, #0
    1a88:	e49df008 	ldr	pc, [sp], #8

00001a8c <__aeabi_uidivmod>:
    1a8c:	e3510000 	cmp	r1, #0
    1a90:	0afffff9 	beq	1a7c <__aeabi_uidiv+0xe8>
    1a94:	e92d4003 	push	{r0, r1, lr}
    1a98:	ebffffbd 	bl	1994 <__aeabi_uidiv>
    1a9c:	e8bd4006 	pop	{r1, r2, lr}
    1aa0:	e0030092 	mul	r3, r2, r0
    1aa4:	e0411003 	sub	r1, r1, r3
    1aa8:	e12fff1e 	bx	lr

00001aac <__umodsi3>:
    1aac:	e2512001 	subs	r2, r1, #1
    1ab0:	3a00002c 	bcc	1b68 <__umodsi3+0xbc>
    1ab4:	11500001 	cmpne	r0, r1
    1ab8:	03a00000 	moveq	r0, #0
    1abc:	81110002 	tsthi	r1, r2
    1ac0:	00000002 	andeq	r0, r0, r2
    1ac4:	912fff1e 	bxls	lr
    1ac8:	e3a02000 	mov	r2, #0
    1acc:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1ad0:	31510000 	cmpcc	r1, r0
    1ad4:	31a01201 	lslcc	r1, r1, #4
    1ad8:	32822004 	addcc	r2, r2, #4
    1adc:	3afffffa 	bcc	1acc <__umodsi3+0x20>
    1ae0:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1ae4:	31510000 	cmpcc	r1, r0
    1ae8:	31a01081 	lslcc	r1, r1, #1
    1aec:	32822001 	addcc	r2, r2, #1
    1af0:	3afffffa 	bcc	1ae0 <__umodsi3+0x34>
    1af4:	e2522003 	subs	r2, r2, #3
    1af8:	ba00000e 	blt	1b38 <__umodsi3+0x8c>
    1afc:	e1500001 	cmp	r0, r1
    1b00:	20400001 	subcs	r0, r0, r1
    1b04:	e15000a1 	cmp	r0, r1, lsr #1
    1b08:	204000a1 	subcs	r0, r0, r1, lsr #1
    1b0c:	e1500121 	cmp	r0, r1, lsr #2
    1b10:	20400121 	subcs	r0, r0, r1, lsr #2
    1b14:	e15001a1 	cmp	r0, r1, lsr #3
    1b18:	204001a1 	subcs	r0, r0, r1, lsr #3
    1b1c:	e3500001 	cmp	r0, #1
    1b20:	e1a01221 	lsr	r1, r1, #4
    1b24:	a2522004 	subsge	r2, r2, #4
    1b28:	aafffff3 	bge	1afc <__umodsi3+0x50>
    1b2c:	e3120003 	tst	r2, #3
    1b30:	13300000 	teqne	r0, #0
    1b34:	0a00000a 	beq	1b64 <__umodsi3+0xb8>
    1b38:	e3720002 	cmn	r2, #2
    1b3c:	ba000006 	blt	1b5c <__umodsi3+0xb0>
    1b40:	0a000002 	beq	1b50 <__umodsi3+0xa4>
    1b44:	e1500001 	cmp	r0, r1
    1b48:	20400001 	subcs	r0, r0, r1
    1b4c:	e1a010a1 	lsr	r1, r1, #1
    1b50:	e1500001 	cmp	r0, r1
    1b54:	20400001 	subcs	r0, r0, r1
    1b58:	e1a010a1 	lsr	r1, r1, #1
    1b5c:	e1500001 	cmp	r0, r1
    1b60:	20400001 	subcs	r0, r0, r1
    1b64:	e12fff1e 	bx	lr
    1b68:	e52de008 	str	lr, [sp, #-8]!
    1b6c:	eb000001 	bl	1b78 <__div0>
    1b70:	e3a00000 	mov	r0, #0
    1b74:	e49df008 	ldr	pc, [sp], #8

00001b78 <__div0>:
    1b78:	e12fff1e 	bx	lr

00001b7c <abDescriptors>:
    1b7c:	01010112 40000002 0005ffff 02010100     .......@........
    1b8c:	02090103 01010020 0932c000 02000004     .... .....2.....
    1b9c:	000000ff 0d060507 07010080 800d8305     ................
    1bac:	03040100 030e0409 0050004c 00550043     ........L.P.C.U.
    1bbc:	00420053 00550314 00420053 00650053     S.B...U.S.B.S.e.
    1bcc:	00690072 006c0061 00440312 00410045     r.i.a.l...D.E.A.
    1bdc:	00430044 00440030 00000045              D.C.0.D.E...

00001be8 <__FUNCTION__.1347>:
    1be8:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    1bf8:	6148746e 656c646e 00000072              ntHandler...

00001c04 <__FUNCTION__.1330>:
    1c04:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    1c14:	6e617254 72656673 00000000              Transfer....

00001c20 <__FUNCTION__.1337>:
    1c20:	52425355 73696765 52726574 65757165     USBRegisterReque
    1c30:	61487473 656c646e 00000072              stHandler...

00001c3c <__FUNCTION__.1326>:
    1c3c:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    1c4c:	00000000                                ....

00001c50 <__FUNCTION__.1340>:
    1c50:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    1c60:	006e6f69 6c756e28 4900296c 6974696e     ion.(null).Initi
    1c70:	73696c61 20676e69 20425355 63617473     alising USB stac
    1c80:	7453006b 69747261 5520676e 63204253     k.Starting USB c
    1c90:	756d6d6f 6163696e 6e6f6974 73410a00     ommunication..As
    1ca0:	74726573 206e6f69 27732527 69616620     sertion '%s' fai
    1cb0:	2064656c 25206e69 73253a73 21642523     led in %s:%s#%d!
    1cc0:	6469000a 32333c78 62737500 6c5f7768     ..idx<32.usbhw_l
    1cd0:	632e6370 67655200 65747369 20646572     pc.c.Registered 
    1ce0:	646e6168 2072656c 20726f66 30205045     handler for EP 0
    1cf0:	0a782578 67655200 65747369 20646572     x%x..Registered 
    1d00:	646e6168 2072656c 20726f66 69766564     handler for devi
    1d10:	73206563 75746174 65520073 74736967     ce status.Regist
    1d20:	64657265 6e616820 72656c64 726f6620     ered handler for
    1d30:	61726620 5300656d 4c4c4154 206e6f20      frame.STALL on 
    1d40:	2520005b 00783230 7473205d 253d7461     [. %02x.] stat=%
    1d50:	4e000a78 6168206f 656c646e 6f662072     x..No handler fo
    1d60:	65722072 70797471 64252065 003f000a     r reqtype %d..?.
    1d70:	00782553 6e61485f 52656c64 65757165     S%x._HandleReque
    1d80:	20317473 6c696166 5f006465 646e6148     st1 failed._Hand
    1d90:	6552656c 73657571 66203274 656c6961     leRequest2 faile
    1da0:	41460064 0045534c 63627375 72746e6f     d.FALSE.usbcontr
    1db0:	632e6c6f 79546900 3e206570 0030203d     ol.c.iType >= 0.
    1dc0:	70795469 203c2065 61700034 73654462     iType < 4.pabDes
    1dd0:	70697263 203d2120 4c4c554e 62737500     crip != NULL.usb
    1de0:	72647473 632e7165 73654400 78252063     stdreq.c.Desc %x
    1df0:	746f6e20 756f6620 0a21646e 78254400      not found!..D%x
    1e00:	76654400 20656369 20716572 6e206425     .Device req %d n
    1e10:	6920746f 656c706d 746e656d 000a6465     ot implemented..
    1e20:	656c6c49 206c6167 69766564 72206563     Illegal device r
    1e30:	25207165 49000a64 67656c6c 69206c61     eq %d..Illegal i
    1e40:	7265746e 65636166 71657220 0a642520     nterface req %d.
    1e50:	20504500 20716572 6e206425 6920746f     .EP req %d not i
    1e60:	656c706d 746e656d 000a6465 656c6c49     mplemented..Ille
    1e70:	206c6167 72205045 25207165 0a000a64     gal EP req %d...
    1e80:	00000021                                         !.
