;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module utilities
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_waitVSYNC
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _g_clock
	.globl _g_clock_on
	.globl _u_clock_interrupt
	.globl _u_reset_clock
	.globl _u_clock_tick
	.globl _u_clear_input
	.globl _u_wait_for_duration_or_kp
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_clock_on::
	.ds 1
_u_clock_interrupt_count_10000_259:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_clock::
	.ds 4
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;src/lib/utilities.c:31: static u8 count = 0;
	xor	a, a
	ld	(_u_clock_interrupt_count_10000_259+0), a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/lib/utilities.c:29: void u_clock_interrupt(void) {
;	---------------------------------
; Function u_clock_interrupt
; ---------------------------------
_u_clock_interrupt::
;src/lib/utilities.c:34: if (g_clock_on) {
	ld	hl, #_g_clock_on
	bit	0, (hl)
	ret	Z
;src/lib/utilities.c:41: if (++count == 6)
	ld	iy, #_u_clock_interrupt_count_10000_259
	inc	0 (iy)
	ld	a, (_u_clock_interrupt_count_10000_259+0)
	sub	a, #0x06
	jr	NZ, 00102$
;src/lib/utilities.c:42: count = 0;
	ld	0 (iy), #0x00
00102$:
;src/lib/utilities.c:43: if (count == 5) {
	ld	a, (_u_clock_interrupt_count_10000_259+0)
	sub	a, #0x05
	ret	NZ
;src/lib/utilities.c:44: g_clock.ms += 20;
	ld	hl, (#_g_clock + 0)
	ld	bc, #0x0014
	add	hl, bc
	ld	(_g_clock), hl
;src/lib/utilities.c:45: if (g_clock.ms == 1000) {
	ld	a, l
	sub	a, #0xe8
	ret	NZ
	ld	a, h
	sub	a, #0x03
	ret	NZ
;src/lib/utilities.c:46: ++g_clock.s;
	ld	hl, (#(_g_clock + 2) + 0)
	inc	hl
	ld	((_g_clock + 2)), hl
;src/lib/utilities.c:47: g_clock.ms = 0;
	ld	hl, #0x0000
	ld	(_g_clock), hl
;src/lib/utilities.c:57: }
	ret
;src/lib/utilities.c:60: void u_reset_clock(void) {
;	---------------------------------
; Function u_reset_clock
; ---------------------------------
_u_reset_clock::
;src/lib/utilities.c:62: g_clock.ms = g_clock.s = 0;
	ld	hl, #0x0000
	ld	((_g_clock + 2)), hl
	ld	(_g_clock), hl
;src/lib/utilities.c:63: }
	ret
;src/lib/utilities.c:65: void u_clock_tick(void) {
;	---------------------------------
; Function u_clock_tick
; ---------------------------------
_u_clock_tick::
;src/lib/utilities.c:67: g_clock.ms += 20;
	ld	hl, (#_g_clock + 0)
	ld	bc, #0x0014
	add	hl, bc
	ld	(_g_clock), hl
;src/lib/utilities.c:68: if (g_clock.ms >= 1000) {
	ld	de, #0x03e8
	cp	a, a
	sbc	hl, de
	ret	C
;src/lib/utilities.c:69: g_clock.ms = 0;
	ld	hl, #0x0000
	ld	(_g_clock), hl
;src/lib/utilities.c:70: ++g_clock.s;
	ld	hl, (#(_g_clock + 2) + 0)
	inc	hl
	ld	((_g_clock + 2)), hl
;src/lib/utilities.c:72: }
	ret
;src/lib/utilities.c:75: void u_clear_input(void) {
;	---------------------------------
; Function u_clear_input
; ---------------------------------
_u_clear_input::
;src/lib/utilities.c:77: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/lib/utilities.c:78: while (cpct_isAnyKeyPressed_f())
00101$:
	call	_cpct_isAnyKeyPressed_f
	or	a, a
	ret	Z
;src/lib/utilities.c:79: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/lib/utilities.c:80: }
	jr	00101$
;src/lib/utilities.c:82: void u_wait_for_duration_or_kp(u16 duration) {
;	---------------------------------
; Function u_wait_for_duration_or_kp
; ---------------------------------
_u_wait_for_duration_or_kp::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ex	de, hl
;src/lib/utilities.c:84: g_clock_on = true;
	ld	hl, #_g_clock_on
	ld	(hl), #0x01
;src/lib/utilities.c:86: u_clear_input();
	push	de
	call	_u_clear_input
	pop	de
;src/lib/utilities.c:88: bool kp = false;
	ld	-1 (ix), #0x00
;src/lib/utilities.c:89: while ((!kp) && (g_clock.s < duration)) {
00104$:
	bit	0, -1 (ix)
	jr	NZ, 00106$
	ld	hl, (#(_g_clock + 2) + 0)
	xor	a, a
	sbc	hl, de
	jr	NC, 00106$
;src/lib/utilities.c:91: cpct_waitVSYNC();
	push	de
	call	_cpct_waitVSYNC
;src/lib/utilities.c:92: u_clock_tick();
	call	_u_clock_tick
;src/lib/utilities.c:93: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	pop	de
	or	a, a
	jr	Z, 00104$
;src/lib/utilities.c:94: kp = true;
	ld	-1 (ix), #0x01
;src/lib/utilities.c:95: g_skip = true;
	ld	hl, #_g_skip
	ld	(hl), #0x01
	jr	00104$
00106$:
;src/lib/utilities.c:99: u_clear_input();
	call	_u_clear_input
;src/lib/utilities.c:102: g_clock_on = false;
	xor	a, a
	ld	(_g_clock_on+0), a
;src/lib/utilities.c:103: }
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__g_clock:
	.dw #0x0000
	.dw #0x0000
	.area _CABS (ABS)
