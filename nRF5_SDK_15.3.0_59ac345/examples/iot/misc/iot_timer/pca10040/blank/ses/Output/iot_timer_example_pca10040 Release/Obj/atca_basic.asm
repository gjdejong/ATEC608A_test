	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"atca_basic.c"
	.text
.Ltext0:
	.section	.text.atcab_version,"ax",%progbits
	.align	1
	.global	atcab_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_version, %function
atcab_version:
.LFB0:
	.file 1 "C:\\localrep\\ATEC608A_test\\nRF5_SDK_15.3.0_59ac345\\examples\\iot\\misc\\iot_timer\\cryptoauthlib\\lib\\basic\\atca_basic.c"
	.loc 1 54 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	push	{r3, lr}
.LCFI0:
	.loc 1 55 0
	ldr	r1, .L2
	bl	strcpy
.LVL1:
	.loc 1 57 0
	movs	r0, #0
	pop	{r3, pc}
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
.LFE0:
	.size	atcab_version, .-atcab_version
	.section	.text.atcab_release,"ax",%progbits
	.align	1
	.global	atcab_release
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_release, %function
atcab_release:
.LFB3:
	.loc 1 138 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI1:
	.loc 1 147 0
	ldr	r0, .L5
	bl	deleteATCADevice
.LVL2:
	.loc 1 150 0
	movs	r0, #0
	pop	{r3, pc}
.L6:
	.align	2
.L5:
	.word	.LANCHOR1
.LFE3:
	.size	atcab_release, .-atcab_release
	.section	.text.atcab_init,"ax",%progbits
	.align	1
	.global	atcab_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_init, %function
atcab_init:
.LFB1:
	.loc 1 66 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL3:
	push	{r0, r1, r2, r4, r5, lr}
.LCFI2:
	.loc 1 70 0
	ldr	r4, .L15
	ldr	r3, [r4]
	.loc 1 66 0
	mov	r5, r0
	.loc 1 70 0
	cbz	r3, .L8
	.loc 1 72 0
	bl	atcab_release
.LVL4:
.L8:
	.loc 1 85 0
	mov	r0, r5
	bl	newATCADevice
.LVL5:
	str	r0, [r4]
	.loc 1 86 0
	cbz	r0, .L10
	.loc 1 92 0
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L11
	.loc 1 94 0
	ldr	r3, [r0]
	movs	r2, #1
	movs	r1, #0
	str	r2, [sp]
	add	r3, r3, r2
	mov	r0, r1
	movs	r2, #19
	bl	atcab_read_bytes_zone
