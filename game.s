	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initializePaddle
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializePaddle, %function
initializePaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #150
	mov	r5, #5
	mov	r4, #40
	mov	lr, #31744
	mov	r2, #105
	mov	ip, #0
	mov	r0, #20
	ldr	r3, .L4
	str	r5, [r3, #24]
	str	r4, [r3, #20]
	strh	lr, [r3, #28]	@ movhi
	str	r1, [r3]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	str	r0, [r3, #32]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	paddle
	.size	initializePaddle, .-initializePaddle
	.align	2
	.global	drawPaddle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaddle, %function
drawPaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L8
	ldr	ip, .L8+4
	sub	sp, sp, #12
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	str	ip, [sp]
	ldr	r5, .L8+8
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #4]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	paddle
	.word	32767
	.word	drawRect
	.size	drawPaddle, .-drawPaddle
	.align	2
	.global	initializeBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeBall, %function
initializeBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #115
	str	lr, [sp, #-4]!
	mov	r2, #80
	mov	lr, #5
	mov	ip, #1
	mov	r0, #0
	ldr	r3, .L12
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	ldr	r1, .L12+4
	str	lr, [r3, #24]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	strh	r1, [r3, #28]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	ball
	.word	32736
	.size	initializeBall, .-initializeBall
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L28
	ldr	r3, [r4]
	cmp	r3, #0
	ldrle	r2, [r4, #16]
	ldr	r1, [r4, #4]
	rsble	r2, r2, #0
	strle	r2, [r4, #16]
	sub	r2, r1, #1
	cmp	r2, #237
	ldrhi	r2, [r4, #20]
	ldr	r6, .L28+4
	rsbhi	r2, r2, #0
	strhi	r2, [r4, #20]
	ldr	r2, [r6]
	cmp	r2, #0
	movne	r2, #0
	strne	r2, [r6]
	ldr	r2, .L28+8
	ldr	r0, [r2]
	subne	r3, r3, #2
	strne	r3, [r4]
	cmp	r0, #0
	movne	r0, #0
	ldr	r5, .L28+12
	strne	r0, [r2]
	ldr	r2, [r4, #24]
	sub	sp, sp, #20
	addne	r3, r3, #2
	strne	r3, [r4]
	str	r1, [sp, #4]
	str	r3, [sp]
	str	r2, [sp, #12]
	str	r2, [sp, #8]
	ldr	r3, [r5, #20]
	ldr	r2, [r5, #24]
	ldm	r5, {r0, r1}
	ldr	r7, .L28+16
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L19
	add	r0, r4, #16
	ldm	r0, {r0, r1}
.L20:
	ldm	r4, {r2, r3}
	add	r2, r2, r0
	add	r3, r3, r1
	stm	r4, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L19:
	mov	ip, #1
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #16]
	rsb	r0, r2, #0
	add	r1, r3, r1
	str	r1, [r4, #20]
	str	r0, [r4, #16]
	str	ip, [r6]
	b	.L20
.L29:
	.align	2
.L28:
	.word	ball
	.word	pCollided
	.word	bCollided
	.word	paddle
	.word	collision
	.size	updateBall, .-updateBall
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L32
	ldr	ip, .L32+4
	ldr	r3, [r4, #24]
	sub	sp, sp, #12
	mov	r2, r3
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	str	ip, [sp]
	ldr	r5, .L32+8
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #24]
	ldrh	r1, [r4, #28]
	mov	r2, r3
	str	r1, [sp]
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r5
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	ball
	.word	32767
	.word	drawRect
	.size	drawBall, .-drawBall
	.align	2
	.global	initializeBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeBullets, %function
initializeBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #3
	mvn	r5, #1
	mov	r4, #992
	mov	lr, #1
	ldr	r1, .L38
	ldr	r3, .L38+4
	ldr	ip, [r1, #8]
	ldr	r0, [r1, #12]
	add	r1, r3, #360
.L35:
	str	r6, [r3, #20]
	str	r2, [r3]
	str	r0, [r3, #12]
	str	r5, [r3, #16]
	strh	r4, [r3, #24]	@ movhi
	str	r2, [r3, #28]
	str	lr, [r3, #32]
	stmib	r3, {r2, ip}
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L35
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	paddle
	.word	bullets
	.size	initializeBullets, .-initializeBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L50
	mov	r3, #0
	mov	r2, r0
	b	.L43
.L41:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #36
	bxeq	lr
.L43:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L41
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	r4, .L50+4
	add	r3, r3, r3, lsl #3
	ldr	r2, [r4, #20]
	ldr	r6, [r4]
	add	ip, r0, r3, lsl #2
	add	lr, r2, r2, lsr #31
	str	r6, [r0, r3, lsl #2]
	ldr	r2, [r4, #4]
	ldr	r3, [ip, #20]
	add	r2, r2, lr, asr r5
	add	r3, r3, r3, lsr #31
	sub	r3, r2, r3, asr r5
	str	r5, [ip, #28]
	str	r1, [ip, #32]
	str	r3, [ip, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	bullets
	.word	paddle
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePaddle
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePaddle, %function
updatePaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	ldrh	r3, [r3, #48]
	tst	r3, #16
	push	{r4, lr}
	ldr	r4, .L63+4
	bne	.L53
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #20]
	add	r3, r2, r3
	cmp	r3, #239
	movle	r3, #1
	addle	r2, r2, r3
	strle	r2, [r4, #4]
	strle	r3, [r4, #16]
.L53:
	ldr	r3, .L63
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L54
	ldr	r3, [r4, #4]
	cmp	r3, #0
	mvngt	r2, #0
	addgt	r3, r3, r2
	strgt	r3, [r4, #4]
	strgt	r2, [r4, #16]
.L54:
	ldr	r3, .L63+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #32]
	beq	.L62
	ldr	r2, .L63+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L57
.L62:
	add	r3, r3, #1
.L56:
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L57:
	cmp	r3, #19
	ble	.L62
	bl	fireBullet
	mov	r3, #1
	b	.L56
.L64:
	.align	2
.L63:
	.word	67109120
	.word	paddle
	.word	oldButtons
	.word	buttons
	.size	updatePaddle, .-updatePaddle
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L69
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L70
.L67:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L70:
	ldr	r1, .L71
	ldr	r3, [r0, #20]
	str	r1, [sp]
	mov	r2, r3
	ldr	r1, [r0, #8]
	ldr	r5, .L71+4
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #32]
	b	.L67
.L69:
	ldr	r1, .L71
	ldr	r3, [r0, #20]
	str	r1, [sp]
	mov	r2, r3
	ldr	r1, [r0, #8]
	ldr	r5, .L71+4
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r1, [r4, #24]
	ldr	r3, [r4, #20]
	str	r1, [sp]
	mov	r2, r3
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L67
.L72:
	.align	2
.L71:
	.word	32767
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #20]
	cmp	r3, #0
	movle	r3, #0
	ldrgt	r3, [r0]
	ldrgt	r2, [r0, #16]
	addgt	r3, r3, r2
	strgt	r3, [r0]
	strle	r3, [r0, #28]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	initializeBlocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeBlocks, %function
initializeBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #5
	ldr	r3, .L87
	push	{r4, r5, r6, lr}
	mov	ip, r1
	mov	r2, r3
	mov	r6, #10
	mov	r5, #30
	mov	r0, #0
	mov	r4, #1
	ldr	lr, .L87+4
.L80:
	str	r1, [r2, #4]
	str	r1, [r2, #8]
	add	r1, r1, #50
	cmp	r1, #255
	str	r6, [r2, #24]
	str	r5, [r2, #20]
	str	ip, [r2]
	str	ip, [r2, #12]
	str	r0, [r2, #16]
	strh	lr, [r2, #28]	@ movhi
	str	r0, [r2, #32]
	str	r4, [r2, #36]
	add	r2, r2, #40
	bne	.L80
	mov	r2, #5
	mov	r5, #10
	mov	r4, #30
	mov	r0, #20
	mov	r1, #0
	mov	lr, #1
	ldr	ip, .L87+4
.L81:
	str	r2, [r3, #204]
	str	r2, [r3, #208]
	add	r2, r2, #50
	cmp	r2, #255
	str	r5, [r3, #224]
	str	r4, [r3, #220]
	str	r0, [r3, #200]
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	strh	ip, [r3, #228]	@ movhi
	str	r1, [r3, #232]
	str	lr, [r3, #236]
	add	r3, r3, #40
	bne	.L81
	mov	r2, #5
	mov	r5, #10
	mov	r4, #30
	mov	r0, #35
	mov	r1, #0
	mov	lr, #1
	ldr	r3, .L87+8
	ldr	ip, .L87+4
.L82:
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	add	r2, r2, #50
	cmp	r2, #255
	str	r5, [r3, #24]
	str	r4, [r3, #20]
	str	r0, [r3]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	strh	ip, [r3, #28]	@ movhi
	str	r1, [r3, #32]
	str	lr, [r3, #36]
	add	r3, r3, #40
	bne	.L82
	pop	{r4, r5, r6, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	blocks
	.word	8463
	.word	blocks+400
	.size	initializeBlocks, .-initializeBlocks
	.align	2
	.global	initializeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #150
	mov	r8, #0
	ldr	lr, .L93
	mov	r6, #105
	str	r7, [lr]
	str	r7, [lr, #8]
	mov	fp, #5
	mov	r10, #40
	mov	r9, #31744
	mov	ip, r7
	mov	r7, #20
	mov	r4, r8
	mov	r1, #3
	mvn	r2, #1
	mov	r3, #992
	mov	r5, #1
	str	r6, [lr, #4]
	str	r6, [lr, #12]
	mov	r0, r6
	ldr	r6, .L93+4
	str	fp, [lr, #24]
	str	r10, [lr, #20]
	strh	r9, [lr, #28]	@ movhi
	str	r7, [lr, #32]
	str	r8, [lr, #16]
	add	lr, r6, #360
.L90:
	str	r1, [r6, #20]
	str	r4, [r6]
	str	r0, [r6, #12]
	str	r2, [r6, #16]
	strh	r3, [r6, #24]	@ movhi
	str	r4, [r6, #28]
	str	r5, [r6, #32]
	stmib	r6, {r4, ip}
	add	r6, r6, #36
	cmp	r6, lr
	bne	.L90
	bl	initializeBlocks
	mov	r1, #115
	mov	r0, #5
	mov	r2, #80
	mov	ip, #15
	ldr	r3, .L93+8
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	ldr	r1, .L93+12
	str	r0, [r3, #24]
	strh	r1, [r3, #28]	@ movhi
	ldr	r0, .L93+16
	ldr	r1, .L93+20
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #8]
	str	r5, [r1]
	str	ip, [r0]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	paddle
	.word	bullets
	.word	ball
	.word	32736
	.word	blocksRemaining
	.word	level
	.size	initializeGame, .-initializeGame
	.align	2
	.global	drawBlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBlock, %function
drawBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L99
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L100
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L100:
	ldr	r2, .L101
	ldr	r3, [r0, #24]
	str	r2, [sp]
	add	r0, r0, #8
	ldr	r2, [r0, #12]
	ldr	r5, .L101+4
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #32]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L99:
	ldrh	r2, [r0, #28]
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r4, .L101+4
	ldr	r2, [r0, #20]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	32767
	.word	drawRect
	.size	drawBlock, .-drawBlock
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L111
	bl	drawPaddle
	add	r5, r4, #600
	bl	drawBall
	b	.L105
.L104:
	add	r4, r4, #40
	cmp	r4, r5
	beq	.L110
.L105:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L104
	mov	r0, r4
	add	r4, r4, #40
	bl	drawBlock
	cmp	r4, r5
	bne	.L105
.L110:
	ldr	r4, .L111+4
	add	r5, r4, #360
.L106:
	mov	r0, r4
	add	r4, r4, #36
	bl	drawBullet
	cmp	r4, r5
	bne	.L106
	pop	{r4, r5, r6, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	blocks
	.word	bullets
	.size	drawGame, .-drawGame
	.align	2
	.global	updateBlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBlock, %function
updateBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r5, r0
	sub	sp, sp, #20
	bne	.L128
.L114:
	ldr	r4, .L131
	mov	r9, #0
	ldr	r8, .L131+4
	ldr	r7, .L131+8
	add	r6, r4, #360
	b	.L120
.L117:
	add	r4, r4, #36
	cmp	r4, r6
	beq	.L113
.L129:
	ldr	r3, [r5, #36]
.L120:
	cmp	r3, #0
	beq	.L117
	ldr	r0, [r5, #4]
	ldr	lr, [r5, #20]
	ldr	ip, [r5, #24]
	ldr	r3, [r4, #20]
	ldr	r1, [r5]
	stmib	sp, {r0, ip, lr}
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L117
	mvn	r2, #9
	ldr	r3, [r7]
	str	r9, [r4, #28]
	add	r4, r4, #36
	sub	r3, r3, #1
	cmp	r4, r6
	str	r3, [r7]
	str	r9, [r5, #36]
	str	r2, [r5]
	bne	.L129
.L113:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L128:
	ldr	r6, [r0, #20]
	ldr	ip, [r0, #24]
	ldr	r4, .L131+12
	ldr	lr, [r0, #4]
	ldr	r3, [r4, #24]
	ldm	r4, {r0, r1}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	mov	r2, r3
	stm	sp, {ip, lr}
	ldr	r6, .L131+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L130
	mov	r1, #0
	mov	lr, #1
	mvn	ip, #9
	ldr	r0, .L131+8
	ldr	r2, [r0]
	sub	r2, r2, #1
	str	r2, [r0]
	ldr	r2, [r4, #16]
	rsb	r2, r2, #0
	str	r2, [r4, #16]
	ldr	r2, .L131+16
	mov	r3, r1
	str	lr, [r2]
	str	r1, [r5, #36]
	str	ip, [r5]
	b	.L114
.L130:
	ldr	r3, [r5, #36]
	b	.L114
.L132:
	.align	2
.L131:
	.word	bullets
	.word	collision
	.word	blocksRemaining
	.word	ball
	.word	bCollided
	.size	updateBlock, .-updateBlock
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updateBall
	bl	updatePaddle
	ldr	r4, .L144
	add	r5, r4, #600
.L134:
	mov	r0, r4
	add	r4, r4, #40
	bl	updateBlock
	cmp	r4, r5
	bne	.L134
	mov	ip, #0
	ldr	r3, .L144+4
	add	r1, r3, #360
.L137:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L135
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldrgt	r2, [r3]
	ldrgt	r0, [r3, #16]
	addgt	r2, r2, r0
	strgt	r2, [r3]
	strle	ip, [r3, #28]
.L135:
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L137
	pop	{r4, r5, r6, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	blocks
	.word	bullets
	.size	updateGame, .-updateGame
	.comm	bCollided,4,4
	.comm	pCollided,4,4
	.comm	level,4,4
	.comm	blocksRemaining,4,4
	.comm	blocks,600,4
	.comm	bullets,360,4
	.comm	ball,32,4
	.comm	paddle,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
