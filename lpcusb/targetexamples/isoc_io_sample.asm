
isoc_io_sample.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_startup>:
       0:	e59ff018 	ldr	pc, [pc, #24]	; 20 <Reset_Addr>
       4:	e59ff018 	ldr	pc, [pc, #24]	; 24 <Undef_Addr>
       8:	e59ff018 	ldr	pc, [pc, #24]	; 28 <SWI_Addr>
       c:	e59ff018 	ldr	pc, [pc, #24]	; 2c <PAbt_Addr>
      10:	e59ff018 	ldr	pc, [pc, #24]	; 30 <DAbt_Addr>
      14:	e1a00000 	nop			(mov r0,r0)
      18:	e51ffff0 	ldr	pc, [pc, #-4080]	; fffff030 <_stack_end+0xbfff7154>
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
      c4:	00001f78 	.word	0x00001f78
      c8:	40000200 	.word	0x40000200
      cc:	40000200 	.word	0x40000200
      d0:	40000200 	.word	0x40000200
      d4:	400006a8 	.word	0x400006a8

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
     394:	eb0005f8 	bl	1b7c <__umodsi3>
     398:	e1a03000 	mov	r3, r0
     39c:	e3530009 	cmp	r3, #9	; 0x9
     3a0:	c083300a 	addgt	r3, r3, sl
     3a4:	e2833030 	add	r3, r3, #48	; 0x30
     3a8:	e1a00004 	mov	r0, r4
     3ac:	e5653001 	strb	r3, [r5, #-1]!
     3b0:	e1a01006 	mov	r1, r6
     3b4:	eb0005ac 	bl	1a6c <__aeabi_uidiv>
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
     614:	00001d34 	.word	0x00001d34

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
     7a0:	40000204 	.word	0x40000204
     7a4:	40000200 	.word	0x40000200

000007a8 <main>:
     7a8:	e92d4030 	push	{r4, r5, lr}
     7ac:	e59f40dc 	ldr	r4, [pc, #220]	; 890 <main+0xe8>
     7b0:	e5943008 	ldr	r3, [r4, #8]
     7b4:	e3833b01 	orr	r3, r3, #1024	; 0x400
     7b8:	e5843008 	str	r3, [r4, #8]
     7bc:	e5943008 	ldr	r3, [r4, #8]
     7c0:	e3833b02 	orr	r3, r3, #2048	; 0x800
     7c4:	e5843008 	str	r3, [r4, #8]
     7c8:	ebfffe7a 	bl	1b8 <HalSysInit>
     7cc:	e3a00020 	mov	r0, #32	; 0x20
     7d0:	ebffffab 	bl	684 <ConsoleInit>
     7d4:	e59f00b8 	ldr	r0, [pc, #184]	; 894 <main+0xec>
     7d8:	ebffffd2 	bl	728 <puts>
     7dc:	eb000482 	bl	19ec <USBInit>
     7e0:	e59f00b0 	ldr	r0, [pc, #176]	; 898 <main+0xf0>
     7e4:	eb000376 	bl	15c4 <USBRegisterDescriptors>
     7e8:	e59f20ac 	ldr	r2, [pc, #172]	; 89c <main+0xf4>
     7ec:	e3a00001 	mov	r0, #1	; 0x1
     7f0:	e59f10a8 	ldr	r1, [pc, #168]	; 8a0 <main+0xf8>
     7f4:	eb00029e 	bl	1274 <USBRegisterRequestHandler>
     7f8:	e3a01000 	mov	r1, #0	; 0x0
     7fc:	e3a00081 	mov	r0, #129	; 0x81
     800:	eb000273 	bl	11d4 <USBHwRegisterEPIntHandler>
     804:	e59f0098 	ldr	r0, [pc, #152]	; 8a4 <main+0xfc>
     808:	eb00025b 	bl	117c <USBHwRegisterFrameHandler>
     80c:	e59f0094 	ldr	r0, [pc, #148]	; 8a8 <main+0x100>
     810:	eb000264 	bl	11a8 <USBHwRegisterDevIntHandler>
     814:	e59f3090 	ldr	r3, [pc, #144]	; 8ac <main+0x104>
     818:	e3a05000 	mov	r5, #0	; 0x0
     81c:	e5835000 	str	r5, [r3]
     820:	e59f0088 	ldr	r0, [pc, #136]	; 8b0 <main+0x108>
     824:	ebffffbf 	bl	728 <puts>
     828:	e3e02000 	mvn	r2, #0	; 0x0
     82c:	e3a03036 	mov	r3, #54	; 0x36
     830:	e5023dff 	str	r3, [r2, #-3583]
     834:	e59f3078 	ldr	r3, [pc, #120]	; 8b4 <main+0x10c>
     838:	e5023eff 	str	r3, [r2, #-3839]
     83c:	e5123ff3 	ldr	r3, [r2, #-4083]
     840:	e3c33501 	bic	r3, r3, #4194304	; 0x400000
     844:	e5023ff3 	str	r3, [r2, #-4083]
     848:	e5123fef 	ldr	r3, [r2, #-4079]
     84c:	e3833501 	orr	r3, r3, #4194304	; 0x400000
     850:	e5023fef 	str	r3, [r2, #-4079]
     854:	eb000066 	bl	9f4 <enableIRQ>
     858:	e3a00001 	mov	r0, #1	; 0x1
     85c:	eb0000b3 	bl	b30 <USBHwConnect>
     860:	e59f0050 	ldr	r0, [pc, #80]	; 8b8 <main+0x110>
     864:	e59f1050 	ldr	r1, [pc, #80]	; 8bc <main+0x114>
     868:	e3a03b02 	mov	r3, #2048	; 0x800
     86c:	e1a02005 	mov	r2, r5
     870:	e2855001 	add	r5, r5, #1	; 0x1
     874:	e1550000 	cmp	r5, r0
     878:	05843004 	streq	r3, [r4, #4]
     87c:	0afffffb 	beq	870 <main+0xc8>
     880:	e1550001 	cmp	r5, r1
     884:	c1a05002 	movgt	r5, r2
     888:	c584300c 	strgt	r3, [r4, #12]
     88c:	eafffff7 	b	870 <main+0xc8>
     890:	e0028000 	.word	0xe0028000
     894:	00001d3c 	.word	0x00001d3c
     898:	00001c4c 	.word	0x00001c4c
     89c:	4000020c 	.word	0x4000020c
     8a0:	0000075c 	.word	0x0000075c
     8a4:	000008ec 	.word	0x000008ec
     8a8:	00000764 	.word	0x00000764
     8ac:	400006a4 	.word	0x400006a4
     8b0:	00001d54 	.word	0x00001d54
     8b4:	000008c0 	.word	0x000008c0
     8b8:	00030d40 	.word	0x00030d40
     8bc:	00061a7f 	.word	0x00061a7f

000008c0 <USBIntHandler>:
     8c0:	e24ee004 	sub	lr, lr, #4	; 0x4
     8c4:	e92d41ff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
     8c8:	e14f1000 	mrs	r1, SPSR
     8cc:	e92d0002 	push	{r1}
     8d0:	eb00012c 	bl	d88 <USBHwISR>
     8d4:	e3a02000 	mov	r2, #0	; 0x0
     8d8:	e3e03000 	mvn	r3, #0	; 0x0
     8dc:	e5032fcf 	str	r2, [r3, #-4047]
     8e0:	e8bd0002 	pop	{r1}
     8e4:	e161f001 	msr	SPSR_c, r1
     8e8:	e8fd81ff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}^

000008ec <USBFrameHandler>:
     8ec:	e59f3084 	ldr	r3, [pc, #132]	; 978 <USBFrameHandler+0x8c>
     8f0:	e5933000 	ldr	r3, [r3]
     8f4:	e3530000 	cmp	r3, #0	; 0x0
     8f8:	e92d4010 	push	{r4, lr}
     8fc:	08bd8010 	popeq	{r4, pc}
     900:	e59f2074 	ldr	r2, [pc, #116]	; 97c <USBFrameHandler+0x90>
     904:	e5923000 	ldr	r3, [r2]
     908:	e3530efa 	cmp	r3, #4000	; 0xfa0
     90c:	b2833001 	addlt	r3, r3, #1	; 0x1
     910:	b5823000 	strlt	r3, [r2]
     914:	b8bd8010 	poplt	{r4, pc}
     918:	e59fc060 	ldr	ip, [pc, #96]	; 980 <USBFrameHandler+0x94>
     91c:	e59c3000 	ldr	r3, [ip]
     920:	e59f405c 	ldr	r4, [pc, #92]	; 984 <USBFrameHandler+0x98>
     924:	e2833001 	add	r3, r3, #1	; 0x1
     928:	e1a0100c 	mov	r1, ip
     92c:	e3a02004 	mov	r2, #4	; 0x4
     930:	e3a00083 	mov	r0, #131	; 0x83
     934:	e58c3000 	str	r3, [ip]
     938:	eb00009b 	bl	bac <USBHwEPWrite>
     93c:	e3a00006 	mov	r0, #6	; 0x6
     940:	e1a01004 	mov	r1, r4
     944:	e3a02b01 	mov	r2, #1024	; 0x400
     948:	eb0000e1 	bl	cd4 <USBHwISOCEPRead>
     94c:	e3500000 	cmp	r0, #0	; 0x0
     950:	d8bd8010 	pople	{r4, pc}
     954:	e5d43000 	ldrb	r3, [r4]
     958:	e3530000 	cmp	r3, #0	; 0x0
     95c:	159f3024 	ldrne	r3, [pc, #36]	; 988 <USBFrameHandler+0x9c>
     960:	059f3020 	ldreq	r3, [pc, #32]	; 988 <USBFrameHandler+0x9c>
     964:	13a02b01 	movne	r2, #1024	; 0x400
     968:	03a02b01 	moveq	r2, #1024	; 0x400
     96c:	15832004 	strne	r2, [r3, #4]
     970:	0583200c 	streq	r2, [r3, #12]
     974:	e8bd8010 	pop	{r4, pc}
     978:	40000200 	.word	0x40000200
     97c:	40000208 	.word	0x40000208
     980:	400006a4 	.word	0x400006a4
     984:	400002a4 	.word	0x400002a4
     988:	e0028000 	.word	0xe0028000

0000098c <restoreIRQ>:
     98c:	e10f2000 	mrs	r2, CPSR
     990:	e2000080 	and	r0, r0, #128	; 0x80
     994:	e3c23080 	bic	r3, r2, #128	; 0x80
     998:	e1833000 	orr	r3, r3, r0
     99c:	e129f003 	msr	CPSR_fc, r3
     9a0:	e1a00002 	mov	r0, r2
     9a4:	e12fff1e 	bx	lr

000009a8 <restoreFIQ>:
     9a8:	e10f2000 	mrs	r2, CPSR
     9ac:	e2000040 	and	r0, r0, #64	; 0x40
     9b0:	e3c23040 	bic	r3, r2, #64	; 0x40
     9b4:	e1833000 	orr	r3, r3, r0
     9b8:	e129f003 	msr	CPSR_fc, r3
     9bc:	e1a00002 	mov	r0, r2
     9c0:	e12fff1e 	bx	lr

000009c4 <disableFIQ>:
     9c4:	e10f0000 	mrs	r0, CPSR
     9c8:	e3803040 	orr	r3, r0, #64	; 0x40
     9cc:	e129f003 	msr	CPSR_fc, r3
     9d0:	e12fff1e 	bx	lr

000009d4 <enableFIQ>:
     9d4:	e10f0000 	mrs	r0, CPSR
     9d8:	e3c03040 	bic	r3, r0, #64	; 0x40
     9dc:	e129f003 	msr	CPSR_fc, r3
     9e0:	e12fff1e 	bx	lr

000009e4 <disableIRQ>:
     9e4:	e10f0000 	mrs	r0, CPSR
     9e8:	e3803080 	orr	r3, r0, #128	; 0x80
     9ec:	e129f003 	msr	CPSR_fc, r3
     9f0:	e12fff1e 	bx	lr

000009f4 <enableIRQ>:
     9f4:	e10f0000 	mrs	r0, CPSR
     9f8:	e3c03080 	bic	r3, r0, #128	; 0x80
     9fc:	e129f003 	msr	CPSR_fc, r3
     a00:	e12fff1e 	bx	lr

00000a04 <USBHwCmd>:
     a04:	e1a00800 	lsl	r0, r0, #16
     a08:	e59f2028 	ldr	r2, [pc, #40]	; a38 <USBHwCmd+0x34>
     a0c:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
     a10:	e3800c05 	orr	r0, r0, #1280	; 0x500
     a14:	e3a03030 	mov	r3, #48	; 0x30
     a18:	e5023df7 	str	r3, [r2, #-3575]
     a1c:	e5020def 	str	r0, [r2, #-3567]
     a20:	e5123dff 	ldr	r3, [r2, #-3583]
     a24:	e2033010 	and	r3, r3, #16	; 0x10
     a28:	e3530010 	cmp	r3, #16	; 0x10
     a2c:	1afffffb 	bne	a20 <USBHwCmd+0x1c>
     a30:	e5023df7 	str	r3, [r2, #-3575]
     a34:	e12fff1e 	bx	lr
     a38:	ffe0cfff 	.word	0xffe0cfff

00000a3c <USBHwCmdWrite>:
     a3c:	e92d4010 	push	{r4, lr}
     a40:	e1a04801 	lsl	r4, r1, #16
     a44:	e20000ff 	and	r0, r0, #255	; 0xff
     a48:	e1a04824 	lsr	r4, r4, #16
     a4c:	ebffffec 	bl	a04 <USBHwCmd>
     a50:	e1a04804 	lsl	r4, r4, #16
     a54:	e59f3020 	ldr	r3, [pc, #32]	; a7c <USBHwCmdWrite+0x40>
     a58:	e3844c01 	orr	r4, r4, #256	; 0x100
     a5c:	e5034def 	str	r4, [r3, #-3567]
     a60:	e1a02003 	mov	r2, r3
     a64:	e5123dff 	ldr	r3, [r2, #-3583]
     a68:	e2033010 	and	r3, r3, #16	; 0x10
     a6c:	e3530010 	cmp	r3, #16	; 0x10
     a70:	1afffffb 	bne	a64 <USBHwCmdWrite+0x28>
     a74:	e5023df7 	str	r3, [r2, #-3575]
     a78:	e8bd8010 	pop	{r4, pc}
     a7c:	ffe0cfff 	.word	0xffe0cfff

00000a80 <USBHwCmdRead>:
     a80:	e92d4010 	push	{r4, lr}
     a84:	e20040ff 	and	r4, r0, #255	; 0xff
     a88:	e1a00004 	mov	r0, r4
     a8c:	ebffffdc 	bl	a04 <USBHwCmd>
     a90:	e1a04804 	lsl	r4, r4, #16
     a94:	e59f3028 	ldr	r3, [pc, #40]	; ac4 <USBHwCmdRead+0x44>
     a98:	e3844c02 	orr	r4, r4, #512	; 0x200
     a9c:	e5034def 	str	r4, [r3, #-3567]
     aa0:	e1a02003 	mov	r2, r3
     aa4:	e5123dff 	ldr	r3, [r2, #-3583]
     aa8:	e2033020 	and	r3, r3, #32	; 0x20
     aac:	e3530020 	cmp	r3, #32	; 0x20
     ab0:	1afffffb 	bne	aa4 <USBHwCmdRead+0x24>
     ab4:	e5023df7 	str	r3, [r2, #-3575]
     ab8:	e5120deb 	ldr	r0, [r2, #-3563]
     abc:	e20000ff 	and	r0, r0, #255	; 0xff
     ac0:	e8bd8010 	pop	{r4, pc}
     ac4:	ffe0cfff 	.word	0xffe0cfff

00000ac8 <USBHwEPConfig>:
     ac8:	e59fc04c 	ldr	ip, [pc, #76]	; b1c <USBHwEPConfig+0x54>
     acc:	e200300f 	and	r3, r0, #15	; 0xf
     ad0:	e51c2dbb 	ldr	r2, [ip, #-3515]
     ad4:	e1a03083 	lsl	r3, r3, #1
     ad8:	e2000080 	and	r0, r0, #128	; 0x80
     adc:	e18303a0 	orr	r0, r3, r0, lsr #7
     ae0:	e3a03001 	mov	r3, #1	; 0x1
     ae4:	e1822013 	orr	r2, r2, r3, lsl r0
     ae8:	e1a01801 	lsl	r1, r1, #16
     aec:	e1a01821 	lsr	r1, r1, #16
     af0:	e50c2dbb 	str	r2, [ip, #-3515]
     af4:	e50c0db7 	str	r0, [ip, #-3511]
     af8:	e50c1db3 	str	r1, [ip, #-3507]
     afc:	e51c3dff 	ldr	r3, [ip, #-3583]
     b00:	e2033c01 	and	r3, r3, #256	; 0x100
     b04:	e3530c01 	cmp	r3, #256	; 0x100
     b08:	1afffffb 	bne	afc <USBHwEPConfig+0x34>
     b0c:	e3800040 	orr	r0, r0, #64	; 0x40
     b10:	e3a01000 	mov	r1, #0	; 0x0
     b14:	e50c3df7 	str	r3, [ip, #-3575]
     b18:	eaffffc7 	b	a3c <USBHwCmdWrite>
     b1c:	ffe0cfff 	.word	0xffe0cfff

00000b20 <USBHwSetAddress>:
     b20:	e200107f 	and	r1, r0, #127	; 0x7f
     b24:	e3811080 	orr	r1, r1, #128	; 0x80
     b28:	e3a000d0 	mov	r0, #208	; 0xd0
     b2c:	eaffffc2 	b	a3c <USBHwCmdWrite>

00000b30 <USBHwConnect>:
     b30:	e3500000 	cmp	r0, #0	; 0x0
     b34:	159f3020 	ldrne	r3, [pc, #32]	; b5c <USBHwConnect+0x2c>
     b38:	059f301c 	ldreq	r3, [pc, #28]	; b5c <USBHwConnect+0x2c>
     b3c:	13a02c02 	movne	r2, #512	; 0x200
     b40:	03a02c02 	moveq	r2, #512	; 0x200
     b44:	15032fa3 	strne	r2, [r3, #-4003]
     b48:	05032fa7 	streq	r2, [r3, #-4007]
     b4c:	e2501000 	subs	r1, r0, #0	; 0x0
     b50:	13a01001 	movne	r1, #1	; 0x1
     b54:	e3a000fe 	mov	r0, #254	; 0xfe
     b58:	eaffffb7 	b	a3c <USBHwCmdWrite>
     b5c:	3fffcfff 	.word	0x3fffcfff

00000b60 <USBHwNakIntEnable>:
     b60:	e20010ff 	and	r1, r0, #255	; 0xff
     b64:	e3a000f3 	mov	r0, #243	; 0xf3
     b68:	eaffffb3 	b	a3c <USBHwCmdWrite>

00000b6c <USBHwEPGetStatus>:
     b6c:	e1a03000 	mov	r3, r0
     b70:	e200000f 	and	r0, r0, #15	; 0xf
     b74:	e2033080 	and	r3, r3, #128	; 0x80
     b78:	e1a00080 	lsl	r0, r0, #1
     b7c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     b80:	e18003a3 	orr	r0, r0, r3, lsr #7
     b84:	ebffffbd 	bl	a80 <USBHwCmdRead>
     b88:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00000b8c <USBHwEPStall>:
     b8c:	e200300f 	and	r3, r0, #15	; 0xf
     b90:	e1a03083 	lsl	r3, r3, #1
     b94:	e2000080 	and	r0, r0, #128	; 0x80
     b98:	e18333a0 	orr	r3, r3, r0, lsr #7
     b9c:	e2511000 	subs	r1, r1, #0	; 0x0
     ba0:	13a01001 	movne	r1, #1	; 0x1
     ba4:	e3830040 	orr	r0, r3, #64	; 0x40
     ba8:	eaffffa3 	b	a3c <USBHwCmdWrite>

00000bac <USBHwEPWrite>:
     bac:	e92d40f0 	push	{r4, r5, r6, r7, lr}
     bb0:	e59fc07c 	ldr	ip, [pc, #124]	; c34 <USBHwEPWrite+0x88>
     bb4:	e200500f 	and	r5, r0, #15	; 0xf
     bb8:	e1a03105 	lsl	r3, r5, #2
     bbc:	e3833002 	orr	r3, r3, #2	; 0x2
     bc0:	e1a06002 	mov	r6, r2
     bc4:	e1a0e001 	mov	lr, r1
     bc8:	e1a0400c 	mov	r4, ip
     bcc:	e20070ff 	and	r7, r0, #255	; 0xff
     bd0:	e50c3dd7 	str	r3, [ip, #-3543]
     bd4:	e50c2ddb 	str	r2, [ip, #-3547]
     bd8:	ea000008 	b	c00 <USBHwEPWrite+0x54>
     bdc:	e55e3002 	ldrb	r3, [lr, #-2]
     be0:	e55e2001 	ldrb	r2, [lr, #-1]
     be4:	e55e1004 	ldrb	r1, [lr, #-4]
     be8:	e1a03803 	lsl	r3, r3, #16
     bec:	e1833c02 	orr	r3, r3, r2, lsl #24
     bf0:	e55e2003 	ldrb	r2, [lr, #-3]
     bf4:	e1833001 	orr	r3, r3, r1
     bf8:	e1833402 	orr	r3, r3, r2, lsl #8
     bfc:	e5003de3 	str	r3, [r0, #-3555]
     c00:	e5143dd7 	ldr	r3, [r4, #-3543]
     c04:	e2133002 	ands	r3, r3, #2	; 0x2
     c08:	e28ee004 	add	lr, lr, #4	; 0x4
     c0c:	e1a00004 	mov	r0, r4
     c10:	1afffff1 	bne	bdc <USBHwEPWrite+0x30>
     c14:	e1a00085 	lsl	r0, r5, #1
     c18:	e18003a7 	orr	r0, r0, r7, lsr #7
     c1c:	e5043dd7 	str	r3, [r4, #-3543]
     c20:	ebffff77 	bl	a04 <USBHwCmd>
     c24:	e3a000fa 	mov	r0, #250	; 0xfa
     c28:	ebffff75 	bl	a04 <USBHwCmd>
     c2c:	e1a00006 	mov	r0, r6
     c30:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
     c34:	ffe0cfff 	.word	0xffe0cfff

00000c38 <USBHwEPRead>:
     c38:	e92d4030 	push	{r4, r5, lr}
     c3c:	e200e00f 	and	lr, r0, #15	; 0xf
     c40:	e59fc088 	ldr	ip, [pc, #136]	; cd0 <USBHwEPRead+0x98>
     c44:	e1a0310e 	lsl	r3, lr, #2
     c48:	e3833001 	orr	r3, r3, #1	; 0x1
     c4c:	e50c3dd7 	str	r3, [ip, #-3543]
     c50:	e20050ff 	and	r5, r0, #255	; 0xff
     c54:	e51c3ddf 	ldr	r3, [ip, #-3551]
     c58:	e3130b02 	tst	r3, #2048	; 0x800
     c5c:	0afffffc 	beq	c54 <USBHwEPRead+0x1c>
     c60:	e3130b01 	tst	r3, #1024	; 0x400
     c64:	03e04000 	mvneq	r4, #0	; 0x0
     c68:	0a000016 	beq	cc8 <USBHwEPRead+0x90>
     c6c:	e1a03b03 	lsl	r3, r3, #22
     c70:	e3a04000 	mov	r4, #0	; 0x0
     c74:	e59fc054 	ldr	ip, [pc, #84]	; cd0 <USBHwEPRead+0x98>
     c78:	e1a03b23 	lsr	r3, r3, #22
     c7c:	e1a00004 	mov	r0, r4
     c80:	ea000006 	b	ca0 <USBHwEPRead+0x68>
     c84:	e3140003 	tst	r4, #3	; 0x3
     c88:	051c0de7 	ldreq	r0, [ip, #-3559]
     c8c:	e3510000 	cmp	r1, #0	; 0x0
     c90:	11540002 	cmpne	r4, r2
     c94:	b7c40001 	strblt	r0, [r4, r1]
     c98:	e2844001 	add	r4, r4, #1	; 0x1
     c9c:	e1a00420 	lsr	r0, r0, #8
     ca0:	e1540003 	cmp	r4, r3
     ca4:	1afffff6 	bne	c84 <USBHwEPRead+0x4c>
     ca8:	e59f3020 	ldr	r3, [pc, #32]	; cd0 <USBHwEPRead+0x98>
     cac:	e1a0008e 	lsl	r0, lr, #1
     cb0:	e3a02000 	mov	r2, #0	; 0x0
     cb4:	e18003a5 	orr	r0, r0, r5, lsr #7
     cb8:	e5032dd7 	str	r2, [r3, #-3543]
     cbc:	ebffff50 	bl	a04 <USBHwCmd>
     cc0:	e3a000f2 	mov	r0, #242	; 0xf2
     cc4:	ebffff4e 	bl	a04 <USBHwCmd>
     cc8:	e1a00004 	mov	r0, r4
     ccc:	e8bd8030 	pop	{r4, r5, pc}
     cd0:	ffe0cfff 	.word	0xffe0cfff

00000cd4 <USBHwISOCEPRead>:
     cd4:	e92d4030 	push	{r4, r5, lr}
     cd8:	e200e00f 	and	lr, r0, #15	; 0xf
     cdc:	e1a0310e 	lsl	r3, lr, #2
     ce0:	e59fc08c 	ldr	ip, [pc, #140]	; d74 <USBHwISOCEPRead+0xa0>
     ce4:	e3833001 	orr	r3, r3, #1	; 0x1
     ce8:	e50c3dd7 	str	r3, [ip, #-3543]
     cec:	e20050ff 	and	r5, r0, #255	; 0xff
     cf0:	e1a00000 	nop			(mov r0,r0)
     cf4:	e51c3ddf 	ldr	r3, [ip, #-3551]
     cf8:	e2130b02 	ands	r0, r3, #2048	; 0x800
     cfc:	0a000001 	beq	d08 <USBHwISOCEPRead+0x34>
     d00:	e2130b01 	ands	r0, r3, #1024	; 0x400
     d04:	1a000002 	bne	d14 <USBHwISOCEPRead+0x40>
     d08:	e3e04000 	mvn	r4, #0	; 0x0
     d0c:	e50c0dd7 	str	r0, [ip, #-3543]
     d10:	ea000015 	b	d6c <USBHwISOCEPRead+0x98>
     d14:	e1a03b03 	lsl	r3, r3, #22
     d18:	e3a04000 	mov	r4, #0	; 0x0
     d1c:	e1a03b23 	lsr	r3, r3, #22
     d20:	e1a00004 	mov	r0, r4
     d24:	ea000006 	b	d44 <USBHwISOCEPRead+0x70>
     d28:	e3140003 	tst	r4, #3	; 0x3
     d2c:	051c0de7 	ldreq	r0, [ip, #-3559]
     d30:	e3510000 	cmp	r1, #0	; 0x0
     d34:	11540002 	cmpne	r4, r2
     d38:	b7c40001 	strblt	r0, [r4, r1]
     d3c:	e2844001 	add	r4, r4, #1	; 0x1
     d40:	e1a00420 	lsr	r0, r0, #8
     d44:	e1540003 	cmp	r4, r3
     d48:	1afffff6 	bne	d28 <USBHwISOCEPRead+0x54>
     d4c:	e59f3020 	ldr	r3, [pc, #32]	; d74 <USBHwISOCEPRead+0xa0>
     d50:	e1a0008e 	lsl	r0, lr, #1
     d54:	e3a02000 	mov	r2, #0	; 0x0
     d58:	e18003a5 	orr	r0, r0, r5, lsr #7
     d5c:	e5032dd7 	str	r2, [r3, #-3543]
     d60:	ebffff27 	bl	a04 <USBHwCmd>
     d64:	e3a000f2 	mov	r0, #242	; 0xf2
     d68:	ebffff25 	bl	a04 <USBHwCmd>
     d6c:	e1a00004 	mov	r0, r4
     d70:	e8bd8030 	pop	{r4, r5, pc}
     d74:	ffe0cfff 	.word	0xffe0cfff

00000d78 <USBHwConfigDevice>:
     d78:	e2501000 	subs	r1, r0, #0	; 0x0
     d7c:	13a01001 	movne	r1, #1	; 0x1
     d80:	e3a000d8 	mov	r0, #216	; 0xd8
     d84:	eaffff2c 	b	a3c <USBHwCmdWrite>

00000d88 <USBHwISR>:
     d88:	e59f3144 	ldr	r3, [pc, #324]	; ed4 <USBHwISR+0x14c>
     d8c:	e3a02002 	mov	r2, #2	; 0x2
     d90:	e5032fa7 	str	r2, [r3, #-4007]
     d94:	e59f213c 	ldr	r2, [pc, #316]	; ed8 <USBHwISR+0x150>
     d98:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
     d9c:	e5126dff 	ldr	r6, [r2, #-3583]
     da0:	e3160001 	tst	r6, #1	; 0x1
     da4:	0a00000b 	beq	dd8 <USBHwISR+0x50>
     da8:	e59f312c 	ldr	r3, [pc, #300]	; edc <USBHwISR+0x154>
     dac:	e5934000 	ldr	r4, [r3]
     db0:	e3a03001 	mov	r3, #1	; 0x1
     db4:	e3540000 	cmp	r4, #0	; 0x0
     db8:	e5023df7 	str	r3, [r2, #-3575]
     dbc:	0a000005 	beq	dd8 <USBHwISR+0x50>
     dc0:	e3a000f5 	mov	r0, #245	; 0xf5
     dc4:	ebffff2d 	bl	a80 <USBHwCmdRead>
     dc8:	e1a00800 	lsl	r0, r0, #16
     dcc:	e1a00820 	lsr	r0, r0, #16
     dd0:	e1a0e00f 	mov	lr, pc
     dd4:	e12fff14 	bx	r4
     dd8:	e3160008 	tst	r6, #8	; 0x8
     ddc:	0a000011 	beq	e28 <USBHwISR+0xa0>
     de0:	e59f30f0 	ldr	r3, [pc, #240]	; ed8 <USBHwISR+0x150>
     de4:	e3a02008 	mov	r2, #8	; 0x8
     de8:	e3a000fe 	mov	r0, #254	; 0xfe
     dec:	e5032df7 	str	r2, [r3, #-3575]
     df0:	ebffff22 	bl	a80 <USBHwCmdRead>
     df4:	e310001a 	tst	r0, #26	; 0x1a
     df8:	0a00000a 	beq	e28 <USBHwISR+0xa0>
     dfc:	e59f30dc 	ldr	r3, [pc, #220]	; ee0 <USBHwISR+0x158>
     e00:	e5933000 	ldr	r3, [r3]
     e04:	e3530000 	cmp	r3, #0	; 0x0
     e08:	0a000006 	beq	e28 <USBHwISR+0xa0>
     e0c:	e59f50c0 	ldr	r5, [pc, #192]	; ed4 <USBHwISR+0x14c>
     e10:	e3a04001 	mov	r4, #1	; 0x1
     e14:	e5054fa7 	str	r4, [r5, #-4007]
     e18:	e2000015 	and	r0, r0, #21	; 0x15
     e1c:	e1a0e00f 	mov	lr, pc
     e20:	e12fff13 	bx	r3
     e24:	e5054fa3 	str	r4, [r5, #-4003]
     e28:	e3160004 	tst	r6, #4	; 0x4
     e2c:	0a000024 	beq	ec4 <USBHwISR+0x13c>
     e30:	e59f30a0 	ldr	r3, [pc, #160]	; ed8 <USBHwISR+0x150>
     e34:	e3a02004 	mov	r2, #4	; 0x4
     e38:	e5032df7 	str	r2, [r3, #-3575]
     e3c:	e59fa0a0 	ldr	sl, [pc, #160]	; ee4 <USBHwISR+0x15c>
     e40:	e59f708c 	ldr	r7, [pc, #140]	; ed4 <USBHwISR+0x14c>
     e44:	e1a05003 	mov	r5, r3
     e48:	e1a06002 	mov	r6, r2
     e4c:	e3a04000 	mov	r4, #0	; 0x0
     e50:	e3a08001 	mov	r8, #1	; 0x1
     e54:	e1a02418 	lsl	r2, r8, r4
     e58:	e5153dcf 	ldr	r3, [r5, #-3535]
     e5c:	e1120003 	tst	r2, r3
     e60:	0a000014 	beq	eb8 <USBHwISR+0x130>
     e64:	e5052dc7 	str	r2, [r5, #-3527]
     e68:	e5153dff 	ldr	r3, [r5, #-3583]
     e6c:	e2032020 	and	r2, r3, #32	; 0x20
     e70:	e3520020 	cmp	r2, #32	; 0x20
     e74:	1afffffb 	bne	e68 <USBHwISR+0xe0>
     e78:	e0843fa4 	add	r3, r4, r4, lsr #31
     e7c:	e1a030c3 	asr	r3, r3, #1
     e80:	e79a3103 	ldr	r3, [sl, r3, lsl #2]
     e84:	e5052df7 	str	r2, [r5, #-3575]
     e88:	e3530000 	cmp	r3, #0	; 0x0
     e8c:	e5151deb 	ldr	r1, [r5, #-3563]
     e90:	0a000008 	beq	eb8 <USBHwISR+0x130>
     e94:	e1a000c4 	asr	r0, r4, #1
     e98:	e200000f 	and	r0, r0, #15	; 0xf
     e9c:	e1800384 	orr	r0, r0, r4, lsl #7
     ea0:	e5076fa7 	str	r6, [r7, #-4007]
     ea4:	e200008f 	and	r0, r0, #143	; 0x8f
     ea8:	e201101f 	and	r1, r1, #31	; 0x1f
     eac:	e1a0e00f 	mov	lr, pc
     eb0:	e12fff13 	bx	r3
     eb4:	e5076fa3 	str	r6, [r7, #-4003]
     eb8:	e2844001 	add	r4, r4, #1	; 0x1
     ebc:	e3540020 	cmp	r4, #32	; 0x20
     ec0:	1affffe3 	bne	e54 <USBHwISR+0xcc>
     ec4:	e59f3008 	ldr	r3, [pc, #8]	; ed4 <USBHwISR+0x14c>
     ec8:	e3a02002 	mov	r2, #2	; 0x2
     ecc:	e5032fa3 	str	r2, [r3, #-4003]
     ed0:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
     ed4:	3fffcfff 	.word	0x3fffcfff
     ed8:	ffe0cfff 	.word	0xffe0cfff
     edc:	40000214 	.word	0x40000214
     ee0:	40000218 	.word	0x40000218
     ee4:	4000021c 	.word	0x4000021c

00000ee8 <USBHwInit>:
     ee8:	e59f2120 	ldr	r2, [pc, #288]	; 1010 <USBHwInit+0x128>
     eec:	e5923004 	ldr	r3, [r2, #4]
     ef0:	e3c3330f 	bic	r3, r3, #1006632960	; 0x3c000000
     ef4:	e3833305 	orr	r3, r3, #335544320	; 0x14000000
     ef8:	e5823004 	str	r3, [r2, #4]
     efc:	e592300c 	ldr	r3, [r2, #12]
     f00:	e3c33203 	bic	r3, r3, #805306368	; 0x30000000
     f04:	e3c33030 	bic	r3, r3, #48	; 0x30
     f08:	e3833202 	orr	r3, r3, #536870912	; 0x20000000
     f0c:	e3833010 	orr	r3, r3, #16	; 0x10
     f10:	e582300c 	str	r3, [r2, #12]
     f14:	e5923010 	ldr	r3, [r2, #16]
     f18:	e3c33703 	bic	r3, r3, #786432	; 0xc0000
     f1c:	e5823010 	str	r3, [r2, #16]
     f20:	e59f20ec 	ldr	r2, [pc, #236]	; 1014 <USBHwInit+0x12c>
     f24:	e5123fbf 	ldr	r3, [r2, #-4031]
     f28:	e3833c02 	orr	r3, r3, #512	; 0x200
     f2c:	e5023fbf 	str	r3, [r2, #-4031]
     f30:	e3a03c02 	mov	r3, #512	; 0x200
     f34:	e5023fa7 	str	r3, [r2, #-4007]
     f38:	e59f20d8 	ldr	r2, [pc, #216]	; 1018 <USBHwInit+0x130>
     f3c:	e59230c4 	ldr	r3, [r2, #196]
     f40:	e92d4010 	push	{r4, lr}
     f44:	e3833102 	orr	r3, r3, #-2147483648	; 0x80000000
     f48:	e58230c4 	str	r3, [r2, #196]
     f4c:	e59f10c8 	ldr	r1, [pc, #200]	; 101c <USBHwInit+0x134>
     f50:	e3a03005 	mov	r3, #5	; 0x5
     f54:	e5823108 	str	r3, [r2, #264]
     f58:	e283300d 	add	r3, r3, #13	; 0xd
     f5c:	e501300b 	str	r3, [r1, #-11]
     f60:	e5113007 	ldr	r3, [r1, #-7]
     f64:	e3130012 	tst	r3, #18	; 0x12
     f68:	0afffffc 	beq	f60 <USBHwInit+0x78>
     f6c:	e3a04000 	mov	r4, #0	; 0x0
     f70:	e3e03000 	mvn	r3, #0	; 0x0
     f74:	e5014dfb 	str	r4, [r1, #-3579]
     f78:	e1a00004 	mov	r0, r4
     f7c:	e5013df7 	str	r3, [r1, #-3575]
     f80:	e5014dd3 	str	r4, [r1, #-3539]
     f84:	e5014dcb 	str	r4, [r1, #-3531]
     f88:	e5013dc7 	str	r3, [r1, #-3527]
     f8c:	e5014dbf 	str	r4, [r1, #-3519]
     f90:	ebfffef2 	bl	b60 <USBHwNakIntEnable>
     f94:	e59f107c 	ldr	r1, [pc, #124]	; 1018 <USBHwInit+0x130>
     f98:	e59131a0 	ldr	r3, [r1, #416]
     f9c:	e59fc06c 	ldr	ip, [pc, #108]	; 1010 <USBHwInit+0x128>
     fa0:	e3833001 	orr	r3, r3, #1	; 0x1
     fa4:	e58131a0 	str	r3, [r1, #416]
     fa8:	e59f2064 	ldr	r2, [pc, #100]	; 1014 <USBHwInit+0x12c>
     fac:	e58c4028 	str	r4, [ip, #40]
     fb0:	e5123fbf 	ldr	r3, [r2, #-4031]
     fb4:	e3a00001 	mov	r0, #1	; 0x1
     fb8:	e3833001 	orr	r3, r3, #1	; 0x1
     fbc:	e5023fbf 	str	r3, [r2, #-4031]
     fc0:	e5020fa3 	str	r0, [r2, #-4003]
     fc4:	e59131a0 	ldr	r3, [r1, #416]
     fc8:	e1833000 	orr	r3, r3, r0
     fcc:	e58131a0 	str	r3, [r1, #416]
     fd0:	e58c4028 	str	r4, [ip, #40]
     fd4:	e5123fbf 	ldr	r3, [r2, #-4031]
     fd8:	e3833002 	orr	r3, r3, #2	; 0x2
     fdc:	e5023fbf 	str	r3, [r2, #-4031]
     fe0:	e3a03002 	mov	r3, #2	; 0x2
     fe4:	e5023fa3 	str	r3, [r2, #-4003]
     fe8:	e59131a0 	ldr	r3, [r1, #416]
     fec:	e1833000 	orr	r3, r3, r0
     ff0:	e58131a0 	str	r3, [r1, #416]
     ff4:	e58c4028 	str	r4, [ip, #40]
     ff8:	e5123fbf 	ldr	r3, [r2, #-4031]
     ffc:	e3833004 	orr	r3, r3, #4	; 0x4
    1000:	e5023fbf 	str	r3, [r2, #-4031]
    1004:	e3a03004 	mov	r3, #4	; 0x4
    1008:	e5023fa3 	str	r3, [r2, #-4003]
    100c:	e8bd8010 	pop	{r4, pc}
    1010:	e002c000 	.word	0xe002c000
    1014:	3fffcfff 	.word	0x3fffcfff
    1018:	e01fc000 	.word	0xe01fc000
    101c:	ffe0cfff 	.word	0xffe0cfff

00001020 <USBSetupDMADescriptor>:
    1020:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1024:	e3a0e000 	mov	lr, #0	; 0x0
    1028:	e580e004 	str	lr, [r0, #4]
    102c:	e5801000 	str	r1, [r0]
    1030:	e1a0c001 	mov	ip, r1
    1034:	e1a03b03 	lsl	r3, r3, #22
    1038:	e5901004 	ldr	r1, [r0, #4]
    103c:	e1a03b23 	lsr	r3, r3, #22
    1040:	e1811283 	orr	r1, r1, r3, lsl #5
    1044:	e5801004 	str	r1, [r0, #4]
    1048:	e1dd10b4 	ldrh	r1, [sp, #4]
    104c:	e5903004 	ldr	r3, [r0, #4]
    1050:	e1833801 	orr	r3, r3, r1, lsl #16
    1054:	e5803004 	str	r3, [r0, #4]
    1058:	e21220ff 	ands	r2, r2, #255	; 0xff
    105c:	15903004 	ldrne	r3, [r0, #4]
    1060:	13833010 	orrne	r3, r3, #16	; 0x10
    1064:	15803004 	strne	r3, [r0, #4]
    1068:	e35c0000 	cmp	ip, #0	; 0x0
    106c:	15903004 	ldrne	r3, [r0, #4]
    1070:	e59d100c 	ldr	r1, [sp, #12]
    1074:	13833004 	orrne	r3, r3, #4	; 0x4
    1078:	15803004 	strne	r3, [r0, #4]
    107c:	e59d3008 	ldr	r3, [sp, #8]
    1080:	e3520000 	cmp	r2, #0	; 0x0
    1084:	13510000 	cmpne	r1, #0	; 0x0
    1088:	e5803008 	str	r3, [r0, #8]
    108c:	15801010 	strne	r1, [r0, #16]
    1090:	e580e00c 	str	lr, [r0, #12]
    1094:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00001098 <USBDisableDMAForEndpoint>:
    1098:	e200200f 	and	r2, r0, #15	; 0xf
    109c:	e1a02082 	lsl	r2, r2, #1
    10a0:	e2000080 	and	r0, r0, #128	; 0x80
    10a4:	e18223a0 	orr	r2, r2, r0, lsr #7
    10a8:	e3a03001 	mov	r3, #1	; 0x1
    10ac:	e1a03213 	lsl	r3, r3, r2
    10b0:	e59f2004 	ldr	r2, [pc, #4]	; 10bc <USBDisableDMAForEndpoint+0x24>
    10b4:	e5023d73 	str	r3, [r2, #-3443]
    10b8:	e12fff1e 	bx	lr
    10bc:	ffe0cfff 	.word	0xffe0cfff

000010c0 <USBEnableDMAForEndpoint>:
    10c0:	e200200f 	and	r2, r0, #15	; 0xf
    10c4:	e1a02082 	lsl	r2, r2, #1
    10c8:	e2000080 	and	r0, r0, #128	; 0x80
    10cc:	e18223a0 	orr	r2, r2, r0, lsr #7
    10d0:	e3a03001 	mov	r3, #1	; 0x1
    10d4:	e1a03213 	lsl	r3, r3, r2
    10d8:	e59f2004 	ldr	r2, [pc, #4]	; 10e4 <USBEnableDMAForEndpoint+0x24>
    10dc:	e5023d77 	str	r3, [r2, #-3447]
    10e0:	e12fff1e 	bx	lr
    10e4:	ffe0cfff 	.word	0xffe0cfff

000010e8 <USBInitializeISOCFrameArray>:
    10e8:	e92d4030 	push	{r4, r5, lr}
    10ec:	e1a03b03 	lsl	r3, r3, #22
    10f0:	e1a02802 	lsl	r2, r2, #16
    10f4:	e1a03b23 	lsr	r3, r3, #22
    10f8:	e1a05000 	mov	r5, r0
    10fc:	e1a04001 	mov	r4, r1
    1100:	e1a0c822 	lsr	ip, r2, #16
    1104:	e3830902 	orr	r0, r3, #32768	; 0x8000
    1108:	e3a0e000 	mov	lr, #0	; 0x0
    110c:	ea000000 	b	1114 <USBInitializeISOCFrameArray+0x2c>
    1110:	e7851102 	str	r1, [r5, r2, lsl #2]
    1114:	e1a0280e 	lsl	r2, lr, #16
    1118:	e28c3001 	add	r3, ip, #1	; 0x1
    111c:	e1a02822 	lsr	r2, r2, #16
    1120:	e1a03803 	lsl	r3, r3, #16
    1124:	e1520004 	cmp	r2, r4
    1128:	e180180c 	orr	r1, r0, ip, lsl #16
    112c:	e28ee001 	add	lr, lr, #1	; 0x1
    1130:	e1a0c823 	lsr	ip, r3, #16
    1134:	3afffff5 	bcc	1110 <USBInitializeISOCFrameArray+0x28>
    1138:	e8bd8030 	pop	{r4, r5, pc}

0000113c <USBSetHeadDDForDMA>:
    113c:	e200300f 	and	r3, r0, #15	; 0xf
    1140:	e1a03083 	lsl	r3, r3, #1
    1144:	e2000080 	and	r0, r0, #128	; 0x80
    1148:	e18333a0 	orr	r3, r3, r0, lsr #7
    114c:	e7812103 	str	r2, [r1, r3, lsl #2]
    1150:	e12fff1e 	bx	lr

00001154 <USBInitializeUSBDMA>:
    1154:	e3a03000 	mov	r3, #0	; 0x0
    1158:	e1a02003 	mov	r2, r3
    115c:	e7832000 	str	r2, [r3, r0]
    1160:	e2833004 	add	r3, r3, #4	; 0x4
    1164:	e3530080 	cmp	r3, #128	; 0x80
    1168:	1afffffb 	bne	115c <USBInitializeUSBDMA+0x8>
    116c:	e59f3004 	ldr	r3, [pc, #4]	; 1178 <USBInitializeUSBDMA+0x24>
    1170:	e5030d7f 	str	r0, [r3, #-3455]
    1174:	e12fff1e 	bx	lr
    1178:	ffe0cfff 	.word	0xffe0cfff

0000117c <USBHwRegisterFrameHandler>:
    117c:	e59f1018 	ldr	r1, [pc, #24]	; 119c <USBHwRegisterFrameHandler+0x20>
    1180:	e59f3018 	ldr	r3, [pc, #24]	; 11a0 <USBHwRegisterFrameHandler+0x24>
    1184:	e5112dfb 	ldr	r2, [r1, #-3579]
    1188:	e5830000 	str	r0, [r3]
    118c:	e59f0010 	ldr	r0, [pc, #16]	; 11a4 <USBHwRegisterFrameHandler+0x28>
    1190:	e3822001 	orr	r2, r2, #1	; 0x1
    1194:	e5012dfb 	str	r2, [r1, #-3579]
    1198:	eafffd62 	b	728 <puts>
    119c:	ffe0cfff 	.word	0xffe0cfff
    11a0:	40000214 	.word	0x40000214
    11a4:	00001d70 	.word	0x00001d70

000011a8 <USBHwRegisterDevIntHandler>:
    11a8:	e59f1018 	ldr	r1, [pc, #24]	; 11c8 <USBHwRegisterDevIntHandler+0x20>
    11ac:	e59f3018 	ldr	r3, [pc, #24]	; 11cc <USBHwRegisterDevIntHandler+0x24>
    11b0:	e5112dfb 	ldr	r2, [r1, #-3579]
    11b4:	e5830000 	str	r0, [r3]
    11b8:	e59f0010 	ldr	r0, [pc, #16]	; 11d0 <USBHwRegisterDevIntHandler+0x28>
    11bc:	e3822008 	orr	r2, r2, #8	; 0x8
    11c0:	e5012dfb 	str	r2, [r1, #-3579]
    11c4:	eafffd57 	b	728 <puts>
    11c8:	ffe0cfff 	.word	0xffe0cfff
    11cc:	40000218 	.word	0x40000218
    11d0:	00001d90 	.word	0x00001d90

000011d4 <USBHwRegisterEPIntHandler>:
    11d4:	e92d4010 	push	{r4, lr}
    11d8:	e200300f 	and	r3, r0, #15	; 0xf
    11dc:	e1a03083 	lsl	r3, r3, #1
    11e0:	e2002080 	and	r2, r0, #128	; 0x80
    11e4:	e183e3a2 	orr	lr, r3, r2, lsr #7
    11e8:	e35e001f 	cmp	lr, #31	; 0x1f
    11ec:	e1a04001 	mov	r4, r1
    11f0:	e24dd004 	sub	sp, sp, #4	; 0x4
    11f4:	e20010ff 	and	r1, r0, #255	; 0xff
    11f8:	da000007 	ble	121c <USBHwRegisterEPIntHandler+0x48>
    11fc:	e3a0c0d2 	mov	ip, #210	; 0xd2
    1200:	e59f0050 	ldr	r0, [pc, #80]	; 1258 <USBHwRegisterEPIntHandler+0x84>
    1204:	e59f1050 	ldr	r1, [pc, #80]	; 125c <USBHwRegisterEPIntHandler+0x88>
    1208:	e59f2050 	ldr	r2, [pc, #80]	; 1260 <USBHwRegisterEPIntHandler+0x8c>
    120c:	e59f3050 	ldr	r3, [pc, #80]	; 1264 <USBHwRegisterEPIntHandler+0x90>
    1210:	e58dc000 	str	ip, [sp]
    1214:	ebfffd0d 	bl	650 <printf>
    1218:	eafffffe 	b	1218 <USBHwRegisterEPIntHandler+0x44>
    121c:	e59fc044 	ldr	ip, [pc, #68]	; 1268 <USBHwRegisterEPIntHandler+0x94>
    1220:	e51c3dcb 	ldr	r3, [ip, #-3531]
    1224:	e3a02001 	mov	r2, #1	; 0x1
    1228:	e1833e12 	orr	r3, r3, r2, lsl lr
    122c:	e50c3dcb 	str	r3, [ip, #-3531]
    1230:	e51c2dfb 	ldr	r2, [ip, #-3579]
    1234:	e59f3030 	ldr	r3, [pc, #48]	; 126c <USBHwRegisterEPIntHandler+0x98>
    1238:	e59f0030 	ldr	r0, [pc, #48]	; 1270 <USBHwRegisterEPIntHandler+0x9c>
    123c:	e3822004 	orr	r2, r2, #4	; 0x4
    1240:	e1a0e0ae 	lsr	lr, lr, #1
    1244:	e783410e 	str	r4, [r3, lr, lsl #2]
    1248:	e50c2dfb 	str	r2, [ip, #-3579]
    124c:	e28dd004 	add	sp, sp, #4	; 0x4
    1250:	e8bd4010 	pop	{r4, lr}
    1254:	eafffcfd 	b	650 <printf>
    1258:	00001db8 	.word	0x00001db8
    125c:	00001de0 	.word	0x00001de0
    1260:	00001de8 	.word	0x00001de8
    1264:	00001cb8 	.word	0x00001cb8
    1268:	ffe0cfff 	.word	0xffe0cfff
    126c:	4000021c 	.word	0x4000021c
    1270:	00001df4 	.word	0x00001df4

00001274 <USBRegisterRequestHandler>:
    1274:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1278:	e3500000 	cmp	r0, #0	; 0x0
    127c:	e24dd004 	sub	sp, sp, #4	; 0x4
    1280:	aa000007 	bge	12a4 <USBRegisterRequestHandler+0x30>
    1284:	e3a0c0e2 	mov	ip, #226	; 0xe2
    1288:	e59f0054 	ldr	r0, [pc, #84]	; 12e4 <USBRegisterRequestHandler+0x70>
    128c:	e59f1054 	ldr	r1, [pc, #84]	; 12e8 <USBRegisterRequestHandler+0x74>
    1290:	e59f2054 	ldr	r2, [pc, #84]	; 12ec <USBRegisterRequestHandler+0x78>
    1294:	e59f3054 	ldr	r3, [pc, #84]	; 12f0 <USBRegisterRequestHandler+0x7c>
    1298:	e58dc000 	str	ip, [sp]
    129c:	ebfffceb 	bl	650 <printf>
    12a0:	eafffffe 	b	12a0 <USBRegisterRequestHandler+0x2c>
    12a4:	e3500003 	cmp	r0, #3	; 0x3
    12a8:	da000007 	ble	12cc <USBRegisterRequestHandler+0x58>
    12ac:	e3a0c0e3 	mov	ip, #227	; 0xe3
    12b0:	e59f002c 	ldr	r0, [pc, #44]	; 12e4 <USBRegisterRequestHandler+0x70>
    12b4:	e59f1038 	ldr	r1, [pc, #56]	; 12f4 <USBRegisterRequestHandler+0x80>
    12b8:	e59f202c 	ldr	r2, [pc, #44]	; 12ec <USBRegisterRequestHandler+0x78>
    12bc:	e59f302c 	ldr	r3, [pc, #44]	; 12f0 <USBRegisterRequestHandler+0x7c>
    12c0:	e58dc000 	str	ip, [sp]
    12c4:	ebfffce1 	bl	650 <printf>
    12c8:	eafffffe 	b	12c8 <USBRegisterRequestHandler+0x54>
    12cc:	e59f3024 	ldr	r3, [pc, #36]	; 12f8 <USBRegisterRequestHandler+0x84>
    12d0:	e7832100 	str	r2, [r3, r0, lsl #2]
    12d4:	e59f3020 	ldr	r3, [pc, #32]	; 12fc <USBRegisterRequestHandler+0x88>
    12d8:	e7831100 	str	r1, [r3, r0, lsl #2]
    12dc:	e28dd004 	add	sp, sp, #4	; 0x4
    12e0:	e8bd8000 	pop	{pc}
    12e4:	00001db8 	.word	0x00001db8
    12e8:	00001e14 	.word	0x00001e14
    12ec:	00001e20 	.word	0x00001e20
    12f0:	00001cd4 	.word	0x00001cd4
    12f4:	00001e30 	.word	0x00001e30
    12f8:	4000026c 	.word	0x4000026c
    12fc:	4000025c 	.word	0x4000025c

00001300 <_HandleRequest>:
    1300:	e92d4010 	push	{r4, lr}
    1304:	e5d03000 	ldrb	r3, [r0]
    1308:	e1a032a3 	lsr	r3, r3, #5
    130c:	e203c003 	and	ip, r3, #3	; 0x3
    1310:	e59f3028 	ldr	r3, [pc, #40]	; 1340 <_HandleRequest+0x40>
    1314:	e793410c 	ldr	r4, [r3, ip, lsl #2]
    1318:	e3540000 	cmp	r4, #0	; 0x0
    131c:	1a000004 	bne	1334 <_HandleRequest+0x34>
    1320:	e1a0100c 	mov	r1, ip
    1324:	e59f0018 	ldr	r0, [pc, #24]	; 1344 <_HandleRequest+0x44>
    1328:	ebfffcc8 	bl	650 <printf>
    132c:	e1a00004 	mov	r0, r4
    1330:	e8bd8010 	pop	{r4, pc}
    1334:	e1a0e00f 	mov	lr, pc
    1338:	e12fff14 	bx	r4
    133c:	e8bd8010 	pop	{r4, pc}
    1340:	4000025c 	.word	0x4000025c
    1344:	00001e3c 	.word	0x00001e3c

00001348 <StallControlPipe>:
    1348:	e92d4070 	push	{r4, r5, r6, lr}
    134c:	e1a03000 	mov	r3, r0
    1350:	e3a01001 	mov	r1, #1	; 0x1
    1354:	e3a00080 	mov	r0, #128	; 0x80
    1358:	e20350ff 	and	r5, r3, #255	; 0xff
    135c:	ebfffe0a 	bl	b8c <USBHwEPStall>
    1360:	e59f0030 	ldr	r0, [pc, #48]	; 1398 <StallControlPipe+0x50>
    1364:	ebfffcb9 	bl	650 <printf>
    1368:	e59f602c 	ldr	r6, [pc, #44]	; 139c <StallControlPipe+0x54>
    136c:	e3a04000 	mov	r4, #0	; 0x0
    1370:	e7d41006 	ldrb	r1, [r4, r6]
    1374:	e59f0024 	ldr	r0, [pc, #36]	; 13a0 <StallControlPipe+0x58>
    1378:	e2844001 	add	r4, r4, #1	; 0x1
    137c:	ebfffcb3 	bl	650 <printf>
    1380:	e3540008 	cmp	r4, #8	; 0x8
    1384:	1afffff9 	bne	1370 <StallControlPipe+0x28>
    1388:	e59f0014 	ldr	r0, [pc, #20]	; 13a4 <StallControlPipe+0x5c>
    138c:	e1a01005 	mov	r1, r5
    1390:	e8bd4070 	pop	{r4, r5, r6, lr}
    1394:	eafffcad 	b	650 <printf>
    1398:	00001e58 	.word	0x00001e58
    139c:	4000027c 	.word	0x4000027c
    13a0:	00001e64 	.word	0x00001e64
    13a4:	00001e6c 	.word	0x00001e6c

000013a8 <DataIn>:
    13a8:	e92d4070 	push	{r4, r5, r6, lr}
    13ac:	e59f6038 	ldr	r6, [pc, #56]	; 13ec <DataIn+0x44>
    13b0:	e5964000 	ldr	r4, [r6]
    13b4:	e59f5034 	ldr	r5, [pc, #52]	; 13f0 <DataIn+0x48>
    13b8:	e3540040 	cmp	r4, #64	; 0x40
    13bc:	a3a04040 	movge	r4, #64	; 0x40
    13c0:	e1a02004 	mov	r2, r4
    13c4:	e3a00080 	mov	r0, #128	; 0x80
    13c8:	e5951000 	ldr	r1, [r5]
    13cc:	ebfffdf6 	bl	bac <USBHwEPWrite>
    13d0:	e5953000 	ldr	r3, [r5]
    13d4:	e5962000 	ldr	r2, [r6]
    13d8:	e0833004 	add	r3, r3, r4
    13dc:	e0642002 	rsb	r2, r4, r2
    13e0:	e5853000 	str	r3, [r5]
    13e4:	e5862000 	str	r2, [r6]
    13e8:	e8bd8070 	pop	{r4, r5, r6, pc}
    13ec:	40000288 	.word	0x40000288
    13f0:	40000284 	.word	0x40000284

000013f4 <USBHandleControlTransfer>:
    13f4:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    13f8:	e21000ff 	ands	r0, r0, #255	; 0xff
    13fc:	e24dd004 	sub	sp, sp, #4	; 0x4
    1400:	e20170ff 	and	r7, r1, #255	; 0xff
    1404:	1a000051 	bne	1550 <USBHandleControlTransfer+0x15c>
    1408:	e3110004 	tst	r1, #4	; 0x4
    140c:	e59f6178 	ldr	r6, [pc, #376]	; 158c <USBHandleControlTransfer+0x198>
    1410:	0a000021 	beq	149c <USBHandleControlTransfer+0xa8>
    1414:	e59f5174 	ldr	r5, [pc, #372]	; 1590 <USBHandleControlTransfer+0x19c>
    1418:	e3a02008 	mov	r2, #8	; 0x8
    141c:	e1a01005 	mov	r1, r5
    1420:	ebfffe04 	bl	c38 <USBHwEPRead>
    1424:	e5d51001 	ldrb	r1, [r5, #1]
    1428:	e59f0164 	ldr	r0, [pc, #356]	; 1594 <USBHandleControlTransfer+0x1a0>
    142c:	ebfffc87 	bl	650 <printf>
    1430:	e5d50000 	ldrb	r0, [r5]
    1434:	e59f215c 	ldr	r2, [pc, #348]	; 1598 <USBHandleControlTransfer+0x1a4>
    1438:	e1a032a0 	lsr	r3, r0, #5
    143c:	e1d510b6 	ldrh	r1, [r5, #6]
    1440:	e2033003 	and	r3, r3, #3	; 0x3
    1444:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    1448:	e59f414c 	ldr	r4, [pc, #332]	; 159c <USBHandleControlTransfer+0x1a8>
    144c:	e59f214c 	ldr	r2, [pc, #332]	; 15a0 <USBHandleControlTransfer+0x1ac>
    1450:	e3510000 	cmp	r1, #0	; 0x0
    1454:	e5823000 	str	r3, [r2]
    1458:	e5861000 	str	r1, [r6]
    145c:	e5841000 	str	r1, [r4]
    1460:	0a000001 	beq	146c <USBHandleControlTransfer+0x78>
    1464:	e1b003a0 	lsrs	r0, r0, #7
    1468:	0a000045 	beq	1584 <USBHandleControlTransfer+0x190>
    146c:	e1a00005 	mov	r0, r5
    1470:	e1a01004 	mov	r1, r4
    1474:	ebffffa1 	bl	1300 <_HandleRequest>
    1478:	e3500000 	cmp	r0, #0	; 0x0
    147c:	059f0120 	ldreq	r0, [pc, #288]	; 15a4 <USBHandleControlTransfer+0x1b0>
    1480:	0a000022 	beq	1510 <USBHandleControlTransfer+0x11c>
    1484:	e1d520b6 	ldrh	r2, [r5, #6]
    1488:	e5943000 	ldr	r3, [r4]
    148c:	e1520003 	cmp	r2, r3
    1490:	d5862000 	strle	r2, [r6]
    1494:	c5863000 	strgt	r3, [r6]
    1498:	ea00002e 	b	1558 <USBHandleControlTransfer+0x164>
    149c:	e5962000 	ldr	r2, [r6]
    14a0:	e3520000 	cmp	r2, #0	; 0x0
    14a4:	da00001e 	ble	1524 <USBHandleControlTransfer+0x130>
    14a8:	e59f40f0 	ldr	r4, [pc, #240]	; 15a0 <USBHandleControlTransfer+0x1ac>
    14ac:	e5941000 	ldr	r1, [r4]
    14b0:	ebfffde0 	bl	c38 <USBHwEPRead>
    14b4:	e3500000 	cmp	r0, #0	; 0x0
    14b8:	ba000015 	blt	1514 <USBHandleControlTransfer+0x120>
    14bc:	e5962000 	ldr	r2, [r6]
    14c0:	e5943000 	ldr	r3, [r4]
    14c4:	e0602002 	rsb	r2, r0, r2
    14c8:	e0833000 	add	r3, r3, r0
    14cc:	e3520000 	cmp	r2, #0	; 0x0
    14d0:	e5843000 	str	r3, [r4]
    14d4:	e5862000 	str	r2, [r6]
    14d8:	1a000029 	bne	1584 <USBHandleControlTransfer+0x190>
    14dc:	e59f00ac 	ldr	r0, [pc, #172]	; 1590 <USBHandleControlTransfer+0x19c>
    14e0:	e5d03000 	ldrb	r3, [r0]
    14e4:	e59f20ac 	ldr	r2, [pc, #172]	; 1598 <USBHandleControlTransfer+0x1a4>
    14e8:	e1a032a3 	lsr	r3, r3, #5
    14ec:	e2033003 	and	r3, r3, #3	; 0x3
    14f0:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    14f4:	e59f10a0 	ldr	r1, [pc, #160]	; 159c <USBHandleControlTransfer+0x1a8>
    14f8:	e1a02004 	mov	r2, r4
    14fc:	e5843000 	str	r3, [r4]
    1500:	ebffff7e 	bl	1300 <_HandleRequest>
    1504:	e3500000 	cmp	r0, #0	; 0x0
    1508:	1a000012 	bne	1558 <USBHandleControlTransfer+0x164>
    150c:	e59f0094 	ldr	r0, [pc, #148]	; 15a8 <USBHandleControlTransfer+0x1b4>
    1510:	ebfffc84 	bl	728 <puts>
    1514:	e1a00007 	mov	r0, r7
    1518:	e28dd004 	add	sp, sp, #4	; 0x4
    151c:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    1520:	eaffff88 	b	1348 <StallControlPipe>
    1524:	e1a01000 	mov	r1, r0
    1528:	e1a02000 	mov	r2, r0
    152c:	ebfffdc1 	bl	c38 <USBHwEPRead>
    1530:	e59f2074 	ldr	r2, [pc, #116]	; 15ac <USBHandleControlTransfer+0x1b8>
    1534:	e59f3074 	ldr	r3, [pc, #116]	; 15b0 <USBHandleControlTransfer+0x1bc>
    1538:	e3500000 	cmp	r0, #0	; 0x0
    153c:	d1a00002 	movle	r0, r2
    1540:	c1a00003 	movgt	r0, r3
    1544:	e28dd004 	add	sp, sp, #4	; 0x4
    1548:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    154c:	eafffc3f 	b	650 <printf>
    1550:	e3500080 	cmp	r0, #128	; 0x80
    1554:	1a000002 	bne	1564 <USBHandleControlTransfer+0x170>
    1558:	e28dd004 	add	sp, sp, #4	; 0x4
    155c:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    1560:	eaffff90 	b	13a8 <DataIn>
    1564:	e3a0c0d4 	mov	ip, #212	; 0xd4
    1568:	e59f0044 	ldr	r0, [pc, #68]	; 15b4 <USBHandleControlTransfer+0x1c0>
    156c:	e59f1044 	ldr	r1, [pc, #68]	; 15b8 <USBHandleControlTransfer+0x1c4>
    1570:	e59f2044 	ldr	r2, [pc, #68]	; 15bc <USBHandleControlTransfer+0x1c8>
    1574:	e59f3044 	ldr	r3, [pc, #68]	; 15c0 <USBHandleControlTransfer+0x1cc>
    1578:	e58dc000 	str	ip, [sp]
    157c:	ebfffc33 	bl	650 <printf>
    1580:	eafffffe 	b	1580 <USBHandleControlTransfer+0x18c>
    1584:	e28dd004 	add	sp, sp, #4	; 0x4
    1588:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    158c:	40000288 	.word	0x40000288
    1590:	4000027c 	.word	0x4000027c
    1594:	00001e78 	.word	0x00001e78
    1598:	4000026c 	.word	0x4000026c
    159c:	4000028c 	.word	0x4000028c
    15a0:	40000284 	.word	0x40000284
    15a4:	00001e7c 	.word	0x00001e7c
    15a8:	00001e94 	.word	0x00001e94
    15ac:	00001ddc 	.word	0x00001ddc
    15b0:	00001eac 	.word	0x00001eac
    15b4:	00001db8 	.word	0x00001db8
    15b8:	00001eb0 	.word	0x00001eb0
    15bc:	00001e20 	.word	0x00001e20
    15c0:	00001cf0 	.word	0x00001cf0

000015c4 <USBRegisterDescriptors>:
    15c4:	e59f3004 	ldr	r3, [pc, #4]	; 15d0 <USBRegisterDescriptors+0xc>
    15c8:	e5830000 	str	r0, [r3]
    15cc:	e12fff1e 	bx	lr
    15d0:	40000298 	.word	0x40000298

000015d4 <USBRegisterCustomReqHandler>:
    15d4:	e59f3004 	ldr	r3, [pc, #4]	; 15e0 <USBRegisterCustomReqHandler+0xc>
    15d8:	e5830000 	str	r0, [r3]
    15dc:	e12fff1e 	bx	lr
    15e0:	40000290 	.word	0x40000290

000015e4 <USBGetDescriptor>:
    15e4:	e92d4070 	push	{r4, r5, r6, lr}
    15e8:	e59f10ac 	ldr	r1, [pc, #172]	; 169c <USBGetDescriptor+0xb8>
    15ec:	e5911000 	ldr	r1, [r1]
    15f0:	e1a00800 	lsl	r0, r0, #16
    15f4:	e3510000 	cmp	r1, #0	; 0x0
    15f8:	e1a0c820 	lsr	ip, r0, #16
    15fc:	e1a05002 	mov	r5, r2
    1600:	e24dd004 	sub	sp, sp, #4	; 0x4
    1604:	e1a06003 	mov	r6, r3
    1608:	11a00c20 	lsrne	r0, r0, #24
    160c:	120ce0ff 	andne	lr, ip, #255	; 0xff
    1610:	13a02000 	movne	r2, #0	; 0x0
    1614:	1a000017 	bne	1678 <USBGetDescriptor+0x94>
    1618:	e3a0c06e 	mov	ip, #110	; 0x6e
    161c:	e59f007c 	ldr	r0, [pc, #124]	; 16a0 <USBGetDescriptor+0xbc>
    1620:	e59f107c 	ldr	r1, [pc, #124]	; 16a4 <USBGetDescriptor+0xc0>
    1624:	e59f207c 	ldr	r2, [pc, #124]	; 16a8 <USBGetDescriptor+0xc4>
    1628:	e59f307c 	ldr	r3, [pc, #124]	; 16ac <USBGetDescriptor+0xc8>
    162c:	e58dc000 	str	ip, [sp]
    1630:	ebfffc06 	bl	650 <printf>
    1634:	eafffffe 	b	1634 <USBGetDescriptor+0x50>
    1638:	e5d13001 	ldrb	r3, [r1, #1]
    163c:	e1530000 	cmp	r3, r0
    1640:	1a00000b 	bne	1674 <USBGetDescriptor+0x90>
    1644:	e152000e 	cmp	r2, lr
    1648:	1a000008 	bne	1670 <USBGetDescriptor+0x8c>
    164c:	e5861000 	str	r1, [r6]
    1650:	e3500002 	cmp	r0, #2	; 0x2
    1654:	05d13002 	ldrbeq	r3, [r1, #2]
    1658:	05d12003 	ldrbeq	r2, [r1, #3]
    165c:	15d13000 	ldrbne	r3, [r1]
    1660:	01833402 	orreq	r3, r3, r2, lsl #8
    1664:	e3a00001 	mov	r0, #1	; 0x1
    1668:	e5853000 	str	r3, [r5]
    166c:	ea000008 	b	1694 <USBGetDescriptor+0xb0>
    1670:	e2822001 	add	r2, r2, #1	; 0x1
    1674:	e0811004 	add	r1, r1, r4
    1678:	e5d14000 	ldrb	r4, [r1]
    167c:	e3540000 	cmp	r4, #0	; 0x0
    1680:	1affffec 	bne	1638 <USBGetDescriptor+0x54>
    1684:	e1a0100c 	mov	r1, ip
    1688:	e59f0020 	ldr	r0, [pc, #32]	; 16b0 <USBGetDescriptor+0xcc>
    168c:	ebfffbef 	bl	650 <printf>
    1690:	e1a00004 	mov	r0, r4
    1694:	e28dd004 	add	sp, sp, #4	; 0x4
    1698:	e8bd8070 	pop	{r4, r5, r6, pc}
    169c:	40000298 	.word	0x40000298
    16a0:	00001db8 	.word	0x00001db8
    16a4:	00001eb8 	.word	0x00001eb8
    16a8:	00001ecc 	.word	0x00001ecc
    16ac:	00001d20 	.word	0x00001d20
    16b0:	00001ed8 	.word	0x00001ed8

000016b4 <USBHandleStandardRequest>:
    16b4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    16b8:	e59f32f8 	ldr	r3, [pc, #760]	; 19b8 <USBHandleStandardRequest+0x304>
    16bc:	e5933000 	ldr	r3, [r3]
    16c0:	e3530000 	cmp	r3, #0	; 0x0
    16c4:	e24dd004 	sub	sp, sp, #4	; 0x4
    16c8:	e1a05000 	mov	r5, r0
    16cc:	e1a06001 	mov	r6, r1
    16d0:	e1a04002 	mov	r4, r2
    16d4:	0a000003 	beq	16e8 <USBHandleStandardRequest+0x34>
    16d8:	e1a0e00f 	mov	lr, pc
    16dc:	e12fff13 	bx	r3
    16e0:	e3500000 	cmp	r0, #0	; 0x0
    16e4:	1a0000a9 	bne	1990 <USBHandleStandardRequest+0x2dc>
    16e8:	e5d53000 	ldrb	r3, [r5]
    16ec:	e203301f 	and	r3, r3, #31	; 0x1f
    16f0:	e3530001 	cmp	r3, #1	; 0x1
    16f4:	0a000059 	beq	1860 <USBHandleStandardRequest+0x1ac>
    16f8:	e3530002 	cmp	r3, #2	; 0x2
    16fc:	0a00007b 	beq	18f0 <USBHandleStandardRequest+0x23c>
    1700:	e3530000 	cmp	r3, #0	; 0x0
    1704:	1a0000a7 	bne	19a8 <USBHandleStandardRequest+0x2f4>
    1708:	e5d51001 	ldrb	r1, [r5, #1]
    170c:	e5940000 	ldr	r0, [r4]
    1710:	e3510009 	cmp	r1, #9	; 0x9
    1714:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1718:	ea00004e 	b	1858 <USBHandleStandardRequest+0x1a4>
    171c:	000018a4 	.word	0x000018a4
    1720:	000019a8 	.word	0x000019a8
    1724:	00001858 	.word	0x00001858
    1728:	000019a8 	.word	0x000019a8
    172c:	00001858 	.word	0x00001858
    1730:	00001744 	.word	0x00001744
    1734:	00001750 	.word	0x00001750
    1738:	00001850 	.word	0x00001850
    173c:	00001778 	.word	0x00001778
    1740:	00001790 	.word	0x00001790
    1744:	e5d50002 	ldrb	r0, [r5, #2]
    1748:	ebfffcf4 	bl	b20 <USBHwSetAddress>
    174c:	ea00008f 	b	1990 <USBHandleStandardRequest+0x2dc>
    1750:	e1d510b2 	ldrh	r1, [r5, #2]
    1754:	e59f0260 	ldr	r0, [pc, #608]	; 19bc <USBHandleStandardRequest+0x308>
    1758:	ebfffbbc 	bl	650 <printf>
    175c:	e1d510b4 	ldrh	r1, [r5, #4]
    1760:	e1d500b2 	ldrh	r0, [r5, #2]
    1764:	e1a02006 	mov	r2, r6
    1768:	e1a03004 	mov	r3, r4
    176c:	e28dd004 	add	sp, sp, #4	; 0x4
    1770:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    1774:	eaffff9a 	b	15e4 <USBGetDescriptor>
    1778:	e59f3240 	ldr	r3, [pc, #576]	; 19c0 <USBHandleStandardRequest+0x30c>
    177c:	e5d32000 	ldrb	r2, [r3]
    1780:	e3a03001 	mov	r3, #1	; 0x1
    1784:	e1a01003 	mov	r1, r3
    1788:	e5c02000 	strb	r2, [r0]
    178c:	ea000072 	b	195c <USBHandleStandardRequest+0x2a8>
    1790:	e59f322c 	ldr	r3, [pc, #556]	; 19c4 <USBHandleStandardRequest+0x310>
    1794:	e5933000 	ldr	r3, [r3]
    1798:	e3530000 	cmp	r3, #0	; 0x0
    179c:	e1d520b2 	ldrh	r2, [r5, #2]
    17a0:	1a000007 	bne	17c4 <USBHandleStandardRequest+0x110>
    17a4:	e3a0c0a5 	mov	ip, #165	; 0xa5
    17a8:	e59f0218 	ldr	r0, [pc, #536]	; 19c8 <USBHandleStandardRequest+0x314>
    17ac:	e59f1218 	ldr	r1, [pc, #536]	; 19cc <USBHandleStandardRequest+0x318>
    17b0:	e59f2218 	ldr	r2, [pc, #536]	; 19d0 <USBHandleStandardRequest+0x31c>
    17b4:	e59f3218 	ldr	r3, [pc, #536]	; 19d4 <USBHandleStandardRequest+0x320>
    17b8:	e58dc000 	str	ip, [sp]
    17bc:	ebfffba3 	bl	650 <printf>
    17c0:	eafffffe 	b	17c0 <USBHandleStandardRequest+0x10c>
    17c4:	e21270ff 	ands	r7, r2, #255	; 0xff
    17c8:	13a060ff 	movne	r6, #255	; 0xff
    17cc:	01a00007 	moveq	r0, r7
    17d0:	11a04003 	movne	r4, r3
    17d4:	11a08006 	movne	r8, r6
    17d8:	1a000012 	bne	1828 <USBHandleStandardRequest+0x174>
    17dc:	ea000015 	b	1838 <USBHandleStandardRequest+0x184>
    17e0:	e5d43001 	ldrb	r3, [r4, #1]
    17e4:	e3530004 	cmp	r3, #4	; 0x4
    17e8:	05d46003 	ldrbeq	r6, [r4, #3]
    17ec:	0a00000b 	beq	1820 <USBHandleStandardRequest+0x16c>
    17f0:	e3530005 	cmp	r3, #5	; 0x5
    17f4:	0a000002 	beq	1804 <USBHandleStandardRequest+0x150>
    17f8:	e3530002 	cmp	r3, #2	; 0x2
    17fc:	05d48005 	ldrbeq	r8, [r4, #5]
    1800:	ea000006 	b	1820 <USBHandleStandardRequest+0x16c>
    1804:	e1580007 	cmp	r8, r7
    1808:	03560000 	cmpeq	r6, #0	; 0x0
    180c:	05d43005 	ldrbeq	r3, [r4, #5]
    1810:	05d41004 	ldrbeq	r1, [r4, #4]
    1814:	05d40002 	ldrbeq	r0, [r4, #2]
    1818:	01811403 	orreq	r1, r1, r3, lsl #8
    181c:	0bfffca9 	bleq	ac8 <USBHwEPConfig>
    1820:	e5d43000 	ldrb	r3, [r4]
    1824:	e0844003 	add	r4, r4, r3
    1828:	e5d43000 	ldrb	r3, [r4]
    182c:	e3530000 	cmp	r3, #0	; 0x0
    1830:	1affffea 	bne	17e0 <USBHandleStandardRequest+0x12c>
    1834:	e3a00001 	mov	r0, #1	; 0x1
    1838:	ebfffd4e 	bl	d78 <USBHwConfigDevice>
    183c:	e1d520b2 	ldrh	r2, [r5, #2]
    1840:	e59f3178 	ldr	r3, [pc, #376]	; 19c0 <USBHandleStandardRequest+0x30c>
    1844:	e3a01001 	mov	r1, #1	; 0x1
    1848:	e5c32000 	strb	r2, [r3]
    184c:	ea000056 	b	19ac <USBHandleStandardRequest+0x2f8>
    1850:	e59f0180 	ldr	r0, [pc, #384]	; 19d8 <USBHandleStandardRequest+0x324>
    1854:	ea000052 	b	19a4 <USBHandleStandardRequest+0x2f0>
    1858:	e59f017c 	ldr	r0, [pc, #380]	; 19dc <USBHandleStandardRequest+0x328>
    185c:	ea000050 	b	19a4 <USBHandleStandardRequest+0x2f0>
    1860:	e5d51001 	ldrb	r1, [r5, #1]
    1864:	e5940000 	ldr	r0, [r4]
    1868:	e351000b 	cmp	r1, #11	; 0xb
    186c:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1870:	ea00001c 	b	18e8 <USBHandleStandardRequest+0x234>
    1874:	000018a4 	.word	0x000018a4
    1878:	000019a8 	.word	0x000019a8
    187c:	000018e8 	.word	0x000018e8
    1880:	000019a8 	.word	0x000019a8
    1884:	000018e8 	.word	0x000018e8
    1888:	000018e8 	.word	0x000018e8
    188c:	000018e8 	.word	0x000018e8
    1890:	000018e8 	.word	0x000018e8
    1894:	000018e8 	.word	0x000018e8
    1898:	000018e8 	.word	0x000018e8
    189c:	000018b8 	.word	0x000018b8
    18a0:	000018d0 	.word	0x000018d0
    18a4:	e3a03000 	mov	r3, #0	; 0x0
    18a8:	e3a01001 	mov	r1, #1	; 0x1
    18ac:	e5c03001 	strb	r3, [r0, #1]
    18b0:	e5c03000 	strb	r3, [r0]
    18b4:	ea000027 	b	1958 <USBHandleStandardRequest+0x2a4>
    18b8:	e3a02001 	mov	r2, #1	; 0x1
    18bc:	e3a03000 	mov	r3, #0	; 0x0
    18c0:	e1a01002 	mov	r1, r2
    18c4:	e5c03000 	strb	r3, [r0]
    18c8:	e5862000 	str	r2, [r6]
    18cc:	ea000036 	b	19ac <USBHandleStandardRequest+0x2f8>
    18d0:	e1d500b2 	ldrh	r0, [r5, #2]
    18d4:	e3500000 	cmp	r0, #0	; 0x0
    18d8:	03a01001 	moveq	r1, #1	; 0x1
    18dc:	05860000 	streq	r0, [r6]
    18e0:	0a000031 	beq	19ac <USBHandleStandardRequest+0x2f8>
    18e4:	ea00002f 	b	19a8 <USBHandleStandardRequest+0x2f4>
    18e8:	e59f00f0 	ldr	r0, [pc, #240]	; 19e0 <USBHandleStandardRequest+0x32c>
    18ec:	ea00002c 	b	19a4 <USBHandleStandardRequest+0x2f0>
    18f0:	e5d51001 	ldrb	r1, [r5, #1]
    18f4:	e5944000 	ldr	r4, [r4]
    18f8:	e351000c 	cmp	r1, #12	; 0xc
    18fc:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1900:	ea000026 	b	19a0 <USBHandleStandardRequest+0x2ec>
    1904:	00001938 	.word	0x00001938
    1908:	00001964 	.word	0x00001964
    190c:	000019a0 	.word	0x000019a0
    1910:	00001978 	.word	0x00001978
    1914:	000019a0 	.word	0x000019a0
    1918:	000019a0 	.word	0x000019a0
    191c:	000019a0 	.word	0x000019a0
    1920:	000019a0 	.word	0x000019a0
    1924:	000019a0 	.word	0x000019a0
    1928:	000019a0 	.word	0x000019a0
    192c:	000019a0 	.word	0x000019a0
    1930:	000019a0 	.word	0x000019a0
    1934:	00001998 	.word	0x00001998
    1938:	e5d50004 	ldrb	r0, [r5, #4]
    193c:	ebfffc8a 	bl	b6c <USBHwEPGetStatus>
    1940:	e1a000a0 	lsr	r0, r0, #1
    1944:	e2000001 	and	r0, r0, #1	; 0x1
    1948:	e3a03000 	mov	r3, #0	; 0x0
    194c:	e5c43001 	strb	r3, [r4, #1]
    1950:	e5c40000 	strb	r0, [r4]
    1954:	e3a01001 	mov	r1, #1	; 0x1
    1958:	e2833002 	add	r3, r3, #2	; 0x2
    195c:	e5863000 	str	r3, [r6]
    1960:	ea000011 	b	19ac <USBHandleStandardRequest+0x2f8>
    1964:	e1d510b2 	ldrh	r1, [r5, #2]
    1968:	e3510000 	cmp	r1, #0	; 0x0
    196c:	05d50004 	ldrbeq	r0, [r5, #4]
    1970:	0a000005 	beq	198c <USBHandleStandardRequest+0x2d8>
    1974:	ea00000b 	b	19a8 <USBHandleStandardRequest+0x2f4>
    1978:	e1d530b2 	ldrh	r3, [r5, #2]
    197c:	e3530000 	cmp	r3, #0	; 0x0
    1980:	1a000008 	bne	19a8 <USBHandleStandardRequest+0x2f4>
    1984:	e5d50004 	ldrb	r0, [r5, #4]
    1988:	e3a01001 	mov	r1, #1	; 0x1
    198c:	ebfffc7e 	bl	b8c <USBHwEPStall>
    1990:	e3a01001 	mov	r1, #1	; 0x1
    1994:	ea000004 	b	19ac <USBHandleStandardRequest+0x2f8>
    1998:	e59f0044 	ldr	r0, [pc, #68]	; 19e4 <USBHandleStandardRequest+0x330>
    199c:	ea000000 	b	19a4 <USBHandleStandardRequest+0x2f0>
    19a0:	e59f0040 	ldr	r0, [pc, #64]	; 19e8 <USBHandleStandardRequest+0x334>
    19a4:	ebfffb29 	bl	650 <printf>
    19a8:	e3a01000 	mov	r1, #0	; 0x0
    19ac:	e1a00001 	mov	r0, r1
    19b0:	e28dd004 	add	sp, sp, #4	; 0x4
    19b4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    19b8:	40000290 	.word	0x40000290
    19bc:	00001eec 	.word	0x00001eec
    19c0:	40000294 	.word	0x40000294
    19c4:	40000298 	.word	0x40000298
    19c8:	00001db8 	.word	0x00001db8
    19cc:	00001eb8 	.word	0x00001eb8
    19d0:	00001ecc 	.word	0x00001ecc
    19d4:	00001d0c 	.word	0x00001d0c
    19d8:	00001ef0 	.word	0x00001ef0
    19dc:	00001f10 	.word	0x00001f10
    19e0:	00001f28 	.word	0x00001f28
    19e4:	00001f44 	.word	0x00001f44
    19e8:	00001f60 	.word	0x00001f60

000019ec <USBInit>:
    19ec:	e92d4010 	push	{r4, lr}
    19f0:	e59f4050 	ldr	r4, [pc, #80]	; 1a48 <USBInit+0x5c>
    19f4:	ebfffd3b 	bl	ee8 <USBHwInit>
    19f8:	e59f004c 	ldr	r0, [pc, #76]	; 1a4c <USBInit+0x60>
    19fc:	ebfffde9 	bl	11a8 <USBHwRegisterDevIntHandler>
    1a00:	e1a01004 	mov	r1, r4
    1a04:	e3a00000 	mov	r0, #0	; 0x0
    1a08:	ebfffdf1 	bl	11d4 <USBHwRegisterEPIntHandler>
    1a0c:	e1a01004 	mov	r1, r4
    1a10:	e3a00080 	mov	r0, #128	; 0x80
    1a14:	ebfffdee 	bl	11d4 <USBHwRegisterEPIntHandler>
    1a18:	e3a00000 	mov	r0, #0	; 0x0
    1a1c:	e3a01040 	mov	r1, #64	; 0x40
    1a20:	ebfffc28 	bl	ac8 <USBHwEPConfig>
    1a24:	e3a00080 	mov	r0, #128	; 0x80
    1a28:	e3a01040 	mov	r1, #64	; 0x40
    1a2c:	ebfffc25 	bl	ac8 <USBHwEPConfig>
    1a30:	e3a00000 	mov	r0, #0	; 0x0
    1a34:	e59f1014 	ldr	r1, [pc, #20]	; 1a50 <USBInit+0x64>
    1a38:	e59f2014 	ldr	r2, [pc, #20]	; 1a54 <USBInit+0x68>
    1a3c:	ebfffe0c 	bl	1274 <USBRegisterRequestHandler>
    1a40:	e3a00001 	mov	r0, #1	; 0x1
    1a44:	e8bd8010 	pop	{r4, pc}
    1a48:	000013f4 	.word	0x000013f4
    1a4c:	00001a58 	.word	0x00001a58
    1a50:	000016b4 	.word	0x000016b4
    1a54:	4000029c 	.word	0x4000029c

00001a58 <HandleUsbReset>:
    1a58:	e3100010 	tst	r0, #16	; 0x10
    1a5c:	012fff1e 	bxeq	lr
    1a60:	e59f0000 	ldr	r0, [pc, #0]	; 1a68 <HandleUsbReset+0x10>
    1a64:	eafffaf9 	b	650 <printf>
    1a68:	00001f74 	.word	0x00001f74

00001a6c <__aeabi_uidiv>:
    1a6c:	e2512001 	subs	r2, r1, #1	; 0x1
    1a70:	012fff1e 	bxeq	lr
    1a74:	3a000036 	bcc	1b54 <__aeabi_uidiv+0xe8>
    1a78:	e1500001 	cmp	r0, r1
    1a7c:	9a000022 	bls	1b0c <__aeabi_uidiv+0xa0>
    1a80:	e1110002 	tst	r1, r2
    1a84:	0a000023 	beq	1b18 <__aeabi_uidiv+0xac>
    1a88:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1a8c:	01a01181 	lsleq	r1, r1, #3
    1a90:	03a03008 	moveq	r3, #8	; 0x8
    1a94:	13a03001 	movne	r3, #1	; 0x1
    1a98:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1a9c:	31510000 	cmpcc	r1, r0
    1aa0:	31a01201 	lslcc	r1, r1, #4
    1aa4:	31a03203 	lslcc	r3, r3, #4
    1aa8:	3afffffa 	bcc	1a98 <__aeabi_uidiv+0x2c>
    1aac:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1ab0:	31510000 	cmpcc	r1, r0
    1ab4:	31a01081 	lslcc	r1, r1, #1
    1ab8:	31a03083 	lslcc	r3, r3, #1
    1abc:	3afffffa 	bcc	1aac <__aeabi_uidiv+0x40>
    1ac0:	e3a02000 	mov	r2, #0	; 0x0
    1ac4:	e1500001 	cmp	r0, r1
    1ac8:	20400001 	subcs	r0, r0, r1
    1acc:	21822003 	orrcs	r2, r2, r3
    1ad0:	e15000a1 	cmp	r0, r1, lsr #1
    1ad4:	204000a1 	subcs	r0, r0, r1, lsr #1
    1ad8:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1adc:	e1500121 	cmp	r0, r1, lsr #2
    1ae0:	20400121 	subcs	r0, r0, r1, lsr #2
    1ae4:	21822123 	orrcs	r2, r2, r3, lsr #2
    1ae8:	e15001a1 	cmp	r0, r1, lsr #3
    1aec:	204001a1 	subcs	r0, r0, r1, lsr #3
    1af0:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1af4:	e3500000 	cmp	r0, #0	; 0x0
    1af8:	11b03223 	lsrsne	r3, r3, #4
    1afc:	11a01221 	lsrne	r1, r1, #4
    1b00:	1affffef 	bne	1ac4 <__aeabi_uidiv+0x58>
    1b04:	e1a00002 	mov	r0, r2
    1b08:	e12fff1e 	bx	lr
    1b0c:	03a00001 	moveq	r0, #1	; 0x1
    1b10:	13a00000 	movne	r0, #0	; 0x0
    1b14:	e12fff1e 	bx	lr
    1b18:	e3510801 	cmp	r1, #65536	; 0x10000
    1b1c:	21a01821 	lsrcs	r1, r1, #16
    1b20:	23a02010 	movcs	r2, #16	; 0x10
    1b24:	33a02000 	movcc	r2, #0	; 0x0
    1b28:	e3510c01 	cmp	r1, #256	; 0x100
    1b2c:	21a01421 	lsrcs	r1, r1, #8
    1b30:	22822008 	addcs	r2, r2, #8	; 0x8
    1b34:	e3510010 	cmp	r1, #16	; 0x10
    1b38:	21a01221 	lsrcs	r1, r1, #4
    1b3c:	22822004 	addcs	r2, r2, #4	; 0x4
    1b40:	e3510004 	cmp	r1, #4	; 0x4
    1b44:	82822003 	addhi	r2, r2, #3	; 0x3
    1b48:	908220a1 	addls	r2, r2, r1, lsr #1
    1b4c:	e1a00230 	lsr	r0, r0, r2
    1b50:	e12fff1e 	bx	lr
    1b54:	e52de008 	str	lr, [sp, #-8]!
    1b58:	eb00003a 	bl	1c48 <__aeabi_idiv0>
    1b5c:	e3a00000 	mov	r0, #0	; 0x0
    1b60:	e49df008 	ldr	pc, [sp], #8

00001b64 <__aeabi_uidivmod>:
    1b64:	e92d4003 	push	{r0, r1, lr}
    1b68:	ebffffbf 	bl	1a6c <__aeabi_uidiv>
    1b6c:	e8bd4006 	pop	{r1, r2, lr}
    1b70:	e0030092 	mul	r3, r2, r0
    1b74:	e0411003 	sub	r1, r1, r3
    1b78:	e12fff1e 	bx	lr

00001b7c <__umodsi3>:
    1b7c:	e2512001 	subs	r2, r1, #1	; 0x1
    1b80:	3a00002c 	bcc	1c38 <__umodsi3+0xbc>
    1b84:	11500001 	cmpne	r0, r1
    1b88:	03a00000 	moveq	r0, #0	; 0x0
    1b8c:	81110002 	tsthi	r1, r2
    1b90:	00000002 	andeq	r0, r0, r2
    1b94:	912fff1e 	bxls	lr
    1b98:	e3a02000 	mov	r2, #0	; 0x0
    1b9c:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1ba0:	31510000 	cmpcc	r1, r0
    1ba4:	31a01201 	lslcc	r1, r1, #4
    1ba8:	32822004 	addcc	r2, r2, #4	; 0x4
    1bac:	3afffffa 	bcc	1b9c <__umodsi3+0x20>
    1bb0:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1bb4:	31510000 	cmpcc	r1, r0
    1bb8:	31a01081 	lslcc	r1, r1, #1
    1bbc:	32822001 	addcc	r2, r2, #1	; 0x1
    1bc0:	3afffffa 	bcc	1bb0 <__umodsi3+0x34>
    1bc4:	e2522003 	subs	r2, r2, #3	; 0x3
    1bc8:	ba00000e 	blt	1c08 <__umodsi3+0x8c>
    1bcc:	e1500001 	cmp	r0, r1
    1bd0:	20400001 	subcs	r0, r0, r1
    1bd4:	e15000a1 	cmp	r0, r1, lsr #1
    1bd8:	204000a1 	subcs	r0, r0, r1, lsr #1
    1bdc:	e1500121 	cmp	r0, r1, lsr #2
    1be0:	20400121 	subcs	r0, r0, r1, lsr #2
    1be4:	e15001a1 	cmp	r0, r1, lsr #3
    1be8:	204001a1 	subcs	r0, r0, r1, lsr #3
    1bec:	e3500001 	cmp	r0, #1	; 0x1
    1bf0:	e1a01221 	lsr	r1, r1, #4
    1bf4:	a2522004 	subsge	r2, r2, #4	; 0x4
    1bf8:	aafffff3 	bge	1bcc <__umodsi3+0x50>
    1bfc:	e3120003 	tst	r2, #3	; 0x3
    1c00:	13300000 	teqne	r0, #0	; 0x0
    1c04:	0a00000a 	beq	1c34 <__umodsi3+0xb8>
    1c08:	e3720002 	cmn	r2, #2	; 0x2
    1c0c:	ba000006 	blt	1c2c <__umodsi3+0xb0>
    1c10:	0a000002 	beq	1c20 <__umodsi3+0xa4>
    1c14:	e1500001 	cmp	r0, r1
    1c18:	20400001 	subcs	r0, r0, r1
    1c1c:	e1a010a1 	lsr	r1, r1, #1
    1c20:	e1500001 	cmp	r0, r1
    1c24:	20400001 	subcs	r0, r0, r1
    1c28:	e1a010a1 	lsr	r1, r1, #1
    1c2c:	e1500001 	cmp	r0, r1
    1c30:	20400001 	subcs	r0, r0, r1
    1c34:	e12fff1e 	bx	lr
    1c38:	e52de008 	str	lr, [sp, #-8]!
    1c3c:	eb000001 	bl	1c48 <__aeabi_idiv0>
    1c40:	e3a00000 	mov	r0, #0	; 0x0
    1c44:	e49df008 	ldr	pc, [sp], #8

00001c48 <__aeabi_idiv0>:
    1c48:	e12fff1e 	bx	lr

00001c4c <abDescriptors>:
    1c4c:	01010112 40000002 0005ffff 02010100     .......@........
    1c5c:	02090103 01010020 0932c000 02000004     .... .....2.....
    1c6c:	000000ff 0d060507 07010080 800d8305     ................
    1c7c:	03040100 030e0409 0050004c 00550043     ........L.P.C.U.
    1c8c:	00420053 00550314 00420053 00650053     S.B...U.S.B.S.e.
    1c9c:	00690072 006c0061 00440312 00410045     r.i.a.l...D.E.A.
    1cac:	00430044 00440030 00000045              D.C.0.D.E...

00001cb8 <__FUNCTION__.1675>:
    1cb8:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    1cc8:	6148746e 656c646e 00000072              ntHandler...

00001cd4 <__FUNCTION__.1666>:
    1cd4:	52425355 73696765 52726574 65757165     USBRegisterReque
    1ce4:	61487473 656c646e 00000072              stHandler...

00001cf0 <__FUNCTION__.1628>:
    1cf0:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    1d00:	6e617254 72656673 00000000              Transfer....

00001d0c <__FUNCTION__.1642>:
    1d0c:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    1d1c:	006e6f69                                ion.

00001d20 <__FUNCTION__.1609>:
    1d20:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    1d30:	00000000 6c756e28 0000296c 74696e49     ....(null)..Init
    1d40:	696c6169 676e6973 42535520 61747320     ialising USB sta
    1d50:	00006b63 72617453 676e6974 42535520     ck..Starting USB
    1d60:	6d6f6320 696e756d 69746163 00006e6f      communication..
    1d70:	69676552 72657473 68206465 6c646e61     Registered handl
    1d80:	66207265 6620726f 656d6172 00000000     er for frame....
    1d90:	69676552 72657473 68206465 6c646e61     Registered handl
    1da0:	66207265 6420726f 63697665 74732065     er for device st
    1db0:	73757461 00000000 7373410a 69747265     atus.....Asserti
    1dc0:	27206e6f 20277325 6c696166 69206465     on '%s' failed i
    1dd0:	7325206e 2373253a 0a216425 00000000     n %s:%s#%d!.....
    1de0:	3c786469 00003233 68627375 706c5f77     idx<32..usbhw_lp
    1df0:	00632e63 69676552 72657473 68206465     c.c.Registered h
    1e00:	6c646e61 66207265 4520726f 78302050     andler for EP 0x
    1e10:	000a7825 70795469 3d3e2065 00003020     %x..iType >= 0..
    1e20:	63627375 72746e6f 632e6c6f 00000000     usbcontrol.c....
    1e30:	70795469 203c2065 00000034 68206f4e     iType < 4...No h
    1e40:	6c646e61 66207265 7220726f 79747165     andler for reqty
    1e50:	25206570 00000a64 4c415453 6e6f204c     pe %d...STALL on
    1e60:	00005b20 32302520 00000078 7473205d      [.. %02x...] st
    1e70:	253d7461 00000a78 00782553 6e61485f     at=%x...S%x._Han
    1e80:	52656c64 65757165 20317473 6c696166     dleRequest1 fail
    1e90:	00006465 6e61485f 52656c64 65757165     ed.._HandleReque
    1ea0:	20327473 6c696166 00006465 0000003f     st2 failed..?...
    1eb0:	534c4146 00000045 44626170 72637365     FALSE...pabDescr
    1ec0:	21207069 554e203d 00004c4c 73627375     ip != NULL..usbs
    1ed0:	65726474 00632e71 63736544 20782520     tdreq.c.Desc %x 
    1ee0:	20746f6e 6e756f66 000a2164 00782544     not found!..D%x.
    1ef0:	69766544 72206563 25207165 6f6e2064     Device req %d no
    1f00:	6d692074 6d656c70 65746e65 00000a64     t implemented...
    1f10:	656c6c49 206c6167 69766564 72206563     Illegal device r
    1f20:	25207165 00000a64 656c6c49 206c6167     eq %d...Illegal 
    1f30:	65746e69 63616672 65722065 64252071     interface req %d
    1f40:	0000000a 72205045 25207165 6f6e2064     ....EP req %d no
    1f50:	6d692074 6d656c70 65746e65 00000a64     t implemented...
    1f60:	656c6c49 206c6167 72205045 25207165     Illegal EP req %
    1f70:	00000a64 0000210a                       d....!..
