;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module presents
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _v_clear_screen
	.globl _v_blank_screen_mode_1
	.globl _u_wait_for_duration_or_kp
	.globl _u_reset_clock
	.globl _u_clock_interrupt
	.globl _d_gfx_decompress_to_screen
	.globl _d_load
	.globl _a_page_disconnect_safe
	.globl _a_page_connect_safe
	.globl _a_clear_sprites
	.globl _cpct_asicRemoveLinesInterruptHandler
	.globl _cpct_asicSetLinesInterruptHandler
	.globl _cpct_asicSetPalette
	.globl _cpct_asicSetPalColour
	.globl _cpct_asicSetBorder
	.globl _cpct_waitVSYNC
	.globl _cpct_scanKeyboard_if
	.globl _p_start
	.globl _p_stop
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_p_interrupt_bg_pulse_tick_30000_274:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_p_int_idx:
	.ds 1
_p_frame_c:
	.ds 1
_p_raster_phase:
	.ds 1
_p_raster_tick:
	.ds 1
_p_star_pulse:
	.ds 1
_p_star_pulse_dir:
	.ds 1
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
;src/presents.c:174: static u8 bg_pulse_tick = 0;
	xor	a, a
	ld	(_p_interrupt_bg_pulse_tick_30000_274+0), a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/presents.c:62: void p_start(void) {
;	---------------------------------
; Function p_start
; ---------------------------------
_p_start::
;src/presents.c:65: v_blank_screen_mode_1();
	call	_v_blank_screen_mode_1
;src/presents.c:66: v_clear_screen();
	call	_v_clear_screen
;src/presents.c:69: p_draw_bg();
	call	_p_draw_bg
;src/presents.c:72: p_reset_timers();
	call	_p_reset_timers
;src/presents.c:73: p_add_interrupt();
	call	_p_add_interrupt
;src/presents.c:74: cpct_asicSetPalette(p_pal_usual, 4);
	ld	de, #0x0004
	ld	hl, #_p_pal_usual
	call	_cpct_asicSetPalette
;src/presents.c:75: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
	ld	hl, #0x0fff
	call	_cpct_asicSetBorder
;src/presents.c:77: g_clock_on = true;
	ld	hl, #_g_clock_on
	ld	(hl), #0x01
;src/presents.c:78: u_reset_clock();
	call	_u_reset_clock
;src/presents.c:79: u_wait_for_duration_or_kp(25);
	ld	hl, #0x0019
	call	_u_wait_for_duration_or_kp
;src/presents.c:80: g_clock_on = false;
	xor	a, a
	ld	(_g_clock_on+0), a
;src/presents.c:83: a_clear_sprites();
;src/presents.c:84: }
	jp	_a_clear_sprites
_p_pal_blank:
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
_p_pal_usual:
	.dw #0x0fff
	.dw #0x051d
	.dw #0x0324
	.dw #0x0768
_p_pal_white:
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
;src/presents.c:87: void p_stop(void) {
;	---------------------------------
; Function p_stop
; ---------------------------------
_p_stop::
;src/presents.c:89: p_remove_interrupt();
	call	_p_remove_interrupt
;src/presents.c:91: v_blank_screen_mode_1();
	call	_v_blank_screen_mode_1
;src/presents.c:92: v_clear_screen();
;src/presents.c:93: }
	jp	_v_clear_screen
;src/presents.c:96: static void p_reset_timers(void) {
;	---------------------------------
; Function p_reset_timers
; ---------------------------------
_p_reset_timers:
;src/presents.c:98: p_int_idx = 0;
;src/presents.c:99: p_frame_c = 0;
	xor	a, a
	ld	(_p_int_idx+0), a
	ld	(_p_frame_c+0), a
;src/presents.c:100: }
	ret
;src/presents.c:103: static void p_draw_bg(void) {
;	---------------------------------
; Function p_draw_bg
; ---------------------------------
_p_draw_bg:
;src/presents.c:105: if (HW_HAS_128K(g_hw))
	ld	a, (_g_hw)
	and	a, #0x03
	sub	a, #0x01
	jr	C, 00102$
;src/presents.c:106: d_gfx_decompress_to_screen(GFX_PRESENTS);
	xor	a, a
	call	_d_gfx_decompress_to_screen
	jr	00103$
00102$:
;src/presents.c:108: a_page_disconnect_safe();
	call	_a_page_disconnect_safe
;src/presents.c:109: d_load("PRESENTSSCR", VIDEO_MEM_START);
	ld	de, #0xc000
	ld	hl, #___str_0
	call	_d_load
;src/presents.c:110: a_page_connect_safe();
	call	_a_page_connect_safe
00103$:
;src/presents.c:112: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
	ld	hl, #0x0fff
;src/presents.c:113: }
	jp	_cpct_asicSetBorder
