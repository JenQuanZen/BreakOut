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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press Enter to Start\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, #0
	ldr	r2, .L4+12
	mov	r1, #100
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	32736
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1027
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L22+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L22+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+12
	ldr	r0, .L22+16
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L22+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.word	fillScreen
	.word	32767
	.word	state
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L26
	ldr	r0, .L26+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L26+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L27:
	.align	2
.L26:
	.word	fillScreen
	.word	32767
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L30
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L31:
	.align	2
.L30:
	.word	oldButtons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Congrats! You won!\000"
	.align	2
.LC2:
	.ascii	"Press Enter to play again\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #992
	ldr	r3, .L34
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+4
	mov	r3, #0
	mov	r1, #60
	mov	r0, #80
	ldr	r2, .L34+8
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L34+12
	mov	r1, #80
	mov	r0, #60
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L34+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	fillScreen
	.word	drawString
	.word	.LC1
	.word	.LC2
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Sorry, you lost :(\000"
	.align	2
.LC4:
	.ascii	"Press Enter to try again\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #31
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	ldr	r4, .L39+4
	mov	r3, #0
	mov	r1, #60
	mov	r0, #80
	ldr	r2, .L39+8
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L39+12
	mov	r1, #80
	mov	r0, #60
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L39+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	fillScreen
	.word	drawString
	.word	.LC3
	.word	.LC4
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L47
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L45
	ldr	r3, .L47+16
	ldr	r3, [r3]
	cmp	r3, #158
	bgt	.L46
.L41:
	pop	{r4, lr}
	bx	lr
.L45:
	bl	goToWin
	ldr	r3, .L47+16
	ldr	r3, [r3]
	cmp	r3, #158
	ble	.L41
.L46:
	pop	{r4, lr}
	b	goToLose
.L48:
	.align	2
.L47:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	blocksRemaining
	.word	ball
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L62
	push	{r4, r7, fp, lr}
	ldr	r6, .L62+4
	ldr	fp, .L62+8
	strh	r2, [r3]	@ movhi
	ldr	r3, .L62+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L62+16
	ldr	r2, [r6]
	ldrh	r1, [fp]
	ldr	r8, .L62+20
	ldr	r7, .L62+24
	ldr	r10, .L62+28
	ldr	r9, .L62+32
	ldr	r4, .L62+36
.L51:
	strh	r1, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L58
.L53:
	.word	.L56
	.word	.L55
	.word	.L54
	.word	.L52
.L52:
	tst	r1, #8
	beq	.L58
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L51
.L54:
	tst	r1, #8
	beq	.L58
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L51
.L55:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L51
.L56:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L51
.L58:
	mov	r1, r3
	b	.L51
.L63:
	.align	2
.L62:
	.word	1027
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	start
	.word	game
	.word	win.part.0
	.word	lose.part.0
	.word	67109120
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