.LVL6:
	cbnz	r0, .L9
	.loc 1 98 0
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	bic	r3, r3, #7
	strb	r3, [r2, #1]
.LVL7:
.L9:
	.loc 1 102 0
	add	sp, sp, #12
.LCFI3:
	@ sp needed
	pop	{r4, r5, pc}
.LVL8:
.L10:
.LCFI4:
	.loc 1 88 0
	movs	r0, #225
	b	.L9
.L11:
	.loc 1 101 0
	movs	r0, #0
	b	.L9
.L16:
	.align	2
.L15:
	.word	.LANCHOR1
.LFE1:
	.size	atcab_init, .-atcab_init
	.section	.text.atcab_init_device,"ax",%progbits
	.align	1
	.global	atcab_init_device
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_init_device, %function
atcab_init_device:
.LFB2:
	.loc 1 111 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL9:
	push	{r3, r4, r5, lr}
.LCFI5:
	.loc 1 112 0
	mov	r5, r0
	cbz	r0, .L22
	.loc 1 117 0
	bl	atGetCommands
.LVL10:
	cbnz	r0, .L19
.L20:
	.loc 1 119 0
	movs	r0, #225
.L18:
	.loc 1 131 0
	pop	{r3, r4, r5, pc}
.LVL11:
.L19:
	.loc 1 117 0 discriminator 1
	mov	r0, r5
	bl	atGetIFace
.LVL12:
	cmp	r0, #0
	beq	.L20
	.loc 1 123 0
	ldr	r4, .L29
	ldr	r2, [r4]
	cbz	r2, .L21
	.loc 1 125 0
	bl	atcab_release
.LVL13:
.L21:
	.loc 1 128 0
	str	r5, [r4]
	.loc 1 130 0
	movs	r0, #0
	b	.L18
.LVL14:
.L22:
	.loc 1 114 0
	movs	r0, #226
.LVL15:
	b	.L18
.L30:
	.align	2
.L29:
	.word	.LANCHOR1
.LFE2:
	.size	atcab_init_device, .-atcab_init_device
	.section	.text.atcab_get_device,"ax",%progbits
	.align	1
	.global	atcab_get_device
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_get_device, %function
atcab_get_device:
.LFB4:
	.loc 1 156 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 158 0
	ldr	r3, .L32
	ldr	r0, [r3]
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR1
.LFE4:
	.size	atcab_get_device, .-atcab_get_device
	.section	.text.atcab_get_device_type,"ax",%progbits
	.align	1
	.global	atcab_get_device_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_get_device_type, %function
atcab_get_device_type:
.LFB5:
	.loc 1 164 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 165 0
	ldr	r3, .L37
	ldr	r3, [r3]
	cbz	r3, .L36
	.loc 1 167 0
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	bx	lr
.L36:
	.loc 1 171 0
	movs	r0, #32
	.loc 1 173 0
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR1
.LFE5:
	.size	atcab_get_device_type, .-atcab_get_device_type
	.section	.text.atcab_wakeup,"ax",%progbits
	.align	1
	.global	atcab_wakeup
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_wakeup, %function
atcab_wakeup:
.LFB6:
	.loc 1 179 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 180 0
	ldr	r3, .L41
	ldr	r3, [r3]
	cbz	r3, .L40
	.loc 1 185 0
	ldr	r0, [r3, #4]
	b	atwake
.LVL16:
.L40:
	.loc 1 186 0
	movs	r0, #225
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR1
.LFE6:
	.size	atcab_wakeup, .-atcab_wakeup
	.section	.text.atcab_idle,"ax",%progbits
	.align	1
	.global	atcab_idle
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_idle, %function
atcab_idle:
.LFB7:
	.loc 1 192 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 193 0
	ldr	r3, .L45
	ldr	r3, [r3]
	cbz	r3, .L44
	.loc 1 198 0
	ldr	r0, [r3, #4]
	b	atidle
.LVL17:
.L44:
	.loc 1 199 0
	movs	r0, #225
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR1
.LFE7:
	.size	atcab_idle, .-atcab_idle
	.section	.text.atcab_sleep,"ax",%progbits
	.align	1
	.global	atcab_sleep
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_sleep, %function
atcab_sleep:
.LFB8:
	.loc 1 205 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 206 0
	ldr	r3, .L49
	ldr	r3, [r3]
	cbz	r3, .L48
	.loc 1 211 0
	ldr	r0, [r3, #4]
	b	atsleep
.LVL18:
.L48:
	.loc 1 212 0
	movs	r0, #225
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR1
.LFE8:
	.size	atcab_sleep, .-atcab_sleep
	.section	.text.atcab_cfg_discover,"ax",%progbits
	.align	1
	.global	atcab_cfg_discover
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_cfg_discover, %function
atcab_cfg_discover:
.LFB9:
	.loc 1 229 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL19:
	push	{r4, r5, r6, r7, r8, r9, lr}
.LCFI6:
	sub	sp, sp, #28
.LCFI7:
	.loc 1 253 0
	add	r6, sp, #8
	.loc 1 231 0
	movs	r4, #0
	.loc 1 253 0
	movs	r2, #16
	.loc 1 229 0
	mov	r8, r0
	mov	r7, r1
	.loc 1 253 0
	mov	r0, r6
.LVL20:
	mov	r1, #-1
.LVL21:
	.loc 1 231 0
	str	r4, [sp, #4]
.LVL22:
	.loc 1 253 0
	bl	memset
.LVL23:
	.loc 1 254 0
	movs	r1, #4
	mov	r0, r6
	bl	hal_swi_discover_buses
.LVL24:
	.loc 1 230 0
	mov	r5, r4
	.loc 1 259 0
	mov	r9, #48
.LVL25:
.L52:
	.loc 1 255 0 discriminator 3
	cmp	r7, r5
	ble	.L60
	.loc 1 257 0
	ldr	r0, [r6, r4, lsl #2]
	adds	r3, r0, #1
	beq	.L53
	.loc 1 259 0
	mla	r1, r9, r5, r8
	add	r2, sp, #4
	bl	hal_swi_discover_devices
.LVL26:
	.loc 1 260 0
	ldr	r3, [sp, #4]
	add	r5, r5, r3
.LVL27:
.L53:
	.loc 1 255 0 discriminator 2
	adds	r4, r4, #1
.LVL28:
	cmp	r4, #4
	bne	.L52
.L60:
	.loc 1 308 0
	movs	r0, #0
	add	sp, sp, #28
.LCFI8:
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.LFE9:
	.size	atcab_cfg_discover, .-atcab_cfg_discover
	.section	.text._atcab_exit,"ax",%progbits
	.align	1
	.global	_atcab_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_atcab_exit, %function
_atcab_exit:
.LFB10:
	.loc 1 314 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 315 0
	b	atcab_idle
.LVL29:
.LFE10:
	.size	_atcab_exit, .-_atcab_exit
	.section	.text.atcab_get_addr,"ax",%progbits
	.align	1
	.global	atcab_get_addr
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_get_addr, %function
atcab_get_addr:
.LFB11:
	.loc 1 328 0
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL30:
	push	{r4, r5, lr}
.LCFI9:
	.loc 1 328 0
	ldr	r4, [sp, #12]
	.loc 1 330 0
	and	r5, r0, #3
.LVL31:
	.loc 1 332 0
	cbz	r4, .L66
	.loc 1 336 0
	cmp	r5, #3
	beq	.L66
	and	r3, r3, #7
.LVL32:
	.loc 1 346 0
	cmp	r5, #2
	.loc 1 354 0
	it	eq
	orreq	r3, r3, r1, lsl #3
	.loc 1 343 0
	mov	r0, #0
.LVL33:
	.loc 1 349 0
	ite	ne
	orrne	r3, r3, r2, lsl #3
	.loc 1 355 0
	orreq	r3, r3, r2, lsl #8
	.loc 1 343 0
	strh	r0, [r4]	@ movhi
.LVL34:
	.loc 1 355 0
	strh	r3, [r4]	@ movhi
.L63:
	.loc 1 361 0
	pop	{r4, r5, pc}
.LVL35:
.L66:
	.loc 1 334 0
	movs	r0, #226
.LVL36:
	b	.L63
.LFE11:
	.size	atcab_get_addr, .-atcab_get_addr
	.section	.text.atcab_get_zone_size,"ax",%progbits
	.align	1
	.global	atcab_get_zone_size
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	atcab_get_zone_size, %function
atcab_get_zone_size:
.LFB12:
	.loc 1 373 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL37:
	.loc 1 373 0
	mov	r3, r0
	.loc 1 376 0
	cbz	r2, .L81
	.loc 1 381 0
	ldr	r0, .L92
.LVL38:
	ldr	r0, [r0]
	ldr	r0, [r0, #4]
	ldr	r0, [r0, #4]
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	cbnz	r0, .L70
	.loc 1 383 0
	cmp	r3, #1
	beq	.L71
	bcc	.L72
	cmp	r3, #2
	beq	.L73
.L81:
	.loc 1 378 0
	movs	r0, #226
	.loc 1 420 0
	bx	lr
.L72:
	.loc 1 385 0
	movs	r3, #88
.L90:
	.loc 1 387 0
	str	r3, [r2]
	bx	lr
.L71:
	.loc 1 386 0
	movs	r3, #64
.L91:
	.loc 1 408 0
	str	r3, [r2]
	.loc 1 374 0
	movs	r0, #0
	bx	lr
.L73:
	.loc 1 387 0
	movs	r3, #32
	b	.L90
.L70:
	.loc 1 393 0
	cmp	r3, #1
	beq	.L71
	bcc	.L74
	cmp	r3, #2
	bne	.L81
	.loc 1 398 0
	cmp	r1, #7
	bhi	.L76
	.loc 1 400 0
	movs	r3, #36
	b	.L91
.L74:
	.loc 1 395 0
	movs	r3, #128
	b	.L91
.L76:
	.loc 1 402 0
	cmp	r1, #8
	bne	.L77
	.loc 1 404 0
	mov	r3, #416
	b	.L91
.L77:
	.loc 1 406 0
	cmp	r1, #15
	bhi	.L81
	.loc 1 408 0
	movs	r3, #72
	b	.L91
.L93:
	.align	2
.L92:
	.word	.LANCHOR1
.LFE12:
	.size	atcab_get_zone_size, .-atcab_get_zone_size
	.global	_gDevice
	.global	atca_version
	.section	.bss._gDevice,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_gDevice, %object
	.size	_gDevice, 4
_gDevice:
	.space	4
	.section	.rodata.atca_version,"a",%progbits
	.set	.LANCHOR0,. + 0
	.type	atca_version, %object
	.size	atca_version, 9
atca_version:
	.ascii	"20190304\000"
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI1-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI2-.LFB1
	.byte	0xe
	.uleb128 0x18
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xa
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xb
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI5-.LFB2
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI6-.LFB9
	.byte	0xe
	.uleb128 0x1c
	.byte	0x84
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x1c
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI9-.LFB11
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.align	2
.LEFDE24:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 3.40/include/__crossworks.h"
	.file 3 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 3.40/include/stddef.h"
	.file 4 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 3.40/include/stdint.h"
	.file 5 "../../../cryptoauthlib/lib/atca_status.h"
	.file 6 "../../../cryptoauthlib/lib/atca_devtypes.h"
	.file 7 "../../../cryptoauthlib/lib/atca_command.h"
	.file 8 "../../../cryptoauthlib/lib/atca_iface.h"
	.file 9 "../../../cryptoauthlib/lib/atca_device.h"
	.file 10 "../../../cryptoauthlib/lib/atca_cfgs.h"
	.file 11 "../../../cryptoauthlib/lib/basic/atca_helpers.h"
	.file 12 "C:\\localrep\\ATEC608A_test\\nRF5_SDK_15.3.0_59ac345\\examples\\iot\\misc\\iot_timer\\cryptoauthlib\\lib\\basic\\atca_basic.h"
	.file 13 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 3.40/include/string.h"
	.file 14 "../../../cryptoauthlib/lib/hal/atca_hal.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xff4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF1275
	.byte	0xc
	.4byte	.LASF1276
	.4byte	.LASF1277
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1086
	.byte	0x8
	.byte	0x2
	.byte	0x7e
	.4byte	0x50
	.uleb128 0x4
	.4byte	.LASF1034
	.byte	0x2
	.byte	0x7f
	.4byte	0x50
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1035
	.byte	0x2
	.byte	0x80
	.4byte	0x57
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.4byte	.LASF1036
	.uleb128 0x7
	.4byte	0x50
	.4byte	0x77
	.uleb128 0x8
	.4byte	0x77
	.uleb128 0x8
	.4byte	0x89
	.uleb128 0x8
	.4byte	0x90
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x7d
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1037
	.uleb128 0xa
	.4byte	0x7d
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1038
	.uleb128 0x9
	.byte	0x4
	.4byte	0x2b
	.uleb128 0x7
	.4byte	0x50
	.4byte	0xb4
	.uleb128 0x8
	.4byte	0xb4
	.uleb128 0x8
	.4byte	0xba
	.uleb128 0x8
	.4byte	0x89
	.uleb128 0x8
	.4byte	0x90
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x89
	.uleb128 0x9
	.byte	0x4
	.4byte	0x84
	.uleb128 0xb
	.byte	0x58
	.byte	0x2
	.byte	0x86
	.4byte	0x249
	.uleb128 0x4
	.4byte	.LASF1039
	.byte	0x2
	.byte	0x88
	.4byte	0xba
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1040
	.byte	0x2
	.byte	0x89
	.4byte	0xba
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF1041
	.byte	0x2
	.byte	0x8a
	.4byte	0xba
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF1042
	.byte	0x2
	.byte	0x8c
	.4byte	0xba
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF1043
	.byte	0x2
	.byte	0x8d
	.4byte	0xba
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF1044
	.byte	0x2
	.byte	0x8e
	.4byte	0xba
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF1045
	.byte	0x2
	.byte	0x8f
	.4byte	0xba
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF1046
	.byte	0x2
	.byte	0x90
	.4byte	0xba
	.byte	0x1c
	.uleb128 0x4
	.4byte	.LASF1047
	.byte	0x2
	.byte	0x91
	.4byte	0xba
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF1048
	.byte	0x2
	.byte	0x92
	.4byte	0xba
	.byte	0x24
	.uleb128 0x4
	.4byte	.LASF1049
	.byte	0x2
	.byte	0x94
	.4byte	0x7d
	.byte	0x28
	.uleb128 0x4
	.4byte	.LASF1050
	.byte	0x2
	.byte	0x95
	.4byte	0x7d
	.byte	0x29
	.uleb128 0x4
	.4byte	.LASF1051
	.byte	0x2
	.byte	0x96
	.4byte	0x7d
	.byte	0x2a
	.uleb128 0x4
	.4byte	.LASF1052
	.byte	0x2
	.byte	0x97
	.4byte	0x7d
	.byte	0x2b
	.uleb128 0x4
	.4byte	.LASF1053
	.byte	0x2
	.byte	0x98
	.4byte	0x7d
	.byte	0x2c
	.uleb128 0x4
	.4byte	.LASF1054
	.byte	0x2
	.byte	0x99
	.4byte	0x7d
	.byte	0x2d
	.uleb128 0x4
	.4byte	.LASF1055
	.byte	0x2
	.byte	0x9a
	.4byte	0x7d
	.byte	0x2e
	.uleb128 0x4
	.4byte	.LASF1056
	.byte	0x2
	.byte	0x9b
	.4byte	0x7d
	.byte	0x2f
	.uleb128 0x4
	.4byte	.LASF1057
	.byte	0x2
	.byte	0x9c
	.4byte	0x7d
	.byte	0x30
	.uleb128 0x4
	.4byte	.LASF1058
	.byte	0x2
	.byte	0x9d
	.4byte	0x7d
	.byte	0x31
	.uleb128 0x4
	.4byte	.LASF1059
	.byte	0x2
	.byte	0x9e
	.4byte	0x7d
	.byte	0x32
	.uleb128 0x4
	.4byte	.LASF1060
	.byte	0x2
	.byte	0x9f
	.4byte	0x7d
	.byte	0x33
	.uleb128 0x4
	.4byte	.LASF1061
	.byte	0x2
	.byte	0xa0
	.4byte	0x7d
	.byte	0x34
	.uleb128 0x4
	.4byte	.LASF1062
	.byte	0x2
	.byte	0xa1
	.4byte	0x7d
	.byte	0x35
	.uleb128 0x4
	.4byte	.LASF1063
	.byte	0x2
	.byte	0xa6
	.4byte	0xba
	.byte	0x38
	.uleb128 0x4
	.4byte	.LASF1064
	.byte	0x2
	.byte	0xa7
	.4byte	0xba
	.byte	0x3c
	.uleb128 0x4
	.4byte	.LASF1065
	.byte	0x2
	.byte	0xa8
	.4byte	0xba
	.byte	0x40
	.uleb128 0x4
	.4byte	.LASF1066
	.byte	0x2
	.byte	0xa9
	.4byte	0xba
	.byte	0x44
	.uleb128 0x4
	.4byte	.LASF1067
	.byte	0x2
	.byte	0xaa
	.4byte	0xba
	.byte	0x48
	.uleb128 0x4
	.4byte	.LASF1068
	.byte	0x2
	.byte	0xab
	.4byte	0xba
	.byte	0x4c
	.uleb128 0x4
	.4byte	.LASF1069
	.byte	0x2
	.byte	0xac
	.4byte	0xba
	.byte	0x50
	.uleb128 0x4
	.4byte	.LASF1070
	.byte	0x2
	.byte	0xad
	.4byte	0xba
	.byte	0x54
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1080
	.byte	0x2
	.byte	0xae
	.4byte	0xc0
	.uleb128 0xa
	.4byte	0x249
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1071
	.uleb128 0xa
	.4byte	0x259
	.uleb128 0xb
	.byte	0x20
	.byte	0x2
	.byte	0xc4
	.4byte	0x2ce
	.uleb128 0x4
	.4byte	.LASF1072
	.byte	0x2
	.byte	0xc6
	.4byte	0x2e2
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1073
	.byte	0x2
	.byte	0xc7
	.4byte	0x2f7
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF1074
	.byte	0x2
	.byte	0xc8
	.4byte	0x2f7
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF1075
	.byte	0x2
	.byte	0xcb
	.4byte	0x311
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF1076
	.byte	0x2
	.byte	0xcc
	.4byte	0x326
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF1077
	.byte	0x2
	.byte	0xcd
	.4byte	0x326
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF1078
	.byte	0x2
	.byte	0xd0
	.4byte	0x32c
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF1079
	.byte	0x2
	.byte	0xd1
	.4byte	0x332
	.byte	0x1c
	.byte	0
	.uleb128 0x7
	.4byte	0x50
	.4byte	0x2e2
	.uleb128 0x8
	.4byte	0x50
	.uleb128 0x8
	.4byte	0x50
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x2ce
	.uleb128 0x7
	.4byte	0x50
	.4byte	0x2f7
	.uleb128 0x8
	.4byte	0x50
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x2e8
	.uleb128 0x7
	.4byte	0x50
	.4byte	0x311
	.uleb128 0x8
	.4byte	0x57
	.uleb128 0x8
	.4byte	0x50
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x2fd
	.uleb128 0x7
	.4byte	0x57
	.4byte	0x326
	.uleb128 0x8
	.4byte	0x57
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x317
	.uleb128 0x9
	.byte	0x4
	.4byte	0x5e
	.uleb128 0x9
	.byte	0x4
	.4byte	0x96
	.uleb128 0xc
	.4byte	.LASF1081
	.byte	0x2
	.byte	0xd2
	.4byte	0x265
	.uleb128 0xa
	.4byte	0x338
	.uleb128 0xb
	.byte	0xc
	.byte	0x2
	.byte	0xd4
	.4byte	0x375
	.uleb128 0x4
	.4byte	.LASF1082
	.byte	0x2
	.byte	0xd5
	.4byte	0xba
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1083
	.byte	0x2
	.byte	0xd6
	.4byte	0x375
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF1084
	.byte	0x2
	.byte	0xd7
	.4byte	0x37b
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x254
	.uleb128 0x9
	.byte	0x4
	.4byte	0x343
	.uleb128 0xc
	.4byte	.LASF1085
	.byte	0x2
	.byte	0xd8
	.4byte	0x348
	.uleb128 0xa
	.4byte	0x381
	.uleb128 0x3
	.4byte	.LASF1087
	.byte	0x14
	.byte	0x2
	.byte	0xdc
	.4byte	0x3aa
	.uleb128 0x4
	.4byte	.LASF1088
	.byte	0x2
	.byte	0xdd
	.4byte	0x3aa
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x3ba
	.4byte	0x3ba
	.uleb128 0xe
	.4byte	0x89
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x38c
	.uleb128 0xf
	.4byte	.LASF1089
	.byte	0x2
	.2byte	0x106
	.4byte	0x391
	.uleb128 0xf
	.4byte	.LASF1090
	.byte	0x2
	.2byte	0x10d
	.4byte	0x38c
	.uleb128 0xf
	.4byte	.LASF1091
	.byte	0x2
	.2byte	0x110
	.4byte	0x343
	.uleb128 0xf
	.4byte	.LASF1092
	.byte	0x2
	.2byte	0x111
	.4byte	0x343
	.uleb128 0xd
	.4byte	0x260
	.4byte	0x400
	.uleb128 0xe
	.4byte	0x89
	.byte	0x7f
	.byte	0
	.uleb128 0xa
	.4byte	0x3f0
	.uleb128 0xf
	.4byte	.LASF1093
	.byte	0x2
	.2byte	0x113
	.4byte	0x400
	.uleb128 0xd
	.4byte	0x84
	.4byte	0x41c
	.uleb128 0x10
	.byte	0
	.uleb128 0xa
	.4byte	0x411
	.uleb128 0xf
	.4byte	.LASF1094
	.byte	0x2
	.2byte	0x115
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1095
	.byte	0x2
	.2byte	0x116
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1096
	.byte	0x2
	.2byte	0x117
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1097
	.byte	0x2
	.2byte	0x118
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1098
	.byte	0x2
	.2byte	0x11a
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1099
	.byte	0x2
	.2byte	0x11b
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1100
	.byte	0x2
	.2byte	0x11c
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1101
	.byte	0x2
	.2byte	0x11d
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1102
	.byte	0x2
	.2byte	0x11e
	.4byte	0x41c
	.uleb128 0xf
	.4byte	.LASF1103
	.byte	0x2
	.2byte	0x11f
	.4byte	0x41c
	.uleb128 0x7
	.4byte	0x50
	.4byte	0x4a8
	.uleb128 0x8
	.4byte	0x4a8
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4b3
	.uleb128 0x11
	.4byte	.LASF1278
	.uleb128 0xa
	.4byte	0x4ae
	.uleb128 0xf
	.4byte	.LASF1104
	.byte	0x2
	.2byte	0x135
	.4byte	0x4c4
	.uleb128 0x9
	.byte	0x4
	.4byte	0x499
	.uleb128 0x7
	.4byte	0x50
	.4byte	0x4d9
	.uleb128 0x8
	.4byte	0x4d9
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4ae
	.uleb128 0xf
	.4byte	.LASF1105
	.byte	0x2
	.2byte	0x136
	.4byte	0x4eb
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4ca
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF1106
	.uleb128 0x12
	.4byte	.LASF1107
	.byte	0x2
	.2byte	0x14d
	.4byte	0x504
	.uleb128 0x9
	.byte	0x4
	.4byte	0x50a
	.uleb128 0x7
	.4byte	0xba
	.4byte	0x519
	.uleb128 0x8
	.4byte	0x50
	.byte	0
	.uleb128 0x13
	.4byte	.LASF1108
	.byte	0x8
	.byte	0x2
	.2byte	0x14f
	.4byte	0x541
	.uleb128 0x14
	.4byte	.LASF1109
	.byte	0x2
	.2byte	0x151
	.4byte	0x4f8
	.byte	0
	.uleb128 0x14
	.4byte	.LASF1110
	.byte	0x2
	.2byte	0x152
	.4byte	0x541
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x519
	.uleb128 0x12
	.4byte	.LASF1111
	.byte	0x2
	.2byte	0x153
	.4byte	0x519
	.uleb128 0xf
	.4byte	.LASF1112
	.byte	0x2
	.2byte	0x157
	.4byte	0x55f
	.uleb128 0x9
	.byte	0x4
	.4byte	0x547
	.uleb128 0xc
	.4byte	.LASF1113
	.byte	0x3
	.byte	0x37
	.4byte	0x89
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1114
	.uleb128 0xc
	.4byte	.LASF1115
	.byte	0x4
	.byte	0x30
	.4byte	0x259
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF1116
	.uleb128 0xc
	.4byte	.LASF1117
	.byte	0x4
	.byte	0x36
	.4byte	0x4f1
	.uleb128 0xc
	.4byte	.LASF1118
	.byte	0x4
	.byte	0x38
	.4byte	0x89
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1119
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1120
	.uleb128 0x15
	.byte	0x7
	.byte	0x1
	.4byte	0x259
	.byte	0x5
	.byte	0x2a
	.4byte	0x693
	.uleb128 0x16
	.4byte	.LASF1121
	.byte	0
	.uleb128 0x16
	.4byte	.LASF1122
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF1123
	.byte	0x2
	.uleb128 0x16
	.4byte	.LASF1124
	.byte	0xd0
	.uleb128 0x16
	.4byte	.LASF1125
	.byte	0xd1
	.uleb128 0x16
	.4byte	.LASF1126
	.byte	0xd2
	.uleb128 0x16
	.4byte	.LASF1127
	.byte	0xd4
	.uleb128 0x16
	.4byte	.LASF1128
	.byte	0xd5
	.uleb128 0x16
	.4byte	.LASF1129
	.byte	0xd6
	.uleb128 0x16
	.4byte	.LASF1130
	.byte	0xd7
	.uleb128 0x16
	.4byte	.LASF1131
	.byte	0xe0
	.uleb128 0x16
	.4byte	.LASF1132
	.byte	0xe1
	.uleb128 0x16
	.4byte	.LASF1133
	.byte	0xe2
	.uleb128 0x16
	.4byte	.LASF1134
	.byte	0xe3
	.uleb128 0x16
	.4byte	.LASF1135
	.byte	0xe4
	.uleb128 0x16
	.4byte	.LASF1136
	.byte	0xe5
	.uleb128 0x16
	.4byte	.LASF1137
	.byte	0xe6
	.uleb128 0x16
	.4byte	.LASF1138
	.byte	0xe7
	.uleb128 0x16
	.4byte	.LASF1139
	.byte	0xe8
	.uleb128 0x16
	.4byte	.LASF1140
	.byte	0xe9
	.uleb128 0x16
	.4byte	.LASF1141
	.byte	0xea
	.uleb128 0x16
	.4byte	.LASF1142
	.byte	0xeb
	.uleb128 0x16
	.4byte	.LASF1143
	.byte	0xec
	.uleb128 0x16
	.4byte	.LASF1144
	.byte	0xed
	.uleb128 0x16
	.4byte	.LASF1145
	.byte	0xf0
	.uleb128 0x16
	.4byte	.LASF1146
	.byte	0xf1
	.uleb128 0x16
	.4byte	.LASF1147
	.byte	0xf2
	.uleb128 0x16
	.4byte	.LASF1148
	.byte	0xf3
	.uleb128 0x16
	.4byte	.LASF1149
	.byte	0xf4
	.uleb128 0x16
	.4byte	.LASF1150
	.byte	0xf5
	.uleb128 0x16
	.4byte	.LASF1151
	.byte	0xf6
	.uleb128 0x16
	.4byte	.LASF1152
	.byte	0xf7
	.uleb128 0x16
	.4byte	.LASF1153
	.byte	0xf8
	.uleb128 0x16
	.4byte	.LASF1154
	.byte	0xf9
	.uleb128 0x16
	.4byte	.LASF1155
	.byte	0xfa
	.uleb128 0x16
	.4byte	.LASF1156
	.byte	0xfb
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1157
	.byte	0x5
	.byte	0x4f
	.4byte	0x5ad
	.uleb128 0x15
	.byte	0x7
	.byte	0x1
	.4byte	0x259
	.byte	0x6
	.byte	0x2a
	.4byte	0x6ca
	.uleb128 0x16
	.4byte	.LASF1158
	.byte	0
	.uleb128 0x16
	.4byte	.LASF1159
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF1160
	.byte	0x2
	.uleb128 0x16
	.4byte	.LASF1161
	.byte	0x3
	.uleb128 0x16
	.4byte	.LASF1162
	.byte	0x20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1163
	.byte	0x6
	.byte	0x30
	.4byte	0x69e
	.uleb128 0x3
	.4byte	.LASF1164
	.byte	0x4
	.byte	0x7
	.byte	0x34
	.4byte	0x705
	.uleb128 0x17
	.ascii	"dt\000"
	.byte	0x7
	.byte	0x36
	.4byte	0x6ca
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1165
	.byte	0x7
	.byte	0x37
	.4byte	0x577
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF1166
	.byte	0x7
	.byte	0x38
	.4byte	0x589
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1167
	.byte	0x7
	.byte	0x3c
	.4byte	0x710
	.uleb128 0x9
	.byte	0x4
	.4byte	0x6d5
	.uleb128 0x15
	.byte	0x7
	.byte	0x1
	.4byte	0x259
	.byte	0x8
	.byte	0x2d
	.4byte	0x74e
	.uleb128 0x16
	.4byte	.LASF1168
	.byte	0
	.uleb128 0x16
	.4byte	.LASF1169
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF1170
	.byte	0x2
	.uleb128 0x16
	.4byte	.LASF1171
	.byte	0x3
	.uleb128 0x16
	.4byte	.LASF1172
	.byte	0x4
	.uleb128 0x16
	.4byte	.LASF1173
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF1174
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1175
	.byte	0x8
	.byte	0x36
	.4byte	0x716
	.uleb128 0x3
	.4byte	.LASF1176
	.byte	0x8
	.byte	0x8
	.byte	0x4a
	.4byte	0x78a
	.uleb128 0x4
	.4byte	.LASF1177
	.byte	0x8
	.byte	0x4c
	.4byte	0x577
	.byte	0
	.uleb128 0x17
	.ascii	"bus\000"
	.byte	0x8
	.byte	0x4d
	.4byte	0x577
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF1178
	.byte	0x8
	.byte	0x4e
	.4byte	0x594
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1179
	.byte	0x1
	.byte	0x8
	.byte	0x51
	.4byte	0x7a3
	.uleb128 0x17
	.ascii	"bus\000"
	.byte	0x8
	.byte	0x53
	.4byte	0x577
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1180
	.byte	0xc
	.byte	0x8
	.byte	0x56
	.4byte	0x7ec
	.uleb128 0x4
	.4byte	.LASF1181
	.byte	0x8
	.byte	0x58
	.4byte	0x50
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1178
	.byte	0x8
	.byte	0x59
	.4byte	0x594
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF1182
	.byte	0x8
	.byte	0x5a
	.4byte	0x577
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF1183
	.byte	0x8
	.byte	0x5b
	.4byte	0x577
	.byte	0x9
	.uleb128 0x4
	.4byte	.LASF1184
	.byte	0x8
	.byte	0x5c
	.4byte	0x577
	.byte	0xa
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1185
	.byte	0x20
	.byte	0x8
	.byte	0x5f
	.4byte	0x835
	.uleb128 0x17
	.ascii	"idx\000"
	.byte	0x8
	.byte	0x61
	.4byte	0x50
	.byte	0
	.uleb128 0x17
	.ascii	"vid\000"
	.byte	0x8
	.byte	0x62
	.4byte	0x594
	.byte	0x4
	.uleb128 0x17
	.ascii	"pid\000"
	.byte	0x8
	.byte	0x63
	.4byte	0x594
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF1186
	.byte	0x8
	.byte	0x64
	.4byte	0x594
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF1187
	.byte	0x8
	.byte	0x65
	.4byte	0x835
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.4byte	0x577
	.4byte	0x845
	.uleb128 0xe
	.4byte	0x89
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1188
	.byte	0x20
	.byte	0x8
	.byte	0x68
	.4byte	0x8b2
	.uleb128 0x4
	.4byte	.LASF1189
	.byte	0x8
	.byte	0x6a
	.4byte	0x8c6
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1190
	.byte	0x8
	.byte	0x6b
	.4byte	0x8db
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF1191
	.byte	0x8
	.byte	0x6c
	.4byte	0x900
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF1192
	.byte	0x8
	.byte	0x6d
	.4byte	0x925
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF1193
	.byte	0x8
	.byte	0x6e
	.4byte	0x8db
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF1194
	.byte	0x8
	.byte	0x6f
	.4byte	0x8db
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF1195
	.byte	0x8
	.byte	0x70
	.4byte	0x8db
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF1196
	.byte	0x8
	.byte	0x71
	.4byte	0x8db
	.byte	0x1c
	.byte	0
	.uleb128 0x7
	.4byte	0x693
	.4byte	0x8c6
	.uleb128 0x8
	.4byte	0x29
	.uleb128 0x8
	.4byte	0x29
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x8b2
	.uleb128 0x7
	.4byte	0x693
	.4byte	0x8db
	.uleb128 0x8
	.4byte	0x29
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x8cc
	.uleb128 0x7
	.4byte	0x693
	.4byte	0x8fa
	.uleb128 0x8
	.4byte	0x29
	.uleb128 0x8
	.4byte	0x8fa
	.uleb128 0x8
	.4byte	0x50
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x577
	.uleb128 0x9
	.byte	0x4
	.4byte	0x8e1
	.uleb128 0x7
	.4byte	0x693
	.4byte	0x91f
	.uleb128 0x8
	.4byte	0x29
	.uleb128 0x8
	.4byte	0x8fa
	.uleb128 0x8
	.4byte	0x91f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x589
	.uleb128 0x9
	.byte	0x4
	.4byte	0x906
	.uleb128 0x18
	.byte	0x20
	.byte	0x8
	.byte	0x48
	.4byte	0x96b
	.uleb128 0x19
	.4byte	.LASF1197
	.byte	0x8
	.byte	0x4f
	.4byte	0x759
	.uleb128 0x19
	.4byte	.LASF1198
	.byte	0x8
	.byte	0x54
	.4byte	0x78a
	.uleb128 0x19
	.4byte	.LASF1199
	.byte	0x8
	.byte	0x5d
	.4byte	0x7a3
	.uleb128 0x19
	.4byte	.LASF1200
	.byte	0x8
	.byte	0x66
	.4byte	0x7ec
	.uleb128 0x19
	.4byte	.LASF1201
	.byte	0x8
	.byte	0x72
	.4byte	0x845
	.byte	0
	.uleb128 0xb
	.byte	0x30
	.byte	0x8
	.byte	0x42
	.4byte	0x9b6
	.uleb128 0x4
	.4byte	.LASF1202
	.byte	0x8
	.byte	0x45
	.4byte	0x74e
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1203
	.byte	0x8
	.byte	0x46
	.4byte	0x6ca
	.byte	0x1
	.uleb128 0x1a
	.4byte	0x92b
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF1204
	.byte	0x8
	.byte	0x76
	.4byte	0x589
	.byte	0x24
	.uleb128 0x4
	.4byte	.LASF1205
	.byte	0x8
	.byte	0x77
	.4byte	0x50
	.byte	0x28
	.uleb128 0x4
	.4byte	.LASF1206
	.byte	0x8
	.byte	0x78
	.4byte	0x29
	.byte	0x2c
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1207
	.byte	0x8
	.byte	0x79
	.4byte	0x96b
	.uleb128 0xc
	.4byte	.LASF1208
	.byte	0x8
	.byte	0x7a
	.4byte	0x9cc
	.uleb128 0x9
	.byte	0x4
	.4byte	0x9d2
	.uleb128 0x3
	.4byte	.LASF1209
	.byte	0x28
	.byte	0x8
	.byte	0x81
	.4byte	0xa57
	.uleb128 0x4
	.4byte	.LASF1210
	.byte	0x8
	.byte	0x83
	.4byte	0x74e
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1211
	.byte	0x8
	.byte	0x84
	.4byte	0xa57
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF1212
	.byte	0x8
	.byte	0x86
	.4byte	0xa71
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF1213
	.byte	0x8
	.byte	0x87
	.4byte	0xa86
	.byte	0xc
	.uleb128 0x4
	.4byte	.LASF1214
	.byte	0x8
	.byte	0x88
	.4byte	0xaa5
	.byte	0x10
	.uleb128 0x4
	.4byte	.LASF1215
	.byte	0x8
	.byte	0x89
	.4byte	0xac4
	.byte	0x14
	.uleb128 0x4
	.4byte	.LASF1216
	.byte	0x8
	.byte	0x8a
	.4byte	0xa86
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF1217
	.byte	0x8
	.byte	0x8b
	.4byte	0xa86
	.byte	0x1c
	.uleb128 0x4
	.4byte	.LASF1218
	.byte	0x8
	.byte	0x8c
	.4byte	0xa86
	.byte	0x20
	.uleb128 0x4
	.4byte	.LASF1219
	.byte	0x8
	.byte	0x8f
	.4byte	0x29
	.byte	0x24
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x9b6
	.uleb128 0x7
	.4byte	0x693
	.4byte	0xa71
	.uleb128 0x8
	.4byte	0x29
	.uleb128 0x8
	.4byte	0xa57
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xa5d
	.uleb128 0x7
	.4byte	0x693
	.4byte	0xa86
	.uleb128 0x8
	.4byte	0x9c1
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xa77
	.uleb128 0x7
	.4byte	0x693
	.4byte	0xaa5
	.uleb128 0x8
	.4byte	0x9c1
	.uleb128 0x8
	.4byte	0x8fa
	.uleb128 0x8
	.4byte	0x50
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xa8c
	.uleb128 0x7
	.4byte	0x693
	.4byte	0xac4
	.uleb128 0x8
	.4byte	0x9c1
	.uleb128 0x8
	.4byte	0x8fa
	.uleb128 0x8
	.4byte	0x91f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xaab
	.uleb128 0x3
	.4byte	.LASF1220
	.byte	0x8
	.byte	0x9
	.byte	0x2c
	.4byte	0xaef
	.uleb128 0x4
	.4byte	.LASF1221
	.byte	0x9
	.byte	0x2e
	.4byte	0x705
	.byte	0
	.uleb128 0x4
	.4byte	.LASF1222
	.byte	0x9
	.byte	0x2f
	.4byte	0x9c1
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF1223
	.byte	0x9
	.byte	0x32
	.4byte	0xafa
	.uleb128 0x9
	.byte	0x4
	.4byte	0xaca
	.uleb128 0x1b
	.4byte	.LASF1224
	.byte	0xa
	.byte	0x28
	.4byte	0x9b6
	.uleb128 0x1b
	.4byte	.LASF1225
	.byte	0xa
	.byte	0x2b
	.4byte	0x9b6
	.uleb128 0x1b
	.4byte	.LASF1226
	.byte	0xa
	.byte	0x2e
	.4byte	0x9b6
	.uleb128 0x1b
	.4byte	.LASF1227
	.byte	0xa
	.byte	0x31
	.4byte	0x9b6
	.uleb128 0x1b
	.4byte	.LASF1228
	.byte	0xa
	.byte	0x35
	.4byte	0x9b6
	.uleb128 0x1b
	.4byte	.LASF1229
	.byte	0xa
	.byte	0x38
	.4byte	0x9b6
	.uleb128 0x1b
	.4byte	.LASF1230
	.byte	0xa
	.byte	0x3b
	.4byte	0x9b6
	.uleb128 0x1b
	.4byte	.LASF1231
	.byte	0xa
	.byte	0x3e
	.4byte	0x9b6
	.uleb128 0xd
	.4byte	0x577
	.4byte	0xb68
	.uleb128 0xe
	.4byte	0x89
	.byte	0x3
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF1232
	.byte	0xb
	.byte	0x41
	.4byte	0xb58
	.uleb128 0x1b
	.4byte	.LASF1233
	.byte	0xb
	.byte	0x42
	.4byte	0xb58
	.uleb128 0x1b
	.4byte	.LASF1234
	.byte	0xb
	.byte	0x43
	.4byte	0xb58
	.uleb128 0x1b
	.4byte	.LASF1235
	.byte	0xc
	.byte	0x37
	.4byte	0xaef
	.uleb128 0x6
	.byte	0x1
	.byte	0x2
	.4byte	.LASF1236
	.uleb128 0xd
	.4byte	0x84
	.4byte	0xbab
	.uleb128 0xe
	.4byte	0x89
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.4byte	0xb9b
	.uleb128 0x1c
	.4byte	.LASF1237
	.byte	0x1
	.byte	0x21
	.4byte	0xbab
	.uleb128 0x5
	.byte	0x3
	.4byte	atca_version
	.uleb128 0x1d
	.4byte	0xb89
	.byte	0x1
	.byte	0x22
	.uleb128 0x5
	.byte	0x3
	.4byte	_gDevice
	.uleb128 0x1e
	.4byte	.LASF1241
	.byte	0x1
	.2byte	0x174
	.4byte	0x693
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc22
	.uleb128 0x1f
	.4byte	.LASF1238
	.byte	0x1
	.2byte	0x174
	.4byte	0x577
	.4byte	.LLST11
	.uleb128 0x20
	.4byte	.LASF1239
	.byte	0x1
	.2byte	0x174
	.4byte	0x589
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x20
	.4byte	.LASF1240
	.byte	0x1
	.2byte	0x174
	.4byte	0xc22
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x21
	.4byte	.LASF1246
	.byte	0x1
	.2byte	0x176
	.4byte	0x693
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x565
	.uleb128 0x1e
	.4byte	.LASF1242
	.byte	0x1
	.2byte	0x147
	.4byte	0x693
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcaa
	.uleb128 0x1f
	.4byte	.LASF1238
	.byte	0x1
	.2byte	0x147
	.4byte	0x577
	.4byte	.LLST8
	.uleb128 0x20
	.4byte	.LASF1239
	.byte	0x1
	.2byte	0x147
	.4byte	0x589
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x20
	.4byte	.LASF1243
	.byte	0x1
	.2byte	0x147
	.4byte	0x577
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1f
	.4byte	.LASF1244
	.byte	0x1
	.2byte	0x147
	.4byte	0x577
	.4byte	.LLST9
	.uleb128 0x1f
	.4byte	.LASF1245
	.byte	0x1
	.2byte	0x147
	.4byte	0x91f
	.4byte	.LLST10
	.uleb128 0x21
	.4byte	.LASF1246
	.byte	0x1
	.2byte	0x149
	.4byte	0x693
	.byte	0
	.uleb128 0x22
	.4byte	.LASF1247
	.byte	0x1
	.2byte	0x14a
	.4byte	0x577
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1248
	.byte	0x1
	.2byte	0x139
	.4byte	0x693
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcce
	.uleb128 0x23
	.4byte	.LVL29
	.4byte	0xdc5
	.byte	0
	.uleb128 0x24
	.4byte	.LASF1249
	.byte	0x1
	.byte	0xe4
	.4byte	0x693
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd92
	.uleb128 0x25
	.4byte	.LASF1250
	.byte	0x1
	.byte	0xe4
	.4byte	0xa57
	.4byte	.LLST4
	.uleb128 0x25
	.4byte	.LASF1251
	.byte	0x1
	.byte	0xe4
	.4byte	0x50
	.4byte	.LLST5
	.uleb128 0x26
	.4byte	.LASF1252
	.byte	0x1
	.byte	0xe6
	.4byte	0x50
	.4byte	.LLST6
	.uleb128 0x27
	.4byte	.LASF1253
	.byte	0x1
	.byte	0xe7
	.4byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x28
	.ascii	"i\000"
	.byte	0x1
	.byte	0xe8
	.4byte	0x50
	.4byte	.LLST7
	.uleb128 0x27
	.4byte	.LASF1254
	.byte	0x1
	.byte	0xfc
	.4byte	0xd92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x29
	.4byte	.LVL23
	.4byte	0xf73
	.4byte	0xd5c
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x9
	.byte	0xff
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x40
	.byte	0
	.uleb128 0x29
	.4byte	.LVL24
	.4byte	0xf7e
	.4byte	0xd75
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.uleb128 0x2b
	.4byte	.LVL26
	.4byte	0xf89
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x8
	.byte	0x79
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x1e
	.byte	0x78
	.sleb128 0
	.byte	0x22
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x50
	.4byte	0xda2
	.uleb128 0xe
	.4byte	0x89
	.byte	0x3
	.byte	0
	.uleb128 0x24
	.4byte	.LASF1255
	.byte	0x1
	.byte	0xcc
	.4byte	0x693
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdc5
	.uleb128 0x23
	.4byte	.LVL18
	.4byte	0xf94
	.byte	0
	.uleb128 0x24
	.4byte	.LASF1256
	.byte	0x1
	.byte	0xbf
	.4byte	0x693
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xde8
	.uleb128 0x23
	.4byte	.LVL17
	.4byte	0xf9f
	.byte	0
	.uleb128 0x24
	.4byte	.LASF1257
	.byte	0x1
	.byte	0xb2
	.4byte	0x693
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe0b
	.uleb128 0x23
	.4byte	.LVL16
	.4byte	0xfaa
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF1258
	.byte	0x1
	.byte	0xa3
	.4byte	0x6ca
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2c
	.4byte	.LASF1259
	.byte	0x1
	.byte	0x9b
	.4byte	0xaef
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.4byte	.LASF1260
	.byte	0x1
	.byte	0x89
	.4byte	0x693
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe62
	.uleb128 0x2b
	.4byte	.LVL2
	.4byte	0xfb5
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF1261
	.byte	0x1
	.byte	0x6e
	.4byte	0x693
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xebc
	.uleb128 0x25
	.4byte	.LASF1262
	.byte	0x1
	.byte	0x6e
	.4byte	0xaef
	.4byte	.LLST3
	.uleb128 0x29
	.4byte	.LVL10
	.4byte	0xfc0
	.4byte	0xe9e
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.4byte	.LVL12
	.4byte	0xfcb
	.4byte	0xeb2
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x2d
	.4byte	.LVL13
	.4byte	0xe35
	.byte	0
	.uleb128 0x24
	.4byte	.LASF1263
	.byte	0x1
	.byte	0x41
	.4byte	0x693
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf30
	.uleb128 0x2e
	.ascii	"cfg\000"
	.byte	0x1
	.byte	0x41
	.4byte	0xa57
	.4byte	.LLST1
	.uleb128 0x26
	.4byte	.LASF1246
	.byte	0x1
	.byte	0x43
	.4byte	0x693
	.4byte	.LLST2
	.uleb128 0x2d
	.4byte	.LVL4
	.4byte	0xe35
	.uleb128 0x29
	.4byte	.LVL5
	.4byte	0xfd6
	.4byte	0xf10
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x2b
	.4byte	.LVL6
	.4byte	0xfe1
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x43
	.uleb128 0x2a
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF1264
	.byte	0x1
	.byte	0x35
	.4byte	0x693
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf73
	.uleb128 0x25
	.4byte	.LASF1265
	.byte	0x1
	.byte	0x35
	.4byte	0x77
	.4byte	.LLST0
	.uleb128 0x2b
	.4byte	.LVL1
	.4byte	0xfec
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LANCHOR0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF1266
	.4byte	.LASF1266
	.byte	0xd
	.byte	0xbc
	.uleb128 0x2f
	.4byte	.LASF1267
	.4byte	.LASF1267
	.byte	0xe
	.byte	0x70
	.uleb128 0x2f
	.4byte	.LASF1268
	.4byte	.LASF1268
	.byte	0xe
	.byte	0x71
	.uleb128 0x2f
	.4byte	.LASF1218
	.4byte	.LASF1218
	.byte	0x8
	.byte	0x9f
	.uleb128 0x2f
	.4byte	.LASF1217
	.4byte	.LASF1217
	.byte	0x8
	.byte	0x9e
	.uleb128 0x2f
	.4byte	.LASF1216
	.4byte	.LASF1216
	.byte	0x8
	.byte	0x9d
	.uleb128 0x2f
	.4byte	.LASF1269
	.4byte	.LASF1269
	.byte	0x9
	.byte	0x37
	.uleb128 0x2f
	.4byte	.LASF1270
	.4byte	.LASF1270
	.byte	0x9
	.byte	0x39
	.uleb128 0x2f
	.4byte	.LASF1271
	.4byte	.LASF1271
	.byte	0x9
	.byte	0x3a
	.uleb128 0x2f
	.4byte	.LASF1272
	.4byte	.LASF1272
	.byte	0x9
	.byte	0x35
	.uleb128 0x2f
	.4byte	.LASF1273
	.4byte	.LASF1273
	.byte	0xc
	.byte	0xb7
	.uleb128 0x2f
	.4byte	.LASF1274
	.4byte	.LASF1274
	.byte	0xd
	.byte	0xc7
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.uleb128 0x2134
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST11:
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL38
	.4byte	.LFE12
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL30
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL33
	.4byte	.LVL35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL36
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL30
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL32
	.4byte	.LVL34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	.LVL35
	.4byte	.LFE11
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL30
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	.LVL35
	.4byte	.LFE11
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20
	.4byte	.LFE9
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL21
	.4byte	.LFE9
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL19
	.4byte	.LVL25
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL25
	.4byte	.LFE9
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL22
	.4byte	.LVL25
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL25
	.4byte	.LFE9
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL9
	.4byte	.LVL10-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10-1
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15
	.4byte	.LFE2
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4-1
	.4byte	.LFE1
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3
	.4byte	.LVL6
	.2byte	0x3
	.byte	0x9
	.byte	0xe1
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL8
	.4byte	.LFE1
	.2byte	0x3
	.byte	0x9
	.byte	0xe1
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-1
	.4byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x494
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xff8
	.4byte	0x5ba
	.ascii	"ATCA_SUCCESS\000"
	.4byte	0x5c0
	.ascii	"ATCA_CONFIG_ZONE_LOCKED\000"
	.4byte	0x5c6
	.ascii	"ATCA_DATA_ZONE_LOCKED\000"
	.4byte	0x5cc
	.ascii	"ATCA_WAKE_FAILED\000"
	.4byte	0x5d2
	.ascii	"ATCA_CHECKMAC_VERIFY_FAILED\000"
	.4byte	0x5d8
	.ascii	"ATCA_PARSE_ERROR\000"
	.4byte	0x5de
	.ascii	"ATCA_STATUS_CRC\000"
	.4byte	0x5e4
	.ascii	"ATCA_STATUS_UNKNOWN\000"
	.4byte	0x5ea
	.ascii	"ATCA_STATUS_ECC\000"
	.4byte	0x5f0
	.ascii	"ATCA_STATUS_SELFTEST_ERROR\000"
	.4byte	0x5f6
	.ascii	"ATCA_FUNC_FAIL\000"
	.4byte	0x5fc
	.ascii	"ATCA_GEN_FAIL\000"
	.4byte	0x602
	.ascii	"ATCA_BAD_PARAM\000"
	.4byte	0x608
	.ascii	"ATCA_INVALID_ID\000"
	.4byte	0x60e
	.ascii	"ATCA_INVALID_SIZE\000"
	.4byte	0x614
	.ascii	"ATCA_RX_CRC_ERROR\000"
	.4byte	0x61a
	.ascii	"ATCA_RX_FAIL\000"
	.4byte	0x620
	.ascii	"ATCA_RX_NO_RESPONSE\000"
	.4byte	0x626
	.ascii	"ATCA_RESYNC_WITH_WAKEUP\000"
	.4byte	0x62c
	.ascii	"ATCA_PARITY_ERROR\000"
	.4byte	0x632
	.ascii	"ATCA_TX_TIMEOUT\000"
	.4byte	0x638
	.ascii	"ATCA_RX_TIMEOUT\000"
	.4byte	0x63e
	.ascii	"ATCA_TOO_MANY_COMM_RETRIES\000"
	.4byte	0x644
	.ascii	"ATCA_SMALL_BUFFER\000"
	.4byte	0x64a
	.ascii	"ATCA_COMM_FAIL\000"
	.4byte	0x650
	.ascii	"ATCA_TIMEOUT\000"
	.4byte	0x656
	.ascii	"ATCA_BAD_OPCODE\000"
	.4byte	0x65c
	.ascii	"ATCA_WAKE_SUCCESS\000"
	.4byte	0x662
	.ascii	"ATCA_EXECUTION_ERROR\000"
	.4byte	0x668
	.ascii	"ATCA_UNIMPLEMENTED\000"
	.4byte	0x66e
	.ascii	"ATCA_ASSERT_FAILURE\000"
	.4byte	0x674
	.ascii	"ATCA_TX_FAIL\000"
	.4byte	0x67a
	.ascii	"ATCA_NOT_LOCKED\000"
	.4byte	0x680
	.ascii	"ATCA_NO_DEVICES\000"
	.4byte	0x686
	.ascii	"ATCA_HEALTH_TEST_ERROR\000"
	.4byte	0x68c
	.ascii	"ATCA_ALLOC_FAILURE\000"
	.4byte	0x6ab
	.ascii	"ATSHA204A\000"
	.4byte	0x6b1
	.ascii	"ATECC108A\000"
	.4byte	0x6b7
	.ascii	"ATECC508A\000"
	.4byte	0x6bd
	.ascii	"ATECC608A\000"
	.4byte	0x6c3
	.ascii	"ATCA_DEV_UNKNOWN\000"
	.4byte	0xbb0
	.ascii	"atca_version\000"
	.4byte	0xbc1
	.ascii	"_gDevice\000"
	.4byte	0xbce
	.ascii	"atcab_get_zone_size\000"
	.4byte	0xc28
	.ascii	"atcab_get_addr\000"
	.4byte	0xcaa
	.ascii	"_atcab_exit\000"
	.4byte	0xcce
	.ascii	"atcab_cfg_discover\000"
	.4byte	0xda2
	.ascii	"atcab_sleep\000"
	.4byte	0xdc5
	.ascii	"atcab_idle\000"
	.4byte	0xde8
	.ascii	"atcab_wakeup\000"
	.4byte	0xe0b
	.ascii	"atcab_get_device_type\000"
	.4byte	0xe20
	.ascii	"atcab_get_device\000"
	.4byte	0xe35
	.ascii	"atcab_release\000"
	.4byte	0xe62
	.ascii	"atcab_init_device\000"
	.4byte	0xebc
	.ascii	"atcab_init\000"
	.4byte	0xf30
	.ascii	"atcab_version\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x285
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xff8
	.4byte	0x50
	.ascii	"int\000"
	.4byte	0x57
	.ascii	"long int\000"
	.4byte	0x2b
	.ascii	"__mbstate_s\000"
	.4byte	0x7d
	.ascii	"char\000"
	.4byte	0x89
	.ascii	"unsigned int\000"
	.4byte	0x249
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x259
	.ascii	"unsigned char\000"
	.4byte	0x338
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x381
	.ascii	"__RAL_locale_t\000"
	.4byte	0x391
	.ascii	"__locale_s\000"
	.4byte	0x4f1
	.ascii	"short unsigned int\000"
	.4byte	0x4f8
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x519
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x547
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x565
	.ascii	"size_t\000"
	.4byte	0x570
	.ascii	"signed char\000"
	.4byte	0x577
	.ascii	"uint8_t\000"
	.4byte	0x582
	.ascii	"short int\000"
	.4byte	0x589
	.ascii	"uint16_t\000"
	.4byte	0x594
	.ascii	"uint32_t\000"
	.4byte	0x59f
	.ascii	"long long int\000"
	.4byte	0x5a6
	.ascii	"long long unsigned int\000"
	.4byte	0x693
	.ascii	"ATCA_STATUS\000"
	.4byte	0x6ca
	.ascii	"ATCADeviceType\000"
	.4byte	0x6d5
	.ascii	"atca_command\000"
	.4byte	0x705
	.ascii	"ATCACommand\000"
	.4byte	0x74e
	.ascii	"ATCAIfaceType\000"
	.4byte	0x759
	.ascii	"ATCAI2C\000"
	.4byte	0x78a
	.ascii	"ATCASWI\000"
	.4byte	0x7a3
	.ascii	"ATCAUART\000"
	.4byte	0x7ec
	.ascii	"ATCAHID\000"
	.4byte	0x845
	.ascii	"ATCACUSTOM\000"
	.4byte	0x9b6
	.ascii	"ATCAIfaceCfg\000"
	.4byte	0x9c1
	.ascii	"ATCAIface\000"
	.4byte	0x9d2
	.ascii	"atca_iface\000"
	.4byte	0xaca
	.ascii	"atca_device\000"
	.4byte	0xaef
	.ascii	"ATCADevice\000"
	.4byte	0xb94
	.ascii	"_Bool\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x7c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF453
	.file 15 "../../../cryptoauthlib/lib/cryptoauthlib.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xf
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF454
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF455
	.byte	0x3
	.uleb128 0x2f
	.uleb128 0x2
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x3
	.uleb128 0x20
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF481
	.byte	0x4
	.byte	0x3
	.uleb128 0x22
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF482
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF483
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.file 16 "../../../cryptoauthlib/lib/atca_bool.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF544
	.file 17 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 3.40/include/stdbool.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x11
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x8
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF550
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF551
	.file 18 "../../../cryptoauthlib/lib/atca_compiler.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x12
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x5
	.byte	0x4
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF557
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.file 19 "../../../cryptoauthlib/lib/hal/atca_start_config.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x13
	.byte	0x4
	.file 20 "../../../cryptoauthlib/lib/hal/atca_start_iface.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x14
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x9
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF998
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x8
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x26
	.uleb128 0xa
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF999
	.byte	0x4
	.file 21 "../../../cryptoauthlib/lib/basic/atca_basic.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x15
	.byte	0x4
	.byte	0x3
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF1000
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0xf
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.file 22 "../../../cryptoauthlib/lib/crypto/atca_crypto_sw_sha2.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF1005
	.file 23 "../../../cryptoauthlib/lib/crypto/atca_crypto_sw.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x17
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF1006
	.byte	0x4
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF1007
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
	.file 24 "../../../cryptoauthlib/lib/host/atca_host.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x18
	.byte	0x7
	.4byte	.Ldebug_macro10
	.byte	0x4
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF1033
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.5b92f7ccf65500c849aed317a597bb58,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0
	.4byte	.LASF396
	.byte	0x6
	.uleb128 0
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0
	.4byte	.LASF398
	.byte	0x6
	.uleb128 0
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0
	.4byte	.LASF402
	.byte	0x6
	.uleb128 0
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0
	.4byte	.LASF417
	.byte	0x6
	.uleb128 0
	.4byte	.LASF418
	.byte	0x6
	.uleb128 0
	.4byte	.LASF419
	.byte	0x6
	.uleb128 0
	.4byte	.LASF420
	.byte	0x6
	.uleb128 0
	.4byte	.LASF421
	.byte	0x6
	.uleb128 0
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0
	.4byte	.LASF423
	.byte	0x6
	.uleb128 0
	.4byte	.LASF424
	.byte	0x6
	.uleb128 0
	.4byte	.LASF425
	.byte	0x6
	.uleb128 0
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0
	.4byte	.LASF452
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.__crossworks.h.45.c15bb6e0a60630589d552427ceaabe49,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF457
	.byte	0x6
	.uleb128 0x43
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF476
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.50.aad2f28d9688ad38fd1808e94cc788bf,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF480
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.45.370e29a4497ae7c3b4c92e383ca5b648,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF543
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdbool.h.45.e4cbe9931a68266e95ea034b4b9fd8bf,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF549
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.atca_compiler.h.32.a87023e244876a3014cf1d641bd672e2,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF556
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.atca_command.h.160.1091930c62b52760387485f8fa57f328,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF619
	.byte	0x5
	.uleb128 0xf5
	.4byte	.LASF620
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF673
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF674
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF677
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF678
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF679
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x154
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF689
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF693
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF694
	.byte	0x5
	.uleb128 0x160
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x161
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x163
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x169
	.4byte	.LASF700
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF701
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF704
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF706
	.byte	0x5
	.uleb128 0x170
	.4byte	.LASF707
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF708
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF709
	.byte	0x5
	.uleb128 0x173
	.4byte	.LASF710
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF711
	.byte	0x5
	.uleb128 0x175
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF713
	.byte	0x5
	.uleb128 0x17b
	.4byte	.LASF714
	.byte	0x5
	.uleb128 0x17c
	.4byte	.LASF715
	.byte	0x5
	.uleb128 0x17d
	.4byte	.LASF716
	.byte	0x5
	.uleb128 0x17e
	.4byte	.LASF717
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF718
	.byte	0x5
	.uleb128 0x180
	.4byte	.LASF719
	.byte	0x5
	.uleb128 0x181
	.4byte	.LASF720
	.byte	0x5
	.uleb128 0x182
	.4byte	.LASF721
	.byte	0x5
	.uleb128 0x183
	.4byte	.LASF722
	.byte	0x5
	.uleb128 0x184
	.4byte	.LASF723
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF724
	.byte	0x5
	.uleb128 0x18a
	.4byte	.LASF725
	.byte	0x5
	.uleb128 0x18b
	.4byte	.LASF726
	.byte	0x5
	.uleb128 0x18c
	.4byte	.LASF727
	.byte	0x5
	.uleb128 0x18d
	.4byte	.LASF728
	.byte	0x5
	.uleb128 0x18e
	.4byte	.LASF729
	.byte	0x5
	.uleb128 0x18f
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x190
	.4byte	.LASF731
	.byte	0x5
	.uleb128 0x191
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF733
	.byte	0x5
	.uleb128 0x193
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x194
	.4byte	.LASF735
	.byte	0x5
	.uleb128 0x195
	.4byte	.LASF736
	.byte	0x5
	.uleb128 0x196
	.4byte	.LASF737
	.byte	0x5
	.uleb128 0x197
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0x19c
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0x19f
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0x1a1
	.4byte	.LASF744
	.byte	0x5
	.uleb128 0x1a2
	.4byte	.LASF745
	.byte	0x5
	.uleb128 0x1a3
	.4byte	.LASF746
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x1a5
	.4byte	.LASF748
	.byte	0x5
	.uleb128 0x1a6
	.4byte	.LASF749
	.byte	0x5
	.uleb128 0x1ab
	.4byte	.LASF750
	.byte	0x5
	.uleb128 0x1ac
	.4byte	.LASF751
	.byte	0x5
	.uleb128 0x1ad
	.4byte	.LASF752
	.byte	0x5
	.uleb128 0x1ae
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0x1af
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0x1b0
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF756
	.byte	0x5
	.uleb128 0x1b2
	.4byte	.LASF757
	.byte	0x5
	.uleb128 0x1b3
	.4byte	.LASF758
	.byte	0x5
	.uleb128 0x1b4
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0x1b5
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0x1b6
	.4byte	.LASF761
	.byte	0x5
	.uleb128 0x1b7
	.4byte	.LASF762
	.byte	0x5
	.uleb128 0x1b8
	.4byte	.LASF763
	.byte	0x5
	.uleb128 0x1b9
	.4byte	.LASF764
	.byte	0x5
	.uleb128 0x1ba
	.4byte	.LASF765
	.byte	0x5
	.uleb128 0x1bb
	.4byte	.LASF766
	.byte	0x5
	.uleb128 0x1c0
	.4byte	.LASF767
	.byte	0x5
	.uleb128 0x1c1
	.4byte	.LASF768
	.byte	0x5
	.uleb128 0x1c2
	.4byte	.LASF769
	.byte	0x5
	.uleb128 0x1c3
	.4byte	.LASF770
	.byte	0x5
	.uleb128 0x1c4
	.4byte	.LASF771
	.byte	0x5
	.uleb128 0x1c6
	.4byte	.LASF772
	.byte	0x5
	.uleb128 0x1c7
	.4byte	.LASF773
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF774
	.byte	0x5
	.uleb128 0x1c9
	.4byte	.LASF775
	.byte	0x5
	.uleb128 0x1ca
	.4byte	.LASF776
	.byte	0x5
	.uleb128 0x1cc
	.4byte	.LASF777
	.byte	0x5
	.uleb128 0x1cd
	.4byte	.LASF778
	.byte	0x5
	.uleb128 0x1ce
	.4byte	.LASF779
	.byte	0x5
	.uleb128 0x1cf
	.4byte	.LASF780
	.byte	0x5
	.uleb128 0x1d0
	.4byte	.LASF781
	.byte	0x5
	.uleb128 0x1d1
	.4byte	.LASF782
	.byte	0x5
	.uleb128 0x1d2
	.4byte	.LASF783
	.byte	0x5
	.uleb128 0x1d4
	.4byte	.LASF784
	.byte	0x5
	.uleb128 0x1d5
	.4byte	.LASF785
	.byte	0x5
	.uleb128 0x1d6
	.4byte	.LASF786
	.byte	0x5
	.uleb128 0x1d7
	.4byte	.LASF787
	.byte	0x5
	.uleb128 0x1d9
	.4byte	.LASF788
	.byte	0x5
	.uleb128 0x1da
	.4byte	.LASF789
	.byte	0x5
	.uleb128 0x1db
	.4byte	.LASF790
	.byte	0x5
	.uleb128 0x1dc
	.4byte	.LASF791
	.byte	0x5
	.uleb128 0x1dd
	.4byte	.LASF792
	.byte	0x5
	.uleb128 0x1df
	.4byte	.LASF793
	.byte	0x5
	.uleb128 0x1e0
	.4byte	.LASF794
	.byte	0x5
	.uleb128 0x1e1
	.4byte	.LASF795
	.byte	0x5
	.uleb128 0x1e3
	.4byte	.LASF796
	.byte	0x5
	.uleb128 0x1e4
	.4byte	.LASF797
	.byte	0x5
	.uleb128 0x1e5
	.4byte	.LASF798
	.byte	0x5
	.uleb128 0x1e7
	.4byte	.LASF799
	.byte	0x5
	.uleb128 0x1e9
	.4byte	.LASF800
	.byte	0x5
	.uleb128 0x1ea
	.4byte	.LASF801
	.byte	0x5
	.uleb128 0x1eb
	.4byte	.LASF802
	.byte	0x5
	.uleb128 0x1ec
	.4byte	.LASF803
	.byte	0x5
	.uleb128 0x1ed
	.4byte	.LASF804
	.byte	0x5
	.uleb128 0x1ee
	.4byte	.LASF805
	.byte	0x5
	.uleb128 0x1f3
	.4byte	.LASF806
	.byte	0x5
	.uleb128 0x1f4
	.4byte	.LASF807
	.byte	0x5
	.uleb128 0x1f5
	.4byte	.LASF808
	.byte	0x5
	.uleb128 0x1f6
	.4byte	.LASF809
	.byte	0x5
	.uleb128 0x1f7
	.4byte	.LASF810
	.byte	0x5
	.uleb128 0x1f8
	.4byte	.LASF811
	.byte	0x5
	.uleb128 0x1f9
	.4byte	.LASF812
	.byte	0x5
	.uleb128 0x1fa
	.4byte	.LASF813
	.byte	0x5
	.uleb128 0x1fb
	.4byte	.LASF814
	.byte	0x5
	.uleb128 0x1fc
	.4byte	.LASF815
	.byte	0x5
	.uleb128 0x1fd
	.4byte	.LASF816
	.byte	0x5
	.uleb128 0x202
	.4byte	.LASF817
	.byte	0x5
	.uleb128 0x203
	.4byte	.LASF818
	.byte	0x5
	.uleb128 0x204
	.4byte	.LASF819
	.byte	0x5
	.uleb128 0x205
	.4byte	.LASF820
	.byte	0x5
	.uleb128 0x206
	.4byte	.LASF821
	.byte	0x5
	.uleb128 0x207
	.4byte	.LASF822
	.byte	0x5
	.uleb128 0x208
	.4byte	.LASF823
	.byte	0x5
	.uleb128 0x209
	.4byte	.LASF824
	.byte	0x5
	.uleb128 0x20a
	.4byte	.LASF825
	.byte	0x5
	.uleb128 0x20b
	.4byte	.LASF826
	.byte	0x5
	.uleb128 0x20c
	.4byte	.LASF827
	.byte	0x5
	.uleb128 0x20d
	.4byte	.LASF828
	.byte	0x5
	.uleb128 0x20e
	.4byte	.LASF829
	.byte	0x5
	.uleb128 0x20f
	.4byte	.LASF830
	.byte	0x5
	.uleb128 0x210
	.4byte	.LASF831
	.byte	0x5
	.uleb128 0x211
	.4byte	.LASF832
	.byte	0x5
	.uleb128 0x212
	.4byte	.LASF833
	.byte	0x5
	.uleb128 0x213
	.4byte	.LASF834
	.byte	0x5
	.uleb128 0x218
	.4byte	.LASF835
	.byte	0x5
	.uleb128 0x219
	.4byte	.LASF836
	.byte	0x5
	.uleb128 0x21a
	.4byte	.LASF837
	.byte	0x5
	.uleb128 0x21b
	.4byte	.LASF838
	.byte	0x5
	.uleb128 0x21c
	.4byte	.LASF839
	.byte	0x5
	.uleb128 0x21d
	.4byte	.LASF840
	.byte	0x5
	.uleb128 0x21e
	.4byte	.LASF841
	.byte	0x5
	.uleb128 0x21f
	.4byte	.LASF842
	.byte	0x5
	.uleb128 0x220
	.4byte	.LASF843
	.byte	0x5
	.uleb128 0x221
	.4byte	.LASF844
	.byte	0x5
	.uleb128 0x222
	.4byte	.LASF845
	.byte	0x5
	.uleb128 0x224
	.4byte	.LASF846
	.byte	0x5
	.uleb128 0x225
	.4byte	.LASF847
	.byte	0x5
	.uleb128 0x226
	.4byte	.LASF848
	.byte	0x5
	.uleb128 0x228
	.4byte	.LASF849
	.byte	0x5
	.uleb128 0x229
	.4byte	.LASF850
	.byte	0x5
	.uleb128 0x22a
	.4byte	.LASF851
	.byte	0x5
	.uleb128 0x22b
	.4byte	.LASF852
	.byte	0x5
	.uleb128 0x22d
	.4byte	.LASF853
	.byte	0x5
	.uleb128 0x22e
	.4byte	.LASF854
	.byte	0x5
	.uleb128 0x22f
	.4byte	.LASF855
	.byte	0x5
	.uleb128 0x231
	.4byte	.LASF856
	.byte	0x5
	.uleb128 0x232
	.4byte	.LASF857
	.byte	0x5
	.uleb128 0x234
	.4byte	.LASF858
	.byte	0x5
	.uleb128 0x235
	.4byte	.LASF859
	.byte	0x5
	.uleb128 0x23a
	.4byte	.LASF860
	.byte	0x5
	.uleb128 0x23b
	.4byte	.LASF861
	.byte	0x5
	.uleb128 0x23c
	.4byte	.LASF862
	.byte	0x5
	.uleb128 0x23d
	.4byte	.LASF863
	.byte	0x5
	.uleb128 0x242
	.4byte	.LASF864
	.byte	0x5
	.uleb128 0x243
	.4byte	.LASF865
	.byte	0x5
	.uleb128 0x244
	.4byte	.LASF866
	.byte	0x5
	.uleb128 0x245
	.4byte	.LASF867
	.byte	0x5
	.uleb128 0x246
	.4byte	.LASF868
	.byte	0x5
	.uleb128 0x247
	.4byte	.LASF869
	.byte	0x5
	.uleb128 0x248
	.4byte	.LASF870
	.byte	0x5
	.uleb128 0x249
	.4byte	.LASF871
	.byte	0x5
	.uleb128 0x24e
	.4byte	.LASF872
	.byte	0x5
	.uleb128 0x24f
	.4byte	.LASF873
	.byte	0x5
	.uleb128 0x250
	.4byte	.LASF874
	.byte	0x5
	.uleb128 0x251
	.4byte	.LASF875
	.byte	0x5
	.uleb128 0x252
	.4byte	.LASF876
	.byte	0x5
	.uleb128 0x253
	.4byte	.LASF877
	.byte	0x5
	.uleb128 0x254
	.4byte	.LASF878
	.byte	0x5
	.uleb128 0x259
	.4byte	.LASF879
	.byte	0x5
	.uleb128 0x25a
	.4byte	.LASF880
	.byte	0x5
	.uleb128 0x25b
	.4byte	.LASF881
	.byte	0x5
	.uleb128 0x25c
	.4byte	.LASF882
	.byte	0x5
	.uleb128 0x25d
	.4byte	.LASF883
	.byte	0x5
	.uleb128 0x25e
	.4byte	.LASF884
	.byte	0x5
	.uleb128 0x263
	.4byte	.LASF885
	.byte	0x5
	.uleb128 0x264
	.4byte	.LASF886
	.byte	0x5
	.uleb128 0x265
	.4byte	.LASF887
	.byte	0x5
	.uleb128 0x266
	.4byte	.LASF888
	.byte	0x5
	.uleb128 0x267
	.4byte	.LASF889
	.byte	0x5
	.uleb128 0x268
	.4byte	.LASF890
	.byte	0x5
	.uleb128 0x269
	.4byte	.LASF891
	.byte	0x5
	.uleb128 0x26a
	.4byte	.LASF892
	.byte	0x5
	.uleb128 0x26c
	.4byte	.LASF893
	.byte	0x5
	.uleb128 0x26d
	.4byte	.LASF894
	.byte	0x5
	.uleb128 0x26e
	.4byte	.LASF895
	.byte	0x5
	.uleb128 0x26f
	.4byte	.LASF896
	.byte	0x5
	.uleb128 0x270
	.4byte	.LASF897
	.byte	0x5
	.uleb128 0x271
	.4byte	.LASF898
	.byte	0x5
	.uleb128 0x273
	.4byte	.LASF899
	.byte	0x5
	.uleb128 0x274
	.4byte	.LASF900
	.byte	0x5
	.uleb128 0x275
	.4byte	.LASF901
	.byte	0x5
	.uleb128 0x276
	.4byte	.LASF902
	.byte	0x5
	.uleb128 0x277
	.4byte	.LASF903
	.byte	0x5
	.uleb128 0x278
	.4byte	.LASF904
	.byte	0x5
	.uleb128 0x27d
	.4byte	.LASF905
	.byte	0x5
	.uleb128 0x27e
	.4byte	.LASF906
	.byte	0x5
	.uleb128 0x27f
	.4byte	.LASF907
	.byte	0x5
	.uleb128 0x280
	.4byte	.LASF908
	.byte	0x5
	.uleb128 0x281
	.4byte	.LASF909
	.byte	0x5
	.uleb128 0x282
	.4byte	.LASF910
	.byte	0x5
	.uleb128 0x283
	.4byte	.LASF911
	.byte	0x5
	.uleb128 0x284
	.4byte	.LASF912
	.byte	0x5
	.uleb128 0x285
	.4byte	.LASF913
	.byte	0x5
	.uleb128 0x28a
	.4byte	.LASF914
	.byte	0x5
	.uleb128 0x28b
	.4byte	.LASF915
	.byte	0x5
	.uleb128 0x28c
	.4byte	.LASF916
	.byte	0x5
	.uleb128 0x28d
	.4byte	.LASF917
	.byte	0x5
	.uleb128 0x28e
	.4byte	.LASF918
	.byte	0x5
	.uleb128 0x28f
	.4byte	.LASF919
	.byte	0x5
	.uleb128 0x291
	.4byte	.LASF920
	.byte	0x5
	.uleb128 0x292
	.4byte	.LASF921
	.byte	0x5
	.uleb128 0x293
	.4byte	.LASF922
	.byte	0x5
	.uleb128 0x294
	.4byte	.LASF923
	.byte	0x5
	.uleb128 0x295
	.4byte	.LASF924
	.byte	0x5
	.uleb128 0x296
	.4byte	.LASF925
	.byte	0x5
	.uleb128 0x297
	.4byte	.LASF926
	.byte	0x5
	.uleb128 0x298
	.4byte	.LASF927
	.byte	0x5
	.uleb128 0x299
	.4byte	.LASF928
	.byte	0x5
	.uleb128 0x29a
	.4byte	.LASF929
	.byte	0x5
	.uleb128 0x29b
	.4byte	.LASF930
	.byte	0x5
	.uleb128 0x29c
	.4byte	.LASF931
	.byte	0x5
	.uleb128 0x29d
	.4byte	.LASF932
	.byte	0x5
	.uleb128 0x29e
	.4byte	.LASF933
	.byte	0x5
	.uleb128 0x29f
	.4byte	.LASF934
	.byte	0x5
	.uleb128 0x2a1
	.4byte	.LASF935
	.byte	0x5
	.uleb128 0x2a2
	.4byte	.LASF936
	.byte	0x5
	.uleb128 0x2a3
	.4byte	.LASF937
	.byte	0x5
	.uleb128 0x2a8
	.4byte	.LASF938
	.byte	0x5
	.uleb128 0x2a9
	.4byte	.LASF939
	.byte	0x5
	.uleb128 0x2aa
	.4byte	.LASF940
	.byte	0x5
	.uleb128 0x2ab
	.4byte	.LASF941
	.byte	0x5
	.uleb128 0x2ac
	.4byte	.LASF942
	.byte	0x5
	.uleb128 0x2ad
	.4byte	.LASF943
	.byte	0x5
	.uleb128 0x2ae
	.4byte	.LASF944
	.byte	0x5
	.uleb128 0x2af
	.4byte	.LASF945
	.byte	0x5
	.uleb128 0x2b0
	.4byte	.LASF946
	.byte	0x5
	.uleb128 0x2b1
	.4byte	.LASF947
	.byte	0x5
	.uleb128 0x2b2
	.4byte	.LASF948
	.byte	0x5
	.uleb128 0x2b3
	.4byte	.LASF949
	.byte	0x5
	.uleb128 0x2b8
	.4byte	.LASF950
	.byte	0x5
	.uleb128 0x2b9
	.4byte	.LASF951
	.byte	0x5
	.uleb128 0x2ba
	.4byte	.LASF952
	.byte	0x5
	.uleb128 0x2bb
	.4byte	.LASF953
	.byte	0x5
	.uleb128 0x2bc
	.4byte	.LASF954
	.byte	0x5
	.uleb128 0x2bd
	.4byte	.LASF955
	.byte	0x5
	.uleb128 0x2be
	.4byte	.LASF956
	.byte	0x5
	.uleb128 0x2bf
	.4byte	.LASF957
	.byte	0x5
	.uleb128 0x2c4
	.4byte	.LASF958
	.byte	0x5
	.uleb128 0x2c5
	.4byte	.LASF959
	.byte	0x5
	.uleb128 0x2c6
	.4byte	.LASF960
	.byte	0x5
	.uleb128 0x2c7
	.4byte	.LASF961
	.byte	0x5
	.uleb128 0x2c8
	.4byte	.LASF962
	.byte	0x5
	.uleb128 0x2c9
	.4byte	.LASF963
	.byte	0x5
	.uleb128 0x2ca
	.4byte	.LASF964
	.byte	0x5
	.uleb128 0x2cb
	.4byte	.LASF965
	.byte	0x5
	.uleb128 0x2cc
	.4byte	.LASF966
	.byte	0x5
	.uleb128 0x2cd
	.4byte	.LASF967
	.byte	0x5
	.uleb128 0x2ce
	.4byte	.LASF968
	.byte	0x5
	.uleb128 0x2cf
	.4byte	.LASF969
	.byte	0x5
	.uleb128 0x2d0
	.4byte	.LASF970
	.byte	0x5
	.uleb128 0x2d1
	.4byte	.LASF971
	.byte	0x5
	.uleb128 0x2d2
	.4byte	.LASF972
	.byte	0x5
	.uleb128 0x2d3
	.4byte	.LASF973
	.byte	0x5
	.uleb128 0x2d4
	.4byte	.LASF974
	.byte	0x5
	.uleb128 0x2d5
	.4byte	.LASF975
	.byte	0x5
	.uleb128 0x2d6
	.4byte	.LASF976
	.byte	0x5
	.uleb128 0x2d7
	.4byte	.LASF977
	.byte	0x5
	.uleb128 0x2d8
	.4byte	.LASF978
	.byte	0x5
	.uleb128 0x2d9
	.4byte	.LASF979
	.byte	0x5
	.uleb128 0x2da
	.4byte	.LASF980
	.byte	0x5
	.uleb128 0x2db
	.4byte	.LASF981
	.byte	0x5
	.uleb128 0x2dc
	.4byte	.LASF982
	.byte	0x5
	.uleb128 0x2dd
	.4byte	.LASF983
	.byte	0x5
	.uleb128 0x2de
	.4byte	.LASF984
	.byte	0x5
	.uleb128 0x2df
	.4byte	.LASF985
	.byte	0x5
	.uleb128 0x2e0
	.4byte	.LASF986
	.byte	0x5
	.uleb128 0x2e5
	.4byte	.LASF987
	.byte	0x5
	.uleb128 0x2e6
	.4byte	.LASF988
	.byte	0x5
	.uleb128 0x2e7
	.4byte	.LASF989
	.byte	0x5
	.uleb128 0x2e8
	.4byte	.LASF990
	.byte	0x5
	.uleb128 0x2e9
	.4byte	.LASF991
	.byte	0x5
	.uleb128 0x2ea
	.4byte	.LASF992
	.byte	0x5
	.uleb128 0x2eb
	.4byte	.LASF993
	.byte	0x5
	.uleb128 0x2ec
	.4byte	.LASF994
	.byte	0x5
	.uleb128 0x2ed
	.4byte	.LASF995
	.byte	0x5
	.uleb128 0x2ee
	.4byte	.LASF996
	.byte	0x5
	.uleb128 0x2ef
	.4byte	.LASF997
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cryptoauthlib.h.51.8779cf51d236bd1c9f5448af0768fe33,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF1001
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF1002
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF1003
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF1004
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.atca_basic.h.36.6be3a497e563a5016839c6ccaddc7ccc,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF1008
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF1009
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF1010
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF1011
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.atca_host.h.30.435aecc325b4fbff323e312baac1cb1d,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF1012
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF1013
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF1014
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF1015
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF1016
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF1017
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF1018
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF1019
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF1020
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF1021
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF1022
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF1023
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF1024
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF1025
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF1026
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF1027
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF1028
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF1029
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF1030
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF1031
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF1032
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF1174:
	.ascii	"ATCA_UNKNOWN_IFACE\000"
.LASF1125:
	.ascii	"ATCA_CHECKMAC_VERIFY_FAILED\000"
.LASF235:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF1178:
	.ascii	"baud\000"
.LASF184:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF769:
	.ascii	"KDF_DETAILS_IDX ATCA_DATA_IDX\000"
.LASF364:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF593:
	.ascii	"ATCA_SERIAL_NUM_SIZE (9)\000"
.LASF619:
	.ascii	"ATCA_RSP_SIZE_MIN ((uint8_t)4)\000"
.LASF1169:
	.ascii	"ATCA_SWI_IFACE\000"
.LASF217:
	.ascii	"__FLT64_DENORM_MIN__ 4.9406564584124654e-324F64\000"
.LASF636:
	.ascii	"ATCA_ZONE_OTP ((uint8_t)0x01)\000"
.LASF383:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF375:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF1113:
	.ascii	"size_t\000"
.LASF443:
	.ascii	"BOARD_PCA10040 1\000"
.LASF219:
	.ascii	"__FLT64_HAS_INFINITY__ 1\000"
.LASF457:
	.ascii	"__THREAD __thread\000"
.LASF328:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF348:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF320:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF1076:
	.ascii	"__towupper\000"
.LASF1191:
	.ascii	"halsend\000"
.LASF1145:
	.ascii	"ATCA_COMM_FAIL\000"
.LASF732:
	.ascii	"GENKEY_MODE_PRIVATE ((uint8_t)0x04)\000"
.LASF93:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF92:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF241:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF345:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF460:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF223:
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
.LASF1223:
	.ascii	"ATCADevice\000"
.LASF14:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF321:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF77:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF654:
	.ascii	"AES_MODE_MASK ((uint8_t)0xC7)\000"
.LASF308:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF1157:
	.ascii	"ATCA_STATUS\000"
.LASF1111:
	.ascii	"__RAL_error_decoder_t\000"
.LASF814:
	.ascii	"ATCA_UNLOCKED (0x55)\000"
.LASF880:
	.ascii	"READ_ADDR_IDX ATCA_PARAM2_IDX\000"
.LASF589:
	.ascii	"ATCA_SELFTEST ((uint8_t)0x77)\000"
.LASF1114:
	.ascii	"signed char\000"
.LASF1123:
	.ascii	"ATCA_DATA_ZONE_LOCKED\000"
.LASF604:
	.ascii	"ATCA_CHIPMODE_WATCHDOG_MASK ((uint8_t)0x04)\000"
.LASF20:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF169:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF1182:
	.ascii	"wordsize\000"
.LASF1238:
	.ascii	"zone\000"
.LASF268:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF1260:
	.ascii	"atcab_release\000"
.LASF334:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF518:
	.ascii	"INT_FAST32_MAX INT32_MAX\000"
.LASF304:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF256:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF96:
	.ascii	"__INTMAX_WIDTH__ 64\000"
.LASF482:
	.ascii	"ATCA_HAL_H_ \000"
.LASF341:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF1127:
	.ascii	"ATCA_STATUS_CRC\000"
.LASF34:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF1170:
	.ascii	"ATCA_UART_IFACE\000"
.LASF160:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF43:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF407:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF303:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF743:
	.ascii	"HMAC_MODE_FLAG_TK_NORAND ((uint8_t)0x04)\000"
.LASF199:
	.ascii	"__FLT32_DECIMAL_DIG__ 9\000"
.LASF1012:
	.ascii	"ATCA_HOST_H \000"
.LASF623:
	.ascii	"ATCA_RSP_SIZE_32 ((uint8_t)35)\000"
.LASF915:
	.ascii	"SHA_COUNT_LONG ATCA_CMD_SIZE_MIN\000"
.LASF180:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF178:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF1152:
	.ascii	"ATCA_TX_FAIL\000"
.LASF902:
	.ascii	"SECUREBOOTCONFIG_MODE_FULL_BOTH ((uint16_t)0x0001)\000"
.LASF121:
	.ascii	"__UINT8_C(c) c\000"
.LASF44:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF1069:
	.ascii	"time_format\000"
.LASF547:
	.ascii	"true 1\000"
.LASF214:
	.ascii	"__FLT64_MAX__ 1.7976931348623157e+308F64\000"
.LASF459:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF1098:
	.ascii	"__RAL_data_utf8_period\000"
.LASF497:
	.ascii	"INTMAX_MIN (-9223372036854775807LL-1)\000"
.LASF943:
	.ascii	"SIGN_MODE_INVALIDATE ((uint8_t)0x01)\000"
.LASF776:
	.ascii	"KDF_MODE_SOURCE_ALTKEYBUF ((uint8_t)0x03)\000"
.LASF557:
	.ascii	"ATCA_DEVTYPES_H_ \000"
.LASF531:
	.ascii	"UINT8_C(x) (x ##U)\000"
.LASF883:
	.ascii	"READ_4_RSP_SIZE ATCA_RSP_SIZE_VAL\000"
.LASF644:
	.ascii	"ATCA_TEMPKEY_KEYID (0xFFFF)\000"
.LASF478:
	.ascii	"NULL 0\000"
.LASF745:
	.ascii	"HMAC_MODE_FLAG_OTP64 ((uint8_t)0x20)\000"
.LASF376:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF1163:
	.ascii	"ATCADeviceType\000"
.LASF944:
	.ascii	"SIGN_MODE_INCLUDE_SN ((uint8_t)0x40)\000"
.LASF742:
	.ascii	"HMAC_MODE_FLAG_TK_RAND ((uint8_t)0x00)\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF291:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF878:
	.ascii	"RANDOM_RSP_SIZE ATCA_RSP_SIZE_32\000"
.LASF788:
	.ascii	"KDF_DETAILS_PRF_KEY_LEN_MASK ((uint32_t)0x00000003)"
	.ascii	"\000"
.LASF839:
	.ascii	"NONCE_COUNT_LONG (ATCA_CMD_SIZE_MIN + 32)\000"
.LASF1065:
	.ascii	"month_names\000"
.LASF886:
	.ascii	"SECUREBOOT_DIGEST_SIZE (32)\000"
.LASF62:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF1253:
	.ascii	"found\000"
.LASF731:
	.ascii	"GENKEY_MODE_MASK ((uint8_t)0x1C)\000"
.LASF666:
	.ascii	"CHECKMAC_CLIENT_RESPONSE_IDX (37)\000"
.LASF963:
	.ascii	"VERIFY_256_VALIDATE_COUNT ( 90)\000"
.LASF1142:
	.ascii	"ATCA_RX_TIMEOUT\000"
.LASF781:
	.ascii	"KDF_MODE_TARGET_ALTKEYBUF ((uint8_t)0x0C)\000"
.LASF1042:
	.ascii	"int_curr_symbol\000"
.LASF198:
	.ascii	"__FLT32_MAX_10_EXP__ 38\000"
.LASF752:
	.ascii	"INFO_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF463:
	.ascii	"__CTYPE_UPPER 0x01\000"
.LASF586:
	.ascii	"ATCA_AES ((uint8_t)0x51)\000"
.LASF264:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF142:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF195:
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
.LASF563:
	.ascii	"CMD_STATUS_BYTE_ECC ((uint8_t)0x05)\000"
.LASF104:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF1061:
	.ascii	"int_p_sign_posn\000"
.LASF796:
	.ascii	"KDF_DETAILS_PRF_AEAD_MASK ((uint32_t)0x00000600)\000"
.LASF1053:
	.ascii	"n_cs_precedes\000"
.LASF802:
	.ascii	"KDF_DETAILS_HKDF_MSG_LOC_TEMPKEY ((uint32_t)0x00000"
	.ascii	"001)\000"
.LASF1032:
	.ascii	"MAC_MODE_USE_TEMPKEY_MASK ((uint8_t)0x03)\000"
.LASF472:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF884:
	.ascii	"READ_32_RSP_SIZE ATCA_RSP_SIZE_32\000"
.LASF485:
	.ascii	"UINT8_MAX 255\000"
.LASF281:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF1193:
	.ascii	"halwake\000"
.LASF210:
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
.LASF212:
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
.LASF487:
	.ascii	"INT8_MIN (-128)\000"
.LASF135:
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 199901L\000"
.LASF171:
	.ascii	"__DBL_MAX__ ((double)1.1)\000"
.LASF950:
	.ascii	"UPDATE_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF917:
	.ascii	"SHA_DATA_MAX (64)\000"
.LASF260:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF1215:
	.ascii	"atreceive\000"
.LASF480:
	.ascii	"offsetof(s,m) ((size_t)&(((s *)0)->m))\000"
.LASF932:
	.ascii	"SHA_MODE_TARGET_TEMPKEY ((uint8_t)0x00)\000"
.LASF115:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF1049:
	.ascii	"int_frac_digits\000"
.LASF301:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF366:
	.ascii	"__USA_FBIT__ 16\000"
.LASF1211:
	.ascii	"mIfaceCFG\000"
.LASF340:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF522:
	.ascii	"UINT_FAST32_MAX UINT32_MAX\000"
.LASF370:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF747:
	.ascii	"HMAC_MODE_MASK ((uint8_t)0x74)\000"
.LASF697:
	.ascii	"DERIVE_KEY_MAC_SIZE (32)\000"
.LASF1269:
	.ascii	"deleteATCADevice\000"
.LASF1167:
	.ascii	"ATCACommand\000"
.LASF717:
	.ascii	"GENDIG_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF209:
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
.LASF90:
	.ascii	"__PTRDIFF_WIDTH__ 32\000"
.LASF1023:
	.ascii	"ATCA_WRITE_MAC_ZEROS_SIZE (25)\000"
.LASF530:
	.ascii	"INT8_C(x) (x)\000"
.LASF136:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF584:
	.ascii	"ATCA_COUNTER ((uint8_t)0x24)\000"
.LASF240:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF909:
	.ascii	"SELFTEST_MODE_ECDH ((uint8_t)0x08)\000"
.LASF156:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF317:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF131:
	.ascii	"__INT_FAST16_WIDTH__ 32\000"
.LASF995:
	.ascii	"WRITE_ZONE_OTP ((uint8_t)1)\000"
.LASF1197:
	.ascii	"atcai2c\000"
.LASF416:
	.ascii	"__VFP_FP__ 1\000"
.LASF923:
	.ascii	"SHA_MODE_SHA256_END ((uint8_t)0x02)\000"
.LASF288:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF140:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF870:
	.ascii	"PRIVWRITE_MODE_ENCRYPT ((uint8_t)0x40)\000"
.LASF137:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF1155:
	.ascii	"ATCA_HEALTH_TEST_ERROR\000"
.LASF861:
	.ascii	"PAUSE_PARAM2_IDX ATCA_PARAM2_IDX\000"
.LASF1175:
	.ascii	"ATCAIfaceType\000"
.LASF1233:
	.ascii	"atcab_b64rules_mime\000"
.LASF741:
	.ascii	"HMAC_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF996:
	.ascii	"WRITE_ZONE_DATA ((uint8_t)2)\000"
.LASF239:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF273:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF490:
	.ascii	"INT16_MAX 32767\000"
.LASF549:
	.ascii	"__bool_true_false_are_defined 1\000"
.LASF1231:
	.ascii	"cfg_atsha204a_kithid_default\000"
.LASF920:
	.ascii	"SHA_MODE_MASK ((uint8_t)0x07)\000"
.LASF233:
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
.LASF1068:
	.ascii	"date_format\000"
.LASF746:
	.ascii	"HMAC_MODE_FLAG_FULLSN ((uint8_t)0x40)\000"
.LASF793:
	.ascii	"KDF_DETAILS_PRF_TARGET_LEN_MASK ((uint32_t)0x000001"
	.ascii	"00)\000"
.LASF1021:
	.ascii	"ATCA_COMMAND_HEADER_SIZE ( 4)\000"
.LASF967:
	.ascii	"VERIFY_256_KEY_SIZE ( 64)\000"
.LASF55:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF1044:
	.ascii	"mon_decimal_point\000"
.LASF1235:
	.ascii	"_gDevice\000"
.LASF306:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF1029:
	.ascii	"ATCA_SN_0_DEF (0x01)\000"
.LASF312:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF1036:
	.ascii	"long int\000"
.LASF715:
	.ascii	"GENDIG_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF134:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF227:
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
.LASF462:
	.ascii	"__CODE \000"
.LASF517:
	.ascii	"INT_FAST16_MAX INT32_MAX\000"
.LASF234:
	.ascii	"__FLT32X_HAS_QUIET_NAN__ 1\000"
.LASF275:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF594:
	.ascii	"ATCA_RSP_SIZE_VAL ((uint8_t)7)\000"
.LASF1108:
	.ascii	"__RAL_error_decoder_s\000"
.LASF250:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF59:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF368:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF718:
	.ascii	"GENDIG_ZONE_CONFIG ((uint8_t)0)\000"
.LASF453:
	.ascii	"ATCA_BASIC_H_ \000"
.LASF1089:
	.ascii	"__RAL_global_locale\000"
.LASF95:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF33:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF51:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF565:
	.ascii	"CMD_STATUS_BYTE_COMM ((uint8_t)0xFF)\000"
.LASF379:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF1187:
	.ascii	"guid\000"
.LASF424:
	.ascii	"__ARM_NEON__\000"
.LASF751:
	.ascii	"INFO_PARAM2_IDX ATCA_PARAM2_IDX\000"
.LASF197:
	.ascii	"__FLT32_MAX_EXP__ 128\000"
.LASF297:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF738:
	.ascii	"GENKEY_RSP_SIZE_LONG ATCA_RSP_SIZE_64\000"
.LASF427:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF294:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF1162:
	.ascii	"ATCA_DEV_UNKNOWN\000"
.LASF682:
	.ascii	"COUNTER_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF927:
	.ascii	"SHA_MODE_HMAC_END ((uint8_t)0x05)\000"
.LASF224:
	.ascii	"__FLT32X_MIN_10_EXP__ (-307)\000"
.LASF720:
	.ascii	"GENDIG_ZONE_DATA ((uint8_t)2)\000"
.LASF41:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF847:
	.ascii	"NONCE_MODE_INPUT_LEN_32 ((uint8_t)0x00)\000"
.LASF422:
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
.LASF1234:
	.ascii	"atcab_b64rules_urlsafe\000"
.LASF767:
	.ascii	"KDF_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF496:
	.ascii	"UINT64_MAX 18446744073709551615ULL\000"
.LASF969:
	.ascii	"VERIFY_256_SIGNATURE_SIZE ( 64)\000"
.LASF624:
	.ascii	"ATCA_RSP_SIZE_16 ((uint8_t)19)\000"
.LASF138:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF153:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF19:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF918:
	.ascii	"ATCA_SHA256_BLOCK_SIZE (64)\000"
.LASF832:
	.ascii	"MAC_SIZE (32)\000"
.LASF791:
	.ascii	"KDF_DETAILS_PRF_KEY_LEN_48 ((uint32_t)0x00000002)\000"
.LASF1267:
	.ascii	"hal_swi_discover_buses\000"
.LASF23:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF116:
	.ascii	"__INT_LEAST32_WIDTH__ 32\000"
.LASF1225:
	.ascii	"cfg_ateccx08a_swi_default\000"
.LASF1264:
	.ascii	"atcab_version\000"
.LASF848:
	.ascii	"NONCE_MODE_INPUT_LEN_64 ((uint8_t)0x20)\000"
.LASF510:
	.ascii	"UINT_LEAST32_MAX UINT32_MAX\000"
.LASF674:
	.ascii	"CHECKMAC_MODE_MASK ((uint8_t)0x27)\000"
.LASF1219:
	.ascii	"hal_data\000"
.LASF524:
	.ascii	"PTRDIFF_MIN INT32_MIN\000"
.LASF572:
	.ascii	"ATCA_LOCK ((uint8_t)0x17)\000"
.LASF1254:
	.ascii	"swi_buses\000"
.LASF749:
	.ascii	"HMAC_RSP_SIZE ATCA_RSP_SIZE_32\000"
.LASF805:
	.ascii	"KDF_DETAILS_HKDF_ZERO_KEY ((uint32_t)0x00000004)\000"
.LASF188:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF970:
	.ascii	"VERIFY_283_SIGNATURE_SIZE ( 72)\000"
.LASF246:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF1079:
	.ascii	"__mbtowc\000"
.LASF521:
	.ascii	"UINT_FAST16_MAX UINT32_MAX\000"
.LASF152:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF670:
	.ascii	"CHECKMAC_MODE_BLOCK2_TEMPKEY ((uint8_t)0x01)\000"
.LASF1112:
	.ascii	"__RAL_error_decoder_head\000"
.LASF971:
	.ascii	"VERIFY_OTHER_DATA_SIZE ( 19)\000"
.LASF1207:
	.ascii	"ATCAIfaceCfg\000"
.LASF114:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF50:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF555:
	.ascii	"ATCA_UINT64_HOST_TO_BE(x) __builtin_bswap64(x)\000"
.LASF1019:
	.ascii	"ATCA_MSG_SIZE_ENCRYPT_MAC (96)\000"
.LASF1115:
	.ascii	"uint8_t\000"
.LASF914:
	.ascii	"SHA_COUNT_SHORT ATCA_CMD_SIZE_MIN\000"
.LASF934:
	.ascii	"SHA_MODE_TARGET_OUT_ONLY ((uint8_t)0xC0)\000"
.LASF683:
	.ascii	"COUNTER_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF423:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF703:
	.ascii	"ECDH_MODE_SOURCE_TEMPKEY ((uint8_t)0x01)\000"
.LASF374:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF660:
	.ascii	"AES_MODE_KEY_BLOCK_POS (6)\000"
.LASF1078:
	.ascii	"__wctomb\000"
.LASF266:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF330:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF382:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF702:
	.ascii	"ECDH_MODE_SOURCE_EEPROM_SLOT ((uint8_t)0x00)\000"
.LASF122:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF1159:
	.ascii	"ATECC108A\000"
.LASF906:
	.ascii	"SELFTEST_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF1056:
	.ascii	"n_sign_posn\000"
.LASF933:
	.ascii	"SHA_MODE_TARGET_MSGDIGBUF ((uint8_t)0x40)\000"
.LASF481:
	.ascii	"__string_H \000"
.LASF1164:
	.ascii	"atca_command\000"
.LASF1210:
	.ascii	"mType\000"
.LASF133:
	.ascii	"__INT_FAST32_WIDTH__ 32\000"
.LASF1263:
	.ascii	"atcab_init\000"
.LASF65:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF1071:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF22:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF231:
	.ascii	"__FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x\000"
.LASF1171:
	.ascii	"ATCA_SPI_IFACE\000"
.LASF154:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF621:
	.ascii	"ATCA_RSP_SIZE_72 ((uint8_t)75)\000"
.LASF1214:
	.ascii	"atsend\000"
.LASF251:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF1054:
	.ascii	"n_sep_by_space\000"
.LASF693:
	.ascii	"DERIVE_KEY_COUNT_SMALL ATCA_CMD_SIZE_MIN\000"
.LASF642:
	.ascii	"ATCA_ADDRESS_MASK_OTP (0x000F)\000"
.LASF132:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF763:
	.ascii	"INFO_PARAM2_LATCH_SET ((uint16_t)0x0001)\000"
.LASF826:
	.ascii	"MAC_MODE_PTNONCE_TEMPKEY ((uint8_t)0x06)\000"
.LASF764:
	.ascii	"INFO_PARAM2_LATCH_CLEAR ((uint16_t)0x0000)\000"
.LASF541:
	.ascii	"WCHAR_MAX 2147483647L\000"
.LASF782:
	.ascii	"KDF_MODE_TARGET_OUTPUT ((uint8_t)0x10)\000"
.LASF494:
	.ascii	"INT64_MIN (-9223372036854775807LL-1)\000"
.LASF891:
	.ascii	"SECUREBOOT_RSP_SIZE_NO_MAC ATCA_RSP_SIZE_MIN\000"
.LASF447:
	.ascii	"INITIALIZE_USER_SECTIONS 1\000"
.LASF213:
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
.LASF168:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF344:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF442:
	.ascii	"ATCA_HAL_SWI 1\000"
.LASF536:
	.ascii	"INT64_C(x) (x ##LL)\000"
.LASF255:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF580:
	.ascii	"ATCA_UPDATE_EXTRA ((uint8_t)0x20)\000"
.LASF657:
	.ascii	"AES_MODE_ENCRYPT ((uint8_t)0x00)\000"
.LASF174:
	.ascii	"__DBL_DENORM_MIN__ ((double)1.1)\000"
.LASF951:
	.ascii	"UPDATE_VALUE_IDX ATCA_PARAM2_IDX\000"
.LASF1251:
	.ascii	"max_ifaces\000"
.LASF489:
	.ascii	"INT16_MIN (-32767-1)\000"
.LASF1247:
	.ascii	"mem_zone\000"
.LASF21:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF1133:
	.ascii	"ATCA_BAD_PARAM\000"
.LASF1236:
	.ascii	"_Bool\000"
.LASF705:
	.ascii	"ECDH_MODE_OUTPUT_CLEAR ((uint8_t)0x00)\000"
.LASF817:
	.ascii	"MAC_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF588:
	.ascii	"ATCA_SECUREBOOT ((uint8_t)0x80)\000"
.LASF728:
	.ascii	"GENKEY_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF965:
	.ascii	"VERIFY_256_EXTERNAL_COUNT (135)\000"
.LASF759:
	.ascii	"INFO_NO_STATE ((uint8_t)0x00)\000"
.LASF993:
	.ascii	"WRITE_ZONE_MASK ((uint8_t)0xC3)\000"
.LASF24:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF390:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF36:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF701:
	.ascii	"ECDH_MODE_SOURCE_MASK ((uint8_t)0x01)\000"
.LASF1037:
	.ascii	"char\000"
.LASF367:
	.ascii	"__USA_IBIT__ 16\000"
.LASF908:
	.ascii	"SELFTEST_MODE_ECDSA_SIGN_VERIFY ((uint8_t)0x02)\000"
.LASF377:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF941:
	.ascii	"SIGN_MODE_MASK ((uint8_t)0xE1)\000"
.LASF698:
	.ascii	"DERIVE_KEY_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF1176:
	.ascii	"ATCAI2C\000"
.LASF1237:
	.ascii	"atca_version\000"
.LASF66:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF244:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF1028:
	.ascii	"ENCRYPTION_KEY_SIZE (64)\000"
.LASF1134:
	.ascii	"ATCA_INVALID_ID\000"
.LASF921:
	.ascii	"SHA_MODE_SHA256_START ((uint8_t)0x00)\000"
.LASF356:
	.ascii	"__HA_FBIT__ 7\000"
.LASF1136:
	.ascii	"ATCA_RX_CRC_ERROR\000"
.LASF926:
	.ascii	"SHA_MODE_HMAC_UPDATE ((uint8_t)0x01)\000"
.LASF677:
	.ascii	"CHECKMAC_OTHER_DATA_SIZE (13)\000"
.LASF622:
	.ascii	"ATCA_RSP_SIZE_64 ((uint8_t)67)\000"
.LASF973:
	.ascii	"VERIFY_MODE_STORED ((uint8_t)0x00)\000"
.LASF643:
	.ascii	"ATCA_ADDRESS_MASK (0x007F)\000"
.LASF538:
	.ascii	"INTMAX_C(x) (x ##LL)\000"
.LASF734:
	.ascii	"GENKEY_MODE_DIGEST ((uint8_t)0x08)\000"
.LASF760:
	.ascii	"INFO_OUTPUT_STATE_MASK ((uint8_t)0x01)\000"
.LASF262:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF1100:
	.ascii	"__RAL_data_utf8_space\000"
.LASF795:
	.ascii	"KDF_DETAILS_PRF_TARGET_LEN_64 ((uint32_t)0x00000100"
	.ascii	")\000"
.LASF841:
	.ascii	"NONCE_MODE_MASK ((uint8_t)0x03)\000"
.LASF263:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF625:
	.ascii	"ATCA_RSP_SIZE_MAX ((uint8_t)75)\000"
.LASF437:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF425:
	.ascii	"__ARM_NEON\000"
.LASF1200:
	.ascii	"atcahid\000"
.LASF1278:
	.ascii	"timeval\000"
.LASF887:
	.ascii	"SECUREBOOT_SIGNATURE_SIZE (64)\000"
.LASF182:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF1165:
	.ascii	"clock_divider\000"
.LASF639:
	.ascii	"ATCA_ZONE_ENCRYPTED ((uint8_t)0x40)\000"
.LASF835:
	.ascii	"NONCE_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF587:
	.ascii	"ATCA_KDF ((uint8_t)0x56)\000"
.LASF175:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF1256:
	.ascii	"atcab_idle\000"
.LASF855:
	.ascii	"NONCE_ZERO_CALC_TEMPKEY ((uint16_t)0x8000)\000"
.LASF820:
	.ascii	"MAC_COUNT_SHORT ATCA_CMD_SIZE_MIN\000"
.LASF467:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF1097:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF71:
	.ascii	"__GXX_ABI_VERSION 1011\000"
.LASF872:
	.ascii	"RANDOM_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF360:
	.ascii	"__DA_FBIT__ 31\000"
.LASF658:
	.ascii	"AES_MODE_DECRYPT ((uint8_t)0x01)\000"
.LASF975:
	.ascii	"VERIFY_MODE_EXTERNAL ((uint8_t)0x02)\000"
.LASF111:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF799:
	.ascii	"KDF_DETAILS_AES_KEY_LOC_MASK ((uint32_t)0x00000003)"
	.ascii	"\000"
.LASF1011:
	.ascii	"ATCA_AES_GCM_IV_STD_LENGTH 12\000"
.LASF474:
	.ascii	"__CTYPE_PRINT (__CTYPE_BLANK | __CTYPE_PUNCT | __CT"
	.ascii	"YPE_UPPER | __CTYPE_LOWER | __CTYPE_DIGIT)\000"
.LASF1045:
	.ascii	"mon_thousands_sep\000"
.LASF610:
	.ascii	"ATCA_CHIPMODE_CLOCK_DIV_M2 ((uint8_t)0x68)\000"
.LASF811:
	.ascii	"LOCK_ZONE_DATA_SLOT ((uint8_t)0x02)\000"
.LASF70:
	.ascii	"__has_include_next(STR) __has_include_next__(STR)\000"
.LASF612:
	.ascii	"ATCA_CRC_SIZE ((uint8_t)2)\000"
.LASF790:
	.ascii	"KDF_DETAILS_PRF_KEY_LEN_32 ((uint32_t)0x00000001)\000"
.LASF125:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF574:
	.ascii	"ATCA_NONCE ((uint8_t)0x16)\000"
.LASF789:
	.ascii	"KDF_DETAILS_PRF_KEY_LEN_16 ((uint32_t)0x00000000)\000"
.LASF313:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF603:
	.ascii	"ATCA_CHIPMODE_TTL_ENABLE_FLAG ((uint8_t)0x02)\000"
.LASF1077:
	.ascii	"__towlower\000"
.LASF1048:
	.ascii	"negative_sign\000"
.LASF641:
	.ascii	"ATCA_ADDRESS_MASK_CONFIG (0x001F)\000"
.LASF35:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF1186:
	.ascii	"packetsize\000"
.LASF1057:
	.ascii	"int_p_cs_precedes\000"
.LASF315:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF792:
	.ascii	"KDF_DETAILS_PRF_KEY_LEN_64 ((uint32_t)0x00000003)\000"
.LASF1109:
	.ascii	"decode\000"
.LASF384:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF617:
	.ascii	"ATCA_KEY_SIZE (32)\000"
.LASF770:
	.ascii	"KDF_DETAILS_SIZE 4\000"
.LASF888:
	.ascii	"SECUREBOOT_COUNT_DIG (ATCA_CMD_SIZE_MIN + SECUREBOO"
	.ascii	"T_DIGEST_SIZE)\000"
.LASF1228:
	.ascii	"cfg_atsha204a_i2c_default\000"
.LASF1168:
	.ascii	"ATCA_I2C_IFACE\000"
.LASF1242:
	.ascii	"atcab_get_addr\000"
.LASF516:
	.ascii	"INT_FAST8_MAX INT8_MAX\000"
.LASF388:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF801:
	.ascii	"KDF_DETAILS_HKDF_MSG_LOC_SLOT ((uint32_t)0x00000000"
	.ascii	")\000"
.LASF561:
	.ascii	"CMD_STATUS_WAKEUP ((uint8_t)0x11)\000"
.LASF316:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF1132:
	.ascii	"ATCA_GEN_FAIL\000"
.LASF1047:
	.ascii	"positive_sign\000"
.LASF201:
	.ascii	"__FLT32_MIN__ 1.1754943508222875e-38F32\000"
.LASF206:
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
.LASF1262:
	.ascii	"ca_device\000"
.LASF727:
	.ascii	"GENKEY_DATA_IDX (5)\000"
.LASF191:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF362:
	.ascii	"__TA_FBIT__ 63\000"
.LASF1216:
	.ascii	"atwake\000"
.LASF226:
	.ascii	"__FLT32X_MAX_10_EXP__ 308\000"
.LASF864:
	.ascii	"PRIVWRITE_ZONE_IDX ATCA_PARAM1_IDX\000"
.LASF911:
	.ascii	"SELFTEST_MODE_SHA ((uint8_t)0x20)\000"
.LASF982:
	.ascii	"VERIFY_KEY_B283 ((uint16_t)0x0000)\000"
.LASF546:
	.ascii	"bool _Bool\000"
.LASF858:
	.ascii	"NONCE_RSP_SIZE_SHORT ATCA_RSP_SIZE_MIN\000"
.LASF925:
	.ascii	"SHA_MODE_HMAC_START ((uint8_t)0x04)\000"
.LASF607:
	.ascii	"ATCA_CHIPMODE_CLOCK_DIV_MASK ((uint8_t)0xF8)\000"
.LASF661:
	.ascii	"AES_DATA_SIZE (16)\000"
.LASF98:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF1126:
	.ascii	"ATCA_PARSE_ERROR\000"
.LASF120:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF990:
	.ascii	"WRITE_MAC_VS_IDX ( 9)\000"
.LASF450:
	.ascii	"NRF52832_XXAA 1\000"
.LASF954:
	.ascii	"UPDATE_MODE_SELECTOR ((uint8_t)0x01)\000"
.LASF940:
	.ascii	"SIGN_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF167:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF874:
	.ascii	"RANDOM_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF1091:
	.ascii	"__RAL_codeset_ascii\000"
.LASF163:
	.ascii	"__FP_FAST_FMAF 1\000"
.LASF630:
	.ascii	"ATCA_OPCODE_IDX (1)\000"
.LASF851:
	.ascii	"NONCE_MODE_TARGET_MSGDIGBUF ((uint8_t)0x40)\000"
.LASF635:
	.ascii	"ATCA_ZONE_CONFIG ((uint8_t)0x00)\000"
.LASF1085:
	.ascii	"__RAL_locale_t\000"
.LASF860:
	.ascii	"PAUSE_SELECT_IDX ATCA_PARAM1_IDX\000"
.LASF113:
	.ascii	"__INT_LEAST16_WIDTH__ 16\000"
.LASF854:
	.ascii	"NONCE_ZERO_CALC_RANDOM ((uint16_t)0x0000)\000"
.LASF476:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF527:
	.ascii	"INTPTR_MIN INT32_MIN\000"
.LASF173:
	.ascii	"__DBL_EPSILON__ ((double)1.1)\000"
.LASF998:
	.ascii	"ATCA_DEVICE_H \000"
.LASF1275:
	.ascii	"GNU C99 7.2.1 20170904 (release) [ARM/embedded-7-br"
	.ascii	"anch revision 255204] -fmessage-length=0 -mcpu=cort"
	.ascii	"ex-m4 -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-s"
	.ascii	"p-d16 -mthumb -mtp=soft -g3 -gpubnames -std=gnu99 -"
	.ascii	"Os -fomit-frame-pointer -fno-dwarf2-cfi-asm -fno-bu"
	.ascii	"iltin -ffunction-sections -fdata-sections -fshort-e"
	.ascii	"nums -fno-common\000"
.LASF626:
	.ascii	"OUTNONCE_SIZE (32)\000"
.LASF248:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF265:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF501:
	.ascii	"INT_LEAST16_MIN INT16_MIN\000"
.LASF651:
	.ascii	"AES_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF261:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF1066:
	.ascii	"abbrev_month_names\000"
.LASF329:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF890:
	.ascii	"SECUREBOOT_MAC_SIZE (32)\000"
.LASF840:
	.ascii	"NONCE_COUNT_LONG_64 (ATCA_CMD_SIZE_MIN + 64)\000"
.LASF1226:
	.ascii	"cfg_ateccx08a_kitcdc_default\000"
.LASF373:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF107:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF560:
	.ascii	"CMD_STATUS_SUCCESS ((uint8_t)0x00)\000"
.LASF1084:
	.ascii	"codeset\000"
.LASF928:
	.ascii	"SHA_MODE_608_HMAC_END ((uint8_t)0x02)\000"
.LASF106:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF685:
	.ascii	"COUNTER_MODE_MASK ((uint8_t)0x01)\000"
.LASF735:
	.ascii	"GENKEY_MODE_PUBKEY_DIGEST ((uint8_t)0x10)\000"
.LASF108:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF389:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF395:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF402:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF1199:
	.ascii	"atcauart\000"
.LASF756:
	.ascii	"INFO_MODE_GPIO ((uint8_t)0x03)\000"
.LASF583:
	.ascii	"ATCA_ECDH ((uint8_t)0x43)\000"
.LASF155:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF653:
	.ascii	"AES_COUNT (23)\000"
.LASF558:
	.ascii	"ATCA_CMD_SIZE_MIN ((uint8_t)7)\000"
.LASF1250:
	.ascii	"cfg_array\000"
.LASF983:
	.ascii	"VERIFY_KEY_K283 ((uint16_t)0x0001)\000"
.LASF406:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF225:
	.ascii	"__FLT32X_MAX_EXP__ 1024\000"
.LASF69:
	.ascii	"__has_include(STR) __has_include__(STR)\000"
.LASF1139:
	.ascii	"ATCA_RESYNC_WITH_WAKEUP\000"
.LASF710:
	.ascii	"ECDH_MODE_COPY_TEMP_KEY ((uint8_t)0x08)\000"
.LASF124:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF823:
	.ascii	"MAC_MODE_BLOCK2_TEMPKEY ((uint8_t)0x01)\000"
.LASF568:
	.ascii	"ATCA_INFO ((uint8_t)0x30)\000"
.LASF895:
	.ascii	"SECUREBOOT_MODE_FULL_STORE ((uint8_t)0x06)\000"
.LASF768:
	.ascii	"KDF_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF278:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF633:
	.ascii	"ATCA_DATA_IDX (5)\000"
.LASF438:
	.ascii	"__SES_ARM 1\000"
.LASF119:
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
.LASF161:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF539:
	.ascii	"UINTMAX_C(x) (x ##ULL)\000"
.LASF1027:
	.ascii	"HMAC_BLOCK_SIZE (64)\000"
.LASF309:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF100:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF730:
	.ascii	"GENKEY_OTHER_DATA_SIZE (3)\000"
.LASF1198:
	.ascii	"atcaswi\000"
.LASF1014:
	.ascii	"ATCA_MSG_SIZE_MAC (88)\000"
.LASF1035:
	.ascii	"__wchar\000"
.LASF454:
	.ascii	"_ATCA_LIB_H \000"
.LASF258:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF359:
	.ascii	"__SA_IBIT__ 16\000"
.LASF185:
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
.LASF144:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF664:
	.ascii	"CHECKMAC_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF5:
	.ascii	"__GNUC__ 7\000"
.LASF418:
	.ascii	"__ARM_FP16_FORMAT_IEEE\000"
.LASF48:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF1080:
	.ascii	"__RAL_locale_data_t\000"
.LASF477:
	.ascii	"__RAL_SIZE_T_DEFINED \000"
.LASF491:
	.ascii	"UINT32_MAX 4294967295UL\000"
.LASF842:
	.ascii	"NONCE_MODE_SEED_UPDATE ((uint8_t)0x00)\000"
.LASF853:
	.ascii	"NONCE_ZERO_CALC_MASK ((uint16_t)0x8000)\000"
.LASF1274:
	.ascii	"strcpy\000"
.LASF1246:
	.ascii	"status\000"
.LASF1107:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF237:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF1096:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF146:
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
.LASF83:
	.ascii	"__SCHAR_WIDTH__ 8\000"
.LASF894:
	.ascii	"SECUREBOOT_MODE_FULL ((uint8_t)0x05)\000"
.LASF824:
	.ascii	"MAC_MODE_BLOCK1_TEMPKEY ((uint8_t)0x02)\000"
.LASF63:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF327:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF216:
	.ascii	"__FLT64_EPSILON__ 2.2204460492503131e-16F64\000"
.LASF1002:
	.ascii	"RETURN(status,message) { return status; }\000"
.LASF783:
	.ascii	"KDF_MODE_TARGET_OUTPUT_ENC ((uint8_t)0x14)\000"
.LASF354:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF825:
	.ascii	"MAC_MODE_SOURCE_FLAG_MATCH ((uint8_t)0x04)\000"
.LASF102:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF1006:
	.ascii	"ATCA_CRYPTO_SW_H \000"
.LASF750:
	.ascii	"INFO_PARAM1_IDX ATCA_PARAM1_IDX\000"
.LASF537:
	.ascii	"UINT64_C(x) (x ##ULL)\000"
.LASF649:
	.ascii	"ATCA_SHA_KEY_TYPE 7\000"
.LASF1272:
	.ascii	"newATCADevice\000"
.LASF117:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF1160:
	.ascii	"ATECC508A\000"
.LASF1190:
	.ascii	"halpostinit\000"
.LASF881:
	.ascii	"READ_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF253:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF193:
	.ascii	"__FLT32_MANT_DIG__ 24\000"
.LASF694:
	.ascii	"DERIVE_KEY_MODE ((uint8_t)0x04)\000"
.LASF543:
	.ascii	"WINT_MAX 2147483647L\000"
.LASF203:
	.ascii	"__FLT32_DENORM_MIN__ 1.4012984643248171e-45F32\000"
.LASF1122:
	.ascii	"ATCA_CONFIG_ZONE_LOCKED\000"
.LASF58:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF254:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF528:
	.ascii	"INTPTR_MAX INT32_MAX\000"
.LASF1121:
	.ascii	"ATCA_SUCCESS\000"
.LASF381:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF947:
	.ascii	"SIGN_MODE_SOURCE_TEMPKEY ((uint8_t)0x00)\000"
.LASF1067:
	.ascii	"am_pm_indicator\000"
.LASF722:
	.ascii	"GENDIG_ZONE_COUNTER ((uint8_t)4)\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF707:
	.ascii	"ECDH_MODE_COPY_MASK ((uint8_t)0x0C)\000"
.LASF232:
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
.LASF149:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF353:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF638:
	.ascii	"ATCA_ZONE_MASK ((uint8_t)0x03)\000"
.LASF15:
	.ascii	"__OPTIMIZE_SIZE__ 1\000"
.LASF16:
	.ascii	"__OPTIMIZE__ 1\000"
.LASF385:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF314:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF711:
	.ascii	"ECDH_MODE_COPY_OUTPUT_BUFFER ((uint8_t)0x0C)\000"
.LASF859:
	.ascii	"NONCE_RSP_SIZE_LONG ATCA_RSP_SIZE_32\000"
.LASF765:
	.ascii	"INFO_SIZE ((uint8_t)0x04)\000"
.LASF942:
	.ascii	"SIGN_MODE_INTERNAL ((uint8_t)0x00)\000"
.LASF810:
	.ascii	"LOCK_ZONE_DATA ((uint8_t)0x01)\000"
.LASF17:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF984:
	.ascii	"VERIFY_KEY_P256 ((uint16_t)0x0004)\000"
.LASF452:
	.ascii	"SWI_DISABLE0 1\000"
.LASF503:
	.ascii	"INT_LEAST64_MIN INT64_MIN\000"
.LASF103:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF396:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF737:
	.ascii	"GENKEY_RSP_SIZE_SHORT ATCA_RSP_SIZE_MIN\000"
.LASF974:
	.ascii	"VERIFY_MODE_VALIDATE_EXTERNAL ((uint8_t)0x01)\000"
.LASF292:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF1060:
	.ascii	"int_n_sep_by_space\000"
.LASF1224:
	.ascii	"cfg_ateccx08a_i2c_default\000"
.LASF794:
	.ascii	"KDF_DETAILS_PRF_TARGET_LEN_32 ((uint32_t)0x00000000"
	.ascii	")\000"
.LASF1020:
	.ascii	"ATCA_MSG_SIZE_PRIVWRITE_MAC (96)\000"
.LASF803:
	.ascii	"KDF_DETAILS_HKDF_MSG_LOC_INPUT ((uint32_t)0x0000000"
	.ascii	"2)\000"
.LASF1104:
	.ascii	"__user_set_time_of_day\000"
.LASF713:
	.ascii	"ECDH_RSP_SIZE ATCA_RSP_SIZE_64\000"
.LASF86:
	.ascii	"__LONG_WIDTH__ 32\000"
.LASF311:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF845:
	.ascii	"NONCE_MODE_PASSTHROUGH ((uint8_t)0x03)\000"
.LASF1209:
	.ascii	"atca_iface\000"
.LASF78:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF672:
	.ascii	"CHECKMAC_MODE_SOURCE_FLAG_MATCH ((uint8_t)0x04)\000"
.LASF1156:
	.ascii	"ATCA_ALLOC_FAILURE\000"
.LASF347:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF386:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF323:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF704:
	.ascii	"ECDH_MODE_OUTPUT_MASK ((uint8_t)0x02)\000"
.LASF556:
	.ascii	"ATCA_UINT64_BE_TO_HOST(x) __builtin_bswap64(x)\000"
.LASF409:
	.ascii	"__ARM_ARCH 7\000"
.LASF45:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF1268:
	.ascii	"hal_swi_discover_devices\000"
.LASF148:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF709:
	.ascii	"ECDH_MODE_COPY_EEPROM_SLOT ((uint8_t)0x04)\000"
.LASF1119:
	.ascii	"long long int\000"
.LASF1255:
	.ascii	"atcab_sleep\000"
.LASF1259:
	.ascii	"atcab_get_device\000"
.LASF844:
	.ascii	"NONCE_MODE_INVALID ((uint8_t)0x02)\000"
.LASF192:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF87:
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
.LASF189:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF748:
	.ascii	"HMAC_DIGEST_SIZE (32)\000"
.LASF898:
	.ascii	"SECUREBOOT_MODE_ENC_MAC_FLAG ((uint8_t)0x80)\000"
.LASF1179:
	.ascii	"ATCASWI\000"
.LASF139:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF1087:
	.ascii	"__locale_s\000"
.LASF615:
	.ascii	"ATCA_PRIV_KEY_SIZE (32)\000"
.LASF357:
	.ascii	"__HA_IBIT__ 8\000"
.LASF238:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF141:
	.ascii	"__INTPTR_WIDTH__ 32\000"
.LASF387:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF1220:
	.ascii	"atca_device\000"
.LASF744:
	.ascii	"HMAC_MODE_FLAG_OTP88 ((uint8_t)0x10)\000"
.LASF229:
	.ascii	"__FLT32X_MIN__ 2.2250738585072014e-308F32x\000"
.LASF519:
	.ascii	"INT_FAST64_MAX INT64_MAX\000"
.LASF211:
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
.LASF712:
	.ascii	"ECDH_KEY_SIZE ATCA_BLOCK_SIZE\000"
.LASF903:
	.ascii	"SECUREBOOTCONFIG_MODE_FULL_SIG ((uint16_t)0x0002)\000"
.LASF215:
	.ascii	"__FLT64_MIN__ 2.2250738585072014e-308F64\000"
.LASF987:
	.ascii	"WRITE_ZONE_IDX ATCA_PARAM1_IDX\000"
.LASF601:
	.ascii	"ATCA_CHIPMODE_OFFSET (19)\000"
.LASF846:
	.ascii	"NONCE_MODE_INPUT_LEN_MASK ((uint8_t)0x20)\000"
.LASF89:
	.ascii	"__WINT_WIDTH__ 32\000"
.LASF46:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF187:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF26:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF876:
	.ascii	"RANDOM_NO_SEED_UPDATE ((uint8_t)0x01)\000"
.LASF391:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF1221:
	.ascii	"mCommands\000"
.LASF1088:
	.ascii	"__category\000"
.LASF1158:
	.ascii	"ATSHA204A\000"
.LASF656:
	.ascii	"AES_MODE_OP_MASK ((uint8_t)0x07)\000"
.LASF696:
	.ascii	"DERIVE_KEY_RANDOM_FLAG ((uint8_t)4)\000"
.LASF809:
	.ascii	"LOCK_ZONE_CONFIG ((uint8_t)0x00)\000"
.LASF959:
	.ascii	"VERIFY_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF822:
	.ascii	"MAC_MODE_CHALLENGE ((uint8_t)0x00)\000"
.LASF274:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF57:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF1206:
	.ascii	"cfg_data\000"
.LASF700:
	.ascii	"ECDH_COUNT (ATCA_CMD_SIZE_MIN + ATCA_PUB_KEY_SIZE)\000"
.LASF483:
	.ascii	"_ATCA_STATUS_H \000"
.LASF1183:
	.ascii	"parity\000"
.LASF779:
	.ascii	"KDF_MODE_TARGET_TEMPKEY_UP ((uint8_t)0x04)\000"
.LASF564:
	.ascii	"CMD_STATUS_BYTE_EXEC ((uint8_t)0x0F)\000"
.LASF1166:
	.ascii	"execution_time_msec\000"
.LASF1070:
	.ascii	"date_time_format\000"
.LASF31:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF202:
	.ascii	"__FLT32_EPSILON__ 1.1920928955078125e-7F32\000"
.LASF426:
	.ascii	"__ARM_NEON_FP\000"
.LASF997:
	.ascii	"WRITE_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF800:
	.ascii	"KDF_DETAILS_HKDF_MSG_LOC_MASK ((uint32_t)0x00000003"
	.ascii	")\000"
.LASF889:
	.ascii	"SECUREBOOT_COUNT_DIG_SIG (ATCA_CMD_SIZE_MIN + SECUR"
	.ascii	"EBOOT_DIGEST_SIZE + SECUREBOOT_SIGNATURE_SIZE)\000"
.LASF609:
	.ascii	"ATCA_CHIPMODE_CLOCK_DIV_M1 ((uint8_t)0x28)\000"
.LASF784:
	.ascii	"KDF_MODE_ALG_MASK ((uint8_t)0x60)\000"
.LASF1153:
	.ascii	"ATCA_NOT_LOCKED\000"
.LASF808:
	.ascii	"LOCK_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF904:
	.ascii	"SECUREBOOTCONFIG_MODE_FULL_DIG ((uint16_t)0x0003)\000"
.LASF614:
	.ascii	"ATCA_PUB_KEY_SIZE (64)\000"
.LASF37:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF1245:
	.ascii	"addr\000"
.LASF352:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF159:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF81:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF434:
	.ascii	"__ARM_FEATURE_COPROC 15\000"
.LASF725:
	.ascii	"GENKEY_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF599:
	.ascii	"ATCA_DATA_SIZE (ATCA_KEY_COUNT * ATCA_KEY_SIZE)\000"
.LASF493:
	.ascii	"INT32_MIN (-2147483647L-1)\000"
.LASF827:
	.ascii	"MAC_MODE_PASSTHROUGH ((uint8_t)0x07)\000"
.LASF1038:
	.ascii	"unsigned int\000"
.LASF637:
	.ascii	"ATCA_ZONE_DATA ((uint8_t)0x02)\000"
.LASF500:
	.ascii	"INT_LEAST8_MIN INT8_MIN\000"
.LASF512:
	.ascii	"INT_FAST8_MIN INT8_MIN\000"
.LASF151:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF147:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF992:
	.ascii	"WRITE_MAC_SIZE (32)\000"
.LASF893:
	.ascii	"SECUREBOOT_MODE_MASK ((uint8_t)0x07)\000"
.LASF1271:
	.ascii	"atGetIFace\000"
.LASF302:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF865:
	.ascii	"PRIVWRITE_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF428:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF816:
	.ascii	"LOCK_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF1141:
	.ascii	"ATCA_TX_TIMEOUT\000"
.LASF627:
	.ascii	"ATCA_KEY_ID_MAX ((uint8_t)15)\000"
.LASF1124:
	.ascii	"ATCA_WAKE_FAILED\000"
.LASF150:
	.ascii	"__FLT_DIG__ 6\000"
.LASF39:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF616:
	.ascii	"ATCA_SIG_SIZE (64)\000"
.LASF1055:
	.ascii	"p_sign_posn\000"
.LASF913:
	.ascii	"SELFTEST_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF936:
	.ascii	"SHA_RSP_SIZE_SHORT ATCA_RSP_SIZE_MIN\000"
.LASF145:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF777:
	.ascii	"KDF_MODE_TARGET_MASK ((uint8_t)0x1C)\000"
.LASF620:
	.ascii	"ATCA_RSP_SIZE_4 ((uint8_t)7)\000"
.LASF72:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF129:
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF980:
	.ascii	"VERIFY_MODE_SOURCE_MSGDIGBUF ((uint8_t)0x20)\000"
.LASF956:
	.ascii	"UPDATE_MODE_DEC_COUNTER ((uint8_t)0x02)\000"
.LASF1154:
	.ascii	"ATCA_NO_DEVICES\000"
.LASF346:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF582:
	.ascii	"ATCA_WRITE ((uint8_t)0x12)\000"
.LASF949:
	.ascii	"SIGN_RSP_SIZE ATCA_RSP_SIZE_MAX\000"
.LASF338:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF699:
	.ascii	"ECDH_PREFIX_MODE ((uint8_t)0x00)\000"
.LASF243:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF143:
	.ascii	"__GCC_IEC_559 0\000"
.LASF552:
	.ascii	"ATCA_COMPILER_H_ \000"
.LASF279:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF393:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF1105:
	.ascii	"__user_get_time_of_day\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF444:
	.ascii	"BSP_DEFINES_ONLY 1\000"
.LASF439:
	.ascii	"__ARM_ARCH_FPV4_SP_D16__ 1\000"
.LASF432:
	.ascii	"__ARM_FEATURE_IDIV 1\000"
.LASF834:
	.ascii	"MAC_RSP_SIZE ATCA_RSP_SIZE_32\000"
.LASF32:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF592:
	.ascii	"ATCA_PUB_KEY_PAD (4)\000"
.LASF47:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF172:
	.ascii	"__DBL_MIN__ ((double)1.1)\000"
.LASF608:
	.ascii	"ATCA_CHIPMODE_CLOCK_DIV_M0 ((uint8_t)0x00)\000"
.LASF1261:
	.ascii	"atcab_init_device\000"
.LASF42:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF1230:
	.ascii	"cfg_atsha204a_kitcdc_default\000"
.LASF548:
	.ascii	"false 0\000"
.LASF850:
	.ascii	"NONCE_MODE_TARGET_TEMPKEY ((uint8_t)0x00)\000"
.LASF84:
	.ascii	"__SHRT_WIDTH__ 16\000"
.LASF30:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF837:
	.ascii	"NONCE_INPUT_IDX ATCA_DATA_IDX\000"
.LASF249:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF673:
	.ascii	"CHECKMAC_MODE_INCLUDE_OTP_64 ((uint8_t)0x20)\000"
.LASF662:
	.ascii	"AES_RSP_SIZE ATCA_RSP_SIZE_16\000"
.LASF218:
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
.LASF1092:
	.ascii	"__RAL_codeset_utf8\000"
.LASF1244:
	.ascii	"offset\000"
.LASF576:
	.ascii	"ATCA_PRIVWRITE ((uint8_t)0x46)\000"
.LASF1090:
	.ascii	"__RAL_c_locale\000"
.LASF833:
	.ascii	"MAC_MODE_MASK ((uint8_t)0x77)\000"
.LASF61:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF669:
	.ascii	"CHECKMAC_MODE_CHALLENGE ((uint8_t)0x00)\000"
.LASF1137:
	.ascii	"ATCA_RX_FAIL\000"
.LASF230:
	.ascii	"__FLT32X_EPSILON__ 2.2204460492503131e-16F32x\000"
.LASF571:
	.ascii	"ATCA_HMAC ((uint8_t)0x11)\000"
.LASF162:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF380:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF964:
	.ascii	"VERIFY_283_VALIDATE_COUNT ( 98)\000"
.LASF797:
	.ascii	"KDF_DETAILS_PRF_AEAD_MODE0 ((uint32_t)0x00000000)\000"
.LASF1243:
	.ascii	"block\000"
.LASF280:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF873:
	.ascii	"RANDOM_PARAM2_IDX ATCA_PARAM2_IDX\000"
.LASF675:
	.ascii	"CHECKMAC_CLIENT_CHALLENGE_SIZE (32)\000"
.LASF499:
	.ascii	"UINTMAX_MAX 18446744073709551615ULL\000"
.LASF1039:
	.ascii	"decimal_point\000"
.LASF405:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF688:
	.ascii	"COUNTER_MODE_INCREMENT ((uint8_t)0x01)\000"
.LASF1008:
	.ascii	"TBD void\000"
.LASF408:
	.ascii	"__arm__ 1\000"
.LASF733:
	.ascii	"GENKEY_MODE_PUBLIC ((uint8_t)0x00)\000"
.LASF270:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF1188:
	.ascii	"ATCACUSTOM\000"
.LASF196:
	.ascii	"__FLT32_MIN_10_EXP__ (-37)\000"
.LASF836:
	.ascii	"NONCE_PARAM2_IDX ATCA_PARAM2_IDX\000"
.LASF419:
	.ascii	"__ARM_FP16_FORMAT_ALTERNATIVE\000"
.LASF1189:
	.ascii	"halinit\000"
.LASF465:
	.ascii	"__CTYPE_DIGIT 0x04\000"
.LASF492:
	.ascii	"INT32_MAX 2147483647L\000"
.LASF1140:
	.ascii	"ATCA_PARITY_ERROR\000"
.LASF739:
	.ascii	"HMAC_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF1101:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF27:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF242:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF363:
	.ascii	"__TA_IBIT__ 64\000"
.LASF618:
	.ascii	"RSA2048_KEY_SIZE (256)\000"
.LASF989:
	.ascii	"WRITE_VALUE_IDX ATCA_DATA_IDX\000"
.LASF1024:
	.ascii	"ATCA_PRIVWRITE_MAC_ZEROS_SIZE (21)\000"
.LASF1022:
	.ascii	"ATCA_GENDIG_ZEROS_SIZE (25)\000"
.LASF399:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF821:
	.ascii	"MAC_COUNT_LONG (39)\000"
.LASF901:
	.ascii	"SECUREBOOTCONFIG_MODE_DISABLED ((uint16_t)0x0000)\000"
.LASF897:
	.ascii	"SECUREBOOT_MODE_PROHIBIT_FLAG ((uint8_t)0x40)\000"
.LASF76:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF663:
	.ascii	"CHECKMAC_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF766:
	.ascii	"INFO_RSP_SIZE ATCA_RSP_SIZE_VAL\000"
.LASF553:
	.ascii	"ATCA_UINT32_HOST_TO_BE(x) __builtin_bswap32(x)\000"
.LASF787:
	.ascii	"KDF_MODE_ALG_HKDF ((uint8_t)0x40)\000"
.LASF520:
	.ascii	"UINT_FAST8_MAX UINT8_MAX\000"
.LASF351:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF550:
	.ascii	"ATCA_IFACE_H \000"
.LASF961:
	.ascii	"VERIFY_256_STORED_COUNT ( 71)\000"
.LASF695:
	.ascii	"DERIVE_KEY_COUNT_LARGE (39)\000"
.LASF597:
	.ascii	"ATCA_SHA_CONFIG_SIZE (88)\000"
.LASF272:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF400:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF566:
	.ascii	"ATCA_CHECKMAC ((uint8_t)0x28)\000"
.LASF109:
	.ascii	"__INT8_C(c) c\000"
.LASF277:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF938:
	.ascii	"SIGN_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF446:
	.ascii	"FLOAT_ABI_HARD 1\000"
.LASF856:
	.ascii	"NONCE_NUMIN_SIZE (20)\000"
.LASF629:
	.ascii	"ATCA_COUNT_IDX (0)\000"
.LASF166:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF976:
	.ascii	"VERIFY_MODE_VALIDATE ((uint8_t)0x03)\000"
.LASF726:
	.ascii	"GENKEY_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF509:
	.ascii	"UINT_LEAST16_MAX UINT16_MAX\000"
.LASF1203:
	.ascii	"devtype\000"
.LASF1217:
	.ascii	"atidle\000"
.LASF194:
	.ascii	"__FLT32_DIG__ 6\000"
.LASF514:
	.ascii	"INT_FAST32_MIN INT32_MIN\000"
.LASF979:
	.ascii	"VERIFY_MODE_SOURCE_TEMPKEY ((uint8_t)0x00)\000"
.LASF523:
	.ascii	"UINT_FAST64_MAX UINT64_MAX\000"
.LASF813:
	.ascii	"LOCK_ZONE_MASK (0xBF)\000"
.LASF877:
	.ascii	"RANDOM_NUM_SIZE ((uint8_t)32)\000"
.LASF544:
	.ascii	"_ATCA_BOOL_H \000"
.LASF1205:
	.ascii	"rx_retries\000"
.LASF985:
	.ascii	"VERIFY_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF632:
	.ascii	"ATCA_PARAM2_IDX (3)\000"
.LASF190:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF804:
	.ascii	"KDF_DETAILS_HKDF_MSG_LOC_IV ((uint32_t)0x00000003)\000"
.LASF488:
	.ascii	"UINT16_MAX 65535\000"
.LASF570:
	.ascii	"ATCA_GENKEY ((uint8_t)0x40)\000"
.LASF127:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF397:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF53:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF1201:
	.ascii	"atcacustom\000"
.LASF1146:
	.ascii	"ATCA_TIMEOUT\000"
.LASF907:
	.ascii	"SELFTEST_MODE_RNG ((uint8_t)0x01)\000"
.LASF1005:
	.ascii	"ATCA_CRYPTO_SW_SHA2_H \000"
.LASF1130:
	.ascii	"ATCA_STATUS_SELFTEST_ERROR\000"
.LASF126:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF1277:
	.ascii	"C:\\localrep\\ATEC608A_test\\nRF5_SDK_15.3.0_59ac34"
	.ascii	"5\\examples\\iot\\misc\\iot_timer\\pca10040\\blank\\"
	.ascii	"ses\000"
.LASF267:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF455:
	.ascii	"__stddef_H \000"
.LASF590:
	.ascii	"ATCA_BLOCK_SIZE (32)\000"
.LASF28:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF1240:
	.ascii	"size\000"
.LASF1072:
	.ascii	"__isctype\000"
.LASF757:
	.ascii	"INFO_MODE_VOL_KEY_PERMIT ((uint8_t)0x04)\000"
.LASF1227:
	.ascii	"cfg_ateccx08a_kithid_default\000"
.LASF1120:
	.ascii	"long long unsigned int\000"
.LASF729:
	.ascii	"GENKEY_COUNT_DATA (10)\000"
.LASF755:
	.ascii	"INFO_MODE_STATE ((uint8_t)0x02)\000"
.LASF504:
	.ascii	"INT_LEAST8_MAX INT8_MAX\000"
.LASF668:
	.ascii	"CHECKMAC_COUNT (84)\000"
.LASF322:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF506:
	.ascii	"INT_LEAST32_MAX INT32_MAX\000"
.LASF73:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF1013:
	.ascii	"ATCA_MSG_SIZE_NONCE (55)\000"
.LASF857:
	.ascii	"NONCE_NUMIN_SIZE_PASSTHROUGH (32)\000"
.LASF335:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF1059:
	.ascii	"int_p_sep_by_space\000"
.LASF410:
	.ascii	"__APCS_32__ 1\000"
.LASF79:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF579:
	.ascii	"ATCA_SIGN ((uint8_t)0x41)\000"
.LASF1229:
	.ascii	"cfg_atsha204a_swi_default\000"
.LASF1117:
	.ascii	"uint16_t\000"
.LASF342:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF469:
	.ascii	"__CTYPE_BLANK 0x40\000"
.LASF349:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF445:
	.ascii	"CONFIG_GPIO_AS_PINRESET 1\000"
.LASF1194:
	.ascii	"halidle\000"
.LASF475:
	.ascii	"__RAL_WCHAR_T unsigned\000"
.LASF378:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF60:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF634:
	.ascii	"ATCA_RSP_DATA_IDX (1)\000"
.LASF772:
	.ascii	"KDF_MODE_SOURCE_MASK ((uint8_t)0x03)\000"
.LASF298:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF284:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF1249:
	.ascii	"atcab_cfg_discover\000"
.LASF56:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF869:
	.ascii	"PRIVWRITE_ZONE_MASK ((uint8_t)0x40)\000"
.LASF158:
	.ascii	"__FLT_EPSILON__ 1.1\000"
.LASF319:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF40:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF721:
	.ascii	"GENDIG_ZONE_SHARED_NONCE ((uint8_t)3)\000"
.LASF513:
	.ascii	"INT_FAST16_MIN INT32_MIN\000"
.LASF222:
	.ascii	"__FLT32X_DIG__ 15\000"
.LASF659:
	.ascii	"AES_MODE_GFM ((uint8_t)0x03)\000"
.LASF691:
	.ascii	"DERIVE_KEY_TARGETKEY_IDX ATCA_PARAM2_IDX\000"
.LASF754:
	.ascii	"INFO_MODE_KEY_VALID ((uint8_t)0x01)\000"
.LASF157:
	.ascii	"__FLT_MIN__ 1.1\000"
.LASF257:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF1204:
	.ascii	"wake_delay\000"
.LASF815:
	.ascii	"ATCA_LOCKED (0x00)\000"
.LASF1052:
	.ascii	"p_sep_by_space\000"
.LASF719:
	.ascii	"GENDIG_ZONE_OTP ((uint8_t)1)\000"
.LASF130:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF937:
	.ascii	"SHA_RSP_SIZE_LONG ATCA_RSP_SIZE_32\000"
.LASF1257:
	.ascii	"atcab_wakeup\000"
.LASF780:
	.ascii	"KDF_MODE_TARGET_SLOT ((uint8_t)0x08)\000"
.LASF559:
	.ascii	"ATCA_CMD_SIZE_MAX ((uint8_t)4 * 36 + 7)\000"
.LASF598:
	.ascii	"ATCA_OTP_SIZE (64)\000"
.LASF692:
	.ascii	"DERIVE_KEY_MAC_IDX ATCA_DATA_IDX\000"
.LASF1031:
	.ascii	"ATCA_SN_8_DEF (0xEE)\000"
.LASF1103:
	.ascii	"__RAL_data_empty_string\000"
.LASF324:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF807:
	.ascii	"LOCK_SUMMARY_IDX ATCA_PARAM2_IDX\000"
.LASF981:
	.ascii	"VERIFY_MODE_MAC_FLAG ((uint8_t)0x80)\000"
.LASF753:
	.ascii	"INFO_MODE_REVISION ((uint8_t)0x00)\000"
.LASF600:
	.ascii	"ATCA_AES_GFM_SIZE ATCA_BLOCK_SIZE\000"
.LASF283:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF655:
	.ascii	"AES_MODE_KEY_BLOCK_MASK ((uint8_t)0xC0)\000"
.LASF986:
	.ascii	"VERIFY_RSP_SIZE_MAC ATCA_RSP_SIZE_32\000"
.LASF1004:
	.ascii	"DBGOUT(message) { break; }\000"
.LASF448:
	.ascii	"NO_VTOR_CONFIG 1\000"
.LASF343:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF486:
	.ascii	"INT8_MAX 127\000"
.LASF1135:
	.ascii	"ATCA_INVALID_SIZE\000"
.LASF464:
	.ascii	"__CTYPE_LOWER 0x02\000"
.LASF525:
	.ascii	"PTRDIFF_MAX INT32_MAX\000"
.LASF871:
	.ascii	"PRIVWRITE_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF1003:
	.ascii	"PRINT(message) { break; }\000"
.LASF648:
	.ascii	"ATCA_AES_KEY_TYPE 6\000"
.LASF1266:
	.ascii	"memset\000"
.LASF785:
	.ascii	"KDF_MODE_ALG_PRF ((uint8_t)0x00)\000"
.LASF849:
	.ascii	"NONCE_MODE_TARGET_MASK ((uint8_t)0xC0)\000"
.LASF1202:
	.ascii	"iface_type\000"
.LASF511:
	.ascii	"UINT_LEAST64_MAX UINT64_MAX\000"
.LASF1131:
	.ascii	"ATCA_FUNC_FAIL\000"
.LASF456:
	.ascii	"__crossworks_H \000"
.LASF867:
	.ascii	"PRIVWRITE_MAC_IDX (41)\000"
.LASF581:
	.ascii	"ATCA_VERIFY ((uint8_t)0x45)\000"
.LASF355:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF358:
	.ascii	"__SA_FBIT__ 15\000"
.LASF290:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF228:
	.ascii	"__FLT32X_MAX__ 1.7976931348623157e+308F32x\000"
.LASF545:
	.ascii	"__stdbool_h \000"
.LASF1041:
	.ascii	"grouping\000"
.LASF762:
	.ascii	"INFO_PARAM2_SET_LATCH_STATE ((uint16_t)0x0002)\000"
.LASF430:
	.ascii	"__ARM_EABI__ 1\000"
.LASF786:
	.ascii	"KDF_MODE_ALG_AES ((uint8_t)0x20)\000"
.LASF505:
	.ascii	"INT_LEAST16_MAX INT16_MAX\000"
.LASF830:
	.ascii	"MAC_MODE_INCLUDE_SN ((uint8_t)0x40)\000"
.LASF436:
	.ascii	"__ELF__ 1\000"
.LASF1033:
	.ascii	"MAX_BUSES 4\000"
.LASF413:
	.ascii	"__THUMBEL__ 1\000"
.LASF885:
	.ascii	"SECUREBOOT_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF394:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF919:
	.ascii	"SHA_CONTEXT_MAX_SIZE (99)\000"
.LASF562:
	.ascii	"CMD_STATUS_BYTE_PARSE ((uint8_t)0x03)\000"
.LASF1149:
	.ascii	"ATCA_EXECUTION_ERROR\000"
.LASF337:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF812:
	.ascii	"LOCK_ZONE_NO_CRC ((uint8_t)0x80)\000"
.LASF684:
	.ascii	"COUNTER_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF591:
	.ascii	"ATCA_WORD_SIZE (4)\000"
.LASF1007:
	.ascii	"ATCA_SHA2_256_DIGEST_SIZE (32)\000"
.LASF958:
	.ascii	"VERIFY_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF326:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF484:
	.ascii	"__stdint_H \000"
.LASF977:
	.ascii	"VERIFY_MODE_INVALIDATE ((uint8_t)0x07)\000"
.LASF1172:
	.ascii	"ATCA_HID_IFACE\000"
.LASF882:
	.ascii	"READ_ZONE_MASK ((uint8_t)0x83)\000"
.LASF6:
	.ascii	"__GNUC_MINOR__ 2\000"
.LASF650:
	.ascii	"AES_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF569:
	.ascii	"ATCA_GENDIG ((uint8_t)0x15)\000"
.LASF1064:
	.ascii	"abbrev_day_names\000"
.LASF468:
	.ascii	"__CTYPE_CNTRL 0x20\000"
.LASF403:
	.ascii	"__ARM_FEATURE_NUMERIC_MAXMIN\000"
.LASF577:
	.ascii	"ATCA_RANDOM ((uint8_t)0x1B)\000"
.LASF38:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF414:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF471:
	.ascii	"__CTYPE_ALPHA (__CTYPE_UPPER | __CTYPE_LOWER)\000"
.LASF912:
	.ascii	"SELFTEST_MODE_ALL ((uint8_t)0x3B)\000"
.LASF1093:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF1232:
	.ascii	"atcab_b64rules_default\000"
.LASF646:
	.ascii	"ATCA_K283_KEY_TYPE 1\000"
.LASF773:
	.ascii	"KDF_MODE_SOURCE_TEMPKEY ((uint8_t)0x00)\000"
.LASF930:
	.ascii	"SHA_MODE_WRITE_CONTEXT ((uint8_t)0x07)\000"
.LASF421:
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
.LASF645:
	.ascii	"ATCA_B283_KEY_TYPE 0\000"
.LASF305:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF177:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF220:
	.ascii	"__FLT64_HAS_QUIET_NAN__ 1\000"
.LASF946:
	.ascii	"SIGN_MODE_SOURCE_MASK ((uint8_t)0x20)\000"
.LASF831:
	.ascii	"MAC_CHALLENGE_SIZE (32)\000"
.LASF289:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF204:
	.ascii	"__FLT32_HAS_DENORM__ 1\000"
.LASF1017:
	.ascii	"ATCA_MSG_SIZE_DERIVE_KEY (96)\000"
.LASF775:
	.ascii	"KDF_MODE_SOURCE_SLOT ((uint8_t)0x02)\000"
.LASF299:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF67:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF1073:
	.ascii	"__toupper\000"
.LASF68:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF843:
	.ascii	"NONCE_MODE_NO_SEED_UPDATE ((uint8_t)0x01)\000"
.LASF372:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF200:
	.ascii	"__FLT32_MAX__ 3.4028234663852886e+38F32\000"
.LASF165:
	.ascii	"__DBL_DIG__ 15\000"
.LASF285:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF899:
	.ascii	"SECUREBOOTCONFIG_OFFSET (70)\000"
.LASF1177:
	.ascii	"slave_address\000"
.LASF1138:
	.ascii	"ATCA_RX_NO_RESPONSE\000"
.LASF25:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF1082:
	.ascii	"name\000"
.LASF866:
	.ascii	"PRIVWRITE_VALUE_IDX ( 5)\000"
.LASF252:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF118:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF900:
	.ascii	"SECUREBOOTCONFIG_MODE_MASK ((uint16_t)0x0003)\000"
.LASF181:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF778:
	.ascii	"KDF_MODE_TARGET_TEMPKEY ((uint8_t)0x00)\000"
.LASF1181:
	.ascii	"port\000"
.LASF1016:
	.ascii	"ATCA_MSG_SIZE_GEN_DIG (96)\000"
.LASF596:
	.ascii	"ATCA_ECC_CONFIG_SIZE (128)\000"
.LASF679:
	.ascii	"CHECKMAC_CMD_MATCH (0)\000"
.LASF307:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF1050:
	.ascii	"frac_digits\000"
.LASF935:
	.ascii	"SHA_RSP_SIZE ATCA_RSP_SIZE_32\000"
.LASF567:
	.ascii	"ATCA_DERIVE_KEY ((uint8_t)0x1C)\000"
.LASF1043:
	.ascii	"currency_symbol\000"
.LASF515:
	.ascii	"INT_FAST64_MIN INT64_MIN\000"
.LASF972:
	.ascii	"VERIFY_MODE_MASK ((uint8_t)0x03)\000"
.LASF1276:
	.ascii	"C:\\localrep\\ATEC608A_test\\nRF5_SDK_15.3.0_59ac34"
	.ascii	"5\\examples\\iot\\misc\\iot_timer\\cryptoauthlib\\l"
	.ascii	"ib\\basic\\atca_basic.c\000"
.LASF1116:
	.ascii	"short int\000"
.LASF1196:
	.ascii	"halrelease\000"
.LASF1015:
	.ascii	"ATCA_MSG_SIZE_HMAC (88)\000"
.LASF271:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF123:
	.ascii	"__UINT16_C(c) c\000"
.LASF369:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF1265:
	.ascii	"ver_str\000"
.LASF991:
	.ascii	"WRITE_MAC_VL_IDX (37)\000"
.LASF1218:
	.ascii	"atsleep\000"
.LASF1151:
	.ascii	"ATCA_ASSERT_FAILURE\000"
.LASF1185:
	.ascii	"ATCAHID\000"
.LASF939:
	.ascii	"SIGN_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF9:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF1034:
	.ascii	"__state\000"
.LASF978:
	.ascii	"VERIFY_MODE_SOURCE_MASK ((uint8_t)0x20)\000"
.LASF176:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF929:
	.ascii	"SHA_MODE_READ_CONTEXT ((uint8_t)0x06)\000"
.LASF97:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF207:
	.ascii	"__FLT64_MANT_DIG__ 53\000"
.LASF838:
	.ascii	"NONCE_COUNT_SHORT (ATCA_CMD_SIZE_MIN + 20)\000"
.LASF1180:
	.ascii	"ATCAUART\000"
.LASF1173:
	.ascii	"ATCA_CUSTOM_IFACE\000"
.LASF879:
	.ascii	"READ_ZONE_IDX ATCA_PARAM1_IDX\000"
.LASF498:
	.ascii	"INTMAX_MAX 9223372036854775807LL\000"
.LASF1129:
	.ascii	"ATCA_STATUS_ECC\000"
.LASF1212:
	.ascii	"atinit\000"
.LASF1009:
	.ascii	"BLOCK_NUMBER(a) (a / 32)\000"
.LASF431:
	.ascii	"__ARM_ARCH_EXT_IDIV__ 1\000"
.LASF892:
	.ascii	"SECUREBOOT_RSP_SIZE_MAC (ATCA_PACKET_OVERHEAD + SEC"
	.ascii	"UREBOOT_MAC_SIZE)\000"
.LASF245:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF1252:
	.ascii	"iface_num\000"
.LASF1046:
	.ascii	"mon_grouping\000"
.LASF170:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF875:
	.ascii	"RANDOM_SEED_UPDATE ((uint8_t)0x00)\000"
.LASF1222:
	.ascii	"mIface\000"
.LASF507:
	.ascii	"INT_LEAST64_MAX INT64_MAX\000"
.LASF1150:
	.ascii	"ATCA_UNIMPLEMENTED\000"
.LASF1148:
	.ascii	"ATCA_WAKE_SUCCESS\000"
.LASF585:
	.ascii	"ATCA_SHA ((uint8_t)0x47)\000"
.LASF542:
	.ascii	"WINT_MIN (-2147483647L-1)\000"
.LASF916:
	.ascii	"ATCA_SHA_DIGEST_SIZE (32)\000"
.LASF101:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF960:
	.ascii	"VERIFY_DATA_IDX ( 5)\000"
.LASF85:
	.ascii	"__INT_WIDTH__ 32\000"
.LASF404:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF1144:
	.ascii	"ATCA_SMALL_BUFFER\000"
.LASF466:
	.ascii	"__CTYPE_SPACE 0x08\000"
.LASF1063:
	.ascii	"day_names\000"
.LASF1000:
	.ascii	"ATCA_HELPERS_H_ \000"
.LASF818:
	.ascii	"MAC_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF605:
	.ascii	"ATCA_CHIPMODE_WATCHDOG_SHORT ((uint8_t)0x00)\000"
.LASF99:
	.ascii	"__SIG_ATOMIC_WIDTH__ 32\000"
.LASF1058:
	.ascii	"int_n_cs_precedes\000"
.LASF948:
	.ascii	"SIGN_MODE_SOURCE_MSGDIGBUF ((uint8_t)0x20)\000"
.LASF1102:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF595:
	.ascii	"ATCA_KEY_COUNT (16)\000"
.LASF905:
	.ascii	"SELFTEST_MODE_IDX ATCA_PARAM1_IDX\000"
.LASF371:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF332:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF1086:
	.ascii	"__mbstate_s\000"
.LASF276:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF295:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF451:
	.ascii	"NRF52_PAN_74 1\000"
.LASF852:
	.ascii	"NONCE_MODE_TARGET_ALTKEYBUF ((uint8_t)0x80)\000"
.LASF966:
	.ascii	"VERIFY_283_EXTERNAL_COUNT (151)\000"
.LASF392:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF398:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF435:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF8:
	.ascii	"__VERSION__ \"7.2.1 20170904 (release) [ARM/embedde"
	.ascii	"d-7-branch revision 255204]\"\000"
.LASF613:
	.ascii	"ATCA_PACKET_OVERHEAD (ATCA_COUNT_SIZE + ATCA_CRC_SI"
	.ascii	"ZE)\000"
.LASF945:
	.ascii	"SIGN_MODE_EXTERNAL ((uint8_t)0x80)\000"
.LASF318:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF611:
	.ascii	"ATCA_COUNT_SIZE ((uint8_t)1)\000"
.LASF128:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF1075:
	.ascii	"__iswctype\000"
.LASF1018:
	.ascii	"ATCA_MSG_SIZE_DERIVE_KEY_MAC (39)\000"
.LASF236:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF333:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF1143:
	.ascii	"ATCA_TOO_MANY_COMM_RETRIES\000"
.LASF29:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF798:
	.ascii	"KDF_DETAILS_PRF_AEAD_MODE1 ((uint32_t)0x00000200)\000"
.LASF551:
	.ascii	"ATCA_COMMAND_H \000"
.LASF628:
	.ascii	"ATCA_OTP_BLOCK_MAX ((uint8_t)1)\000"
.LASF690:
	.ascii	"DERIVE_KEY_RANDOM_IDX ATCA_PARAM1_IDX\000"
.LASF470:
	.ascii	"__CTYPE_XDIGIT 0x80\000"
.LASF671:
	.ascii	"CHECKMAC_MODE_BLOCK1_TEMPKEY ((uint8_t)0x02)\000"
.LASF708:
	.ascii	"ECDH_MODE_COPY_COMPATIBLE ((uint8_t)0x00)\000"
.LASF714:
	.ascii	"GENDIG_ZONE_IDX ATCA_PARAM1_IDX\000"
.LASF433:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__ 1\000"
.LASF652:
	.ascii	"AES_INPUT_IDX ATCA_DATA_IDX\000"
.LASF1094:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF49:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF706:
	.ascii	"ECDH_MODE_OUTPUT_ENC ((uint8_t)0x02)\000"
.LASF602:
	.ascii	"ATCA_CHIPMODE_I2C_ADDRESS_FLAG ((uint8_t)0x01)\000"
.LASF412:
	.ascii	"__thumb2__ 1\000"
.LASF479:
	.ascii	"__RAL_WCHAR_T_DEFINED \000"
.LASF716:
	.ascii	"GENDIG_DATA_IDX ATCA_DATA_IDX\000"
.LASF269:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF924:
	.ascii	"SHA_MODE_SHA256_PUBLIC ((uint8_t)0x03)\000"
.LASF429:
	.ascii	"__ARM_PCS_VFP 1\000"
.LASF952:
	.ascii	"UPDATE_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF736:
	.ascii	"GENKEY_PRIVATE_TO_TEMPKEY ((uint16_t)0xFFFF)\000"
.LASF293:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF968:
	.ascii	"VERIFY_283_KEY_SIZE ( 72)\000"
.LASF761:
	.ascii	"INFO_DRIVER_STATE_MASK ((uint8_t)0x02)\000"
.LASF1195:
	.ascii	"halsleep\000"
.LASF1147:
	.ascii	"ATCA_BAD_OPCODE\000"
.LASF420:
	.ascii	"__ARM_FP16_ARGS\000"
.LASF18:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF953:
	.ascii	"UPDATE_MODE_USER_EXTRA ((uint8_t)0x00)\000"
.LASF287:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF667:
	.ascii	"CHECKMAC_DATA_IDX (69)\000"
.LASF458:
	.ascii	"__RAL_SIZE_T\000"
.LASF1118:
	.ascii	"uint32_t\000"
.LASF495:
	.ascii	"INT64_MAX 9223372036854775807LL\000"
.LASF994:
	.ascii	"WRITE_ZONE_WITH_MAC ((uint8_t)0x40)\000"
.LASF440:
	.ascii	"__SES_VERSION 34000\000"
.LASF1062:
	.ascii	"int_n_sign_posn\000"
.LASF740:
	.ascii	"HMAC_KEYID_IDX ATCA_PARAM2_IDX\000"
.LASF535:
	.ascii	"UINT32_C(x) (x ##UL)\000"
.LASF300:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF417:
	.ascii	"__ARM_FP 4\000"
.LASF774:
	.ascii	"KDF_MODE_SOURCE_TEMPKEY_UP ((uint8_t)0x01)\000"
.LASF64:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF606:
	.ascii	"ATCA_CHIPMODE_WATCHDOG_LONG ((uint8_t)0x04)\000"
.LASF365:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF540:
	.ascii	"WCHAR_MIN (-2147483647L-1)\000"
.LASF1208:
	.ascii	"ATCAIface\000"
.LASF310:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF325:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF723:
	.ascii	"GENDIG_ZONE_KEY_CONFIG ((uint8_t)5)\000"
.LASF179:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF806:
	.ascii	"LOCK_ZONE_IDX ATCA_PARAM1_IDX\000"
.LASF680:
	.ascii	"CHECKMAC_CMD_MISMATCH (1)\000"
.LASF91:
	.ascii	"__SIZE_WIDTH__ 32\000"
.LASF575:
	.ascii	"ATCA_PAUSE ((uint8_t)0x01)\000"
.LASF988:
	.ascii	"WRITE_ADDR_IDX ATCA_PARAM2_IDX\000"
.LASF80:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF819:
	.ascii	"MAC_CHALLENGE_IDX ATCA_DATA_IDX\000"
.LASF758:
	.ascii	"INFO_MODE_MAX ((uint8_t)0x03)\000"
.LASF208:
	.ascii	"__FLT64_DIG__ 15\000"
.LASF247:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF1192:
	.ascii	"halreceive\000"
.LASF532:
	.ascii	"INT16_C(x) (x)\000"
.LASF689:
	.ascii	"COUNTER_RSP_SIZE ATCA_RSP_SIZE_4\000"
.LASF110:
	.ascii	"__INT_LEAST8_WIDTH__ 8\000"
.LASF449:
	.ascii	"NRF52 1\000"
.LASF1241:
	.ascii	"atcab_get_zone_size\000"
.LASF931:
	.ascii	"SHA_MODE_TARGET_MASK ((uint8_t)0xC0)\000"
.LASF52:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF1051:
	.ascii	"p_cs_precedes\000"
.LASF336:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF186:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF1106:
	.ascii	"short unsigned int\000"
.LASF286:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF205:
	.ascii	"__FLT32_HAS_INFINITY__ 1\000"
.LASF1030:
	.ascii	"ATCA_SN_1_DEF (0x23)\000"
.LASF411:
	.ascii	"__thumb__ 1\000"
.LASF183:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF1184:
	.ascii	"stopbits\000"
.LASF631:
	.ascii	"ATCA_PARAM1_IDX (2)\000"
.LASF473:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF415:
	.ascii	"__ARMEL__ 1\000"
.LASF862:
	.ascii	"PAUSE_COUNT ATCA_CMD_SIZE_MIN\000"
.LASF1239:
	.ascii	"slot\000"
.LASF533:
	.ascii	"UINT16_C(x) (x ##U)\000"
.LASF724:
	.ascii	"GENDIG_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF1128:
	.ascii	"ATCA_STATUS_UNKNOWN\000"
.LASF771:
	.ascii	"KDF_MESSAGE_IDX (ATCA_DATA_IDX + KDF_DETAILS_SIZE)\000"
.LASF82:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF1258:
	.ascii	"atcab_get_device_type\000"
.LASF1161:
	.ascii	"ATECC608A\000"
.LASF441:
	.ascii	"NDEBUG 1\000"
.LASF1010:
	.ascii	"WORD_OFFSET(a) ((a % 32) / 4)\000"
.LASF331:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF681:
	.ascii	"CHECKMAC_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF640:
	.ascii	"ATCA_ZONE_READWRITE_32 ((uint8_t)0x80)\000"
.LASF75:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF526:
	.ascii	"SIZE_MAX INT32_MAX\000"
.LASF829:
	.ascii	"MAC_MODE_INCLUDE_OTP_64 ((uint8_t)0x20)\000"
.LASF955:
	.ascii	"UPDATE_MODE_USER_EXTRA_ADD UPDATE_MODE_SELECTOR\000"
.LASF676:
	.ascii	"CHECKMAC_CLIENT_RESPONSE_SIZE (32)\000"
.LASF1025:
	.ascii	"ATCA_PRIVWRITE_PLAIN_TEXT_SIZE (36)\000"
.LASF401:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
.LASF910:
	.ascii	"SELFTEST_MODE_AES ((uint8_t)0x10)\000"
.LASF1026:
	.ascii	"ATCA_DERIVE_KEY_ZEROS_SIZE (25)\000"
.LASF863:
	.ascii	"PAUSE_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF350:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF896:
	.ascii	"SECUREBOOT_MODE_FULL_COPY ((uint8_t)0x07)\000"
.LASF259:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF221:
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
.LASF88:
	.ascii	"__WCHAR_WIDTH__ 32\000"
.LASF573:
	.ascii	"ATCA_MAC ((uint8_t)0x08)\000"
.LASF686:
	.ascii	"COUNTER_MAX_VALUE ((uint32_t)2097151)\000"
.LASF868:
	.ascii	"PRIVWRITE_COUNT (75)\000"
.LASF112:
	.ascii	"__INT16_C(c) c\000"
.LASF1248:
	.ascii	"_atcab_exit\000"
.LASF1099:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF957:
	.ascii	"UPDATE_RSP_SIZE ATCA_RSP_SIZE_MIN\000"
.LASF361:
	.ascii	"__DA_IBIT__ 32\000"
.LASF1081:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF1040:
	.ascii	"thousands_sep\000"
.LASF962:
	.ascii	"VERIFY_283_STORED_COUNT ( 79)\000"
.LASF1074:
	.ascii	"__tolower\000"
.LASF13:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF999:
	.ascii	"ATCA_CFGS_H_ \000"
.LASF339:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF1110:
	.ascii	"next\000"
.LASF1083:
	.ascii	"data\000"
.LASF647:
	.ascii	"ATCA_P256_KEY_TYPE 4\000"
.LASF554:
	.ascii	"ATCA_UINT32_BE_TO_HOST(x) __builtin_bswap32(x)\000"
.LASF687:
	.ascii	"COUNTER_MODE_READ ((uint8_t)0x00)\000"
.LASF534:
	.ascii	"INT32_C(x) (x ##L)\000"
.LASF1273:
	.ascii	"atcab_read_bytes_zone\000"
.LASF922:
	.ascii	"SHA_MODE_SHA256_UPDATE ((uint8_t)0x01)\000"
.LASF578:
	.ascii	"ATCA_READ ((uint8_t)0x02)\000"
.LASF1270:
	.ascii	"atGetCommands\000"
.LASF94:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF461:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF164:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF282:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF1001:
	.ascii	"BREAK(status,message) { break; }\000"
.LASF828:
	.ascii	"MAC_MODE_INCLUDE_OTP_88 ((uint8_t)0x10)\000"
.LASF502:
	.ascii	"INT_LEAST32_MIN INT32_MIN\000"
.LASF74:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF54:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF105:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF529:
	.ascii	"UINTPTR_MAX UINT32_MAX\000"
.LASF1213:
	.ascii	"atpostinit\000"
.LASF296:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF665:
	.ascii	"CHECKMAC_CLIENT_CHALLENGE_IDX ATCA_DATA_IDX\000"
.LASF1095:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF678:
	.ascii	"CHECKMAC_CLIENT_COMMAND_SIZE (4)\000"
.LASF508:
	.ascii	"UINT_LEAST8_MAX UINT8_MAX\000"
	.ident	"GCC: (GNU) 7.2.1 20170904 (release) [ARM/embedded-7-branch revision 255204]"
