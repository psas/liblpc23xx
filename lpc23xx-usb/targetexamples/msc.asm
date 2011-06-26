
msc.elf:     file format elf32-littlearm


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
      bc:	ea0001a6 	b	75c <main>
      c0:	40007edc 	.word	0x40007edc
      c4:	00003894 	.word	0x00003894
      c8:	40000200 	.word	0x40000200
      cc:	40000200 	.word	0x40000200
      d0:	40000200 	.word	0x40000200
      d4:	400004dc 	.word	0x400004dc

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
     394:	eb000ac3 	bl	2ea8 <__umodsi3>
     398:	e1a03000 	mov	r3, r0
     39c:	e3530009 	cmp	r3, #9	; 0x9
     3a0:	c083300a 	addgt	r3, r3, sl
     3a4:	e2833030 	add	r3, r3, #48	; 0x30
     3a8:	e1a00004 	mov	r0, r4
     3ac:	e5653001 	strb	r3, [r5, #-1]!
     3b0:	e1a01006 	mov	r1, r6
     3b4:	eb000a27 	bl	2c58 <__aeabi_uidiv>
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
     614:	0000317c 	.word	0x0000317c

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

0000075c <main>:
     75c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     760:	ebfffe94 	bl	1b8 <HalSysInit>
     764:	e3a00020 	mov	r0, #32	; 0x20
     768:	ebffffc5 	bl	684 <ConsoleInit>
     76c:	eb00033b 	bl	1460 <BlockDevInit>
     770:	e59f0054 	ldr	r0, [pc, #84]	; 7cc <main+0x70>
     774:	ebffffeb 	bl	728 <puts>
     778:	eb000916 	bl	2bd8 <USBInit>
     77c:	e3a00020 	mov	r0, #32	; 0x20
     780:	eb000571 	bl	1d4c <USBHwNakIntEnable>
     784:	e59f0044 	ldr	r0, [pc, #68]	; 7d0 <main+0x74>
     788:	eb000808 	bl	27b0 <USBRegisterDescriptors>
     78c:	e59f2040 	ldr	r2, [pc, #64]	; 7d4 <main+0x78>
     790:	e3a00001 	mov	r0, #1	; 0x1
     794:	e59f103c 	ldr	r1, [pc, #60]	; 7d8 <main+0x7c>
     798:	eb000730 	bl	2460 <USBRegisterRequestHandler>
     79c:	e3a00085 	mov	r0, #133	; 0x85
     7a0:	e59f1034 	ldr	r1, [pc, #52]	; 7dc <main+0x80>
     7a4:	eb000705 	bl	23c0 <USBHwRegisterEPIntHandler>
     7a8:	e3a00002 	mov	r0, #2	; 0x2
     7ac:	e59f102c 	ldr	r1, [pc, #44]	; 7e0 <main+0x84>
     7b0:	eb000702 	bl	23c0 <USBHwRegisterEPIntHandler>
     7b4:	e59f0028 	ldr	r0, [pc, #40]	; 7e4 <main+0x88>
     7b8:	ebffffda 	bl	728 <puts>
     7bc:	e3a00001 	mov	r0, #1	; 0x1
     7c0:	eb000555 	bl	1d1c <USBHwConnect>
     7c4:	eb0005ea 	bl	1f74 <USBHwISR>
     7c8:	eafffffd 	b	7c4 <main+0x68>
     7cc:	00003184 	.word	0x00003184
     7d0:	00003020 	.word	0x00003020
     7d4:	40000200 	.word	0x40000200
     7d8:	000007e8 	.word	0x000007e8
     7dc:	000009f4 	.word	0x000009f4
     7e0:	00000abc 	.word	0x00000abc
     7e4:	0000319c 	.word	0x0000319c

000007e8 <HandleClassRequest>:
     7e8:	e92d4030 	push	{r4, r5, lr}
     7ec:	e1d050b4 	ldrh	r5, [r0, #4]
     7f0:	e3550000 	cmp	r5, #0	; 0x0
     7f4:	0a000003 	beq	808 <HandleClassRequest+0x20>
     7f8:	e1a01005 	mov	r1, r5
     7fc:	e59f0084 	ldr	r0, [pc, #132]	; 888 <HandleClassRequest+0xa0>
     800:	ebffff92 	bl	650 <printf>
     804:	ea000016 	b	864 <HandleClassRequest+0x7c>
     808:	e1d040b2 	ldrh	r4, [r0, #2]
     80c:	e3540000 	cmp	r4, #0	; 0x0
     810:	0a000004 	beq	828 <HandleClassRequest+0x40>
     814:	e1a01004 	mov	r1, r4
     818:	e59f006c 	ldr	r0, [pc, #108]	; 88c <HandleClassRequest+0xa4>
     81c:	ebffff8b 	bl	650 <printf>
     820:	e1a00005 	mov	r0, r5
     824:	e8bd8030 	pop	{r4, r5, pc}
     828:	e5d03001 	ldrb	r3, [r0, #1]
     82c:	e35300fe 	cmp	r3, #254	; 0xfe
     830:	0a000002 	beq	840 <HandleClassRequest+0x58>
     834:	e35300ff 	cmp	r3, #255	; 0xff
     838:	1a00000e 	bne	878 <HandleClassRequest+0x90>
     83c:	ea000005 	b	858 <HandleClassRequest+0x70>
     840:	e3a03001 	mov	r3, #1	; 0x1
     844:	e5922000 	ldr	r2, [r2]
     848:	e1a00003 	mov	r0, r3
     84c:	e5c24000 	strb	r4, [r2]
     850:	e5813000 	str	r3, [r1]
     854:	e8bd8030 	pop	{r4, r5, pc}
     858:	e1d030b6 	ldrh	r3, [r0, #6]
     85c:	e3530000 	cmp	r3, #0	; 0x0
     860:	0a000001 	beq	86c <HandleClassRequest+0x84>
     864:	e3a00000 	mov	r0, #0	; 0x0
     868:	e8bd8030 	pop	{r4, r5, pc}
     86c:	eb000159 	bl	dd8 <MSCBotReset>
     870:	e3a00001 	mov	r0, #1	; 0x1
     874:	e8bd8030 	pop	{r4, r5, pc}
     878:	e59f0010 	ldr	r0, [pc, #16]	; 890 <HandleClassRequest+0xa8>
     87c:	ebffffa9 	bl	728 <puts>
     880:	e1a00004 	mov	r0, r4
     884:	e8bd8030 	pop	{r4, r5, pc}
     888:	000031b8 	.word	0x000031b8
     88c:	000031c8 	.word	0x000031c8
     890:	000031d8 	.word	0x000031d8

00000894 <BOTStall>:
     894:	e59f2024 	ldr	r2, [pc, #36]	; 8c0 <BOTStall+0x2c>
     898:	e1d230dc 	ldrsb	r3, [r2, #12]
     89c:	e3530000 	cmp	r3, #0	; 0x0
     8a0:	ba000003 	blt	8b4 <BOTStall+0x20>
     8a4:	e5923008 	ldr	r3, [r2, #8]
     8a8:	e3530000 	cmp	r3, #0	; 0x0
     8ac:	13a00002 	movne	r0, #2	; 0x2
     8b0:	1a000000 	bne	8b8 <BOTStall+0x24>
     8b4:	e3a00085 	mov	r0, #133	; 0x85
     8b8:	e3a01001 	mov	r1, #1	; 0x1
     8bc:	ea00052d 	b	1d78 <USBHwEPStall>
     8c0:	4000020c 	.word	0x4000020c

000008c4 <SendCSW>:
     8c4:	e59f2050 	ldr	r2, [pc, #80]	; 91c <SendCSW+0x58>
     8c8:	e59f3050 	ldr	r3, [pc, #80]	; 920 <SendCSW+0x5c>
     8cc:	e92d4030 	push	{r4, r5, lr}
     8d0:	e5933000 	ldr	r3, [r3]
     8d4:	e592e008 	ldr	lr, [r2, #8]
     8d8:	e063e00e 	rsb	lr, r3, lr
     8dc:	e59fc040 	ldr	ip, [pc, #64]	; 924 <SendCSW+0x60>
     8e0:	e20040ff 	and	r4, r0, #255	; 0xff
     8e4:	e1ceefce 	bic	lr, lr, lr, asr #31
     8e8:	e5925004 	ldr	r5, [r2, #4]
     8ec:	e59f3034 	ldr	r3, [pc, #52]	; 928 <SendCSW+0x64>
     8f0:	e1a0200e 	mov	r2, lr
     8f4:	e1a01004 	mov	r1, r4
     8f8:	e59f002c 	ldr	r0, [pc, #44]	; 92c <SendCSW+0x68>
     8fc:	e88c0028 	stm	ip, {r3, r5}
     900:	e5cc400c 	strb	r4, [ip, #12]
     904:	e58ce008 	str	lr, [ip, #8]
     908:	ebffff50 	bl	650 <printf>
     90c:	e59f301c 	ldr	r3, [pc, #28]	; 930 <SendCSW+0x6c>
     910:	e3a02003 	mov	r2, #3	; 0x3
     914:	e5832000 	str	r2, [r3]
     918:	e8bd8030 	pop	{r4, r5, pc}
     91c:	4000020c 	.word	0x4000020c
     920:	40000204 	.word	0x40000204
     924:	4000022c 	.word	0x4000022c
     928:	53425355 	.word	0x53425355
     92c:	000031e8 	.word	0x000031e8
     930:	4000023c 	.word	0x4000023c

00000934 <HandleDataIn>:
     934:	e92d40f0 	push	{r4, r5, r6, r7, lr}
     938:	e59f60a0 	ldr	r6, [pc, #160]	; 9e0 <HandleDataIn+0xac>
     93c:	e59f40a0 	ldr	r4, [pc, #160]	; 9e4 <HandleDataIn+0xb0>
     940:	e59f50a0 	ldr	r5, [pc, #160]	; 9e8 <HandleDataIn+0xb4>
     944:	e286000f 	add	r0, r6, #15	; 0xf
     948:	e5d6100e 	ldrb	r1, [r6, #14]
     94c:	e5942000 	ldr	r2, [r4]
     950:	e5953000 	ldr	r3, [r5]
     954:	eb00012f 	bl	e18 <SCSIHandleData>
     958:	e3500000 	cmp	r0, #0	; 0x0
     95c:	e5840000 	str	r0, [r4]
     960:	1a000002 	bne	970 <HandleDataIn+0x3c>
     964:	ebffffca 	bl	894 <BOTStall>
     968:	e3a00001 	mov	r0, #1	; 0x1
     96c:	ea000019 	b	9d8 <HandleDataIn+0xa4>
     970:	e59f7074 	ldr	r7, [pc, #116]	; 9ec <HandleDataIn+0xb8>
     974:	e5953000 	ldr	r3, [r5]
     978:	e5974000 	ldr	r4, [r7]
     97c:	e1530004 	cmp	r3, r4
     980:	2a000009 	bcs	9ac <HandleDataIn+0x78>
     984:	e0634004 	rsb	r4, r3, r4
     988:	e3540040 	cmp	r4, #64	; 0x40
     98c:	23a04040 	movcs	r4, #64	; 0x40
     990:	e1a01000 	mov	r1, r0
     994:	e1a02004 	mov	r2, r4
     998:	e3a00085 	mov	r0, #133	; 0x85
     99c:	eb0004fd 	bl	1d98 <USBHwEPWrite>
     9a0:	e5953000 	ldr	r3, [r5]
     9a4:	e0844003 	add	r4, r4, r3
     9a8:	e5854000 	str	r4, [r5]
     9ac:	e5952000 	ldr	r2, [r5]
     9b0:	e5973000 	ldr	r3, [r7]
     9b4:	e1520003 	cmp	r2, r3
     9b8:	18bd80f0 	popne	{r4, r5, r6, r7, pc}
     9bc:	e5963008 	ldr	r3, [r6, #8]
     9c0:	e1520003 	cmp	r2, r3
     9c4:	0a000002 	beq	9d4 <HandleDataIn+0xa0>
     9c8:	e59f0020 	ldr	r0, [pc, #32]	; 9f0 <HandleDataIn+0xbc>
     9cc:	ebffff1f 	bl	650 <printf>
     9d0:	ebffffaf 	bl	894 <BOTStall>
     9d4:	e3a00000 	mov	r0, #0	; 0x0
     9d8:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
     9dc:	eaffffb8 	b	8c4 <SendCSW>
     9e0:	4000020c 	.word	0x4000020c
     9e4:	40000240 	.word	0x40000240
     9e8:	40000208 	.word	0x40000208
     9ec:	40000204 	.word	0x40000204
     9f0:	00003204 	.word	0x00003204

000009f4 <MSCBotBulkIn>:
     9f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     9f8:	e3110002 	tst	r1, #2	; 0x2
     9fc:	e24dd004 	sub	sp, sp, #4	; 0x4
     a00:	1a000023 	bne	a94 <MSCBotBulkIn+0xa0>
     a04:	e59f3090 	ldr	r3, [pc, #144]	; a9c <MSCBotBulkIn+0xa8>
     a08:	e5931000 	ldr	r1, [r3]
     a0c:	e3510004 	cmp	r1, #4	; 0x4
     a10:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
     a14:	ea000014 	b	a6c <MSCBotBulkIn+0x78>
     a18:	00000a94 	.word	0x00000a94
     a1c:	00000a94 	.word	0x00000a94
     a20:	00000a2c 	.word	0x00000a2c
     a24:	00000a38 	.word	0x00000a38
     a28:	00000a58 	.word	0x00000a58
     a2c:	e28dd004 	add	sp, sp, #4	; 0x4
     a30:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     a34:	eaffffbe 	b	934 <HandleDataIn>
     a38:	e3a0200d 	mov	r2, #13	; 0xd
     a3c:	e3a00085 	mov	r0, #133	; 0x85
     a40:	e59f1058 	ldr	r1, [pc, #88]	; aa0 <MSCBotBulkIn+0xac>
     a44:	eb0004d3 	bl	1d98 <USBHwEPWrite>
     a48:	e59f304c 	ldr	r3, [pc, #76]	; a9c <MSCBotBulkIn+0xa8>
     a4c:	e3a02000 	mov	r2, #0	; 0x0
     a50:	e5832000 	str	r2, [r3]
     a54:	ea00000e 	b	a94 <MSCBotBulkIn+0xa0>
     a58:	e3a00085 	mov	r0, #133	; 0x85
     a5c:	e3a01001 	mov	r1, #1	; 0x1
     a60:	e28dd004 	add	sp, sp, #4	; 0x4
     a64:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     a68:	ea0004c2 	b	1d78 <USBHwEPStall>
     a6c:	e59f0030 	ldr	r0, [pc, #48]	; aa4 <MSCBotBulkIn+0xb0>
     a70:	ebfffef6 	bl	650 <printf>
     a74:	e59fc02c 	ldr	ip, [pc, #44]	; aa8 <MSCBotBulkIn+0xb4>
     a78:	e59f002c 	ldr	r0, [pc, #44]	; aac <MSCBotBulkIn+0xb8>
     a7c:	e59f102c 	ldr	r1, [pc, #44]	; ab0 <MSCBotBulkIn+0xbc>
     a80:	e59f202c 	ldr	r2, [pc, #44]	; ab4 <MSCBotBulkIn+0xc0>
     a84:	e59f302c 	ldr	r3, [pc, #44]	; ab8 <MSCBotBulkIn+0xc4>
     a88:	e58dc000 	str	ip, [sp]
     a8c:	ebfffeef 	bl	650 <printf>
     a90:	eafffffe 	b	a90 <MSCBotBulkIn+0x9c>
     a94:	e28dd004 	add	sp, sp, #4	; 0x4
     a98:	e8bd8000 	pop	{pc}
     a9c:	4000023c 	.word	0x4000023c
     aa0:	4000022c 	.word	0x4000022c
     aa4:	00003214 	.word	0x00003214
     aa8:	0000018f 	.word	0x0000018f
     aac:	00003228 	.word	0x00003228
     ab0:	00003250 	.word	0x00003250
     ab4:	00003258 	.word	0x00003258
     ab8:	00003094 	.word	0x00003094

00000abc <MSCBotBulkOut>:
     abc:	e92d4070 	push	{r4, r5, r6, lr}
     ac0:	e3110002 	tst	r1, #2	; 0x2
     ac4:	e24dd00c 	sub	sp, sp, #12	; 0xc
     ac8:	e20000ff 	and	r0, r0, #255	; 0xff
     acc:	1a0000aa 	bne	d7c <MSCBotBulkOut+0x2c0>
     ad0:	e59f32ac 	ldr	r3, [pc, #684]	; d84 <MSCBotBulkOut+0x2c8>
     ad4:	e5931000 	ldr	r1, [r3]
     ad8:	e3510004 	cmp	r1, #4	; 0x4
     adc:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
     ae0:	ea000086 	b	d00 <MSCBotBulkOut+0x244>
     ae4:	00000af8 	.word	0x00000af8
     ae8:	00000c18 	.word	0x00000c18
     aec:	00000cc4 	.word	0x00000cc4
     af0:	00000cc4 	.word	0x00000cc4
     af4:	00000cf0 	.word	0x00000cf0
     af8:	e59f4288 	ldr	r4, [pc, #648]	; d88 <MSCBotBulkOut+0x2cc>
     afc:	e3a02020 	mov	r2, #32	; 0x20
     b00:	e1a01004 	mov	r1, r4
     b04:	eb0004c6 	bl	1e24 <USBHwEPRead>
     b08:	e350001f 	cmp	r0, #31	; 0x1f
     b0c:	e58d0008 	str	r0, [sp, #8]
     b10:	11a01000 	movne	r1, r0
     b14:	159f0270 	ldrne	r0, [pc, #624]	; d8c <MSCBotBulkOut+0x2d0>
     b18:	1a00000f 	bne	b5c <MSCBotBulkOut+0xa0>
     b1c:	e5941000 	ldr	r1, [r4]
     b20:	e59f3268 	ldr	r3, [pc, #616]	; d90 <MSCBotBulkOut+0x2d4>
     b24:	e1510003 	cmp	r1, r3
     b28:	159f0264 	ldrne	r0, [pc, #612]	; d94 <MSCBotBulkOut+0x2d8>
     b2c:	1a00000a 	bne	b5c <MSCBotBulkOut+0xa0>
     b30:	e5d4500d 	ldrb	r5, [r4, #13]
     b34:	e3550000 	cmp	r5, #0	; 0x0
     b38:	11a01005 	movne	r1, r5
     b3c:	159f0254 	ldrne	r0, [pc, #596]	; d98 <MSCBotBulkOut+0x2dc>
     b40:	1a000005 	bne	b5c <MSCBotBulkOut+0xa0>
     b44:	e5d4c00e 	ldrb	ip, [r4, #14]
     b48:	e24c3001 	sub	r3, ip, #1	; 0x1
     b4c:	e353000f 	cmp	r3, #15	; 0xf
     b50:	9a000074 	bls	d28 <MSCBotBulkOut+0x26c>
     b54:	e59f0240 	ldr	r0, [pc, #576]	; d9c <MSCBotBulkOut+0x2e0>
     b58:	e1a0100c 	mov	r1, ip
     b5c:	ebfffebb 	bl	650 <printf>
     b60:	e3a00085 	mov	r0, #133	; 0x85
     b64:	e3a01001 	mov	r1, #1	; 0x1
     b68:	eb000482 	bl	1d78 <USBHwEPStall>
     b6c:	e3a00002 	mov	r0, #2	; 0x2
     b70:	e3a01001 	mov	r1, #1	; 0x1
     b74:	eb00047f 	bl	1d78 <USBHwEPStall>
     b78:	e3a02004 	mov	r2, #4	; 0x4
     b7c:	ea000022 	b	c0c <MSCBotBulkOut+0x150>
     b80:	e59d2008 	ldr	r2, [sp, #8]
     b84:	e3520000 	cmp	r2, #0	; 0x0
     b88:	da000009 	ble	bb4 <MSCBotBulkOut+0xf8>
     b8c:	e3140080 	tst	r4, #128	; 0x80
     b90:	e59d3004 	ldr	r3, [sp, #4]
     b94:	0a000002 	beq	ba4 <MSCBotBulkOut+0xe8>
     b98:	e3530000 	cmp	r3, #0	; 0x0
     b9c:	0a000002 	beq	bac <MSCBotBulkOut+0xf0>
     ba0:	ea000003 	b	bb4 <MSCBotBulkOut+0xf8>
     ba4:	e3530000 	cmp	r3, #0	; 0x0
     ba8:	0a000001 	beq	bb4 <MSCBotBulkOut+0xf8>
     bac:	e59f01ec 	ldr	r0, [pc, #492]	; da0 <MSCBotBulkOut+0x2e4>
     bb0:	ea000004 	b	bc8 <MSCBotBulkOut+0x10c>
     bb4:	e59f31cc 	ldr	r3, [pc, #460]	; d88 <MSCBotBulkOut+0x2cc>
     bb8:	e5933008 	ldr	r3, [r3, #8]
     bbc:	e1520003 	cmp	r2, r3
     bc0:	9a000004 	bls	bd8 <MSCBotBulkOut+0x11c>
     bc4:	e59f01d8 	ldr	r0, [pc, #472]	; da4 <MSCBotBulkOut+0x2e8>
     bc8:	ebfffed6 	bl	728 <puts>
     bcc:	ebffff30 	bl	894 <BOTStall>
     bd0:	e3a00002 	mov	r0, #2	; 0x2
     bd4:	ea000038 	b	cbc <MSCBotBulkOut+0x200>
     bd8:	e59f31c8 	ldr	r3, [pc, #456]	; da8 <MSCBotBulkOut+0x2ec>
     bdc:	e3520000 	cmp	r2, #0	; 0x0
     be0:	e5832000 	str	r2, [r3]
     be4:	0a000003 	beq	bf8 <MSCBotBulkOut+0x13c>
     be8:	e59d3004 	ldr	r3, [sp, #4]
     bec:	e3530000 	cmp	r3, #0	; 0x0
     bf0:	03a02001 	moveq	r2, #1	; 0x1
     bf4:	0a000004 	beq	c0c <MSCBotBulkOut+0x150>
     bf8:	e59f3184 	ldr	r3, [pc, #388]	; d84 <MSCBotBulkOut+0x2c8>
     bfc:	e3a02002 	mov	r2, #2	; 0x2
     c00:	e5832000 	str	r2, [r3]
     c04:	ebffff4a 	bl	934 <HandleDataIn>
     c08:	ea00005b 	b	d7c <MSCBotBulkOut+0x2c0>
     c0c:	e59f3170 	ldr	r3, [pc, #368]	; d84 <MSCBotBulkOut+0x2c8>
     c10:	e5832000 	str	r2, [r3]
     c14:	ea000058 	b	d7c <MSCBotBulkOut+0x2c0>
     c18:	e59f518c 	ldr	r5, [pc, #396]	; dac <MSCBotBulkOut+0x2f0>
     c1c:	e59f3184 	ldr	r3, [pc, #388]	; da8 <MSCBotBulkOut+0x2ec>
     c20:	e5951000 	ldr	r1, [r5]
     c24:	e5932000 	ldr	r2, [r3]
     c28:	e1510002 	cmp	r1, r2
     c2c:	2a000014 	bcs	c84 <MSCBotBulkOut+0x1c8>
     c30:	e59f4178 	ldr	r4, [pc, #376]	; db0 <MSCBotBulkOut+0x2f4>
     c34:	e0612002 	rsb	r2, r1, r2
     c38:	e3a00002 	mov	r0, #2	; 0x2
     c3c:	e5941000 	ldr	r1, [r4]
     c40:	eb000477 	bl	1e24 <USBHwEPRead>
     c44:	e1a06000 	mov	r6, r0
     c48:	e59f0138 	ldr	r0, [pc, #312]	; d88 <MSCBotBulkOut+0x2cc>
     c4c:	e5953000 	ldr	r3, [r5]
     c50:	e5d0100e 	ldrb	r1, [r0, #14]
     c54:	e5942000 	ldr	r2, [r4]
     c58:	e280000f 	add	r0, r0, #15	; 0xf
     c5c:	eb00006d 	bl	e18 <SCSIHandleData>
     c60:	e3500000 	cmp	r0, #0	; 0x0
     c64:	15953000 	ldrne	r3, [r5]
     c68:	10863003 	addne	r3, r6, r3
     c6c:	e5840000 	str	r0, [r4]
     c70:	15853000 	strne	r3, [r5]
     c74:	1a000002 	bne	c84 <MSCBotBulkOut+0x1c8>
     c78:	ebffff05 	bl	894 <BOTStall>
     c7c:	e3a00001 	mov	r0, #1	; 0x1
     c80:	ea00000d 	b	cbc <MSCBotBulkOut+0x200>
     c84:	e59f3120 	ldr	r3, [pc, #288]	; dac <MSCBotBulkOut+0x2f0>
     c88:	e5932000 	ldr	r2, [r3]
     c8c:	e59f3114 	ldr	r3, [pc, #276]	; da8 <MSCBotBulkOut+0x2ec>
     c90:	e5933000 	ldr	r3, [r3]
     c94:	e1520003 	cmp	r2, r3
     c98:	1a000037 	bne	d7c <MSCBotBulkOut+0x2c0>
     c9c:	e59f30e4 	ldr	r3, [pc, #228]	; d88 <MSCBotBulkOut+0x2cc>
     ca0:	e5933008 	ldr	r3, [r3, #8]
     ca4:	e1520003 	cmp	r2, r3
     ca8:	0a000002 	beq	cb8 <MSCBotBulkOut+0x1fc>
     cac:	e59f0100 	ldr	r0, [pc, #256]	; db4 <MSCBotBulkOut+0x2f8>
     cb0:	ebfffe66 	bl	650 <printf>
     cb4:	ebfffef6 	bl	894 <BOTStall>
     cb8:	e3a00000 	mov	r0, #0	; 0x0
     cbc:	ebffff00 	bl	8c4 <SendCSW>
     cc0:	ea00002d 	b	d7c <MSCBotBulkOut+0x2c0>
     cc4:	e3a01000 	mov	r1, #0	; 0x0
     cc8:	e1a02001 	mov	r2, r1
     ccc:	eb000454 	bl	1e24 <USBHwEPRead>
     cd0:	e59f40ac 	ldr	r4, [pc, #172]	; d84 <MSCBotBulkOut+0x2c8>
     cd4:	e1a02000 	mov	r2, r0
     cd8:	e5941000 	ldr	r1, [r4]
     cdc:	e59f00d4 	ldr	r0, [pc, #212]	; db8 <MSCBotBulkOut+0x2fc>
     ce0:	ebfffe5a 	bl	650 <printf>
     ce4:	e3a03000 	mov	r3, #0	; 0x0
     ce8:	e5843000 	str	r3, [r4]
     cec:	ea000022 	b	d7c <MSCBotBulkOut+0x2c0>
     cf0:	e3a00002 	mov	r0, #2	; 0x2
     cf4:	e3a01001 	mov	r1, #1	; 0x1
     cf8:	eb00041e 	bl	1d78 <USBHwEPStall>
     cfc:	ea00001e 	b	d7c <MSCBotBulkOut+0x2c0>
     d00:	e59f00b4 	ldr	r0, [pc, #180]	; dbc <MSCBotBulkOut+0x300>
     d04:	ebfffe51 	bl	650 <printf>
     d08:	e59fc0b0 	ldr	ip, [pc, #176]	; dc0 <MSCBotBulkOut+0x304>
     d0c:	e59f00b0 	ldr	r0, [pc, #176]	; dc4 <MSCBotBulkOut+0x308>
     d10:	e59f10b0 	ldr	r1, [pc, #176]	; dc8 <MSCBotBulkOut+0x30c>
     d14:	e59f20b0 	ldr	r2, [pc, #176]	; dcc <MSCBotBulkOut+0x310>
     d18:	e59f30b0 	ldr	r3, [pc, #176]	; dd0 <MSCBotBulkOut+0x314>
     d1c:	e58dc000 	str	ip, [sp]
     d20:	ebfffe4a 	bl	650 <printf>
     d24:	eafffffe 	b	d24 <MSCBotBulkOut+0x268>
     d28:	e5d4200c 	ldrb	r2, [r4, #12]
     d2c:	e5d4300f 	ldrb	r3, [r4, #15]
     d30:	e5941008 	ldr	r1, [r4, #8]
     d34:	e59f0098 	ldr	r0, [pc, #152]	; dd4 <MSCBotBulkOut+0x318>
     d38:	e58dc000 	str	ip, [sp]
     d3c:	ebfffe43 	bl	650 <printf>
     d40:	e59fc060 	ldr	ip, [pc, #96]	; da8 <MSCBotBulkOut+0x2ec>
     d44:	e58c5000 	str	r5, [ip]
     d48:	e59fc05c 	ldr	ip, [pc, #92]	; dac <MSCBotBulkOut+0x2f0>
     d4c:	e5d4100e 	ldrb	r1, [r4, #14]
     d50:	e284000f 	add	r0, r4, #15	; 0xf
     d54:	e28d3004 	add	r3, sp, #4	; 0x4
     d58:	e28d2008 	add	r2, sp, #8	; 0x8
     d5c:	e58c5000 	str	r5, [ip]
     d60:	e5d4400c 	ldrb	r4, [r4, #12]
     d64:	eb0000b7 	bl	1048 <SCSIHandleCmd>
     d68:	e59f3040 	ldr	r3, [pc, #64]	; db0 <MSCBotBulkOut+0x2f4>
     d6c:	e3500000 	cmp	r0, #0	; 0x0
     d70:	e5830000 	str	r0, [r3]
     d74:	1affff81 	bne	b80 <MSCBotBulkOut+0xc4>
     d78:	eaffffbe 	b	c78 <MSCBotBulkOut+0x1bc>
     d7c:	e28dd00c 	add	sp, sp, #12	; 0xc
     d80:	e8bd8070 	pop	{r4, r5, r6, pc}
     d84:	4000023c 	.word	0x4000023c
     d88:	4000020c 	.word	0x4000020c
     d8c:	00003264 	.word	0x00003264
     d90:	43425355 	.word	0x43425355
     d94:	0000327c 	.word	0x0000327c
     d98:	00003294 	.word	0x00003294
     d9c:	000032a4 	.word	0x000032a4
     da0:	000032b8 	.word	0x000032b8
     da4:	000032e0 	.word	0x000032e0
     da8:	40000204 	.word	0x40000204
     dac:	40000208 	.word	0x40000208
     db0:	40000240 	.word	0x40000240
     db4:	000032f4 	.word	0x000032f4
     db8:	00003304 	.word	0x00003304
     dbc:	00003214 	.word	0x00003214
     dc0:	00000163 	.word	0x00000163
     dc4:	00003228 	.word	0x00003228
     dc8:	00003250 	.word	0x00003250
     dcc:	00003258 	.word	0x00003258
     dd0:	000030a4 	.word	0x000030a4
     dd4:	00003328 	.word	0x00003328

00000dd8 <MSCBotReset>:
     dd8:	e92d4010 	push	{r4, lr}
     ddc:	e59f4018 	ldr	r4, [pc, #24]	; dfc <MSCBotReset+0x24>
     de0:	e59f0018 	ldr	r0, [pc, #24]	; e00 <MSCBotReset+0x28>
     de4:	e5941000 	ldr	r1, [r4]
     de8:	ebfffe18 	bl	650 <printf>
     dec:	e3a03000 	mov	r3, #0	; 0x0
     df0:	e5843000 	str	r3, [r4]
     df4:	e8bd4010 	pop	{r4, lr}
     df8:	ea000001 	b	e04 <SCSIReset>
     dfc:	4000023c 	.word	0x4000023c
     e00:	00003354 	.word	0x00003354

00000e04 <SCSIReset>:
     e04:	e59f3008 	ldr	r3, [pc, #8]	; e14 <SCSIReset+0x10>
     e08:	e3a02000 	mov	r2, #0	; 0x0
     e0c:	e5832000 	str	r2, [r3]
     e10:	e12fff1e 	bx	lr
     e14:	40000244 	.word	0x40000244

00000e18 <SCSIHandleData>:
     e18:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
     e1c:	e5d04000 	ldrb	r4, [r0]
     e20:	e3540012 	cmp	r4, #18	; 0x12
     e24:	e24dd004 	sub	sp, sp, #4	; 0x4
     e28:	e1a05002 	mov	r5, r2
     e2c:	e1a06003 	mov	r6, r3
     e30:	0a000027 	beq	ed4 <SCSIHandleData+0xbc>
     e34:	8a000006 	bhi	e54 <SCSIHandleData+0x3c>
     e38:	e3540003 	cmp	r4, #3	; 0x3
     e3c:	0a000015 	beq	e98 <SCSIHandleData+0x80>
     e40:	e3540004 	cmp	r4, #4	; 0x4
     e44:	0a000073 	beq	1018 <SCSIHandleData+0x200>
     e48:	e3540000 	cmp	r4, #0	; 0x0
     e4c:	0a00000b 	beq	e80 <SCSIHandleData+0x68>
     e50:	ea00006b 	b	1004 <SCSIHandleData+0x1ec>
     e54:	e3540028 	cmp	r4, #40	; 0x28
     e58:	0a000035 	beq	f34 <SCSIHandleData+0x11c>
     e5c:	8a000002 	bhi	e6c <SCSIHandleData+0x54>
     e60:	e3540025 	cmp	r4, #37	; 0x25
     e64:	1a000066 	bne	1004 <SCSIHandleData+0x1ec>
     e68:	ea00001e 	b	ee8 <SCSIHandleData+0xd0>
     e6c:	e354002a 	cmp	r4, #42	; 0x2a
     e70:	0a000045 	beq	f8c <SCSIHandleData+0x174>
     e74:	e354002f 	cmp	r4, #47	; 0x2f
     e78:	1a000061 	bne	1004 <SCSIHandleData+0x1ec>
     e7c:	ea000065 	b	1018 <SCSIHandleData+0x200>
     e80:	e59f31a0 	ldr	r3, [pc, #416]	; 1028 <SCSIHandleData+0x210>
     e84:	e5933000 	ldr	r3, [r3]
     e88:	e3530000 	cmp	r3, #0	; 0x0
     e8c:	159f0198 	ldrne	r0, [pc, #408]	; 102c <SCSIHandleData+0x214>
     e90:	1a000055 	bne	fec <SCSIHandleData+0x1d4>
     e94:	ea00005f 	b	1018 <SCSIHandleData+0x200>
     e98:	e1a00002 	mov	r0, r2
     e9c:	e59f118c 	ldr	r1, [pc, #396]	; 1030 <SCSIHandleData+0x218>
     ea0:	e3a02012 	mov	r2, #18	; 0x12
     ea4:	eb000833 	bl	2f78 <memcpy>
     ea8:	e59f0178 	ldr	r0, [pc, #376]	; 1028 <SCSIHandleData+0x210>
     eac:	e5903000 	ldr	r3, [r0]
     eb0:	e59fc17c 	ldr	ip, [pc, #380]	; 1034 <SCSIHandleData+0x21c>
     eb4:	e1a02823 	lsr	r2, r3, #16
     eb8:	e1a01423 	lsr	r1, r3, #8
     ebc:	e5c5300d 	strb	r3, [r5, #13]
     ec0:	e3a03000 	mov	r3, #0	; 0x0
     ec4:	e5c52002 	strb	r2, [r5, #2]
     ec8:	e5c5100c 	strb	r1, [r5, #12]
     ecc:	e5803000 	str	r3, [r0]
     ed0:	ea000051 	b	101c <SCSIHandleData+0x204>
     ed4:	e1a00002 	mov	r0, r2
     ed8:	e59f1158 	ldr	r1, [pc, #344]	; 1038 <SCSIHandleData+0x220>
     edc:	e3a02024 	mov	r2, #36	; 0x24
     ee0:	eb000824 	bl	2f78 <memcpy>
     ee4:	ea00004b 	b	1018 <SCSIHandleData+0x200>
     ee8:	e1a0000d 	mov	r0, sp
     eec:	eb000118 	bl	1354 <BlockDevGetSize>
     ef0:	e59d3000 	ldr	r3, [sp]
     ef4:	e2433001 	sub	r3, r3, #1	; 0x1
     ef8:	e1a008a3 	lsr	r0, r3, #17
     efc:	e1a014a3 	lsr	r1, r3, #9
     f00:	e59fc12c 	ldr	ip, [pc, #300]	; 1034 <SCSIHandleData+0x21c>
     f04:	e1a03ca3 	lsr	r3, r3, #25
     f08:	e3a02000 	mov	r2, #0	; 0x0
     f0c:	e5c53001 	strb	r3, [r5, #1]
     f10:	e3a03002 	mov	r3, #2	; 0x2
     f14:	e5c52007 	strb	r2, [r5, #7]
     f18:	e5c50002 	strb	r0, [r5, #2]
     f1c:	e5c51003 	strb	r1, [r5, #3]
     f20:	e5c53006 	strb	r3, [r5, #6]
     f24:	e5c52000 	strb	r2, [r5]
     f28:	e5c52004 	strb	r2, [r5, #4]
     f2c:	e5c52005 	strb	r2, [r5, #5]
     f30:	ea000039 	b	101c <SCSIHandleData+0x204>
     f34:	e1a04b83 	lsl	r4, r3, #23
     f38:	e1a04ba4 	lsr	r4, r4, #23
     f3c:	e3540000 	cmp	r4, #0	; 0x0
     f40:	e5d0a005 	ldrb	sl, [r0, #5]
     f44:	e5d08002 	ldrb	r8, [r0, #2]
     f48:	e5d05003 	ldrb	r5, [r0, #3]
     f4c:	e5d07004 	ldrb	r7, [r0, #4]
     f50:	1a000028 	bne	ff8 <SCSIHandleData+0x1e0>
     f54:	e3a00052 	mov	r0, #82	; 0x52
     f58:	ebfffddc 	bl	6d0 <putchar>
     f5c:	e1a00805 	lsl	r0, r5, #16
     f60:	e1800c08 	orr	r0, r0, r8, lsl #24
     f64:	e180000a 	orr	r0, r0, sl
     f68:	e1800407 	orr	r0, r0, r7, lsl #8
     f6c:	e08004a6 	add	r0, r0, r6, lsr #9
     f70:	e59f10bc 	ldr	r1, [pc, #188]	; 1034 <SCSIHandleData+0x21c>
     f74:	eb000131 	bl	1440 <BlockDevRead>
     f78:	e3500000 	cmp	r0, #0	; 0x0
     f7c:	aa00001d 	bge	ff8 <SCSIHandleData+0x1e0>
     f80:	e59f00b4 	ldr	r0, [pc, #180]	; 103c <SCSIHandleData+0x224>
     f84:	e59f20b4 	ldr	r2, [pc, #180]	; 1040 <SCSIHandleData+0x228>
     f88:	ea000015 	b	fe4 <SCSIHandleData+0x1cc>
     f8c:	e2833040 	add	r3, r3, #64	; 0x40
     f90:	e1a04b83 	lsl	r4, r3, #23
     f94:	e1a04ba4 	lsr	r4, r4, #23
     f98:	e3540000 	cmp	r4, #0	; 0x0
     f9c:	e5d0a005 	ldrb	sl, [r0, #5]
     fa0:	e5d07002 	ldrb	r7, [r0, #2]
     fa4:	e5d05003 	ldrb	r5, [r0, #3]
     fa8:	e5d08004 	ldrb	r8, [r0, #4]
     fac:	1a000011 	bne	ff8 <SCSIHandleData+0x1e0>
     fb0:	e3a00057 	mov	r0, #87	; 0x57
     fb4:	ebfffdc5 	bl	6d0 <putchar>
     fb8:	e1a00805 	lsl	r0, r5, #16
     fbc:	e1800c07 	orr	r0, r0, r7, lsl #24
     fc0:	e180000a 	orr	r0, r0, sl
     fc4:	e1800408 	orr	r0, r0, r8, lsl #8
     fc8:	e08004a6 	add	r0, r0, r6, lsr #9
     fcc:	e59f1060 	ldr	r1, [pc, #96]	; 1034 <SCSIHandleData+0x21c>
     fd0:	eb00011e 	bl	1450 <BlockDevWrite>
     fd4:	e3500000 	cmp	r0, #0	; 0x0
     fd8:	aa000006 	bge	ff8 <SCSIHandleData+0x1e0>
     fdc:	e59f0060 	ldr	r0, [pc, #96]	; 1044 <SCSIHandleData+0x22c>
     fe0:	e3a02bc3 	mov	r2, #199680	; 0x30c00
     fe4:	e59f303c 	ldr	r3, [pc, #60]	; 1028 <SCSIHandleData+0x210>
     fe8:	e5832000 	str	r2, [r3]
     fec:	ebfffdcd 	bl	728 <puts>
     ff0:	e1a0c004 	mov	ip, r4
     ff4:	ea000008 	b	101c <SCSIHandleData+0x204>
     ff8:	e59f3034 	ldr	r3, [pc, #52]	; 1034 <SCSIHandleData+0x21c>
     ffc:	e084c003 	add	ip, r4, r3
    1000:	ea000005 	b	101c <SCSIHandleData+0x204>
    1004:	e59f301c 	ldr	r3, [pc, #28]	; 1028 <SCSIHandleData+0x210>
    1008:	e3a02a52 	mov	r2, #335872	; 0x52000
    100c:	e3a0c000 	mov	ip, #0	; 0x0
    1010:	e5832000 	str	r2, [r3]
    1014:	ea000000 	b	101c <SCSIHandleData+0x204>
    1018:	e59fc014 	ldr	ip, [pc, #20]	; 1034 <SCSIHandleData+0x21c>
    101c:	e1a0000c 	mov	r0, ip
    1020:	e28dd004 	add	sp, sp, #4	; 0x4
    1024:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
    1028:	40000244 	.word	0x40000244
    102c:	0000336c 	.word	0x0000336c
    1030:	000030b4 	.word	0x000030b4
    1034:	40000248 	.word	0x40000248
    1038:	000030c6 	.word	0x000030c6
    103c:	0000337c 	.word	0x0000337c
    1040:	00031100 	.word	0x00031100
    1044:	00003390 	.word	0x00003390

00001048 <SCSIHandleCmd>:
    1048:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    104c:	e1a08003 	mov	r8, r3
    1050:	e3a03001 	mov	r3, #1	; 0x1
    1054:	e5883000 	str	r3, [r8]
    1058:	e59f324c 	ldr	r3, [pc, #588]	; 12ac <SCSIHandleCmd+0x264>
    105c:	e5d04000 	ldrb	r4, [r0]
    1060:	e7d332a4 	ldrb	r3, [r3, r4, lsr #5]
    1064:	e20170ff 	and	r7, r1, #255	; 0xff
    1068:	e1570003 	cmp	r7, r3
    106c:	e1a05000 	mov	r5, r0
    1070:	e1a06002 	mov	r6, r2
    1074:	2a000004 	bcs	108c <SCSIHandleCmd+0x44>
    1078:	e1a01003 	mov	r1, r3
    107c:	e59f022c 	ldr	r0, [pc, #556]	; 12b0 <SCSIHandleCmd+0x268>
    1080:	ebfffd72 	bl	650 <printf>
    1084:	e3a00000 	mov	r0, #0	; 0x0
    1088:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    108c:	e3540012 	cmp	r4, #18	; 0x12
    1090:	0a000026 	beq	1130 <SCSIHandleCmd+0xe8>
    1094:	8a000006 	bhi	10b4 <SCSIHandleCmd+0x6c>
    1098:	e3540003 	cmp	r4, #3	; 0x3
    109c:	0a000013 	beq	10f0 <SCSIHandleCmd+0xa8>
    10a0:	e3540004 	cmp	r4, #4	; 0x4
    10a4:	0a00001a 	beq	1114 <SCSIHandleCmd+0xcc>
    10a8:	e3540000 	cmp	r4, #0	; 0x0
    10ac:	0a00000b 	beq	10e0 <SCSIHandleCmd+0x98>
    10b0:	ea00006a 	b	1260 <SCSIHandleCmd+0x218>
    10b4:	e3540028 	cmp	r4, #40	; 0x28
    10b8:	0a000028 	beq	1160 <SCSIHandleCmd+0x118>
    10bc:	8a000002 	bhi	10cc <SCSIHandleCmd+0x84>
    10c0:	e3540025 	cmp	r4, #37	; 0x25
    10c4:	1a000065 	bne	1260 <SCSIHandleCmd+0x218>
    10c8:	ea00001f 	b	114c <SCSIHandleCmd+0x104>
    10cc:	e354002a 	cmp	r4, #42	; 0x2a
    10d0:	0a000034 	beq	11a8 <SCSIHandleCmd+0x160>
    10d4:	e354002f 	cmp	r4, #47	; 0x2f
    10d8:	1a000060 	bne	1260 <SCSIHandleCmd+0x218>
    10dc:	ea000045 	b	11f8 <SCSIHandleCmd+0x1b0>
    10e0:	e59f01cc 	ldr	r0, [pc, #460]	; 12b4 <SCSIHandleCmd+0x26c>
    10e4:	ebfffd8f 	bl	728 <puts>
    10e8:	e59f01c8 	ldr	r0, [pc, #456]	; 12b8 <SCSIHandleCmd+0x270>
    10ec:	ea00002b 	b	11a0 <SCSIHandleCmd+0x158>
    10f0:	e59f31c4 	ldr	r3, [pc, #452]	; 12bc <SCSIHandleCmd+0x274>
    10f4:	e59f01c4 	ldr	r0, [pc, #452]	; 12c0 <SCSIHandleCmd+0x278>
    10f8:	e5931000 	ldr	r1, [r3]
    10fc:	ebfffd53 	bl	650 <printf>
    1100:	e5d53004 	ldrb	r3, [r5, #4]
    1104:	e59f01ac 	ldr	r0, [pc, #428]	; 12b8 <SCSIHandleCmd+0x270>
    1108:	e3530012 	cmp	r3, #18	; 0x12
    110c:	23a03012 	movcs	r3, #18	; 0x12
    1110:	ea000004 	b	1128 <SCSIHandleCmd+0xe0>
    1114:	e5d01001 	ldrb	r1, [r0, #1]
    1118:	e59f01a4 	ldr	r0, [pc, #420]	; 12c4 <SCSIHandleCmd+0x27c>
    111c:	ebfffd4b 	bl	650 <printf>
    1120:	e59f0190 	ldr	r0, [pc, #400]	; 12b8 <SCSIHandleCmd+0x270>
    1124:	e3a03000 	mov	r3, #0	; 0x0
    1128:	e5863000 	str	r3, [r6]
    112c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    1130:	e59f0190 	ldr	r0, [pc, #400]	; 12c8 <SCSIHandleCmd+0x280>
    1134:	ebfffd7b 	bl	728 <puts>
    1138:	e5d53004 	ldrb	r3, [r5, #4]
    113c:	e59f0174 	ldr	r0, [pc, #372]	; 12b8 <SCSIHandleCmd+0x270>
    1140:	e3530024 	cmp	r3, #36	; 0x24
    1144:	23a03024 	movcs	r3, #36	; 0x24
    1148:	eafffff6 	b	1128 <SCSIHandleCmd+0xe0>
    114c:	e59f0178 	ldr	r0, [pc, #376]	; 12cc <SCSIHandleCmd+0x284>
    1150:	ebfffd74 	bl	728 <puts>
    1154:	e59f015c 	ldr	r0, [pc, #348]	; 12b8 <SCSIHandleCmd+0x270>
    1158:	e3a03008 	mov	r3, #8	; 0x8
    115c:	eafffff1 	b	1128 <SCSIHandleCmd+0xe0>
    1160:	e5d01003 	ldrb	r1, [r0, #3]
    1164:	e5d03002 	ldrb	r3, [r0, #2]
    1168:	e5d52005 	ldrb	r2, [r5, #5]
    116c:	e5d00007 	ldrb	r0, [r0, #7]
    1170:	e5d54008 	ldrb	r4, [r5, #8]
    1174:	e1a01801 	lsl	r1, r1, #16
    1178:	e1811c03 	orr	r1, r1, r3, lsl #24
    117c:	e5d53004 	ldrb	r3, [r5, #4]
    1180:	e1844400 	orr	r4, r4, r0, lsl #8
    1184:	e1811002 	orr	r1, r1, r2
    1188:	e1811403 	orr	r1, r1, r3, lsl #8
    118c:	e1a02004 	mov	r2, r4
    1190:	e59f0138 	ldr	r0, [pc, #312]	; 12d0 <SCSIHandleCmd+0x288>
    1194:	ebfffd2d 	bl	650 <printf>
    1198:	e59f0118 	ldr	r0, [pc, #280]	; 12b8 <SCSIHandleCmd+0x270>
    119c:	e1a04484 	lsl	r4, r4, #9
    11a0:	e5864000 	str	r4, [r6]
    11a4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    11a8:	e5d01003 	ldrb	r1, [r0, #3]
    11ac:	e5d03002 	ldrb	r3, [r0, #2]
    11b0:	e5d52005 	ldrb	r2, [r5, #5]
    11b4:	e5d00007 	ldrb	r0, [r0, #7]
    11b8:	e5d54008 	ldrb	r4, [r5, #8]
    11bc:	e1a01801 	lsl	r1, r1, #16
    11c0:	e1811c03 	orr	r1, r1, r3, lsl #24
    11c4:	e5d53004 	ldrb	r3, [r5, #4]
    11c8:	e1844400 	orr	r4, r4, r0, lsl #8
    11cc:	e1811002 	orr	r1, r1, r2
    11d0:	e1811403 	orr	r1, r1, r3, lsl #8
    11d4:	e1a02004 	mov	r2, r4
    11d8:	e59f00f4 	ldr	r0, [pc, #244]	; 12d4 <SCSIHandleCmd+0x28c>
    11dc:	ebfffd1b 	bl	650 <printf>
    11e0:	e59f00d0 	ldr	r0, [pc, #208]	; 12b8 <SCSIHandleCmd+0x270>
    11e4:	e1a04484 	lsl	r4, r4, #9
    11e8:	e3a03000 	mov	r3, #0	; 0x0
    11ec:	e5864000 	str	r4, [r6]
    11f0:	e5883000 	str	r3, [r8]
    11f4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    11f8:	e5d01003 	ldrb	r1, [r0, #3]
    11fc:	e5d03002 	ldrb	r3, [r0, #2]
    1200:	e5d0c005 	ldrb	ip, [r0, #5]
    1204:	e1a01801 	lsl	r1, r1, #16
    1208:	e1811c03 	orr	r1, r1, r3, lsl #24
    120c:	e5d52008 	ldrb	r2, [r5, #8]
    1210:	e5d03004 	ldrb	r3, [r0, #4]
    1214:	e5d00007 	ldrb	r0, [r0, #7]
    1218:	e181100c 	orr	r1, r1, ip
    121c:	e1811403 	orr	r1, r1, r3, lsl #8
    1220:	e1822400 	orr	r2, r2, r0, lsl #8
    1224:	e3a04000 	mov	r4, #0	; 0x0
    1228:	e59f00a8 	ldr	r0, [pc, #168]	; 12d8 <SCSIHandleCmd+0x290>
    122c:	ebfffd07 	bl	650 <printf>
    1230:	e5864000 	str	r4, [r6]
    1234:	e5d53001 	ldrb	r3, [r5, #1]
    1238:	e3130002 	tst	r3, #2	; 0x2
    123c:	059f0074 	ldreq	r0, [pc, #116]	; 12b8 <SCSIHandleCmd+0x270>
    1240:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    1244:	e59f0090 	ldr	r0, [pc, #144]	; 12dc <SCSIHandleCmd+0x294>
    1248:	ebfffd36 	bl	728 <puts>
    124c:	e59f208c 	ldr	r2, [pc, #140]	; 12e0 <SCSIHandleCmd+0x298>
    1250:	e59f3064 	ldr	r3, [pc, #100]	; 12bc <SCSIHandleCmd+0x274>
    1254:	e1a00004 	mov	r0, r4
    1258:	e5832000 	str	r2, [r3]
    125c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    1260:	e59f007c 	ldr	r0, [pc, #124]	; 12e4 <SCSIHandleCmd+0x29c>
    1264:	ebfffcf9 	bl	650 <printf>
    1268:	e3a04000 	mov	r4, #0	; 0x0
    126c:	ea000002 	b	127c <SCSIHandleCmd+0x234>
    1270:	e7d41005 	ldrb	r1, [r4, r5]
    1274:	ebfffcf5 	bl	650 <printf>
    1278:	e2844001 	add	r4, r4, #1	; 0x1
    127c:	e1540007 	cmp	r4, r7
    1280:	e59f0060 	ldr	r0, [pc, #96]	; 12e8 <SCSIHandleCmd+0x2a0>
    1284:	1afffff9 	bne	1270 <SCSIHandleCmd+0x228>
    1288:	e3a0000a 	mov	r0, #10	; 0xa
    128c:	ebfffd0f 	bl	6d0 <putchar>
    1290:	e3a01000 	mov	r1, #0	; 0x0
    1294:	e59f3020 	ldr	r3, [pc, #32]	; 12bc <SCSIHandleCmd+0x274>
    1298:	e3a02a52 	mov	r2, #335872	; 0x52000
    129c:	e1a00001 	mov	r0, r1
    12a0:	e5832000 	str	r2, [r3]
    12a4:	e5861000 	str	r1, [r6]
    12a8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    12ac:	000030ea 	.word	0x000030ea
    12b0:	000033a8 	.word	0x000033a8
    12b4:	000033c8 	.word	0x000033c8
    12b8:	40000248 	.word	0x40000248
    12bc:	40000244 	.word	0x40000244
    12c0:	000033d8 	.word	0x000033d8
    12c4:	000033f0 	.word	0x000033f0
    12c8:	00003404 	.word	0x00003404
    12cc:	0000340c 	.word	0x0000340c
    12d0:	0000341c 	.word	0x0000341c
    12d4:	00003434 	.word	0x00003434
    12d8:	00003450 	.word	0x00003450
    12dc:	0000346c 	.word	0x0000346c
    12e0:	00052400 	.word	0x00052400
    12e4:	00003484 	.word	0x00003484
    12e8:	00003498 	.word	0x00003498

000012ec <getsdbits>:
    12ec:	e261c07f 	rsb	ip, r1, #127	; 0x7f
    12f0:	e21c111e 	ands	r1, ip, #-2147483641	; 0x80000007
    12f4:	42411001 	submi	r1, r1, #1	; 0x1
    12f8:	41e01e81 	mvnmi	r1, r1, lsl #29
    12fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1300:	41e01ea1 	mvnmi	r1, r1, lsr #29
    1304:	42811001 	addmi	r1, r1, #1	; 0x1
    1308:	e35c0000 	cmp	ip, #0	; 0x0
    130c:	e28c3007 	add	r3, ip, #7	; 0x7
    1310:	e1a0e002 	mov	lr, r2
    1314:	a1a0300c 	movge	r3, ip
    1318:	e0812002 	add	r2, r1, r2
    131c:	e08001c3 	add	r0, r0, r3, asr #3
    1320:	e2622000 	rsb	r2, r2, #0	; 0x0
    1324:	e3a01000 	mov	r1, #0	; 0x0
    1328:	ea000002 	b	1338 <getsdbits+0x4c>
    132c:	e5503001 	ldrb	r3, [r0, #-1]
    1330:	e2822008 	add	r2, r2, #8	; 0x8
    1334:	e1831401 	orr	r1, r3, r1, lsl #8
    1338:	e3520000 	cmp	r2, #0	; 0x0
    133c:	e2800001 	add	r0, r0, #1	; 0x1
    1340:	bafffff9 	blt	132c <getsdbits+0x40>
    1344:	e3e00000 	mvn	r0, #0	; 0x0
    1348:	e1e00e10 	mvn	r0, r0, lsl lr
    134c:	e0000231 	and	r0, r0, r1, lsr r2
    1350:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00001354 <BlockDevGetSize>:
    1354:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    1358:	e24dd010 	sub	sp, sp, #16	; 0x10
    135c:	e1a07000 	mov	r7, r0
    1360:	e1a0000d 	mov	r0, sp
    1364:	eb0000dc 	bl	16dc <SDReadCSD>
    1368:	e3500000 	cmp	r0, #0	; 0x0
    136c:	e1a0600d 	mov	r6, sp
    1370:	0a00002f 	beq	1434 <BlockDevGetSize+0xe0>
    1374:	e3a0107f 	mov	r1, #127	; 0x7f
    1378:	e1a0000d 	mov	r0, sp
    137c:	e3a02002 	mov	r2, #2	; 0x2
    1380:	ebffffd9 	bl	12ec <getsdbits>
    1384:	e21010ff 	ands	r1, r0, #255	; 0xff
    1388:	0a000002 	beq	1398 <BlockDevGetSize+0x44>
    138c:	e3510001 	cmp	r1, #1	; 0x1
    1390:	1a000020 	bne	1418 <BlockDevGetSize+0xc4>
    1394:	ea000017 	b	13f8 <BlockDevGetSize+0xa4>
    1398:	e3a01053 	mov	r1, #83	; 0x53
    139c:	e3a02004 	mov	r2, #4	; 0x4
    13a0:	e1a0000d 	mov	r0, sp
    13a4:	ebffffd0 	bl	12ec <getsdbits>
    13a8:	e3a01049 	mov	r1, #73	; 0x49
    13ac:	e1a04000 	mov	r4, r0
    13b0:	e3a0200c 	mov	r2, #12	; 0xc
    13b4:	e1a0000d 	mov	r0, sp
    13b8:	ebffffcb 	bl	12ec <getsdbits>
    13bc:	e3a02003 	mov	r2, #3	; 0x3
    13c0:	e1a05000 	mov	r5, r0
    13c4:	e3a01031 	mov	r1, #49	; 0x31
    13c8:	e1a0000d 	mov	r0, sp
    13cc:	ebffffc6 	bl	12ec <getsdbits>
    13d0:	e3a02004 	mov	r2, #4	; 0x4
    13d4:	e20000ff 	and	r0, r0, #255	; 0xff
    13d8:	e1a02012 	lsl	r2, r2, r0
    13dc:	e1a04804 	lsl	r4, r4, #16
    13e0:	e1a04824 	lsr	r4, r4, #16
    13e4:	e3a03001 	mov	r3, #1	; 0x1
    13e8:	e1a03413 	lsl	r3, r3, r4
    13ec:	e2855001 	add	r5, r5, #1	; 0x1
    13f0:	e0000295 	mul	r0, r5, r2
    13f4:	ea00000b 	b	1428 <BlockDevGetSize+0xd4>
    13f8:	e1a0000d 	mov	r0, sp
    13fc:	e3a01045 	mov	r1, #69	; 0x45
    1400:	e3a02016 	mov	r2, #22	; 0x16
    1404:	ebffffb8 	bl	12ec <getsdbits>
    1408:	e2800001 	add	r0, r0, #1	; 0x1
    140c:	e1a00980 	lsl	r0, r0, #19
    1410:	e3a03c02 	mov	r3, #512	; 0x200
    1414:	ea000003 	b	1428 <BlockDevGetSize+0xd4>
    1418:	e59f001c 	ldr	r0, [pc, #28]	; 143c <BlockDevGetSize+0xe8>
    141c:	ebfffc8b 	bl	650 <printf>
    1420:	e3a00000 	mov	r0, #0	; 0x0
    1424:	ea000002 	b	1434 <BlockDevGetSize+0xe0>
    1428:	e0030390 	mul	r3, r0, r3
    142c:	e5873000 	str	r3, [r7]
    1430:	e3a00001 	mov	r0, #1	; 0x1
    1434:	e28dd010 	add	sp, sp, #16	; 0x10
    1438:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    143c:	000034a0 	.word	0x000034a0

00001440 <BlockDevRead>:
    1440:	e1a03000 	mov	r3, r0
    1444:	e1a00001 	mov	r0, r1
    1448:	e1a01003 	mov	r1, r3
    144c:	ea000164 	b	19e4 <SDReadBlock>

00001450 <BlockDevWrite>:
    1450:	e1a03000 	mov	r3, r0
    1454:	e1a00001 	mov	r0, r1
    1458:	e1a01003 	mov	r1, r3
    145c:	ea0000b7 	b	1740 <SDWriteBlock>

00001460 <BlockDevInit>:
    1460:	ea00010b 	b	1894 <SDInit>

00001464 <SDExtraResp>:
    1464:	e92d4030 	push	{r4, r5, lr}
    1468:	e3500004 	cmp	r0, #4	; 0x4
    146c:	e24dd008 	sub	sp, sp, #8	; 0x8
    1470:	e1a05000 	mov	r5, r0
    1474:	da000007 	ble	1498 <SDExtraResp+0x34>
    1478:	e3a0c081 	mov	ip, #129	; 0x81
    147c:	e59f004c 	ldr	r0, [pc, #76]	; 14d0 <SDExtraResp+0x6c>
    1480:	e59f104c 	ldr	r1, [pc, #76]	; 14d4 <SDExtraResp+0x70>
    1484:	e59f204c 	ldr	r2, [pc, #76]	; 14d8 <SDExtraResp+0x74>
    1488:	e59f304c 	ldr	r3, [pc, #76]	; 14dc <SDExtraResp+0x78>
    148c:	e58dc000 	str	ip, [sp]
    1490:	ebfffc6e 	bl	650 <printf>
    1494:	eafffffe 	b	1494 <SDExtraResp+0x30>
    1498:	e28d4004 	add	r4, sp, #4	; 0x4
    149c:	e1a02004 	mov	r2, r4
    14a0:	e3a01000 	mov	r1, #0	; 0x0
    14a4:	eb00016b 	bl	1a58 <SPITransfer>
    14a8:	e3a00000 	mov	r0, #0	; 0x0
    14ac:	e1a02000 	mov	r2, r0
    14b0:	ea000002 	b	14c0 <SDExtraResp+0x5c>
    14b4:	e7d23004 	ldrb	r3, [r2, r4]
    14b8:	e2822001 	add	r2, r2, #1	; 0x1
    14bc:	e1830400 	orr	r0, r3, r0, lsl #8
    14c0:	e1520005 	cmp	r2, r5
    14c4:	bafffffa 	blt	14b4 <SDExtraResp+0x50>
    14c8:	e28dd008 	add	sp, sp, #8	; 0x8
    14cc:	e8bd8030 	pop	{r4, r5, pc}
    14d0:	00003228 	.word	0x00003228
    14d4:	000034c0 	.word	0x000034c0
    14d8:	000034cc 	.word	0x000034cc
    14dc:	000030f4 	.word	0x000030f4

000014e0 <SDWaitResp>:
    14e0:	e92d4070 	push	{r4, r5, r6, lr}
    14e4:	e24dd004 	sub	sp, sp, #4	; 0x4
    14e8:	e28d5004 	add	r5, sp, #4	; 0x4
    14ec:	e3e03000 	mvn	r3, #0	; 0x0
    14f0:	e5653001 	strb	r3, [r5, #-1]!
    14f4:	e1a06000 	mov	r6, r0
    14f8:	e3a04000 	mov	r4, #0	; 0x0
    14fc:	ea000003 	b	1510 <SDWaitResp+0x30>
    1500:	eb000154 	bl	1a58 <SPITransfer>
    1504:	e5dd3003 	ldrb	r3, [sp, #3]
    1508:	e35300ff 	cmp	r3, #255	; 0xff
    150c:	1a000005 	bne	1528 <SDWaitResp+0x48>
    1510:	e3a00001 	mov	r0, #1	; 0x1
    1514:	e1540006 	cmp	r4, r6
    1518:	e3a01000 	mov	r1, #0	; 0x0
    151c:	e1a02005 	mov	r2, r5
    1520:	e0844000 	add	r4, r4, r0
    1524:	bafffff5 	blt	1500 <SDWaitResp+0x20>
    1528:	e5dd0003 	ldrb	r0, [sp, #3]
    152c:	e28dd004 	add	sp, sp, #4	; 0x4
    1530:	e8bd8070 	pop	{r4, r5, r6, pc}

00001534 <SDReadDataToken>:
    1534:	e92d4070 	push	{r4, r5, r6, lr}
    1538:	e1a04000 	mov	r4, r0
    153c:	e3a00b01 	mov	r0, #1024	; 0x400
    1540:	e1a06001 	mov	r6, r1
    1544:	e1a05002 	mov	r5, r2
    1548:	ebffffe4 	bl	14e0 <SDWaitResp>
    154c:	e20440ff 	and	r4, r4, #255	; 0xff
    1550:	e1500004 	cmp	r0, r4
    1554:	0a000004 	beq	156c <SDReadDataToken+0x38>
    1558:	e1a01000 	mov	r1, r0
    155c:	e59f0030 	ldr	r0, [pc, #48]	; 1594 <SDReadDataToken+0x60>
    1560:	ebfffc3a 	bl	650 <printf>
    1564:	e3a00000 	mov	r0, #0	; 0x0
    1568:	e8bd8070 	pop	{r4, r5, r6, pc}
    156c:	e1a00005 	mov	r0, r5
    1570:	e1a02006 	mov	r2, r6
    1574:	e3a01000 	mov	r1, #0	; 0x0
    1578:	eb000136 	bl	1a58 <SPITransfer>
    157c:	e3a01000 	mov	r1, #0	; 0x0
    1580:	e3a00002 	mov	r0, #2	; 0x2
    1584:	e1a02001 	mov	r2, r1
    1588:	eb000132 	bl	1a58 <SPITransfer>
    158c:	e3a00001 	mov	r0, #1	; 0x1
    1590:	e8bd8070 	pop	{r4, r5, r6, pc}
    1594:	000034d8 	.word	0x000034d8

00001598 <SDCommand>:
    1598:	e92d4070 	push	{r4, r5, r6, lr}
    159c:	e24dd008 	sub	sp, sp, #8	; 0x8
    15a0:	e1a03000 	mov	r3, r0
    15a4:	e1a06001 	mov	r6, r1
    15a8:	e3a00001 	mov	r0, #1	; 0x1
    15ac:	e3a01000 	mov	r1, #0	; 0x0
    15b0:	e28d2007 	add	r2, sp, #7	; 0x7
    15b4:	e20340ff 	and	r4, r3, #255	; 0xff
    15b8:	eb000126 	bl	1a58 <SPITransfer>
    15bc:	e5dd1007 	ldrb	r1, [sp, #7]
    15c0:	e35100ff 	cmp	r1, #255	; 0xff
    15c4:	0a000003 	beq	15d8 <SDCommand+0x40>
    15c8:	e59f005c 	ldr	r0, [pc, #92]	; 162c <SDCommand+0x94>
    15cc:	ebfffc1f 	bl	650 <printf>
    15d0:	e5dd0007 	ldrb	r0, [sp, #7]
    15d4:	ea000012 	b	1624 <SDCommand+0x8c>
    15d8:	e3540008 	cmp	r4, #8	; 0x8
    15dc:	03a05087 	moveq	r5, #135	; 0x87
    15e0:	13a05095 	movne	r5, #149	; 0x95
    15e4:	e3a00006 	mov	r0, #6	; 0x6
    15e8:	e1a03c26 	lsr	r3, r6, #24
    15ec:	e1a0c826 	lsr	ip, r6, #16
    15f0:	e1a0e426 	lsr	lr, r6, #8
    15f4:	e3844040 	orr	r4, r4, #64	; 0x40
    15f8:	e28d1001 	add	r1, sp, #1	; 0x1
    15fc:	e3a02000 	mov	r2, #0	; 0x0
    1600:	e5cd4001 	strb	r4, [sp, #1]
    1604:	e5cd3002 	strb	r3, [sp, #2]
    1608:	e5cdc003 	strb	ip, [sp, #3]
    160c:	e5cde004 	strb	lr, [sp, #4]
    1610:	e5cd6005 	strb	r6, [sp, #5]
    1614:	e5cd5006 	strb	r5, [sp, #6]
    1618:	eb00010e 	bl	1a58 <SPITransfer>
    161c:	e3a00008 	mov	r0, #8	; 0x8
    1620:	ebffffae 	bl	14e0 <SDWaitResp>
    1624:	e28dd008 	add	sp, sp, #8	; 0x8
    1628:	e8bd8070 	pop	{r4, r5, r6, pc}
    162c:	00003508 	.word	0x00003508

00001630 <SDReadOCR>:
    1630:	e92d4010 	push	{r4, lr}
    1634:	e3a01000 	mov	r1, #0	; 0x0
    1638:	e1a04000 	mov	r4, r0
    163c:	e3a0003a 	mov	r0, #58	; 0x3a
    1640:	ebffffd4 	bl	1598 <SDCommand>
    1644:	e3500000 	cmp	r0, #0	; 0x0
    1648:	0a000004 	beq	1660 <SDReadOCR+0x30>
    164c:	e1a01000 	mov	r1, r0
    1650:	e59f001c 	ldr	r0, [pc, #28]	; 1674 <SDReadOCR+0x44>
    1654:	ebfffbfd 	bl	650 <printf>
    1658:	e3a00000 	mov	r0, #0	; 0x0
    165c:	e8bd8010 	pop	{r4, pc}
    1660:	e3a00004 	mov	r0, #4	; 0x4
    1664:	ebffff7e 	bl	1464 <SDExtraResp>
    1668:	e5840000 	str	r0, [r4]
    166c:	e3a00001 	mov	r0, #1	; 0x1
    1670:	e8bd8010 	pop	{r4, pc}
    1674:	00003520 	.word	0x00003520

00001678 <SDReadCID>:
    1678:	e92d4010 	push	{r4, lr}
    167c:	e3a01000 	mov	r1, #0	; 0x0
    1680:	e1a04000 	mov	r4, r0
    1684:	e3a0000a 	mov	r0, #10	; 0xa
    1688:	ebffffc2 	bl	1598 <SDCommand>
    168c:	e3500000 	cmp	r0, #0	; 0x0
    1690:	0a000004 	beq	16a8 <SDReadCID+0x30>
    1694:	e1a01000 	mov	r1, r0
    1698:	e59f0034 	ldr	r0, [pc, #52]	; 16d4 <SDReadCID+0x5c>
    169c:	ebfffbeb 	bl	650 <printf>
    16a0:	e3a00000 	mov	r0, #0	; 0x0
    16a4:	e8bd8010 	pop	{r4, pc}
    16a8:	e1a01004 	mov	r1, r4
    16ac:	e3a000fe 	mov	r0, #254	; 0xfe
    16b0:	e3a02010 	mov	r2, #16	; 0x10
    16b4:	ebffff9e 	bl	1534 <SDReadDataToken>
    16b8:	e2504000 	subs	r4, r0, #0	; 0x0
    16bc:	13a00001 	movne	r0, #1	; 0x1
    16c0:	18bd8010 	popne	{r4, pc}
    16c4:	e59f000c 	ldr	r0, [pc, #12]	; 16d8 <SDReadCID+0x60>
    16c8:	ebfffc16 	bl	728 <puts>
    16cc:	e1a00004 	mov	r0, r4
    16d0:	e8bd8010 	pop	{r4, pc}
    16d4:	00003540 	.word	0x00003540
    16d8:	00003560 	.word	0x00003560

000016dc <SDReadCSD>:
    16dc:	e92d4010 	push	{r4, lr}
    16e0:	e3a01000 	mov	r1, #0	; 0x0
    16e4:	e1a04000 	mov	r4, r0
    16e8:	e3a00009 	mov	r0, #9	; 0x9
    16ec:	ebffffa9 	bl	1598 <SDCommand>
    16f0:	e3500000 	cmp	r0, #0	; 0x0
    16f4:	0a000004 	beq	170c <SDReadCSD+0x30>
    16f8:	e1a01000 	mov	r1, r0
    16fc:	e59f0034 	ldr	r0, [pc, #52]	; 1738 <SDReadCSD+0x5c>
    1700:	ebfffbd2 	bl	650 <printf>
    1704:	e3a00000 	mov	r0, #0	; 0x0
    1708:	e8bd8010 	pop	{r4, pc}
    170c:	e1a01004 	mov	r1, r4
    1710:	e3a000fe 	mov	r0, #254	; 0xfe
    1714:	e3a02010 	mov	r2, #16	; 0x10
    1718:	ebffff85 	bl	1534 <SDReadDataToken>
    171c:	e2504000 	subs	r4, r0, #0	; 0x0
    1720:	13a00001 	movne	r0, #1	; 0x1
    1724:	18bd8010 	popne	{r4, pc}
    1728:	e59f000c 	ldr	r0, [pc, #12]	; 173c <SDReadCSD+0x60>
    172c:	ebfffbfd 	bl	728 <puts>
    1730:	e1a00004 	mov	r0, r4
    1734:	e8bd8010 	pop	{r4, pc}
    1738:	00003578 	.word	0x00003578
    173c:	00003560 	.word	0x00003560

00001740 <SDWriteBlock>:
    1740:	e92d4070 	push	{r4, r5, r6, lr}
    1744:	e59f30e4 	ldr	r3, [pc, #228]	; 1830 <SDWriteBlock+0xf0>
    1748:	e5933000 	ldr	r3, [r3]
    174c:	e3530003 	cmp	r3, #3	; 0x3
    1750:	11a01481 	lslne	r1, r1, #9
    1754:	e24dd004 	sub	sp, sp, #4	; 0x4
    1758:	e1a06000 	mov	r6, r0
    175c:	e3a00018 	mov	r0, #24	; 0x18
    1760:	ebffff8c 	bl	1598 <SDCommand>
    1764:	e2505000 	subs	r5, r0, #0	; 0x0
    1768:	0a000004 	beq	1780 <SDWriteBlock+0x40>
    176c:	e1a01005 	mov	r1, r5
    1770:	e59f00bc 	ldr	r0, [pc, #188]	; 1834 <SDWriteBlock+0xf4>
    1774:	ebfffbb5 	bl	650 <printf>
    1778:	e3a00000 	mov	r0, #0	; 0x0
    177c:	ea000029 	b	1828 <SDWriteBlock+0xe8>
    1780:	e3e03001 	mvn	r3, #1	; 0x1
    1784:	e28d4004 	add	r4, sp, #4	; 0x4
    1788:	e5643001 	strb	r3, [r4, #-1]!
    178c:	e3a00001 	mov	r0, #1	; 0x1
    1790:	e1a01005 	mov	r1, r5
    1794:	e1a02005 	mov	r2, r5
    1798:	eb0000ae 	bl	1a58 <SPITransfer>
    179c:	e1a01004 	mov	r1, r4
    17a0:	e3a00001 	mov	r0, #1	; 0x1
    17a4:	e1a02005 	mov	r2, r5
    17a8:	eb0000aa 	bl	1a58 <SPITransfer>
    17ac:	e1a01006 	mov	r1, r6
    17b0:	e3a00c02 	mov	r0, #512	; 0x200
    17b4:	e1a02005 	mov	r2, r5
    17b8:	eb0000a6 	bl	1a58 <SPITransfer>
    17bc:	e28d4002 	add	r4, sp, #2	; 0x2
    17c0:	e3a00002 	mov	r0, #2	; 0x2
    17c4:	e1a01005 	mov	r1, r5
    17c8:	e1a02005 	mov	r2, r5
    17cc:	eb0000a1 	bl	1a58 <SPITransfer>
    17d0:	e1a01005 	mov	r1, r5
    17d4:	e3a00001 	mov	r0, #1	; 0x1
    17d8:	e1a02004 	mov	r2, r4
    17dc:	eb00009d 	bl	1a58 <SPITransfer>
    17e0:	e5dd1002 	ldrb	r1, [sp, #2]
    17e4:	e201301f 	and	r3, r1, #31	; 0x1f
    17e8:	e3530005 	cmp	r3, #5	; 0x5
    17ec:	0a000005 	beq	1808 <SDWriteBlock+0xc8>
    17f0:	e59f0040 	ldr	r0, [pc, #64]	; 1838 <SDWriteBlock+0xf8>
    17f4:	ebfffb95 	bl	650 <printf>
    17f8:	e59f003c 	ldr	r0, [pc, #60]	; 183c <SDWriteBlock+0xfc>
    17fc:	ebfffbc9 	bl	728 <puts>
    1800:	e1a00005 	mov	r0, r5
    1804:	ea000007 	b	1828 <SDWriteBlock+0xe8>
    1808:	e3a00001 	mov	r0, #1	; 0x1
    180c:	e3a01000 	mov	r1, #0	; 0x0
    1810:	e1a02004 	mov	r2, r4
    1814:	eb00008f 	bl	1a58 <SPITransfer>
    1818:	e5dd3002 	ldrb	r3, [sp, #2]
    181c:	e35300ff 	cmp	r3, #255	; 0xff
    1820:	1afffff8 	bne	1808 <SDWriteBlock+0xc8>
    1824:	e3a00001 	mov	r0, #1	; 0x1
    1828:	e28dd004 	add	sp, sp, #4	; 0x4
    182c:	e8bd8070 	pop	{r4, r5, r6, pc}
    1830:	40000448 	.word	0x40000448
    1834:	00003598 	.word	0x00003598
    1838:	000035bc 	.word	0x000035bc
    183c:	000035e4 	.word	0x000035e4

00001840 <SDSendOpCond>:
    1840:	e92d4030 	push	{r4, r5, lr}
    1844:	e1a05000 	mov	r5, r0
    1848:	e3a04000 	mov	r4, #0	; 0x0
    184c:	e3a01000 	mov	r1, #0	; 0x0
    1850:	e3a00037 	mov	r0, #55	; 0x37
    1854:	ebffff4f 	bl	1598 <SDCommand>
    1858:	e3a00029 	mov	r0, #41	; 0x29
    185c:	e1a01005 	mov	r1, r5
    1860:	ebffff4c 	bl	1598 <SDCommand>
    1864:	e3500000 	cmp	r0, #0	; 0x0
    1868:	e2844001 	add	r4, r4, #1	; 0x1
    186c:	1a000001 	bne	1878 <SDSendOpCond+0x38>
    1870:	e2800001 	add	r0, r0, #1	; 0x1
    1874:	e8bd8030 	pop	{r4, r5, pc}
    1878:	e3540b01 	cmp	r4, #1024	; 0x400
    187c:	1afffff2 	bne	184c <SDSendOpCond+0xc>
    1880:	e59f0008 	ldr	r0, [pc, #8]	; 1890 <SDSendOpCond+0x50>
    1884:	ebfffba7 	bl	728 <puts>
    1888:	e3a00000 	mov	r0, #0	; 0x0
    188c:	e8bd8030 	pop	{r4, r5, pc}
    1890:	00003600 	.word	0x00003600

00001894 <SDInit>:
    1894:	e92d4030 	push	{r4, r5, lr}
    1898:	e59f3124 	ldr	r3, [pc, #292]	; 19c4 <SDInit+0x130>
    189c:	e3a04000 	mov	r4, #0	; 0x0
    18a0:	e24dd004 	sub	sp, sp, #4	; 0x4
    18a4:	e5834000 	str	r4, [r3]
    18a8:	eb000099 	bl	1b14 <SPIInit>
    18ac:	e59f0114 	ldr	r0, [pc, #276]	; 19c8 <SDInit+0x134>
    18b0:	eb0000b5 	bl	1b8c <SPISetSpeed>
    18b4:	e3a0000a 	mov	r0, #10	; 0xa
    18b8:	eb000083 	bl	1acc <SPITick>
    18bc:	e1a05004 	mov	r5, r4
    18c0:	e3a00000 	mov	r0, #0	; 0x0
    18c4:	e1a01000 	mov	r1, r0
    18c8:	ebffff32 	bl	1598 <SDCommand>
    18cc:	e35000ff 	cmp	r0, #255	; 0xff
    18d0:	e1a04000 	mov	r4, r0
    18d4:	e2855001 	add	r5, r5, #1	; 0x1
    18d8:	1a000002 	bne	18e8 <SDInit+0x54>
    18dc:	e3550064 	cmp	r5, #100	; 0x64
    18e0:	0a000002 	beq	18f0 <SDInit+0x5c>
    18e4:	eafffff5 	b	18c0 <SDInit+0x2c>
    18e8:	e3500001 	cmp	r0, #1	; 0x1
    18ec:	0a000002 	beq	18fc <SDInit+0x68>
    18f0:	e59f00d4 	ldr	r0, [pc, #212]	; 19cc <SDInit+0x138>
    18f4:	e1a01004 	mov	r1, r4
    18f8:	ea00000b 	b	192c <SDInit+0x98>
    18fc:	e59f50cc 	ldr	r5, [pc, #204]	; 19d0 <SDInit+0x13c>
    1900:	e3a00008 	mov	r0, #8	; 0x8
    1904:	e1a01005 	mov	r1, r5
    1908:	ebffff22 	bl	1598 <SDCommand>
    190c:	e3500001 	cmp	r0, #1	; 0x1
    1910:	1a00001c 	bne	1988 <SDInit+0xf4>
    1914:	e2800003 	add	r0, r0, #3	; 0x3
    1918:	ebfffed1 	bl	1464 <SDExtraResp>
    191c:	e1500005 	cmp	r0, r5
    1920:	0a000004 	beq	1938 <SDInit+0xa4>
    1924:	e1a01000 	mov	r1, r0
    1928:	e59f00a4 	ldr	r0, [pc, #164]	; 19d4 <SDInit+0x140>
    192c:	ebfffb47 	bl	650 <printf>
    1930:	e3a00000 	mov	r0, #0	; 0x0
    1934:	ea000020 	b	19bc <SDInit+0x128>
    1938:	e3a00101 	mov	r0, #1073741824	; 0x40000000
    193c:	ebffffbf 	bl	1840 <SDSendOpCond>
    1940:	e2504000 	subs	r4, r0, #0	; 0x0
    1944:	059f008c 	ldreq	r0, [pc, #140]	; 19d8 <SDInit+0x144>
    1948:	0a000004 	beq	1960 <SDInit+0xcc>
    194c:	e1a0000d 	mov	r0, sp
    1950:	ebffff36 	bl	1630 <SDReadOCR>
    1954:	e2504000 	subs	r4, r0, #0	; 0x0
    1958:	1a000003 	bne	196c <SDInit+0xd8>
    195c:	e59f0078 	ldr	r0, [pc, #120]	; 19dc <SDInit+0x148>
    1960:	ebfffb70 	bl	728 <puts>
    1964:	e1a00004 	mov	r0, r4
    1968:	ea000013 	b	19bc <SDInit+0x128>
    196c:	e59d3000 	ldr	r3, [sp]
    1970:	e3130101 	tst	r3, #1073741824	; 0x40000000
    1974:	e59f3048 	ldr	r3, [pc, #72]	; 19c4 <SDInit+0x130>
    1978:	03a02002 	moveq	r2, #2	; 0x2
    197c:	13a02003 	movne	r2, #3	; 0x3
    1980:	e5832000 	str	r2, [r3]
    1984:	ea000009 	b	19b0 <SDInit+0x11c>
    1988:	e3a00000 	mov	r0, #0	; 0x0
    198c:	ebffffab 	bl	1840 <SDSendOpCond>
    1990:	e2505000 	subs	r5, r0, #0	; 0x0
    1994:	159f3028 	ldrne	r3, [pc, #40]	; 19c4 <SDInit+0x130>
    1998:	15834000 	strne	r4, [r3]
    199c:	1a000003 	bne	19b0 <SDInit+0x11c>
    19a0:	e59f0030 	ldr	r0, [pc, #48]	; 19d8 <SDInit+0x144>
    19a4:	ebfffb5f 	bl	728 <puts>
    19a8:	e1a00005 	mov	r0, r5
    19ac:	ea000002 	b	19bc <SDInit+0x128>
    19b0:	e59f0028 	ldr	r0, [pc, #40]	; 19e0 <SDInit+0x14c>
    19b4:	eb000074 	bl	1b8c <SPISetSpeed>
    19b8:	e3a00001 	mov	r0, #1	; 0x1
    19bc:	e28dd004 	add	sp, sp, #4	; 0x4
    19c0:	e8bd8030 	pop	{r4, r5, pc}
    19c4:	40000448 	.word	0x40000448
    19c8:	00061a80 	.word	0x00061a80
    19cc:	00003618 	.word	0x00003618
    19d0:	000001aa 	.word	0x000001aa
    19d4:	0000363c 	.word	0x0000363c
    19d8:	00003650 	.word	0x00003650
    19dc:	00003668 	.word	0x00003668
    19e0:	017d7840 	.word	0x017d7840

000019e4 <SDReadBlock>:
    19e4:	e59f3060 	ldr	r3, [pc, #96]	; 1a4c <SDReadBlock+0x68>
    19e8:	e5933000 	ldr	r3, [r3]
    19ec:	e3530003 	cmp	r3, #3	; 0x3
    19f0:	e92d4010 	push	{r4, lr}
    19f4:	11a01481 	lslne	r1, r1, #9
    19f8:	e1a04000 	mov	r4, r0
    19fc:	e3a00011 	mov	r0, #17	; 0x11
    1a00:	ebfffee4 	bl	1598 <SDCommand>
    1a04:	e3500000 	cmp	r0, #0	; 0x0
    1a08:	0a000004 	beq	1a20 <SDReadBlock+0x3c>
    1a0c:	e1a01000 	mov	r1, r0
    1a10:	e59f0038 	ldr	r0, [pc, #56]	; 1a50 <SDReadBlock+0x6c>
    1a14:	ebfffb0d 	bl	650 <printf>
    1a18:	e3a00000 	mov	r0, #0	; 0x0
    1a1c:	e8bd8010 	pop	{r4, pc}
    1a20:	e1a01004 	mov	r1, r4
    1a24:	e3a000fe 	mov	r0, #254	; 0xfe
    1a28:	e3a02c02 	mov	r2, #512	; 0x200
    1a2c:	ebfffec0 	bl	1534 <SDReadDataToken>
    1a30:	e2504000 	subs	r4, r0, #0	; 0x0
    1a34:	13a00001 	movne	r0, #1	; 0x1
    1a38:	18bd8010 	popne	{r4, pc}
    1a3c:	e59f0010 	ldr	r0, [pc, #16]	; 1a54 <SDReadBlock+0x70>
    1a40:	ebfffb38 	bl	728 <puts>
    1a44:	e1a00004 	mov	r0, r4
    1a48:	e8bd8010 	pop	{r4, pc}
    1a4c:	40000448 	.word	0x40000448
    1a50:	00003678 	.word	0x00003678
    1a54:	00003560 	.word	0x00003560

00001a58 <SPITransfer>:
    1a58:	e92d4030 	push	{r4, r5, lr}
    1a5c:	e59f3060 	ldr	r3, [pc, #96]	; 1ac4 <SPITransfer+0x6c>
    1a60:	e59fe060 	ldr	lr, [pc, #96]	; 1ac8 <SPITransfer+0x70>
    1a64:	e1a04000 	mov	r4, r0
    1a68:	e1a0c002 	mov	ip, r2
    1a6c:	e3a00000 	mov	r0, #0	; 0x0
    1a70:	e3a02501 	mov	r2, #4194304	; 0x400000
    1a74:	e3a050ff 	mov	r5, #255	; 0xff
    1a78:	e583200c 	str	r2, [r3, #12]
    1a7c:	ea00000a 	b	1aac <SPITransfer+0x54>
    1a80:	e3510000 	cmp	r1, #0	; 0x0
    1a84:	14d13001 	ldrbne	r3, [r1], #1
    1a88:	058e5008 	streq	r5, [lr, #8]
    1a8c:	158e3008 	strne	r3, [lr, #8]
    1a90:	e59e3004 	ldr	r3, [lr, #4]
    1a94:	e3130080 	tst	r3, #128	; 0x80
    1a98:	0afffffc 	beq	1a90 <SPITransfer+0x38>
    1a9c:	e35c0000 	cmp	ip, #0	; 0x0
    1aa0:	159e3008 	ldrne	r3, [lr, #8]
    1aa4:	14cc3001 	strbne	r3, [ip], #1
    1aa8:	e2800001 	add	r0, r0, #1	; 0x1
    1aac:	e1500004 	cmp	r0, r4
    1ab0:	bafffff2 	blt	1a80 <SPITransfer+0x28>
    1ab4:	e59f3008 	ldr	r3, [pc, #8]	; 1ac4 <SPITransfer+0x6c>
    1ab8:	e3a02501 	mov	r2, #4194304	; 0x400000
    1abc:	e5832004 	str	r2, [r3, #4]
    1ac0:	e8bd8030 	pop	{r4, r5, pc}
    1ac4:	e0028000 	.word	0xe0028000
    1ac8:	e0020000 	.word	0xe0020000

00001acc <SPITick>:
    1acc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1ad0:	e59f3034 	ldr	r3, [pc, #52]	; 1b0c <SPITick+0x40>
    1ad4:	e59fc034 	ldr	ip, [pc, #52]	; 1b10 <SPITick+0x44>
    1ad8:	e3a02501 	mov	r2, #4194304	; 0x400000
    1adc:	e3a01000 	mov	r1, #0	; 0x0
    1ae0:	e3a0e0ff 	mov	lr, #255	; 0xff
    1ae4:	e5832004 	str	r2, [r3, #4]
    1ae8:	ea000004 	b	1b00 <SPITick+0x34>
    1aec:	e58ce008 	str	lr, [ip, #8]
    1af0:	e59c3004 	ldr	r3, [ip, #4]
    1af4:	e3130080 	tst	r3, #128	; 0x80
    1af8:	0afffffc 	beq	1af0 <SPITick+0x24>
    1afc:	e2811001 	add	r1, r1, #1	; 0x1
    1b00:	e1510000 	cmp	r1, r0
    1b04:	bafffff8 	blt	1aec <SPITick+0x20>
    1b08:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    1b0c:	e0028000 	.word	0xe0028000
    1b10:	e0020000 	.word	0xe0020000

00001b14 <SPIInit>:
    1b14:	e59f1064 	ldr	r1, [pc, #100]	; 1b80 <SPIInit+0x6c>
    1b18:	e59130c4 	ldr	r3, [r1, #196]
    1b1c:	e59f2060 	ldr	r2, [pc, #96]	; 1b84 <SPIInit+0x70>
    1b20:	e3833c01 	orr	r3, r3, #256	; 0x100
    1b24:	e58130c4 	str	r3, [r1, #196]
    1b28:	e3a03501 	mov	r3, #4194304	; 0x400000
    1b2c:	e5823004 	str	r3, [r2, #4]
    1b30:	e5923008 	ldr	r3, [r2, #8]
    1b34:	e3833501 	orr	r3, r3, #4194304	; 0x400000
    1b38:	e5823008 	str	r3, [r2, #8]
    1b3c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1b40:	e3a00004 	mov	r0, #4	; 0x4
    1b44:	e3a01001 	mov	r1, #1	; 0x1
    1b48:	ebfff983 	bl	15c <HalPinSelect>
    1b4c:	e3a00005 	mov	r0, #5	; 0x5
    1b50:	e3a01001 	mov	r1, #1	; 0x1
    1b54:	ebfff980 	bl	15c <HalPinSelect>
    1b58:	e3a00006 	mov	r0, #6	; 0x6
    1b5c:	e3a01001 	mov	r1, #1	; 0x1
    1b60:	ebfff97d 	bl	15c <HalPinSelect>
    1b64:	e3a00016 	mov	r0, #22	; 0x16
    1b68:	e3a01000 	mov	r1, #0	; 0x0
    1b6c:	ebfff97a 	bl	15c <HalPinSelect>
    1b70:	e59f3010 	ldr	r3, [pc, #16]	; 1b88 <SPIInit+0x74>
    1b74:	e3a02030 	mov	r2, #48	; 0x30
    1b78:	e5832000 	str	r2, [r3]
    1b7c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
    1b80:	e01fc000 	.word	0xe01fc000
    1b84:	e0028000 	.word	0xe0028000
    1b88:	e0020000 	.word	0xe0020000

00001b8c <SPISetSpeed>:
    1b8c:	e92d4030 	push	{r4, r5, lr}
    1b90:	e1a05000 	mov	r5, r0
    1b94:	ebfff96d 	bl	150 <HalSysGetPCLK>
    1b98:	e0804fa0 	add	r4, r0, r0, lsr #31
    1b9c:	e1a040c4 	asr	r4, r4, #1
    1ba0:	e2450001 	sub	r0, r5, #1	; 0x1
    1ba4:	e1a01005 	mov	r1, r5
    1ba8:	e0800004 	add	r0, r0, r4
    1bac:	eb00046d 	bl	2d68 <__aeabi_idiv>
    1bb0:	e3a03ffa 	mov	r3, #1000	; 0x3e8
    1bb4:	e3500004 	cmp	r0, #4	; 0x4
    1bb8:	a1a02000 	movge	r2, r0
    1bbc:	b3a02004 	movlt	r2, #4	; 0x4
    1bc0:	e0010392 	mul	r1, r2, r3
    1bc4:	e59f301c 	ldr	r3, [pc, #28]	; 1be8 <SPISetSpeed+0x5c>
    1bc8:	e1a02082 	lsl	r2, r2, #1
    1bcc:	e1a00004 	mov	r0, r4
    1bd0:	e583200c 	str	r2, [r3, #12]
    1bd4:	eb000463 	bl	2d68 <__aeabi_idiv>
    1bd8:	e1a01000 	mov	r1, r0
    1bdc:	e59f0008 	ldr	r0, [pc, #8]	; 1bec <SPISetSpeed+0x60>
    1be0:	e8bd4030 	pop	{r4, r5, lr}
    1be4:	eafffa99 	b	650 <printf>
    1be8:	e0020000 	.word	0xe0020000
    1bec:	000036a0 	.word	0x000036a0

00001bf0 <USBHwCmd>:
    1bf0:	e1a00800 	lsl	r0, r0, #16
    1bf4:	e59f2028 	ldr	r2, [pc, #40]	; 1c24 <USBHwCmd+0x34>
    1bf8:	e20008ff 	and	r0, r0, #16711680	; 0xff0000
    1bfc:	e3800c05 	orr	r0, r0, #1280	; 0x500
    1c00:	e3a03030 	mov	r3, #48	; 0x30
    1c04:	e5023df7 	str	r3, [r2, #-3575]
    1c08:	e5020def 	str	r0, [r2, #-3567]
    1c0c:	e5123dff 	ldr	r3, [r2, #-3583]
    1c10:	e2033010 	and	r3, r3, #16	; 0x10
    1c14:	e3530010 	cmp	r3, #16	; 0x10
    1c18:	1afffffb 	bne	1c0c <USBHwCmd+0x1c>
    1c1c:	e5023df7 	str	r3, [r2, #-3575]
    1c20:	e12fff1e 	bx	lr
    1c24:	ffe0cfff 	.word	0xffe0cfff

00001c28 <USBHwCmdWrite>:
    1c28:	e92d4010 	push	{r4, lr}
    1c2c:	e1a04801 	lsl	r4, r1, #16
    1c30:	e20000ff 	and	r0, r0, #255	; 0xff
    1c34:	e1a04824 	lsr	r4, r4, #16
    1c38:	ebffffec 	bl	1bf0 <USBHwCmd>
    1c3c:	e1a04804 	lsl	r4, r4, #16
    1c40:	e59f3020 	ldr	r3, [pc, #32]	; 1c68 <USBHwCmdWrite+0x40>
    1c44:	e3844c01 	orr	r4, r4, #256	; 0x100
    1c48:	e5034def 	str	r4, [r3, #-3567]
    1c4c:	e1a02003 	mov	r2, r3
    1c50:	e5123dff 	ldr	r3, [r2, #-3583]
    1c54:	e2033010 	and	r3, r3, #16	; 0x10
    1c58:	e3530010 	cmp	r3, #16	; 0x10
    1c5c:	1afffffb 	bne	1c50 <USBHwCmdWrite+0x28>
    1c60:	e5023df7 	str	r3, [r2, #-3575]
    1c64:	e8bd8010 	pop	{r4, pc}
    1c68:	ffe0cfff 	.word	0xffe0cfff

00001c6c <USBHwCmdRead>:
    1c6c:	e92d4010 	push	{r4, lr}
    1c70:	e20040ff 	and	r4, r0, #255	; 0xff
    1c74:	e1a00004 	mov	r0, r4
    1c78:	ebffffdc 	bl	1bf0 <USBHwCmd>
    1c7c:	e1a04804 	lsl	r4, r4, #16
    1c80:	e59f3028 	ldr	r3, [pc, #40]	; 1cb0 <USBHwCmdRead+0x44>
    1c84:	e3844c02 	orr	r4, r4, #512	; 0x200
    1c88:	e5034def 	str	r4, [r3, #-3567]
    1c8c:	e1a02003 	mov	r2, r3
    1c90:	e5123dff 	ldr	r3, [r2, #-3583]
    1c94:	e2033020 	and	r3, r3, #32	; 0x20
    1c98:	e3530020 	cmp	r3, #32	; 0x20
    1c9c:	1afffffb 	bne	1c90 <USBHwCmdRead+0x24>
    1ca0:	e5023df7 	str	r3, [r2, #-3575]
    1ca4:	e5120deb 	ldr	r0, [r2, #-3563]
    1ca8:	e20000ff 	and	r0, r0, #255	; 0xff
    1cac:	e8bd8010 	pop	{r4, pc}
    1cb0:	ffe0cfff 	.word	0xffe0cfff

00001cb4 <USBHwEPConfig>:
    1cb4:	e59fc04c 	ldr	ip, [pc, #76]	; 1d08 <USBHwEPConfig+0x54>
    1cb8:	e200300f 	and	r3, r0, #15	; 0xf
    1cbc:	e51c2dbb 	ldr	r2, [ip, #-3515]
    1cc0:	e1a03083 	lsl	r3, r3, #1
    1cc4:	e2000080 	and	r0, r0, #128	; 0x80
    1cc8:	e18303a0 	orr	r0, r3, r0, lsr #7
    1ccc:	e3a03001 	mov	r3, #1	; 0x1
    1cd0:	e1822013 	orr	r2, r2, r3, lsl r0
    1cd4:	e1a01801 	lsl	r1, r1, #16
    1cd8:	e1a01821 	lsr	r1, r1, #16
    1cdc:	e50c2dbb 	str	r2, [ip, #-3515]
    1ce0:	e50c0db7 	str	r0, [ip, #-3511]
    1ce4:	e50c1db3 	str	r1, [ip, #-3507]
    1ce8:	e51c3dff 	ldr	r3, [ip, #-3583]
    1cec:	e2033c01 	and	r3, r3, #256	; 0x100
    1cf0:	e3530c01 	cmp	r3, #256	; 0x100
    1cf4:	1afffffb 	bne	1ce8 <USBHwEPConfig+0x34>
    1cf8:	e3800040 	orr	r0, r0, #64	; 0x40
    1cfc:	e3a01000 	mov	r1, #0	; 0x0
    1d00:	e50c3df7 	str	r3, [ip, #-3575]
    1d04:	eaffffc7 	b	1c28 <USBHwCmdWrite>
    1d08:	ffe0cfff 	.word	0xffe0cfff

00001d0c <USBHwSetAddress>:
    1d0c:	e200107f 	and	r1, r0, #127	; 0x7f
    1d10:	e3811080 	orr	r1, r1, #128	; 0x80
    1d14:	e3a000d0 	mov	r0, #208	; 0xd0
    1d18:	eaffffc2 	b	1c28 <USBHwCmdWrite>

00001d1c <USBHwConnect>:
    1d1c:	e3500000 	cmp	r0, #0	; 0x0
    1d20:	159f3020 	ldrne	r3, [pc, #32]	; 1d48 <USBHwConnect+0x2c>
    1d24:	059f301c 	ldreq	r3, [pc, #28]	; 1d48 <USBHwConnect+0x2c>
    1d28:	13a02c02 	movne	r2, #512	; 0x200
    1d2c:	03a02c02 	moveq	r2, #512	; 0x200
    1d30:	15032fa3 	strne	r2, [r3, #-4003]
    1d34:	05032fa7 	streq	r2, [r3, #-4007]
    1d38:	e2501000 	subs	r1, r0, #0	; 0x0
    1d3c:	13a01001 	movne	r1, #1	; 0x1
    1d40:	e3a000fe 	mov	r0, #254	; 0xfe
    1d44:	eaffffb7 	b	1c28 <USBHwCmdWrite>
    1d48:	3fffcfff 	.word	0x3fffcfff

00001d4c <USBHwNakIntEnable>:
    1d4c:	e20010ff 	and	r1, r0, #255	; 0xff
    1d50:	e3a000f3 	mov	r0, #243	; 0xf3
    1d54:	eaffffb3 	b	1c28 <USBHwCmdWrite>

00001d58 <USBHwEPGetStatus>:
    1d58:	e1a03000 	mov	r3, r0
    1d5c:	e200000f 	and	r0, r0, #15	; 0xf
    1d60:	e2033080 	and	r3, r3, #128	; 0x80
    1d64:	e1a00080 	lsl	r0, r0, #1
    1d68:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1d6c:	e18003a3 	orr	r0, r0, r3, lsr #7
    1d70:	ebffffbd 	bl	1c6c <USBHwCmdRead>
    1d74:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00001d78 <USBHwEPStall>:
    1d78:	e200300f 	and	r3, r0, #15	; 0xf
    1d7c:	e1a03083 	lsl	r3, r3, #1
    1d80:	e2000080 	and	r0, r0, #128	; 0x80
    1d84:	e18333a0 	orr	r3, r3, r0, lsr #7
    1d88:	e2511000 	subs	r1, r1, #0	; 0x0
    1d8c:	13a01001 	movne	r1, #1	; 0x1
    1d90:	e3830040 	orr	r0, r3, #64	; 0x40
    1d94:	eaffffa3 	b	1c28 <USBHwCmdWrite>

00001d98 <USBHwEPWrite>:
    1d98:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    1d9c:	e59fc07c 	ldr	ip, [pc, #124]	; 1e20 <USBHwEPWrite+0x88>
    1da0:	e200500f 	and	r5, r0, #15	; 0xf
    1da4:	e1a03105 	lsl	r3, r5, #2
    1da8:	e3833002 	orr	r3, r3, #2	; 0x2
    1dac:	e1a06002 	mov	r6, r2
    1db0:	e1a0e001 	mov	lr, r1
    1db4:	e1a0400c 	mov	r4, ip
    1db8:	e20070ff 	and	r7, r0, #255	; 0xff
    1dbc:	e50c3dd7 	str	r3, [ip, #-3543]
    1dc0:	e50c2ddb 	str	r2, [ip, #-3547]
    1dc4:	ea000008 	b	1dec <USBHwEPWrite+0x54>
    1dc8:	e55e3002 	ldrb	r3, [lr, #-2]
    1dcc:	e55e2001 	ldrb	r2, [lr, #-1]
    1dd0:	e55e1004 	ldrb	r1, [lr, #-4]
    1dd4:	e1a03803 	lsl	r3, r3, #16
    1dd8:	e1833c02 	orr	r3, r3, r2, lsl #24
    1ddc:	e55e2003 	ldrb	r2, [lr, #-3]
    1de0:	e1833001 	orr	r3, r3, r1
    1de4:	e1833402 	orr	r3, r3, r2, lsl #8
    1de8:	e5003de3 	str	r3, [r0, #-3555]
    1dec:	e5143dd7 	ldr	r3, [r4, #-3543]
    1df0:	e2133002 	ands	r3, r3, #2	; 0x2
    1df4:	e28ee004 	add	lr, lr, #4	; 0x4
    1df8:	e1a00004 	mov	r0, r4
    1dfc:	1afffff1 	bne	1dc8 <USBHwEPWrite+0x30>
    1e00:	e1a00085 	lsl	r0, r5, #1
    1e04:	e18003a7 	orr	r0, r0, r7, lsr #7
    1e08:	e5043dd7 	str	r3, [r4, #-3543]
    1e0c:	ebffff77 	bl	1bf0 <USBHwCmd>
    1e10:	e3a000fa 	mov	r0, #250	; 0xfa
    1e14:	ebffff75 	bl	1bf0 <USBHwCmd>
    1e18:	e1a00006 	mov	r0, r6
    1e1c:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    1e20:	ffe0cfff 	.word	0xffe0cfff

00001e24 <USBHwEPRead>:
    1e24:	e92d4030 	push	{r4, r5, lr}
    1e28:	e200e00f 	and	lr, r0, #15	; 0xf
    1e2c:	e59fc088 	ldr	ip, [pc, #136]	; 1ebc <USBHwEPRead+0x98>
    1e30:	e1a0310e 	lsl	r3, lr, #2
    1e34:	e3833001 	orr	r3, r3, #1	; 0x1
    1e38:	e50c3dd7 	str	r3, [ip, #-3543]
    1e3c:	e20050ff 	and	r5, r0, #255	; 0xff
    1e40:	e51c3ddf 	ldr	r3, [ip, #-3551]
    1e44:	e3130b02 	tst	r3, #2048	; 0x800
    1e48:	0afffffc 	beq	1e40 <USBHwEPRead+0x1c>
    1e4c:	e3130b01 	tst	r3, #1024	; 0x400
    1e50:	03e04000 	mvneq	r4, #0	; 0x0
    1e54:	0a000016 	beq	1eb4 <USBHwEPRead+0x90>
    1e58:	e1a03b03 	lsl	r3, r3, #22
    1e5c:	e3a04000 	mov	r4, #0	; 0x0
    1e60:	e59fc054 	ldr	ip, [pc, #84]	; 1ebc <USBHwEPRead+0x98>
    1e64:	e1a03b23 	lsr	r3, r3, #22
    1e68:	e1a00004 	mov	r0, r4
    1e6c:	ea000006 	b	1e8c <USBHwEPRead+0x68>
    1e70:	e3140003 	tst	r4, #3	; 0x3
    1e74:	051c0de7 	ldreq	r0, [ip, #-3559]
    1e78:	e3510000 	cmp	r1, #0	; 0x0
    1e7c:	11540002 	cmpne	r4, r2
    1e80:	b7c40001 	strblt	r0, [r4, r1]
    1e84:	e2844001 	add	r4, r4, #1	; 0x1
    1e88:	e1a00420 	lsr	r0, r0, #8
    1e8c:	e1540003 	cmp	r4, r3
    1e90:	1afffff6 	bne	1e70 <USBHwEPRead+0x4c>
    1e94:	e59f3020 	ldr	r3, [pc, #32]	; 1ebc <USBHwEPRead+0x98>
    1e98:	e1a0008e 	lsl	r0, lr, #1
    1e9c:	e3a02000 	mov	r2, #0	; 0x0
    1ea0:	e18003a5 	orr	r0, r0, r5, lsr #7
    1ea4:	e5032dd7 	str	r2, [r3, #-3543]
    1ea8:	ebffff50 	bl	1bf0 <USBHwCmd>
    1eac:	e3a000f2 	mov	r0, #242	; 0xf2
    1eb0:	ebffff4e 	bl	1bf0 <USBHwCmd>
    1eb4:	e1a00004 	mov	r0, r4
    1eb8:	e8bd8030 	pop	{r4, r5, pc}
    1ebc:	ffe0cfff 	.word	0xffe0cfff

00001ec0 <USBHwISOCEPRead>:
    1ec0:	e92d4030 	push	{r4, r5, lr}
    1ec4:	e200e00f 	and	lr, r0, #15	; 0xf
    1ec8:	e1a0310e 	lsl	r3, lr, #2
    1ecc:	e59fc08c 	ldr	ip, [pc, #140]	; 1f60 <USBHwISOCEPRead+0xa0>
    1ed0:	e3833001 	orr	r3, r3, #1	; 0x1
    1ed4:	e50c3dd7 	str	r3, [ip, #-3543]
    1ed8:	e20050ff 	and	r5, r0, #255	; 0xff
    1edc:	e1a00000 	nop			(mov r0,r0)
    1ee0:	e51c3ddf 	ldr	r3, [ip, #-3551]
    1ee4:	e2130b02 	ands	r0, r3, #2048	; 0x800
    1ee8:	0a000001 	beq	1ef4 <USBHwISOCEPRead+0x34>
    1eec:	e2130b01 	ands	r0, r3, #1024	; 0x400
    1ef0:	1a000002 	bne	1f00 <USBHwISOCEPRead+0x40>
    1ef4:	e3e04000 	mvn	r4, #0	; 0x0
    1ef8:	e50c0dd7 	str	r0, [ip, #-3543]
    1efc:	ea000015 	b	1f58 <USBHwISOCEPRead+0x98>
    1f00:	e1a03b03 	lsl	r3, r3, #22
    1f04:	e3a04000 	mov	r4, #0	; 0x0
    1f08:	e1a03b23 	lsr	r3, r3, #22
    1f0c:	e1a00004 	mov	r0, r4
    1f10:	ea000006 	b	1f30 <USBHwISOCEPRead+0x70>
    1f14:	e3140003 	tst	r4, #3	; 0x3
    1f18:	051c0de7 	ldreq	r0, [ip, #-3559]
    1f1c:	e3510000 	cmp	r1, #0	; 0x0
    1f20:	11540002 	cmpne	r4, r2
    1f24:	b7c40001 	strblt	r0, [r4, r1]
    1f28:	e2844001 	add	r4, r4, #1	; 0x1
    1f2c:	e1a00420 	lsr	r0, r0, #8
    1f30:	e1540003 	cmp	r4, r3
    1f34:	1afffff6 	bne	1f14 <USBHwISOCEPRead+0x54>
    1f38:	e59f3020 	ldr	r3, [pc, #32]	; 1f60 <USBHwISOCEPRead+0xa0>
    1f3c:	e1a0008e 	lsl	r0, lr, #1
    1f40:	e3a02000 	mov	r2, #0	; 0x0
    1f44:	e18003a5 	orr	r0, r0, r5, lsr #7
    1f48:	e5032dd7 	str	r2, [r3, #-3543]
    1f4c:	ebffff27 	bl	1bf0 <USBHwCmd>
    1f50:	e3a000f2 	mov	r0, #242	; 0xf2
    1f54:	ebffff25 	bl	1bf0 <USBHwCmd>
    1f58:	e1a00004 	mov	r0, r4
    1f5c:	e8bd8030 	pop	{r4, r5, pc}
    1f60:	ffe0cfff 	.word	0xffe0cfff

00001f64 <USBHwConfigDevice>:
    1f64:	e2501000 	subs	r1, r0, #0	; 0x0
    1f68:	13a01001 	movne	r1, #1	; 0x1
    1f6c:	e3a000d8 	mov	r0, #216	; 0xd8
    1f70:	eaffff2c 	b	1c28 <USBHwCmdWrite>

00001f74 <USBHwISR>:
    1f74:	e59f3144 	ldr	r3, [pc, #324]	; 20c0 <USBHwISR+0x14c>
    1f78:	e3a02002 	mov	r2, #2	; 0x2
    1f7c:	e5032fa7 	str	r2, [r3, #-4007]
    1f80:	e59f213c 	ldr	r2, [pc, #316]	; 20c4 <USBHwISR+0x150>
    1f84:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
    1f88:	e5126dff 	ldr	r6, [r2, #-3583]
    1f8c:	e3160001 	tst	r6, #1	; 0x1
    1f90:	0a00000b 	beq	1fc4 <USBHwISR+0x50>
    1f94:	e59f312c 	ldr	r3, [pc, #300]	; 20c8 <USBHwISR+0x154>
    1f98:	e5934000 	ldr	r4, [r3]
    1f9c:	e3a03001 	mov	r3, #1	; 0x1
    1fa0:	e3540000 	cmp	r4, #0	; 0x0
    1fa4:	e5023df7 	str	r3, [r2, #-3575]
    1fa8:	0a000005 	beq	1fc4 <USBHwISR+0x50>
    1fac:	e3a000f5 	mov	r0, #245	; 0xf5
    1fb0:	ebffff2d 	bl	1c6c <USBHwCmdRead>
    1fb4:	e1a00800 	lsl	r0, r0, #16
    1fb8:	e1a00820 	lsr	r0, r0, #16
    1fbc:	e1a0e00f 	mov	lr, pc
    1fc0:	e12fff14 	bx	r4
    1fc4:	e3160008 	tst	r6, #8	; 0x8
    1fc8:	0a000011 	beq	2014 <USBHwISR+0xa0>
    1fcc:	e59f30f0 	ldr	r3, [pc, #240]	; 20c4 <USBHwISR+0x150>
    1fd0:	e3a02008 	mov	r2, #8	; 0x8
    1fd4:	e3a000fe 	mov	r0, #254	; 0xfe
    1fd8:	e5032df7 	str	r2, [r3, #-3575]
    1fdc:	ebffff22 	bl	1c6c <USBHwCmdRead>
    1fe0:	e310001a 	tst	r0, #26	; 0x1a
    1fe4:	0a00000a 	beq	2014 <USBHwISR+0xa0>
    1fe8:	e59f30dc 	ldr	r3, [pc, #220]	; 20cc <USBHwISR+0x158>
    1fec:	e5933000 	ldr	r3, [r3]
    1ff0:	e3530000 	cmp	r3, #0	; 0x0
    1ff4:	0a000006 	beq	2014 <USBHwISR+0xa0>
    1ff8:	e59f50c0 	ldr	r5, [pc, #192]	; 20c0 <USBHwISR+0x14c>
    1ffc:	e3a04001 	mov	r4, #1	; 0x1
    2000:	e5054fa7 	str	r4, [r5, #-4007]
    2004:	e2000015 	and	r0, r0, #21	; 0x15
    2008:	e1a0e00f 	mov	lr, pc
    200c:	e12fff13 	bx	r3
    2010:	e5054fa3 	str	r4, [r5, #-4003]
    2014:	e3160004 	tst	r6, #4	; 0x4
    2018:	0a000024 	beq	20b0 <USBHwISR+0x13c>
    201c:	e59f30a0 	ldr	r3, [pc, #160]	; 20c4 <USBHwISR+0x150>
    2020:	e3a02004 	mov	r2, #4	; 0x4
    2024:	e5032df7 	str	r2, [r3, #-3575]
    2028:	e59fa0a0 	ldr	sl, [pc, #160]	; 20d0 <USBHwISR+0x15c>
    202c:	e59f708c 	ldr	r7, [pc, #140]	; 20c0 <USBHwISR+0x14c>
    2030:	e1a05003 	mov	r5, r3
    2034:	e1a06002 	mov	r6, r2
    2038:	e3a04000 	mov	r4, #0	; 0x0
    203c:	e3a08001 	mov	r8, #1	; 0x1
    2040:	e1a02418 	lsl	r2, r8, r4
    2044:	e5153dcf 	ldr	r3, [r5, #-3535]
    2048:	e1120003 	tst	r2, r3
    204c:	0a000014 	beq	20a4 <USBHwISR+0x130>
    2050:	e5052dc7 	str	r2, [r5, #-3527]
    2054:	e5153dff 	ldr	r3, [r5, #-3583]
    2058:	e2032020 	and	r2, r3, #32	; 0x20
    205c:	e3520020 	cmp	r2, #32	; 0x20
    2060:	1afffffb 	bne	2054 <USBHwISR+0xe0>
    2064:	e0843fa4 	add	r3, r4, r4, lsr #31
    2068:	e1a030c3 	asr	r3, r3, #1
    206c:	e79a3103 	ldr	r3, [sl, r3, lsl #2]
    2070:	e5052df7 	str	r2, [r5, #-3575]
    2074:	e3530000 	cmp	r3, #0	; 0x0
    2078:	e5151deb 	ldr	r1, [r5, #-3563]
    207c:	0a000008 	beq	20a4 <USBHwISR+0x130>
    2080:	e1a000c4 	asr	r0, r4, #1
    2084:	e200000f 	and	r0, r0, #15	; 0xf
    2088:	e1800384 	orr	r0, r0, r4, lsl #7
    208c:	e5076fa7 	str	r6, [r7, #-4007]
    2090:	e200008f 	and	r0, r0, #143	; 0x8f
    2094:	e201101f 	and	r1, r1, #31	; 0x1f
    2098:	e1a0e00f 	mov	lr, pc
    209c:	e12fff13 	bx	r3
    20a0:	e5076fa3 	str	r6, [r7, #-4003]
    20a4:	e2844001 	add	r4, r4, #1	; 0x1
    20a8:	e3540020 	cmp	r4, #32	; 0x20
    20ac:	1affffe3 	bne	2040 <USBHwISR+0xcc>
    20b0:	e59f3008 	ldr	r3, [pc, #8]	; 20c0 <USBHwISR+0x14c>
    20b4:	e3a02002 	mov	r2, #2	; 0x2
    20b8:	e5032fa3 	str	r2, [r3, #-4003]
    20bc:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
    20c0:	3fffcfff 	.word	0x3fffcfff
    20c4:	ffe0cfff 	.word	0xffe0cfff
    20c8:	4000044c 	.word	0x4000044c
    20cc:	40000450 	.word	0x40000450
    20d0:	40000454 	.word	0x40000454

000020d4 <USBHwInit>:
    20d4:	e59f2120 	ldr	r2, [pc, #288]	; 21fc <USBHwInit+0x128>
    20d8:	e5923004 	ldr	r3, [r2, #4]
    20dc:	e3c3330f 	bic	r3, r3, #1006632960	; 0x3c000000
    20e0:	e3833305 	orr	r3, r3, #335544320	; 0x14000000
    20e4:	e5823004 	str	r3, [r2, #4]
    20e8:	e592300c 	ldr	r3, [r2, #12]
    20ec:	e3c33203 	bic	r3, r3, #805306368	; 0x30000000
    20f0:	e3c33030 	bic	r3, r3, #48	; 0x30
    20f4:	e3833202 	orr	r3, r3, #536870912	; 0x20000000
    20f8:	e3833010 	orr	r3, r3, #16	; 0x10
    20fc:	e582300c 	str	r3, [r2, #12]
    2100:	e5923010 	ldr	r3, [r2, #16]
    2104:	e3c33703 	bic	r3, r3, #786432	; 0xc0000
    2108:	e5823010 	str	r3, [r2, #16]
    210c:	e59f20ec 	ldr	r2, [pc, #236]	; 2200 <USBHwInit+0x12c>
    2110:	e5123fbf 	ldr	r3, [r2, #-4031]
    2114:	e3833c02 	orr	r3, r3, #512	; 0x200
    2118:	e5023fbf 	str	r3, [r2, #-4031]
    211c:	e3a03c02 	mov	r3, #512	; 0x200
    2120:	e5023fa7 	str	r3, [r2, #-4007]
    2124:	e59f20d8 	ldr	r2, [pc, #216]	; 2204 <USBHwInit+0x130>
    2128:	e59230c4 	ldr	r3, [r2, #196]
    212c:	e92d4010 	push	{r4, lr}
    2130:	e3833102 	orr	r3, r3, #-2147483648	; 0x80000000
    2134:	e58230c4 	str	r3, [r2, #196]
    2138:	e59f10c8 	ldr	r1, [pc, #200]	; 2208 <USBHwInit+0x134>
    213c:	e3a03005 	mov	r3, #5	; 0x5
    2140:	e5823108 	str	r3, [r2, #264]
    2144:	e283300d 	add	r3, r3, #13	; 0xd
    2148:	e501300b 	str	r3, [r1, #-11]
    214c:	e5113007 	ldr	r3, [r1, #-7]
    2150:	e3130012 	tst	r3, #18	; 0x12
    2154:	0afffffc 	beq	214c <USBHwInit+0x78>
    2158:	e3a04000 	mov	r4, #0	; 0x0
    215c:	e3e03000 	mvn	r3, #0	; 0x0
    2160:	e5014dfb 	str	r4, [r1, #-3579]
    2164:	e1a00004 	mov	r0, r4
    2168:	e5013df7 	str	r3, [r1, #-3575]
    216c:	e5014dd3 	str	r4, [r1, #-3539]
    2170:	e5014dcb 	str	r4, [r1, #-3531]
    2174:	e5013dc7 	str	r3, [r1, #-3527]
    2178:	e5014dbf 	str	r4, [r1, #-3519]
    217c:	ebfffef2 	bl	1d4c <USBHwNakIntEnable>
    2180:	e59f107c 	ldr	r1, [pc, #124]	; 2204 <USBHwInit+0x130>
    2184:	e59131a0 	ldr	r3, [r1, #416]
    2188:	e59fc06c 	ldr	ip, [pc, #108]	; 21fc <USBHwInit+0x128>
    218c:	e3833001 	orr	r3, r3, #1	; 0x1
    2190:	e58131a0 	str	r3, [r1, #416]
    2194:	e59f2064 	ldr	r2, [pc, #100]	; 2200 <USBHwInit+0x12c>
    2198:	e58c4028 	str	r4, [ip, #40]
    219c:	e5123fbf 	ldr	r3, [r2, #-4031]
    21a0:	e3a00001 	mov	r0, #1	; 0x1
    21a4:	e3833001 	orr	r3, r3, #1	; 0x1
    21a8:	e5023fbf 	str	r3, [r2, #-4031]
    21ac:	e5020fa3 	str	r0, [r2, #-4003]
    21b0:	e59131a0 	ldr	r3, [r1, #416]
    21b4:	e1833000 	orr	r3, r3, r0
    21b8:	e58131a0 	str	r3, [r1, #416]
    21bc:	e58c4028 	str	r4, [ip, #40]
    21c0:	e5123fbf 	ldr	r3, [r2, #-4031]
    21c4:	e3833002 	orr	r3, r3, #2	; 0x2
    21c8:	e5023fbf 	str	r3, [r2, #-4031]
    21cc:	e3a03002 	mov	r3, #2	; 0x2
    21d0:	e5023fa3 	str	r3, [r2, #-4003]
    21d4:	e59131a0 	ldr	r3, [r1, #416]
    21d8:	e1833000 	orr	r3, r3, r0
    21dc:	e58131a0 	str	r3, [r1, #416]
    21e0:	e58c4028 	str	r4, [ip, #40]
    21e4:	e5123fbf 	ldr	r3, [r2, #-4031]
    21e8:	e3833004 	orr	r3, r3, #4	; 0x4
    21ec:	e5023fbf 	str	r3, [r2, #-4031]
    21f0:	e3a03004 	mov	r3, #4	; 0x4
    21f4:	e5023fa3 	str	r3, [r2, #-4003]
    21f8:	e8bd8010 	pop	{r4, pc}
    21fc:	e002c000 	.word	0xe002c000
    2200:	3fffcfff 	.word	0x3fffcfff
    2204:	e01fc000 	.word	0xe01fc000
    2208:	ffe0cfff 	.word	0xffe0cfff

0000220c <USBSetupDMADescriptor>:
    220c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    2210:	e3a0e000 	mov	lr, #0	; 0x0
    2214:	e580e004 	str	lr, [r0, #4]
    2218:	e5801000 	str	r1, [r0]
    221c:	e1a0c001 	mov	ip, r1
    2220:	e1a03b03 	lsl	r3, r3, #22
    2224:	e5901004 	ldr	r1, [r0, #4]
    2228:	e1a03b23 	lsr	r3, r3, #22
    222c:	e1811283 	orr	r1, r1, r3, lsl #5
    2230:	e5801004 	str	r1, [r0, #4]
    2234:	e1dd10b4 	ldrh	r1, [sp, #4]
    2238:	e5903004 	ldr	r3, [r0, #4]
    223c:	e1833801 	orr	r3, r3, r1, lsl #16
    2240:	e5803004 	str	r3, [r0, #4]
    2244:	e21220ff 	ands	r2, r2, #255	; 0xff
    2248:	15903004 	ldrne	r3, [r0, #4]
    224c:	13833010 	orrne	r3, r3, #16	; 0x10
    2250:	15803004 	strne	r3, [r0, #4]
    2254:	e35c0000 	cmp	ip, #0	; 0x0
    2258:	15903004 	ldrne	r3, [r0, #4]
    225c:	e59d100c 	ldr	r1, [sp, #12]
    2260:	13833004 	orrne	r3, r3, #4	; 0x4
    2264:	15803004 	strne	r3, [r0, #4]
    2268:	e59d3008 	ldr	r3, [sp, #8]
    226c:	e3520000 	cmp	r2, #0	; 0x0
    2270:	13510000 	cmpne	r1, #0	; 0x0
    2274:	e5803008 	str	r3, [r0, #8]
    2278:	15801010 	strne	r1, [r0, #16]
    227c:	e580e00c 	str	lr, [r0, #12]
    2280:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00002284 <USBDisableDMAForEndpoint>:
    2284:	e200200f 	and	r2, r0, #15	; 0xf
    2288:	e1a02082 	lsl	r2, r2, #1
    228c:	e2000080 	and	r0, r0, #128	; 0x80
    2290:	e18223a0 	orr	r2, r2, r0, lsr #7
    2294:	e3a03001 	mov	r3, #1	; 0x1
    2298:	e1a03213 	lsl	r3, r3, r2
    229c:	e59f2004 	ldr	r2, [pc, #4]	; 22a8 <USBDisableDMAForEndpoint+0x24>
    22a0:	e5023d73 	str	r3, [r2, #-3443]
    22a4:	e12fff1e 	bx	lr
    22a8:	ffe0cfff 	.word	0xffe0cfff

000022ac <USBEnableDMAForEndpoint>:
    22ac:	e200200f 	and	r2, r0, #15	; 0xf
    22b0:	e1a02082 	lsl	r2, r2, #1
    22b4:	e2000080 	and	r0, r0, #128	; 0x80
    22b8:	e18223a0 	orr	r2, r2, r0, lsr #7
    22bc:	e3a03001 	mov	r3, #1	; 0x1
    22c0:	e1a03213 	lsl	r3, r3, r2
    22c4:	e59f2004 	ldr	r2, [pc, #4]	; 22d0 <USBEnableDMAForEndpoint+0x24>
    22c8:	e5023d77 	str	r3, [r2, #-3447]
    22cc:	e12fff1e 	bx	lr
    22d0:	ffe0cfff 	.word	0xffe0cfff

000022d4 <USBInitializeISOCFrameArray>:
    22d4:	e92d4030 	push	{r4, r5, lr}
    22d8:	e1a03b03 	lsl	r3, r3, #22
    22dc:	e1a02802 	lsl	r2, r2, #16
    22e0:	e1a03b23 	lsr	r3, r3, #22
    22e4:	e1a05000 	mov	r5, r0
    22e8:	e1a04001 	mov	r4, r1
    22ec:	e1a0c822 	lsr	ip, r2, #16
    22f0:	e3830902 	orr	r0, r3, #32768	; 0x8000
    22f4:	e3a0e000 	mov	lr, #0	; 0x0
    22f8:	ea000000 	b	2300 <USBInitializeISOCFrameArray+0x2c>
    22fc:	e7851102 	str	r1, [r5, r2, lsl #2]
    2300:	e1a0280e 	lsl	r2, lr, #16
    2304:	e28c3001 	add	r3, ip, #1	; 0x1
    2308:	e1a02822 	lsr	r2, r2, #16
    230c:	e1a03803 	lsl	r3, r3, #16
    2310:	e1520004 	cmp	r2, r4
    2314:	e180180c 	orr	r1, r0, ip, lsl #16
    2318:	e28ee001 	add	lr, lr, #1	; 0x1
    231c:	e1a0c823 	lsr	ip, r3, #16
    2320:	3afffff5 	bcc	22fc <USBInitializeISOCFrameArray+0x28>
    2324:	e8bd8030 	pop	{r4, r5, pc}

00002328 <USBSetHeadDDForDMA>:
    2328:	e200300f 	and	r3, r0, #15	; 0xf
    232c:	e1a03083 	lsl	r3, r3, #1
    2330:	e2000080 	and	r0, r0, #128	; 0x80
    2334:	e18333a0 	orr	r3, r3, r0, lsr #7
    2338:	e7812103 	str	r2, [r1, r3, lsl #2]
    233c:	e12fff1e 	bx	lr

00002340 <USBInitializeUSBDMA>:
    2340:	e3a03000 	mov	r3, #0	; 0x0
    2344:	e1a02003 	mov	r2, r3
    2348:	e7832000 	str	r2, [r3, r0]
    234c:	e2833004 	add	r3, r3, #4	; 0x4
    2350:	e3530080 	cmp	r3, #128	; 0x80
    2354:	1afffffb 	bne	2348 <USBInitializeUSBDMA+0x8>
    2358:	e59f3004 	ldr	r3, [pc, #4]	; 2364 <USBInitializeUSBDMA+0x24>
    235c:	e5030d7f 	str	r0, [r3, #-3455]
    2360:	e12fff1e 	bx	lr
    2364:	ffe0cfff 	.word	0xffe0cfff

00002368 <USBHwRegisterFrameHandler>:
    2368:	e59f1018 	ldr	r1, [pc, #24]	; 2388 <USBHwRegisterFrameHandler+0x20>
    236c:	e59f3018 	ldr	r3, [pc, #24]	; 238c <USBHwRegisterFrameHandler+0x24>
    2370:	e5112dfb 	ldr	r2, [r1, #-3579]
    2374:	e5830000 	str	r0, [r3]
    2378:	e59f0010 	ldr	r0, [pc, #16]	; 2390 <USBHwRegisterFrameHandler+0x28>
    237c:	e3822001 	orr	r2, r2, #1	; 0x1
    2380:	e5012dfb 	str	r2, [r1, #-3579]
    2384:	eafff8e7 	b	728 <puts>
    2388:	ffe0cfff 	.word	0xffe0cfff
    238c:	4000044c 	.word	0x4000044c
    2390:	000036bc 	.word	0x000036bc

00002394 <USBHwRegisterDevIntHandler>:
    2394:	e59f1018 	ldr	r1, [pc, #24]	; 23b4 <USBHwRegisterDevIntHandler+0x20>
    2398:	e59f3018 	ldr	r3, [pc, #24]	; 23b8 <USBHwRegisterDevIntHandler+0x24>
    239c:	e5112dfb 	ldr	r2, [r1, #-3579]
    23a0:	e5830000 	str	r0, [r3]
    23a4:	e59f0010 	ldr	r0, [pc, #16]	; 23bc <USBHwRegisterDevIntHandler+0x28>
    23a8:	e3822008 	orr	r2, r2, #8	; 0x8
    23ac:	e5012dfb 	str	r2, [r1, #-3579]
    23b0:	eafff8dc 	b	728 <puts>
    23b4:	ffe0cfff 	.word	0xffe0cfff
    23b8:	40000450 	.word	0x40000450
    23bc:	000036dc 	.word	0x000036dc

000023c0 <USBHwRegisterEPIntHandler>:
    23c0:	e92d4010 	push	{r4, lr}
    23c4:	e200300f 	and	r3, r0, #15	; 0xf
    23c8:	e1a03083 	lsl	r3, r3, #1
    23cc:	e2002080 	and	r2, r0, #128	; 0x80
    23d0:	e183e3a2 	orr	lr, r3, r2, lsr #7
    23d4:	e35e001f 	cmp	lr, #31	; 0x1f
    23d8:	e1a04001 	mov	r4, r1
    23dc:	e24dd004 	sub	sp, sp, #4	; 0x4
    23e0:	e20010ff 	and	r1, r0, #255	; 0xff
    23e4:	da000007 	ble	2408 <USBHwRegisterEPIntHandler+0x48>
    23e8:	e3a0c0d2 	mov	ip, #210	; 0xd2
    23ec:	e59f0050 	ldr	r0, [pc, #80]	; 2444 <USBHwRegisterEPIntHandler+0x84>
    23f0:	e59f1050 	ldr	r1, [pc, #80]	; 2448 <USBHwRegisterEPIntHandler+0x88>
    23f4:	e59f2050 	ldr	r2, [pc, #80]	; 244c <USBHwRegisterEPIntHandler+0x8c>
    23f8:	e59f3050 	ldr	r3, [pc, #80]	; 2450 <USBHwRegisterEPIntHandler+0x90>
    23fc:	e58dc000 	str	ip, [sp]
    2400:	ebfff892 	bl	650 <printf>
    2404:	eafffffe 	b	2404 <USBHwRegisterEPIntHandler+0x44>
    2408:	e59fc044 	ldr	ip, [pc, #68]	; 2454 <USBHwRegisterEPIntHandler+0x94>
    240c:	e51c3dcb 	ldr	r3, [ip, #-3531]
    2410:	e3a02001 	mov	r2, #1	; 0x1
    2414:	e1833e12 	orr	r3, r3, r2, lsl lr
    2418:	e50c3dcb 	str	r3, [ip, #-3531]
    241c:	e51c2dfb 	ldr	r2, [ip, #-3579]
    2420:	e59f3030 	ldr	r3, [pc, #48]	; 2458 <USBHwRegisterEPIntHandler+0x98>
    2424:	e59f0030 	ldr	r0, [pc, #48]	; 245c <USBHwRegisterEPIntHandler+0x9c>
    2428:	e3822004 	orr	r2, r2, #4	; 0x4
    242c:	e1a0e0ae 	lsr	lr, lr, #1
    2430:	e783410e 	str	r4, [r3, lr, lsl #2]
    2434:	e50c2dfb 	str	r2, [ip, #-3579]
    2438:	e28dd004 	add	sp, sp, #4	; 0x4
    243c:	e8bd4010 	pop	{r4, lr}
    2440:	eafff882 	b	650 <printf>
    2444:	00003228 	.word	0x00003228
    2448:	00003704 	.word	0x00003704
    244c:	0000370c 	.word	0x0000370c
    2450:	00003100 	.word	0x00003100
    2454:	ffe0cfff 	.word	0xffe0cfff
    2458:	40000454 	.word	0x40000454
    245c:	00003718 	.word	0x00003718

00002460 <USBRegisterRequestHandler>:
    2460:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    2464:	e3500000 	cmp	r0, #0	; 0x0
    2468:	e24dd004 	sub	sp, sp, #4	; 0x4
    246c:	aa000007 	bge	2490 <USBRegisterRequestHandler+0x30>
    2470:	e3a0c0e2 	mov	ip, #226	; 0xe2
    2474:	e59f0054 	ldr	r0, [pc, #84]	; 24d0 <USBRegisterRequestHandler+0x70>
    2478:	e59f1054 	ldr	r1, [pc, #84]	; 24d4 <USBRegisterRequestHandler+0x74>
    247c:	e59f2054 	ldr	r2, [pc, #84]	; 24d8 <USBRegisterRequestHandler+0x78>
    2480:	e59f3054 	ldr	r3, [pc, #84]	; 24dc <USBRegisterRequestHandler+0x7c>
    2484:	e58dc000 	str	ip, [sp]
    2488:	ebfff870 	bl	650 <printf>
    248c:	eafffffe 	b	248c <USBRegisterRequestHandler+0x2c>
    2490:	e3500003 	cmp	r0, #3	; 0x3
    2494:	da000007 	ble	24b8 <USBRegisterRequestHandler+0x58>
    2498:	e3a0c0e3 	mov	ip, #227	; 0xe3
    249c:	e59f002c 	ldr	r0, [pc, #44]	; 24d0 <USBRegisterRequestHandler+0x70>
    24a0:	e59f1038 	ldr	r1, [pc, #56]	; 24e0 <USBRegisterRequestHandler+0x80>
    24a4:	e59f202c 	ldr	r2, [pc, #44]	; 24d8 <USBRegisterRequestHandler+0x78>
    24a8:	e59f302c 	ldr	r3, [pc, #44]	; 24dc <USBRegisterRequestHandler+0x7c>
    24ac:	e58dc000 	str	ip, [sp]
    24b0:	ebfff866 	bl	650 <printf>
    24b4:	eafffffe 	b	24b4 <USBRegisterRequestHandler+0x54>
    24b8:	e59f3024 	ldr	r3, [pc, #36]	; 24e4 <USBRegisterRequestHandler+0x84>
    24bc:	e7832100 	str	r2, [r3, r0, lsl #2]
    24c0:	e59f3020 	ldr	r3, [pc, #32]	; 24e8 <USBRegisterRequestHandler+0x88>
    24c4:	e7831100 	str	r1, [r3, r0, lsl #2]
    24c8:	e28dd004 	add	sp, sp, #4	; 0x4
    24cc:	e8bd8000 	pop	{pc}
    24d0:	00003228 	.word	0x00003228
    24d4:	00003738 	.word	0x00003738
    24d8:	00003744 	.word	0x00003744
    24dc:	0000311c 	.word	0x0000311c
    24e0:	00003754 	.word	0x00003754
    24e4:	400004a4 	.word	0x400004a4
    24e8:	40000494 	.word	0x40000494

000024ec <_HandleRequest>:
    24ec:	e92d4010 	push	{r4, lr}
    24f0:	e5d03000 	ldrb	r3, [r0]
    24f4:	e1a032a3 	lsr	r3, r3, #5
    24f8:	e203c003 	and	ip, r3, #3	; 0x3
    24fc:	e59f3028 	ldr	r3, [pc, #40]	; 252c <_HandleRequest+0x40>
    2500:	e793410c 	ldr	r4, [r3, ip, lsl #2]
    2504:	e3540000 	cmp	r4, #0	; 0x0
    2508:	1a000004 	bne	2520 <_HandleRequest+0x34>
    250c:	e1a0100c 	mov	r1, ip
    2510:	e59f0018 	ldr	r0, [pc, #24]	; 2530 <_HandleRequest+0x44>
    2514:	ebfff84d 	bl	650 <printf>
    2518:	e1a00004 	mov	r0, r4
    251c:	e8bd8010 	pop	{r4, pc}
    2520:	e1a0e00f 	mov	lr, pc
    2524:	e12fff14 	bx	r4
    2528:	e8bd8010 	pop	{r4, pc}
    252c:	40000494 	.word	0x40000494
    2530:	00003760 	.word	0x00003760

00002534 <StallControlPipe>:
    2534:	e92d4070 	push	{r4, r5, r6, lr}
    2538:	e1a03000 	mov	r3, r0
    253c:	e3a01001 	mov	r1, #1	; 0x1
    2540:	e3a00080 	mov	r0, #128	; 0x80
    2544:	e20350ff 	and	r5, r3, #255	; 0xff
    2548:	ebfffe0a 	bl	1d78 <USBHwEPStall>
    254c:	e59f0030 	ldr	r0, [pc, #48]	; 2584 <StallControlPipe+0x50>
    2550:	ebfff83e 	bl	650 <printf>
    2554:	e59f602c 	ldr	r6, [pc, #44]	; 2588 <StallControlPipe+0x54>
    2558:	e3a04000 	mov	r4, #0	; 0x0
    255c:	e7d41006 	ldrb	r1, [r4, r6]
    2560:	e59f0024 	ldr	r0, [pc, #36]	; 258c <StallControlPipe+0x58>
    2564:	e2844001 	add	r4, r4, #1	; 0x1
    2568:	ebfff838 	bl	650 <printf>
    256c:	e3540008 	cmp	r4, #8	; 0x8
    2570:	1afffff9 	bne	255c <StallControlPipe+0x28>
    2574:	e59f0014 	ldr	r0, [pc, #20]	; 2590 <StallControlPipe+0x5c>
    2578:	e1a01005 	mov	r1, r5
    257c:	e8bd4070 	pop	{r4, r5, r6, lr}
    2580:	eafff832 	b	650 <printf>
    2584:	0000377c 	.word	0x0000377c
    2588:	400004b4 	.word	0x400004b4
    258c:	00003788 	.word	0x00003788
    2590:	00003790 	.word	0x00003790

00002594 <DataIn>:
    2594:	e92d4070 	push	{r4, r5, r6, lr}
    2598:	e59f6038 	ldr	r6, [pc, #56]	; 25d8 <DataIn+0x44>
    259c:	e5964000 	ldr	r4, [r6]
    25a0:	e59f5034 	ldr	r5, [pc, #52]	; 25dc <DataIn+0x48>
    25a4:	e3540040 	cmp	r4, #64	; 0x40
    25a8:	a3a04040 	movge	r4, #64	; 0x40
    25ac:	e1a02004 	mov	r2, r4
    25b0:	e3a00080 	mov	r0, #128	; 0x80
    25b4:	e5951000 	ldr	r1, [r5]
    25b8:	ebfffdf6 	bl	1d98 <USBHwEPWrite>
    25bc:	e5953000 	ldr	r3, [r5]
    25c0:	e5962000 	ldr	r2, [r6]
    25c4:	e0833004 	add	r3, r3, r4
    25c8:	e0642002 	rsb	r2, r4, r2
    25cc:	e5853000 	str	r3, [r5]
    25d0:	e5862000 	str	r2, [r6]
    25d4:	e8bd8070 	pop	{r4, r5, r6, pc}
    25d8:	400004c0 	.word	0x400004c0
    25dc:	400004bc 	.word	0x400004bc

000025e0 <USBHandleControlTransfer>:
    25e0:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    25e4:	e21000ff 	ands	r0, r0, #255	; 0xff
    25e8:	e24dd004 	sub	sp, sp, #4	; 0x4
    25ec:	e20170ff 	and	r7, r1, #255	; 0xff
    25f0:	1a000051 	bne	273c <USBHandleControlTransfer+0x15c>
    25f4:	e3110004 	tst	r1, #4	; 0x4
    25f8:	e59f6178 	ldr	r6, [pc, #376]	; 2778 <USBHandleControlTransfer+0x198>
    25fc:	0a000021 	beq	2688 <USBHandleControlTransfer+0xa8>
    2600:	e59f5174 	ldr	r5, [pc, #372]	; 277c <USBHandleControlTransfer+0x19c>
    2604:	e3a02008 	mov	r2, #8	; 0x8
    2608:	e1a01005 	mov	r1, r5
    260c:	ebfffe04 	bl	1e24 <USBHwEPRead>
    2610:	e5d51001 	ldrb	r1, [r5, #1]
    2614:	e59f0164 	ldr	r0, [pc, #356]	; 2780 <USBHandleControlTransfer+0x1a0>
    2618:	ebfff80c 	bl	650 <printf>
    261c:	e5d50000 	ldrb	r0, [r5]
    2620:	e59f215c 	ldr	r2, [pc, #348]	; 2784 <USBHandleControlTransfer+0x1a4>
    2624:	e1a032a0 	lsr	r3, r0, #5
    2628:	e1d510b6 	ldrh	r1, [r5, #6]
    262c:	e2033003 	and	r3, r3, #3	; 0x3
    2630:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    2634:	e59f414c 	ldr	r4, [pc, #332]	; 2788 <USBHandleControlTransfer+0x1a8>
    2638:	e59f214c 	ldr	r2, [pc, #332]	; 278c <USBHandleControlTransfer+0x1ac>
    263c:	e3510000 	cmp	r1, #0	; 0x0
    2640:	e5823000 	str	r3, [r2]
    2644:	e5861000 	str	r1, [r6]
    2648:	e5841000 	str	r1, [r4]
    264c:	0a000001 	beq	2658 <USBHandleControlTransfer+0x78>
    2650:	e1b003a0 	lsrs	r0, r0, #7
    2654:	0a000045 	beq	2770 <USBHandleControlTransfer+0x190>
    2658:	e1a00005 	mov	r0, r5
    265c:	e1a01004 	mov	r1, r4
    2660:	ebffffa1 	bl	24ec <_HandleRequest>
    2664:	e3500000 	cmp	r0, #0	; 0x0
    2668:	059f0120 	ldreq	r0, [pc, #288]	; 2790 <USBHandleControlTransfer+0x1b0>
    266c:	0a000022 	beq	26fc <USBHandleControlTransfer+0x11c>
    2670:	e1d520b6 	ldrh	r2, [r5, #6]
    2674:	e5943000 	ldr	r3, [r4]
    2678:	e1520003 	cmp	r2, r3
    267c:	d5862000 	strle	r2, [r6]
    2680:	c5863000 	strgt	r3, [r6]
    2684:	ea00002e 	b	2744 <USBHandleControlTransfer+0x164>
    2688:	e5962000 	ldr	r2, [r6]
    268c:	e3520000 	cmp	r2, #0	; 0x0
    2690:	da00001e 	ble	2710 <USBHandleControlTransfer+0x130>
    2694:	e59f40f0 	ldr	r4, [pc, #240]	; 278c <USBHandleControlTransfer+0x1ac>
    2698:	e5941000 	ldr	r1, [r4]
    269c:	ebfffde0 	bl	1e24 <USBHwEPRead>
    26a0:	e3500000 	cmp	r0, #0	; 0x0
    26a4:	ba000015 	blt	2700 <USBHandleControlTransfer+0x120>
    26a8:	e5962000 	ldr	r2, [r6]
    26ac:	e5943000 	ldr	r3, [r4]
    26b0:	e0602002 	rsb	r2, r0, r2
    26b4:	e0833000 	add	r3, r3, r0
    26b8:	e3520000 	cmp	r2, #0	; 0x0
    26bc:	e5843000 	str	r3, [r4]
    26c0:	e5862000 	str	r2, [r6]
    26c4:	1a000029 	bne	2770 <USBHandleControlTransfer+0x190>
    26c8:	e59f00ac 	ldr	r0, [pc, #172]	; 277c <USBHandleControlTransfer+0x19c>
    26cc:	e5d03000 	ldrb	r3, [r0]
    26d0:	e59f20ac 	ldr	r2, [pc, #172]	; 2784 <USBHandleControlTransfer+0x1a4>
    26d4:	e1a032a3 	lsr	r3, r3, #5
    26d8:	e2033003 	and	r3, r3, #3	; 0x3
    26dc:	e7923103 	ldr	r3, [r2, r3, lsl #2]
    26e0:	e59f10a0 	ldr	r1, [pc, #160]	; 2788 <USBHandleControlTransfer+0x1a8>
    26e4:	e1a02004 	mov	r2, r4
    26e8:	e5843000 	str	r3, [r4]
    26ec:	ebffff7e 	bl	24ec <_HandleRequest>
    26f0:	e3500000 	cmp	r0, #0	; 0x0
    26f4:	1a000012 	bne	2744 <USBHandleControlTransfer+0x164>
    26f8:	e59f0094 	ldr	r0, [pc, #148]	; 2794 <USBHandleControlTransfer+0x1b4>
    26fc:	ebfff809 	bl	728 <puts>
    2700:	e1a00007 	mov	r0, r7
    2704:	e28dd004 	add	sp, sp, #4	; 0x4
    2708:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    270c:	eaffff88 	b	2534 <StallControlPipe>
    2710:	e1a01000 	mov	r1, r0
    2714:	e1a02000 	mov	r2, r0
    2718:	ebfffdc1 	bl	1e24 <USBHwEPRead>
    271c:	e59f2074 	ldr	r2, [pc, #116]	; 2798 <USBHandleControlTransfer+0x1b8>
    2720:	e59f3074 	ldr	r3, [pc, #116]	; 279c <USBHandleControlTransfer+0x1bc>
    2724:	e3500000 	cmp	r0, #0	; 0x0
    2728:	d1a00002 	movle	r0, r2
    272c:	c1a00003 	movgt	r0, r3
    2730:	e28dd004 	add	sp, sp, #4	; 0x4
    2734:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    2738:	eafff7c4 	b	650 <printf>
    273c:	e3500080 	cmp	r0, #128	; 0x80
    2740:	1a000002 	bne	2750 <USBHandleControlTransfer+0x170>
    2744:	e28dd004 	add	sp, sp, #4	; 0x4
    2748:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    274c:	eaffff90 	b	2594 <DataIn>
    2750:	e3a0c0d4 	mov	ip, #212	; 0xd4
    2754:	e59f0044 	ldr	r0, [pc, #68]	; 27a0 <USBHandleControlTransfer+0x1c0>
    2758:	e59f1044 	ldr	r1, [pc, #68]	; 27a4 <USBHandleControlTransfer+0x1c4>
    275c:	e59f2044 	ldr	r2, [pc, #68]	; 27a8 <USBHandleControlTransfer+0x1c8>
    2760:	e59f3044 	ldr	r3, [pc, #68]	; 27ac <USBHandleControlTransfer+0x1cc>
    2764:	e58dc000 	str	ip, [sp]
    2768:	ebfff7b8 	bl	650 <printf>
    276c:	eafffffe 	b	276c <USBHandleControlTransfer+0x18c>
    2770:	e28dd004 	add	sp, sp, #4	; 0x4
    2774:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    2778:	400004c0 	.word	0x400004c0
    277c:	400004b4 	.word	0x400004b4
    2780:	0000379c 	.word	0x0000379c
    2784:	400004a4 	.word	0x400004a4
    2788:	400004c4 	.word	0x400004c4
    278c:	400004bc 	.word	0x400004bc
    2790:	000037a0 	.word	0x000037a0
    2794:	000037b8 	.word	0x000037b8
    2798:	0000351c 	.word	0x0000351c
    279c:	000037d0 	.word	0x000037d0
    27a0:	00003228 	.word	0x00003228
    27a4:	00003250 	.word	0x00003250
    27a8:	00003744 	.word	0x00003744
    27ac:	00003138 	.word	0x00003138

000027b0 <USBRegisterDescriptors>:
    27b0:	e59f3004 	ldr	r3, [pc, #4]	; 27bc <USBRegisterDescriptors+0xc>
    27b4:	e5830000 	str	r0, [r3]
    27b8:	e12fff1e 	bx	lr
    27bc:	400004d0 	.word	0x400004d0

000027c0 <USBRegisterCustomReqHandler>:
    27c0:	e59f3004 	ldr	r3, [pc, #4]	; 27cc <USBRegisterCustomReqHandler+0xc>
    27c4:	e5830000 	str	r0, [r3]
    27c8:	e12fff1e 	bx	lr
    27cc:	400004c8 	.word	0x400004c8

000027d0 <USBGetDescriptor>:
    27d0:	e92d4070 	push	{r4, r5, r6, lr}
    27d4:	e59f10ac 	ldr	r1, [pc, #172]	; 2888 <USBGetDescriptor+0xb8>
    27d8:	e5911000 	ldr	r1, [r1]
    27dc:	e1a00800 	lsl	r0, r0, #16
    27e0:	e3510000 	cmp	r1, #0	; 0x0
    27e4:	e1a0c820 	lsr	ip, r0, #16
    27e8:	e1a05002 	mov	r5, r2
    27ec:	e24dd004 	sub	sp, sp, #4	; 0x4
    27f0:	e1a06003 	mov	r6, r3
    27f4:	11a00c20 	lsrne	r0, r0, #24
    27f8:	120ce0ff 	andne	lr, ip, #255	; 0xff
    27fc:	13a02000 	movne	r2, #0	; 0x0
    2800:	1a000017 	bne	2864 <USBGetDescriptor+0x94>
    2804:	e3a0c06e 	mov	ip, #110	; 0x6e
    2808:	e59f007c 	ldr	r0, [pc, #124]	; 288c <USBGetDescriptor+0xbc>
    280c:	e59f107c 	ldr	r1, [pc, #124]	; 2890 <USBGetDescriptor+0xc0>
    2810:	e59f207c 	ldr	r2, [pc, #124]	; 2894 <USBGetDescriptor+0xc4>
    2814:	e59f307c 	ldr	r3, [pc, #124]	; 2898 <USBGetDescriptor+0xc8>
    2818:	e58dc000 	str	ip, [sp]
    281c:	ebfff78b 	bl	650 <printf>
    2820:	eafffffe 	b	2820 <USBGetDescriptor+0x50>
    2824:	e5d13001 	ldrb	r3, [r1, #1]
    2828:	e1530000 	cmp	r3, r0
    282c:	1a00000b 	bne	2860 <USBGetDescriptor+0x90>
    2830:	e152000e 	cmp	r2, lr
    2834:	1a000008 	bne	285c <USBGetDescriptor+0x8c>
    2838:	e5861000 	str	r1, [r6]
    283c:	e3500002 	cmp	r0, #2	; 0x2
    2840:	05d13002 	ldrbeq	r3, [r1, #2]
    2844:	05d12003 	ldrbeq	r2, [r1, #3]
    2848:	15d13000 	ldrbne	r3, [r1]
    284c:	01833402 	orreq	r3, r3, r2, lsl #8
    2850:	e3a00001 	mov	r0, #1	; 0x1
    2854:	e5853000 	str	r3, [r5]
    2858:	ea000008 	b	2880 <USBGetDescriptor+0xb0>
    285c:	e2822001 	add	r2, r2, #1	; 0x1
    2860:	e0811004 	add	r1, r1, r4
    2864:	e5d14000 	ldrb	r4, [r1]
    2868:	e3540000 	cmp	r4, #0	; 0x0
    286c:	1affffec 	bne	2824 <USBGetDescriptor+0x54>
    2870:	e1a0100c 	mov	r1, ip
    2874:	e59f0020 	ldr	r0, [pc, #32]	; 289c <USBGetDescriptor+0xcc>
    2878:	ebfff774 	bl	650 <printf>
    287c:	e1a00004 	mov	r0, r4
    2880:	e28dd004 	add	sp, sp, #4	; 0x4
    2884:	e8bd8070 	pop	{r4, r5, r6, pc}
    2888:	400004d0 	.word	0x400004d0
    288c:	00003228 	.word	0x00003228
    2890:	000037d4 	.word	0x000037d4
    2894:	000037e8 	.word	0x000037e8
    2898:	00003168 	.word	0x00003168
    289c:	000037f4 	.word	0x000037f4

000028a0 <USBHandleStandardRequest>:
    28a0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    28a4:	e59f32f8 	ldr	r3, [pc, #760]	; 2ba4 <USBHandleStandardRequest+0x304>
    28a8:	e5933000 	ldr	r3, [r3]
    28ac:	e3530000 	cmp	r3, #0	; 0x0
    28b0:	e24dd004 	sub	sp, sp, #4	; 0x4
    28b4:	e1a05000 	mov	r5, r0
    28b8:	e1a06001 	mov	r6, r1
    28bc:	e1a04002 	mov	r4, r2
    28c0:	0a000003 	beq	28d4 <USBHandleStandardRequest+0x34>
    28c4:	e1a0e00f 	mov	lr, pc
    28c8:	e12fff13 	bx	r3
    28cc:	e3500000 	cmp	r0, #0	; 0x0
    28d0:	1a0000a9 	bne	2b7c <USBHandleStandardRequest+0x2dc>
    28d4:	e5d53000 	ldrb	r3, [r5]
    28d8:	e203301f 	and	r3, r3, #31	; 0x1f
    28dc:	e3530001 	cmp	r3, #1	; 0x1
    28e0:	0a000059 	beq	2a4c <USBHandleStandardRequest+0x1ac>
    28e4:	e3530002 	cmp	r3, #2	; 0x2
    28e8:	0a00007b 	beq	2adc <USBHandleStandardRequest+0x23c>
    28ec:	e3530000 	cmp	r3, #0	; 0x0
    28f0:	1a0000a7 	bne	2b94 <USBHandleStandardRequest+0x2f4>
    28f4:	e5d51001 	ldrb	r1, [r5, #1]
    28f8:	e5940000 	ldr	r0, [r4]
    28fc:	e3510009 	cmp	r1, #9	; 0x9
    2900:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    2904:	ea00004e 	b	2a44 <USBHandleStandardRequest+0x1a4>
    2908:	00002a90 	.word	0x00002a90
    290c:	00002b94 	.word	0x00002b94
    2910:	00002a44 	.word	0x00002a44
    2914:	00002b94 	.word	0x00002b94
    2918:	00002a44 	.word	0x00002a44
    291c:	00002930 	.word	0x00002930
    2920:	0000293c 	.word	0x0000293c
    2924:	00002a3c 	.word	0x00002a3c
    2928:	00002964 	.word	0x00002964
    292c:	0000297c 	.word	0x0000297c
    2930:	e5d50002 	ldrb	r0, [r5, #2]
    2934:	ebfffcf4 	bl	1d0c <USBHwSetAddress>
    2938:	ea00008f 	b	2b7c <USBHandleStandardRequest+0x2dc>
    293c:	e1d510b2 	ldrh	r1, [r5, #2]
    2940:	e59f0260 	ldr	r0, [pc, #608]	; 2ba8 <USBHandleStandardRequest+0x308>
    2944:	ebfff741 	bl	650 <printf>
    2948:	e1d510b4 	ldrh	r1, [r5, #4]
    294c:	e1d500b2 	ldrh	r0, [r5, #2]
    2950:	e1a02006 	mov	r2, r6
    2954:	e1a03004 	mov	r3, r4
    2958:	e28dd004 	add	sp, sp, #4	; 0x4
    295c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    2960:	eaffff9a 	b	27d0 <USBGetDescriptor>
    2964:	e59f3240 	ldr	r3, [pc, #576]	; 2bac <USBHandleStandardRequest+0x30c>
    2968:	e5d32000 	ldrb	r2, [r3]
    296c:	e3a03001 	mov	r3, #1	; 0x1
    2970:	e1a01003 	mov	r1, r3
    2974:	e5c02000 	strb	r2, [r0]
    2978:	ea000072 	b	2b48 <USBHandleStandardRequest+0x2a8>
    297c:	e59f322c 	ldr	r3, [pc, #556]	; 2bb0 <USBHandleStandardRequest+0x310>
    2980:	e5933000 	ldr	r3, [r3]
    2984:	e3530000 	cmp	r3, #0	; 0x0
    2988:	e1d520b2 	ldrh	r2, [r5, #2]
    298c:	1a000007 	bne	29b0 <USBHandleStandardRequest+0x110>
    2990:	e3a0c0a5 	mov	ip, #165	; 0xa5
    2994:	e59f0218 	ldr	r0, [pc, #536]	; 2bb4 <USBHandleStandardRequest+0x314>
    2998:	e59f1218 	ldr	r1, [pc, #536]	; 2bb8 <USBHandleStandardRequest+0x318>
    299c:	e59f2218 	ldr	r2, [pc, #536]	; 2bbc <USBHandleStandardRequest+0x31c>
    29a0:	e59f3218 	ldr	r3, [pc, #536]	; 2bc0 <USBHandleStandardRequest+0x320>
    29a4:	e58dc000 	str	ip, [sp]
    29a8:	ebfff728 	bl	650 <printf>
    29ac:	eafffffe 	b	29ac <USBHandleStandardRequest+0x10c>
    29b0:	e21270ff 	ands	r7, r2, #255	; 0xff
    29b4:	13a060ff 	movne	r6, #255	; 0xff
    29b8:	01a00007 	moveq	r0, r7
    29bc:	11a04003 	movne	r4, r3
    29c0:	11a08006 	movne	r8, r6
    29c4:	1a000012 	bne	2a14 <USBHandleStandardRequest+0x174>
    29c8:	ea000015 	b	2a24 <USBHandleStandardRequest+0x184>
    29cc:	e5d43001 	ldrb	r3, [r4, #1]
    29d0:	e3530004 	cmp	r3, #4	; 0x4
    29d4:	05d46003 	ldrbeq	r6, [r4, #3]
    29d8:	0a00000b 	beq	2a0c <USBHandleStandardRequest+0x16c>
    29dc:	e3530005 	cmp	r3, #5	; 0x5
    29e0:	0a000002 	beq	29f0 <USBHandleStandardRequest+0x150>
    29e4:	e3530002 	cmp	r3, #2	; 0x2
    29e8:	05d48005 	ldrbeq	r8, [r4, #5]
    29ec:	ea000006 	b	2a0c <USBHandleStandardRequest+0x16c>
    29f0:	e1580007 	cmp	r8, r7
    29f4:	03560000 	cmpeq	r6, #0	; 0x0
    29f8:	05d43005 	ldrbeq	r3, [r4, #5]
    29fc:	05d41004 	ldrbeq	r1, [r4, #4]
    2a00:	05d40002 	ldrbeq	r0, [r4, #2]
    2a04:	01811403 	orreq	r1, r1, r3, lsl #8
    2a08:	0bfffca9 	bleq	1cb4 <USBHwEPConfig>
    2a0c:	e5d43000 	ldrb	r3, [r4]
    2a10:	e0844003 	add	r4, r4, r3
    2a14:	e5d43000 	ldrb	r3, [r4]
    2a18:	e3530000 	cmp	r3, #0	; 0x0
    2a1c:	1affffea 	bne	29cc <USBHandleStandardRequest+0x12c>
    2a20:	e3a00001 	mov	r0, #1	; 0x1
    2a24:	ebfffd4e 	bl	1f64 <USBHwConfigDevice>
    2a28:	e1d520b2 	ldrh	r2, [r5, #2]
    2a2c:	e59f3178 	ldr	r3, [pc, #376]	; 2bac <USBHandleStandardRequest+0x30c>
    2a30:	e3a01001 	mov	r1, #1	; 0x1
    2a34:	e5c32000 	strb	r2, [r3]
    2a38:	ea000056 	b	2b98 <USBHandleStandardRequest+0x2f8>
    2a3c:	e59f0180 	ldr	r0, [pc, #384]	; 2bc4 <USBHandleStandardRequest+0x324>
    2a40:	ea000052 	b	2b90 <USBHandleStandardRequest+0x2f0>
    2a44:	e59f017c 	ldr	r0, [pc, #380]	; 2bc8 <USBHandleStandardRequest+0x328>
    2a48:	ea000050 	b	2b90 <USBHandleStandardRequest+0x2f0>
    2a4c:	e5d51001 	ldrb	r1, [r5, #1]
    2a50:	e5940000 	ldr	r0, [r4]
    2a54:	e351000b 	cmp	r1, #11	; 0xb
    2a58:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    2a5c:	ea00001c 	b	2ad4 <USBHandleStandardRequest+0x234>
    2a60:	00002a90 	.word	0x00002a90
    2a64:	00002b94 	.word	0x00002b94
    2a68:	00002ad4 	.word	0x00002ad4
    2a6c:	00002b94 	.word	0x00002b94
    2a70:	00002ad4 	.word	0x00002ad4
    2a74:	00002ad4 	.word	0x00002ad4
    2a78:	00002ad4 	.word	0x00002ad4
    2a7c:	00002ad4 	.word	0x00002ad4
    2a80:	00002ad4 	.word	0x00002ad4
    2a84:	00002ad4 	.word	0x00002ad4
    2a88:	00002aa4 	.word	0x00002aa4
    2a8c:	00002abc 	.word	0x00002abc
    2a90:	e3a03000 	mov	r3, #0	; 0x0
    2a94:	e3a01001 	mov	r1, #1	; 0x1
    2a98:	e5c03001 	strb	r3, [r0, #1]
    2a9c:	e5c03000 	strb	r3, [r0]
    2aa0:	ea000027 	b	2b44 <USBHandleStandardRequest+0x2a4>
    2aa4:	e3a02001 	mov	r2, #1	; 0x1
    2aa8:	e3a03000 	mov	r3, #0	; 0x0
    2aac:	e1a01002 	mov	r1, r2
    2ab0:	e5c03000 	strb	r3, [r0]
    2ab4:	e5862000 	str	r2, [r6]
    2ab8:	ea000036 	b	2b98 <USBHandleStandardRequest+0x2f8>
    2abc:	e1d500b2 	ldrh	r0, [r5, #2]
    2ac0:	e3500000 	cmp	r0, #0	; 0x0
    2ac4:	03a01001 	moveq	r1, #1	; 0x1
    2ac8:	05860000 	streq	r0, [r6]
    2acc:	0a000031 	beq	2b98 <USBHandleStandardRequest+0x2f8>
    2ad0:	ea00002f 	b	2b94 <USBHandleStandardRequest+0x2f4>
    2ad4:	e59f00f0 	ldr	r0, [pc, #240]	; 2bcc <USBHandleStandardRequest+0x32c>
    2ad8:	ea00002c 	b	2b90 <USBHandleStandardRequest+0x2f0>
    2adc:	e5d51001 	ldrb	r1, [r5, #1]
    2ae0:	e5944000 	ldr	r4, [r4]
    2ae4:	e351000c 	cmp	r1, #12	; 0xc
    2ae8:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    2aec:	ea000026 	b	2b8c <USBHandleStandardRequest+0x2ec>
    2af0:	00002b24 	.word	0x00002b24
    2af4:	00002b50 	.word	0x00002b50
    2af8:	00002b8c 	.word	0x00002b8c
    2afc:	00002b64 	.word	0x00002b64
    2b00:	00002b8c 	.word	0x00002b8c
    2b04:	00002b8c 	.word	0x00002b8c
    2b08:	00002b8c 	.word	0x00002b8c
    2b0c:	00002b8c 	.word	0x00002b8c
    2b10:	00002b8c 	.word	0x00002b8c
    2b14:	00002b8c 	.word	0x00002b8c
    2b18:	00002b8c 	.word	0x00002b8c
    2b1c:	00002b8c 	.word	0x00002b8c
    2b20:	00002b84 	.word	0x00002b84
    2b24:	e5d50004 	ldrb	r0, [r5, #4]
    2b28:	ebfffc8a 	bl	1d58 <USBHwEPGetStatus>
    2b2c:	e1a000a0 	lsr	r0, r0, #1
    2b30:	e2000001 	and	r0, r0, #1	; 0x1
    2b34:	e3a03000 	mov	r3, #0	; 0x0
    2b38:	e5c43001 	strb	r3, [r4, #1]
    2b3c:	e5c40000 	strb	r0, [r4]
    2b40:	e3a01001 	mov	r1, #1	; 0x1
    2b44:	e2833002 	add	r3, r3, #2	; 0x2
    2b48:	e5863000 	str	r3, [r6]
    2b4c:	ea000011 	b	2b98 <USBHandleStandardRequest+0x2f8>
    2b50:	e1d510b2 	ldrh	r1, [r5, #2]
    2b54:	e3510000 	cmp	r1, #0	; 0x0
    2b58:	05d50004 	ldrbeq	r0, [r5, #4]
    2b5c:	0a000005 	beq	2b78 <USBHandleStandardRequest+0x2d8>
    2b60:	ea00000b 	b	2b94 <USBHandleStandardRequest+0x2f4>
    2b64:	e1d530b2 	ldrh	r3, [r5, #2]
    2b68:	e3530000 	cmp	r3, #0	; 0x0
    2b6c:	1a000008 	bne	2b94 <USBHandleStandardRequest+0x2f4>
    2b70:	e5d50004 	ldrb	r0, [r5, #4]
    2b74:	e3a01001 	mov	r1, #1	; 0x1
    2b78:	ebfffc7e 	bl	1d78 <USBHwEPStall>
    2b7c:	e3a01001 	mov	r1, #1	; 0x1
    2b80:	ea000004 	b	2b98 <USBHandleStandardRequest+0x2f8>
    2b84:	e59f0044 	ldr	r0, [pc, #68]	; 2bd0 <USBHandleStandardRequest+0x330>
    2b88:	ea000000 	b	2b90 <USBHandleStandardRequest+0x2f0>
    2b8c:	e59f0040 	ldr	r0, [pc, #64]	; 2bd4 <USBHandleStandardRequest+0x334>
    2b90:	ebfff6ae 	bl	650 <printf>
    2b94:	e3a01000 	mov	r1, #0	; 0x0
    2b98:	e1a00001 	mov	r0, r1
    2b9c:	e28dd004 	add	sp, sp, #4	; 0x4
    2ba0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    2ba4:	400004c8 	.word	0x400004c8
    2ba8:	00003808 	.word	0x00003808
    2bac:	400004cc 	.word	0x400004cc
    2bb0:	400004d0 	.word	0x400004d0
    2bb4:	00003228 	.word	0x00003228
    2bb8:	000037d4 	.word	0x000037d4
    2bbc:	000037e8 	.word	0x000037e8
    2bc0:	00003154 	.word	0x00003154
    2bc4:	0000380c 	.word	0x0000380c
    2bc8:	0000382c 	.word	0x0000382c
    2bcc:	00003844 	.word	0x00003844
    2bd0:	00003860 	.word	0x00003860
    2bd4:	0000387c 	.word	0x0000387c

00002bd8 <USBInit>:
    2bd8:	e92d4010 	push	{r4, lr}
    2bdc:	e59f4050 	ldr	r4, [pc, #80]	; 2c34 <USBInit+0x5c>
    2be0:	ebfffd3b 	bl	20d4 <USBHwInit>
    2be4:	e59f004c 	ldr	r0, [pc, #76]	; 2c38 <USBInit+0x60>
    2be8:	ebfffde9 	bl	2394 <USBHwRegisterDevIntHandler>
    2bec:	e1a01004 	mov	r1, r4
    2bf0:	e3a00000 	mov	r0, #0	; 0x0
    2bf4:	ebfffdf1 	bl	23c0 <USBHwRegisterEPIntHandler>
    2bf8:	e1a01004 	mov	r1, r4
    2bfc:	e3a00080 	mov	r0, #128	; 0x80
    2c00:	ebfffdee 	bl	23c0 <USBHwRegisterEPIntHandler>
    2c04:	e3a00000 	mov	r0, #0	; 0x0
    2c08:	e3a01040 	mov	r1, #64	; 0x40
    2c0c:	ebfffc28 	bl	1cb4 <USBHwEPConfig>
    2c10:	e3a00080 	mov	r0, #128	; 0x80
    2c14:	e3a01040 	mov	r1, #64	; 0x40
    2c18:	ebfffc25 	bl	1cb4 <USBHwEPConfig>
    2c1c:	e3a00000 	mov	r0, #0	; 0x0
    2c20:	e59f1014 	ldr	r1, [pc, #20]	; 2c3c <USBInit+0x64>
    2c24:	e59f2014 	ldr	r2, [pc, #20]	; 2c40 <USBInit+0x68>
    2c28:	ebfffe0c 	bl	2460 <USBRegisterRequestHandler>
    2c2c:	e3a00001 	mov	r0, #1	; 0x1
    2c30:	e8bd8010 	pop	{r4, pc}
    2c34:	000025e0 	.word	0x000025e0
    2c38:	00002c44 	.word	0x00002c44
    2c3c:	000028a0 	.word	0x000028a0
    2c40:	400004d4 	.word	0x400004d4

00002c44 <HandleUsbReset>:
    2c44:	e3100010 	tst	r0, #16	; 0x10
    2c48:	012fff1e 	bxeq	lr
    2c4c:	e59f0000 	ldr	r0, [pc, #0]	; 2c54 <HandleUsbReset+0x10>
    2c50:	eafff67e 	b	650 <printf>
    2c54:	00003890 	.word	0x00003890

00002c58 <__aeabi_uidiv>:
    2c58:	e2512001 	subs	r2, r1, #1	; 0x1
    2c5c:	012fff1e 	bxeq	lr
    2c60:	3a000036 	bcc	2d40 <__aeabi_uidiv+0xe8>
    2c64:	e1500001 	cmp	r0, r1
    2c68:	9a000022 	bls	2cf8 <__aeabi_uidiv+0xa0>
    2c6c:	e1110002 	tst	r1, r2
    2c70:	0a000023 	beq	2d04 <__aeabi_uidiv+0xac>
    2c74:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    2c78:	01a01181 	lsleq	r1, r1, #3
    2c7c:	03a03008 	moveq	r3, #8	; 0x8
    2c80:	13a03001 	movne	r3, #1	; 0x1
    2c84:	e3510201 	cmp	r1, #268435456	; 0x10000000
    2c88:	31510000 	cmpcc	r1, r0
    2c8c:	31a01201 	lslcc	r1, r1, #4
    2c90:	31a03203 	lslcc	r3, r3, #4
    2c94:	3afffffa 	bcc	2c84 <__aeabi_uidiv+0x2c>
    2c98:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    2c9c:	31510000 	cmpcc	r1, r0
    2ca0:	31a01081 	lslcc	r1, r1, #1
    2ca4:	31a03083 	lslcc	r3, r3, #1
    2ca8:	3afffffa 	bcc	2c98 <__aeabi_uidiv+0x40>
    2cac:	e3a02000 	mov	r2, #0	; 0x0
    2cb0:	e1500001 	cmp	r0, r1
    2cb4:	20400001 	subcs	r0, r0, r1
    2cb8:	21822003 	orrcs	r2, r2, r3
    2cbc:	e15000a1 	cmp	r0, r1, lsr #1
    2cc0:	204000a1 	subcs	r0, r0, r1, lsr #1
    2cc4:	218220a3 	orrcs	r2, r2, r3, lsr #1
    2cc8:	e1500121 	cmp	r0, r1, lsr #2
    2ccc:	20400121 	subcs	r0, r0, r1, lsr #2
    2cd0:	21822123 	orrcs	r2, r2, r3, lsr #2
    2cd4:	e15001a1 	cmp	r0, r1, lsr #3
    2cd8:	204001a1 	subcs	r0, r0, r1, lsr #3
    2cdc:	218221a3 	orrcs	r2, r2, r3, lsr #3
    2ce0:	e3500000 	cmp	r0, #0	; 0x0
    2ce4:	11b03223 	lsrsne	r3, r3, #4
    2ce8:	11a01221 	lsrne	r1, r1, #4
    2cec:	1affffef 	bne	2cb0 <__aeabi_uidiv+0x58>
    2cf0:	e1a00002 	mov	r0, r2
    2cf4:	e12fff1e 	bx	lr
    2cf8:	03a00001 	moveq	r0, #1	; 0x1
    2cfc:	13a00000 	movne	r0, #0	; 0x0
    2d00:	e12fff1e 	bx	lr
    2d04:	e3510801 	cmp	r1, #65536	; 0x10000
    2d08:	21a01821 	lsrcs	r1, r1, #16
    2d0c:	23a02010 	movcs	r2, #16	; 0x10
    2d10:	33a02000 	movcc	r2, #0	; 0x0
    2d14:	e3510c01 	cmp	r1, #256	; 0x100
    2d18:	21a01421 	lsrcs	r1, r1, #8
    2d1c:	22822008 	addcs	r2, r2, #8	; 0x8
    2d20:	e3510010 	cmp	r1, #16	; 0x10
    2d24:	21a01221 	lsrcs	r1, r1, #4
    2d28:	22822004 	addcs	r2, r2, #4	; 0x4
    2d2c:	e3510004 	cmp	r1, #4	; 0x4
    2d30:	82822003 	addhi	r2, r2, #3	; 0x3
    2d34:	908220a1 	addls	r2, r2, r1, lsr #1
    2d38:	e1a00230 	lsr	r0, r0, r2
    2d3c:	e12fff1e 	bx	lr
    2d40:	e52de008 	str	lr, [sp, #-8]!
    2d44:	eb00008a 	bl	2f74 <__aeabi_idiv0>
    2d48:	e3a00000 	mov	r0, #0	; 0x0
    2d4c:	e49df008 	ldr	pc, [sp], #8

00002d50 <__aeabi_uidivmod>:
    2d50:	e92d4003 	push	{r0, r1, lr}
    2d54:	ebffffbf 	bl	2c58 <__aeabi_uidiv>
    2d58:	e8bd4006 	pop	{r1, r2, lr}
    2d5c:	e0030092 	mul	r3, r2, r0
    2d60:	e0411003 	sub	r1, r1, r3
    2d64:	e12fff1e 	bx	lr

00002d68 <__aeabi_idiv>:
    2d68:	e3510000 	cmp	r1, #0	; 0x0
    2d6c:	e020c001 	eor	ip, r0, r1
    2d70:	0a000042 	beq	2e80 <__aeabi_idiv+0x118>
    2d74:	42611000 	rsbmi	r1, r1, #0	; 0x0
    2d78:	e2512001 	subs	r2, r1, #1	; 0x1
    2d7c:	0a000027 	beq	2e20 <__aeabi_idiv+0xb8>
    2d80:	e1b03000 	movs	r3, r0
    2d84:	42603000 	rsbmi	r3, r0, #0	; 0x0
    2d88:	e1530001 	cmp	r3, r1
    2d8c:	9a000026 	bls	2e2c <__aeabi_idiv+0xc4>
    2d90:	e1110002 	tst	r1, r2
    2d94:	0a000028 	beq	2e3c <__aeabi_idiv+0xd4>
    2d98:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    2d9c:	01a01181 	lsleq	r1, r1, #3
    2da0:	03a02008 	moveq	r2, #8	; 0x8
    2da4:	13a02001 	movne	r2, #1	; 0x1
    2da8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    2dac:	31510003 	cmpcc	r1, r3
    2db0:	31a01201 	lslcc	r1, r1, #4
    2db4:	31a02202 	lslcc	r2, r2, #4
    2db8:	3afffffa 	bcc	2da8 <__aeabi_idiv+0x40>
    2dbc:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    2dc0:	31510003 	cmpcc	r1, r3
    2dc4:	31a01081 	lslcc	r1, r1, #1
    2dc8:	31a02082 	lslcc	r2, r2, #1
    2dcc:	3afffffa 	bcc	2dbc <__aeabi_idiv+0x54>
    2dd0:	e3a00000 	mov	r0, #0	; 0x0
    2dd4:	e1530001 	cmp	r3, r1
    2dd8:	20433001 	subcs	r3, r3, r1
    2ddc:	21800002 	orrcs	r0, r0, r2
    2de0:	e15300a1 	cmp	r3, r1, lsr #1
    2de4:	204330a1 	subcs	r3, r3, r1, lsr #1
    2de8:	218000a2 	orrcs	r0, r0, r2, lsr #1
    2dec:	e1530121 	cmp	r3, r1, lsr #2
    2df0:	20433121 	subcs	r3, r3, r1, lsr #2
    2df4:	21800122 	orrcs	r0, r0, r2, lsr #2
    2df8:	e15301a1 	cmp	r3, r1, lsr #3
    2dfc:	204331a1 	subcs	r3, r3, r1, lsr #3
    2e00:	218001a2 	orrcs	r0, r0, r2, lsr #3
    2e04:	e3530000 	cmp	r3, #0	; 0x0
    2e08:	11b02222 	lsrsne	r2, r2, #4
    2e0c:	11a01221 	lsrne	r1, r1, #4
    2e10:	1affffef 	bne	2dd4 <__aeabi_idiv+0x6c>
    2e14:	e35c0000 	cmp	ip, #0	; 0x0
    2e18:	42600000 	rsbmi	r0, r0, #0	; 0x0
    2e1c:	e12fff1e 	bx	lr
    2e20:	e13c0000 	teq	ip, r0
    2e24:	42600000 	rsbmi	r0, r0, #0	; 0x0
    2e28:	e12fff1e 	bx	lr
    2e2c:	33a00000 	movcc	r0, #0	; 0x0
    2e30:	01a00fcc 	asreq	r0, ip, #31
    2e34:	03800001 	orreq	r0, r0, #1	; 0x1
    2e38:	e12fff1e 	bx	lr
    2e3c:	e3510801 	cmp	r1, #65536	; 0x10000
    2e40:	21a01821 	lsrcs	r1, r1, #16
    2e44:	23a02010 	movcs	r2, #16	; 0x10
    2e48:	33a02000 	movcc	r2, #0	; 0x0
    2e4c:	e3510c01 	cmp	r1, #256	; 0x100
    2e50:	21a01421 	lsrcs	r1, r1, #8
    2e54:	22822008 	addcs	r2, r2, #8	; 0x8
    2e58:	e3510010 	cmp	r1, #16	; 0x10
    2e5c:	21a01221 	lsrcs	r1, r1, #4
    2e60:	22822004 	addcs	r2, r2, #4	; 0x4
    2e64:	e3510004 	cmp	r1, #4	; 0x4
    2e68:	82822003 	addhi	r2, r2, #3	; 0x3
    2e6c:	908220a1 	addls	r2, r2, r1, lsr #1
    2e70:	e35c0000 	cmp	ip, #0	; 0x0
    2e74:	e1a00233 	lsr	r0, r3, r2
    2e78:	42600000 	rsbmi	r0, r0, #0	; 0x0
    2e7c:	e12fff1e 	bx	lr
    2e80:	e52de008 	str	lr, [sp, #-8]!
    2e84:	eb00003a 	bl	2f74 <__aeabi_idiv0>
    2e88:	e3a00000 	mov	r0, #0	; 0x0
    2e8c:	e49df008 	ldr	pc, [sp], #8

00002e90 <__aeabi_idivmod>:
    2e90:	e92d4003 	push	{r0, r1, lr}
    2e94:	ebffffb3 	bl	2d68 <__aeabi_idiv>
    2e98:	e8bd4006 	pop	{r1, r2, lr}
    2e9c:	e0030092 	mul	r3, r2, r0
    2ea0:	e0411003 	sub	r1, r1, r3
    2ea4:	e12fff1e 	bx	lr

00002ea8 <__umodsi3>:
    2ea8:	e2512001 	subs	r2, r1, #1	; 0x1
    2eac:	3a00002c 	bcc	2f64 <__umodsi3+0xbc>
    2eb0:	11500001 	cmpne	r0, r1
    2eb4:	03a00000 	moveq	r0, #0	; 0x0
    2eb8:	81110002 	tsthi	r1, r2
    2ebc:	00000002 	andeq	r0, r0, r2
    2ec0:	912fff1e 	bxls	lr
    2ec4:	e3a02000 	mov	r2, #0	; 0x0
    2ec8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    2ecc:	31510000 	cmpcc	r1, r0
    2ed0:	31a01201 	lslcc	r1, r1, #4
    2ed4:	32822004 	addcc	r2, r2, #4	; 0x4
    2ed8:	3afffffa 	bcc	2ec8 <__umodsi3+0x20>
    2edc:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    2ee0:	31510000 	cmpcc	r1, r0
    2ee4:	31a01081 	lslcc	r1, r1, #1
    2ee8:	32822001 	addcc	r2, r2, #1	; 0x1
    2eec:	3afffffa 	bcc	2edc <__umodsi3+0x34>
    2ef0:	e2522003 	subs	r2, r2, #3	; 0x3
    2ef4:	ba00000e 	blt	2f34 <__umodsi3+0x8c>
    2ef8:	e1500001 	cmp	r0, r1
    2efc:	20400001 	subcs	r0, r0, r1
    2f00:	e15000a1 	cmp	r0, r1, lsr #1
    2f04:	204000a1 	subcs	r0, r0, r1, lsr #1
    2f08:	e1500121 	cmp	r0, r1, lsr #2
    2f0c:	20400121 	subcs	r0, r0, r1, lsr #2
    2f10:	e15001a1 	cmp	r0, r1, lsr #3
    2f14:	204001a1 	subcs	r0, r0, r1, lsr #3
    2f18:	e3500001 	cmp	r0, #1	; 0x1
    2f1c:	e1a01221 	lsr	r1, r1, #4
    2f20:	a2522004 	subsge	r2, r2, #4	; 0x4
    2f24:	aafffff3 	bge	2ef8 <__umodsi3+0x50>
    2f28:	e3120003 	tst	r2, #3	; 0x3
    2f2c:	13300000 	teqne	r0, #0	; 0x0
    2f30:	0a00000a 	beq	2f60 <__umodsi3+0xb8>
    2f34:	e3720002 	cmn	r2, #2	; 0x2
    2f38:	ba000006 	blt	2f58 <__umodsi3+0xb0>
    2f3c:	0a000002 	beq	2f4c <__umodsi3+0xa4>
    2f40:	e1500001 	cmp	r0, r1
    2f44:	20400001 	subcs	r0, r0, r1
    2f48:	e1a010a1 	lsr	r1, r1, #1
    2f4c:	e1500001 	cmp	r0, r1
    2f50:	20400001 	subcs	r0, r0, r1
    2f54:	e1a010a1 	lsr	r1, r1, #1
    2f58:	e1500001 	cmp	r0, r1
    2f5c:	20400001 	subcs	r0, r0, r1
    2f60:	e12fff1e 	bx	lr
    2f64:	e52de008 	str	lr, [sp, #-8]!
    2f68:	eb000001 	bl	2f74 <__aeabi_idiv0>
    2f6c:	e3a00000 	mov	r0, #0	; 0x0
    2f70:	e49df008 	ldr	pc, [sp], #8

00002f74 <__aeabi_idiv0>:
    2f74:	e12fff1e 	bx	lr

00002f78 <memcpy>:
    2f78:	e352000f 	cmp	r2, #15	; 0xf
    2f7c:	e92d4010 	push	{r4, lr}
    2f80:	e1a0c000 	mov	ip, r0
    2f84:	e1a04002 	mov	r4, r2
    2f88:	e1a0e002 	mov	lr, r2
    2f8c:	9a000002 	bls	2f9c <memcpy+0x24>
    2f90:	e1813000 	orr	r3, r1, r0
    2f94:	e3130003 	tst	r3, #3	; 0x3
    2f98:	0a000008 	beq	2fc0 <memcpy+0x48>
    2f9c:	e35e0000 	cmp	lr, #0	; 0x0
    2fa0:	08bd8010 	popeq	{r4, pc}
    2fa4:	e3a02000 	mov	r2, #0	; 0x0
    2fa8:	e4d13001 	ldrb	r3, [r1], #1
    2fac:	e7c2300c 	strb	r3, [r2, ip]
    2fb0:	e2822001 	add	r2, r2, #1	; 0x1
    2fb4:	e152000e 	cmp	r2, lr
    2fb8:	1afffffa 	bne	2fa8 <memcpy+0x30>
    2fbc:	e8bd8010 	pop	{r4, pc}
    2fc0:	e5913000 	ldr	r3, [r1]
    2fc4:	e58c3000 	str	r3, [ip]
    2fc8:	e5912004 	ldr	r2, [r1, #4]
    2fcc:	e58c2004 	str	r2, [ip, #4]
    2fd0:	e5913008 	ldr	r3, [r1, #8]
    2fd4:	e58c3008 	str	r3, [ip, #8]
    2fd8:	e244e010 	sub	lr, r4, #16	; 0x10
    2fdc:	e591300c 	ldr	r3, [r1, #12]
    2fe0:	e35e000f 	cmp	lr, #15	; 0xf
    2fe4:	e58c300c 	str	r3, [ip, #12]
    2fe8:	e2811010 	add	r1, r1, #16	; 0x10
    2fec:	e28cc010 	add	ip, ip, #16	; 0x10
    2ff0:	e1a0400e 	mov	r4, lr
    2ff4:	8afffff1 	bhi	2fc0 <memcpy+0x48>
    2ff8:	e35e0003 	cmp	lr, #3	; 0x3
    2ffc:	9affffe6 	bls	2f9c <memcpy+0x24>
    3000:	e24ee004 	sub	lr, lr, #4	; 0x4
    3004:	e4913004 	ldr	r3, [r1], #4
    3008:	e35e0003 	cmp	lr, #3	; 0x3
    300c:	e48c3004 	str	r3, [ip], #4
    3010:	8afffffa 	bhi	3000 <memcpy+0x88>
    3014:	e35e0000 	cmp	lr, #0	; 0x0
    3018:	1affffe1 	bne	2fa4 <memcpy+0x2c>
    301c:	e8bd8010 	pop	{r4, pc}

00003020 <abDescriptors>:
    3020:	02000112 40000000 0003ffff 02010100     .......@........
    3030:	02090103 01010020 0932c000 02000004     .... .....2.....
    3040:	00500608 02850507 07000040 40020205     ..P.....@......@
    3050:	03040000 030e0409 0050004c 00550043     ........L.P.C.U.
    3060:	00420053 00500312 006f0072 00750064     S.B...P.r.o.d.u.
    3070:	00740063 031a0058 00450044 00440041     c.t.X...D.E.A.D.
    3080:	00300043 00450044 00410043 00450046     C.0.D.E.C.A.F.E.
    3090:	00000000                                ....

00003094 <__FUNCTION__.2081>:
    3094:	4243534d 7542746f 6e496b6c 00000000     MSCBotBulkIn....

000030a4 <__FUNCTION__.2040>:
    30a4:	4243534d 7542746f 754f6b6c 00000074     MSCBotBulkOut...

000030b4 <abSense>:
    30b4:	00ff0070 0a000000 00000000 0000ffff     p...............
	...

000030c6 <abInquiry>:
    30c6:	02058000 0000001f 5543504c 20204253     ........LPCUSB  
    30d6:	7373614d 6f747320 65676172 20202020     Mass storage    
    30e6:	20312e30                                0.1 

000030ea <aiCDBLen.1851>:
    30ea:	000a0a06 00000c10 44530000                       ..........

000030f4 <__FUNCTION__.1529>:
    30f4:	78454453 52617274 00707365              SDExtraResp.

00003100 <__FUNCTION__.1675>:
    3100:	48425355 67655277 65747369 49504572     USBHwRegisterEPI
    3110:	6148746e 656c646e 00000072              ntHandler...

0000311c <__FUNCTION__.1666>:
    311c:	52425355 73696765 52726574 65757165     USBRegisterReque
    312c:	61487473 656c646e 00000072              stHandler...

00003138 <__FUNCTION__.1628>:
    3138:	48425355 6c646e61 6e6f4365 6c6f7274     USBHandleControl
    3148:	6e617254 72656673 00000000              Transfer....

00003154 <__FUNCTION__.1642>:
    3154:	53425355 6f437465 6769666e 74617275     USBSetConfigurat
    3164:	006e6f69                                ion.

00003168 <__FUNCTION__.1609>:
    3168:	47425355 65447465 69726373 726f7470     USBGetDescriptor
    3178:	00000000 6c756e28 0000296c 74696e49     ....(null)..Init
    3188:	696c6169 676e6973 42535520 61747320     ialising USB sta
    3198:	00006b63 72617453 676e6974 42535520     ck..Starting USB
    31a8:	6d6f6320 696e756d 69746163 00006e6f      communication..
    31b8:	61766e49 2064696c 20786469 000a5825     Invalid idx %X..
    31c8:	61766e49 2064696c 206c6176 000a5825     Invalid val %X..
    31d8:	61686e55 656c646e 6c632064 00737361     Unhandled class.
    31e8:	3a575343 61747320 3d737574 202c7825     CSW: status=%x, 
    31f8:	69736572 3d657564 000a6425 6c617473     residue=%d..stal
    3208:	676e696c 4e494420 00000000 61766e49     ling DIN....Inva
    3218:	2064696c 74617473 64252065 0000000a     lid state %d....
    3228:	7373410a 69747265 27206e6f 20277325     .Assertion '%s' 
    3238:	6c696166 69206465 7325206e 2373253a     failed in %s:%s#
    3248:	0a216425 00000000 534c4146 00000045     %d!.....FALSE...
    3258:	5f63736d 2e746f62 00000063 61766e49     msc_bot.c...Inva
    3268:	2064696c 676e656c 28206874 0a296425     lid length (%d).
    3278:	00000000 61766e49 2064696c 6e676973     ....Invalid sign
    3288:	72757461 78252065 0000000a 61766e49     ature %x....Inva
    3298:	2064696c 204e554c 000a6425 61766e49     lid LUN %d..Inva
    32a8:	2064696c 6c204243 25206e65 00000a64     lid CB len %d...
    32b8:	74736f48 646e6120 76656420 20656369     Host and device 
    32c8:	61736964 65657267 206e6f20 65726964     disagree on dire
    32d8:	6f697463 0000006e 6167654e 65766974     ction...Negative
    32e8:	73657220 65756469 00000000 6c617473      residue....stal
    32f8:	676e696c 554f4420 00000054 73616850     ling DOUT...Phas
    3308:	72652065 20726f72 73206e69 65746174     e error in state
    3318:	2c642520 20642520 65747962 00000a73      %d, %d bytes...
    3328:	3a574243 6e656c20 2c64253d 616c6620     CBW: len=%d, fla
    3338:	253d7367 63202c78 253d646d 63202c78     gs=%x, cmd=%x, c
    3348:	656c646d 64253d6e 0000000a 20544f42     mdlen=%d....BOT 
    3358:	65736572 6e692074 61747320 25206574     reset in state %
    3368:	00000a64 54494e55 544f4e20 41455220     d...UNIT NOT REA
    3378:	00215944 636f6c42 7665446b 64616552     DY!.BlockDevRead
    3388:	69616620 0064656c 636f6c42 7665446b      failed.BlockDev
    3398:	74697257 61662065 64656c69 00000000     Write failed....
    33a8:	61766e49 2064696c 20424443 206e656c     Invalid CDB len 
    33b8:	70786528 65746365 64252064 000a2129     (expected %d)!..
    33c8:	54534554 494e5520 45522054 00594441     TEST UNIT READY.
    33d8:	55514552 20545345 534e4553 25282045     REQUEST SENSE (%
    33e8:	29583630 0000000a 4d524f46 55205441     06X)....FORMAT U
    33f8:	2054494e 58323025 0000000a 55514e49     NIT %02X....INQU
    3408:	00595249 44414552 50414320 54494341     IRY.READ CAPACIT
    3418:	00000059 44414552 202c3031 3d41424c     Y...READ10, LBA=
    3428:	202c6425 3d6e656c 000a6425 54495257     %d, len=%d..WRIT
    3438:	2c303145 41424c20 2c64253d 6e656c20     E10, LBA=%d, len
    3448:	0a64253d 00000000 49524556 30315946     =%d.....VERIFY10
    3458:	424c202c 64253d41 656c202c 64253d6e     , LBA=%d, len=%d
    3468:	0000000a 43545942 6e204b48 7320746f     ....BYTCHK not s
    3478:	6f707075 64657472 00000000 61686e55     upported....Unha
    3488:	656c646e 43532064 203a4953 00000000     ndled SCSI: ....
    3498:	32302520 00000058 61766e49 2064696c      %02X...Invalid 
    34a8:	20445343 75727473 72757463 25282065     CSD structure (%
    34b8:	0a212964 00000000 6e654c69 203d3c20     d)!.....iLen <= 
    34c8:	00000034 61636473 632e6472 00000000     4...sdcard.c....
    34d8:	65707845 64657463 61747320 62207472     Expected start b
    34e8:	6b636f6c 6b6f7420 202c6e65 20746f67     lock token, got 
    34f8:	69205825 6574736e 0a216461 00000000     %X instead!.....
    3508:	64726143 73756220 30282079 32302578     Card busy (0x%02
    3518:	0a212958 00000000 5f444d43 44414552     X)!.....CMD_READ
    3528:	52434f5f 69616620 2064656c 25783028     _OCR failed (0x%
    3538:	29583230 00000a21 5f444d43 444e4553     02X)!...CMD_SEND
    3548:	4449435f 69616620 2064656c 25783028     _CID failed (0x%
    3558:	29583230 00000a21 65524453 61446461     02X)!...SDReadDa
    3568:	6f546174 206e656b 6c696166 00216465     taToken failed!.
    3578:	5f444d43 444e4553 4453435f 69616620     CMD_SEND_CSD fai
    3588:	2064656c 25783028 29583230 00000a21     led (0x%02X)!...
    3598:	5f444d43 54495257 4c425f45 204b434f     CMD_WRITE_BLOCK 
    35a8:	6c696166 28206465 30257830 21295832     failed (0x%02X)!
    35b8:	0000000a 65636552 64657669 74616420     ....Received dat
    35c8:	65722061 6e6f7073 65206573 726f7272     a response error
    35d8:	78302820 58323025 000a2129 72574453      (0x%02X)!..SDWr
    35e8:	44657469 54617461 6e656b6f 69616620     iteDataToken fai
    35f8:	2164656c 00000000 5f444d43 444e4553     led!....CMD_SEND
    3608:	5f504f5f 444e4f43 69616620 0064656c     _OP_COND failed.
    3618:	5f444d43 495f4f47 5f454c44 54415453     CMD_GO_IDLE_STAT
    3628:	61662045 64656c69 78302820 58323025     E failed (0x%02X
    3638:	000a2129 38444d43 74616420 78302061     )!..CMD8 data 0x
    3648:	58383025 0000000a 65534453 704f646e     %08X....SDSendOp
    3658:	646e6f43 69616620 2164656c 00000000     Cond failed!....
    3668:	64616552 2052434f 6c696166 00216465     ReadOCR failed!.
    3678:	5f444d43 44414552 4e49535f 5f454c47     CMD_READ_SINGLE_
    3688:	434f4c42 6166204b 64656c69 78302820     BLOCK failed (0x
    3698:	58323025 000a2129 666e6f43 72756769     %02X)!..Configur
    36a8:	53206465 20304950 20726f66 6b206425     ed SPI0 for %d k
    36b8:	000a7a48 69676552 72657473 68206465     Hz..Registered h
    36c8:	6c646e61 66207265 6620726f 656d6172     andler for frame
    36d8:	00000000 69676552 72657473 68206465     ....Registered h
    36e8:	6c646e61 66207265 6420726f 63697665     andler for devic
    36f8:	74732065 73757461 00000000 3c786469     e status....idx<
    3708:	00003233 68627375 706c5f77 00632e63     32..usbhw_lpc.c.
    3718:	69676552 72657473 68206465 6c646e61     Registered handl
    3728:	66207265 4520726f 78302050 000a7825     er for EP 0x%x..
    3738:	70795469 3d3e2065 00003020 63627375     iType >= 0..usbc
    3748:	72746e6f 632e6c6f 00000000 70795469     ontrol.c....iTyp
    3758:	203c2065 00000034 68206f4e 6c646e61     e < 4...No handl
    3768:	66207265 7220726f 79747165 25206570     er for reqtype %
    3778:	00000a64 4c415453 6e6f204c 00005b20     d...STALL on [..
    3788:	32302520 00000078 7473205d 253d7461      %02x...] stat=%
    3798:	00000a78 00782553 6e61485f 52656c64     x...S%x._HandleR
    37a8:	65757165 20317473 6c696166 00006465     equest1 failed..
    37b8:	6e61485f 52656c64 65757165 20327473     _HandleRequest2 
    37c8:	6c696166 00006465 0000003f 44626170     failed..?...pabD
    37d8:	72637365 21207069 554e203d 00004c4c     escrip != NULL..
    37e8:	73627375 65726474 00632e71 63736544     usbstdreq.c.Desc
    37f8:	20782520 20746f6e 6e756f66 000a2164      %x not found!..
    3808:	00782544 69766544 72206563 25207165     D%x.Device req %
    3818:	6f6e2064 6d692074 6d656c70 65746e65     d not implemente
    3828:	00000a64 656c6c49 206c6167 69766564     d...Illegal devi
    3838:	72206563 25207165 00000a64 656c6c49     ce req %d...Ille
    3848:	206c6167 65746e69 63616672 65722065     gal interface re
    3858:	64252071 0000000a 72205045 25207165     q %d....EP req %
    3868:	6f6e2064 6d692074 6d656c70 65746e65     d not implemente
    3878:	00000a64 656c6c49 206c6167 72205045     d...Illegal EP r
    3888:	25207165 00000a64 0000210a              eq %d....!..
