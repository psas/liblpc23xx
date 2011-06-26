
serial.elf:     file format elf32-littlearm


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
      bc:	ea00026b 	b	a70 <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	000023c0 	.word	0x000023c0
      c8:	40000200 	.word	0x40000200
      cc:	40000208 	.word	0x40000208
      d0:	40000208 	.word	0x40000208
      d4:	40000400 	.word	0x40000400

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
     394:	eb0006b3 	bl	1e68 <__umodsi3>
     398:	e1a03000 	mov	r3, r0
     39c:	e3530009 	cmp	r3, #9	; 0x9
     3a0:	c083300a 	addgt	r3, r3, sl
     3a4:	e2833030 	add	r3, r3, #48	; 0x30
     3a8:	e1a00004 	mov	r0, r4
     3ac:	e5653001 	strb	r3, [r5, #-1]!
     3b0:	e1a01006 	mov	r1, r6
     3b4:	eb000667 	bl	1d58 <__aeabi_uidiv>
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
     614:	000020f4 	.word	0x000020f4

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

0000075c <USBDevIntHandler>:
     75c:	e3100010 	tst	r0, #16	; 0x10
     760:	159f3008 	ldrne	r3, [pc, #8]	; 770 <USBDevIntHandler+0x14>
     764:	13a02000 	movne	r2, #0	; 0x0
     768:	15832000 	strne	r2, [r3]
     76c:	e12fff1e 	bx	lr
     770:	40000250 	.word	0x40000250

00000774 <USBIntHandler>:
     774:	e24ee004 	sub	lr, lr, #4	; 0x4
     778:	e92d500f 	push	{r0, r1, r2, r3, ip, lr}
     77c:	eb00023c 	bl	1074 <USBHwISR>
     780:	e3a02000 	mov	r2, #0	; 0x0
     784:	e3e03000 	mvn	r3, #0	; 0x0
     788:	e5032fcf 	str	r2, [r3, #-4047]
     78c:	e8fd900f 	ldm	sp!, {r0, r1, r2, r3, ip, pc}^

00000790 <VCOM_getchar>:
     790:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     794:	e24dd004 	sub	sp, sp, #4	; 0x4
     798:	e28d1003 	add	r1, sp, #3	; 0x3
     79c:	e59f0014 	ldr	r0, [pc, #20]	; 7b8 <VCOM_getchar+0x28>
     7a0:	eb00010e 	bl	be0 <fifo_get>
     7a4:	e3500000 	cmp	r0, #0	; 0x0
     7a8:	15dd0003 	ldrbne	r0, [sp, #3]
     7ac:	03e00000 	mvneq	r0, #0	; 0x0
     7b0:	e28dd004 	add	sp, sp, #4	; 0x4
     7b4:	e8bd8000 	pop	{pc}
     7b8:	40000364 	.word	0x40000364

000007bc <SendNextBulkIn>:
     7bc:	e59f307c 	ldr	r3, [pc, #124]	; 840 <SendNextBulkIn+0x84>
     7c0:	e3510000 	cmp	r1, #0	; 0x0
     7c4:	e3a02000 	mov	r2, #0	; 0x0
     7c8:	e5832000 	str	r2, [r3]
     7cc:	159f3070 	ldrne	r3, [pc, #112]	; 844 <SendNextBulkIn+0x88>
     7d0:	15832000 	strne	r2, [r3]
     7d4:	e59f3068 	ldr	r3, [pc, #104]	; 844 <SendNextBulkIn+0x88>
     7d8:	e5932000 	ldr	r2, [r3]
     7dc:	e3520000 	cmp	r2, #0	; 0x0
     7e0:	e92d4070 	push	{r4, r5, r6, lr}
     7e4:	e20050ff 	and	r5, r0, #255	; 0xff
     7e8:	18bd8070 	popne	{r4, r5, r6, pc}
     7ec:	e59f6054 	ldr	r6, [pc, #84]	; 848 <SendNextBulkIn+0x8c>
     7f0:	e1a04002 	mov	r4, r2
     7f4:	e0841006 	add	r1, r4, r6
     7f8:	e59f004c 	ldr	r0, [pc, #76]	; 84c <SendNextBulkIn+0x90>
     7fc:	eb0000f7 	bl	be0 <fifo_get>
     800:	e3500000 	cmp	r0, #0	; 0x0
     804:	0a000002 	beq	814 <SendNextBulkIn+0x58>
     808:	e2844001 	add	r4, r4, #1	; 0x1
     80c:	e3540040 	cmp	r4, #64	; 0x40
     810:	1afffff7 	bne	7f4 <SendNextBulkIn+0x38>
     814:	e1a02004 	mov	r2, r4
     818:	e1a00005 	mov	r0, r5
     81c:	e59f1024 	ldr	r1, [pc, #36]	; 848 <SendNextBulkIn+0x8c>
     820:	eb00019c 	bl	e98 <USBHwEPWrite>
     824:	e59f3014 	ldr	r3, [pc, #20]	; 840 <SendNextBulkIn+0x84>
     828:	e354003f 	cmp	r4, #63	; 0x3f
     82c:	e3a02001 	mov	r2, #1	; 0x1
     830:	e5832000 	str	r2, [r3]
     834:	d59f3008 	ldrle	r3, [pc, #8]	; 844 <SendNextBulkIn+0x88>
     838:	d5832000 	strle	r2, [r3]
     83c:	e8bd8070 	pop	{r4, r5, r6, pc}
     840:	40000250 	.word	0x40000250
     844:	40000254 	.word	0x40000254
     848:	40000208 	.word	0x40000208
     84c:	40000358 	.word	0x40000358

00000850 <USBFrameHandler>:
     850:	e59f302c 	ldr	r3, [pc, #44]	; 884 <USBFrameHandler+0x34>
     854:	e5933000 	ldr	r3, [r3]
     858:	e3530000 	cmp	r3, #0	; 0x0
     85c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     860:	149df004 	popne	{pc}		; (ldrne pc, [sp], #4)
     864:	e59f001c 	ldr	r0, [pc, #28]	; 888 <USBFrameHandler+0x38>
     868:	eb0000f1 	bl	c34 <fifo_avail>
     86c:	e3500000 	cmp	r0, #0	; 0x0
     870:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
     874:	e3a00082 	mov	r0, #130	; 0x82
     878:	e3a01001 	mov	r1, #1	; 0x1
     87c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     880:	eaffffcd 	b	7bc <SendNextBulkIn>
     884:	40000250 	.word	0x40000250
     888:	40000358 	.word	0x40000358

0000088c <BulkIn>:
     88c:	e20000ff 	and	r0, r0, #255	; 0xff
     890:	e3a01000 	mov	r1, #0	; 0x0
     894:	eaffffc8 	b	7bc <SendNextBulkIn>

00000898 <VCOM_putchar>:
     898:	e92d4010 	push	{r4, lr}
     89c:	e20010ff 	and	r1, r0, #255	; 0xff
     8a0:	e1a04000 	mov	r4, r0
     8a4:	e59f0010 	ldr	r0, [pc, #16]	; 8bc <VCOM_putchar+0x24>
     8a8:	eb0000b9 	bl	b94 <fifo_put>
     8ac:	e3500000 	cmp	r0, #0	; 0x0
     8b0:	11a00004 	movne	r0, r4
     8b4:	03e00000 	mvneq	r0, #0	; 0x0
     8b8:	e8bd8010 	pop	{r4, pc}
     8bc:	40000358 	.word	0x40000358

000008c0 <BulkOut>:
     8c0:	e92d4070 	push	{r4, r5, r6, lr}
     8c4:	e1a03000 	mov	r3, r0
     8c8:	e24dd004 	sub	sp, sp, #4	; 0x4
     8cc:	e59f0074 	ldr	r0, [pc, #116]	; 948 <BulkOut+0x88>
     8d0:	e20340ff 	and	r4, r3, #255	; 0xff
     8d4:	eb0000e3 	bl	c68 <fifo_free>
     8d8:	e350003f 	cmp	r0, #63	; 0x3f
     8dc:	da000017 	ble	940 <BulkOut+0x80>
     8e0:	e1a00004 	mov	r0, r4
     8e4:	e59f1060 	ldr	r1, [pc, #96]	; 94c <BulkOut+0x8c>
     8e8:	e3a02040 	mov	r2, #64	; 0x40
     8ec:	eb00018c 	bl	f24 <USBHwEPRead>
     8f0:	e59f6054 	ldr	r6, [pc, #84]	; 94c <BulkOut+0x8c>
     8f4:	e1a05000 	mov	r5, r0
     8f8:	e3a04000 	mov	r4, #0	; 0x0
     8fc:	ea00000c 	b	934 <BulkOut+0x74>
     900:	e7d41006 	ldrb	r1, [r4, r6]
     904:	eb0000a2 	bl	b94 <fifo_put>
     908:	e3500000 	cmp	r0, #0	; 0x0
     90c:	1a000007 	bne	930 <BulkOut+0x70>
     910:	e3a0c0f9 	mov	ip, #249	; 0xf9
     914:	e59f0034 	ldr	r0, [pc, #52]	; 950 <BulkOut+0x90>
     918:	e59f1034 	ldr	r1, [pc, #52]	; 954 <BulkOut+0x94>
     91c:	e59f2034 	ldr	r2, [pc, #52]	; 958 <BulkOut+0x98>
     920:	e59f3034 	ldr	r3, [pc, #52]	; 95c <BulkOut+0x9c>
     924:	e58dc000 	str	ip, [sp]
     928:	ebffff48 	bl	650 <printf>
     92c:	eafffffe 	b	92c <BulkOut+0x6c>
     930:	e2844001 	add	r4, r4, #1	; 0x1
     934:	e1540005 	cmp	r4, r5
     938:	e59f0008 	ldr	r0, [pc, #8]	; 948 <BulkOut+0x88>
     93c:	baffffef 	blt	900 <BulkOut+0x40>
     940:	e28dd004 	add	sp, sp, #4	; 0x4
     944:	e8bd8070 	pop	{r4, r5, r6, pc}
     948:	40000364 	.word	0x40000364
     94c:	40000208 	.word	0x40000208
     950:	000020fc 	.word	0x000020fc
     954:	00002124 	.word	0x00002124
     958:	0000212c 	.word	0x0000212c
     95c:	00002070 	.word	0x00002070

00000960 <HandleClassRequest>:
     960:	e92d40f0 	push	{r4, r5, r6, r7, lr}
     964:	e5d03001 	ldrb	r3, [r0, #1]
     968:	e3530021 	cmp	r3, #33	; 0x21
     96c:	e24dd004 	sub	sp, sp, #4	; 0x4
     970:	e1a07001 	mov	r7, r1
     974:	e1a06002 	mov	r6, r2
     978:	0a000015 	beq	9d4 <HandleClassRequest+0x74>
     97c:	e3530022 	cmp	r3, #34	; 0x22
     980:	0a00001b 	beq	9f4 <HandleClassRequest+0x94>
     984:	e3530020 	cmp	r3, #32	; 0x20
     988:	13a00000 	movne	r0, #0	; 0x0
     98c:	1a00001c 	bne	a04 <HandleClassRequest+0xa4>
     990:	e59f4074 	ldr	r4, [pc, #116]	; a0c <HandleClassRequest+0xac>
     994:	e3a05007 	mov	r5, #7	; 0x7
     998:	e59f0070 	ldr	r0, [pc, #112]	; a10 <HandleClassRequest+0xb0>
     99c:	ebffff61 	bl	728 <puts>
     9a0:	e5961000 	ldr	r1, [r6]
     9a4:	e1a02005 	mov	r2, r5
     9a8:	e1a00004 	mov	r0, r4
     9ac:	eb000561 	bl	1f38 <memcpy>
     9b0:	e5875000 	str	r5, [r7]
     9b4:	e5d4c006 	ldrb	ip, [r4, #6]
     9b8:	e5d42004 	ldrb	r2, [r4, #4]
     9bc:	e5d43005 	ldrb	r3, [r4, #5]
     9c0:	e5941000 	ldr	r1, [r4]
     9c4:	e59f0048 	ldr	r0, [pc, #72]	; a14 <HandleClassRequest+0xb4>
     9c8:	e58dc000 	str	ip, [sp]
     9cc:	ebffff1f 	bl	650 <printf>
     9d0:	ea00000a 	b	a00 <HandleClassRequest+0xa0>
     9d4:	e59f003c 	ldr	r0, [pc, #60]	; a18 <HandleClassRequest+0xb8>
     9d8:	ebffff52 	bl	728 <puts>
     9dc:	e59f3028 	ldr	r3, [pc, #40]	; a0c <HandleClassRequest+0xac>
     9e0:	e3a00001 	mov	r0, #1	; 0x1
     9e4:	e5863000 	str	r3, [r6]
     9e8:	e3a03007 	mov	r3, #7	; 0x7
     9ec:	e5873000 	str	r3, [r7]
     9f0:	ea000003 	b	a04 <HandleClassRequest+0xa4>
     9f4:	e1d010b2 	ldrh	r1, [r0, #2]
     9f8:	e59f001c 	ldr	r0, [pc, #28]	; a1c <HandleClassRequest+0xbc>
     9fc:	ebffff13 	bl	650 <printf>
     a00:	e3a00001 	mov	r0, #1	; 0x1
     a04:	e28dd004 	add	sp, sp, #4	; 0x4
     a08:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
     a0c:	00          	.byte	0x00
     a0d:	02          	.byte	0x02
     a0e:	4000      	.short	0x4000
     a10:	0000213c 	.word	0x0000213c
     a14:	0000214c 	.word	0x0000214c
     a18:	00002188 	.word	0x00002188
     a1c:	00002198 	.word	0x00002198

00000a20 <VCOM_init>:
     a20:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     a24:	e59f002c 	ldr	r0, [pc, #44]	; a58 <VCOM_init+0x38>
     a28:	e59f102c 	ldr	r1, [pc, #44]	; a5c <VCOM_init+0x3c>
     a2c:	eb000053 	bl	b80 <fifo_init>
     a30:	e59f0028 	ldr	r0, [pc, #40]	; a60 <VCOM_init+0x40>
     a34:	e59f1028 	ldr	r1, [pc, #40]	; a64 <VCOM_init+0x44>
     a38:	eb000050 	bl	b80 <fifo_init>
     a3c:	e59f3024 	ldr	r3, [pc, #36]	; a68 <VCOM_init+0x48>
     a40:	e3a02000 	mov	r2, #0	; 0x0
     a44:	e5832000 	str	r2, [r3]
     a48:	e59f301c 	ldr	r3, [pc, #28]	; a6c <VCOM_init+0x4c>
     a4c:	e2822001 	add	r2, r2, #1	; 0x1
     a50:	e5832000 	str	r2, [r3]
     a54:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
     a58:	40000358 	.word	0x40000358
     a5c:	40000258 	.word	0x40000258
     a60:	40000364 	.word	0x40000364
     a64:	400002d8 	.word	0x400002d8
     a68:	40000250 	.word	0x40000250
     a6c:	40000254 	.word	0x40000254

00000a70 <main>:
     a70:	e92d4010 	push	{r4, lr}
     a74:	ebfffdcf 	bl	1b8 <HalSysInit>
     a78:	e3a00020 	mov	r0, #32	; 0x20
     a7c:	ebffff00 	bl	684 <ConsoleInit>
     a80:	e59f00d0 	ldr	r0, [pc, #208]	; b58 <main+0xe8>
     a84:	ebffff27 	bl	728 <puts>
     a88:	eb000492 	bl	1cd8 <USBInit>
     a8c:	e59f00c8 	ldr	r0, [pc, #200]	; b5c <main+0xec>
     a90:	eb000386 	bl	18b0 <USBRegisterDescriptors>
     a94:	e59f20c4 	ldr	r2, [pc, #196]	; b60 <main+0xf0>
     a98:	e3a00001 	mov	r0, #1	; 0x1
     a9c:	e59f10c0 	ldr	r1, [pc, #192]	; b64 <main+0xf4>
     aa0:	eb0002ae 	bl	1560 <USBRegisterRequestHandler>
     aa4:	e3a00081 	mov	r0, #129	; 0x81
     aa8:	e3a01000 	mov	r1, #0	; 0x0
     aac:	eb000283 	bl	14c0 <USBHwRegisterEPIntHandler>
     ab0:	e3a00082 	mov	r0, #130	; 0x82
     ab4:	e59f10ac 	ldr	r1, [pc, #172]	; b68 <main+0xf8>
     ab8:	eb000280 	bl	14c0 <USBHwRegisterEPIntHandler>
     abc:	e59f10a8 	ldr	r1, [pc, #168]	; b6c <main+0xfc>
     ac0:	e3a00005 	mov	r0, #5	; 0x5
     ac4:	eb00027d 	bl	14c0 <USBHwRegisterEPIntHandler>
     ac8:	e59f00a0 	ldr	r0, [pc, #160]	; b70 <main+0x100>
     acc:	eb000265 	bl	1468 <USBHwRegisterFrameHandler>
     ad0:	e59f009c 	ldr	r0, [pc, #156]	; b74 <main+0x104>
     ad4:	eb00026e 	bl	1494 <USBHwRegisterDevIntHandler>
     ad8:	ebffffd0 	bl	a20 <VCOM_init>
     adc:	e59f0094 	ldr	r0, [pc, #148]	; b78 <main+0x108>
     ae0:	ebffff10 	bl	728 <puts>
     ae4:	e3e02000 	mvn	r2, #0	; 0x0
     ae8:	e3a03036 	mov	r3, #54	; 0x36
     aec:	e5023dff 	str	r3, [r2, #-3583]
     af0:	e59f3084 	ldr	r3, [pc, #132]	; b7c <main+0x10c>
     af4:	e5023eff 	str	r3, [r2, #-3839]
     af8:	e5123ff3 	ldr	r3, [r2, #-4083]
     afc:	e3c33501 	bic	r3, r3, #4194304	; 0x400000
     b00:	e5023ff3 	str	r3, [r2, #-4083]
     b04:	e5123fef 	ldr	r3, [r2, #-4079]
     b08:	e3833501 	orr	r3, r3, #4194304	; 0x400000
     b0c:	e5023fef 	str	r3, [r2, #-4079]
     b10:	eb000072 	bl	ce0 <enableIRQ>
     b14:	e3a00001 	mov	r0, #1	; 0x1
     b18:	eb0000bf 	bl	e1c <USBHwConnect>
     b1c:	ebffff1b 	bl	790 <VCOM_getchar>
     b20:	e3700001 	cmn	r0, #1	; 0x1
     b24:	e1a04000 	mov	r4, r0
     b28:	e2403009 	sub	r3, r0, #9	; 0x9
     b2c:	e2402020 	sub	r2, r0, #32	; 0x20
     b30:	0afffff9 	beq	b1c <main+0xac>
     b34:	e350000d 	cmp	r0, #13	; 0xd
     b38:	13530001 	cmpne	r3, #1	; 0x1
     b3c:	9a000001 	bls	b48 <main+0xd8>
     b40:	e352005e 	cmp	r2, #94	; 0x5e
     b44:	83a0002e 	movhi	r0, #46	; 0x2e
     b48:	ebfffee0 	bl	6d0 <putchar>
     b4c:	e1a00004 	mov	r0, r4
     b50:	ebffff50 	bl	898 <VCOM_putchar>
     b54:	eafffff0 	b	b1c <main+0xac>
     b58:	000021b4 	.word	0x000021b4
     b5c:	00001fe0 	.word	0x00001fe0
     b60:	40000248 	.word	0x40000248
     b64:	00000960 	.word	0x00000960
     b68:	0000088c 	.word	0x0000088c
     b6c:	000008c0 	.word	0x000008c0
     b70:	00000850 	.word	0x00000850
     b74:	0000075c 	.word	0x0000075c
     b78:	000021cc 	.word	0x000021cc
     b7c:	00000774 	.word	0x00000774

00000b80 <fifo_init>:
     b80:	e3a03000 	mov	r3, #0	; 0x0
     b84:	e5801008 	str	r1, [r0, #8]
     b88:	e5803004 	str	r3, [r0, #4]
     b8c:	e5803000 	str	r3, [r0]
     b90:	e12fff1e 	bx	lr

00000b94 <fifo_put>:
     b94:	e590c000 	ldr	ip, [r0]
     b98:	e59f203c 	ldr	r2, [pc, #60]	; bdc <fifo_put+0x48>
     b9c:	e28c3001 	add	r3, ip, #1	; 0x1
     ba0:	e0032002 	and	r2, r3, r2
     ba4:	e3520000 	cmp	r2, #0	; 0x0
     ba8:	b2422001 	sublt	r2, r2, #1	; 0x1
     bac:	b1e02c82 	mvnlt	r2, r2, lsl #25
     bb0:	e5903004 	ldr	r3, [r0, #4]
     bb4:	b1e02ca2 	mvnlt	r2, r2, lsr #25
     bb8:	b2822001 	addlt	r2, r2, #1	; 0x1
     bbc:	e1520003 	cmp	r2, r3
     bc0:	15903008 	ldrne	r3, [r0, #8]
     bc4:	e20110ff 	and	r1, r1, #255	; 0xff
     bc8:	17c3100c 	strbne	r1, [r3, ip]
     bcc:	03a00000 	moveq	r0, #0	; 0x0
     bd0:	15802000 	strne	r2, [r0]
     bd4:	13a00001 	movne	r0, #1	; 0x1
     bd8:	e12fff1e 	bx	lr
     bdc:	8000007f 	.word	0x8000007f

00000be0 <fifo_get>:
     be0:	e5903000 	ldr	r3, [r0]
     be4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     be8:	e590e004 	ldr	lr, [r0, #4]
     bec:	e153000e 	cmp	r3, lr
     bf0:	03a00000 	moveq	r0, #0	; 0x0
     bf4:	049df004 	popeq	{pc}		; (ldreq pc, [sp], #4)
     bf8:	e59fc030 	ldr	ip, [pc, #48]	; c30 <fifo_get+0x50>
     bfc:	e28e2001 	add	r2, lr, #1	; 0x1
     c00:	e002c00c 	and	ip, r2, ip
     c04:	e35c0000 	cmp	ip, #0	; 0x0
     c08:	b24cc001 	sublt	ip, ip, #1	; 0x1
     c0c:	e5903008 	ldr	r3, [r0, #8]
     c10:	b1e0cc8c 	mvnlt	ip, ip, lsl #25
     c14:	e7d3300e 	ldrb	r3, [r3, lr]
     c18:	b1e0ccac 	mvnlt	ip, ip, lsr #25
     c1c:	b28cc001 	addlt	ip, ip, #1	; 0x1
     c20:	e5c13000 	strb	r3, [r1]
     c24:	e580c004 	str	ip, [r0, #4]
     c28:	e3a00001 	mov	r0, #1	; 0x1
     c2c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
     c30:	8000007f 	.word	0x8000007f

00000c34 <fifo_avail>:
     c34:	e5903000 	ldr	r3, [r0]
     c38:	e5902004 	ldr	r2, [r0, #4]
     c3c:	e2833080 	add	r3, r3, #128	; 0x80
     c40:	e59f001c 	ldr	r0, [pc, #28]	; c64 <fifo_avail+0x30>
     c44:	e0623003 	rsb	r3, r2, r3
     c48:	e0030000 	and	r0, r3, r0
     c4c:	e3500000 	cmp	r0, #0	; 0x0
     c50:	b2400001 	sublt	r0, r0, #1	; 0x1
     c54:	b1e00c80 	mvnlt	r0, r0, lsl #25
     c58:	b1e00ca0 	mvnlt	r0, r0, lsr #25
     c5c:	b2800001 	addlt	r0, r0, #1	; 0x1
     c60:	e12fff1e 	bx	lr
     c64:	8000007f 	.word	0x8000007f

00000c68 <fifo_free>:
     c68:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     c6c:	ebfffff0 	bl	c34 <fifo_avail>
     c70:	e260007f 	rsb	r0, r0, #127	; 0x7f
     c74:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00000c78 <restoreIRQ>:
     c78:	e10f2000 	mrs	r2, CPSR
     c7c:	e2000080 	and	r0, r0, #128	; 0x80
     c80:	e3c23080 	bic	r3, r2, #128	; 0x80
     c84:	e1833000 	orr	r3, r3, r0
     c88:	e129f003 	msr	CPSR_fc, r3
     c8c:	e1a00002 	mov	r0, r2
     c90:	e12fff1e 	bx	lr

00000c94 <restoreFIQ>:
     c94:	e10f2000 	mrs	r2, CPSR
     c98:	e2000040 	and	r0, r0, #64	; 0x40
     c9c:	e3c23040 	bic	r3, r2, #64	; 0x40
     ca0:	e1833000 	orr	r3, r3, r0
     ca4:	e129f003 	msr	CPSR_fc, r3
     ca8:	e1a00002 	mov	r0, r2
     cac:	e12fff1e 	bx	lr

00000cb0 <disableFIQ>:
     cb0:	e10f0000 	mrs	r0, CPSR
     cb4:	e3803040 	orr	r3, r0, #64	; 0x40
     cb8:	e129f003 	msr	CPSR_fc, r3
     cbc:	e12fff1e 	bx	lr

00000cc0 <enableFIQ>:
     cc0:	e10f0000 	mrs	r0, CPSR
     cc4:	e3c03040 	bic	r3, r0, #64	; 0x40
     cc8:	e129f003 	msr	CPSR_fc, r3
     ccc:	e12fff1e 	bx	lr

00000cd0 <disableIRQ>:
     cd0:	e10f0000 	mrs	r0, CPSR
     cd4:	e3803080 	orr	r3, r0, #128	; 0x80
     cd8:	e129f003 	msr	CPSR_fc, r3
     cdc:	e12fff1e 	bx	lr

00000ce0 <enableIRQ>:
     ce0:	e10f0000 	mrs	r0, CPSR
     ce4:	e3c03080 	bic	r3, r0, #128	; 0x80
     ce8:	e129f003 	msr	CPSR_fc, r3
     cec:	e12fff1e 	bx	lr

00000cf0 <USBHwCmd>:
     cf0:	e1a00800 	lsl	r0, r0, #16
     cf4:	e59f2028 	ldr	r2, [pc, #40]	; d24 <USBHwCmd+0x34>
     cf8:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
     cfc:	e3800c05 	orr	r0, r0, #1280	; 0x500
     d00:	e3a03030 	mov	r3, #48	; 0x30
     d04:	e5023df7 	str	r3, [r2, #-3575]
     d08:	e5020def 	str	r0, [r2, #-3567]
     d0c:	e5123dff 	ldr	r3, [r2, #-3583]
     d10:	e2033010 	and	r3, r3, #16	; 0x10
     d14:	e3530010 	cmp	r3, #16	; 0x10
     d18:	1afffffb 	bne	d0c <USBHwCmd+0x1c>
     d1c:	e5023df7 	str	r3, [r2, #-3575]
     d20:	e12fff1e 	bx	lr
     d24:	ffe0cfff 	.word	0xffe0cfff

00000d28 <USBHwCmdWrite>:
     d28:	e92d4010 	push	{r4, lr}
     d2c:	e1a04801 	lsl	r4, r1, #16
     d30:	e20000ff 	and	r0, r0, #255	; 0xff
     d34:	e1a04824 	lsr	r4, r4, #16
     d38:	ebffffec 	bl	cf0 <USBHwCmd>
     d3c:	e1a04804 	lsl	r4, r4, #16
     d40:	e59f3020 	ldr	r3, [pc, #32]	; d68 <USBHwCmdWrite+0x40>
     d44:	e3844c01 	orr	r4, r4, #256	; 0x100
     d48:	e5034def 	str	r4, [r3, #-3567]
     d4c:	e1a02003 	mov	r2, r3
     d50:	e5123dff 	ldr	r3, [r2, #-3583]
     d54:	e2033010 	and	r3, r3, #16	; 0x10
     d58:	e3530010 	cmp	r3, #16	; 0x10
     d5c:	1afffffb 	bne	d50 <USBHwCmdWrite+0x28>
     d60:	e5023df7 	str	r3, [r2, #-3575]
     d64:	e8bd8010 	pop	{r4, pc}
     d68:	ffe0cfff 	.word	0xffe0cfff

00000d6c <USBHwCmdRead>:
     d6c:	e92d4010 	push	{r4, lr}
     d70:	e20040ff 	and	r4, r0, #255	; 0xff
     d74:	e1a00004 	mov	r0, r4
     d78:	ebffffdc 	bl	cf0 <USBHwCmd>
     d7c:	e1a04804 	lsl	r4, r4, #16
     d80:	e59f3028 	ldr	r3, [pc, #40]	; db0 <USBHwCmdRead+0x44>
     d84:	e3844c02 	orr	r4, r4, #512	; 0x200
     d88:	e5034def 	str	r4, [r3, #-3567]
     d8c:	e1a02003 	mov	r2, r3
     d90:	e5123dff 	ldr	r3, [r2, #-3583]
     d94:	e2033020 	and	r3, r3, #32	; 0x20
     d98:	e3530020 	cmp	r3, #32	; 0x20
     d9c:	1afffffb 	bne	d90 <USBHwCmdRead+0x24>
     da0:	e5023df7 	str	r3, [r2, #-3575]
     da4:	e5120deb 	ldr	r0, [r2, #-3563]
     da8:	e20000ff 	and	r0, r0, #255	; 0xff
     dac:	e8bd8010 	pop	{r4, pc}
     db0:	ffe0cfff 	.word	0xffe0cfff

00000db4 <USBHwEPConfig>:
     db4:	e59fc04c 	ldr	ip, [pc, #76]	; e08 <USBHwEPConfig+0x54>
     db8:	e200300f 	and	r3, r0, #15	; 0xf
     dbc:	e51c2dbb 	ldr	r2, [ip, #-3515]
     dc0:	e1a03083 	lsl	r3, r3, #1
     dc4:	e2000080 	and	r0, r0, #128	; 0x80
     dc8:	e18303a0 	orr	r0, r3, r0, lsr #7
     dcc:	e3a03001 	mov	r3, #1	; 0x1
     dd0:	e1822013 	orr	r2, r2, r3, lsl r0
     dd4:	e1a01801 	lsl	r1, r1, #16
     dd8:	e1a01821 	lsr	r1, r1, #16
     ddc:	e50c2dbb 	str	r2, [ip, #-3515]
     de0:	e50c0db7 	str	r0, [ip, #-3511]
     de4:	e50c1db3 	str	r1, [ip, #-3507]
     de8:	e51c3dff 	ldr	r3, [ip, #-3583]
     dec:	e2033c01 	and	r3, r3, #256	; 0x100
     df0:	e3530c01 	cmp	r3, #256	; 0x100
     df4:	1afffffb 	bne	de8 <USBHwEPConfig+0x34>
     df8:	e3800040 	orr	r0, r0, #64	; 0x40
     dfc:	e3a01000 	mov	r1, #0	; 0x0
     e00:	e50c3df7 	str	r3, [ip, #-3575]
     e04:	eaffffc7 	b	d28 <USBHwCmdWrite>
     e08:	ffe0cfff 	.word	0xffe0cfff

00000e0c <USBHwSetAddress>:
     e0c:	e200107f 	and	r1, r0, #127	; 0x7f
     e10:	e3811080 	orr	r1, r1, #128	; 0x80
     e14:	e3a000d0 	mov	r0, #208	; 0xd0
     e18:	eaffffc2 	b	d28 <USBHwCmdWrite>

00000e1c <USBHwConnect>:
     e1c:	e3500000 	cmp	r0, #0	; 0x0
     e20:	159f3020 	ldrne	r3, [pc, #32]	; e48 <USBHwConnect+0x2c>
     e24:	059f301c 	ldreq	r3, [pc, #28]	; e48 <USBHwConnect+0x2c>
     e28:	13a02c02 	movne	r2, #512	; 0x200
     e2c:	03a02c02 	moveq	r2, #512	; 0x200
     e30:	15032fa3 	strne	r2, [r3, #-4003]
     e34:	05032fa7 	streq	r2, [r3, #-4007]
     e38:	e2501000 	subs	r1, r0, #0	; 0x0
     e3c:	13a01001 	movne	r1, #1	; 0x1
     e40:	e3a000fe 	mov	r0, #254	; 0xfe
     e44:	eaffffb7 	b	d28 <USBHwCmdWrite>
     e48:	3fffcfff 	.word	0x3fffcfff

00000e4c <USBHwNakIntEnable>:
     e4c:	e20010ff 	and	r1, r0, #255	; 0xff
     e50:	e3a000f3 	mov	r0, #243	; 0xf3
     e54:	eaffffb3 	b	d28 <USBHwCmdWrite>

00000e58 <USBHwEPGetStatus>:
     e58:	e1a03000 	mov	r3, r0
     e5c:	e200000f 	and	r0, r0, #15	; 0xf
     e60:	e2033080 	and	r3, r3, #128	; 0x80
     e64:	e1a00080 	lsl	r0, r0, #1
     e68:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e6c:	e18003a3 	orr	r0, r0, r3, lsr #7
     e70:	ebffffbd 	bl	d6c <USBHwCmdRead>
     e74:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00000e78 <USBHwEPStall>:
     e78:	e200300f 	and	r3, r0, #15	; 0xf
     e7c:	e1a03083 	lsl	r3, r3, #1
     e80:	e2000080 	and	r0, r0, #128	; 0x80
     e84:	e18333a0 	orr	r3, r3, r0, lsr #7
     e88:	e2511000 	subs	r1, r1, #0	; 0x0
     e8c:	13a01001 	movne	r1, #1	; 0x1
     e90:	e3830040 	orr	r0, r3, #64	; 0x40
     e94:	eaffffa3 	b	d28 <USBHwCmdWrite>

00000e98 <USBHwEPWrite>:
     e98:	e92d40f0 	push	{r4, r5, r6, r7, lr}
     e9c:	e59fc07c 	ldr	ip, [pc, #124]	; f20 <USBHwEPWrite+0x88>
     ea0:	e200500f 	and	r5, r0, #15	; 0xf
     ea4:	e1a03105 	lsl	r3, r5, #2
     ea8:	e3833002 	orr	r3, r3, #2	; 0x2
     eac:	e1a06002 	mov	r6, r2
     eb0:	e1a0e001 	mov	lr, r1
     eb4:	e1a0400c 	mov	r4, ip
     eb8:	e20070ff 	and	r7, r0, #255	; 0xff
     ebc:	e50c3dd7 	str	r3, [ip, #-3543]
     ec0:	e50c2ddb 	str	r2, [ip, #-3547]
     ec4:	ea000008 	b	eec <USBHwEPWrite+0x54>
     ec8:	e55e3002 	ldrb	r3, [lr, #-2]
     ecc:	e55e2001 	ldrb	r2, [lr, #-1]
     ed0:	e55e1004 	ldrb	r1, [lr, #-4]
     ed4:	e1a03803 	lsl	r3, r3, #16
     ed8:	e1833c02 	orr	r3, r3, r2, lsl #24
     edc:	e55e2003 	ldrb	r2, [lr, #-3]
     ee0:	e1833001 	orr	r3, r3, r1
     ee4:	e1833402 	orr	r3, r3, r2, lsl #8
     ee8:	e5003de3 	str	r3, [r0, #-3555]
     eec:	e5143dd7 	ldr	r3, [r4, #-3543]
     ef0:	e2133002 	ands	r3, r3, #2	; 0x2
     ef4:	e28ee004 	add	lr, lr, #4	; 0x4
     ef8:	e1a00004 	mov	r0, r4
     efc:	1afffff1 	bne	ec8 <USBHwEPWrite+0x30>
     f00:	e1a00085 	lsl	r0, r5, #1
     f04:	e18003a7 	orr	r0, r0, r7, lsr #7
     f08:	e5043dd7 	str	r3, [r4, #-3543]
     f0c:	ebffff77 	bl	cf0 <USBHwCmd>
     f10:	e3a000fa 	mov	r0, #250	; 0xfa
     f14:	ebffff75 	bl	cf0 <USBHwCmd>
     f18:	e1a00006 	mov	r0, r6
     f1c:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
     f20:	ffe0cfff 	.word	0xffe0cfff

00000f24 <USBHwEPRead>:
     f24:	e92d4030 	push	{r4, r5, lr}
     f28:	e200e00f 	and	lr, r0, #15	; 0xf
     f2c:	e59fc088 	ldr	ip, [pc, #136]	; fbc <USBHwEPRead+0x98>
     f30:	e1a0310e 	lsl	r3, lr, #2
     f34:	e3833001 	orr	r3, r3, #1	; 0x1
     f38:	e50c3dd7 	str	r3, [ip, #-3543]
     f3c:	e20050ff 	and	r5, r0, #255	; 0xff
     f40:	e51c3ddf 	ldr	r3, [ip, #-3551]
     f44:	e3130b02 	tst	r3, #2048	; 0x800
     f48:	0afffffc 	beq	f40 <USBHwEPRead+0x1c>
     f4c:	e3130b01 	tst	r3, #1024	; 0x400
     f50:	03e04000 	mvneq	r4, #0	; 0x0
     f54:	0a000016 	beq	fb4 <USBHwEPRead+0x90>
     f58:	e1a03b03 	lsl	r3, r3, #22
     f5c:	e3a04000 	mov	r4, #0	; 0x0
     f60:	e59fc054 	ldr	ip, [pc, #84]	; fbc <USBHwEPRead+0x98>
     f64:	e1a03b23 	lsr	r3, r3, #22
     f68:	e1a00004 	mov	r0, r4
     f6c:	ea000006 	b	f8c <USBHwEPRead+0x68>
     f70:	e3140003 	tst	r4, #3	; 0x3
     f74:	051c0de7 	ldreq	r0, [ip, #-3559]
     f78:	e3510000 	cmp	r1, #0	; 0x0
     f7c:	11540002 	cmpne	r4, r2
     f80:	b7c40001 	strblt	r0, [r4, r1]
     f84:	e2844001 	add	r4, r4, #1	; 0x1
     f88:	e1a00420 	lsr	r0, r0, #8
     f8c:	e1540003 	cmp	r4, r3
     f90:	1afffff6 	bne	f70 <USBHwEPRead+0x4c>
     f94:	e59f3020 	ldr	r3, [pc, #32]	; fbc <USBHwEPRead+0x98>
     f98:	e1a0008e 	lsl	r0, lr, #1
     f9c:	e3a02000 	mov	r2, #0	; 0x0
     fa0:	e18003a5 	orr	r0, r0, r5, lsr #7
     fa4:	e5032dd7 	str	r2, [r3, #-3543]
     fa8:	ebffff50 	bl	cf0 <USBHwCmd>
     fac:	e3a000f2 	mov	r0, #242	; 0xf2
     fb0:	ebffff4e 	bl	cf0 <USBHwCmd>
     fb4:	e1a00004 	mov	r0, r4
     fb8:	e8bd8030 	pop	{r4, r5, pc}
     fbc:	ffe0cfff 	.word	0xffe0cfff

00000fc0 <USBHwISOCEPRead>:
     fc0:	e92d4030 	push	{r4, r5, lr}
     fc4:	e200e00f 	and	lr, r0, #15	; 0xf
     fc8:	e1a0310e 	lsl	r3, lr, #2
     fcc:	e59fc08c 	ldr	ip, [pc, #140]	; 1060 <USBHwISOCEPRead+0xa0>
     fd0:	e3833001 	orr	r3, r3, #1	; 0x1
     fd4:	e50c3dd7 	str	r3, [ip, #-3543]
     fd8:	e20050ff 	and	r5, r0, #255	; 0xff
     fdc:	e1a00000 	nop			(mov r0,r0)
     fe0:	e51c3ddf 	ldr	r3, [ip, #-3551]
     fe4:	e2130b02 	ands	r0, r3, #2048	; 0x800
     fe8:	0a000001 	beq	ff4 <USBHwISOCEPRead+0x34>
     fec:	e2130b01 	ands	r0, r3, #1024	; 0x400
     ff0:	1a000002 	bne	1000 <USBHwISOCEPRead+0x40>
     ff4:	e3e04000 	mvn	r4, #0	; 0x0
     ff8:	e50c0dd7 	str	r0, [ip, #-3543]
     ffc:	ea000015 	b	1058 <USBHwISOCEPRead+0x98>
    1000:	e1a03b03 	lsl	r3, r3, #22
    1004:	e3a04000 	mov	r4, #0	; 0x0
    1008:	e1a03b23 	lsr	r3, r3, #22
    100c:	e1a00004 	mov	r0, r4
    1010:	ea000006 	b	1030 <USBHwISOCEPRead+0x70>
    1014:	e3140003 	tst	r4, #3	; 0x3
    1018:	051c0de7 	ldreq	r0, [ip, #-3559]
    101c:	e3510000 	cmp	r1, #0	; 0x0
    1020:	11540002 	cmpne	r4, r2
    1024:	b7c40001 	strblt	r0, [r4, r1]
    1028:	e2844001 	add	r4, r4, #1	; 0x1
    102c:	e1a00420 	lsr	r0, r0, #8
    1030:	e1540003 	cmp	r4, r3
    1034:	1afffff6 	bne	1014 <USBHwISOCEPRead+0x54>
    1038:	e59f3020 	ldr	r3, [pc, #32]	; 1060 <USBHwISOCEPRead+0xa0>
    103c:	e1a0008e 	lsl	r0, lr, #1
    1040:	e3a02000 	mov	r2, #0	; 0x0
    1044:	e18003a5 	orr	r0, r0, r5, lsr #7
    1048:	e5032dd7 	str	r2, [r3, #-3543]
    104c:	ebffff27 	bl	cf0 <USBHwCmd>
    1050:	e3a000f2 	mov	r0, #242	; 0xf2
    1054:	ebffff25 	bl	cf0 <USBHwCmd>
    1058:	e1a00004 	mov	r0, r4
    105c:	e8bd8030 	pop	{r4, r5, pc}
    1060:	ffe0cfff 	.word	0xffe0cfff

00001064 <USBHwConfigDevice>:
    1064:	e2501000 	subs	r1, r0, #0	; 0x0
    1068:	13a01001 	movne	r1, #1	; 0x1
    106c:	e3a000d8 	mov	r0, #216	; 0xd8
    1070:	eaffff2c 	b	d28 <USBHwCmdWrite>

00001074 <USBHwISR>:
    1074:	e59f3144 	ldr	r3, [pc, #324]	; 11c0 <USBHwISR+0x14c>
    1078:	e3a02002 	mov	r2, #2	; 0x2
    107c:	e5032fa7 	str	r2, [r3, #-4007]
    1080:	e59f213c 	ldr	r2, [pc, #316]	; 11c4 <USBHwISR+0x150>
    1084:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
    1088:	e5126dff 	ldr	r6, [r2, #-3583]
    108c:	e3160001 	tst	r6, #1	; 0x1
    1090:	0a00000b 	beq	10c4 <USBHwISR+0x50>
    1094:	e59f312c 	ldr	r3, [pc, #300]	; 11c8 <USBHwISR+0x154>
    1098:	e5934000 	ldr	r4, [r3]
    109c:	e3a03001 	mov	r3, #1	; 0x1
    10a0:	e3540000 	cmp	r4, #0	; 0x0
    10a4:	e5023df7 	str	r3, [r2, #-3575]
    10a8:	0a000005 	beq	10c4 <USBHwISR+0x50>
    10ac:	e3a000f5 	mov	r0, #245	; 0xf5
    10b0:	ebffff2d 	bl	d6c <USBHwCmdRead>
    10b4:	e1a00800 	lsl	r0, r0, #16
    10b8:	e1a00820 	lsr	r0, r0, #16
    10bc:	e1a0e00f 	mov	lr, pc
    10c0:	e12fff14 	bx	r4
    10c4:	e3160008 	tst	r6, #8	; 0x8
    10c8:	0a000011 	beq	1114 <USBHwISR+0xa0>
    10cc:	e59f30f0 	ldr	r3, [pc, #240]	; 11c4 <USBHwISR+0x150>
    10d0:	e3a02008 	mov	r2, #8	; 0x8
    10d4:	e3a000fe 	mov	r0, #254	; 0xfe
    10d8:	e5032df7 	str	r2, [r3, #-3575]
    10dc:	ebffff22 	bl	d6c <USBHwCmdRead>
    10e0:	e310001a 	tst	r0, #26	; 0x1a
    10e4:	0a00000a 	beq	1114 <USBHwISR+0xa0>
    10e8:	e59f30dc 	ldr	r3, [pc, #220]	; 11cc <USBHwISR+0x158>
    10ec:	e5933000 	ldr	r3, [r3]
    10f0:	e3530000 	cmp	r3, #0	; 0x0
    10f4:	0a000006 	beq	1114 <USBHwISR+0xa0>
    10f8:	e59f50c0 	ldr	r5, [pc, #192]	; 11c0 <USBHwISR+0x14c>
    10fc:	e3a04001 	mov	r4, #1	; 0x1
    1100:	e5054fa7 	str	r4, [r5, #-4007]
    1104:	e2000015 	and	r0, r0, #21	; 0x15
    1108:	e1a0e00f 	mov	lr, pc
    110c:	e12fff13 	bx	r3
    1110:	e5054fa3 	str	r4, [r5, #-4003]
    1114:	e3160004 	tst	r6, #4	; 0x4
    1118:	0a000024 	beq	11b0 <USBHwISR+0x13c>
    111c:	e59f30a0 	ldr	r3, [pc, #160]	; 11c4 <USBHwISR+0x150>
    1120:	e3a02004 	mov	r2, #4	; 0x4
    1124:	e5032df7 	str	r2, [r3, #-3575]
    1128:	e59fa0a0 	ldr	sl, [pc, #160]	; 11d0 <USBHwISR+0x15c>
    112c:	e59f708c 	ldr	r7, [pc, #140]	; 11c0 <USBHwISR+0x14c>
    1130:	e1a05003 	mov	r5, r3
    1134:	e1a06002 	mov	r6, r2
    1138:	e3a04000 	mov	r4, #0	; 0x0
    113c:	e3a08001 	mov	r8, #1	; 0x1
    1140:	e1a02418 	lsl	r2, r8, r4
    1144:	e5153dcf 	ldr	r3, [r5, #-3535]
    1148:	e1120003 	tst	r2, r3
    114c:	0a000014 	beq	11a4 <USBHwISR+0x130>
    1150:	e5052dc7 	str	r2, [r5, #-3527]
    1154:	e5153dff 	ldr	r3, [r5, #-3583]
    1158:	e2032020 	and	r2, r3, #32	; 0x20
    115c:	e3520020 	cmp	r2, #32	; 0x20
    1160:	1afffffb 	bne	1154 <USBHwISR+0xe0>
    1164:	e0843fa4 	add	r3, r4, r4, lsr #31
    1168:	e1a030c3 	asr	r3, r3, #1
    116c:	e79a3103 	ldr	r3, [sl, r3, lsl #2]
    1170:	e5052df7 	str	r2, [r5, #-3575]
    1174:	e3530000 	cmp	r3, #0	; 0x0
    1178:	e5151deb 	ldr	r1, [r5, #-3563]
    117c:	0a000008 	beq	11a4 <USBHwISR+0x130>
    1180:	e1a000c4 	asr	r0, r4, #1
    1184:	e200000f 	and	r0, r0, #15	; 0xf
    1188:	e1800384 	orr	r0, r0, r4, lsl #7
    118c:	e5076fa7 	str	r6, [r7, #-4007]
    1190:	e200008f 	and	r0, r0, #143	; 0x8f
    1194:	e201101f 	and	r1, r1, #31	; 0x1f
    1198:	e1a0e00f 	mov	lr, pc
    119c:	e12fff13 	bx	r3
    11a0:	e5076fa3 	str	r6, [r7, #-4003]
    11a4:	e2844001 	add	r4, r4, #1	; 0x1
    11a8:	e3540020 	cmp	r4, #32	; 0x20
    11ac:	1affffe3 	bne	1140 <USBHwISR+0xcc>
    11b0:	e59f3008 	ldr	r3, [pc, #8]	; 11c0 <USBHwISR+0x14c>
    11b4:	e3a02002 	mov	r2, #2	; 0x2
    11b8:	e5032fa3 	str	r2, [r3, #-4003]
    11bc:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
    11c0:	3fffcfff 	.word	0x3fffcfff
    11c4:	ffe0cfff 	.word	0xffe0cfff
    11c8:	40000370 	.word	0x40000370
    11cc:	40000374 	.word	0x40000374
    11d0:	40000378 	.word	0x40000378

000011d4 <USBHwInit>:
    11d4:	e59f2120 	ldr	r2, [pc, #288]	; 12fc <USBHwInit+0x128>
    11d8:	e5923004 	ldr	r3, [r2, #4]
    11dc:	e3c3330f 	bic	r3, r3, #1006632960	; 0x3c000000
    11e0:	e3833305 	orr	r3, r3, #335544320	; 0x14000000
    11e4:	e5823004 	str	r3, [r2, #4]
    11e8:	e592300c 	ldr	r3, [r2, #12]
    11ec:	e3c33203 	bic	r3, r3, #805306368	; 0x30000000
    11f0:	e3c33030 	bic	r3, r3, #48	; 0x30
    11f4:	e3833202 	orr	r3, r3, #536870912	; 0x20000000
    11f8:	e3833010 	orr	r3, r3, #16	; 0x10
    11fc:	e582300c 	str	r3, [r2, #12]
    1200:	e5923010 	ldr	r3, [r2, #16]
    1204:	e3c33703 	bic	r3, r3, #786432	; 0xc0000
    1208:	e5823010 	str	r3, [r2, #16]
    120c:	e59f20ec 	ldr	r2, [pc, #236]	; 1300 <USBHwInit+0x12c>
    1210:	e5123fbf 	ldr	r3, [r2, #-4031]
    1214:	e3833c02 	orr	r3, r3, #512	; 0x200
    1218:	e5023fbf 	str	r3, [r2, #-4031]
    121c:	e3a03c02 	mov	r3, #512	; 0x200
    1220:	e5023fa7 	str	r3, [r2, #-4007]
    1224:	e59f20d8 	ldr	r2, [pc, #216]	; 1304 <USBHwInit+0x130>
    1228:	e59230c4 	ldr	r3, [r2, #196]
    122c:	e92d4010 	push	{r4, lr}
    1230:	e3833102 	orr	r3, r3, #-2147483648	; 0x80000000
    1234:	e58230c4 	str	r3, [r2, #196]
    1238:	e59f10c8 	ldr	r1, [pc, #200]	; 1308 <USBHwInit+0x134>
    123c:	e3a03005 	mov	r3, #5	; 0x5
    1240:	e5823108 	str	r3, [r2, #264]
    1244:	e283300d 	add	r3, r3, #13	; 0xd
    1248:	e501300b 	str	r3, [r1, #-11]
    124c:	e5113007 	ldr	r3, [r1, #-7]
    1250:	e3130012 	tst	r3, #18	; 0x12
    1254:	0afffffc 	beq	124c <USBHwInit+0x78>
    1258:	e3a04000 	mov	r4, #0	; 0x0
    125c:	e3e03000 	mvn	r3, #0	; 0x0
    1260:	e5014dfb 	str	r4, [r1, #-3579]
    1264:	e1a00004 	mov	r0, r4
    1268:	e5013df7 	str	r3, [r1, #-3575]
    126c:	e5014dd3 	str	r4, [r1, #-3539]
    1270:	e5014dcb 	str	r4, [r1, #-3531]
    1274:	e5013dc7 	str	r3, [r1, #-3527]
    1278:	e5014dbf 	str	r4, [r1, #-3519]
    127c:	ebfffef2 	bl	e4c <USBHwNakIntEnable>
    1280:	e59f107c 	ldr	r1, [pc, #124]	; 1304 <USBHwInit+0x130>
    1284:	e59131a0 	ldr	r3, [r1, #416]
    1288:	e59fc06c 	ldr	ip, [pc, #108]	; 12fc <USBHwInit+0x128>
    128c:	e3833001 	orr	r3, r3, #1	; 0x1
    1290:	e58131a0 	str	r3, [r1, #416]
    1294:	e59f2064 	ldr	r2, [pc, #100]	; 1300 <USBHwInit+0x12c>
    1298:	e58c4028 	str	r4, [ip, #40]
    129c:	e5123fbf 	ldr	r3, [r2, #-4031]
    12a0:	e3a00001 	mov	r0, #1	; 0x1
    12a4:	e3833001 	orr	r3, r3, #1	; 0x1
    12a8:	e5023fbf 	str	r3, [r2, #-4031]
    12ac:	e5020fa3 	str	r0, [r2, #-4003]
    12b0:	e59131a0 	ldr	r3, [r1, #416]
    12b4:	e1833000 	orr	r3, r3, r0
    12b8:	e58131a0 	str	r3, [r1, #416]
    12bc:	e58c4028 	str	r4, [ip, #40]
    12c0:	e5123fbf 	ldr	r3, [r2, #-4031]
    12c4:	e3833002 	orr	r3, r3, #2	; 0x2
    12c8:	e5023fbf 	str	r3, [r2, #-4031]
    12cc:	e3a03002 	mov	r3, #2	; 0x2
    12d0:	e5023fa3 	str	r3, [r2, #-4003]
    12d4:	e59131a0 	ldr	r3, [r1, #416]
    12d8:	e1833000 	orr	r3, r3, r0
    12dc:	e58131a0 	str	r3, [r1, #416]
    12e0:	e58c4028 	str	r4, [ip, #40]
    12e4:	e5123fbf 	ldr	r3, [r2, #-4031]
    12e8:	e3833004 	orr	r3, r3, #4	; 0x4
    12ec:	e5023fbf 	str	r3, [r2, #-4031]
    12f0:	e3a03004 	mov	r3, #4	; 0x4
    12f4:	e5023fa3 	str	r3, [r2, #-4003]
    12f8:	e8bd8010 	pop	{r4, pc}
    12fc:	e002c000 	.word	0xe002c000
    1300:	3fffcfff 	.word	0x3fffcfff
    1304:	e01fc000 	.word	0xe01fc000
    1308:	ffe0cfff 	.word	0xffe0cfff

0000130c <USBSetupDMADescriptor>:
    130c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1310:	e3a0e000 	mov	lr, #0	; 0x0
    1314:	e580e004 	str	lr, [r0, #4]
    1318:	e5801000 	str	r1, [r0]
    131c:	e1a0c001 	mov	ip, r1
    1320:	e1a03b03 	lsl	r3, r3, #22
    1324:	e5901004 	ldr	r1, [r0, #4]
    1328:	e1a03b23 	lsr	r3, r3, #22
    132c:	e1811283 	orr	r1, r1, r3, lsl #5
    1330:	e5801004 	str	r1, [r0, #4]
    1334:	e1dd10b4 	ldrh	r1, [sp, #4]
    1338:	e5903004 	ldr	r3, [r0, #4]
    133c:	e1833801 	orr	r3, r3, r1, lsl #16
    1340:	e5803004 	str	r3, [r0, #4]
    1344:	e21220ff 	ands	r2, r2, #255	; 0xff
    1348:	15903004 	ldrne	r3, [r0, #4]
    134c:	13833010 	orrne	r3, r3, #16	; 0x10
    1350:	15803004 	strne	r3, [r0, #4]
    1354:	e35c0000 	cmp	ip, #0	; 0x0
    1358:	15903004 	ldrne	r3, [r0, #4]
    135c:	e59d100c 	ldr	r1, [sp, #12]
    1360:	13833004 	orrne	r3, r3, #4	; 0x4
    1364:	15803004 	strne	r3, [r0, #4]
    1368:	e59d3008 	ldr	r3, [sp, #8]
    136c:	e3520000 	cmp	r2, #0	; 0x0
    1370:	13510000 	cmpne	r1, #0	; 0x0
    1374:	e5803008 	str	r3, [r0, #8]
    1378:	15801010 	strne	r1, [r0, #16]
    137c:	e580e00c 	str	lr, [r0, #12]
    1380:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00001384 <USBDisableDMAForEndpoint>:
    1384:	e200200f 	and	r2, r0, #15	; 0xf
    1388:	e1a02082 	lsl	r2, r2, #1
    138c:	e2000080 	and	r0, r0, #128	; 0x80
    1390:	e18223a0 	orr	r2, r2, r0, lsr #7
    1394:	e3a03001 	mov	r3, #1	; 0x1
    1398:	e1a03213 	lsl	r3, r3, r2
    139c:	e59f2004 	ldr	r2, [pc, #4]	; 13a8 <USBDisableDMAForEndpoint+0x24>
    13a0:	e5023d73 	str	r3, [r2, #-3443]
    13a4:	e12fff1e 	bx	lr
    13a8:	ffe0cfff 	.word	0xffe0cfff

000013ac <USBEnableDMAForEndpoint>:
    13ac:	e200200f 	and	r2, r0, #15	; 0xf
    13b0:	e1a02082 	lsl	r2, r2, #1
    13b4:	e2000080 	and	r0, r0, #128	; 0x80
    13b8:	e18223a0 	orr	r2, r2, r0, lsr #7
    13bc:	e3a03001 	mov	r3, #1	; 0x1
    13c0:	e1a03213 	lsl	r3, r3, r2
    13c4:	e59f2004 	ldr	r2, [pc, #4]	; 13d0 <USBEnableDMAForEndpoint+0x24>
    13c8:	e5023d77 	str	r3, [r2, #-3447]
    13cc:	e12fff1e 	bx	lr
    13d0:	ffe0cfff 	.word	0xffe0cfff

000013d4 <USBInitializeISOCFrameArray>:
    13d4:	e92d4030 	push	{r4, r5, lr}
    13d8:	e1a03b03 	lsl	r3, r3, #22
    13dc:	e1a02802 	lsl	r2, r2, #16
    13e0:	e1a03b23 	lsr	r3, r3, #22
    13e4:	e1a05000 	mov	r5, r0
    13e8:	e1a04001 	mov	r4, r1
    13ec:	e1a0c822 	lsr	ip, r2, #16
    13f0:	e3830902 	orr	r0, r3, #32768	; 0x8000
    13f4:	e3a0e000 	mov	lr, #0	; 0x0
    13f8:	ea000000 	b	1400 <USBInitializeISOCFrameArray+0x2c>
    13fc:	e7851102 	str	r1, [r5, r2, lsl #2]
    1400:	e1a0280e 	lsl	r2, lr, #16
    1404:	e28c3001 	add	r3, ip, #1	; 0x1
    1408:	e1a02822 	lsr	r2, r2, #16
    140c:	e1a03803 	lsl	r3, r3, #16
    1410:	e1520004 	cmp	r2, r4
    1414:	e180180c 	orr	r1, r0, ip, lsl #16
    1418:	e28ee001 	add	lr, lr, #1	; 0x1
    141c:	e1a0c823 	lsr	ip, r3, #16
    1420:	3afffff5 	bcc	13fc <USBInitializeISOCFrameArray+0x28>
    1424:	e8bd8030 	pop	{r4, r5, pc}

00001428 <USBSetHeadDDForDMA>:
    1428:	e200300f 	and	r3, r0, #15	; 0xf
    142c:	e1a03083 	lsl	r3, r3, #1
    1430:	e2000080 	and	r0, r0, #128	; 0x80
    1434:	e18333a0 	orr	r3, r3, r0, lsr #7
    1438:	e7812103 	str	r2, [r1, r3, lsl #2]
    143c:	e12fff1e 	bx	lr

00001440 <USBInitializeUSBDMA>:
    1440:	e3a03000 	mov	r3, #0	; 0x0
    1444:	e1a02003 	mov	r2, r3
    1448:	e7832000 	str	r2, [r3, r0]
    144c:	e2833004 	add	r3, r3, #4	; 0x4
    1450:	e3530080 	cmp	r3, #128	; 0x80
    1454:	1afffffb 	bne	1448 <USBInitializeUSBDMA+0x8>
    1458:	e59f3004 	ldr	r3, [pc, #4]	; 1464 <USBInitializeUSBDMA+0x24>
    145c:	e5030d7f 	str	r0, [r3, #-3455]
    1460:	e12fff1e 	bx	lr
    1464:	ffe0cfff 	.word	0xffe0cfff

00001468 <USBHwRegisterFrameHandler>:
    1468:	e59f1018 	ldr	r1, [pc, #24]	; 1488 <USBHwRegisterFrameHandler+0x20>
    146c:	e59f3018 	ldr	r3, [pc, #24]	; 148c <USBHwRegisterFrameHandler+0x24>
    1470:	e5112dfb 	ldr	r2, [r1, #-3579]
    1474:	e5830000 	str	r0, [r3]
    1478:	e59f0010 	ldr	r0, [pc, #16]	; 1490 <USBHwRegisterFrameHandler+0x28>
    147c:	e3822001 	orr	r2, r2, #1	; 0x1
    1480:	e5012dfb 	str	r2, [r1, #-3579]
    1484:	eafffca7 	b	728 <puts>
    1488:	ffe0cfff 	.word	0xffe0cfff
    148c:	40000370 	.word	0x40000370
    1490:	000021e8 	.word	0x000021e8

00001494 <USBHwRegisterDevIntHandler>:
    1494:	e59f1018 	ldr	r1, [pc, #24]	; 14b4 <USBHwRegisterDevIntHandler+0x20>
    1498:	e59f3018 	ldr	r3, [pc, #24]	; 14b8 <USBHwRegisterDevIntHandler+0x24>
    149c:	e5112dfb 	ldr	r2, [r1, #-3579]
    14a0:	e5830000 	str	r0, [r3]
    14a4:	e59f0010 	ldr	r0, [pc, #16]	; 14bc <USBHwRegisterDevIntHandler+0x28>
    14a8:	e3822008 	orr	r2, r2, #8	; 0x8
    14ac:	e5012dfb 	str	r2, [r1, #-3579]
    14b0:	eafffc9c 	b	728 <puts>
    14b4:	ffe0cfff 	.word	0xffe0cfff
    14b8:	40000374 	.word	0x40000374
    14bc:	00002208 	.word	0x00002208

000014c0 <USBHwRegisterEPIntHandler>:
    14c0:	e92d4010 	push	{r4, lr}
    14c4:	e200300f 	and	r3, r0, #15	; 0xf
    14c8:	e1a03083 	lsl	r3, r3, #1
    14cc:	e2002080 	and	r2, r0, #128	; 0x80
    14d0:	e183e3a2 	orr	lr, r3, r2, lsr #7
    14d4:	e35e001f 	cmp	lr, #31	; 0x1f
    14d8:	e1a04001 	mov	r4, r1
    14dc:	e24dd004 	sub	sp, sp, #4	; 0x4
    14e0:	e20010ff 	and	r1, r0, #255	; 0xff
    14e4:	da000007 	ble	1508 <USBHwRegisterEPIntHandler+0x48>
    14e8:	e3a0c0d2 	mov	ip, #210	; 0xd2
    14ec:	e59f0050 	ldr	r0, [pc, #80]	; 1544 <USBHwRegisterEPIntHandler+0x84>
    14f0:	e59f1050 	ldr	r1, [pc, #80]	; 1548 <USBHwRegisterEPIntHandler+0x88>
    14f4:	e59f2050 	ldr	r2, [pc, #80]	; 154c <USBHwRegisterEPIntHandler+0x8c>
    14f8:	e59f3050 	ldr	r3, [pc, #80]	; 1550 <USBHwRegisterEPIntHandler+0x90>
    14fc:	e58dc000 	str	ip, [sp]
    1500:	ebfffc52 	bl	650 <printf>
    1504:	eafffffe 	b	1504 <USBHwRegisterEPIntHandler+0x44>
    1508:	e59fc044 	ldr	ip, [pc, #68]	; 1554 <USBHwRegisterEPIntHandler+0x94>
    150c:	e51c3dcb 	ldr	r3, [ip, #-3531]
    1510:	e3a02001 	mov	r2, #1	; 0x1
    1514:	e1833e12 	orr	r3, r3, r2, lsl lr
    1518:	e50c3dcb 	str	r3, [ip, #-3531]
    151c:	e51c2dfb 	ldr	r2, [ip, #-3579]
    1520:	e59f3030 	ldr	r3, [pc, #48]	; 1558 <USBHwRegisterEPIntHandler+0x98>
    1524:	e59f0030 	ldr	r0, [pc, #48]	; 155c <USBHwRegisterEPIntHandler+0x9c>
    1528:	e3822004 	orr	r2, r2, #4	; 0x4
    152c:	e1a0e0ae 	lsr	lr, lr, #1
    1530:	e783410e 	str	r4, [r3, lr, lsl #2]
    1534:	e50c2dfb 	str	r2, [ip, #-3579]
    1538:	e28dd004 	add	sp, sp, #4	; 0x4
    153c:	e8bd4010 	pop	{r4, lr}
    1540:	eafffc42 	b	650 <printf>
    1544:	000020fc 	.word	0x000020fc
    1548:	00002230 	.word	0x00002230
    154c:	00002238 	.word	0x00002238
    1550:	00002078 	.word	0x00002078
    1554:	ffe0cfff 	.word	0xffe0cfff
    1558:	40000378 	.word	0x40000378
    155c:	00002244 	.word	0x00002244

00001560 <USBRegisterRequestHandler>:
    1560:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1564:	e3500000 	cmp	r0, #0	; 0x0
    1568:	e24dd004 	sub	sp, sp, #4	; 0x4
    156c:	aa000007 	bge	1590 <USBRegisterRequestHandler+0x30>
    1570:	e3a0c0e2 	mov	ip, #226	; 0xe2
    1574:	e59f0054 	ldr	r0, [pc, #84]	; 15d0 <USBRegisterRequestHandler+0x70>
    1578:	e59f1054 	ldr	r1, [pc, #84]	; 15d4 <USBRegisterRequestHandler+0x74>
    157c:	e59f2054 	ldr	r2, [pc, #84]	; 15d8 <USBRegisterRequestHandler+0x78>
    1580:	e59f3054 	ldr	r3, [pc, #84]	; 15dc <USBRegisterRequestHandler+0x7c>
    1584:	e58dc000 	str	ip, [sp]
    1588:	ebfffc30 	bl	650 <printf>
    158c:	eafffffe 	b	158c <USBRegisterRequestHandler+0x2c>
    1590:	e3500003 	cmp	r0, #3	; 0x3
    1594:	da000007 	ble	15b8 <USBRegisterRequestHandler+0x58>
    1598:	e3a0c0e3 	mov	ip, #227	; 0xe3
    159c:	e59f002c 	ldr	r0, [pc, #44]	; 15d0 <USBRegisterRequestHandler+0x70>
    15a0:	e59f1038 	ldr	r1, [pc, #56]	; 15e0 <USBRegisterRequestHandler+0x80>
    15a4:	e59f202c 	ldr	r2, [pc, #44]	; 15d8 <USBRegisterRequestHandler+0x78>
    15a8:	e59f302c 	ldr	r3, [pc, #44]	; 15dc <USBRegisterRequestHandler+0x7c>
    15ac:	e58dc000 	str	ip, [sp]
    15b0:	ebfffc26 	bl	650 <printf>
    15b4:	eafffffe 	b	15b4 <USBRegisterRequestHandler+0x54>
    15b8:	e59f3024 	ldr	r3, [pc, #36]	; 15e4 <USBRegisterRequestHandler+0x84>
    15bc:	e7832100 	str	r2, [r3, r0, lsl #2]
    15c0:	e59f3020 	ldr	r3, [pc, #32]	; 15e8 <USBRegisterRequestHandler+0x88>
    15c4:	e7831100 	str	r1, [r3, r0, lsl #2]
    15c8:	e28dd004 	add	sp, sp, #4	; 0x4
    15cc:	e8bd8000 	pop	{pc}
    15d0:	000020fc 	.word	0x000020fc
    15d4:	00002264 	.word	0x00002264
    15d8:	00002270 	.word	0x00002270
    15dc:	00002094 	.word	0x00002094
    15e0:	00002280 	.word	0x00002280
    15e4:	400003c8 	.word	0x400003c8
    15e8:	400003b8 	.word	0x400003b8

000015ec <_HandleRequest>:
    15ec:	e92d4010 	push	{r4, lr}
    15f0:	e5d03000 	ldrb	r3, [r0]
    15f4:	e1a032a3 	lsr	r3, r3, #5
    15f8:	e203c003 	and	ip, r3, #3	; 0x3
    15fc:	e59f3028 	ldr	r3, [pc, #40]	; 162c <_HandleRequest+0x40>
    1600:	e793410c 	ldr	r4, [r3, ip, lsl #2]
    1604:	e3540000 	cmp	r4, #0	; 0x0
    1608:	1a000004 	bne	1620 <_HandleRequest+0x34>
    160c:	e1a0100c 	mov	r1, ip
    1610:	e59f0018 	ldr	r0, [pc, #24]	; 1630 <_HandleRequest+0x44>
    1614:	ebfffc0d 	bl	650 <printf>
    1618:	e1a00004 	mov	r0, r4
    161c:	e8bd8010 	pop	{r4, pc}
    1620:	e1a0e00f 	mov	lr, pc
    1624:	e12fff14 	bx	r4
    1628:	e8bd8010 	pop	{r4, pc}
    162c:	400003b8 	.word	0x400003b8
    1630:	0000228c 	.word	0x0000228c

00001634 <StallControlPipe>:
    1634:	e92d4070 	push	{r4, r5, r6, lr}
    1638:	e1a03000 	mov	r3, r0
    163c:	e3a01001 	mov	r1, #1	; 0x1
    1640:	e3a00080 	mov	r0, #128	; 0x80
    1644:	e20350ff 	and	r5, r3, #255	; 0xff
    1648:	ebfffe0a 	bl	e78 <USBHwEPStall>
    164c:	e59f0030 	ldr	r0, [pc, #48]	; 1684 <StallControlPipe+0x50>
    1650:	ebfffbfe 	bl	650 <printf>
    1654:	e59f602c 	ldr	r6, [pc, #44]	; 1688 <StallControlPipe+0x54>
    1658:	e3a04000 	mov	r4, #0	; 0x0
    165c:	e7d41006 	ldrb	r1, [r4, r6]
    1660:	e59f0024 	ldr	r0, [pc, #36]	; 168c <StallControlPipe+0x58>
    1664:	e2844001 	add	r4, r4, #1	; 0x1
    1668:	ebfffbf8 	bl	650 <printf>
    166c:	e3540008 	cmp	r4, #8	; 0x8
    1670:	1afffff9 	bne	165c <StallControlPipe+0x28>
    1674:	e59f0014 	ldr	r0, [pc, #20]	; 1690 <StallControlPipe+0x5c>
    1678:	e1a01005 	mov	r1, r5
    167c:	e8bd4070 	pop	{r4, r5, r6, lr}
    1680:	eafffbf2 	b	650 <printf>
    1684:	000022a8 	.word	0x000022a8
    1688:	400003d8 	.word	0x400003d8
    168c:	000022b4 	.word	0x000022b4
    1690:	000022bc 	.word	0x000022bc

00001694 <DataIn>:
    1694:	e92d4070 	push	{r4, r5, r6, lr}
    1698:	e59f6038 	ldr	r6, [pc, #56]	; 16d8 <DataIn+0x44>
    169c:	e5964000 	ldr	r4, [r6]
    16a0:	e59f5034 	ldr	r5, [pc, #52]	; 16dc <DataIn+0x48>
    16a4:	e3540040 	cmp	r4, #64	; 0x40
    16a8:	a3a04040 	movge	r4, #64	; 0x40
    16ac:	e1a02004 	mov	r2, r4
    16b0:	e3a00080 	mov	r0, #128	; 0x80
    16b4:	e5951000 	ldr	r1, [r5]
    16b8:	ebfffdf6 	bl	e98 <USBHwEPWrite>
    16bc:	e5953000 	ldr	r3, [r5]
    16c0:	e5962000 	ldr	r2, [r6]
    16c4:	e0833004 	add	r3, r3, r4
    16c8:	e0642002 	rsb	r2, r4, r2
    16cc:	e5853000 	str	r3, [r5]
    16d0:	e5862000 	str	r2, [r6]
    16d4:	e8bd8070 	pop	{r4, r5, r6, pc}
    16d8:	400003e4 	.word	0x400003e4
    16dc:	400003e0 	.word	0x400003e0

000016e0 <USBHandleControlTransfer>:
    16e0:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    16e4:	e21000ff 	ands	r0, r0, #255	; 0xff
    16e8:	e24dd004 	sub	sp, sp, #4	; 0x4
    16ec:	e20170ff 	and	r7, r1, #255	; 0xff
    16f0:	1a000051 	bne	183c <USBHandleControlTransfer+0x15c>
    16f4:	e3110004 	tst	r1, #4	; 0x4
    16f8:	e59f6178 	ldr	r6, [pc, #376]	; 1878 <USBHandleControlTransfer+0x198>
    16fc:	0a000021 	beq	1788 <USBHandleControlTransfer+0xa8>
    1700:	e59f5174 	ldr	r5, [pc, #372]	; 187c <USBHandleControlTransfer+0x19c>
    1704:	e3a02008 	mov	r2, #8	; 0x8
    1708:	e1a01005 	mov	r1, r5
    170c:	ebfffe04 	bl	f24 <USBHwEPRead>
    1710:	e5d51001 	ldrb	r1, [r5, #1]
    1714:	e59f0164 	ldr	r0, [pc, #356]	; 1880 <USBHandleControlTransfer+0x1a0>
    1718:	ebfffbcc 	bl	650 <printf>
    171c:	e5d50000 	ldrb	r0, [r5]
    1720:	e59f215c 	ldr	r2, [pc, #348]	; 1884 <USBHandleControlTransfer+0x1a4>
    1724:	e1a032a0 	lsr	r3, r0, #5
    1728:	e1d510b6 	ldrh	r1, [r5, #6]
    172c:	e2033003 	and	r3, r3, #3	; 0x3
    1730:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    1734:	e59f414c 	ldr	r4, [pc, #332]	; 1888 <USBHandleControlTransfer+0x1a8>
    1738:	e59f214c 	ldr	r2, [pc, #332]	; 188c <USBHandleControlTransfer+0x1ac>
    173c:	e3510000 	cmp	r1, #0	; 0x0
    1740:	e5823000 	str	r3, [r2]
    1744:	e5861000 	str	r1, [r6]
    1748:	e5841000 	str	r1, [r4]
    174c:	0a000001 	beq	1758 <USBHandleControlTransfer+0x78>
    1750:	e1b003a0 	lsrs	r0, r0, #7
    1754:	0a000045 	beq	1870 <USBHandleControlTransfer+0x190>
    1758:	e1a00005 	mov	r0, r5
    175c:	e1a01004 	mov	r1, r4
    1760:	ebffffa1 	bl	15ec <_HandleRequest>
    1764:	e3500000 	cmp	r0, #0	; 0x0
    1768:	059f0120 	ldreq	r0, [pc, #288]	; 1890 <USBHandleControlTransfer+0x1b0>
    176c:	0a000022 	beq	17fc <USBHandleControlTransfer+0x11c>
    1770:	e1d520b6 	ldrh	r2, [r5, #6]
    1774:	e5943000 	ldr	r3, [r4]
    1778:	e1520003 	cmp	r2, r3
    177c:	d5862000 	strle	r2, [r6]
    1780:	c5863000 	strgt	r3, [r6]
    1784:	ea00002e 	b	1844 <USBHandleControlTransfer+0x164>
    1788:	e5962000 	ldr	r2, [r6]
    178c:	e3520000 	cmp	r2, #0	; 0x0
    1790:	da00001e 	ble	1810 <USBHandleControlTransfer+0x130>
    1794:	e59f40f0 	ldr	r4, [pc, #240]	; 188c <USBHandleControlTransfer+0x1ac>
    1798:	e5941000 	ldr	r1, [r4]
    179c:	ebfffde0 	bl	f24 <USBHwEPRead>
    17a0:	e3500000 	cmp	r0, #0	; 0x0
    17a4:	ba000015 	blt	1800 <USBHandleControlTransfer+0x120>
    17a8:	e5962000 	ldr	r2, [r6]
    17ac:	e5943000 	ldr	r3, [r4]
    17b0:	e0602002 	rsb	r2, r0, r2
    17b4:	e0833000 	add	r3, r3, r0
    17b8:	e3520000 	cmp	r2, #0	; 0x0
    17bc:	e5843000 	str	r3, [r4]
    17c0:	e5862000 	str	r2, [r6]
    17c4:	1a000029 	bne	1870 <USBHandleControlTransfer+0x190>
    17c8:	e59f00ac 	ldr	r0, [pc, #172]	; 187c <USBHandleControlTransfer+0x19c>
    17cc:	e5d03000 	ldrb	r3, [r0]
    17d0:	e59f20ac 	ldr	r2, [pc, #172]	; 1884 <USBHandleControlTransfer+0x1a4>
    17d4:	e1a032a3 	lsr	r3, r3, #5
    17d8:	e2033003 	and	r3, r3, #3	; 0x3
    17dc:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    17e0:	e59f10a0 	ldr	r1, [pc, #160]	; 1888 <USBHandleControlTransfer+0x1a8>
    17e4:	e1a02004 	mov	r2, r4
    17e8:	e5843000 	str	r3, [r4]
    17ec:	ebffff7e 	bl	15ec <_HandleRequest>
    17f0:	e3500000 	cmp	r0, #0	; 0x0
    17f4:	1a000012 	bne	1844 <USBHandleControlTransfer+0x164>
    17f8:	e59f0094 	ldr	r0, [pc, #148]	; 1894 <USBHandleControlTransfer+0x1b4>
    17fc:	ebfffbc9 	bl	728 <puts>
    1800:	e1a00007 	mov	r0, r7
    1804:	e28dd004 	add	sp, sp, #4	; 0x4
    1808:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    180c:	eaffff88 	b	1634 <StallControlPipe>
    1810:	e1a01000 	mov	r1, r0
    1814:	e1a02000 	mov	r2, r0
    1818:	ebfffdc1 	bl	f24 <USBHwEPRead>
    181c:	e59f2074 	ldr	r2, [pc, #116]	; 1898 <USBHandleControlTransfer+0x1b8>
    1820:	e59f3074 	ldr	r3, [pc, #116]	; 189c <USBHandleControlTransfer+0x1bc>
    1824:	e3500000 	cmp	r0, #0	; 0x0
    1828:	d1a00002 	movle	r0, r2
    182c:	c1a00003 	movgt	r0, r3
    1830:	e28dd004 	add	sp, sp, #4	; 0x4
    1834:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    1838:	eafffb84 	b	650 <printf>
    183c:	e3500080 	cmp	r0, #128	; 0x80
    1840:	1a000002 	bne	1850 <USBHandleControlTransfer+0x170>
    1844:	e28dd004 	add	sp, sp, #4	; 0x4
    1848:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    184c:	eaffff90 	b	1694 <DataIn>
    1850:	e3a0c0d4 	mov	ip, #212	; 0xd4
    1854:	e59f0044 	ldr	r0, [pc, #68]	; 18a0 <USBHandleControlTransfer+0x1c0>
    1858:	e59f1044 	ldr	r1, [pc, #68]	; 18a4 <USBHandleControlTransfer+0x1c4>
    185c:	e59f2044 	ldr	r2, [pc, #68]	; 18a8 <USBHandleControlTransfer+0x1c8>
    1860:	e59f3044 	ldr	r3, [pc, #68]	; 18ac <USBHandleControlTransfer+0x1cc>
    1864:	e58dc000 	str	ip, [sp]
    1868:	ebfffb78 	bl	650 <printf>
    186c:	eafffffe 	b	186c <USBHandleControlTransfer+0x18c>
    1870:	e28dd004 	add	sp, sp, #4	; 0x4
    1874:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    1878:	400003e4 	.word	0x400003e4
    187c:	400003d8 	.word	0x400003d8
    1880:	000022c8 	.word	0x000022c8
    1884:	400003c8 	.word	0x400003c8
    1888:	400003e8 	.word	0x400003e8
    188c:	400003e0 	.word	0x400003e0
    1890:	000022cc 	.word	0x000022cc
    1894:	000022e4 	.word	0x000022e4
    1898:	00002120 	.word	0x00002120
    189c:	000022fc 	.word	0x000022fc
    18a0:	000020fc 	.word	0x000020fc
    18a4:	00002124 	.word	0x00002124
    18a8:	00002270 	.word	0x00002270
    18ac:	000020b0 	.word	0x000020b0

000018b0 <USBRegisterDescriptors>:
    18b0:	e59f3004 	ldr	r3, [pc, #4]	; 18bc <USBRegisterDescriptors+0xc>
    18b4:	e5830000 	str	r0, [r3]
    18b8:	e12fff1e 	bx	lr
    18bc:	400003f4 	.word	0x400003f4

000018c0 <USBRegisterCustomReqHandler>:
    18c0:	e59f3004 	ldr	r3, [pc, #4]	; 18cc <USBRegisterCustomReqHandler+0xc>
    18c4:	e5830000 	str	r0, [r3]
    18c8:	e12fff1e 	bx	lr
    18cc:	400003ec 	.word	0x400003ec

000018d0 <USBGetDescriptor>:
    18d0:	e92d4070 	push	{r4, r5, r6, lr}
    18d4:	e59f10ac 	ldr	r1, [pc, #172]	; 1988 <USBGetDescriptor+0xb8>
    18d8:	e5911000 	ldr	r1, [r1]
    18dc:	e1a00800 	lsl	r0, r0, #16
    18e0:	e3510000 	cmp	r1, #0	; 0x0
    18e4:	e1a0c820 	lsr	ip, r0, #16
    18e8:	e1a05002 	mov	r5, r2
    18ec:	e24dd004 	sub	sp, sp, #4	; 0x4
    18f0:	e1a06003 	mov	r6, r3
    18f4:	11a00c20 	lsrne	r0, r0, #24
    18f8:	120ce0ff 	andne	lr, ip, #255	; 0xff
    18fc:	13a02000 	movne	r2, #0	; 0x0
    1900:	1a000017 	bne	1964 <USBGetDescriptor+0x94>
    1904:	e3a0c06e 	mov	ip, #110	; 0x6e
    1908:	e59f007c 	ldr	r0, [pc, #124]	; 198c <USBGetDescriptor+0xbc>
    190c:	e59f107c 	ldr	r1, [pc, #124]	; 1990 <USBGetDescriptor+0xc0>
    1910:	e59f207c 	ldr	r2, [pc, #124]	; 1994 <USBGetDescriptor+0xc4>
    1914:	e59f307c 	ldr	r3, [pc, #124]	; 1998 <USBGetDescriptor+0xc8>
    1918:	e58dc000 	str	ip, [sp]
    191c:	ebfffb4b 	bl	650 <printf>
    1920:	eafffffe 	b	1920 <USBGetDescriptor+0x50>
    1924:	e5d13001 	ldrb	r3, [r1, #1]
    1928:	e1530000 	cmp	r3, r0
    192c:	1a00000b 	bne	1960 <USBGetDescriptor+0x90>
    1930:	e152000e 	cmp	r2, lr
    1934:	1a000008 	bne	195c <USBGetDescriptor+0x8c>
    1938:	e5861000 	str	r1, [r6]
    193c:	e3500002 	cmp	r0, #2	; 0x2
    1940:	05d13002 	ldrbeq	r3, [r1, #2]
    1944:	05d12003 	ldrbeq	r2, [r1, #3]
    1948:	15d13000 	ldrbne	r3, [r1]
    194c:	01833402 	orreq	r3, r3, r2, lsl #8
    1950:	e3a00001 	mov	r0, #1	; 0x1
    1954:	e5853000 	str	r3, [r5]
    1958:	ea000008 	b	1980 <USBGetDescriptor+0xb0>
    195c:	e2822001 	add	r2, r2, #1	; 0x1
    1960:	e0811004 	add	r1, r1, r4
    1964:	e5d14000 	ldrb	r4, [r1]
    1968:	e3540000 	cmp	r4, #0	; 0x0
    196c:	1affffec 	bne	1924 <USBGetDescriptor+0x54>
    1970:	e1a0100c 	mov	r1, ip
    1974:	e59f0020 	ldr	r0, [pc, #32]	; 199c <USBGetDescriptor+0xcc>
    1978:	ebfffb34 	bl	650 <printf>
    197c:	e1a00004 	mov	r0, r4
    1980:	e28dd004 	add	sp, sp, #4	; 0x4
    1984:	e8bd8070 	pop	{r4, r5, r6, pc}
    1988:	400003f4 	.word	0x400003f4
    198c:	000020fc 	.word	0x000020fc
    1990:	00002300 	.word	0x00002300
    1994:	00002314 	.word	0x00002314
    1998:	000020e0 	.word	0x000020e0
    199c:	00002320 	.word	0x00002320

000019a0 <USBHandleStandardRequest>:
    19a0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    19a4:	e59f32f8 	ldr	r3, [pc, #760]	; 1ca4 <USBHandleStandardRequest+0x304>
    19a8:	e5933000 	ldr	r3, [r3]
    19ac:	e3530000 	cmp	r3, #0	; 0x0
    19b0:	e24dd004 	sub	sp, sp, #4	; 0x4
    19b4:	e1a05000 	mov	r5, r0
    19b8:	e1a06001 	mov	r6, r1
    19bc:	e1a04002 	mov	r4, r2
    19c0:	0a000003 	beq	19d4 <USBHandleStandardRequest+0x34>
    19c4:	e1a0e00f 	mov	lr, pc
    19c8:	e12fff13 	bx	r3
    19cc:	e3500000 	cmp	r0, #0	; 0x0
    19d0:	1a0000a9 	bne	1c7c <USBHandleStandardRequest+0x2dc>
    19d4:	e5d53000 	ldrb	r3, [r5]
    19d8:	e203301f 	and	r3, r3, #31	; 0x1f
    19dc:	e3530001 	cmp	r3, #1	; 0x1
    19e0:	0a000059 	beq	1b4c <USBHandleStandardRequest+0x1ac>
    19e4:	e3530002 	cmp	r3, #2	; 0x2
    19e8:	0a00007b 	beq	1bdc <USBHandleStandardRequest+0x23c>
    19ec:	e3530000 	cmp	r3, #0	; 0x0
    19f0:	1a0000a7 	bne	1c94 <USBHandleStandardRequest+0x2f4>
    19f4:	e5d51001 	ldrb	r1, [r5, #1]
    19f8:	e5940000 	ldr	r0, [r4]
    19fc:	e3510009 	cmp	r1, #9	; 0x9
    1a00:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1a04:	ea00004e 	b	1b44 <USBHandleStandardRequest+0x1a4>
    1a08:	00001b90 	.word	0x00001b90
    1a0c:	00001c94 	.word	0x00001c94
    1a10:	00001b44 	.word	0x00001b44
    1a14:	00001c94 	.word	0x00001c94
    1a18:	00001b44 	.word	0x00001b44
    1a1c:	00001a30 	.word	0x00001a30
    1a20:	00001a3c 	.word	0x00001a3c
    1a24:	00001b3c 	.word	0x00001b3c
    1a28:	00001a64 	.word	0x00001a64
    1a2c:	00001a7c 	.word	0x00001a7c
    1a30:	e5d50002 	ldrb	r0, [r5, #2]
    1a34:	ebfffcf4 	bl	e0c <USBHwSetAddress>
    1a38:	ea00008f 	b	1c7c <USBHandleStandardRequest+0x2dc>
    1a3c:	e1d510b2 	ldrh	r1, [r5, #2]
    1a40:	e59f0260 	ldr	r0, [pc, #608]	; 1ca8 <USBHandleStandardRequest+0x308>
    1a44:	ebfffb01 	bl	650 <printf>
    1a48:	e1d510b4 	ldrh	r1, [r5, #4]
    1a4c:	e1d500b2 	ldrh	r0, [r5, #2]
    1a50:	e1a02006 	mov	r2, r6
    1a54:	e1a03004 	mov	r3, r4
    1a58:	e28dd004 	add	sp, sp, #4	; 0x4
    1a5c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    1a60:	eaffff9a 	b	18d0 <USBGetDescriptor>
    1a64:	e59f3240 	ldr	r3, [pc, #576]	; 1cac <USBHandleStandardRequest+0x30c>
    1a68:	e5d32000 	ldrb	r2, [r3]
    1a6c:	e3a03001 	mov	r3, #1	; 0x1
    1a70:	e1a01003 	mov	r1, r3
    1a74:	e5c02000 	strb	r2, [r0]
    1a78:	ea000072 	b	1c48 <USBHandleStandardRequest+0x2a8>
    1a7c:	e59f322c 	ldr	r3, [pc, #556]	; 1cb0 <USBHandleStandardRequest+0x310>
    1a80:	e5933000 	ldr	r3, [r3]
    1a84:	e3530000 	cmp	r3, #0	; 0x0
    1a88:	e1d520b2 	ldrh	r2, [r5, #2]
    1a8c:	1a000007 	bne	1ab0 <USBHandleStandardRequest+0x110>
    1a90:	e3a0c0a5 	mov	ip, #165	; 0xa5
    1a94:	e59f0218 	ldr	r0, [pc, #536]	; 1cb4 <USBHandleStandardRequest+0x314>
    1a98:	e59f1218 	ldr	r1, [pc, #536]	; 1cb8 <USBHandleStandardRequest+0x318>
    1a9c:	e59f2218 	ldr	r2, [pc, #536]	; 1cbc <USBHandleStandardRequest+0x31c>
    1aa0:	e59f3218 	ldr	r3, [pc, #536]	; 1cc0 <USBHandleStandardRequest+0x320>
    1aa4:	e58dc000 	str	ip, [sp]
    1aa8:	ebfffae8 	bl	650 <printf>
    1aac:	eafffffe 	b	1aac <USBHandleStandardRequest+0x10c>
    1ab0:	e21270ff 	ands	r7, r2, #255	; 0xff
    1ab4:	13a060ff 	movne	r6, #255	; 0xff
    1ab8:	01a00007 	moveq	r0, r7
    1abc:	11a04003 	movne	r4, r3
    1ac0:	11a08006 	movne	r8, r6
    1ac4:	1a000012 	bne	1b14 <USBHandleStandardRequest+0x174>
    1ac8:	ea000015 	b	1b24 <USBHandleStandardRequest+0x184>
    1acc:	e5d43001 	ldrb	r3, [r4, #1]
    1ad0:	e3530004 	cmp	r3, #4	; 0x4
    1ad4:	05d46003 	ldrbeq	r6, [r4, #3]
    1ad8:	0a00000b 	beq	1b0c <USBHandleStandardRequest+0x16c>
    1adc:	e3530005 	cmp	r3, #5	; 0x5
    1ae0:	0a000002 	beq	1af0 <USBHandleStandardRequest+0x150>
    1ae4:	e3530002 	cmp	r3, #2	; 0x2
    1ae8:	05d48005 	ldrbeq	r8, [r4, #5]
    1aec:	ea000006 	b	1b0c <USBHandleStandardRequest+0x16c>
    1af0:	e1580007 	cmp	r8, r7
    1af4:	03560000 	cmpeq	r6, #0	; 0x0
    1af8:	05d43005 	ldrbeq	r3, [r4, #5]
    1afc:	05d41004 	ldrbeq	r1, [r4, #4]
    1b00:	05d40002 	ldrbeq	r0, [r4, #2]
    1b04:	01811403 	orreq	r1, r1, r3, lsl #8
    1b08:	0bfffca9 	bleq	db4 <USBHwEPConfig>
    1b0c:	e5d43000 	ldrb	r3, [r4]
    1b10:	e0844003 	add	r4, r4, r3
    1b14:	e5d43000 	ldrb	r3, [r4]
    1b18:	e3530000 	cmp	r3, #0	; 0x0
    1b1c:	1affffea 	bne	1acc <USBHandleStandardRequest+0x12c>
    1b20:	e3a00001 	mov	r0, #1	; 0x1
    1b24:	ebfffd4e 	bl	1064 <USBHwConfigDevice>
    1b28:	e1d520b2 	ldrh	r2, [r5, #2]
    1b2c:	e59f3178 	ldr	r3, [pc, #376]	; 1cac <USBHandleStandardRequest+0x30c>
    1b30:	e3a01001 	mov	r1, #1	; 0x1
    1b34:	e5c32000 	strb	r2, [r3]
    1b38:	ea000056 	b	1c98 <USBHandleStandardRequest+0x2f8>
    1b3c:	e59f0180 	ldr	r0, [pc, #384]	; 1cc4 <USBHandleStandardRequest+0x324>
    1b40:	ea000052 	b	1c90 <USBHandleStandardRequest+0x2f0>
    1b44:	e59f017c 	ldr	r0, [pc, #380]	; 1cc8 <USBHandleStandardRequest+0x328>
    1b48:	ea000050 	b	1c90 <USBHandleStandardRequest+0x2f0>
    1b4c:	e5d51001 	ldrb	r1, [r5, #1]
    1b50:	e5940000 	ldr	r0, [r4]
    1b54:	e351000b 	cmp	r1, #11	; 0xb
    1b58:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1b5c:	ea00001c 	b	1bd4 <USBHandleStandardRequest+0x234>
    1b60:	00001b90 	.word	0x00001b90
    1b64:	00001c94 	.word	0x00001c94
    1b68:	00001bd4 	.word	0x00001bd4
    1b6c:	00001c94 	.word	0x00001c94
    1b70:	00001bd4 	.word	0x00001bd4
    1b74:	00001bd4 	.word	0x00001bd4
    1b78:	00001bd4 	.word	0x00001bd4
    1b7c:	00001bd4 	.word	0x00001bd4
    1b80:	00001bd4 	.word	0x00001bd4
    1b84:	00001bd4 	.word	0x00001bd4
    1b88:	00001ba4 	.word	0x00001ba4
    1b8c:	00001bbc 	.word	0x00001bbc
    1b90:	e3a03000 	mov	r3, #0	; 0x0
    1b94:	e3a01001 	mov	r1, #1	; 0x1
    1b98:	e5c03001 	strb	r3, [r0, #1]
    1b9c:	e5c03000 	strb	r3, [r0]
    1ba0:	ea000027 	b	1c44 <USBHandleStandardRequest+0x2a4>
    1ba4:	e3a02001 	mov	r2, #1	; 0x1
    1ba8:	e3a03000 	mov	r3, #0	; 0x0
    1bac:	e1a01002 	mov	r1, r2
    1bb0:	e5c03000 	strb	r3, [r0]
    1bb4:	e5862000 	str	r2, [r6]
    1bb8:	ea000036 	b	1c98 <USBHandleStandardRequest+0x2f8>
    1bbc:	e1d500b2 	ldrh	r0, [r5, #2]
    1bc0:	e3500000 	cmp	r0, #0	; 0x0
    1bc4:	03a01001 	moveq	r1, #1	; 0x1
    1bc8:	05860000 	streq	r0, [r6]
    1bcc:	0a000031 	beq	1c98 <USBHandleStandardRequest+0x2f8>
    1bd0:	ea00002f 	b	1c94 <USBHandleStandardRequest+0x2f4>
    1bd4:	e59f00f0 	ldr	r0, [pc, #240]	; 1ccc <USBHandleStandardRequest+0x32c>
    1bd8:	ea00002c 	b	1c90 <USBHandleStandardRequest+0x2f0>
    1bdc:	e5d51001 	ldrb	r1, [r5, #1]
    1be0:	e5944000 	ldr	r4, [r4]
    1be4:	e351000c 	cmp	r1, #12	; 0xc
    1be8:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    1bec:	ea000026 	b	1c8c <USBHandleStandardRequest+0x2ec>
    1bf0:	00001c24 	.word	0x00001c24
    1bf4:	00001c50 	.word	0x00001c50
    1bf8:	00001c8c 	.word	0x00001c8c
    1bfc:	00001c64 	.word	0x00001c64
    1c00:	00001c8c 	.word	0x00001c8c
    1c04:	00001c8c 	.word	0x00001c8c
    1c08:	00001c8c 	.word	0x00001c8c
    1c0c:	00001c8c 	.word	0x00001c8c
    1c10:	00001c8c 	.word	0x00001c8c
    1c14:	00001c8c 	.word	0x00001c8c
    1c18:	00001c8c 	.word	0x00001c8c
    1c1c:	00001c8c 	.word	0x00001c8c
    1c20:	00001c84 	.word	0x00001c84
    1c24:	e5d50004 	ldrb	r0, [r5, #4]
    1c28:	ebfffc8a 	bl	e58 <USBHwEPGetStatus>
    1c2c:	e1a000a0 	lsr	r0, r0, #1
    1c30:	e2000001 	and	r0, r0, #1	; 0x1
    1c34:	e3a03000 	mov	r3, #0	; 0x0
    1c38:	e5c43001 	strb	r3, [r4, #1]
    1c3c:	e5c40000 	strb	r0, [r4]
    1c40:	e3a01001 	mov	r1, #1	; 0x1
    1c44:	e2833002 	add	r3, r3, #2	; 0x2
    1c48:	e5863000 	str	r3, [r6]
    1c4c:	ea000011 	b	1c98 <USBHandleStandardRequest+0x2f8>
    1c50:	e1d510b2 	ldrh	r1, [r5, #2]
    1c54:	e3510000 	cmp	r1, #0	; 0x0
    1c58:	05d50004 	ldrbeq	r0, [r5, #4]
    1c5c:	0a000005 	beq	1c78 <USBHandleStandardRequest+0x2d8>
    1c60:	ea00000b 	b	1c94 <USBHandleStandardRequest+0x2f4>
    1c64:	e1d530b2 	ldrh	r3, [r5, #2]
    1c68:	e3530000 	cmp	r3, #0	; 0x0
    1c6c:	1a000008 	bne	1c94 <USBHandleStandardRequest+0x2f4>
    1c70:	e5d50004 	ldrb	r0, [r5, #4]
    1c74:	e3a01001 	mov	r1, #1	; 0x1
    1c78:	ebfffc7e 	bl	e78 <USBHwEPStall>
    1c7c:	e3a01001 	mov	r1, #1	; 0x1
    1c80:	ea000004 	b	1c98 <USBHandleStandardRequest+0x2f8>
    1c84:	e59f0044 	ldr	r0, [pc, #68]	; 1cd0 <USBHandleStandardRequest+0x330>
    1c88:	ea000000 	b	1c90 <USBHandleStandardRequest+0x2f0>
    1c8c:	e59f0040 	ldr	r0, [pc, #64]	; 1cd4 <USBHandleStandardRequest+0x334>
    1c90:	ebfffa6e 	bl	650 <printf>
    1c94:	e3a01000 	mov	r1, #0	; 0x0
    1c98:	e1a00001 	mov	r0, r1
    1c9c:	e28dd004 	add	sp, sp, #4	; 0x4
    1ca0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    1ca4:	400003ec 	.word	0x400003ec
    1ca8:	00002334 	.word	0x00002334
    1cac:	400003f0 	.word	0x400003f0
    1cb0:	400003f4 	.word	0x400003f4
    1cb4:	000020fc 	.word	0x000020fc
    1cb8:	00002300 	.word	0x00002300
    1cbc:	00002314 	.word	0x00002314
    1cc0:	000020cc 	.word	0x000020cc
    1cc4:	00002338 	.word	0x00002338
    1cc8:	00002358 	.word	0x00002358
    1ccc:	00002370 	.word	0x00002370
    1cd0:	0000238c 	.word	0x0000238c
    1cd4:	000023a8 	.word	0x000023a8

00001cd8 <USBInit>:
    1cd8:	e92d4010 	push	{r4, lr}
    1cdc:	e59f4050 	ldr	r4, [pc, #80]	; 1d34 <USBInit+0x5c>
    1ce0:	ebfffd3b 	bl	11d4 <USBHwInit>
    1ce4:	e59f004c 	ldr	r0, [pc, #76]	; 1d38 <USBInit+0x60>
    1ce8:	ebfffde9 	bl	1494 <USBHwRegisterDevIntHandler>
    1cec:	e1a01004 	mov	r1, r4
    1cf0:	e3a00000 	mov	r0, #0	; 0x0
    1cf4:	ebfffdf1 	bl	14c0 <USBHwRegisterEPIntHandler>
    1cf8:	e1a01004 	mov	r1, r4
    1cfc:	e3a00080 	mov	r0, #128	; 0x80
    1d00:	ebfffdee 	bl	14c0 <USBHwRegisterEPIntHandler>
    1d04:	e3a00000 	mov	r0, #0	; 0x0
    1d08:	e3a01040 	mov	r1, #64	; 0x40
    1d0c:	ebfffc28 	bl	db4 <USBHwEPConfig>
    1d10:	e3a00080 	mov	r0, #128	; 0x80
    1d14:	e3a01040 	mov	r1, #64	; 0x40
    1d18:	ebfffc25 	bl	db4 <USBHwEPConfig>
    1d1c:	e3a00000 	mov	r0, #0	; 0x0
    1d20:	e59f1014 	ldr	r1, [pc, #20]	; 1d3c <USBInit+0x64>
    1d24:	e59f2014 	ldr	r2, [pc, #20]	; 1d40 <USBInit+0x68>
    1d28:	ebfffe0c 	bl	1560 <USBRegisterRequestHandler>
    1d2c:	e3a00001 	mov	r0, #1	; 0x1
    1d30:	e8bd8010 	pop	{r4, pc}
    1d34:	000016e0 	.word	0x000016e0
    1d38:	00001d44 	.word	0x00001d44
    1d3c:	000019a0 	.word	0x000019a0
    1d40:	400003f8 	.word	0x400003f8

00001d44 <HandleUsbReset>:
    1d44:	e3100010 	tst	r0, #16	; 0x10
    1d48:	012fff1e 	bxeq	lr
    1d4c:	e59f0000 	ldr	r0, [pc, #0]	; 1d54 <HandleUsbReset+0x10>
    1d50:	eafffa3e 	b	650 <printf>
    1d54:	000023bc 	.word	0x000023bc

00001d58 <__aeabi_uidiv>:
    1d58:	e2512001 	subs	r2, r1, #1	; 0x1
    1d5c:	012fff1e 	bxeq	lr
    1d60:	3a000036 	bcc	1e40 <__aeabi_uidiv+0xe8>
    1d64:	e1500001 	cmp	r0, r1
    1d68:	9a000022 	bls	1df8 <__aeabi_uidiv+0xa0>
    1d6c:	e1110002 	tst	r1, r2
    1d70:	0a000023 	beq	1e04 <__aeabi_uidiv+0xac>
    1d74:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    1d78:	01a01181 	lsleq	r1, r1, #3
    1d7c:	03a03008 	moveq	r3, #8	; 0x8
    1d80:	13a03001 	movne	r3, #1	; 0x1
    1d84:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1d88:	31510000 	cmpcc	r1, r0
    1d8c:	31a01201 	lslcc	r1, r1, #4
    1d90:	31a03203 	lslcc	r3, r3, #4
    1d94:	3afffffa 	bcc	1d84 <__aeabi_uidiv+0x2c>
    1d98:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1d9c:	31510000 	cmpcc	r1, r0
    1da0:	31a01081 	lslcc	r1, r1, #1
    1da4:	31a03083 	lslcc	r3, r3, #1
    1da8:	3afffffa 	bcc	1d98 <__aeabi_uidiv+0x40>
    1dac:	e3a02000 	mov	r2, #0	; 0x0
    1db0:	e1500001 	cmp	r0, r1
    1db4:	20400001 	subcs	r0, r0, r1
    1db8:	21822003 	orrcs	r2, r2, r3
    1dbc:	e15000a1 	cmp	r0, r1, lsr #1
    1dc0:	204000a1 	subcs	r0, r0, r1, lsr #1
    1dc4:	218220a3 	orrcs	r2, r2, r3, lsr #1
    1dc8:	e1500121 	cmp	r0, r1, lsr #2
    1dcc:	20400121 	subcs	r0, r0, r1, lsr #2
    1dd0:	21822123 	orrcs	r2, r2, r3, lsr #2
    1dd4:	e15001a1 	cmp	r0, r1, lsr #3
    1dd8:	204001a1 	subcs	r0, r0, r1, lsr #3
    1ddc:	218221a3 	orrcs	r2, r2, r3, lsr #3
    1de0:	e3500000 	cmp	r0, #0	; 0x0
    1de4:	11b03223 	lsrsne	r3, r3, #4
    1de8:	11a01221 	lsrne	r1, r1, #4
    1dec:	1affffef 	bne	1db0 <__aeabi_uidiv+0x58>
    1df0:	e1a00002 	mov	r0, r2
    1df4:	e12fff1e 	bx	lr
    1df8:	03a00001 	moveq	r0, #1	; 0x1
    1dfc:	13a00000 	movne	r0, #0	; 0x0
    1e00:	e12fff1e 	bx	lr
    1e04:	e3510801 	cmp	r1, #65536	; 0x10000
    1e08:	21a01821 	lsrcs	r1, r1, #16
    1e0c:	23a02010 	movcs	r2, #16	; 0x10
    1e10:	33a02000 	movcc	r2, #0	; 0x0
    1e14:	e3510c01 	cmp	r1, #256	; 0x100
    1e18:	21a01421 	lsrcs	r1, r1, #8
    1e1c:	22822008 	addcs	r2, r2, #8	; 0x8
    1e20:	e3510010 	cmp	r1, #16	; 0x10
    1e24:	21a01221 	lsrcs	r1, r1, #4
    1e28:	22822004 	addcs	r2, r2, #4	; 0x4
    1e2c:	e3510004 	cmp	r1, #4	; 0x4
    1e30:	82822003 	addhi	r2, r2, #3	; 0x3
    1e34:	908220a1 	addls	r2, r2, r1, lsr #1
    1e38:	e1a00230 	lsr	r0, r0, r2
    1e3c:	e12fff1e 	bx	lr
    1e40:	e52de008 	str	lr, [sp, #-8]!
    1e44:	eb00003a 	bl	1f34 <__aeabi_idiv0>
    1e48:	e3a00000 	mov	r0, #0	; 0x0
    1e4c:	e49df008 	ldr	pc, [sp], #8

00001e50 <__aeabi_uidivmod>:
    1e50:	e92d4003 	push	{r0, r1, lr}
    1e54:	ebffffbf 	bl	1d58 <__aeabi_uidiv>
    1e58:	e8bd4006 	pop	{r1, r2, lr}
    1e5c:	e0030092 	mul	r3, r2, r0
    1e60:	e0411003 	sub	r1, r1, r3
    1e64:	e12fff1e 	bx	lr

00001e68 <__umodsi3>:
    1e68:	e2512001 	subs	r2, r1, #1	; 0x1
    1e6c:	3a00002c 	bcc	1f24 <__umodsi3+0xbc>
    1e70:	11500001 	cmpne	r0, r1
    1e74:	03a00000 	moveq	r0, #0	; 0x0
    1e78:	81110002 	tsthi	r1, r2
    1e7c:	00000002 	andeq	r0, r0, r2
    1e80:	912fff1e 	bxls	lr
    1e84:	e3a02000 	mov	r2, #0	; 0x0
    1e88:	e3510201 	cmp	r1, #268435456	; 0x10000000
    1e8c:	31510000 	cmpcc	r1, r0
    1e90:	31a01201 	lslcc	r1, r1, #4
    1e94:	32822004 	addcc	r2, r2, #4	; 0x4
    1e98:	3afffffa 	bcc	1e88 <__umodsi3+0x20>
    1e9c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    1ea0:	31510000 	cmpcc	r1, r0
    1ea4:	31a01081 	lslcc	r1, r1, #1
    1ea8:	32822001 	addcc	r2, r2, #1	; 0x1
    1eac:	3afffffa 	bcc	1e9c <__umodsi3+0x34>
    1eb0:	e2522003 	subs	r2, r2, #3	; 0x3
    1eb4:	ba00000e 	blt	1ef4 <__umodsi3+0x8c>
    1eb8:	e1500001 	cmp	r0, r1
    1ebc:	20400001 	subcs	r0, r0, r1
    1ec0:	e15000a1 	cmp	r0, r1, lsr #1
    1ec4:	204000a1 	subcs	r0, r0, r1, lsr #1
    1ec8:	e1500121 	cmp	r0, r1, lsr #2
    1ecc:	20400121 	subcs	r0, r0, r1, lsr #2
    1ed0:	e15001a1 	cmp	r0, r1, lsr #3
    1ed4:	204001a1 	subcs	r0, r0, r1, lsr #3
    1ed8:	e3500001 	cmp	r0, #1	; 0x1
    1edc:	e1a01221 	lsr	r1, r1, #4
    1ee0:	a2522004 	subsge	r2, r2, #4	; 0x4
    1ee4:	aafffff3 	bge	1eb8 <__umodsi3+0x50>
    1ee8:	e3120003 	tst	r2, #3	; 0x3
    1eec:	13300000 	teqne	r0, #0	; 0x0
    1ef0:	0a00000a 	beq	1f20 <__umodsi3+0xb8>
    1ef4:	e3720002 	cmn	r2, #2	; 0x2
    1ef8:	ba000006 	blt	1f18 <__umodsi3+0xb0>
    1efc:	0a000002 	beq	1f0c <__umodsi3+0xa4>
    1f00:	e1500001 	cmp	r0, r1
    1f04:	20400001 	subcs	r0, r0, r1
    1f08:	e1a010a1 	lsr	r1, r1, #1
    1f0c:	e1500001 	cmp	r0, r1
    1f10:	20400001 	subcs	r0, r0, r1
    1f14:	e1a010a1 	lsr	r1, r1, #1
    1f18:	e1500001 	cmp	r0, r1
    1f1c:	20400001 	subcs	r0, r0, r1
    1f20:	e12fff1e 	bx	lr
    1f24:	e52de008 	str	lr, [sp, #-8]!
    1f28:	eb000001 	bl	1f34 <__aeabi_idiv0>
    1f2c:	e3a00000 	mov	r0, #0	; 0x0
    1f30:	e49df008 	ldr	pc, [sp], #8

00001f34 <__aeabi_idiv0>:
    1f34:	e12fff1e 	bx	lr

00001f38 <memcpy>:
    1f38:	e352000f 	cmp	r2, #15	; 0xf
    1f3c:	e92d4010 	push	{r4, lr}
    1f40:	e1a0c000 	mov	ip, r0
    1f44:	e1a04002 	mov	r4, r2
    1f48:	e1a0e002 	mov	lr, r2
    1f4c:	9a000002 	bls	1f5c <memcpy+0x24>
    1f50:	e1813000 	orr	r3, r1, r0
    1f54:	e3130003 	tst	r3, #3	; 0x3
    1f58:	0a000008 	beq	1f80 <memcpy+0x48>
    1f5c:	e35e0000 	cmp	lr, #0	; 0x0
    1f60:	08bd8010 	popeq	{r4, pc}
    1f64:	e3a02000 	mov	r2, #0	; 0x0
    1f68:	e4d13001 	ldrb	r3, [r1], #1
    1f6c:	e7c2300c 	strb	r3, [r2, ip]
    1f70:	e2822001 	add	r2, r2, #1	; 0x1
    1f74:	e152000e 	cmp	r2, lr
    1f78:	1afffffa 	bne	1f68 <memcpy+0x30>
    1f7c:	e8bd8010 	pop	{r4, pc}
    1f80:	e5913000 	ldr	r3, [r1]
    1f84:	e58c3000 	str	r3, [ip]
    1f88:	e5912004 	ldr	r2, [r1, #4]
    1f8c:	e58c2004 	str	r2, [ip, #4]
    1f90:	e5913008 	ldr	r3, [r1, #8]
    1f94:	e58c3008 	str	r3, [ip, #8]
    1f98:	e244e010 	sub	lr, r4, #16	; 0x10
    1f9c:	e591300c 	ldr	r3, [r1, #12]
    1fa0:	e35e000f 	cmp	lr, #15	; 0xf
    1fa4:	e58c300c 	str	r3, [ip, #12]
    1fa8:	e2811010 	add	r1, r1, #16	; 0x10
    1fac:	e28cc010 	add	ip, ip, #16	; 0x10
    1fb0:	e1a0400e 	mov	r4, lr
    1fb4:	8afffff1 	bhi	1f80 <memcpy+0x48>
    1fb8:	e35e0003 	cmp	lr, #3	; 0x3
    1fbc:	9affffe6 	bls	1f5c <memcpy+0x24>
    1fc0:	e24ee004 	sub	lr, lr, #4	; 0x4
    1fc4:	e4913004 	ldr	r3, [r1], #4
    1fc8:	e35e0003 	cmp	lr, #3	; 0x3
    1fcc:	e48c3004 	str	r3, [ip], #4
    1fd0:	8afffffa 	bhi	1fc0 <memcpy+0x88>
    1fd4:	e35e0000 	cmp	lr, #0	; 0x0
    1fd8:	1affffe1 	bne	1f64 <memcpy+0x2c>
    1fdc:	e8bd8010 	pop	{r4, pc}

00001fe0 <abDescriptors>:
    1fe0:	01010112 40000002 0005ffff 02010100     .......@........
    1ff0:	02090103 01020043 0932c000 01000004     ....C.....2.....
    2000:	00010202 10002405 01240501 24040101     .....$....$....$
    2010:	24050202 07010006 08038105 04090a00     ...$............
    2020:	0a020001 07000000 40020505 05070000     ...........@....
    2030:	00400282 09030400 4c030e04 43005000     ..@........L.P.C
    2040:	53005500 14004200 53005503 53004200     .U.S.B...U.S.B.S
    2050:	72006500 61006900 12006c00 45004403     .e.r.i.a.l...D.E
    2060:	44004100 30004300 45004400 00000000     .A.D.C.0.D.E....

00002070 <__FUNCTION__.1979>:
    2070:	6b6c7542 0074754f                       BulkOut.

00002078 <__FUNCTION__.1675>:
    2078:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    2088:	6148746e 656c646e 00000072              ntHandler...

00002094 <__FUNCTION__.1666>:
    2094:	52425355 73696765 52726574 65757165     USBRegisterReque
    20a4:	61487473 656c646e 00000072              stHandler...

000020b0 <__FUNCTION__.1628>:
    20b0:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    20c0:	6e617254 72656673 00000000              Transfer....

000020cc <__FUNCTION__.1642>:
    20cc:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    20dc:	006e6f69                                ion.

000020e0 <__FUNCTION__.1609>:
    20e0:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    20f0:	00000000 6c756e28 0000296c 7373410a     ....(null)...Ass
    2100:	69747265 27206e6f 20277325 6c696166     ertion '%s' fail
    2110:	69206465 7325206e 2373253a 0a216425     ed in %s:%s#%d!.
    2120:	00000000 534c4146 00000045 6e69616d     ....FALSE...main
    2130:	7265735f 2e6c6169 00000063 5f544553     _serial.c...SET_
    2140:	454e494c 444f435f 00474e49 54447764     LINE_CODING.dwDT
    2150:	74615245 75253d65 4362202c 46726168     ERate=%u, bCharF
    2160:	616d726f 75253d74 5062202c 74697261     ormat=%u, bParit
    2170:	70795479 75253d65 4462202c 42617461     yType=%u, bDataB
    2180:	3d737469 000a7525 5f544547 454e494c     its=%u..GET_LINE
    2190:	444f435f 00474e49 5f544553 544e4f43     _CODING.SET_CONT
    21a0:	5f4c4f52 454e494c 4154535f 25204554     ROL_LINE_STATE %
    21b0:	00000a58 74696e49 696c6169 676e6973     X...Initialising
    21c0:	42535520 61747320 00006b63 72617453      USB stack..Star
    21d0:	676e6974 42535520 6d6f6320 696e756d     ting USB communi
    21e0:	69746163 00006e6f 69676552 72657473     cation..Register
    21f0:	68206465 6c646e61 66207265 6620726f     ed handler for f
    2200:	656d6172 00000000 69676552 72657473     rame....Register
    2210:	68206465 6c646e61 66207265 6420726f     ed handler for d
    2220:	63697665 74732065 73757461 00000000     evice status....
    2230:	3c786469 00003233 68627375 706c5f77     idx<32..usbhw_lp
    2240:	00632e63 69676552 72657473 68206465     c.c.Registered h
    2250:	6c646e61 66207265 4520726f 78302050     andler for EP 0x
    2260:	000a7825 70795469 3d3e2065 00003020     %x..iType >= 0..
    2270:	63627375 72746e6f 632e6c6f 00000000     usbcontrol.c....
    2280:	70795469 203c2065 00000034 68206f4e     iType < 4...No h
    2290:	6c646e61 66207265 7220726f 79747165     andler for reqty
    22a0:	25206570 00000a64 4c415453 6e6f204c     pe %d...STALL on
    22b0:	00005b20 32302520 00000078 7473205d      [.. %02x...] st
    22c0:	253d7461 00000a78 00782553 6e61485f     at=%x...S%x._Han
    22d0:	52656c64 65757165 20317473 6c696166     dleRequest1 fail
    22e0:	00006465 6e61485f 52656c64 65757165     ed.._HandleReque
    22f0:	20327473 6c696166 00006465 0000003f     st2 failed..?...
    2300:	44626170 72637365 21207069 554e203d     pabDescrip != NU
    2310:	00004c4c 73627375 65726474 00632e71     LL..usbstdreq.c.
    2320:	63736544 20782520 20746f6e 6e756f66     Desc %x not foun
    2330:	000a2164 00782544 69766544 72206563     d!..D%x.Device r
    2340:	25207165 6f6e2064 6d692074 6d656c70     eq %d not implem
    2350:	65746e65 00000a64 656c6c49 206c6167     ented...Illegal 
    2360:	69766564 72206563 25207165 00000a64     device req %d...
    2370:	656c6c49 206c6167 65746e69 63616672     Illegal interfac
    2380:	65722065 64252071 0000000a 72205045     e req %d....EP r
    2390:	25207165 6f6e2064 6d692074 6d656c70     eq %d not implem
    23a0:	65746e65 00000a64 656c6c49 206c6167     ented...Illegal 
    23b0:	72205045 25207165 00000a64 0000210a     EP req %d....!..
