	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	setUpGameVar
	.type	setUpGameVar, %function
setUpGameVar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldr	r5, .L2
	mov	r3, #0
	ldr	r1, .L2+4
	ldr	r2, .L2+8
	str	r3, [r5, #0]
	mov	r4, #20
	mov	r0, #80
	mov	ip, #100
	ldr	r5, .L2+12
	mov	r6, #40
	stmia	r1, {r0, r4}	@ phole stm
	str	r3, [r1, #12]
	str	r3, [r1, #8]
	str	r3, [r1, #16]
	str	r3, [r1, #28]
	str	r3, [r1, #24]
	str	r3, [r1, #20]
	str	r3, [r1, #32]
	str	ip, [r1, #36]
	mov	r1, #130
	str	r6, [r5, #0]
	str	r0, [r2, #0]
	ldr	r5, .L2+16
	str	ip, [r2, #36]
	str	r1, [r2, #4]
	str	r3, [r2, #12]
	str	r3, [r2, #8]
	str	r3, [r2, #16]
	str	r3, [r2, #28]
	str	r3, [r2, #24]
	str	r3, [r2, #20]
	str	r3, [r2, #32]
	ldr	r2, .L2+20
	str	r3, [r5, #0]
	str	r3, [r2, #0]
	ldr	r5, .L2+24
	ldr	r2, .L2+28
	str	r4, [r5, #0]
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L3:
	.align	2
.L2:
	.word	BG_hOff
	.word	taco
	.word	brocolli
	.word	BG_vOff
	.word	vOff
	.word	strikeMode
	.word	hOff
	.word	brocMode
	.size	setUpGameVar, .-setUpGameVar
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L5
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #2
	str	r3, [r2, #40]
	ldr	r2, .L5+4
	str	r3, [r2, #40]
	bl	setUpGameVar
	mov	r3, #67108864
	add	r2, r3, #512
	ldrh	r4, [r2, #0]
	mov	r0, #50331648
	ldr	r5, .L5+8
	ldrh	ip, [r3, #4]
	add	r0, r0, #28672
	mvn	r1, #1264
	str	r5, [r0, #4092]
	sub	r1, r1, #1
	orr	r4, r4, #1
	mov	r0, #128	@ movhi
	strh	r0, [r3, #132]	@ movhi
	orr	ip, ip, #8
	strh	r4, [r2, #0]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	mov	r1, #1	@ movhi
	strh	ip, [r3, #4]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	taco
	.word	brocolli
	.word	interruptHandler
	.size	initialize, .-initialize
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L9
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r4, #0
	add	ip, ip, #12
	str	r4, [ip, #8]
	ldr	ip, .L9+4
	mov	sl, r0
	mov	r7, #67108864
	mov	r6, r2
	mov	r5, r1
	add	r2, r7, #160
	mov	r9, r3
	add	r7, r7, #256
	mov	r3, #910163968
	mov	r0, #1
	mov	r1, sl
	str	r4, [ip, #0]
	ldr	ip, .L9+8
	mov	lr, pc
	bx	ip
	ldr	r8, .L9+12
	mov	r1, r6
	mov	r0, #16777216
	strh	r4, [r7, #2]	@ movhi
	mov	lr, pc
	bx	r8
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	fp, .L9+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #0]	@ movhi
	mov	r3, #128	@ movhi
	str	sl, [fp, #0]
	rsb	r0, r5, r5, asl #4
	strh	r3, [r7, #2]	@ movhi
	mov	r3, #1
	mov	r1, r6
	str	r6, [fp, #8]
	str	r3, [fp, #12]
	mov	r0, r0, asl #2
	str	r5, [fp, #4]
	str	r9, [fp, #16]
	mov	lr, pc
	bx	r8
	mov	r1, r6
	sub	r6, r0, #1
	mov	r0, r5
	mov	lr, pc
	bx	r8
	sub	r0, r0, r0, asl #2
	add	r6, r6, r0
	str	r6, [fp, #20]
	str	r4, [fp, #24]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	dma
	.word	vbCountA
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L12
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r6, #0
	mov	sl, r0
	add	r0, ip, #12
	add	ip, ip, #24
	str	r6, [r0, #8]
	str	r6, [ip, #8]
	ldr	ip, .L12+4
	mov	r7, #67108864
	mov	r5, r2
	mov	r4, r1
	add	r2, r7, #164
	str	r6, [ip, #0]
	add	r7, r7, #256
	ldr	ip, .L12+8
	mov	r9, r3
	mov	r0, #2
	mov	r3, #910163968
	mov	r1, sl
	mov	lr, pc
	bx	ip
	ldr	r8, .L12+12
	mov	r1, r5
	strh	r6, [r7, #6]	@ movhi
	mov	r0, #16777216
	mov	lr, pc
	bx	r8
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r6, .L12+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #4]	@ movhi
	mov	fp, #1
	mov	r3, #128	@ movhi
	rsb	r0, r4, r4, asl #4
	mov	r1, r5
	str	sl, [r6, #0]
	mov	r0, r0, asl #2
	strh	r3, [r7, #6]	@ movhi
	stmib	r6, {r4, r5, fp}	@ phole stm
	str	r9, [r6, #16]
	mov	lr, pc
	bx	r8
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r4
	mov	lr, pc
	bx	r8
	sub	r0, r0, r0, asl #2
	add	r5, r5, r0
	str	r5, [r6, #20]
	str	fp, [r6, #24]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	dma
	.word	vbCountB
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	add	r3, r3, #512
	stmfd	sp!, {r4, lr}
	ldrh	r1, [r3, #2]
	mov	r2, #0
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L15
	ldr	r1, .L20
	ldr	r3, .L20+4
	ldr	r0, [r1, #20]
	ldr	r1, [r3, #0]
	cmp	r0, r1
	bgt	.L16
	ldr	r1, .L20+8
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r1, r1, #256
	add	r0, r0, #12
	strh	r2, [r1, #2]	@ movhi
	str	r2, [r0, #8]
	str	r2, [r3, #0]
.L16:
	ldr	r2, .L20+12
	ldr	r1, .L20+16
	ldr	r0, [r2, #20]
	ldr	r3, [r1, #0]
	cmp	r0, r3
	ble	.L19
.L17:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L15:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L19:
	ldr	r0, .L20+8
	ldr	r3, [r2, #16]
	ldr	r4, [r0, #0]
	mov	ip, #67108864
	mov	r0, #0
	add	ip, ip, #256
	add	r4, r4, #24
	cmp	r3, r0
	strh	r0, [ip, #6]	@ movhi
	str	r0, [r4, #8]
	str	r0, [r1, #0]
	beq	.L17
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	b	.L17
.L21:
	.align	2
.L20:
	.word	soundA
	.word	vbCountA
	.word	dma
	.word	soundB
	.word	vbCountB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	muteSound
	.type	muteSound, %function
muteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldrh	r3, [r2, #132]
	bic	r3, r3, #128
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r2, #132]	@ movhi
	bx	lr
	.size	muteSound, .-muteSound
	.align	2
	.global	unmuteSound
	.type	unmuteSound, %function
unmuteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #132]
	orr	r2, r2, #128
	strh	r2, [r3, #132]	@ movhi
	bx	lr
	.size	unmuteSound, .-unmuteSound
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r2, #0
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r2, #128
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	stmfd	sp!, {r3, lr}
	mov	r1, r0
	mov	r2, r0
	mov	r3, r0
	bl	playSoundB
	mov	r0, #0
	mov	r1, r0
	mov	r2, r0
	mov	r3, r0
	bl	playSoundA
	ldr	r3, .L27
	ldr	r2, [r3, #0]
	mov	r3, #0
	add	r1, r2, #12
	add	r2, r2, #24
	str	r3, [r1, #8]
	str	r3, [r2, #8]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	dma
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L30
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L31:
	.align	2
.L30:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L35
	stmfd	sp!, {r3, lr}
	mov	r3, #0
.L33:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L33
	mov	r0, #3
	ldr	r1, .L35
	mov	r2, #117440512
	mov	r3, #128
	ldr	ip, .L35+4
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	shadowOAM
	.word	DMANow
	.size	hideSprites, .-hideSprites
	.align	2
	.global	controlDrawTaco
	.type	controlDrawTaco, %function
controlDrawTaco:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L45
	stmfd	sp!, {r4, r5}
	ldr	r1, [r3, #8]
	ldr	r0, [r3, #0]
	rsb	r1, r1, r1, asl #30
	add	r2, r0, r1, asl #2
	cmp	r2, #80
	str	r2, [r3, #0]
	bgt	.L38
	mov	ip, r2, asl #16
	cmp	r2, #39
	mov	ip, ip, lsr #16
	mvnle	r2, #0
	strle	r2, [r3, #8]
	movle	r2, #1
	strle	r2, [r3, #32]
.L40:
	ldr	r0, .L45+4
	ldr	r2, [r3, #4]
	ldr	r1, [r0, #4]
	add	r4, r2, #30
	cmp	r4, r1
	ldrge	r4, .L45
	subge	r2, r1, #30
	strge	r2, [r4, #4]
	cmp	r2, #19
	bgt	.L44
	ldr	r4, .L45+8
	ldr	r5, [r4, #0]
	add	r1, r1, #20
	sub	r5, r5, #20
	add	r5, r5, r2
	rsb	r2, r2, r1
	str	r2, [r0, #4]
	mov	r2, #20
	mov	r1, #49152
	str	r5, [r4, #0]
	str	r2, [r3, #4]
	add	r1, r1, r2
.L43:
	add	r0, r3, #20
	ldmia	r0, {r0, r2}	@ phole ldm
	ldr	r3, .L45+12
	add	r2, r2, r0, asl #5
	mov	r2, r2, asl #3
	strh	ip, [r3, #0]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldmfd	sp!, {r4, r5}
	bx	lr
.L38:
	mov	ip, #80
	mov	r2, #0
	str	ip, [r3, #0]
	str	r2, [r3, #32]
	b	.L40
.L44:
	mvn	r1, r2, asl #18
	mvn	r1, r1, lsr #18
	mov	r1, r1, asl #16
	mov	r1, r1, lsr #16
	b	.L43
.L46:
	.align	2
.L45:
	.word	taco
	.word	brocolli
	.word	hOff
	.word	shadowOAM
	.size	controlDrawTaco, .-controlDrawTaco
	.align	2
	.global	drawHealthBars
	.type	drawHealthBars, %function
drawHealthBars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r7, .L62
	ldr	r6, .L62+4
	ldr	r2, [r7, #36]
	ldr	ip, .L62+8
	ldr	r3, [r6, #36]
	smull	r1, r4, ip, r2
	smull	r5, ip, r3, ip
	ldr	r0, .L62+12
	mov	r2, r2, asr #31
	mov	r3, r3, asr #31
	rsb	r4, r2, r4, asr #2
	rsb	ip, r3, ip, asr #2
	mov	r1, #209
	mov	r3, r0
	mov	r2, #2
.L52:
	cmp	r4, r2
	rsbge	r5, r1, #230
	movlt	r8, #0	@ movhi
	strgeh	r5, [r3, #18]	@ movhi
	movge	r8, #20	@ movhi
	movge	r5, #280	@ movhi
	strgeh	r5, [r3, #20]	@ movhi
	strgeh	r8, [r3, #16]	@ movhi
	strlth	r8, [r3, #16]	@ movhi
	strlth	r8, [r3, #18]	@ movhi
	strlth	r8, [r3, #20]	@ movhi
	cmp	ip, r2
	movlt	r5, #0	@ movhi
	strgeh	r1, [r3, #98]	@ movhi
	movge	r5, #20	@ movhi
	movge	r8, #280	@ movhi
	sub	r1, r1, #8
	add	r2, r2, #1
	strgeh	r5, [r3, #96]	@ movhi
	strgeh	r8, [r3, #100]	@ movhi
	strlth	r5, [r3, #96]	@ movhi
	strlth	r5, [r3, #98]	@ movhi
	strlth	r5, [r3, #100]	@ movhi
	mov	r1, r1, asl #16
	cmp	r2, #12
	add	r3, r3, #8
	mov	r1, r1, lsr #16
	bne	.L52
	ldr	r3, [r7, #40]
	cmp	r3, #0
	movgt	r3, #5	@ movhi
	strgth	r3, [r0, #170]	@ movhi
	ldr	r3, [r6, #40]
	movle	r8, #0	@ movhi
	movgt	r1, #30	@ movhi
	movgt	r5, #280	@ movhi
	strleh	r8, [r0, #168]	@ movhi
	strleh	r8, [r0, #170]	@ movhi
	strleh	r8, [r0, #172]	@ movhi
	strgth	r1, [r0, #168]	@ movhi
	strgth	r5, [r0, #172]	@ movhi
	cmp	r3, #0
	movgt	r3, #225	@ movhi
	strgth	r3, [r0, #186]	@ movhi
	ldr	r3, [r7, #40]
	movle	r8, #0	@ movhi
	movgt	r1, #30	@ movhi
	movgt	r5, #280	@ movhi
	strleh	r8, [r0, #184]	@ movhi
	strleh	r8, [r0, #186]	@ movhi
	strleh	r8, [r0, #188]	@ movhi
	strgth	r1, [r0, #184]	@ movhi
	strgth	r5, [r0, #188]	@ movhi
	cmp	r3, #1
	movgt	r3, #20	@ movhi
	strgth	r3, [r0, #178]	@ movhi
	ldr	r3, [r6, #40]
	movle	r8, #0	@ movhi
	movgt	r1, #30	@ movhi
	movgt	r5, #280	@ movhi
	strleh	r8, [r0, #176]	@ movhi
	strleh	r8, [r0, #178]	@ movhi
	strleh	r8, [r0, #180]	@ movhi
	strgth	r1, [r0, #176]	@ movhi
	strgth	r5, [r0, #180]	@ movhi
	cmp	r3, #1
	movle	r8, #0	@ movhi
	movgt	r1, #30	@ movhi
	movgt	r3, #210	@ movhi
	movgt	r5, #280	@ movhi
	strleh	r8, [r0, #192]	@ movhi
	strleh	r8, [r0, #194]	@ movhi
	strleh	r8, [r0, #196]	@ movhi
	strgth	r1, [r0, #192]	@ movhi
	strgth	r3, [r0, #194]	@ movhi
	strgth	r5, [r0, #196]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L63:
	.align	2
.L62:
	.word	taco
	.word	brocolli
	.word	1717986919
	.word	shadowOAM
	.size	drawHealthBars, .-drawHealthBars
	.align	2
	.global	drawBrocolli
	.type	drawBrocolli, %function
drawBrocolli:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L69
	ldr	r2, [r3, #4]
	cmp	r2, #29
	movle	r1, #0
	strle	r1, [r3, #12]
	ldr	r1, .L69+4
	ldr	r1, [r1, #4]
	add	r1, r1, #30
	cmp	r2, r1
	movle	r1, #0
	strle	r1, [r3, #12]
	cmp	r2, #29
	movle	r2, #30
	ble	.L67
	cmp	r2, #200
	movge	r2, #200
.L67:
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #20]
	add	r2, r2, r1
	mvn	ip, r2, asl #18
	ldr	r1, .L69+8
	add	r0, r0, #96
	str	r2, [r3, #4]
	ldrh	r3, [r3, #0]
	mvn	ip, ip, lsr #18
	mov	r0, r0, asl #3
	strh	ip, [r1, #10]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	bx	lr
.L70:
	.align	2
.L69:
	.word	brocolli
	.word	taco
	.word	shadowOAM
	.size	drawBrocolli, .-drawBrocolli
	.align	2
	.global	drawPotatoh
	.type	drawPotatoh, %function
drawPotatoh:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L72
	ldr	r3, .L72+4
	mvn	r2, #16256
	mov	r0, #100
	sub	r2, r2, #27
	str	r0, [r1, #4]
	ldrh	r1, [r1, #0]
	strh	r2, [r3, #10]	@ movhi
	mov	r2, #536	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	bx	lr
.L73:
	.align	2
.L72:
	.word	brocolli
	.word	shadowOAM
	.size	drawPotatoh, .-drawPotatoh
	.align	2
	.global	dmaShadowOAM
	.type	dmaShadowOAM, %function
dmaShadowOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #3
	ldr	r1, .L75
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L75+4
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	shadowOAM
	.word	DMANow
	.size	dmaShadowOAM, .-dmaShadowOAM
	.align	2
	.global	drawTutrorialScreen
	.type	drawTutrorialScreen, %function
drawTutrorialScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L78
	mov	r3, #100
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	str	r3, [r2, #36]
	ldr	r2, .L78+4
	ldr	r7, .L78+8
	str	r3, [r2, #36]
	bl	stopSound
	ldr	r8, .L78+12
	mov	ip, #20
	str	ip, [r7, #0]
	mov	ip, #30
	mov	r4, #67108864
	str	ip, [r8, #0]
	mov	r1, #23296
	mov	ip, #4864	@ movhi
	strh	ip, [r4, #0]	@ movhi
	add	r1, r1, #37
	mov	r2, #8000
	mov	r3, #1
	ldr	r0, .L78+16
	bl	playSoundB
	mov	r2, #8064
	mov	r3, #6272
	add	r2, r2, #1
	add	r3, r3, #4
	strh	r2, [r4, #8]	@ movhi
	ldr	r0, .L78+20
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L78+24
	mov	lr, pc
	bx	r3
	mov	r6, #100663296
	mov	r3, #5696
	ldr	r5, .L78+28
	mov	r0, #3
	ldr	r1, .L78+32
	mov	r2, r6
	add	r3, r3, #32
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L78+36
	add	r2, r6, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L78+40
	add	r2, r6, #16384
	mov	r3, #288
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L78+44
	add	r2, r6, #49152
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+48
	add	r2, r2, #512
	mov	r3, #32
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L78+52
	add	r2, r6, #65536
	mov	r3, #32768
	mov	lr, pc
	bx	r5
	bl	hideSprites
	bl	controlDrawTaco
	ldr	r3, .L78+56
	ldrh	r2, [r3, #0]
	ldr	r3, .L78+60
	ldrh	r0, [r7, #0]
	ldrh	r1, [r8, #0]
	ldrh	r3, [r3, #0]
	strh	r0, [r4, #16]	@ movhi
	strh	r1, [r4, #18]	@ movhi
	strh	r2, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	taco
	.word	brocolli
	.word	BG_hOff
	.word	BG_vOff
	.word	game_loop
	.word	far_bgPal
	.word	loadPalette
	.word	DMANow
	.word	far_bg_1Tiles
	.word	far_bg_1Map
	.word	foregroundTiles
	.word	foregroundMap
	.word	Taco_SpritesPal
	.word	Taco_SpritesTiles
	.word	hOff
	.word	vOff
	.size	drawTutrorialScreen, .-drawTutrorialScreen
	.align	2
	.global	drawGameScreen
	.type	drawGameScreen, %function
drawGameScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L81
	mov	r3, #100
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	str	r3, [r2, #36]
	ldr	r2, .L81+4
	ldr	r7, .L81+8
	str	r3, [r2, #36]
	bl	stopSound
	ldr	r8, .L81+12
	mov	ip, #20
	str	ip, [r7, #0]
	mov	ip, #30
	mov	r4, #67108864
	str	ip, [r8, #0]
	mov	r1, #23296
	mov	ip, #4864	@ movhi
	strh	ip, [r4, #0]	@ movhi
	add	r1, r1, #37
	mov	r2, #8000
	mov	r3, #1
	ldr	r0, .L81+16
	bl	playSoundB
	mov	r2, #8064
	mov	r3, #6272
	add	r2, r2, #1
	add	r3, r3, #4
	strh	r2, [r4, #8]	@ movhi
	ldr	r0, .L81+20
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L81+24
	mov	lr, pc
	bx	r3
	mov	r6, #100663296
	mov	r3, #5696
	ldr	r5, .L81+28
	mov	r0, #3
	ldr	r1, .L81+32
	mov	r2, r6
	add	r3, r3, #32
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L81+36
	add	r2, r6, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L81+40
	add	r2, r6, #16384
	mov	r3, #288
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L81+44
	add	r2, r6, #49152
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L81+48
	add	r2, r2, #512
	mov	r3, #32
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L81+52
	add	r2, r6, #65536
	mov	r3, #32768
	mov	lr, pc
	bx	r5
	bl	hideSprites
	bl	controlDrawTaco
	ldr	r3, .L81+56
	ldrh	r2, [r3, #0]
	ldr	r3, .L81+60
	ldrh	r0, [r7, #0]
	ldrh	r1, [r8, #0]
	ldrh	r3, [r3, #0]
	strh	r0, [r4, #16]	@ movhi
	strh	r1, [r4, #18]	@ movhi
	strh	r2, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	taco
	.word	brocolli
	.word	BG_hOff
	.word	BG_vOff
	.word	game_loop
	.word	far_bgPal
	.word	loadPalette
	.word	DMANow
	.word	far_bgTiles
	.word	far_bgMap
	.word	foregroundTiles
	.word	foregroundMap
	.word	Taco_SpritesPal
	.word	Taco_SpritesTiles
	.word	hOff
	.word	vOff
	.size	drawGameScreen, .-drawGameScreen
	.align	2
	.global	drawRound
	.type	drawRound, %function
drawRound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #100663296
	mov	r3, #16777216
	mov	r4, r0
	mov	r1, #83886080
	mov	r0, #3
	add	r2, r2, #63488
	add	r3, r3, #1024
	ldr	r5, .L92
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #16777216
	mov	r0, #3
	mov	r1, #83886080
	add	r2, r2, #63488
	add	r3, r3, #1024
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #4
	strh	r3, [r2, #0]	@ movhi
	ldr	r1, [r2, #304]
	ldr	r3, .L92+4
	ldr	r0, .L92+8
	str	r1, [r3, #0]
	ldr	r3, .L92+12
	mov	lr, pc
	bx	r3
	cmp	r4, #4
	beq	.L89
	cmp	r4, #3
	beq	.L90
	cmp	r4, #2
	beq	.L91
.L85:
	ldr	r5, .L92+16
	mov	r4, #800
.L87:
	mov	lr, pc
	bx	r5
	subs	r4, r4, #1
	bne	.L87
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L89:
	ldr	r0, .L92+20
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	b	.L85
.L90:
	ldr	r0, .L92+28
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	b	.L85
.L91:
	ldr	r0, .L92+32
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	b	.L85
.L93:
	.align	2
.L92:
	.word	DMANow
	.word	buttons
	.word	titlePal
	.word	loadPalette
	.word	waitForVblank
	.word	RoundOneBitmap
	.word	drawBackgroundImage4
	.word	RoundTwoBitmap
	.word	RoundThreeBitmap
	.size	drawRound, .-drawRound
	.align	2
	.global	contactHandler
	.type	contactHandler, %function
contactHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L107
	ldr	r4, .L107+4
	ldr	r2, [r5, #4]
	ldr	r3, [r4, #4]
	add	r1, r2, #40
	cmp	r1, r3
	blt	.L94
	ldr	r1, [r5, #24]
	cmp	r1, #1
	beq	.L102
	cmp	r1, #0
	bne	.L98
	ldr	r0, [r4, #24]
	cmp	r0, #0
	bne	.L103
.L98:
	ldr	r0, .L107+8
	ldr	r1, [r0, #0]
	cmp	r1, #1
	beq	.L104
	cmp	r1, #2
	beq	.L105
.L94:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L102:
	ldr	r2, [r4, #24]
	cmp	r2, #0
	bne	.L106
	ldr	r1, [r4, #36]
	str	r2, [r4, #16]
	ldr	r2, .L107+12
	add	r3, r3, #10
	sub	r1, r1, #1
	mov	r0, #2
	str	r0, [r2, #0]
	str	r3, [r4, #4]
	str	r1, [r4, #36]
	b	.L94
.L105:
	ldr	r2, [r5, #16]
	cmp	r2, #30
	ldrgt	r2, [r4, #36]
	ldrle	r1, [r4, #36]
	add	r3, r3, #10
	str	r3, [r4, #4]
	mov	r3, #0
	subgt	r2, r2, #30
	rsble	r2, r2, r1
	str	r3, [r4, #16]
	ldr	r3, .L107+12
	strgt	r2, [r4, #36]
	strle	r2, [r4, #36]
	mov	r2, #2
	str	r2, [r3, #0]
	b	.L94
.L103:
	ldr	r3, [r5, #36]
	sub	r3, r3, #10
	sub	r2, r2, #10
	str	r3, [r5, #36]
	ldr	r3, .L107+12
	str	r2, [r5, #4]
	mov	r2, #2
	str	r1, [r4, #16]
	str	r2, [r3, #0]
	b	.L94
.L104:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L94
	sub	r2, r2, #15
	str	r2, [r5, #4]
	ldr	r2, .L107+4
	mov	r3, #0
	ldr	r1, [r5, #36]
	str	r3, [r2, #16]
	str	r3, [r0, #0]
	ldr	r3, .L107+12
	sub	r1, r1, #20
	mov	r2, #2
	str	r1, [r5, #36]
	str	r2, [r3, #0]
	b	.L94
.L106:
	ldr	r3, .L107+16
	ldr	r3, [r3, #0]
	mov	r6, #0
	add	r3, r3, #12
	mov	r1, #6784
	str	r6, [r3, #8]
	add	r1, r1, #30
	mov	r2, #8000
	mov	r3, r6
	ldr	r0, .L107+20
	bl	playSoundA
	ldr	r3, [r5, #4]
	ldr	r2, .L107+12
	sub	r3, r3, #15
	mov	r1, #2
	str	r6, [r4, #16]
	str	r1, [r2, #0]
	str	r3, [r5, #4]
	b	.L94
.L108:
	.align	2
.L107:
	.word	taco
	.word	brocolli
	.word	strikeMode
	.word	brocMode
	.word	dma
	.word	Swords_Clashing
	.size	contactHandler, .-contactHandler
	.align	2
	.global	parry
	.type	parry, %function
parry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L112
	ldr	r1, [r3, #16]
	add	r1, r1, #1
	mov	r2, #0
	cmp	r1, #20
	str	r1, [r3, #16]
	mov	r1, #3
	str	r1, [r3, #12]
	strgt	r2, [r3, #16]
	str	r2, [r3, #24]
	ldrgt	r1, .L112+4
	ldr	r3, [r3, #4]
	strgt	r2, [r1, #0]
	cmp	r3, #150
	ldrgt	r3, .L112
	movgt	r2, #0
	strgt	r2, [r3, #12]
	bx	lr
.L113:
	.align	2
.L112:
	.word	brocolli
	.word	brocMode
	.size	parry, .-parry
	.align	2
	.global	attack
	.type	attack, %function
attack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L119
	ldr	r2, [r3, #16]
	ldr	r1, .L119+4
	add	r2, r2, #1
	smull	r0, r1, r2, r1
	mov	r0, r2, asr #31
	add	r1, r1, r2
	rsb	r1, r0, r1, asr #2
	rsb	r1, r1, r1, asl #3
	cmp	r2, r1
	str	r2, [r3, #16]
	mvn	r2, #0
	str	r2, [r3, #12]
	ldreq	r2, [r3, #20]
	ldrne	r2, [r3, #20]
	addeq	r2, r2, #1
	streq	r2, [r3, #20]
	cmp	r2, #1
	movgt	r2, #0
	strgt	r2, [r3, #20]
	ldr	r2, .L119+8
	mov	r1, #0
	ldr	r2, [r2, #4]
	str	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r2, r2, #40
	cmp	r2, r3
	ldr	r3, .L119
	bxlt	lr
	mov	r2, #0
	str	r2, [r3, #12]
	mov	r2, #3
	str	r2, [r3, #20]
	mov	r2, #1
	str	r2, [r3, #24]
	ldr	r3, .L119+12
	mov	r2, #2
	str	r2, [r3, #0]
	bx	lr
.L120:
	.align	2
.L119:
	.word	brocolli
	.word	-1840700269
	.word	taco
	.word	brocMode
	.size	attack, .-attack
	.align	2
	.global	BroclliAI
	.type	BroclliAI, %function
BroclliAI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L127
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L126
	b	attack
.L126:
	cmp	r3, #2
	bxne	lr
	b	parry
.L128:
	.align	2
.L127:
	.word	brocMode
	.size	BroclliAI, .-BroclliAI
	.align	2
	.global	drawPauseScreen
	.type	drawPauseScreen, %function
drawPauseScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	ip, .L130
	mov	r5, #67108864
	ldrh	lr, [r5, #0]
	mov	r4, #3
	str	r4, [ip, #0]
	ldr	ip, .L130+4
	bic	lr, lr, #4608
	mov	r6, #0
	strh	lr, [r5, #0]	@ movhi
	mov	r8, #100663296
	str	r6, [ip, #0]
	ldr	ip, .L130+8
	add	sl, r8, #63488
	mov	r3, #16777216
	ldr	r7, .L130+12
	str	r6, [ip, #0]
	mov	r1, #83886080
	mov	r2, sl
	add	r3, r3, #2048
	mov	r0, r4
	mov	lr, pc
	bx	r7
	mov	r0, r4
	ldr	r1, .L130+16
	mov	r2, r8
	mov	r3, #2656
	mov	lr, pc
	bx	r7
	mov	r0, r4
	ldr	r1, .L130+20
	mov	r2, sl
	mov	r3, #640
	mov	lr, pc
	bx	r7
	strh	r6, [r5, #18]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	state
	.word	BG_vOff
	.word	BG_hOff
	.word	DMANow
	.word	pause_screenTiles
	.word	pause_screenMap
	.size	drawPauseScreen, .-drawPauseScreen
	.align	2
	.global	drawWinScreen
	.type	drawWinScreen, %function
drawWinScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r5, #67108864
	ldrh	r3, [r5, #0]
	ldr	r2, .L133
	bic	r3, r3, #4608
	mov	r1, #4
	str	r1, [r2, #0]
	strh	r3, [r5, #0]	@ movhi
	bl	stopSound
	ldr	r3, .L133+4
	ldr	ip, [r3, #0]
	mov	r4, #0
	add	ip, ip, #24
	mov	r1, #77824
	ldr	r0, .L133+8
	add	r1, r1, #600
	mov	r2, #8000
	mov	r3, r4
	str	r4, [ip, #8]
	bl	playSoundA
	mov	r7, #100663296
	ldr	ip, .L133+12
	add	r8, r7, #63488
	mov	r3, #16777216
	ldr	r6, .L133+16
	mov	r0, #3
	mov	r1, #83886080
	mov	r2, r8
	add	r3, r3, #2048
	strh	r4, [r5, #18]	@ movhi
	str	r4, [ip, #0]
	mov	lr, pc
	bx	r6
	mov	r3, #8960
	mov	r0, #3
	ldr	r1, .L133+20
	mov	r2, r7
	add	r3, r3, #32
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r1, .L133+24
	mov	r2, r8
	mov	r3, #640
	mov	lr, pc
	bx	r6
	strh	r4, [r5, #18]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	state
	.word	dma
	.word	victory_song
	.word	BG_vOff
	.word	DMANow
	.word	victoryTiles
	.word	victoryMap
	.size	drawWinScreen, .-drawWinScreen
	.align	2
	.global	release
	.type	release, %function
release:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L137
	ldr	r3, [r1, #16]
	ldr	r2, .L137+4
	add	r3, r3, #1
	smull	r0, r2, r3, r2
	mov	r0, r3, asr #31
	rsb	r2, r0, r2, asr #1
	add	r0, r2, r2, asl #2
	add	r2, r2, r0, asl #1
	subs	r2, r3, r2
	str	r3, [r1, #16]
	ldreq	r3, .L137+8
	streq	r2, [r3, #0]
	bx	lr
.L138:
	.align	2
.L137:
	.word	taco
	.word	780903145
	.word	strikeMode
	.size	release, .-release
	.align	2
	.global	charging
	.type	charging, %function
charging:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r4, [r3, #304]
	mvn	r4, r4
	ands	r4, r4, #2
	beq	.L140
	ldr	r2, .L142
	ldr	r3, [r2, #16]
	ldr	r1, .L142+4
	add	r3, r3, #1
	smull	r0, r1, r3, r1
	mov	r0, r3, asr #31
	add	r1, r1, r3
	rsb	r1, r0, r1, asr #2
	rsb	r1, r1, r1, asl #3
	subs	r1, r3, r1
	str	r3, [r2, #16]
	bne	.L139
	ldr	r3, [r2, #20]
	add	r3, r3, #1
	cmp	r3, #2
	movgt	r3, r1
	str	r3, [r2, #20]
.L139:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L140:
	mov	r1, #7744
	ldr	r0, .L142+8
	add	r1, r1, #24
	mov	r2, #8000
	mov	r3, r4
	bl	playSoundA
	ldr	r3, .L142
	ldr	r2, [r3, #4]
	ldr	r1, .L142+12
	add	r2, r2, #15
	mov	r0, #2
	str	r2, [r3, #4]
	mov	r2, #3
	str	r0, [r1, #0]
	str	r2, [r3, #24]
	str	r4, [r3, #20]
	b	.L139
.L143:
	.align	2
.L142:
	.word	taco
	.word	-1840700269
	.word	super_slice
	.word	strikeMode
	.size	charging, .-charging
	.align	2
	.global	quickStrike
	.type	quickStrike, %function
quickStrike:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L151
	mov	r1, #67108864
	stmfd	sp!, {r4, r5, r6}
	ldr	r3, [r2, #16]
	ldr	r1, [r1, #304]
	add	r3, r3, #1
	tst	r1, #32
	str	r3, [r2, #16]
	bne	.L145
	ldr	r0, [r2, #4]
	sub	r1, r0, #1
	add	r3, r3, #1
	cmp	r1, #19
	str	r1, [r2, #4]
	str	r3, [r2, #16]
	bgt	.L146
	ldr	ip, .L151+4
	ldr	r4, [ip, #0]
	ldr	r5, .L151+8
	sub	r4, r4, #1
	sub	r1, r4, #1
	smull	r6, r5, r1, r5
	mov	r6, r1, asr #31
	rsb	r5, r6, r5, asr #3
	add	r5, r5, r5, asl #2
	cmp	r1, r5, asl #2
	ldreq	r1, .L151+12
	str	r0, [r2, #4]
	ldreq	r0, [r1, #0]
	subeq	r0, r0, #1
	str	r4, [ip, #0]
	streq	r0, [r1, #0]
.L146:
	ldr	r1, .L151+8
	smull	r0, r1, r3, r1
	mov	r0, r3, asr #31
	rsb	r1, r0, r1, asr #2
	add	r1, r1, r1, asl #2
	subs	r1, r3, r1, asl #1
	beq	.L150
.L145:
	mov	r1, #67108864
	ldr	r1, [r1, #304]
	tst	r1, #16
	bne	.L147
	ldr	r0, [r2, #4]
	add	r1, r0, #1
	add	r3, r3, #1
	cmp	r1, #100
	str	r1, [r2, #4]
	str	r3, [r2, #16]
	ble	.L148
	ldr	ip, .L151+4
	ldr	r4, [ip, #0]
	ldr	r6, .L151+8
	add	r4, r4, #1
	add	r1, r4, #1
	smull	r5, r6, r1, r6
	mov	r5, r1, asr #31
	rsb	r5, r5, r6, asr #3
	add	r5, r5, r5, asl #2
	cmp	r1, r5, asl #2
	ldr	r1, .L151
	str	r0, [r1, #4]
	ldreq	r1, .L151+12
	ldreq	r0, [r1, #0]
	addeq	r0, r0, #1
	str	r4, [ip, #0]
	streq	r0, [r1, #0]
.L148:
	ldr	r1, .L151+8
	smull	r6, r1, r3, r1
	mov	r0, r3, asr #31
	rsb	r1, r0, r1, asr #2
	add	r1, r1, r1, asl #2
	subs	r1, r3, r1, asl #1
	bne	.L147
	ldr	r0, [r2, #20]
	add	r0, r0, #1
	cmp	r0, #2
	str	r0, [r2, #20]
	ldrgt	r0, .L151
	strgt	r1, [r0, #20]
.L147:
	cmp	r3, #10
	ldrgt	r1, .L151+16
	movgt	r3, #0
	strgt	r3, [r1, #0]
	strgt	r3, [r2, #24]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L150:
	ldr	r0, [r2, #20]
	add	r0, r0, #1
	cmp	r0, #2
	str	r0, [r2, #20]
	ldrgt	r0, .L151
	strgt	r1, [r0, #20]
	b	.L145
.L152:
	.align	2
.L151:
	.word	taco
	.word	hOff
	.word	1717986919
	.word	BG_hOff
	.word	strikeMode
	.size	quickStrike, .-quickStrike
	.align	2
	.global	canMove
	.type	canMove, %function
canMove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldr	r4, .L174
	tst	r3, #32
	mov	r3, #0
	str	r3, [r4, #24]
	beq	.L166
	ldr	r5, .L174+4
	ldr	r6, .L174+8
.L154:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L156
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	add	r2, r1, #1
	add	r3, r3, #1
	cmp	r2, #100
	str	r2, [r4, #4]
	str	r3, [r4, #16]
	ble	.L157
	ldr	r0, [r5, #0]
	ldr	r7, .L174+12
	add	r0, r0, #1
	add	r2, r0, #1
	smull	ip, r7, r2, r7
	mov	ip, r2, asr #31
	rsb	ip, ip, r7, asr #3
	add	ip, ip, ip, asl #2
	cmp	r2, ip, asl #2
	ldr	r2, .L174
	str	r1, [r2, #4]
	ldreq	r2, [r6, #0]
	addeq	r2, r2, #1
	str	r0, [r5, #0]
	streq	r2, [r6, #0]
.L157:
	ldr	r2, .L174+12
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #2
	add	r2, r2, r2, asl #2
	subs	r3, r3, r2, asl #1
	beq	.L169
.L156:
	ldr	r3, .L174+16
	ldr	r3, [r3, #0]
	tst	r3, #64
	beq	.L158
	ldr	r2, .L174+20
	ldr	r2, [r2, #0]
	tst	r2, #64
	beq	.L170
.L158:
	tst	r3, #1
	beq	.L159
	ldr	r3, .L174+20
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L171
.L159:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #2
	beq	.L172
.L161:
	ldr	r2, [r3, #304]
	tst	r2, #32
	beq	.L162
	ldr	r3, [r3, #304]
	mvn	r3, r3
	ands	r3, r3, #16
	streq	r3, [r4, #20]
.L162:
	ldr	r3, .L174+24
	ldrh	r0, [r3, #0]
	ldr	r3, .L174+28
	ldrh	ip, [r5, #0]
	ldrh	r1, [r6, #0]
	ldrh	r2, [r3, #0]
	mov	r3, #67108864
	strh	ip, [r3, #20]	@ movhi
	strh	r0, [r3, #22]	@ movhi
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L166:
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	sub	r2, r1, #1
	add	r3, r3, #1
	cmp	r2, #19
	str	r2, [r4, #4]
	str	r3, [r4, #16]
	ble	.L167
	ldr	r5, .L174+4
	ldr	r6, .L174+8
.L155:
	ldr	r2, .L174+12
	smull	ip, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #2
	add	r2, r2, r2, asl #2
	subs	r3, r3, r2, asl #1
	bne	.L154
	ldr	r1, [r4, #20]
	add	r1, r1, #1
	cmp	r1, #2
	ldrgt	r2, .L174
	str	r1, [r4, #20]
	strgt	r3, [r2, #20]
	b	.L154
.L171:
	ldr	r3, .L174+32
	ldr	r3, [r3, #0]
	add	r3, r3, #12
	ldr	r3, [r3, #8]
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #24]
	beq	.L173
.L160:
	mov	r3, #0
	str	r3, [r4, #16]
	ldr	r3, .L174+36
	mov	r2, #3
	str	r2, [r3, #0]
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #2
	bne	.L161
.L172:
	mov	r3, #2
	str	r3, [r4, #24]
	mov	r3, #0
	str	r3, [r4, #16]
	ldr	r3, .L174+36
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L162
.L170:
	ldr	r2, [r4, #32]
	cmp	r2, #0
	mov	r2, #1
	str	r2, [r4, #8]
	ldrne	r2, .L174
	mvnne	r1, #0
	strne	r1, [r2, #8]
	b	.L158
.L169:
	ldr	r1, [r4, #20]
	add	r1, r1, #1
	cmp	r1, #2
	ldrgt	r2, .L174
	str	r1, [r4, #20]
	strgt	r3, [r2, #20]
	b	.L156
.L167:
	ldr	r5, .L174+4
	ldr	r0, [r5, #0]
	ldr	ip, .L174+12
	sub	r0, r0, #1
	sub	r2, r0, #1
	smull	r6, ip, r2, ip
	mov	r6, r2, asr #31
	rsb	ip, r6, ip, asr #3
	add	ip, ip, ip, asl #2
	cmp	r2, ip, asl #2
	ldreq	r6, .L174+8
	ldreq	r2, [r6, #0]
	subeq	r2, r2, #1
	str	r1, [r4, #4]
	str	r0, [r5, #0]
	ldrne	r6, .L174+8
	streq	r2, [r6, #0]
	b	.L155
.L173:
	ldr	r0, .L174+40
	mov	r1, #980
	mov	r2, #8000
	bl	playSoundA
	b	.L160
.L175:
	.align	2
.L174:
	.word	taco
	.word	hOff
	.word	BG_hOff
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	BG_vOff
	.word	dma
	.word	strikeMode
	.word	Sword_Swing
	.size	canMove, .-canMove
	.align	2
	.global	drawBlackScreen
	.type	drawBlackScreen, %function
drawBlackScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #100663296
	mov	r5, #16777216
	add	r3, r5, #1024
	mov	r1, #83886080
	add	r2, r2, #63488
	mov	r0, #3
	ldr	r4, .L177
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #4
	ldr	r1, [r2, #304]
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L177+4
	ldr	r0, .L177+8
	str	r1, [r3, #0]
	ldr	r3, .L177+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L177+16
	mov	r0, #3
	ldr	r2, [r3, #0]
	mov	r1, #83886080
	add	r3, r5, #19200
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L178:
	.align	2
.L177:
	.word	DMANow
	.word	buttons
	.word	titlePal
	.word	loadPalette
	.word	videoBuffer
	.size	drawBlackScreen, .-drawBlackScreen
	.align	2
	.global	drawArrows
	.type	drawArrows, %function
drawArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	drawBlackScreen
	ldr	r4, .L180
	mov	r0, #40
	mov	r1, #20
	ldr	r2, .L180+4
	mov	r3, #3
	mov	lr, pc
	bx	r4
	mov	r0, #60
	mov	r1, #10
	ldr	r2, .L180+8
	mov	r3, #3
	mov	lr, pc
	bx	r4
	mov	r0, #100
	mov	r1, #40
	ldr	r2, .L180+12
	mov	r3, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L181:
	.align	2
.L180:
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	drawArrows, .-drawArrows
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L188
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L183
	ldr	r2, .L188+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L186
.L183:
	tst	r3, #4
	beq	.L184
	ldr	r2, .L188+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L187
.L184:
	tst	r3, #1
	beq	.L182
	ldr	r3, .L188+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	bne	.L182
	ldr	r3, .L188+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	mov	r2, #6
	str	r2, [r3, #0]
	bl	setUpGameVar
	mov	r0, #4
	bl	drawRound
	bl	drawGameScreen
	ldmfd	sp!, {r4, lr}
	b	drawBrocolli
.L182:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L187:
	ldr	r3, .L188+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	mov	r2, #1
	str	r2, [r3, #0]
	bl	drawArrows
	bl	setUpGameVar
	ldr	r3, [r4, #0]
	b	.L184
.L186:
	ldr	r3, .L188+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L188+12
	mov	r2, #2
	str	r2, [r3, #0]
	bl	setUpGameVar
	mov	r0, #4
	bl	drawRound
	bl	drawGameScreen
	bl	drawBrocolli
	ldr	r3, [r4, #0]
	b	.L183
.L189:
	.align	2
.L188:
	.word	oldButtons
	.word	buttons
	.word	flipPage
	.word	state
	.size	start, .-start
	.align	2
	.global	drawPower
	.type	drawPower, %function
drawPower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	drawBlackScreen
	ldr	r4, .L191
	mov	r0, #40
	mov	r1, #20
	ldr	r2, .L191+4
	mov	r3, #3
	mov	lr, pc
	bx	r4
	mov	r0, #60
	mov	r1, #10
	ldr	r2, .L191+8
	mov	r3, #3
	mov	lr, pc
	bx	r4
	mov	r0, #100
	mov	r1, #40
	ldr	r2, .L191+12
	mov	r3, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L192:
	.align	2
.L191:
	.word	drawString4
	.word	.LC3
	.word	.LC4
	.word	.LC2
	.size	drawPower, .-drawPower
	.align	2
	.global	drawStartScreen
	.type	drawStartScreen, %function
drawStartScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	lr, .L194
	mov	r4, #0
	str	r4, [lr, #0]
	ldr	lr, .L194+4
	mov	ip, #2
	str	ip, [lr, #40]
	mov	r6, #100663296
	ldr	lr, .L194+8
	mov	r5, #16777216
	add	r6, r6, #63488
	add	r5, r5, #1024
	str	ip, [lr, #40]
	mov	r2, r6
	mov	r3, r5
	ldr	r7, .L194+12
	mov	r0, #3
	mov	r1, #83886080
	mov	lr, pc
	bx	r7
	mov	r2, r6
	mov	r3, r5
	mov	r1, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #4
	ldr	r1, [r2, #304]
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L194+16
	ldr	r0, .L194+20
	str	r1, [r3, #0]
	ldr	r3, .L194+24
	mov	lr, pc
	bx	r3
	ldr	r0, .L194+28
	ldr	r3, .L194+32
	mov	lr, pc
	bx	r3
	ldr	r5, .L194+36
	mov	r3, r4
	mov	r0, #100
	mov	r1, #60
	ldr	r2, .L194+40
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r0, #120
	mov	r1, #50
	ldr	r2, .L194+44
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r0, #140
	mov	r1, #50
	ldr	r2, .L194+48
	mov	lr, pc
	bx	r5
	mov	r1, #204800
	ldr	r0, .L194+52
	add	r1, r1, #62
	mov	r2, #8000
	mov	r3, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	playSoundB
.L195:
	.align	2
.L194:
	.word	state
	.word	taco
	.word	brocolli
	.word	DMANow
	.word	buttons
	.word	titlePal
	.word	loadPalette
	.word	titleBitmap
	.word	drawBackgroundImage4
	.word	drawString4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	Kung_Fu
	.size	drawStartScreen, .-drawStartScreen
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L201
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L197
	ldr	r2, .L201+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L199
.L197:
	tst	r3, #4
	beq	.L196
	ldr	r3, .L201+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L200
.L196:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L200:
	ldmfd	sp!, {r4, lr}
	b	drawStartScreen
.L199:
	ldr	r3, .L201+8
	mov	r2, #2
	str	r2, [r3, #0]
	bl	drawGameScreen
	ldr	r3, [r4, #0]
	b	.L197
.L202:
	.align	2
.L201:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	drawLoseScreen
	.type	drawLoseScreen, %function
drawLoseScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r6, #67108864
	ldrh	sl, [r6, #0]
	ldr	ip, .L204
	mov	r8, #100663296
	mov	r5, #16777216
	mov	lr, #5
	add	r7, r8, #63488
	add	r5, r5, #1024
	bic	sl, sl, #4608
	str	lr, [ip, #0]
	ldr	r4, .L204+4
	mov	r0, #3
	mov	r1, #83886080
	mov	r2, r7
	mov	r3, r5
	strh	sl, [r6, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r1, #83886080
	mov	r2, r7
	mov	r3, r5
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L204+8
	mov	r2, r8
	mov	r3, #5184
	mov	lr, pc
	bx	r4
	mov	r2, r7
	mov	r3, #640
	mov	r0, #3
	ldr	r1, .L204+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L204+16
	mov	r3, #0
	str	r3, [r2, #0]
	strh	r3, [r6, #18]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L205:
	.align	2
.L204:
	.word	state
	.word	DMANow
	.word	loseTiles
	.word	loseMap
	.word	hOff
	.size	drawLoseScreen, .-drawLoseScreen
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L212
	stmfd	sp!, {r4, lr}
	ldr	r3, [r2, #0]
	cmp	r3, #18
	bgt	.L207
	add	r1, r3, #1
	ldr	r3, .L212+4
	smull	r0, r3, r1, r3
	mov	r0, r1, asr #31
	rsb	r3, r0, r3, asr #3
	add	r3, r3, r3, asl #2
	sub	r3, r1, r3, asl #2
	str	r3, [r2, #0]
.L207:
	ldr	r4, .L212+8
	ldr	r2, [r4, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r1, #67108864
	tst	r2, #8
	strh	r3, [r1, #16]	@ movhi
	beq	.L208
	ldr	r3, .L212+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L210
.L208:
	tst	r2, #4
	beq	.L206
	ldr	r3, .L212+12
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L211
.L206:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L211:
	ldmfd	sp!, {r4, lr}
	b	drawLoseScreen
.L210:
	bl	drawStartScreen
	ldr	r2, [r4, #0]
	b	.L208
.L213:
	.align	2
.L212:
	.word	hOff
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	mechanics
	.type	mechanics, %function
mechanics:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L229
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldrgt	r5, .L229+4
	ble	.L227
.L215:
	ldr	r3, [r5, #36]
	cmp	r3, #0
	ldr	r3, .L229+4
	ble	.L228
.L217:
	ldr	r2, .L229+8
	ldr	r3, [r2, #0]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L214
.L224:
	.word	.L220
	.word	.L221
	.word	.L222
	.word	.L223
.L222:
	ldr	r3, [r4, #16]
	ldr	r1, .L229+12
	add	r3, r3, #1
	smull	r0, r1, r3, r1
	mov	r0, r3, asr #31
	rsb	r1, r0, r1, asr #1
	add	r0, r1, r1, asl #2
	add	r1, r1, r0, asl #1
	subs	r1, r3, r1
	str	r3, [r4, #16]
	streq	r1, [r2, #0]
.L214:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L223:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	quickStrike
.L221:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	charging
.L220:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, lr}
	b	canMove
.L228:
	ldr	r2, [r3, #40]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #40]
	bne	.L218
	ldr	r3, .L229+16
	mov	r2, #4
	str	r2, [r3, #0]
	bl	stopSound
	bl	drawWinScreen
	b	.L217
.L227:
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #40]
	bne	.L216
	ldr	r3, .L229+16
	mov	r2, #5
	str	r2, [r3, #0]
	ldr	r5, .L229+4
	bl	stopSound
	bl	drawLoseScreen
	b	.L215
.L216:
	ldr	r5, .L229+4
	ldr	r0, [r5, #40]
	add	r0, r3, r0
	bl	drawRound
	bl	setUpGameVar
	bl	drawGameScreen
	b	.L215
.L218:
	ldr	r0, [r4, #40]
	add	r0, r2, r0
	bl	drawRound
	bl	setUpGameVar
	bl	drawGameScreen
	b	.L217
.L230:
	.align	2
.L229:
	.word	taco
	.word	brocolli
	.word	strikeMode
	.word	780903145
	.word	state
	.size	mechanics, .-mechanics
	.align	2
	.global	runTutorial
	.type	runTutorial, %function
runTutorial:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	mechanics
	bl	controlDrawTaco
	ldmfd	sp!, {r4, lr}
	b	dmaShadowOAM
	.size	runTutorial, .-runTutorial
	.align	2
	.global	tutorial
	.type	tutorial, %function
tutorial:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L245
	ldr	r3, [r5, #0]
	cmp	r3, #1
	beq	.L241
	cmp	r3, #2
	ldreq	r4, .L245+4
	beq	.L236
	cmp	r3, #0
	bne	.L232
	ldr	r4, .L245+4
	ldr	r6, .L245+8
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #0]
	tst	r3, #8
	bne	.L242
.L235:
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L236
	ldr	r3, .L245+12
	ldr	r6, [r3, #0]
	ands	r6, r6, #8
	beq	.L243
.L236:
	bl	runTutorial
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L232
	ldr	r3, .L245+12
	ldr	r3, [r3, #0]
	ands	r3, r3, #8
	beq	.L244
.L232:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L241:
	ldr	r6, .L245+8
	ldr	r4, .L245+4
	b	.L235
.L244:
	ldr	r2, .L245+16
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	drawStartScreen
.L242:
	ldr	r3, .L245+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	bne	.L235
	mov	r3, #1
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	drawPower
.L243:
	mov	r3, #2
	str	r3, [r5, #0]
	bl	drawTutrorialScreen
	ldr	r3, .L245+20
	str	r6, [r3, #0]
	ldr	r3, .L245+24
	str	r6, [r3, #0]
	b	.L232
.L246:
	.align	2
.L245:
	.word	.LANCHOR0
	.word	oldButtons
	.word	waitForVblank
	.word	buttons
	.word	state
	.word	BG_vOff
	.word	BG_hOff
	.size	tutorial, .-tutorial
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L250
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L248
	ldr	r3, .L250+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L249
.L248:
	bl	controlDrawTaco
	bl	drawBrocolli
	bl	mechanics
	bl	BroclliAI
	bl	contactHandler
	bl	drawHealthBars
	ldmfd	sp!, {r4, lr}
	b	dmaShadowOAM
.L249:
	bl	hideSprites
	bl	drawPauseScreen
	b	.L248
.L251:
	.align	2
.L250:
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	potatoh
	.type	potatoh, %function
potatoh:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L255
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L253
	ldr	r3, .L255+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L254
.L253:
	bl	controlDrawTaco
	ldr	r1, .L255+8
	ldr	r3, .L255+12
	mov	r0, #100
	mvn	r2, #16256
	str	r0, [r1, #4]
	sub	r2, r2, #27
	ldrh	r1, [r1, #0]
	strh	r2, [r3, #10]	@ movhi
	mov	r2, #536	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	bl	mechanics
	bl	contactHandler
	bl	drawHealthBars
	ldmfd	sp!, {r4, lr}
	b	dmaShadowOAM
.L254:
	bl	hideSprites
	bl	drawPauseScreen
	b	.L253
.L256:
	.align	2
.L255:
	.word	oldButtons
	.word	buttons
	.word	brocolli
	.word	shadowOAM
	.size	potatoh, .-potatoh
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L260
	ldr	r3, [r2, #0]
	cmp	r3, #18
	bgt	.L258
	add	r1, r3, #1
	ldr	r3, .L260+4
	smull	r0, r3, r1, r3
	mov	r0, r1, asr #31
	rsb	r3, r0, r3, asr #3
	add	r3, r3, r3, asl #2
	sub	r3, r1, r3, asl #2
	str	r3, [r2, #0]
.L258:
	ldr	r2, .L260+8
	ldr	r2, [r2, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	tst	r2, #8
	mov	r2, #67108864
	strh	r3, [r2, #16]	@ movhi
	bxeq	lr
	ldr	r3, .L260+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	drawStartScreen
.L261:
	.align	2
.L260:
	.word	hOff
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bl	initialize
	bl	drawStartScreen
	ldr	r9, .L273
	ldr	r6, .L273+4
	ldr	sl, .L273+8
	ldr	r8, .L273+12
	ldr	r5, .L273+16
	ldr	r4, .L273+20
	mov	r7, #67108864
.L272:
	ldr	r1, [r6, #0]
	ldr	r2, [r7, #304]
	ldr	r3, [sl, #0]
	str	r1, [r9, #0]
	str	r2, [r6, #0]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L263
.L271:
	.word	.L264
	.word	.L265
	.word	.L266
	.word	.L267
	.word	.L268
	.word	.L269
	.word	.L270
.L269:
	bl	lose
.L263:
	mov	lr, pc
	bx	r8
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #0]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r2, [r5, #0]
	str	r3, [r4, #0]
	b	.L272
.L270:
	bl	potatoh
	b	.L263
.L268:
	bl	win
	b	.L263
.L267:
	bl	pause
	b	.L263
.L266:
	bl	game
	b	.L263
.L265:
	bl	tutorial
	b	.L263
.L264:
	bl	start
	b	.L263
.L274:
	.align	2
.L273:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	waitForVblank
	.word	vbCountA
	.word	vbCountB
	.size	main, .-main
	.global	tutState
	.global	collMapSize
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	BG_hOff,4,4
	.comm	BG_vOff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundA,28,4
	.comm	soundB,28,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.comm	taco,44,4
	.comm	brocolli,44,4
	.comm	shadowOAM,1024,4
	.comm	bigRow,4,4
	.comm	bigCol,4,4
	.comm	state,4,4
	.comm	brocMode,4,4
	.comm	strikeMode,4,4
	.data
	.align	2
	.type	collMapSize, %object
	.size	collMapSize, 4
collMapSize:
	.word	256
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press Left and Right Arrows to move\000"
.LC1:
	.ascii	"Press A for quick strike, and to block\000"
	.space	1
.LC2:
	.ascii	"Press Enter to Continue\000"
.LC3:
	.ascii	"Press and hold B for a POWER STRIKE\000"
.LC4:
	.ascii	"You are vulnerable while charging\000"
	.space	2
.LC5:
	.ascii	"Press START for GAME\000"
	.space	3
.LC6:
	.ascii	"Press SELECT for TUTORIAL\000"
	.space	2
.LC7:
	.ascii	"Press A for POH-TAAAH-TOH\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	tutState, %object
	.size	tutState, 4
tutState:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
