
isoc_io_dma_sample.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_startup>:
       0:	e59ff018 	ldr	pc, [pc, #24]	; 20 <Reset_Addr>
       4:	e59ff018 	ldr	pc, [pc, #24]	; 24 <Undef_Addr>
       8:	e59ff018 	ldr	pc, [pc, #24]	; 28 <SWI_Addr>
       c:	e59ff018 	ldr	pc, [pc, #24]	; 2c <PAbt_Addr>
      10:	e59ff018 	ldr	pc, [pc, #24]	; 30 <DAbt_Addr>
      14:	e1a00000 	nop			(mov r0,r0)
      18:	e51ffff0 	ldr	pc, [pc, #-4080]	; fffff030 <outputIsocFrameArray+0x802feb30>
      1c:	e59ff014 	ldr	pc, [pc, #20]	; 38 <FIQ_Addr>

00000020 <Reset_Addr>:
      20:	00000040 	.word	0x00000040

00000024 <Undef_Addr>:
      24:	000000e4 	.word	0x000000e4

00000028 <SWI_Addr>:
      28:	000000e0 	.word	0x000000e0

0000002c <PAbt_Addr>:
      2c:	000000e4 	.word	0x000000e4

00000030 <DAbt_Addr>:
      30:	000000e4 	.word	0x000000e4

00000034 <IRQ_Addr>:
      34:	000000d8 	.word	0x000000d8

00000038 <FIQ_Addr>:
      38:	000000dc 	.word	0x000000dc
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
      a4:	e3a00000 	mov	r0, #0	; 0x0
      a8:	e59f1020 	ldr	r1, [pc, #32]	; d0 <I_BIT+0x50>
      ac:	e59f2020 	ldr	r2, [pc, #32]	; d4 <I_BIT+0x54>
      b0:	e1510002 	cmp	r1, r2
      b4:	34810004 	strcc	r0, [r1], #4
      b8:	3afffffc 	bcc	b0 <I_BIT+0x30>
      bc:	ea0001b9 	b	7a8 <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	00002120 	.word	0x00002120
      c8:	40000200 	.word	0x40000200
      cc:	40000202 	.word	0x40000202
      d0:	40000204 	.word	0x40000204
      d4:	400002b8 	.word	0x400002b8

000000d8 <IRQ_Routine>:
      d8:	eafffffe 	b	d8 <IRQ_Routine>

000000dc <FIQ_Routine>:
      dc:	eafffffe 	b	dc <FIQ_Routine>

000000e0 <SWI_Routine>:
      e0:	eafffffe 	b	e0 <SWI_Routine>

000000e4 <UNDEF_Routine>:
      e4:	eafffffe 	b	e4 <UNDEF_Routine>

000000e8 <HalSysPinSelect>:
      e8:	e20020ff 	and	r2, r0, #255	; 0xff
      ec:	e352000f 	cmp	r2, #15	; 0xf
      f0:	e201c0ff 	and	ip, r1, #255	; 0xff
      f4:	8a000007 	bhi	118 <IRQ_STACK_SIZE+0x18>
      f8:	e59f0040 	ldr	r0, [pc, #64]	; 140 <IRQ_STACK_SIZE+0x40>
      fc:	e5903000 	ldr	r3, [r0]
     100:	e1a01082 	lsl	r1, r2, #1
     104:	e3a02003 	mov	r2, #3	; 0x3
     108:	e1c33112 	bic	r3, r3, r2, lsl r1
     10c:	e183311c 	orr	r3, r3, ip, lsl r1
     110:	e5803000 	str	r3, [r0]
     114:	e12fff1e 	bx	lr
     118:	e59f0020 	ldr	r0, [pc, #32]	; 140 <IRQ_STACK_SIZE+0x40>
     11c:	e2422010 	sub	r2, r2, #16	; 0x10
     120:	e5903004 	ldr	r3, [r0, #4]
     124:	e20220ff 	and	r2, r2, #255	; 0xff
     128:	e1a02082 	lsl	r2, r2, #1
     12c:	e3a01003 	mov	r1, #3	; 0x3
     130:	e1c33211 	bic	r3, r3, r1, lsl r2
     134:	e183321c 	orr	r3, r3, ip, lsl r2
     138:	e5803004 	str	r3, [r0, #4]
     13c:	e12fff1e 	bx	lr
     140:	e002c000 	.word	0xe002c000

00000144 <HalSysGetCCLK>:
     144:	e59f0000 	ldr	r0, [pc, #0]	; 14c <HalSysGetCCLK+0x8>
     148:	e12fff1e 	bx	lr
     14c:	03938700 	.word	0x03938700

00000150 <HalSysGetPCLK>:
     150:	e59f0000 	ldr	r0, [pc, #0]	; 158 <HalSysGetPCLK+0x8>
     154:	e12fff1e 	bx	lr
     158:	03938700 	.word	0x03938700

0000015c <HalPinSelect>:
     15c:	e20020ff 	and	r2, r0, #255	; 0xff
     160:	e352000f 	cmp	r2, #15	; 0xf
     164:	e201c0ff 	and	ip, r1, #255	; 0xff
     168:	8a000007 	bhi	18c <HalPinSelect+0x30>
     16c:	e59f0040 	ldr	r0, [pc, #64]	; 1b4 <HalPinSelect+0x58>
     170:	e5903000 	ldr	r3, [r0]
     174:	e1a01082 	lsl	r1, r2, #1
     178:	e3a02003 	mov	r2, #3	; 0x3
     17c:	e1c33112 	bic	r3, r3, r2, lsl r1
     180:	e183311c 	orr	r3, r3, ip, lsl r1
     184:	e5803000 	str	r3, [r0]
     188:	e12fff1e 	bx	lr
     18c:	e59f0020 	ldr	r0, [pc, #32]	; 1b4 <HalPinSelect+0x58>
     190:	e2422010 	sub	r2, r2, #16	; 0x10
     194:	e5903004 	ldr	r3, [r0, #4]
     198:	e20220ff 	and	r2, r2, #255	; 0xff
     19c:	e1a02082 	lsl	r2, r2, #1
     1a0:	e3a01003 	mov	r1, #3	; 0x3
     1a4:	e1c33211 	bic	r3, r3, r1, lsl r2
     1a8:	e183321c 	orr	r3, r3, ip, lsl r2
     1ac:	e5803004 	str	r3, [r0, #4]
     1b0:	e12fff1e 	bx	lr
     1b4:	e002c000 	.word	0xe002c000

000001b8 <HalSysInit>:
     1b8:	e59f3064 	ldr	r3, [pc, #100]	; 224 <HalSysInit+0x6c>
     1bc:	e3a02024 	mov	r2, #36	; 0x24
     1c0:	e5832084 	str	r2, [r3, #132]
     1c4:	e3a010aa 	mov	r1, #170	; 0xaa
     1c8:	e3a00055 	mov	r0, #85	; 0x55
     1cc:	e3a02001 	mov	r2, #1	; 0x1
     1d0:	e583108c 	str	r1, [r3, #140]
     1d4:	e583008c 	str	r0, [r3, #140]
     1d8:	e5832080 	str	r2, [r3, #128]
     1dc:	e583108c 	str	r1, [r3, #140]
     1e0:	e583008c 	str	r0, [r3, #140]
     1e4:	e1a01003 	mov	r1, r3
     1e8:	e5913088 	ldr	r3, [r1, #136]
     1ec:	e3130b01 	tst	r3, #1024	; 0x400
     1f0:	0afffffc 	beq	1e8 <HalSysInit+0x30>
     1f4:	e3a02003 	mov	r2, #3	; 0x3
     1f8:	e3a030aa 	mov	r3, #170	; 0xaa
     1fc:	e5812080 	str	r2, [r1, #128]
     200:	e581308c 	str	r3, [r1, #140]
     204:	e3a03055 	mov	r3, #85	; 0x55
     208:	e581308c 	str	r3, [r1, #140]
     20c:	e3a03002 	mov	r3, #2	; 0x2
     210:	e5812004 	str	r2, [r1, #4]
     214:	e5813000 	str	r3, [r1]
     218:	e3a03001 	mov	r3, #1	; 0x1
     21c:	e5813100 	str	r3, [r1, #256]
     220:	e12fff1e 	bx	lr
     224:	e01fc000 	.word	0xe01fc000

00000228 <printchar>:
     228:	e3500000 	cmp	r0, #0	; 0x0
     22c:	0a000005 	beq	248 <printchar+0x20>
     230:	e5903000 	ldr	r3, [r0]
     234:	e5c31000 	strb	r1, [r3]
     238:	e5903000 	ldr	r3, [r0]
     23c:	e2833001 	add	r3, r3, #1	; 0x1
     240:	e5803000 	str	r3, [r0]
     244:	e12fff1e 	bx	lr
     248:	e1a00001 	mov	r0, r1
     24c:	ea00011f 	b	6d0 <putchar>

00000250 <prints>:
     250:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
     254:	e2524000 	subs	r4, r2, #0	; 0x0
     258:	e1a07000 	mov	r7, r0
     25c:	e1a05001 	mov	r5, r1
     260:	c3a02000 	movgt	r2, #0	; 0x0
     264:	ca000001 	bgt	270 <prints+0x20>
     268:	ea000009 	b	294 <prints+0x44>
     26c:	e2822001 	add	r2, r2, #1	; 0x1
     270:	e7d21005 	ldrb	r1, [r2, r5]
     274:	e3510000 	cmp	r1, #0	; 0x0
     278:	1afffffb 	bne	26c <prints+0x1c>
     27c:	e1520004 	cmp	r2, r4
     280:	a1a04001 	movge	r4, r1
     284:	b0624004 	rsblt	r4, r2, r4
     288:	e3130002 	tst	r3, #2	; 0x2
     28c:	13a08030 	movne	r8, #48	; 0x30
     290:	1a000000 	bne	298 <prints+0x48>
     294:	e3a08020 	mov	r8, #32	; 0x20
     298:	e2130001 	ands	r0, r3, #1	; 0x1
     29c:	13a06000 	movne	r6, #0	; 0x0
     2a0:	01a06000 	moveq	r6, r0
     2a4:	0a000003 	beq	2b8 <prints+0x68>
     2a8:	ea000009 	b	2d4 <prints+0x84>
     2ac:	ebffffdd 	bl	228 <printchar>
     2b0:	e2866001 	add	r6, r6, #1	; 0x1
     2b4:	e2444001 	sub	r4, r4, #1	; 0x1
     2b8:	e3540000 	cmp	r4, #0	; 0x0
     2bc:	e1a00007 	mov	r0, r7
     2c0:	e1a01008 	mov	r1, r8
     2c4:	cafffff8 	bgt	2ac <prints+0x5c>
     2c8:	ea000001 	b	2d4 <prints+0x84>
     2cc:	ebffffd5 	bl	228 <printchar>
     2d0:	e2866001 	add	r6, r6, #1	; 0x1
     2d4:	e5d53000 	ldrb	r3, [r5]
     2d8:	e2531000 	subs	r1, r3, #0	; 0x0
     2dc:	e1a00007 	mov	r0, r7
     2e0:	e2855001 	add	r5, r5, #1	; 0x1
     2e4:	1afffff8 	bne	2cc <prints+0x7c>
     2e8:	ea000001 	b	2f4 <prints+0xa4>
     2ec:	ebffffcd 	bl	228 <printchar>
     2f0:	e2866001 	add	r6, r6, #1	; 0x1
     2f4:	e3540000 	cmp	r4, #0	; 0x0
     2f8:	e1a00007 	mov	r0, r7
     2fc:	e1a01008 	mov	r1, r8
     300:	e2444001 	sub	r4, r4, #1	; 0x1
     304:	cafffff8 	bgt	2ec <prints+0x9c>
     308:	e1a00006 	mov	r0, r6
     30c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00000310 <printi>:
     310:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     314:	e2514000 	subs	r4, r1, #0	; 0x0
     318:	e24dd00c 	sub	sp, sp, #12	; 0xc
     31c:	e1a06002 	mov	r6, r2
     320:	e1a0b000 	mov	fp, r0
     324:	e28d7030 	add	r7, sp, #48	; 0x30
     328:	e8970280 	ldm	r7, {r7, r9}
     32c:	1a000007 	bne	350 <printi+0x40>
     330:	e3a0c030 	mov	ip, #48	; 0x30
     334:	e1a02007 	mov	r2, r7
     338:	e1a03009 	mov	r3, r9
     33c:	e1a0100d 	mov	r1, sp
     340:	e5cdc000 	strb	ip, [sp]
     344:	e5cd4001 	strb	r4, [sp, #1]
     348:	ebffffc0 	bl	250 <prints>
     34c:	ea000037 	b	430 <SVC_STACK_SIZE+0x30>
     350:	e2533000 	subs	r3, r3, #0	; 0x0
     354:	13a03001 	movne	r3, #1	; 0x1
     358:	e352000a 	cmp	r2, #10	; 0xa
     35c:	13a03000 	movne	r3, #0	; 0x0
     360:	e3530000 	cmp	r3, #0	; 0x0
     364:	0a000003 	beq	378 <printi+0x68>
     368:	e3540000 	cmp	r4, #0	; 0x0
     36c:	b2644000 	rsblt	r4, r4, #0	; 0x0
     370:	b3a08001 	movlt	r8, #1	; 0x1
     374:	ba000000 	blt	37c <printi+0x6c>
     378:	e3a08000 	mov	r8, #0	; 0x0
     37c:	e59d3038 	ldr	r3, [sp, #56]
     380:	e28d200b 	add	r2, sp, #11	; 0xb
     384:	e243a03a 	sub	sl, r3, #58	; 0x3a
     388:	e3a03000 	mov	r3, #0	; 0x0
     38c:	e5cd300b 	strb	r3, [sp, #11]
     390:	ea00000a 	b	3c0 <printi+0xb0>
     394:	eb000662 	bl	1d24 <__umodsi3>
     398:	e1a03000 	mov	r3, r0
     39c:	e3530009 	cmp	r3, #9	; 0x9
     3a0:	c083300a 	addgt	r3, r3, sl
     3a4:	e2833030 	add	r3, r3, #48	; 0x30
     3a8:	e1a00004 	mov	r0, r4
     3ac:	e5653001 	strb	r3, [r5, #-1]!
     3b0:	e1a01006 	mov	r1, r6
     3b4:	eb000616 	bl	1c14 <__aeabi_uidiv>
     3b8:	e1a02005 	mov	r2, r5
     3bc:	e1a04000 	mov	r4, r0
     3c0:	e3540000 	cmp	r4, #0	; 0x0
     3c4:	e1a00004 	mov	r0, r4
     3c8:	e1a01006 	mov	r1, r6
     3cc:	e1a05002 	mov	r5, r2
     3d0:	1affffef 	bne	394 <printi+0x84>
     3d4:	e3580000 	cmp	r8, #0	; 0x0
     3d8:	01a04008 	moveq	r4, r8
     3dc:	0a00000d 	beq	418 <SVC_STACK_SIZE+0x18>
     3e0:	e3570000 	cmp	r7, #0	; 0x0
     3e4:	0a000007 	beq	408 <SVC_STACK_SIZE+0x8>
     3e8:	e3190002 	tst	r9, #2	; 0x2
     3ec:	0a000005 	beq	408 <SVC_STACK_SIZE+0x8>
     3f0:	e1a0000b 	mov	r0, fp
     3f4:	e3a0102d 	mov	r1, #45	; 0x2d
     3f8:	ebffff8a 	bl	228 <printchar>
     3fc:	e2477001 	sub	r7, r7, #1	; 0x1
     400:	e3a04001 	mov	r4, #1	; 0x1
     404:	ea000003 	b	418 <SVC_STACK_SIZE+0x18>
     408:	e3a0302d 	mov	r3, #45	; 0x2d
     40c:	e5423001 	strb	r3, [r2, #-1]
     410:	e2425001 	sub	r5, r2, #1	; 0x1
     414:	e3a04000 	mov	r4, #0	; 0x0
     418:	e1a0000b 	mov	r0, fp
     41c:	e1a01005 	mov	r1, r5
     420:	e1a02007 	mov	r2, r7
     424:	e1a03009 	mov	r3, r9
     428:	ebffff88 	bl	250 <prints>
     42c:	e0800004 	add	r0, r0, r4
     430:	e28dd00c 	add	sp, sp, #12	; 0xc
     434:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00000438 <print>:
     438:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     43c:	e3a05000 	mov	r5, #0	; 0x0
     440:	e24dd014 	sub	sp, sp, #20	; 0x14
     444:	e1a06000 	mov	r6, r0
     448:	e1a04001 	mov	r4, r1
     44c:	e1a07005 	mov	r7, r5
     450:	e3a0a00a 	mov	sl, #10	; 0xa
     454:	e28db012 	add	fp, sp, #18	; 0x12
     458:	e3a08061 	mov	r8, #97	; 0x61
     45c:	e3a09041 	mov	r9, #65	; 0x41
     460:	e58d200c 	str	r2, [sp, #12]
     464:	ea000060 	b	5ec <print+0x1b4>
     468:	e3530025 	cmp	r3, #37	; 0x25
     46c:	1a000059 	bne	5d8 <print+0x1a0>
     470:	e5f43001 	ldrb	r3, [r4, #1]!
     474:	e3530000 	cmp	r3, #0	; 0x0
     478:	0a00005e 	beq	5f8 <print+0x1c0>
     47c:	e3530025 	cmp	r3, #37	; 0x25
     480:	0a000054 	beq	5d8 <print+0x1a0>
     484:	e353002d 	cmp	r3, #45	; 0x2d
     488:	11a00007 	movne	r0, r7
     48c:	02844001 	addeq	r4, r4, #1	; 0x1
     490:	03a00001 	moveq	r0, #1	; 0x1
     494:	ea000001 	b	4a0 <print+0x68>
     498:	e2844001 	add	r4, r4, #1	; 0x1
     49c:	e3800002 	orr	r0, r0, #2	; 0x2
     4a0:	e5d43000 	ldrb	r3, [r4]
     4a4:	e3530030 	cmp	r3, #48	; 0x30
     4a8:	0afffffa 	beq	498 <print+0x60>
     4ac:	e1a02007 	mov	r2, r7
     4b0:	ea000001 	b	4bc <print+0x84>
     4b4:	e022c29a 	mla	r2, sl, r2, ip
     4b8:	e2844001 	add	r4, r4, #1	; 0x1
     4bc:	e5d41000 	ldrb	r1, [r4]
     4c0:	e241c030 	sub	ip, r1, #48	; 0x30
     4c4:	e20c30ff 	and	r3, ip, #255	; 0xff
     4c8:	e3530009 	cmp	r3, #9	; 0x9
     4cc:	9afffff8 	bls	4b4 <print+0x7c>
     4d0:	e3510073 	cmp	r1, #115	; 0x73
     4d4:	1a000008 	bne	4fc <print+0xc4>
     4d8:	e59dc00c 	ldr	ip, [sp, #12]
     4dc:	e49c1004 	ldr	r1, [ip], #4
     4e0:	e59f312c 	ldr	r3, [pc, #300]	; 614 <print+0x1dc>
     4e4:	e3510000 	cmp	r1, #0	; 0x0
     4e8:	01a01003 	moveq	r1, r3
     4ec:	e1a03000 	mov	r3, r0
     4f0:	e1a00006 	mov	r0, r6
     4f4:	e58dc00c 	str	ip, [sp, #12]
     4f8:	ea000034 	b	5d0 <print+0x198>
     4fc:	e3510064 	cmp	r1, #100	; 0x64
     500:	1a00000c 	bne	538 <print+0x100>
     504:	e58d2000 	str	r2, [sp]
     508:	e58d0004 	str	r0, [sp, #4]
     50c:	e59dc00c 	ldr	ip, [sp, #12]
     510:	e58d8008 	str	r8, [sp, #8]
     514:	e1a00006 	mov	r0, r6
     518:	e59c1000 	ldr	r1, [ip]
     51c:	e1a0200a 	mov	r2, sl
     520:	e28cc004 	add	ip, ip, #4	; 0x4
     524:	e3a03001 	mov	r3, #1	; 0x1
     528:	e58dc00c 	str	ip, [sp, #12]
     52c:	ebffff77 	bl	310 <printi>
     530:	e0855000 	add	r5, r5, r0
     534:	ea00002b 	b	5e8 <print+0x1b0>
     538:	e3510078 	cmp	r1, #120	; 0x78
     53c:	058d2000 	streq	r2, [sp]
     540:	058d0004 	streq	r0, [sp, #4]
     544:	058d8008 	streq	r8, [sp, #8]
     548:	0a000003 	beq	55c <print+0x124>
     54c:	e3510058 	cmp	r1, #88	; 0x58
     550:	1a000007 	bne	574 <print+0x13c>
     554:	e58d2000 	str	r2, [sp]
     558:	e98d0201 	stmib	sp, {r0, r9}
     55c:	e59dc00c 	ldr	ip, [sp, #12]
     560:	e59c1000 	ldr	r1, [ip]
     564:	e1a00006 	mov	r0, r6
     568:	e28cc004 	add	ip, ip, #4	; 0x4
     56c:	e3a02010 	mov	r2, #16	; 0x10
     570:	ea000009 	b	59c <print+0x164>
     574:	e3510075 	cmp	r1, #117	; 0x75
     578:	1a000009 	bne	5a4 <print+0x16c>
     57c:	e58d2000 	str	r2, [sp]
     580:	e58d0004 	str	r0, [sp, #4]
     584:	e59dc00c 	ldr	ip, [sp, #12]
     588:	e58d8008 	str	r8, [sp, #8]
     58c:	e1a00006 	mov	r0, r6
     590:	e59c1000 	ldr	r1, [ip]
     594:	e1a0200a 	mov	r2, sl
     598:	e28cc004 	add	ip, ip, #4	; 0x4
     59c:	e1a03007 	mov	r3, r7
     5a0:	eaffffe0 	b	528 <print+0xf0>
     5a4:	e3510063 	cmp	r1, #99	; 0x63
     5a8:	1a00000e 	bne	5e8 <print+0x1b0>
     5ac:	e59dc00c 	ldr	ip, [sp, #12]
     5b0:	e59ce000 	ldr	lr, [ip]
     5b4:	e28cc004 	add	ip, ip, #4	; 0x4
     5b8:	e58dc00c 	str	ip, [sp, #12]
     5bc:	e5cde012 	strb	lr, [sp, #18]
     5c0:	e5cd7013 	strb	r7, [sp, #19]
     5c4:	e1a03000 	mov	r3, r0
     5c8:	e1a0100b 	mov	r1, fp
     5cc:	e1a00006 	mov	r0, r6
     5d0:	ebffff1e 	bl	250 <prints>
     5d4:	eaffffd5 	b	530 <print+0xf8>
     5d8:	e1a00006 	mov	r0, r6
     5dc:	e5d41000 	ldrb	r1, [r4]
     5e0:	ebffff10 	bl	228 <printchar>
     5e4:	e2855001 	add	r5, r5, #1	; 0x1
     5e8:	e2844001 	add	r4, r4, #1	; 0x1
     5ec:	e5d43000 	ldrb	r3, [r4]
     5f0:	e3530000 	cmp	r3, #0	; 0x0
     5f4:	1affff9b 	bne	468 <print+0x30>
     5f8:	e3560000 	cmp	r6, #0	; 0x0
     5fc:	15962000 	ldrne	r2, [r6]
     600:	13a03000 	movne	r3, #0	; 0x0
     604:	e1a00005 	mov	r0, r5
     608:	15c23000 	strbne	r3, [r2]
     60c:	e28dd014 	add	sp, sp, #20	; 0x14
     610:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     614:	00001edc 	.word	0x00001edc

00000618 <sprintf>:
     618:	e92d000e 	push	{r1, r2, r3}
     61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     620:	e24dd008 	sub	sp, sp, #8	; 0x8
     624:	e28d3010 	add	r3, sp, #16	; 0x10
     628:	e58d0000 	str	r0, [sp]
     62c:	e1a02003 	mov	r2, r3
     630:	e1a0000d 	mov	r0, sp
     634:	e59d100c 	ldr	r1, [sp, #12]
     638:	e58d3004 	str	r3, [sp, #4]
     63c:	ebffff7d 	bl	438 <print>
     640:	e28dd008 	add	sp, sp, #8	; 0x8
     644:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     648:	e28dd00c 	add	sp, sp, #12	; 0xc
     64c:	e12fff1e 	bx	lr

00000650 <printf>:
     650:	e92d000f 	push	{r0, r1, r2, r3}
     654:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     658:	e24dd004 	sub	sp, sp, #4	; 0x4
     65c:	e28d300c 	add	r3, sp, #12	; 0xc
     660:	e1a02003 	mov	r2, r3
     664:	e59d1008 	ldr	r1, [sp, #8]
     668:	e3a00000 	mov	r0, #0	; 0x0
     66c:	e58d3000 	str	r3, [sp]
     670:	ebffff70 	bl	438 <print>
     674:	e28dd004 	add	sp, sp, #4	; 0x4
     678:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     67c:	e28dd010 	add	sp, sp, #16	; 0x10
     680:	e12fff1e 	bx	lr

00000684 <ConsoleInit>:
     684:	e59f103c 	ldr	r1, [pc, #60]	; 6c8 <ConsoleInit+0x44>
     688:	e5913000 	ldr	r3, [r1]
     68c:	e3c3300f 	bic	r3, r3, #15	; 0xf
     690:	e59f2034 	ldr	r2, [pc, #52]	; 6cc <ConsoleInit+0x48>
     694:	e3833005 	orr	r3, r3, #5	; 0x5
     698:	e5813000 	str	r3, [r1]
     69c:	e3a03083 	mov	r3, #131	; 0x83
     6a0:	e582300c 	str	r3, [r2, #12]
     6a4:	e1a0c440 	asr	ip, r0, #8
     6a8:	e3a03003 	mov	r3, #3	; 0x3
     6ac:	e20000ff 	and	r0, r0, #255	; 0xff
     6b0:	e5820000 	str	r0, [r2]
     6b4:	e582c004 	str	ip, [r2, #4]
     6b8:	e582300c 	str	r3, [r2, #12]
     6bc:	e3a03001 	mov	r3, #1	; 0x1
     6c0:	e5823008 	str	r3, [r2, #8]
     6c4:	e12fff1e 	bx	lr
     6c8:	e002c000 	.word	0xe002c000
     6cc:	e000c000 	.word	0xe000c000

000006d0 <putchar>:
     6d0:	e350000a 	cmp	r0, #10	; 0xa
     6d4:	1a000005 	bne	6f0 <putchar+0x20>
     6d8:	e59f2028 	ldr	r2, [pc, #40]	; 708 <putchar+0x38>
     6dc:	e5923014 	ldr	r3, [r2, #20]
     6e0:	e3130020 	tst	r3, #32	; 0x20
     6e4:	0afffffc 	beq	6dc <putchar+0xc>
     6e8:	e3a0300d 	mov	r3, #13	; 0xd
     6ec:	e5823000 	str	r3, [r2]
     6f0:	e59f2010 	ldr	r2, [pc, #16]	; 708 <putchar+0x38>
     6f4:	e5923014 	ldr	r3, [r2, #20]
     6f8:	e3130020 	tst	r3, #32	; 0x20
     6fc:	0afffffc 	beq	6f4 <putchar+0x24>
     700:	e5820000 	str	r0, [r2]
     704:	e12fff1e 	bx	lr
     708:	e000c000 	.word	0xe000c000

0000070c <getchar>:
     70c:	e59f0010 	ldr	r0, [pc, #16]	; 724 <getchar+0x18>
     710:	e5903014 	ldr	r3, [r0, #20]
     714:	e3130001 	tst	r3, #1	; 0x1
     718:	0afffffc 	beq	710 <getchar+0x4>
     71c:	e5900000 	ldr	r0, [r0]
     720:	e12fff1e 	bx	lr
     724:	e000c000 	.word	0xe000c000

00000728 <puts>:
     728:	e92d4010 	push	{r4, lr}
     72c:	e1a04000 	mov	r4, r0
     730:	ea000000 	b	738 <puts+0x10>
     734:	ebffffe5 	bl	6d0 <putchar>
     738:	e5d43000 	ldrb	r3, [r4]
     73c:	e3530000 	cmp	r3, #0	; 0x0
     740:	e1a00003 	mov	r0, r3
     744:	e2844001 	add	r4, r4, #1	; 0x1
     748:	1afffff9 	bne	734 <puts+0xc>
     74c:	e3a0000a 	mov	r0, #10	; 0xa
     750:	ebffffde 	bl	6d0 <putchar>
     754:	e3a00001 	mov	r0, #1	; 0x1
     758:	e8bd8010 	pop	{r4, pc}

0000075c <HandleClassRequest>:
     75c:	e3a00001 	mov	r0, #1	; 0x1
     760:	e12fff1e 	bx	lr

00000764 <USBDevIntHandler>:
     764:	e20000ff 	and	r0, r0, #255	; 0xff
     768:	e59f3030 	ldr	r3, [pc, #48]	; 7a0 <USBDevIntHandler+0x3c>
     76c:	e3500004 	cmp	r0, #4	; 0x4
     770:	e5c30000 	strb	r0, [r3]
     774:	0a000005 	beq	790 <USBDevIntHandler+0x2c>
     778:	e3500010 	cmp	r0, #16	; 0x10
     77c:	0a000003 	beq	790 <USBDevIntHandler+0x2c>
     780:	e3500001 	cmp	r0, #1	; 0x1
     784:	059f3018 	ldreq	r3, [pc, #24]	; 7a4 <USBDevIntHandler+0x40>
     788:	05830000 	streq	r0, [r3]
     78c:	e12fff1e 	bx	lr
     790:	e59f300c 	ldr	r3, [pc, #12]	; 7a4 <USBDevIntHandler+0x40>
     794:	e3a02000 	mov	r2, #0	; 0x0
     798:	e5832000 	str	r2, [r3]
     79c:	e12fff1e 	bx	lr
     7a0:	40000208 	.word	0x40000208
     7a4:	40000204 	.word	0x40000204

000007a8 <main>:
     7a8:	e92d4030 	push	{r4, r5, lr}
     7ac:	e59f40ec 	ldr	r4, [pc, #236]	; 8a0 <main+0xf8>
     7b0:	e5943008 	ldr	r3, [r4, #8]
     7b4:	e3833b01 	orr	r3, r3, #1024	; 0x400
     7b8:	e5843008 	str	r3, [r4, #8]
     7bc:	e5943008 	ldr	r3, [r4, #8]
     7c0:	e3833b02 	orr	r3, r3, #2048	; 0x800
     7c4:	e5843008 	str	r3, [r4, #8]
     7c8:	ebfffe7a 	bl	1b8 <HalSysInit>
     7cc:	e3a00020 	mov	r0, #32	; 0x20
     7d0:	ebffffab 	bl	684 <ConsoleInit>
     7d4:	e59f00c8 	ldr	r0, [pc, #200]	; 8a4 <main+0xfc>
     7d8:	ebffffd2 	bl	728 <puts>
     7dc:	eb0004ec 	bl	1b94 <USBInit>
     7e0:	e59f00c0 	ldr	r0, [pc, #192]	; 8a8 <main+0x100>
     7e4:	eb0003e0 	bl	176c <USBRegisterDescriptors>
     7e8:	e59f20bc 	ldr	r2, [pc, #188]	; 8ac <main+0x104>
     7ec:	e3a00001 	mov	r0, #1	; 0x1
     7f0:	e59f10b8 	ldr	r1, [pc, #184]	; 8b0 <main+0x108>
     7f4:	eb000308 	bl	141c <USBRegisterRequestHandler>
     7f8:	e3a01000 	mov	r1, #0	; 0x0
     7fc:	e3a00081 	mov	r0, #129	; 0x81
     800:	eb0002dd 	bl	137c <USBHwRegisterEPIntHandler>
     804:	e59f00a8 	ldr	r0, [pc, #168]	; 8b4 <main+0x10c>
     808:	eb0002c5 	bl	1324 <USBHwRegisterFrameHandler>
     80c:	e59f00a4 	ldr	r0, [pc, #164]	; 8b8 <main+0x110>
     810:	eb0002ce 	bl	1350 <USBHwRegisterDevIntHandler>
     814:	e59f30a0 	ldr	r3, [pc, #160]	; 8bc <main+0x114>
     818:	e3a05000 	mov	r5, #0	; 0x0
     81c:	e5c35000 	strb	r5, [r3]
     820:	e59f0098 	ldr	r0, [pc, #152]	; 8c0 <main+0x118>
     824:	eb0002b4 	bl	12fc <USBInitializeUSBDMA>
     828:	e3a00083 	mov	r0, #131	; 0x83
     82c:	eb00028d 	bl	1268 <USBEnableDMAForEndpoint>
     830:	e59f008c 	ldr	r0, [pc, #140]	; 8c4 <main+0x11c>
     834:	ebffffbb 	bl	728 <puts>
     838:	e3e02000 	mvn	r2, #0	; 0x0
     83c:	e3a03036 	mov	r3, #54	; 0x36
     840:	e5023dff 	str	r3, [r2, #-3583]
     844:	e59f307c 	ldr	r3, [pc, #124]	; 8c8 <main+0x120>
     848:	e5023eff 	str	r3, [r2, #-3839]
     84c:	e5123ff3 	ldr	r3, [r2, #-4083]
     850:	e3c33501 	bic	r3, r3, #4194304	; 0x400000
     854:	e5023ff3 	str	r3, [r2, #-4083]
     858:	e5123fef 	ldr	r3, [r2, #-4079]
     85c:	e3833501 	orr	r3, r3, #4194304	; 0x400000
     860:	e5023fef 	str	r3, [r2, #-4079]
     864:	eb0000cc 	bl	b9c <enableIRQ>
     868:	e3a00001 	mov	r0, #1	; 0x1
     86c:	eb000119 	bl	cd8 <USBHwConnect>
     870:	e59f0054 	ldr	r0, [pc, #84]	; 8cc <main+0x124>
     874:	e59f1054 	ldr	r1, [pc, #84]	; 8d0 <main+0x128>
     878:	e3a03b02 	mov	r3, #2048	; 0x800
     87c:	e1a02005 	mov	r2, r5
     880:	e2855001 	add	r5, r5, #1	; 0x1
     884:	e1550000 	cmp	r5, r0
     888:	05843004 	streq	r3, [r4, #4]
     88c:	0afffffb 	beq	880 <main+0xd8>
     890:	e1550001 	cmp	r5, r1
     894:	c1a05002 	movgt	r5, r2
     898:	c584300c 	strgt	r3, [r4, #12]
     89c:	eafffff7 	b	880 <main+0xd8>
     8a0:	e0028000 	.word	0xe0028000
     8a4:	00001ee4 	.word	0x00001ee4
     8a8:	00001df4 	.word	0x00001df4
     8ac:	40000220 	.word	0x40000220
     8b0:	0000075c 	.word	0x0000075c
     8b4:	000009a0 	.word	0x000009a0
     8b8:	00000764 	.word	0x00000764
     8bc:	7fd002a4 	.word	0x7fd002a4
     8c0:	7fd00200 	.word	0x7fd00200
     8c4:	00001efc 	.word	0x00001efc
     8c8:	000008d4 	.word	0x000008d4
     8cc:	00030d40 	.word	0x00030d40
     8d0:	00061a7f 	.word	0x00061a7f

000008d4 <USBIntHandler>:
     8d4:	e24ee004 	sub	lr, lr, #4	; 0x4
     8d8:	e92d41ff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
     8dc:	e14f1000 	mrs	r1, SPSR
     8e0:	e92d0002 	push	{r1}
     8e4:	eb000191 	bl	f30 <USBHwISR>
     8e8:	e3a02000 	mov	r2, #0	; 0x0
     8ec:	e3e03000 	mvn	r3, #0	; 0x0
     8f0:	e5032fcf 	str	r2, [r3, #-4047]
     8f4:	e8bd0002 	pop	{r1}
     8f8:	e161f001 	msr	SPSR_c, r1
     8fc:	e8fd81ff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}^

00000900 <resetDMATransfer>:
     900:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     904:	e24dd00c 	sub	sp, sp, #12	; 0xc
     908:	e28d5030 	add	r5, sp, #48	; 0x30
     90c:	e89500a0 	ldm	r5, {r5, r7}
     910:	e20080ff 	and	r8, r0, #255	; 0xff
     914:	e1a0a002 	mov	sl, r2
     918:	e1a04003 	mov	r4, r3
     91c:	e1a00008 	mov	r0, r8
     920:	e1a05805 	lsl	r5, r5, #16
     924:	e1a09001 	mov	r9, r1
     928:	e28d6038 	add	r6, sp, #56	; 0x38
     92c:	e8960840 	ldm	r6, {r6, fp}
     930:	eb000242 	bl	1240 <USBDisableDMAForEndpoint>
     934:	e1a03825 	lsr	r3, r5, #16
     938:	e1a0000a 	mov	r0, sl
     93c:	e1a01004 	mov	r1, r4
     940:	e1d720b0 	ldrh	r2, [r7]
     944:	eb000251 	bl	1290 <USBInitializeISOCFrameArray>
     948:	e1a04804 	lsl	r4, r4, #16
     94c:	e1d730b0 	ldrh	r3, [r7]
     950:	e1a04824 	lsr	r4, r4, #16
     954:	e0833004 	add	r3, r3, r4
     958:	e1a06806 	lsl	r6, r6, #16
     95c:	e1c730b0 	strh	r3, [r7]
     960:	e1a00009 	mov	r0, r9
     964:	e1a03826 	lsr	r3, r6, #16
     968:	e3a01000 	mov	r1, #0	; 0x0
     96c:	e3a02001 	mov	r2, #1	; 0x1
     970:	e88d0810 	stm	sp, {r4, fp}
     974:	e58da008 	str	sl, [sp, #8]
     978:	eb000212 	bl	11c8 <USBSetupDMADescriptor>
     97c:	e1a00008 	mov	r0, r8
     980:	e1a02009 	mov	r2, r9
     984:	e59f1010 	ldr	r1, [pc, #16]	; 99c <resetDMATransfer+0x9c>
     988:	eb000255 	bl	12e4 <USBSetHeadDDForDMA>
     98c:	e1a00008 	mov	r0, r8
     990:	e28dd00c 	add	sp, sp, #12	; 0xc
     994:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     998:	ea000232 	b	1268 <USBEnableDMAForEndpoint>
     99c:	7fd00200 	.word	0x7fd00200

000009a0 <USBFrameHandler>:
     9a0:	e92d4010 	push	{r4, lr}
     9a4:	e59f3150 	ldr	r3, [pc, #336]	; afc <USBFrameHandler+0x15c>
     9a8:	e5933000 	ldr	r3, [r3]
     9ac:	e3530000 	cmp	r3, #0	; 0x0
     9b0:	e24dd010 	sub	sp, sp, #16	; 0x10
     9b4:	0a00004e 	beq	af4 <USBFrameHandler+0x154>
     9b8:	e59f2140 	ldr	r2, [pc, #320]	; b00 <USBFrameHandler+0x160>
     9bc:	e5923000 	ldr	r3, [r2]
     9c0:	e3530efa 	cmp	r3, #4000	; 0xfa0
     9c4:	b2833001 	addlt	r3, r3, #1	; 0x1
     9c8:	b5823000 	strlt	r3, [r2]
     9cc:	ba000048 	blt	af4 <USBFrameHandler+0x154>
     9d0:	e59f112c 	ldr	r1, [pc, #300]	; b04 <USBFrameHandler+0x164>
     9d4:	e591300c 	ldr	r3, [r1, #12]
     9d8:	e1a030a3 	lsr	r3, r3, #1
     9dc:	e203300f 	and	r3, r3, #15	; 0xf
     9e0:	e3530002 	cmp	r3, #2	; 0x2
     9e4:	0a000003 	beq	9f8 <USBFrameHandler+0x58>
     9e8:	e59f3118 	ldr	r3, [pc, #280]	; b08 <USBFrameHandler+0x168>
     9ec:	e5933000 	ldr	r3, [r3]
     9f0:	e3530000 	cmp	r3, #0	; 0x0
     9f4:	1a000015 	bne	a50 <USBFrameHandler+0xb0>
     9f8:	e59f2108 	ldr	r2, [pc, #264]	; b08 <USBFrameHandler+0x168>
     9fc:	e59fe108 	ldr	lr, [pc, #264]	; b0c <USBFrameHandler+0x16c>
     a00:	e5923000 	ldr	r3, [r2]
     a04:	e59ec000 	ldr	ip, [lr]
     a08:	e59f4100 	ldr	r4, [pc, #256]	; b10 <USBFrameHandler+0x170>
     a0c:	e3530000 	cmp	r3, #0	; 0x0
     a10:	e28cc001 	add	ip, ip, #1	; 0x1
     a14:	e58ec000 	str	ip, [lr]
     a18:	e584c000 	str	ip, [r4]
     a1c:	02833001 	addeq	r3, r3, #1	; 0x1
     a20:	e3a0c004 	mov	ip, #4	; 0x4
     a24:	05823000 	streq	r3, [r2]
     a28:	e58dc000 	str	ip, [sp]
     a2c:	e59fc0e0 	ldr	ip, [pc, #224]	; b14 <USBFrameHandler+0x174>
     a30:	e3a00083 	mov	r0, #131	; 0x83
     a34:	e58dc004 	str	ip, [sp, #4]
     a38:	e59f20d8 	ldr	r2, [pc, #216]	; b18 <USBFrameHandler+0x178>
     a3c:	e3a0c080 	mov	ip, #128	; 0x80
     a40:	e3a03001 	mov	r3, #1	; 0x1
     a44:	e58dc008 	str	ip, [sp, #8]
     a48:	e58d400c 	str	r4, [sp, #12]
     a4c:	ebffffab 	bl	900 <resetDMATransfer>
     a50:	e59f30c4 	ldr	r3, [pc, #196]	; b1c <USBFrameHandler+0x17c>
     a54:	e593300c 	ldr	r3, [r3, #12]
     a58:	e1a030a3 	lsr	r3, r3, #1
     a5c:	e203300f 	and	r3, r3, #15	; 0xf
     a60:	e3530002 	cmp	r3, #2	; 0x2
     a64:	0a000003 	beq	a78 <USBFrameHandler+0xd8>
     a68:	e59f30b0 	ldr	r3, [pc, #176]	; b20 <USBFrameHandler+0x180>
     a6c:	e5933000 	ldr	r3, [r3]
     a70:	e3530000 	cmp	r3, #0	; 0x0
     a74:	1a00001e 	bne	af4 <USBFrameHandler+0x154>
     a78:	e59f20a0 	ldr	r2, [pc, #160]	; b20 <USBFrameHandler+0x180>
     a7c:	e5923000 	ldr	r3, [r2]
     a80:	e3530000 	cmp	r3, #0	; 0x0
     a84:	02833001 	addeq	r3, r3, #1	; 0x1
     a88:	05823000 	streq	r3, [r2]
     a8c:	0a000008 	beq	ab4 <USBFrameHandler+0x114>
     a90:	e59f308c 	ldr	r3, [pc, #140]	; b24 <USBFrameHandler+0x184>
     a94:	e5d33000 	ldrb	r3, [r3]
     a98:	e3530000 	cmp	r3, #0	; 0x0
     a9c:	159f3084 	ldrne	r3, [pc, #132]	; b28 <USBFrameHandler+0x188>
     aa0:	059f3080 	ldreq	r3, [pc, #128]	; b28 <USBFrameHandler+0x188>
     aa4:	13a02b01 	movne	r2, #1024	; 0x400
     aa8:	03a02b01 	moveq	r2, #1024	; 0x400
     aac:	15832004 	strne	r2, [r3, #4]
     ab0:	0583200c 	streq	r2, [r3, #12]
     ab4:	e59fe070 	ldr	lr, [pc, #112]	; b2c <USBFrameHandler+0x18c>
     ab8:	e59ec000 	ldr	ip, [lr]
     abc:	e28cc001 	add	ip, ip, #1	; 0x1
     ac0:	e58ec000 	str	ip, [lr]
     ac4:	e59fc048 	ldr	ip, [pc, #72]	; b14 <USBFrameHandler+0x174>
     ac8:	e58dc004 	str	ip, [sp, #4]
     acc:	e59fc050 	ldr	ip, [pc, #80]	; b24 <USBFrameHandler+0x184>
     ad0:	e3a04080 	mov	r4, #128	; 0x80
     ad4:	e3a00006 	mov	r0, #6	; 0x6
     ad8:	e59f103c 	ldr	r1, [pc, #60]	; b1c <USBFrameHandler+0x17c>
     adc:	e59f204c 	ldr	r2, [pc, #76]	; b30 <USBFrameHandler+0x190>
     ae0:	e3a03004 	mov	r3, #4	; 0x4
     ae4:	e58d4008 	str	r4, [sp, #8]
     ae8:	e58dc00c 	str	ip, [sp, #12]
     aec:	e58d4000 	str	r4, [sp]
     af0:	ebffff82 	bl	900 <resetDMATransfer>
     af4:	e28dd010 	add	sp, sp, #16	; 0x10
     af8:	e8bd8010 	pop	{r4, pc}
     afc:	40000204 	.word	0x40000204
     b00:	4000020c 	.word	0x4000020c
     b04:	7fd00280 	.word	0x7fd00280
     b08:	40000210 	.word	0x40000210
     b0c:	4000021c 	.word	0x4000021c
     b10:	7fd002a4 	.word	0x7fd002a4
     b14:	40000200 	.word	0x40000200
     b18:	7fd00294 	.word	0x7fd00294
     b1c:	7fd004a4 	.word	0x7fd004a4
     b20:	40000218 	.word	0x40000218
     b24:	7fd00000 	.word	0x7fd00000
     b28:	e0028000 	.word	0xe0028000
     b2c:	40000214 	.word	0x40000214
     b30:	7fd00500 	.word	0x7fd00500

00000b34 <restoreIRQ>:
     b34:	e10f2000 	mrs	r2, CPSR
     b38:	e2000080 	and	r0, r0, #128	; 0x80
     b3c:	e3c23080 	bic	r3, r2, #128	; 0x80
     b40:	e1833000 	orr	r3, r3, r0
     b44:	e129f003 	msr	CPSR_fc, r3
     b48:	e1a00002 	mov	r0, r2
     b4c:	e12fff1e 	bx	lr

00000b50 <restoreFIQ>:
     b50:	e10f2000 	mrs	r2, CPSR
     b54:	e2000040 	and	r0, r0, #64	; 0x40
     b58:	e3c23040 	bic	r3, r2, #64	; 0x40
     b5c:	e1833000 	orr	r3, r3, r0
     b60:	e129f003 	msr	CPSR_fc, r3
     b64:	e1a00002 	mov	r0, r2
     b68:	e12fff1e 	bx	lr

00000b6c <disableFIQ>:
     b6c:	e10f0000 	mrs	r0, CPSR
     b70:	e3803040 	orr	r3, r0, #64	; 0x40
     b74:	e129f003 	msr	CPSR_fc, r3
     b78:	e12fff1e 	bx	lr

00000b7c <enableFIQ>:
     b7c:	e10f0000 	mrs	r0, CPSR
     b80:	e3c03040 	bic	r3, r0, #64	; 0x40
     b84:	e129f003 	msr	CPSR_fc, r3
     b88:	e12fff1e 	bx	lr

00000b8c <disableIRQ>:
     b8c:	e10f0000 	mrs	r0, CPSR
     b90:	e3803080 	orr	r3, r0, #128	; 0x80
     b94:	e129f003 	msr	CPSR_fc, r3
     b98:	e12fff1e 	bx	lr

00000b9c <enableIRQ>:
     b9c:	e10f0000 	mrs	r0, CPSR
     ba0:	e3c03080 	bic	r3, r0, #128	; 0x80
     ba4:	e129f003 	msr	CPSR_fc, r3
     ba8:	e12fff1e 	bx	lr

00000bac <USBHwCmd>:
     bac:	e1a00800 	lsl	r0, r0, #16
     bb0:	e59f2028 	ldr	r2, [pc, #40]	; be0 <USBHwCmd+0x34>
     bb4:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
     bb8:	e3800c05 	orr	r0, r0, #1280	; 0x500
     bbc:	e3a03030 	mov	r3, #48	; 0x30
     bc0:	e5023df7 	str	r3, [r2, #-3575]
     bc4:	e5020def 	str	r0, [r2, #-3567]
     bc8:	e5123dff 	ldr	r3, [r2, #-3583]
     bcc:	e2033010 	and	r3, r3, #16	; 0x10
     bd0:	e3530010 	cmp	r3, #16	; 0x10
     bd4:	1afffffb 	bne	bc8 <USBHwCmd+0x1c>
     bd8:	e5023df7 	str	r3, [r2, #-3575]
     bdc:	e12fff1e 	bx	lr
     be0:	ffe0cfff 	.word	0xffe0cfff

00000be4 <USBHwCmdWrite>:
     be4:	e92d4010 	push	{r4, lr}
     be8:	e1a04801 	lsl	r4, r1, #16
     bec:	e20000ff 	and	r0, r0, #255	; 0xff
     bf0:	e1a04824 	lsr	r4, r4, #16
     bf4:	ebffffec 	bl	bac <USBHwCmd>
     bf8:	e1a04804 	lsl	r4, r4, #16
     bfc:	e59f3020 	ldr	r3, [pc, #32]	; c24 <USBHwCmdWrite+0x40>
     c00:	e3844c01 	orr	r4, r4, #256	; 0x100
     c04:	e5034def 	str	r4, [r3, #-3567]
     c08:	e1a02003 	mov	r2, r3
     c0c:	e5123dff 	ldr	r3, [r2, #-3583]
     c10:	e2033010 	and	r3, r3, #16	; 0x10
     c14:	e3530010 	cmp	r3, #16	; 0x10
     c18:	1afffffb 	bne	c0c <USBHwCmdWrite+0x28>
     c1c:	e5023df7 	str	r3, [r2, #-3575]
     c20:	e8bd8010 	pop	{r4, pc}
     c24:	ffe0cfff 	.word	0xffe0cfff

00000c28 <USBHwCmdRead>:
     c28:	e92d4010 	push	{r4, lr}
     c2c:	e20040ff 	and	r4, r0, #255	; 0xff
     c30:	e1a00004 	mov	r0, r4
     c34:	ebffffdc 	bl	bac <USBHwCmd>
     c38:	e1a04804 	lsl	r4, r4, #16
     c3c:	e59f3028 	ldr	r3, [pc, #40]	; c6c <USBHwCmdRead+0x44>
     c40:	e3844c02 	orr	r4, r4, #512	; 0x200
     c44:	e5034def 	str	r4, [r3, #-3567]
     c48:	e1a02003 	mov	r2, r3
     c4c:	e5123dff 	ldr	r3, [r2, #-3583]
     c50:	e2033020 	and	r3, r3, #32	; 0x20
     c54:	e3530020 	cmp	r3, #32	; 0x20
     c58:	1afffffb 	bne	c4c <USBHwCmdRead+0x24>
     c5c:	e5023df7 	str	r3, [r2, #-3575]
     c60:	e5120deb 	ldr	r0, [r2, #-3563]
     c64:	e20000ff 	and	r0, r0, #255	; 0xff
     c68:	e8bd8010 	pop	{r4, pc}
     c6c:	ffe0cfff 	.word	0xffe0cfff

00000c70 <USBHwEPConfig>:
     c70:	e59fc04c 	ldr	ip, [pc, #76]	; cc4 <USBHwEPConfig+0x54>
     c74:	e200300f 	and	r3, r0, #15	; 0xf
     c78:	e51c2dbb 	ldr	r2, [ip, #-3515]
     c7c:	e1a03083 	lsl	r3, r3, #1
     c80:	e2000080 	and	r0, r0, #128	; 0x80
     c84:	e18303a0 	orr	r0, r3, r0, lsr #7
     c88:	e3a03001 	mov	r3, #1	; 0x1
     c8c:	e1822013 	orr	r2, r2, r3, lsl r0
     c90:	e1a01801 	lsl	r1, r1, #16
     c94:	e1a01821 	lsr	r1, r1, #16
     c98:	e50c2dbb 	str	r2, [ip, #-3515]
     c9c:	e50c0db7 	str	r0, [ip, #-3511]
     ca0:	e50c1db3 	str	r1, [ip, #-3507]
     ca4:	e51c3dff 	ldr	r3, [ip, #-3583]
     ca8:	e2033c01 	and	r3, r3, #256	; 0x100
     cac:	e3530c01 	cmp	r3, #256	; 0x100
     cb0:	1afffffb 	bne	ca4 <USBHwEPConfig+0x34>
     cb4:	e3800040 	orr	r0, r0, #64	; 0x40
     cb8:	e3a01000 	mov	r1, #0	; 0x0
     cbc:	e50c3df7 	str	r3, [ip, #-3575]
     cc0:	eaffffc7 	b	be4 <USBHwCmdWrite>
     cc4:	ffe0cfff 	.word	0xffe0cfff

00000cc8 <USBHwSetAddress>:
     cc8:	e200107f 	and	r1, r0, #127	; 0x7f
     ccc:	e3811080 	orr	r1, r1, #128	; 0x80
     cd0:	e3a000d0 	mov	r0, #208	; 0xd0
     cd4:	eaffffc2 	b	be4 <USBHwCmdWrite>

00000cd8 <USBHwConnect>:
     cd8:	e3500000 	cmp	r0, #0	; 0x0
     cdc:	159f3020 	ldrne	r3, [pc, #32]	; d04 <USBHwConnect+0x2c>
     ce0:	059f301c 	ldreq	r3, [pc, #28]	; d04 <USBHwConnect+0x2c>
     ce4:	13a02c02 	movne	r2, #512	; 0x200
     ce8:	03a02c02 	moveq	r2, #512	; 0x200
     cec:	15032fa3 	strne	r2, [r3, #-4003]
     cf0:	05032fa7 	streq	r2, [r3, #-4007]
     cf4:	e2501000 	subs	r1, r0, #0	; 0x0
     cf8:	13a01001 	movne	r1, #1	; 0x1
     cfc:	e3a000fe 	mov	r0, #254	; 0xfe
     d00:	eaffffb7 	b	be4 <USBHwCmdWrite>
     d04:	3fffcfff 	.word	0x3fffcfff

00000d08 <USBHwNakIntEnable>:
     d08:	e20010ff 	and	r1, r0, #255	; 0xff
     d0c:	e3a000f3 	mov	r0, #243	; 0xf3
     d10:	eaffffb3 	b	be4 <USBHwCmdWrite>

00000d14 <USBHwEPGetStatus>:
     d14:	e1a03000 	mov	r3, r0
     d18:	e200000f 	and	r0, r0, #15	; 0xf
     d1c:	e2033080 	and	r3, r3, #128	; 0x80
     d20:	e1a00080 	lsl	r0, r0, #1
     d24:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     d28:	e18003a3 	orr	r0, r0, r3, lsr #7
     d2c:	ebffffbd 	bl	c28 <USBHwCmdRead>
     d30:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00000d34 <USBHwEPStall>:
     d34:	e200300f 	and	r3, r0, #15	; 0xf
     d38:	e1a03083 	lsl	r3, r3, #1
     d3c:	e2000080 	and	r0, r0, #128	; 0x80
     d40:	e18333a0 	orr	r3, r3, r0, lsr #7
     d44:	e2511000 	subs	r1, r1, #0	; 0x0
     d48:	13a01001 	movne	r1, #1	; 0x1
     d4c:	e3830040 	orr	r0, r3, #64	; 0x40
     d50:	eaffffa3 	b	be4 <USBHwCmdWrite>

00000d54 <USBHwEPWrite>:
     d54:	e92d40f0 	push	{r4, r5, r6, r7, lr}
     d58:	e59fc07c 	ldr	ip, [pc, #124]	; ddc <USBHwEPWrite+0x88>
     d5c:	e200500f 	and	r5, r0, #15	; 0xf
     d60:	e1a03105 	lsl	r3, r5, #2
     d64:	e3833002 	orr	r3, r3, #2	; 0x2
     d68:	e1a06002 	mov	r6, r2
     d6c:	e1a0e001 	mov	lr, r1
     d70:	e1a0400c 	mov	r4, ip
     d74:	e20070ff 	and	r7, r0, #255	; 0xff
     d78:	e50c3dd7 	str	r3, [ip, #-3543]
     d7c:	e50c2ddb 	str	r2, [ip, #-3547]
     d80:	ea000008 	b	da8 <USBHwEPWrite+0x54>
     d84:	e55e3002 	ldrb	r3, [lr, #-2]
     d88:	e55e2001 	ldrb	r2, [lr, #-1]
     d8c:	e55e1004 	ldrb	r1, [lr, #-4]
     d90:	e1a03803 	lsl	r3, r3, #16
     d94:	e1833c02 	orr	r3, r3, r2, lsl #24
     d98:	e55e2003 	ldrb	r2, [lr, #-3]
     d9c:	e1833001 	orr	r3, r3, r1
     da0:	e1833402 	orr	r3, r3, r2, lsl #8
     da4:	e5003de3 	str	r3, [r0, #-3555]
     da8:	e5143dd7 	ldr	r3, [r4, #-3543]
     dac:	e2133002 	ands	r3, r3, #2	; 0x2
     db0:	e28ee004 	add	lr, lr, #4	; 0x4
     db4:	e1a00004 	mov	r0, r4
     db8:	1afffff1 	bne	d84 <USBHwEPWrite+0x30>
     dbc:	e1a00085 	lsl	r0, r5, #1
     dc0:	e18003a7 	orr	r0, r0, r7, lsr #7
     dc4:	e5043dd7 	str	r3, [r4, #-3543]
     dc8:	ebffff77 	bl	bac <USBHwCmd>
     dcc:	e3a000fa 	mov	r0, #250	; 0xfa
     dd0:	ebffff75 	bl	bac <USBHwCmd>
     dd4:	e1a00006 	mov	r0, r6
     dd8:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
     ddc:	ffe0cfff 	.word	0xffe0cfff

00000de0 <USBHwEPRead>:
     de0:	e92d4030 	push	{r4, r5, lr}
     de4:	e200e00f 	and	lr, r0, #15	; 0xf
     de8:	e59fc088 	ldr	ip, [pc, #136]	; e78 <USBHwEPRead+0x98>
     dec:	e1a0310e 	lsl	r3, lr, #2
     df0:	e3833001 	orr	r3, r3, #1	; 0x1
     df4:	e50c3dd7 	str	r3, [ip, #-3543]
     df8:	e20050ff 	and	r5, r0, #255	; 0xff
     dfc:	e51c3ddf 	ldr	r3, [ip, #-3551]
     e00:	e3130b02 	tst	r3, #2048	; 0x800
     e04:	0afffffc 	beq	dfc <USBHwEPRead+0x1c>
     e08:	e3130b01 	tst	r3, #1024	; 0x400
     e0c:	03e04000 	mvneq	r4, #0	; 0x0
     e10:	0a000016 	beq	e70 <USBHwEPRead+0x90>
     e14:	e1a03b03 	lsl	r3, r3, #22
     e18:	e3a04000 	mov	r4, #0	; 0x0
     e1c:	e59fc054 	ldr	ip, [pc, #84]	; e78 <USBHwEPRead+0x98>
     e20:	e1a03b23 	lsr	r3, r3, #22
     e24:	e1a00004 	mov	r0, r4
     e28:	ea000006 	b	e48 <USBHwEPRead+0x68>
     e2c:	e3140003 	tst	r4, #3	; 0x3
     e30:	051c0de7 	ldreq	r0, [ip, #-3559]
     e34:	e3510000 	cmp	r1, #0	; 0x0
     e38:	11540002 	cmpne	r4, r2
     e3c:	b7c40001 	strblt	r0, [r4, r1]
     e40:	e2844001 	add	r4, r4, #1	; 0x1
     e44:	e1a00420 	lsr	r0, r0, #8
     e48:	e1540003 	cmp	r4, r3
     e4c:	1afffff6 	bne	e2c <USBHwEPRead+0x4c>
     e50:	e59f3020 	ldr	r3, [pc, #32]	; e78 <USBHwEPRead+0x98>
     e54:	e1a0008e 	lsl	r0, lr, #1
     e58:	e3a02000 	mov	r2, #0	; 0x0
     e5c:	e18003a5 	orr	r0, r0, r5, lsr #7
     e60:	e5032dd7 	str	r2, [r3, #-3543]
     e64:	ebffff50 	bl	bac <USBHwCmd>
     e68:	e3a000f2 	mov	r0, #242	; 0xf2
     e6c:	ebffff4e 	bl	bac <USBHwCmd>
     e70:	e1a00004 	mov	r0, r4
     e74:	e8bd8030 	pop	{r4, r5, pc}
     e78:	ffe0cfff 	.word	0xffe0cfff

00000e7c <USBHwISOCEPRead>:
     e7c:	e92d4030 	push	{r4, r5, lr}
     e80:	e200e00f 	and	lr, r0, #15	; 0xf
     e84:	e1a0310e 	lsl	r3, lr, #2
     e88:	e59fc08c 	ldr	ip, [pc, #140]	; f1c <USBHwISOCEPRead+0xa0>
     e8c:	e3833001 	orr	r3, r3, #1	; 0x1
     e90:	e50c3dd7 	str	r3, [ip, #-3543]
     e94:	e20050ff 	and	r5, r0, #255	; 0xff
     e98:	e1a00000 	nop			(mov r0,r0)
     e9c:	e51c3ddf 	ldr	r3, [ip, #-3551]
     ea0:	e2130b02 	ands	r0, r3, #2048	; 0x800
     ea4:	0a000001 	beq	eb0 <USBHwISOCEPRead+0x34>
     ea8:	e2130b01 	ands	r0, r3, #1024	; 0x400
     eac:	1a000002 	bne	ebc <USBHwISOCEPRead+0x40>
     eb0:	e3e04000 	mvn	r4, #0	; 0x0
     eb4:	e50c0dd7 	str	r0, [ip, #-3543]
     eb8:	ea000015 	b	f14 <USBHwISOCEPRead+0x98>
     ebc:	e1a03b03 	lsl	r3, r3, #22
     ec0:	e3a04000 	mov	r4, #0	; 0x0
     ec4:	e1a03b23 	lsr	r3, r3, #22
     ec8:	e1a00004 	mov	r0, r4
     ecc:	ea000006 	b	eec <USBHwISOCEPRead+0x70>
     ed0:	e3140003 	tst	r4, #3	; 0x3
     ed4:	051c0de7 	ldreq	r0, [ip, #-3559]
     ed8:	e3510000 	cmp	r1, #0	; 0x0
     edc:	11540002 	cmpne	r4, r2
     ee0:	b7c40001 	strblt	r0, [r4, r1]
     ee4:	e2844001 	add	r4, r4, #1	; 0x1
     ee8:	e1a00420 	lsr	r0, r0, #8
     eec:	e1540003 	cmp	r4, r3
     ef0:	1afffff6 	bne	ed0 <USBHwISOCEPRead+0x54>
     ef4:	e59f3020 	ldr	r3, [pc, #32]	; f1c <USBHwISOCEPRead+0xa0>
     ef8:	e1a0008e 	lsl	r0, lr, #1
     efc:	e3a02000 	mov	r2, #0	; 0x0
     f00:	e18003a5 	orr	r0, r0, r5, lsr #7
     f04:	e5032dd7 	str	r2, [r3, #-3543]
     f08:	ebffff27 	bl	bac <USBHwCmd>
     f0c:	e3a000f2 	mov	r0, #242	; 0xf2
     f10:	ebffff25 	bl	bac <USBHwCmd>
     f14:	e1a00004 	mov	r0, r4
     f18:	e8bd8030 	pop	{r4, r5, pc}
     f1c:	ffe0cfff 	.word	0xffe0cfff

00000f20 <USBHwConfigDevice>:
     f20:	e2501000 	subs	r1, r0, #0	; 0x0
     f24:	13a01001 	movne	r1, #1	; 0x1
     f28:	e3a000d8 	mov	r0, #216	; 0xd8
     f2c:	eaffff2c 	b	be4 <USBHwCmdWrite>

00000f30 <USBHwISR>:
     f30:	e59f3144 	ldr	r3, [pc, #324]	; 107c <USBHwISR+0x14c>
     f34:	e3a02002 	mov	r2, #2	; 0x2
     f38:	e5032fa7 	str	r2, [r3, #-4007]
     f3c:	e59f213c 	ldr	r2, [pc, #316]	; 1080 <USBHwISR+0x150>
     f40:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
     f44:	e5126dff 	ldr	r6, [r2, #-3583]
     f48:	e3160001 	tst	r6, #1	; 0x1
     f4c:	0a00000b 	beq	f80 <USBHwISR+0x50>
     f50:	e59f312c 	ldr	r3, [pc, #300]	; 1084 <USBHwISR+0x154>
     f54:	e5934000 	ldr	r4, [r3]
     f58:	e3a03001 	mov	r3, #1	; 0x1
     f5c:	e3540000 	cmp	r4, #0	; 0x0
     f60:	e5023df7 	str	r3, [r2, #-3575]
     f64:	0a000005 	beq	f80 <USBHwISR+0x50>
     f68:	e3a000f5 	mov	r0, #245	; 0xf5
     f6c:	ebffff2d 	bl	c28 <USBHwCmdRead>
     f70:	e1a00800 	lsl	r0, r0, #16
     f74:	e1a00820 	lsr	r0, r0, #16
     f78:	e1a0e00f 	mov	lr, pc
     f7c:	e12fff14 	bx	r4
     f80:	e3160008 	tst	r6, #8	; 0x8
     f84:	0a000011 	beq	fd0 <USBHwISR+0xa0>
     f88:	e59f30f0 	ldr	r3, [pc, #240]	; 1080 <USBHwISR+0x150>
     f8c:	e3a02008 	mov	r2, #8	; 0x8
     f90:	e3a000fe 	mov	r0, #254	; 0xfe
     f94:	e5032df7 	str	r2, [r3, #-3575]
     f98:	ebffff22 	bl	c28 <USBHwCmdRead>
     f9c:	e310001a 	tst	r0, #26	; 0x1a
     fa0:	0a00000a 	beq	fd0 <USBHwISR+0xa0>
     fa4:	e59f30dc 	ldr	r3, [pc, #220]	; 1088 <USBHwISR+0x158>
     fa8:	e5933000 	ldr	r3, [r3]
     fac:	e3530000 	cmp	r3, #0	; 0x0
     fb0:	0a000006 	beq	fd0 <USBHwISR+0xa0>
     fb4:	e59f50c0 	ldr	r5, [pc, #192]	; 107c <USBHwISR+0x14c>
     fb8:	e3a04001 	mov	r4, #1	; 0x1
     fbc:	e5054fa7 	str	r4, [r5, #-4007]
     fc0:	e2000015 	and	r0, r0, #21	; 0x15
     fc4:	e1a0e00f 	mov	lr, pc
     fc8:	e12fff13 	bx	r3
     fcc:	e5054fa3 	str	r4, [r5, #-4003]
     fd0:	e3160004 	tst	r6, #4	; 0x4
     fd4:	0a000024 	beq	106c <USBHwISR+0x13c>
     fd8:	e59f30a0 	ldr	r3, [pc, #160]	; 1080 <USBHwISR+0x150>
     fdc:	e3a02004 	mov	r2, #4	; 0x4
     fe0:	e5032df7 	str	r2, [r3, #-3575]
     fe4:	e59fa0a0 	ldr	sl, [pc, #160]	; 108c <USBHwISR+0x15c>
     fe8:	e59f708c 	ldr	r7, [pc, #140]	; 107c <USBHwISR+0x14c>
     fec:	e1a05003 	mov	r5, r3
     ff0:	e1a06002 	mov	r6, r2
     ff4:	e3a04000 	mov	r4, #0	; 0x0
     ff8:	e3a08001 	mov	r8, #1	; 0x1
     ffc:	e1a02418 	lsl	r2, r8, r4
    1000:	e5153dcf 	ldr	r3, [r5, #-3535]
    1004:	e1120003 	tst	r2, r3
    1008:	0a000014 	beq	1060 <USBHwISR+0x130>
    100c:	e5052dc7 	str	r2, [r5, #-3527]
    1010:	e5153dff 	ldr	r3, [r5, #-3583]
    1014:	e2032020 	and	r2, r3, #32	; 0x20
    1018:	e3520020 	cmp	r2, #32	; 0x20
    101c:	1afffffb 	bne	1010 <USBHwISR+0xe0>
    1020:	e0843fa4 	add	r3, r4, r4, lsr #31
    1024:	e1a030c3 	asr	r3, r3, #1
    1028:	e79a3103 	ldr	r3, [sl, r3, lsl #2]
    102c:	e5052df7 	str	r2, [r5, #-3575]
    1030:	e3530000 	cmp	r3, #0	; 0x0
    1034:	e5151deb 	ldr	r1, [r5, #-3563]
    1038:	0a000008 	beq	1060 <USBHwISR+0x130>
    103c:	e1a000c4 	asr	r0, r4, #1
    1040:	e200000f 	and	r0, r0, #15	; 0xf
    1044:	e1800384 	orr	r0, r0, r4, lsl #7
    1048:	e5076fa7 	str	r6, [r7, #-4007]
    104c:	e200008f 	and	r0, r0, #143	; 0x8f
    1050:	e201101f 	and	r1, r1, #31	; 0x1f
    1054:	e1a0e00f 	mov	lr, pc
    1058:	e12fff13 	bx	r3
    105c:	e5076fa3 	str	r6, [r7, #-4003]
    1060:	e2844001 	add	r4, r4, #1	; 0x1
    1064:	e3540020 	cmp	r4, #32	; 0x20
    1068:	1affffe3 	bne	ffc <USBHwISR+0xcc>
    106c:	e59f3008 	ldr	r3, [pc, #8]	; 107c <USBHwISR+0x14c>
    1070:	e3a02002 	mov	r2, #2	; 0x2
    1074:	e5032fa3 	str	r2, [r3, #-4003]
    1078:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
    107c:	3fffcfff 	.word	0x3fffcfff
    1080:	ffe0cfff 	.word	0xffe0cfff
    1084:	40000228 	.word	0x40000228
    1088:	4000022c 	.word	0x4000022c
    108c:	40000230 	.word	0x40000230

00001090 <USBHwInit>:
    1090:	e59f2120 	ldr	r2, [pc, #288]	; 11b8 <USBHwInit+0x128>
    1094:	e5923004 	ldr	r3, [r2, #4]
    1098:	e3c3330f 	bic	r3, r3, #1006632960	; 0x3c000000
    109c:	e3833305 	orr	r3, r3, #335544320	; 0x14000000
    10a0:	e5823004 	str	r3, [r2, #4]
    10a4:	e592300c 	ldr	r3, [r2, #12]
    10a8:	e3c33203 	bic	r3, r3, #805306368	; 0x30000000
    10ac:	e3c33030 	bic	r3, r3, #48	; 0x30
    10b0:	e3833202 	orr	r3, r3, #536870912	; 0x20000000
    10b4:	e3833010 	orr	r3, r3, #16	; 0x10
    10b8:	e582300c 	str	r3, [r2, #12]
    10bc:	e5923010 	ldr	r3, [r2, #16]
    10c0:	e3c33703 	bic	r3, r3, #786432	; 0xc0000
    10c4:	e5823010 	str	r3, [r2, #16]
    10c8:	e59f20ec 	ldr	r2, [pc, #236]	; 11bc <USBHwInit+0x12c>
    10cc:	e5123fbf 	ldr	r3, [r2, #-4031]
    10d0:	e3833c02 	orr	r3, r3, #512	; 0x200
    10d4:	e5023fbf 	str	r3, [r2, #-4031]
    10d8:	e3a03c02 	mov	r3, #512	; 0x200
    10dc:	e5023fa7 	str	r3, [r2, #-4007]
    10e0:	e59f20d8 	ldr	r2, [pc, #216]	; 11c0 <USBHwInit+0x130>
    10e4:	e59230c4 	ldr	r3, [r2, #196]
    10e8:	e92d4010 	push	{r4, lr}
    10ec:	e3833102 	orr	r3, r3, #-2147483648	; 0x80000000
    10f0:	e58230c4 	str	r3, [r2, #196]
    10f4:	e59f10c8 	ldr	r1, [pc, #200]	; 11c4 <USBHwInit+0x134>
    10f8:	e3a03005 	mov	r3, #5	; 0x5
    10fc:	e5823108 	str	r3, [r2, #264]
    1100:	e283300d 	add	r3, r3, #13	; 0xd
    1104:	e501300b 	str	r3, [r1, #-11]
    1108:	e5113007 	ldr	r3, [r1, #-7]
    110c:	e3130012 	tst	r3, #18	; 0x12
    1110:	0afffffc 	beq	1108 <USBHwInit+0x78>
    1114:	e3a04000 	mov	r4, #0	; 0x0
    1118:	e3e03000 	mvn	r3, #0	; 0x0
    111c:	e5014dfb 	str	r4, [r1, #-3579]
    1120:	e1a00004 	mov	r0, r4
    1124:	e5013df7 	str	r3, [r1, #-3575]
    1128:	e5014dd3 	str	r4, [r1, #-3539]
    112c:	e5014dcb 	str	r4, [r1, #-3531]
    1130:	e5013dc7 	str	r3, [r1, #-3527]
    1134:	e5014dbf 	str	r4, [r1, #-3519]
    1138:	ebfffef2 	bl	d08 <USBHwNakIntEnable>
    113c:	e59f107c 	ldr	r1, [pc, #124]	; 11c0 <USBHwInit+0x130>
    1140:	e59131a0 	ldr	r3, [r1, #416]
    1144:	e59fc06c 	ldr	ip, [pc, #108]	; 11b8 <USBHwInit+0x128>
    1148:	e3833001 	orr	r3, r3, #1	; 0x1
    114c:	e58131a0 	str	r3, [r1, #416]
    1150:	e59f2064 	ldr	r2, [pc, #100]	; 11bc <USBHwInit+0x12c>
    1154:	e58c4028 	str	r4, [ip, #40]
    1158:	e5123fbf 	ldr	r3, [r2, #-4031]
    115c:	e3a00001 	mov	r0, #1	; 0x1
    1160:	e3833001 	orr	r3, r3, #1	; 0x1
    1164:	e5023fbf 	str	r3, [r2, #-4031]
    1168:	e5020fa3 	str	r0, [r2, #-4003]
    116c:	e59131a0 	ldr	r3, [r1, #416]
    1170:	e1833000 	orr	r3, r3, r0
    1174:	e58131a0 	str	r3, [r1, #416]
    1178:	e58c4028 	str	r4, [ip, #40]
    117c:	e5123fbf 	ldr	r3, [r2, #-4031]
    1180:	e3833002 	orr	r3, r3, #2	; 0x2
    1184:	e5023fbf 	str	r3, [r2, #-4031]
    1188:	e3a03002 	mov	r3, #2	; 0x2
    118c:	e5023fa3 	str	r3, [r2, #-4003]
    1190:	e59131a0 	ldr	r3, [r1, #416]
    1194:	e1833000 	orr	r3, r3, r0
    1198:	e58131a0 	str	r3, [r1, #416]
    119c:	e58c4028 	str	r4, [ip, #40]
    11a0:	e5123fbf 	ldr	r3, [r2, #-4031]
    11a4:	e3833004 	orr	r3, r3, #4	; 0x4
    11a8:	e5023fbf 	str	r3, [r2, #-4031]
    11ac:	e3a03004 	mov	r3, #4	; 0x4
    11b0:	e5023fa3 	str	r3, [r2, #-4003]
    11b4:	e8bd8010 	pop	{r4, pc}
    11b8:	e002c000 	.word	0xe002c000
    11bc:	3fffcfff 	.word	0x3fffcfff
    11c0:	e01fc000 	.word	0xe01fc000
    11c4:	ffe0cfff 	.word	0xffe0cfff

000011c8 <USBSetupDMADescriptor>:
    11c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    11cc:	e3a0e000 	mov	lr, #0	; 0x0
    11d0:	e580e004 	str	lr, [r0, #4]
    11d4:	e5801000 	str	r1, [r0]
    11d8:	e1a0c001 	mov	ip, r1
    11dc:	e1a03b03 	lsl	r3, r3, #22
    11e0:	e5901004 	ldr	r1, [r0, #4]
    11e4:	e1a03b23 	lsr	r3, r3, #22
    11e8:	e1811283 	orr	r1, r1, r3, lsl #5
    11ec:	e5801004 	str	r1, [r0, #4]
    11f0:	e1dd10b4 	ldrh	r1, [sp, #4]
    11f4:	e5903004 	ldr	r3, [r0, #4]
    11f8:	e1833801 	orr	r3, r3, r1, lsl #16
    11fc:	e5803004 	str	r3, [r0, #4]
    1200:	e21220ff 	ands	r2, r2, #255	; 0xff
    1204:	15903004 	ldrne	r3, [r0, #4]
    1208:	13833010 	orrne	r3, r3, #16	; 0x10
    120c:	15803004 	strne	r3, [r0, #4]
    1210:	e35c0000 	cmp	ip, #0	; 0x0
    1214:	15903004 	ldrne	r3, [r0, #4]
    1218:	e59d100c 	ldr	r1, [sp, #12]
    121c:	13833004 	orrne	r3, r3, #4	; 0x4
    1220:	15803004 	strne	r3, [r0, #4]
    1224:	e59d3008 	ldr	r3, [sp, #8]
    1228:	e3520000 	cmp	r2, #0	; 0x0
    122c:	13510000 	cmpne	r1, #0	; 0x0
    1230:	e5803008 	str	r3, [r0, #8]
    1234:	15801010 	strne	r1, [r0, #16]
    1238:	e580e00c 	str	lr, [r0, #12]
    123c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00001240 <USBDisableDMAForEndpoint>:
    1240:	e200200f 	and	r2, r0, #15	; 0xf
    1244:	e1a02082 	lsl	r2, r2, #1
    1248:	e2000080 	and	r0, r0, #128	; 0x80
    124c:	e18223a0 	orr	r2, r2, r0, lsr #7
    1250:	e3a03001 	mov	r3, #1	; 0x1
    1254:	e1a03213 	lsl	r3, r3, r2
    1258:	e59f2004 	ldr	r2, [pc, #4]	; 1264 <USBDisableDMAForEndpoint+0x24>
    125c:	e5023d73 	str	r3, [r2, #-3443]
    1260:	e12fff1e 	bx	lr
    1264:	ffe0cfff 	.word	0xffe0cfff

00001268 <USBEnableDMAForEndpoint>:
    1268:	e200200f 	and	r2, r0, #15	; 0xf
    126c:	e1a02082 	lsl	r2, r2, #1
    1270:	e2000080 	and	r0, r0, #128	; 0x80
    1274:	e18223a0 	orr	r2, r2, r0, lsr #7
    1278:	e3a03001 	mov	r3, #1	; 0x1
    127c:	e1a03213 	lsl	r3, r3, r2
    1280:	e59f2004 	ldr	r2, [pc, #4]	; 128c <USBEnableDMAForEndpoint+0x24>
    1284:	e5023d77 	str	r3, [r2, #-3447]
    1288:	e12fff1e 	bx	lr
    128c:	ffe0cfff 	.word	0xffe0cfff

00001290 <USBInitializeISOCFrameArray>:
    1290:	e92d4030 	push	{r4, r5, lr}
    1294:	e1a03b03 	lsl	r3, r3, #22
    1298:	e1a02802 	lsl	r2, r2, #16
    129c:	e1a03b23 	lsr	r3, r3, #22
    12a0:	e1a05000 	mov	r5, r0
    12a4:	e1a04001 	mov	r4, r1
    12a8:	e1a0c822 	lsr	ip, r2, #16
    12ac:	e3830902 	orr	r0, r3, #32768	; 0x8000
    12b0:	e3a0e000 	mov	lr, #0	; 0x0
    12b4:	ea000000 	b	12bc <USBInitializeISOCFrameArray+0x2c>
    12b8:	e7851102 	str	r1, [r5, r2, lsl #2]
    12bc:	e1a0280e 	lsl	r2, lr, #16
    12c0:	e28c3001 	add	r3, ip, #1	; 0x1
    12c4:	e1a02822 	lsr	r2, r2, #16
    12c8:	e1a03803 	lsl	r3, r3, #16
    12cc:	e1520004 	cmp	r2, r4
    12d0:	e180180c 	orr	r1, r0, ip, lsl #16
    12d4:	e28ee001 	add	lr, lr, #1	; 0x1
    12d8:	e1a0c823 	lsr	ip, r3, #16
    12dc:	3afffff5 	bcc	12b8 <USBInitializeISOCFrameArray+0x28>
    12e0:	e8bd8030 	pop	{r4, r5, pc}

000012e4 <USBSetHeadDDForDMA>:
    12e4:	e200300f 	and	r3, r0, #15	; 0xf
    12e8:	e1a03083 	lsl	r3, r3, #1
    12ec:	e2000080 	and	r0, r0, #128	; 0x80
    12f0:	e18333a0 	orr	r3, r3, r0, lsr #7
    12f4:	e7812103 	str	r2, [r1, r3, lsl #2]
    12f8:	e12fff1e 	bx	lr

000012fc <USBInitializeUSBDMA>:
    12fc:	e3a03000 	mov	r3, #0	; 0x0
    1300:	e1a02003 	mov	r2, r3
    1304:	e7832000 	str	r2, [r3, r0]
    1308:	e2833004 	add	r3, r3, #4	; 0x4
    130c:	e3530080 	cmp	r3, #128	; 0x80
    1310:	1afffffb 	bne	1304 <USBInitializeUSBDMA+0x8>
    1314:	e59f3004 	ldr	r3, [pc, #4]	; 1320 <USBInitializeUSBDMA+0x24>
    1318:	e5030d7f 	str	r0, [r3, #-3455]
    131c:	e12fff1e 	bx	lr
    1320:	ffe0cfff 	.word	0xffe0cfff

00001324 <USBHwRegisterFrameHandler>:
    1324:	e59f1018 	ldr	r1, [pc, #24]	; 1344 <USBHwRegisterFrameHandler+0x20>
    1328:	e59f3018 	ldr	r3, [pc, #24]	; 1348 <USBHwRegisterFrameHandler+0x24>
    132c:	e5112dfb 	ldr	r2, [r1, #-3579]
    1330:	e5830000 	str	r0, [r3]
    1334:	e59f0010 	ldr	r0, [pc, #16]	; 134c <USBHwRegisterFrameHandler+0x28>
    1338:	e3822001 	orr	r2, r2, #1	; 0x1
    133c:	e5012dfb 	str	r2, [r1, #-3579]
    1340:	eafffcf8 	b	728 <puts>
    1344:	ffe0cfff 	.word	0xffe0cfff
    1348:	40000228 	.word	0x40000228
    134c:	00001f18 	.word	0x00001f18

00001350 <USBHwRegisterDevIntHandler>:
    1350:	e59f1018 	ldr	r1, [pc, #24]	; 1370 <USBHwRegisterDevIntHandler+0x20>
    1354:	e59f3018 	ldr	r3, [pc, #24]	; 1374 <USBHwRegisterDevIntHandler+0x24>
    1358:	e5112dfb 	ldr	r2, [r1, #-3579]
    135c:	e5830000 	str	r0, [r3]
    1360:	e59f0010 	ldr	r0, [pc, #16]	; 1378 <USBHwRegisterDevIntHandler+0x28>
    1364:	e3822008 	orr	r2, r2, #8	; 0x8
    1368:	e5012dfb 	str	r2, [r1, #-3579]
    136c:	eafffced 	b	728 <puts>
    1370:	ffe0cfff 	.word	0xffe0cfff
    1374:	4000022c 	.word	0x4000022c
    1378:	00001f38 	.word	0x00001f38

0000137c <USBHwRegisterEPIntHandler>:
    137c:	e92d4010 	push	{r4, lr}
    1380:	e200300f 	and	r3, r0, #15	; 0xf
    1384:	e1a03083 	lsl	r3, r3, #1
    1388:	e2002080 	and	r2, r0, #128	; 0x80
    138c:	e183e3a2 	orr	lr, r3, r2, lsr #7
    1390:	e35e001f 	cmp	lr, #31	; 0x1f
    1394:	e1a04001 	mov	r4, r1
    1398:	e24dd004 	sub	sp, sp, #4	; 0x4
    139c:	e20010ff 	and	r1, r0, #255	; 0xff
    13a0:	da000007 	ble	13c4 <USBHwRegisterEPIntHandler+0x48>
    13a4:	e3a0c0d2 	mov	ip, #210	; 0xd2
    13a8:	e59f0050 	ldr	r0, [pc, #80]	; 1400 <USBHwRegisterEPIntHandler+0x84>
    13ac:	e59f1050 	ldr	r1, [pc, #80]	; 1404 <USBHwRegisterEPIntHandler+0x88>
    13b0:	e59f2050 	ldr	r2, [pc, #80]	; 1408 <USBHwRegisterEPIntHandler+0x8c>
    13b4:	e59f3050 	ldr	r3, [pc, #80]	; 140c <USBHwRegisterEPIntHandler+0x90>
    13b8:	e58dc000 	str	ip, [sp]
    13bc:	ebfffca3 	bl	650 <printf>
    13c0:	eafffffe 	b	13c0 <USBHwRegisterEPIntHandler+0x44>
    13c4:	e59fc044 	ldr	ip, [pc, #68]	; 1410 <USBHwRegisterEPIntHandler+0x94>
    13c8:	e51c3dcb 	ldr	r3, [ip, #-3531]
    13cc:	e3a02001 	mov	r2, #1	; 0x1
    13d0:	e1833e12 	orr	r3, r3, r2, lsl lr
    13d4:	e50c3dcb 	str	r3, [ip, #-3531]
    13d8:	e51c2dfb 	ldr	r2, [ip, #-3579]
    13dc:	e59f3030 	ldr	r3, [pc, #48]	; 1414 <USBHwRegisterEPIntHandler+0x98>
    13e0:	e59f0030 	ldr	r0, [pc, #48]	; 1418 <USBHwRegisterEPIntHandler+0x9c>
    13e4:	e3822004 	orr	r2, r2, #4	; 0x4
    13e8:	e1a0e0ae 	lsr	lr, lr, #1
    13ec:	e783410e 	str	r4, [r3, lr, lsl #2]
    13f0:	e50c2dfb 	str	r2, [ip, #-3579]
    13f4:	e28dd004 	add	sp, sp, #4	; 0x4
    13f8:	e8bd4010 	pop	{r4, lr}
    13fc:	eafffc93 	b	650 <printf>
    1400:	00001f60 	.word	0x00001f60
    1404:	00001f88 	.word	0x00001f88
    1408:	00001f90 	.word	0x00001f90
    140c:	00001e60 	.word	0x00001e60
    1410:	ffe0cfff 	.word	0xffe0cfff
    1414:	40000230 	.word	0x40000230
    1418:	00001f9c 	.word	0x00001f9c

0000141c <USBRegisterRequestHandler>:
    141c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1420:	e3500000 	cmp	r0, #0	; 0x0
    1424:	e24dd004 	sub	sp, sp, #4	; 0x4
    1428:	aa000007 	bge	144c <USBRegisterRequestHandler+0x30>
    142c:	e3a0c0e2 	mov	ip, #226	; 0xe2
    1430:	e59f0054 	ldr	r0, [pc, #84]	; 148c <USBRegisterRequestHandler+0x70>
    1434:	e59f1054 	ldr	r1, [pc, #84]	; 1490 <USBRegisterRequestHandler+0x74>
    1438:	e59f2054 	ldr	r2, [pc, #84]	; 1494 <USBRegisterRequestHandler+0x78>
    143c:	e59f3054 	ldr	r3, [pc, #84]	; 1498 <USBRegisterRequestHandler+0x7c>
    1440:	e58dc000 	str	ip, [sp]
    1444:	ebfffc81 	bl	650 <printf>
    1448:	eafffffe 	b	1448 <USBRegisterRequestHandler+0x2c>
    144c:	e3500003 	cmp	r0, #3	; 0x3
    1450:	da000007 	ble	1474 <USBRegisterRequestHandler+0x58>
    1454:	e3a0c0e3 	mov	ip, #227	; 0xe3
    1458:	e59f002c 	ldr	r0, [pc, #44]	; 148c <USBRegisterRequestHandler+0x70>
    145c:	e59f1038 	ldr	r1, [pc, #56]	; 149c <USBRegisterRequestHandler+0x80>
    1460:	e59f202c 	ldr	r2, [pc, #44]	; 1494 <USBRegisterRequestHandler+0x78>
    1464:	e59f302c 	ldr	r3, [pc, #44]	; 1498 <USBRegisterRequestHandler+0x7c>
    1468:	e58dc000 	str	ip, [sp]
    146c:	ebfffc77 	bl	650 <printf>
    1470:	eafffffe 	b	1470 <USBRegisterRequestHandler+0x54>
    1474:	e59f3024 	ldr	r3, [pc, #36]	; 14a0 <USBRegisterRequestHandler+0x84>
    1478:	e7832100 	str	r2, [r3, r0, lsl #2]
    147c:	e59f3020 	ldr	r3, [pc, #32]	; 14a4 <USBRegisterRequestHandler+0x88>
    1480:	e7831100 	str	r1, [r3, r0, lsl #2]
    1484:	e28dd004 	add	sp, sp, #4	; 0x4
    1488:	e8bd8000 	pop	{pc}
    148c:	00001f60 	.word	0x00001f60
    1490:	00001fbc 	.word	0x00001fbc
    1494:	00001fc8 	.word	0x00001fc8
    1498:	00001e7c 	.word	0x00001e7c
    149c:	00001fd8 	.word	0x00001fd8
    14a0:	40000280 	.word	0x40000280
    14a4:	40000270 	.word	0x40000270

000014a8 <_HandleRequest>:
    14a8:	e92d4010 	push	{r4, lr}
    14ac:	e5d03000 	ldrb	r3, [r0]
    14b0:	e1a032a3 	lsr	r3, r3, #5
    14b4:	e203c003 	and	ip, r3, #3	; 0x3
    14b8:	e59f3028 	ldr	r3, [pc, #40]	; 14e8 <_HandleRequest+0x40>
    14bc:	e793410c 	ldr	r4, [r3, ip, lsl #2]
    14c0:	e3540000 	cmp	r4, #0	; 0x0
    14c4:	1a000004 	bne	14dc <_HandleRequest+0x34>
    14c8:	e1a0100c 	mov	r1, ip
    14cc:	e59f0018 	ldr	r0, [pc, #24]	; 14ec <_HandleRequest+0x44>
    14d0:	ebfffc5e 	bl	650 <printf>
    14d4:	e1a00004 	mov	r0, r4
    14d8:	e8bd8010 	pop	{r4, pc}
    14dc:	e1a0e00f 	mov	lr, pc
    14e0:	e12fff14 	bx	r4
    14e4:	e8bd8010 	pop	{r4, pc}
    14e8:	40000270 	.word	0x40000270
    14ec:	00001fe4 	.word	0x00001fe4

000014f0 <StallControlPipe>:
    14f0:	e92d4070 	push	{r4, r5, r6, lr}
    14f4:	e1a03000 	mov	r3, r0
    14f8:	e3a01001 	mov	r1, #1	; 0x1
    14fc:	e3a00080 	mov	r0, #128	; 0x80
    1500:	e20350ff 	and	r5, r3, #255	; 0xff
    1504:	ebfffe0a 	bl	d34 <USBHwEPStall>
    1508:	e59f0030 	ldr	r0, [pc, #48]	; 1540 <StallControlPipe+0x50>
    150c:	ebfffc4f 	bl	650 <printf>
    1510:	e59f602c 	ldr	r6, [pc, #44]	; 1544 <StallControlPipe+0x54>
    1514:	e3a04000 	mov	r4, #0	; 0x0
    1518:	e7d41006 	ldrb	r1, [r4, r6]
    151c:	e59f0024 	ldr	r0, [pc, #36]	; 1548 <StallControlPipe+0x58>
    1520:	e2844001 	add	r4, r4, #1	; 0x1
    1524:	ebfffc49 	bl	650 <printf>
    1528:	e3540008 	cmp	r4, #8	; 0x8
    152c:	1afffff9 	bne	1518 <StallControlPipe+0x28>
    1530:	e59f0014 	ldr	r0, [pc, #20]	; 154c <StallControlPipe+0x5c>
    1534:	e1a01005 	mov	r1, r5
    1538:	e8bd4070 	pop	{r4, r5, r6, lr}
    153c:	eafffc43 	b	650 <printf>
    1540:	00002000 	.word	0x00002000
    1544:	40000290 	.word	0x40000290
    1548:	0000200c 	.word	0x0000200c
    154c:	00002014 	.word	0x00002014

00001550 <DataIn>:
    1550:	e92d4070 	push	{r4, r5, r6, lr}
    1554:	e59f6038 	ldr	r6, [pc, #56]	; 1594 <DataIn+0x44>
    1558:	e5964000 	ldr	r4, [r6]
    155c:	e59f5034 	ldr	r5, [pc, #52]	; 1598 <DataIn+0x48>
    1560:	e3540040 	cmp	r4, #64	; 0x40
    1564:	a3a04040 	movge	r4, #64	; 0x40
    1568:	e1a02004 	mov	r2, r4
    156c:	e3a00080 	mov	r0, #128	; 0x80
    1570:	e5951000 	ldr	r1, [r5]
    1574:	ebfffdf6 	bl	d54 <USBHwEPWrite>
    1578:	e5953000 	ldr	r3, [r5]
    157c:	e5962000 	ldr	r2, [r6]
    1580:	e0833004 	add	r3, r3, r4
    1584:	e0642002 	rsb	r2, r4, r2
    1588:	e5853000 	str	r3, [r5]
    158c:	e5862000 	str	r2, [r6]
    1590:	e8bd8070 	pop	{r4, r5, r6, pc}
    1594:	4000029c 	.word	0x4000029c
    1598:	40000298 	.word	0x40000298

0000159c <USBHandleControlTransfer>:
    159c:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    15a0:	e21000ff 	ands	r0, r0, #255	; 0xff
    15a4:	e24dd004 	sub	sp, sp, #4	; 0x4
    15a8:	e20170ff 	and	r7, r1, #255	; 0xff
    15ac:	1a000051 	bne	16f8 <USBHandleControlTransfer+0x15c>
    15b0:	e3110004 	tst	r1, #4	; 0x4
    15b4:	e59f6178 	ldr	r6, [pc, #376]	; 1734 <USBHandleControlTransfer+0x198>
    15b8:	0a000021 	beq	1644 <USBHandleControlTransfer+0xa8>
    15bc:	e59f5174 	ldr	r5, [pc, #372]	; 1738 <USBHandleControlTransfer+0x19c>
    15c0:	e3a02008 	mov	r2, #8	; 0x8
    15c4:	e1a01005 	mov	r1, r5
    15c8:	ebfffe04 	bl	de0 <USBHwEPRead>
    15cc:	e5d51001 	ldrb	r1, [r5, #1]
    15d0:	e59f0164 	ldr	r0, [pc, #356]	; 173c <USBHandleControlTransfer+0x1a0>
    15d4:	ebfffc1d 	bl	650 <printf>
    15d8:	e5d50000 	ldrb	r0, [r5]
    15dc:	e59f215c 	ldr	r2, [pc, #348]	; 1740 <USBHandleControlTransfer+0x1a4>
    15e0:	e1a032a0 	lsr	r3, r0, #5
    15e4:	e1d510b6 	ldrh	r1, [r5, #6]
    15e8:	e2033003 	and	r3, r3, #3	; 0x3
    15ec:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    15f0:	e59f414c 	ldr	r4, [pc, #332]	; 1744 <USBHandleControlTransfer+0x1a8>
    15f4:	e59f214c 	ldr	r2, [pc, #332]	; 1748 <USBHandleControlTransfer+0x1ac>
    15f8:	e3510000 	cmp	r1, #0	; 0x0
    15fc:	e5823000 	str	r3, [r2]
    1600:	e5861000 	str	r1, [r6]
    1604:	e5841000 	str	r1, [r4]
    1608:	0a000001 	beq	1614 <USBHandleControlTransfer+0x78>
    160c:	e1b003a0 	lsrs	r0, r0, #7
    1610:	0a000045 	beq	172c <USBHandleControlTransfer+0x190>
    1614:	e1a00005 	mov	r0, r5
    1618:	e1a01004 	mov	r1, r4
    161c:	ebffffa1 	bl	14a8 <_HandleRequest>
    1620:	e3500000 	cmp	r0, #0	; 0x0
    1624:	059f0120 	ldreq	r0, [pc, #288]	; 174c <USBHandleControlTransfer+0x1b0>
    1628:	0a000022 	beq	16b8 <USBHandleControlTransfer+0x11c>
    162c:	e1d520b6 	ldrh	r2, [r5, #6]
    1630:	e5943000 	ldr	r3, [r4]
    1634:	e1520003 	cmp	r2, r3
    1638:	d5862000 	strle	r2, [r6]
    163c:	c5863000 	strgt	r3, [r6]
    1640:	ea00002e 	b	1700 <USBHandleControlTransfer+0x164>
    1644:	e5962000 	ldr	r2, [r6]
    1648:	e3520000 	cmp	r2, #0	; 0x0
    164c:	da00001e 	ble	16cc <USBHandleControlTransfer+0x130>
    1650:	e59f40f0 	ldr	r4, [pc, #240]	; 1748 <USBHandleControlTransfer+0x1ac>
    1654:	e5941000 	ldr	r1, [r4]
    1658:	ebfffde0 	bl	de0 <USBHwEPRead>
    165c:	e3500000 	cmp	r0, #0	; 0x0
    1660:	ba000015 	blt	16bc <USBHandleControlTransfer+0x120>
    1664:	e5962000 	ldr	r2, [r6]
    1668:	e5943000 	ldr	r3, [r4]
    166c:	e0602002 	rsb	r2, r0, r2
    1670:	e0833000 	add	r3, r3, r0
    1674:	e3520000 	cmp	r2, #0	; 0x0
    1678:	e5843000 	str	r3, [r4]
    167c:	e5862000 	str	r2, [r6]
    1680:	1a000029 	bne	172c <USBHandleControlTransfer+0x190>
    1684:	e59f00ac 	ldr	r0, [pc, #172]	; 1738 <USBHandleControlTransfer+0x19c>
    1688:	e5d03000 	ldrb	r3, [r0]
    168c:	e59f20ac 	ldr	r2, [pc, #172]	; 1740 <USBHandleControlTransfer+0x1a4>
    1690:	e1a032a3 	lsr	r3, r3, #5
    1694:	e2033003 	and	r3, r3, #3	; 0x3
    1698:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    169c:	e59f10a0 	ldr	r1, [pc, #160]	; 1744 <USBHandleControlTransfer+0x1a8>
    16a0:	e1a02004 	mov	r2, r4
    16a4:	e5843000 	str	r3, [r4]
    16a8:	ebffff7e 	bl	14a8 <_HandleRequest>
    16ac:	e3500000 	cmp	r0, #0	; 0x0
    16b0:	1a000012 	bne	1700 <USBHandleControlTransfer+0x164>
    16b4:	e59f0094 	ldr	r0, [pc, #148]	; 1750 <USBHandleControlTransfer+0x1b4>
    16b8:	ebfffc1a 	bl	728 <puts>
    16bc:	e1a00007 	mov	r0, r7
    16c0:	e28dd004 	add	sp, sp, #4	; 0x4
    16c4:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    16c8:	eaffff88 	b	14f0 <StallControlPipe>
    16cc:	e1a01000 	mov	r1, r0
    16d0:	e1a02000 	mov	r2, r0
    16d4:	ebfffdc1 	bl	de0 <USBHwEPRead>
    16d8:	e59f2074 	ldr	r2, [pc, #116]	; 1754 <USBHandleControlTransfer+0x1b8>
    16dc:	e59f3074 	ldr	r3, [pc, #116]	; 1758 <USBHandleControlTransfer+0x1bc>
    16e0:	e3500000 	cmp	r0, #0	; 0x0
    16e4:	d1a00002 	movle	r0, r2
    16e8:	c1a00003 	movgt	r0, r3
    16ec:	e28dd004 	add	sp, sp, #4	; 0x4
    16f0:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    16f4:	eafffbd5 	b	650 <printf>
    16f8:	e3500080 	cmp	r0, #128	; 0x80
    16fc:	1a000002 	bne	170c <USBHandleControlTransfer+0x170>
    1700:	e28dd004 	add	sp, sp, #4	; 0x4
    1704:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    1708:	eaffff90 	b	1550 <DataIn>
    170c:	e3a0c0d4 	mov	ip, #212	; 0xd4
    1710:	e59f0044 	ldr	r0, [pc, #68]	; 175c <USBHandleControlTransfer+0x1c0>
    1714:	e59f1044 	ldr	r1, [pc, #68]	; 1760 <USBHandleControlTransfer+0x1c4>
    1718:	e59f2044 	ldr	r2, [pc, #68]	; 1764 <USBHandleControlTransfer+0x1c8>
    171c:	e59f3044 	ldr	r3, [pc, #68]	; 1768 <USBHandleControlTransfer+0x1cc>
    1720:	e58dc000 	str	ip, [sp]
    1724:	ebfffbc9 	bl	650 <printf>
    1728:	eafffffe 	b	1728 <USBHandleControlTransfer+0x18c>
    172c:	e28dd004 	add	sp, sp, #4	; 0x4
    1730:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    1734:	4000029c 	.word	0x4000029c
    1738:	40000290 	.word	0x40000290
    173c:	00002020 	.word	0x00002020
    1740:	40000280 	.word	0x40000280
    1744:	400002a0 	.word	0x400002a0
    1748:	40000298 	.word	0x40000298
    174c:	00002024 	.word	0x00002024
    1750:	0000203c 	.word	0x0000203c
    1754:	00001f84 	.word	0x00001f84
    1758:	00002054 	.word	0x00002054
    175c:	00001f60 	.word	0x00001f60
    1760:	00002058 	.word	0x00002058
    1764:	00001fc8 	.word	0x00001fc8
    1768:	00001e98 	.word	0x00001e98

0000176c <USBRegisterDescriptors>:
    176c:	e59f3004 	ldr	r3, [pc, #4]	; 1778 <USBRegisterDescriptors+0xc>
    1770:	e5830000 	str	r0, [r3]
    1774:	e12fff1e 	bx	lr
    1778:	400002ac 	.word	0x400002ac

0000177c <USBRegisterCustomReqHandler>:
    177c:	e59f3004 	ldr	r3, [pc, #4]	; 1788 <USBRegisterCustomReqHandler+0xc>
    1780:	e5830000 	str	r0, [r3]
    1784:	e12fff1e 	bx	lr
    1788:	400002a4 	.word	0x400002a4

0000178c <USBGetDescriptor>:
    178c:	e92d4070 	push	{r4, r5, r6, lr}
    1790:	e59f10ac 	ldr	r1, [pc, #172]	; 1844 <USBGetDescriptor+0xb8>
    1794:	e5911000 	ldr	r1, [r1]
    1798:	e1a00800 	lsl	r0, r0, #16
    179c:	e3510000 	cmp	r1, #0	; 0x0
    17a0:	e1a0c820 	lsr	ip, r0, #16
    17a4:	e1a05002 	mov	r5, r2
    17a8:	e24dd004 	sub	sp, sp, #4	; 0x4
    17ac:	e1a06003 	mov	r6, r3
    17b0:	11a00c20 	lsrne	r0, r0, #24
    17b4:	120ce0ff 	andne	lr, ip, #255	; 0xff
    17b8:	13a02000 	movne	r2, #0	; 0x0
    17bc:	1a000017 	bne	1820 <USBGetDescriptor+0x94>
    17c0:	e3a0c06e 	mov	ip, #110	; 0x6e
    17c4:	e59f007c 	ldr	r0, [pc, #124]	; 1848 <USBGetDescriptor+0xbc>
    17c8:	e59f107c 	ldr	r1, [pc, #124]	; 184c <USBGetDescriptor+0xc0>
    17cc:	e59f207c 	ldr	r2, [pc, #124]	; 1850 <USBGetDescriptor+0xc4>
    17d0:	e59f307c 	ldr	r3, [pc, #124]	; 1854 <USBGetDescriptor+0xc8>
    17d4:	e58dc000 	str	ip, [sp]
    17d8:	ebfffb9c 	bl	650 <printf>
    17dc:	eafffffe 	b	17dc <USBGetDescriptor+0x50>
    17e0:	e5d13001 	ldrb	r3, [r1, #1]
    17e4:	e1530000 	cmp	r3, r0
    17e8:	1a00000b 	bne	181c <USBGetDescriptor+0x90>
    17ec:	e152000e 	cmp	r2, lr
    17f0:	1a000008 	bne	1818 <USBGetDescriptor+0x8c>
    17f4:	e5861000 	str	r1, [r6]
    17f8:	e3500002 	cmp	r0, #2	; 0x2
    17fc:	05d13002 	ldrbeq	r3, [r1, #2]
    1800:	05d12003 	ldrbeq	r2, [r1, #3]
    1804:	15d13000 	ldrbne	r3, [r1]
    1808:	01833402 	orreq	r3, r3, r2, lsl #8
    180c:	e3a00001 	mov	r0, #1	; 0x1
    1810:	e5853000 	str	r3, [r5]
    1814:	ea000008 	b	183c <USBGetDescriptor+0xb0>
    1818:	e2822001 	add	r2, r2, #1	; 0x1
    181c:	e0811004 	add	r1, r1, r4
    1820:	e5d14000 	ldrb	r4, [r1]
    1824:	e3540000 	cmp	r4, #0	; 0x0
    1828:	1affffec 	bne	17e0 <USBGetDescriptor+0x54>
    182c:	e1a0100c 	mov	r1, ip
    1830:	e59f0020 	ldr	r0, [pc, #32]	; 1858 <USBGetDescriptor+0xcc>
    1834:	ebfffb85 	bl	650 <printf>
    1838:	e1a00004 	mov	r0, r4
    183c:	e28dd004 	add	sp, sp, #4	; 0x4
    1840:	e8bd8070 	pop	{r4, r5, r6, pc}
    1844:	400002ac 	.word	0x400002ac
    1848:	00001f60 	.word	0x00001f60
    184c:	00002060 	.word	0x00002060
    1850:	00002074 	.word	0x00002074
    1854:	00001ec8 	.word	0x00001ec8
    1858:	00002080 	.word	0x00002080

0000185c <USBHandleStandardRequest>:
    185c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    1860:	e59f32f8 	ldr	r3, [pc, #760]	; 1b60 <USBHandleStandardRequest+0x304>
    1864:	e5933000 	ldr	r3, [r3]
    1868:	e3530000 	cmp	r3, #0	; 0x0
    186c:	e24dd004 	sub	sp, sp, #4	; 0x4
    1870:	e1a05000 	mov	r5, r0
    1874:	e1a06001 	mov	r6, r1
    1878:	e1a04002 	mov	r4, r2
    187c:	0a000003 	beq	1890 <USBHandleStandardRequest+0x34>
    1880:	e1a0e00f 	mov	lr, pc
    1884:	e12fff13 	bx	r3
    1888:	e3500000 	cmp	r0, #0	; 0x0
    188c:	1a0000a9 	bne	1b38 <USBHandleStandardRequest+0x2dc>
    1890:	e5d53000 	ldrb	r3, [r5]
    1894:	e203301f 	and	r3, r3, #31	; 0x1f
    1898:	e3530001 	cmp	r3, #1	; 0x1
    189c:	0a000059 	beq	1a08 <USBHandleStandardRequest+0x1ac>
    18a0:	e3530002 	cmp	r3, #2	; 0x2
    18a4:	0a00007b 	beq	1a98 <USBHandleStandardRequest+0x23c>
    18a8:	e3530000 	cmp	r3, #0	; 0x0
    18ac:	1a0000a7 	bne	1b50 <USBHandleStandardRequest+0x2f4>
    18b0:	e5d51001 	ldrb	r1, [r5, #1]
    18b4:	e5940000 	ldr	r0, [r4]
    18b8:	e3510009 	cmp	r1, #9	; 0x9
    18bc:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    18c0:	ea00004e 	b	1a00 <USBHandleStandardRequest+0x1a4>
    18c4:	00001a4c 	.word	0x00001a4c
    18c8:	00001b50 	.word	0x00001b50
    18cc:	00001a00 	.word	0x00001a00
    18d0:	00001b50 	.word	0x00001b50
    18d4:	00001a00 	.word	0x00001a00
    18d8:	000018ec 	.word	0x000018ec
    18dc:	000018f8 	.word	0x000018f8
    18e0:	000019f8 	.word	0x000019f8
    18e4:	00001920 	.word	0x00001920
    18e8:	00001938 	.word	0x00001938
    18ec:	e5d50002 	ldrb	r0, [r5, #2]
    18f0:	ebfffcf4 	bl	cc8 <USBHwSetAddress>
    18f4:	ea00008f 	b	1b38 <USBHandleStandardRequest+0x2dc>
    18f8:	e1d510b2 	ldrh	r1, [r5, #2]
    18fc:	e59f0260 	ldr	r0, [pc, #608]	; 1b64 <USBHandleStandardRequest+0x308>
    1900:	ebfffb52 	bl	650 <printf>
    1904:	e1d510b4 	ldrh	r1, [r5, #4]
    1908:	e1d500b2 	ldrh	r0, [r5, #2]
    190c:	e1a02006 	mov	r2, r6
    1910:	e1a03004 	mov	r3, r4
    1914:	e28dd004 	add	sp, sp, #4	; 0x4
    1918:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    191c:	eaffff9a 	b	178c <USBGetDescriptor>
    1920:	e59f3240 	ldr	r3, [pc, #576]	; 1b68 <USBHandleStandardRequest+0x30c>
    1924:	e5d32000 	ldrb	r2, [r3]
    1928:	e3a03001 	mov	r3, #1	; 0x1
    192c:	e1a01003 	mov	r1, r3
    1930:	e5c02000 	strb	r2, [r0]
    1934:	ea000072 	b	1b04 <USBHandleStandardRequest+0x2a8>
    1938:	e59f322c 	ldr	r3, [pc, #556]	; 1b6c <USBHandleStandardRequest+0x310>
    193c:	e5933000 	ldr	r3, [r3]
    1940:	e3530000 	cmp	r3, #0	; 0x0
    1944:	e1d520b2 	ldrh	r2, [r5, #2]
    1948:	1a000007 	bne	196c <USBHandleStandardRequest+0x110>
    194c:	e3a0c0a5 	mov	ip, #165	; 0xa5
    1950:	e59f0218 	ldr	r0, [pc, #536]	; 1b70 <USBHandleStandardRequest+0x314>
    1954:	e59f1218 	ldr	r1, [pc, #536]	; 1b74 <USBHandleStandardRequest+0x318>
    1958:	e59f2218 	ldr	r2, [pc, #536]	; 1b78 <USBHandleStandardRequest+0x31c>
    195c:	e59f3218 	ldr	r3, [pc, #536]	; 1b7c <USBHandleStandardRequest+0x320>
    1960:	e58dc000 	str	ip, [sp]
    1964:	ebfffb39 	bl	650 <printf>
    1968:	eafffffe 	b	1968 <USBHandleStandardRequest+0x10c>
    196c:	e21270ff 	ands	r7, r2, #255	; 0xff
    1970:	13a060ff 	movne	r6, #255	; 0xff
    1974:	01a00007 	moveq	r0, r7
    1978:	11a04003 	movne	r4, r3
    197c:	11a08006 	movne	r8, r6
    1980:	1a000012 	bne	19d0 <USBHandleStandardRequest+0x174>
    1984:	ea000015 	b	19e0 <USBHandleStandardRequest+0x184>
    1988:	e5d43001 	ldrb	r3, [r4, #1]
    198c:	e3530004 	cmp	r3, #4	; 0x4
    1990:	05d46003 	ldrbeq	r6, [r4, #3]
    1994:	0a00000b 	beq	19c8 <USBHandleStandardRequest+0x16c>
    1998:	e3530005 	cmp	r3, #5	; 0x5
    199c:	0a000002 	beq	19ac <USBHandleStandardRequest+0x150>
    19a0:	e3530002 	cmp	r3, #2	; 0x2
    19a4:	05d48005 	ldrbeq	r8, [r4, #5]
    19a8:	ea000006 	b	19c8 <USBHandleStandardRequest+0x16c>
    19ac:	e1580007 	cmp	r8, r7
    19b0:	03560000 	cmpeq	r6, #0	; 0x0
    19b4:	05d43005 	ldrbeq	r3, [r4, #5]
    19b8:	05d41004 	ldrbeq	r1, [r4, #4]
    19bc:	05d40002 	ldrbeq	r0, [r4, #2]
    19c0:	01811403 	orreq	r1, r1, r3, lsl #8
    19c4:	0bfffca9 	bleq	c70 <USBHwEPConfig>
    19c8:	e5d43000 	ldrb	r3, [r4]
    19cc:	e0844003 	add	r4, r4, r3
    19d0:	e5d43000 	ldrb	r3, [r4]
    19d4:	e3530000 	cmp	r3, #0	; 0x0
    19d8:	1affffea 	bne	1988 <USBHandleStandardRequest+0x12c>
    19dc:	e3a00001 	mov	r0, #1	; 0x1
    19e0:	ebfffd4e 	bl	f20 <USBHwConfigDevice>
    19e4:	e1d520b2 	ldrh	r2, [r5, #2]
    19e8:	e59f3178 	ldr	r3, [pc, #376]	; 1b68 <USBHandleStandardRequest+0x30c>
    19ec:	e3a01001 	mov	r1, #1	; 0x1
    19f0:	e5c32000 	strb	r2, [r3]
    19f4:	ea000056 	b	1b54 <USBHandleStandardRequest+0x2f8>
    19f8:	e59f0180 	ldr	r0, [pc, #384]	; 1b80 <USBHandleStandardRequest+0x324>
    19fc:	ea000052 	b	1b4c <USBHandleStandardRequest+0x2f0>
    1a00:	e59f017c 	ldr	r0, [pc, #380]	; 1b84 <USBHandleStandardRequest+0x328>
    1a04:	ea000050 	b	1b4c <USBHandleStandardRequest+0x2f0>
    1a08:	e5d51001 	ldrb	r1, [r5, #1]
    1a0c:	e5940000 	ldr	r0, [r4]
    1a10:	e351000b 	cmp	r1, #11	; 0xb
    1a14:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1a18:	ea00001c 	b	1a90 <USBHandleStandardRequest+0x234>
    1a1c:	00001a4c 	.word	0x00001a4c
    1a20:	00001b50 	.word	0x00001b50
    1a24:	00001a90 	.word	0x00001a90
    1a28:	00001b50 	.word	0x00001b50
    1a2c:	00001a90 	.word	0x00001a90
    1a30:	00001a90 	.word	0x00001a90
    1a34:	00001a90 	.word	0x00001a90
    1a38:	00001a90 	.word	0x00001a90
    1a3c:	00001a90 	.word	0x00001a90
    1a40:	00001a90 	.word	0x00001a90
    1a44:	00001a60 	.word	0x00001a60
    1a48:	00001a78 	.word	0x00001a78
    1a4c:	e3a03000 	mov	r3, #0	; 0x0
    1a50:	e3a01001 	mov	r1, #1	; 0x1
    1a54:	e5c03001 	strb	r3, [r0, #1]
    1a58:	e5c03000 	strb	r3, [r0]
    1a5c:	ea000027 	b	1b00 <USBHandleStandardRequest+0x2a4>
    1a60:	e3a02001 	mov	r2, #1	; 0x1
    1a64:	e3a03000 	mov	r3, #0	; 0x0
    1a68:	e1a01002 	mov	r1, r2
    1a6c:	e5c03000 	strb	r3, [r0]
    1a70:	e5862000 	str	r2, [r6]
    1a74:	ea000036 	b	1b54 <USBHandleStandardRequest+0x2f8>
    1a78:	e1d500b2 	ldrh	r0, [r5, #2]
    1a7c:	e3500000 	cmp	r0, #0	; 0x0
    1a80:	03a01001 	moveq	r1, #1	; 0x1
    1a84:	05860000 	streq	r0, [r6]
    1a88:	0a000031 	beq	1b54 <USBHandleStandardRequest+0x2f8>
    1a8c:	ea00002f 	b	1b50 <USBHandleStandardRequest+0x2f4>
    1a90:	e59f00f0 	ldr	r0, [pc, #240]	; 1b88 <USBHandleStandardRequest+0x32c>
    1a94:	ea00002c 	b	1b4c <USBHandleStandardRequest+0x2f0>
    1a98:	e5d51001 	ldrb	r1, [r5, #1]
    1a9c:	e5944000 	ldr	r4, [r4]
    1aa0:	e351000c 	cmp	r1, #12	; 0xc
    1aa4:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1aa8:	ea000026 	b	1b48 <USBHandleStandardRequest+0x2ec>
    1aac:	00001ae0 	.word	0x00001ae0
    1ab0:	00001b0c 	.word	0x00001b0c
    1ab4:	00001b48 	.word	0x00001b48
    1ab8:	00001b20 	.word	0x00001b20
    1abc:	00001b48 	.word	0x00001b48
    1ac0:	00001b48 	.word	0x00001b48
    1ac4:	00001b48 	.word	0x00001b48
    1ac8:	00001b48 	.word	0x00001b48
    1acc:	00001b48 	.word	0x00001b48
    1ad0:	00001b48 	.word	0x00001b48
    1ad4:	00001b48 	.word	0x00001b48
    1ad8:	00001b48 	.word	0x00001b48
    1adc:	00001b40 	.word	0x00001b40
    1ae0:	e5d50004 	ldrb	r0, [r5, #4]
    1ae4:	ebfffc8a 	bl	d14 <USBHwEPGetStatus>
    1ae8:	e1a000a0 	lsr	r0, r0, #1
    1aec:	e2000001 	and	r0, r0, #1	; 0x1
    1af0:	e3a03000 	mov	r3, #0	; 0x0
    1af4:	e5c43001 	strb	r3, [r4, #1]
    1af8:	e5c40000 	strb	r0, [r4]
    1afc:	e3a01001 	mov	r1, #1	; 0x1
    1b00:	e2833002 	add	r3, r3, #2	; 0x2
    1b04:	e5863000 	str	r3, [r6]
    1b08:	ea000011 	b	1b54 <USBHandleStandardRequest+0x2f8>
    1b0c:	e1d510b2 	ldrh	r1, [r5, #2]
    1b10:	e3510000 	cmp	r1, #0	; 0x0
    1b14:	05d50004 	ldrbeq	r0, [r5, #4]
    1b18:	0a000005 	beq	1b34 <USBHandleStandardRequest+0x2d8>
    1b1c:	ea00000b 	b	1b50 <USBHandleStandardRequest+0x2f4>
    1b20:	e1d530b2 	ldrh	r3, [r5, #2]
    1b24:	e3530000 	cmp	r3, #0	; 0x0
    1b28:	1a000008 	bne	1b50 <USBHandleStandardRequest+0x2f4>
    1b2c:	e5d50004 	ldrb	r0, [r5, #4]
    1b30:	e3a01001 	mov	r1, #1	; 0x1
    1b34:	ebfffc7e 	bl	d34 <USBHwEPStall>
    1b38:	e3a01001 	mov	r1, #1	; 0x1
    1b3c:	ea000004 	b	1b54 <USBHandleStandardRequest+0x2f8>
    1b40:	e59f0044 	ldr	r0, [pc, #68]	; 1b8c <USBHandleStandardRequest+0x330>
    1b44:	ea000000 	b	1b4c <USBHandleStandardRequest+0x2f0>
    1b48:	e59f0040 	ldr	r0, [pc, #64]	; 1b90 <USBHandleStandardRequest+0x334>
    1b4c:	ebfffabf 	bl	650 <printf>
    1b50:	e3a01000 	mov	r1, #0	; 0x0
    1b54:	e1a00001 	mov	r0, r1
    1b58:	e28dd004 	add	sp, sp, #4	; 0x4
    1b5c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    1b60:	400002a4 	.word	0x400002a4
    1b64:	00002094 	.word	0x00002094
    1b68:	400002a8 	.word	0x400002a8
    1b6c:	400002ac 	.word	0x400002ac
    1b70:	00001f60 	.word	0x00001f60
    1b74:	00002060 	.word	0x00002060
    1b78:	00002074 	.word	0x00002074
    1b7c:	00001eb4 	.word	0x00001eb4
    1b80:	00002098 	.word	0x00002098
    1b84:	000020b8 	.word	0x000020b8
    1b88:	000020d0 	.word	0x000020d0
    1b8c:	000020ec 	.word	0x000020ec
    1b90:	00002108 	.word	0x00002108

00001b94 <USBInit>:
    1b94:	e92d4010 	push	{r4, lr}
    1b98:	e59f4050 	ldr	r4, [pc, #80]	; 1bf0 <USBInit+0x5c>
    1b9c:	ebfffd3b 	bl	1090 <USBHwInit>
    1ba0:	e59f004c 	ldr	r0, [pc, #76]	; 1bf4 <USBInit+0x60>
    1ba4:	ebfffde9 	bl	1350 <USBHwRegisterDevIntHandler>
    1ba8:	e1a01004 	mov	r1, r4
    1bac:	e3a00000 	mov	r0, #0	; 0x0
    1bb0:	ebfffdf1 	bl	137c <USBHwRegisterEPIntHandler>
    1bb4:	e1a01004 	mov	r1, r4
    1bb8:	e3a00080 	mov	r0, #128	; 0x80
    1bbc:	ebfffdee 	bl	137c <USBHwRegisterEPIntHandler>
    1bc0:	e3a00000 	mov	r0, #0	; 0x0
    1bc4:	e3a01040 	mov	r1, #64	; 0x40
    1bc8:	ebfffc28 	bl	c70 <USBHwEPConfig>
    1bcc:	e3a00080 	mov	r0, #128	; 0x80
    1bd0:	e3a01040 	mov	r1, #64	; 0x40
    1bd4:	ebfffc25 	bl	c70 <USBHwEPConfig>
    1bd8:	e3a00000 	mov	r0, #0	; 0x0
    1bdc:	e59f1014 	ldr	r1, [pc, #20]	; 1bf8 <USBInit+0x64>
    1be0:	e59f2014 	ldr	r2, [pc, #20]	; 1bfc <USBInit+0x68>
    1be4:	ebfffe0c 	bl	141c <USBRegisterRequestHandler>
    1be8:	e3a00001 	mov	r0, #1	; 0x1
    1bec:	e8bd8010 	pop	{r4, pc}
    1bf0:	0000159c 	.word	0x0000159c
    1bf4:	00001c00 	.word	0x00001c00
    1bf8:	0000185c 	.word	0x0000185c
    1bfc:	400002b0 	.word	0x400002b0

00001c00 <HandleUsbReset>:
    1c00:	e3100010 	tst	r0, #16	; 0x10
    1c04:	012fff1e 	bxeq	lr
    1c08:	e59f0000 	ldr	r0, [pc, #0]	; 1c10 <HandleUsbReset+0x10>
    1c0c:	eafffa8f 	b	650 <printf>
    1c10:	0000211c 	.word	0x0000211c

00001c14 <__aeabi_uidiv>:
    1c14:	e2512001 	subs	r2, r1, #1	; 0x1
    1c18:	012fff1e 	bxeq	lr
    1c1c:	3a000036 	bcc	1cfc <__aeabi_uidiv+0xe8>
    1c20:	e1500001 	cmp	r0, r1
    1c24:	9a000022 	bls	1cb4 <__aeabi_uidiv+0xa0>
    1c28:	e1110002 	tst	r1, r2
    1c2c:	0a000023 	beq	1cc0 <__aeabi_uidiv+0xac>
    1c30:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1c34:	01a01181 	lsleq	r1, r1, #3
    1c38:	03a03008 	moveq	r3, #8	; 0x8
    1c3c:	13a03001 	movne	r3, #1	; 0x1
    1c40:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1c44:	31510000 	cmpcc	r1, r0
    1c48:	31a01201 	lslcc	r1, r1, #4
    1c4c:	31a03203 	lslcc	r3, r3, #4
    1c50:	3afffffa 	bcc	1c40 <__aeabi_uidiv+0x2c>
    1c54:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1c58:	31510000 	cmpcc	r1, r0
    1c5c:	31a01081 	lslcc	r1, r1, #1
    1c60:	31a03083 	lslcc	r3, r3, #1
    1c64:	3afffffa 	bcc	1c54 <__aeabi_uidiv+0x40>
    1c68:	e3a02000 	mov	r2, #0	; 0x0
    1c6c:	e1500001 	cmp	r0, r1
    1c70:	20400001 	subcs	r0, r0, r1
    1c74:	21822003 	orrcs	r2, r2, r3
    1c78:	e15000a1 	cmp	r0, r1, lsr #1
    1c7c:	204000a1 	subcs	r0, r0, r1, lsr #1
    1c80:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1c84:	e1500121 	cmp	r0, r1, lsr #2
    1c88:	20400121 	subcs	r0, r0, r1, lsr #2
    1c8c:	21822123 	orrcs	r2, r2, r3, lsr #2
    1c90:	e15001a1 	cmp	r0, r1, lsr #3
    1c94:	204001a1 	subcs	r0, r0, r1, lsr #3
    1c98:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1c9c:	e3500000 	cmp	r0, #0	; 0x0
    1ca0:	11b03223 	lsrsne	r3, r3, #4
    1ca4:	11a01221 	lsrne	r1, r1, #4
    1ca8:	1affffef 	bne	1c6c <__aeabi_uidiv+0x58>
    1cac:	e1a00002 	mov	r0, r2
    1cb0:	e12fff1e 	bx	lr
    1cb4:	03a00001 	moveq	r0, #1	; 0x1
    1cb8:	13a00000 	movne	r0, #0	; 0x0
    1cbc:	e12fff1e 	bx	lr
    1cc0:	e3510801 	cmp	r1, #65536	; 0x10000
    1cc4:	21a01821 	lsrcs	r1, r1, #16
    1cc8:	23a02010 	movcs	r2, #16	; 0x10
    1ccc:	33a02000 	movcc	r2, #0	; 0x0
    1cd0:	e3510c01 	cmp	r1, #256	; 0x100
    1cd4:	21a01421 	lsrcs	r1, r1, #8
    1cd8:	22822008 	addcs	r2, r2, #8	; 0x8
    1cdc:	e3510010 	cmp	r1, #16	; 0x10
    1ce0:	21a01221 	lsrcs	r1, r1, #4
    1ce4:	22822004 	addcs	r2, r2, #4	; 0x4
    1ce8:	e3510004 	cmp	r1, #4	; 0x4
    1cec:	82822003 	addhi	r2, r2, #3	; 0x3
    1cf0:	908220a1 	addls	r2, r2, r1, lsr #1
    1cf4:	e1a00230 	lsr	r0, r0, r2
    1cf8:	e12fff1e 	bx	lr
    1cfc:	e52de008 	str	lr, [sp, #-8]!
    1d00:	eb00003a 	bl	1df0 <__aeabi_idiv0>
    1d04:	e3a00000 	mov	r0, #0	; 0x0
    1d08:	e49df008 	ldr	pc, [sp], #8

00001d0c <__aeabi_uidivmod>:
    1d0c:	e92d4003 	push	{r0, r1, lr}
    1d10:	ebffffbf 	bl	1c14 <__aeabi_uidiv>
    1d14:	e8bd4006 	pop	{r1, r2, lr}
    1d18:	e0030092 	mul	r3, r2, r0
    1d1c:	e0411003 	sub	r1, r1, r3
    1d20:	e12fff1e 	bx	lr

00001d24 <__umodsi3>:
    1d24:	e2512001 	subs	r2, r1, #1	; 0x1
    1d28:	3a00002c 	bcc	1de0 <__umodsi3+0xbc>
    1d2c:	11500001 	cmpne	r0, r1
    1d30:	03a00000 	moveq	r0, #0	; 0x0
    1d34:	81110002 	tsthi	r1, r2
    1d38:	00000002 	andeq	r0, r0, r2
    1d3c:	912fff1e 	bxls	lr
    1d40:	e3a02000 	mov	r2, #0	; 0x0
    1d44:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1d48:	31510000 	cmpcc	r1, r0
    1d4c:	31a01201 	lslcc	r1, r1, #4
    1d50:	32822004 	addcc	r2, r2, #4	; 0x4
    1d54:	3afffffa 	bcc	1d44 <__umodsi3+0x20>
    1d58:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1d5c:	31510000 	cmpcc	r1, r0
    1d60:	31a01081 	lslcc	r1, r1, #1
    1d64:	32822001 	addcc	r2, r2, #1	; 0x1
    1d68:	3afffffa 	bcc	1d58 <__umodsi3+0x34>
    1d6c:	e2522003 	subs	r2, r2, #3	; 0x3
    1d70:	ba00000e 	blt	1db0 <__umodsi3+0x8c>
    1d74:	e1500001 	cmp	r0, r1
    1d78:	20400001 	subcs	r0, r0, r1
    1d7c:	e15000a1 	cmp	r0, r1, lsr #1
    1d80:	204000a1 	subcs	r0, r0, r1, lsr #1
    1d84:	e1500121 	cmp	r0, r1, lsr #2
    1d88:	20400121 	subcs	r0, r0, r1, lsr #2
    1d8c:	e15001a1 	cmp	r0, r1, lsr #3
    1d90:	204001a1 	subcs	r0, r0, r1, lsr #3
    1d94:	e3500001 	cmp	r0, #1	; 0x1
    1d98:	e1a01221 	lsr	r1, r1, #4
    1d9c:	a2522004 	subsge	r2, r2, #4	; 0x4
    1da0:	aafffff3 	bge	1d74 <__umodsi3+0x50>
    1da4:	e3120003 	tst	r2, #3	; 0x3
    1da8:	13300000 	teqne	r0, #0	; 0x0
    1dac:	0a00000a 	beq	1ddc <__umodsi3+0xb8>
    1db0:	e3720002 	cmn	r2, #2	; 0x2
    1db4:	ba000006 	blt	1dd4 <__umodsi3+0xb0>
    1db8:	0a000002 	beq	1dc8 <__umodsi3+0xa4>
    1dbc:	e1500001 	cmp	r0, r1
    1dc0:	20400001 	subcs	r0, r0, r1
    1dc4:	e1a010a1 	lsr	r1, r1, #1
    1dc8:	e1500001 	cmp	r0, r1
    1dcc:	20400001 	subcs	r0, r0, r1
    1dd0:	e1a010a1 	lsr	r1, r1, #1
    1dd4:	e1500001 	cmp	r0, r1
    1dd8:	20400001 	subcs	r0, r0, r1
    1ddc:	e12fff1e 	bx	lr
    1de0:	e52de008 	str	lr, [sp, #-8]!
    1de4:	eb000001 	bl	1df0 <__aeabi_idiv0>
    1de8:	e3a00000 	mov	r0, #0	; 0x0
    1dec:	e49df008 	ldr	pc, [sp], #8

00001df0 <__aeabi_idiv0>:
    1df0:	e12fff1e 	bx	lr

00001df4 <abDescriptors>:
    1df4:	01010112 40000002 0005ffff 02010100     .......@........
    1e04:	02090103 01010020 0932c000 02000004     .... .....2.....
    1e14:	000000ff 0d060507 07010080 800d8305     ................
    1e24:	03040100 030e0409 0050004c 00550043     ........L.P.C.U.
    1e34:	00420053 00550314 00420053 00650053     S.B...U.S.B.S.e.
    1e44:	00690072 006c0061 00440312 00410045     r.i.a.l...D.E.A.
    1e54:	00430044 00440030 00000045              D.C.0.D.E...

00001e60 <__FUNCTION__.1675>:
    1e60:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    1e70:	6148746e 656c646e 00000072              ntHandler...

00001e7c <__FUNCTION__.1666>:
    1e7c:	52425355 73696765 52726574 65757165     USBRegisterReque
    1e8c:	61487473 656c646e 00000072              stHandler...

00001e98 <__FUNCTION__.1628>:
    1e98:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    1ea8:	6e617254 72656673 00000000              Transfer....

00001eb4 <__FUNCTION__.1642>:
    1eb4:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    1ec4:	006e6f69                                ion.

00001ec8 <__FUNCTION__.1609>:
    1ec8:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    1ed8:	00000000 6c756e28 0000296c 74696e49     ....(null)..Init
    1ee8:	696c6169 676e6973 42535520 61747320     ialising USB sta
    1ef8:	00006b63 72617453 676e6974 42535520     ck..Starting USB
    1f08:	6d6f6320 696e756d 69746163 00006e6f      communication..
    1f18:	69676552 72657473 68206465 6c646e61     Registered handl
    1f28:	66207265 6620726f 656d6172 00000000     er for frame....
    1f38:	69676552 72657473 68206465 6c646e61     Registered handl
    1f48:	66207265 6420726f 63697665 74732065     er for device st
    1f58:	73757461 00000000 7373410a 69747265     atus.....Asserti
    1f68:	27206e6f 20277325 6c696166 69206465     on '%s' failed i
    1f78:	7325206e 2373253a 0a216425 00000000     n %s:%s#%d!.....
    1f88:	3c786469 00003233 68627375 706c5f77     idx<32..usbhw_lp
    1f98:	00632e63 69676552 72657473 68206465     c.c.Registered h
    1fa8:	6c646e61 66207265 4520726f 78302050     andler for EP 0x
    1fb8:	000a7825 70795469 3d3e2065 00003020     %x..iType >= 0..
    1fc8:	63627375 72746e6f 632e6c6f 00000000     usbcontrol.c....
    1fd8:	70795469 203c2065 00000034 68206f4e     iType < 4...No h
    1fe8:	6c646e61 66207265 7220726f 79747165     andler for reqty
    1ff8:	25206570 00000a64 4c415453 6e6f204c     pe %d...STALL on
    2008:	00005b20 32302520 00000078 7473205d      [.. %02x...] st
    2018:	253d7461 00000a78 00782553 6e61485f     at=%x...S%x._Han
    2028:	52656c64 65757165 20317473 6c696166     dleRequest1 fail
    2038:	00006465 6e61485f 52656c64 65757165     ed.._HandleReque
    2048:	20327473 6c696166 00006465 0000003f     st2 failed..?...
    2058:	534c4146 00000045 44626170 72637365     FALSE...pabDescr
    2068:	21207069 554e203d 00004c4c 73627375     ip != NULL..usbs
    2078:	65726474 00632e71 63736544 20782520     tdreq.c.Desc %x 
    2088:	20746f6e 6e756f66 000a2164 00782544     not found!..D%x.
    2098:	69766544 72206563 25207165 6f6e2064     Device req %d no
    20a8:	6d692074 6d656c70 65746e65 00000a64     t implemented...
    20b8:	656c6c49 206c6167 69766564 72206563     Illegal device r
    20c8:	25207165 00000a64 656c6c49 206c6167     eq %d...Illegal 
    20d8:	65746e69 63616672 65722065 64252071     interface req %d
    20e8:	0000000a 72205045 25207165 6f6e2064     ....EP req %d no
    20f8:	6d692074 6d656c70 65746e65 00000a64     t implemented...
    2108:	656c6c49 206c6167 72205045 25207165     Illegal EP req %
    2118:	00000a64 0000210a                       d....!..