___str_0:
	.ascii "PRESENTSSCR"
	.db 0x00
;src/presents.c:115: static void p_add_interrupt(void) {
;	---------------------------------
; Function p_add_interrupt
; ---------------------------------
_p_add_interrupt:
;src/presents.c:130: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/presents.c:132: cpct_asicSetLinesInterruptHandler(p_interrupt, lines, sizeof(lines));
	ld	hl, #0x000a
	push	hl
	ld	de, #_p_add_interrupt_lines_10000_268
	ld	hl, #_p_interrupt
	call	_cpct_asicSetLinesInterruptHandler
;src/presents.c:133: }
	ret
_p_add_interrupt_lines_10000_268:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x55	; 85	'U'
	.db #0x59	; 89	'Y'
	.db #0x5d	; 93
	.db #0x61	; 97	'a'
	.db #0x65	; 101	'e'
	.db #0x69	; 105	'i'
	.db #0x6d	; 109	'm'
;src/presents.c:135: static void p_interrupt(u8 line) __z88dk_fastcall {
;	---------------------------------
; Function p_interrupt
; ---------------------------------
_p_interrupt:
	ld	c, l
;src/presents.c:151: if (line == 0) {
	ld	a, c
	or	a, a
	jp	NZ, 00137$
;src/presents.c:153: if (p_int_idx == 0) {
	ld	a, (_p_int_idx+0)
	or	a, a
	jr	NZ, 00104$
;src/presents.c:154: if (++p_frame_c == FC_MAX)
	ld	iy, #_p_frame_c
	inc	0 (iy)
	ld	a, (_p_frame_c+0)
	sub	a, #0x32
	jr	NZ, 00104$
;src/presents.c:155: p_frame_c = 0;
	ld	0 (iy), #0x00
00104$:
;src/presents.c:158: if (p_int_idx == 1)
	ld	a, (_p_int_idx+0)
	dec	a
	jr	NZ, 00106$
;src/presents.c:159: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
00106$:
;src/presents.c:161: if (p_int_idx == 2)
	ld	a, (_p_int_idx+0)
	sub	a, #0x02
	jr	NZ, 00108$
;src/presents.c:162: u_clock_interrupt();
	call	_u_clock_interrupt
00108$:
;src/presents.c:164: if (p_int_idx == 3) {
	ld	a, (_p_int_idx+0)
	sub	a, #0x03
	jr	NZ, 00112$
;src/presents.c:166: p_raster_phase++;
	ld	iy, #_p_raster_phase
	inc	0 (iy)
;src/presents.c:167: if (p_raster_phase >= RASTER_COLOUR_COUNT)
	ld	a, (_p_raster_phase+0)
	sub	a, #0x15
	jr	C, 00112$
;src/presents.c:168: p_raster_phase = 0;
	ld	0 (iy), #0x00
00112$:
;src/presents.c:171: if (p_int_idx == 4) {
	ld	a, (_p_int_idx+0)
	sub	a, #0x04
	jr	NZ, 00121$
;src/presents.c:175: if (++bg_pulse_tick >= BG_PULSE_SPEED) {
	ld	iy, #_p_interrupt_bg_pulse_tick_30000_274
	inc	0 (iy)
	ld	a, (_p_interrupt_bg_pulse_tick_30000_274+0)
	sub	a, #0x02
	jr	C, 00121$
;src/presents.c:176: bg_pulse_tick = 0;
	ld	0 (iy), #0x00
;src/presents.c:178: p_star_pulse += p_star_pulse_dir;
	ld	a, (_p_star_pulse)
	ld	hl, #_p_star_pulse_dir
	add	a, (hl)
;src/presents.c:180: if (p_star_pulse >= BG_PULSE_MAX) {
	ld	(_p_star_pulse+0), a
	sub	a, #0x0c
	jr	C, 00116$
;src/presents.c:181: p_star_pulse = BG_PULSE_MAX;
	ld	hl, #_p_star_pulse
	ld	(hl), #0x0c
;src/presents.c:182: p_star_pulse_dir = -1;
	ld	hl, #_p_star_pulse_dir
	ld	(hl), #0xff
	jr	00121$
00116$:
;src/presents.c:183: } else if (p_star_pulse == 0) {
	ld	a, (_p_star_pulse+0)
	or	a, a
	jr	NZ, 00121$
;src/presents.c:184: p_star_pulse_dir = 1;
	ld	hl, #_p_star_pulse_dir
	ld	(hl), #0x01
00121$:
;src/presents.c:189: if (++p_int_idx == 6)
	ld	iy, #_p_int_idx
	inc	0 (iy)
	ld	a, (_p_int_idx+0)
	sub	a, #0x06
	ret	NZ
;src/presents.c:190: p_int_idx = 0;
	ld	0 (iy), #0x00
	ret
00137$:
;src/presents.c:192: } else if (line == RASTER_RESET_LINE) {
	ld	a, c
	dec	a
	jr	NZ, 00134$
;src/presents.c:193: cpct_asicSetPalColour(0, p_pal_usual[0]);
	ld	de, (#_p_pal_usual + 0)
	ld	hl, #0x0000
	call	_cpct_asicSetPalColour
;src/presents.c:195: cpctm_asicColor(p_star_pulse, 0, p_star_pulse));
	ld	a, (_p_star_pulse)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	or	a, e
;src/presents.c:194: cpct_asicSetPalColour(1, /* Star colour */
	ld	e, a
	ld	hl, #0x0001
	jp	_cpct_asicSetPalColour
00134$:
;src/presents.c:197: } else if (line == TEXT_RASTER_Y_END) {
	ld	a, c
	sub	a, #0x6d
	jr	NZ, 00131$
;src/presents.c:199: cpct_asicSetPalColour(2, p_pal_usual[2]);
	ld	de, (#(_p_pal_usual + 4) + 0)
	ld	hl, #0x0002
	jp	_cpct_asicSetPalColour
00131$:
;src/presents.c:200: } else if (line < TEXT_RASTER_Y_START || line > TEXT_RASTER_Y_END) {
	ld	a, c
	sub	a, #0x51
	ret	C
	ld	a, #0x6d
	sub	a, c
;src/presents.c:201: return;
	ret	C
;src/presents.c:205: u8 band = (line - TEXT_RASTER_Y_START) >> 2;
	ld	a, c
	ld	b, #0x00
	add	a, #0xaf
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
;src/presents.c:208: u8 idx = band + RASTER_COLOUR_COUNT - p_raster_phase;
	add	a, #0x15
	ld	hl, #_p_raster_phase
	sub	a, (hl)
;src/presents.c:209: if (idx >= RASTER_COLOUR_COUNT)
	ld	l, a
	sub	a, #0x15
	jr	C, 00125$
;src/presents.c:210: idx -= RASTER_COLOUR_COUNT;
	ld	a, l
	add	a, #0xeb
	ld	l, a
00125$:
;src/presents.c:215: cpct_asicSetPalColour(2, p_raster_colours[idx]);
	ld	bc, #_p_interrupt_p_raster_colours_10000_270+0
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0002
;src/presents.c:217: }
	jp	_cpct_asicSetPalColour
_p_interrupt_p_raster_colours_10000_270:
	.dw #0x00e6
	.dw #0x00f4
	.dw #0x00f2
	.dw #0x01f0
	.dw #0x03f0
	.dw #0x05f0
	.dw #0x07f0
	.dw #0x09f0
	.dw #0x0bf0
	.dw #0x0ee0
	.dw #0x0eb0
	.dw #0x0e80
	.dw #0x0d42
	.dw #0x0c23
	.dw #0x0b24
	.dw #0x0926
	.dw #0x0738
	.dw #0x0558
	.dw #0x0377
	.dw #0x0296
	.dw #0x01c6
;src/presents.c:219: static void p_remove_interrupt(void) {
;	---------------------------------
; Function p_remove_interrupt
; ---------------------------------
_p_remove_interrupt:
;src/presents.c:221: cpct_asicRemoveLinesInterruptHandler();
;src/presents.c:222: }
	jp	_cpct_asicRemoveLinesInterruptHandler
	.area _CODE
	.area _INITIALIZER
__xinit__p_int_idx:
	.db #0x00	; 0
__xinit__p_frame_c:
	.db #0x00	; 0
__xinit__p_raster_phase:
	.db #0x00	; 0
__xinit__p_raster_tick:
	.db #0x00	; 0
__xinit__p_star_pulse:
	.db #0x00	; 0
__xinit__p_star_pulse_dir:
	.db #0x01	;  1
	.area _CABS (ABS)
