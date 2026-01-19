;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module made
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _v_set_made_cpctelera_sprite_pos
	.globl _v_clear_screen
	.globl _v_blank_screen_mode_1
	.globl _u_wait_for_duration_or_kp
	.globl _u_reset_clock
	.globl _u_clock_interrupt
	.globl _d_gfx_decompress_to_screen
	.globl _d_load
	.globl _a_page_disconnect_safe
	.globl _a_page_connect_safe
	.globl _a_load_cpctelera_sprites
	.globl _a_clear_sprites
	.globl _a_set_hardware_sprite_palette
	.globl _cpct_asicRemoveLinesInterruptHandler
	.globl _cpct_asicSetLinesInterruptHandler
	.globl _cpct_asicSetPalette
	.globl _cpct_asicSetBorder
	.globl _cpct_waitVSYNC
	.globl _cpct_scanKeyboard_if
	.globl _m_start
	.globl _m_stop
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_m_int_idx:
	.ds 1
_m_frame_c:
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/made.c:74: void m_start(void) {
;	---------------------------------
; Function m_start
; ---------------------------------
_m_start::
;src/made.c:77: a_clear_sprites();
	call	_a_clear_sprites
;src/made.c:78: v_blank_screen_mode_1();
	call	_v_blank_screen_mode_1
;src/made.c:79: v_clear_screen();
	call	_v_clear_screen
;src/made.c:82: m_draw_bg();
	call	_m_draw_bg
;src/made.c:83: m_draw_hw_sprites();
	call	_m_draw_hw_sprites
;src/made.c:85: m_reset_timers();
	call	_m_reset_timers
;src/made.c:86: m_add_interrupt();
	call	_m_add_interrupt
;src/made.c:88: g_clock_on = true;
	ld	hl, #_g_clock_on
	ld	(hl), #0x01
;src/made.c:89: u_reset_clock();
	call	_u_reset_clock
;src/made.c:90: u_wait_for_duration_or_kp(15);
	ld	hl, #0x000f
	call	_u_wait_for_duration_or_kp
;src/made.c:91: g_clock_on = false;
	xor	a, a
	ld	(_g_clock_on+0), a
;src/made.c:94: a_clear_sprites();
;src/made.c:95: }
	jp	_a_clear_sprites
_m_pal_blank:
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
_m_pal_usual:
	.dw #0x0fff
	.dw #0x0000
	.dw #0x0999
	.dw #0x0295
_m_pal_text:
	.dw #0x0fff
	.dw #0x0000
	.dw #0x0baf
	.dw #0x055f
_m_pal_logo:
	.dw #0x0fff
	.dw #0x0561
	.dw #0x0000
	.dw #0x0cd4
;src/made.c:98: void m_stop(void) {
;	---------------------------------
; Function m_stop
; ---------------------------------
_m_stop::
;src/made.c:100: m_remove_interrupt();
	call	_m_remove_interrupt
;src/made.c:101: a_clear_sprites();
	call	_a_clear_sprites
;src/made.c:103: v_blank_screen_mode_1();
	call	_v_blank_screen_mode_1
;src/made.c:104: v_clear_screen();
;src/made.c:105: }
	jp	_v_clear_screen
;src/made.c:108: static void m_reset_timers(void) {
;	---------------------------------
; Function m_reset_timers
; ---------------------------------
_m_reset_timers:
;src/made.c:110: m_int_idx = 0;
;src/made.c:111: m_frame_c = 0;
	xor	a, a
	ld	(_m_int_idx+0), a
	ld	(_m_frame_c+0), a
;src/made.c:112: }
	ret
;src/made.c:114: static void m_draw_hw_sprites(void) {
;	---------------------------------
; Function m_draw_hw_sprites
; ---------------------------------
_m_draw_hw_sprites:
;src/made.c:116: a_load_cpctelera_sprites(false);
	xor	a, a
	call	_a_load_cpctelera_sprites
;src/made.c:117: v_set_made_cpctelera_sprite_pos(454, 36, false);
	xor	a, a
	push	af
	inc	sp
	ld	de, #0x0024
	ld	hl, #0x01c6
	call	_v_set_made_cpctelera_sprite_pos
;src/made.c:118: a_set_hardware_sprite_palette(cpctelera_sprites_palette);
	ld	hl, #_cpctelera_sprites_palette
;src/made.c:119: }
	jp	_a_set_hardware_sprite_palette
;src/made.c:122: static void m_draw_bg(void) {
;	---------------------------------
; Function m_draw_bg
; ---------------------------------
_m_draw_bg:
;src/made.c:124: if (HW_HAS_128K(g_hw))
	ld	a, (_g_hw)
	and	a, #0x03
	sub	a, #0x01
	jr	C, 00102$
;src/made.c:125: d_gfx_decompress_to_screen(GFX_MADEWIDTH);
	ld	a, #0x01
	call	_d_gfx_decompress_to_screen
	jr	00103$
00102$:
;src/made.c:127: a_page_disconnect_safe();
	call	_a_page_disconnect_safe
;src/made.c:128: d_load("MADEWITHSCR", VIDEO_MEM_START);
	ld	de, #0xc000
	ld	hl, #___str_0
	call	_d_load
;src/made.c:129: a_page_connect_safe();
	call	_a_page_connect_safe
00103$:
;src/made.c:132: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
	ld	hl, #0x0fff
;src/made.c:133: }
	jp	_cpct_asicSetBorder
___str_0:
	.ascii "MADEWITHSCR"
	.db 0x00
;src/made.c:135: static void m_add_interrupt(void) {
;	---------------------------------
; Function m_add_interrupt
; ---------------------------------
_m_add_interrupt:
;src/made.c:145: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/made.c:147: cpct_asicSetLinesInterruptHandler(m_interrupt, lines, sizeof(lines));
	ld	hl, #0x0005
	push	hl
	ld	de, #_m_add_interrupt_lines_10000_271
	ld	hl, #_m_interrupt
	call	_cpct_asicSetLinesInterruptHandler
;src/made.c:148: }
	ret
_m_add_interrupt_lines_10000_271:
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x76	; 118	'v'
	.db #0x86	; 134
;src/made.c:150: static void m_interrupt(u8 line) __z88dk_fastcall {
;	---------------------------------
; Function m_interrupt
; ---------------------------------
_m_interrupt:
	ld	a, l
;src/made.c:152: if (line == MADE_DO_STUFF) {
	or	a, a
	jr	NZ, 00123$
;src/made.c:154: if (m_int_idx == 0) {
	ld	a, (_m_int_idx+0)
	or	a, a
	jr	NZ, 00104$
;src/made.c:155: if (++m_frame_c == FC_MAX)
	ld	iy, #_m_frame_c
	inc	0 (iy)
	ld	a, (_m_frame_c+0)
	sub	a, #0x32
	jr	NZ, 00104$
;src/made.c:156: m_frame_c = 0;
	ld	0 (iy), #0x00
00104$:
;src/made.c:159: if (m_int_idx == 1)
	ld	a, (_m_int_idx+0)
	dec	a
	jr	NZ, 00106$
;src/made.c:160: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
00106$:
;src/made.c:162: if (m_int_idx == 3)
	ld	a, (_m_int_idx+0)
	sub	a, #0x03
	jr	NZ, 00108$
;src/made.c:163: u_clock_interrupt();
	call	_u_clock_interrupt
00108$:
;src/made.c:165: if (++m_int_idx == 6)
	ld	iy, #_m_int_idx
	inc	0 (iy)
	ld	a, (_m_int_idx+0)
	sub	a, #0x06
	ret	NZ
;src/made.c:166: m_int_idx = 0;
	ld	0 (iy), #0x00
	ret
00123$:
;src/made.c:168: } else if (line == MADE_TEXT_TOP)
	cp	a, #0x28
	jr	NZ, 00120$
;src/made.c:169: cpct_asicSetPalette(m_pal_text, 4);
	ld	de, #0x0004
	ld	hl, #_m_pal_text
	jp	_cpct_asicSetPalette
00120$:
;src/made.c:170: else if (line == MADE_CPC_TELERA)
	cp	a, #0x38
	jr	NZ, 00117$
;src/made.c:171: cpct_asicSetPalette(m_pal_usual, 4);
	ld	de, #0x0004
	ld	hl, #_m_pal_usual
	jp	_cpct_asicSetPalette
00117$:
;src/made.c:172: else if (line == MADE_TEXT_BOTTOM)
	cp	a, #0x76
	jr	NZ, 00114$
;src/made.c:173: cpct_asicSetPalette(m_pal_text, 4);
	ld	de, #0x0004
	ld	hl, #_m_pal_text
	jp	_cpct_asicSetPalette
00114$:
;src/made.c:174: else if (line == MADE_GX4000)
	sub	a, #0x86
	ret	NZ
;src/made.c:175: cpct_asicSetPalette(m_pal_logo, 4);
	ld	de, #0x0004
	ld	hl, #_m_pal_logo
;src/made.c:176: }
	jp	_cpct_asicSetPalette
;src/made.c:178: static void m_remove_interrupt(void) {
;	---------------------------------
; Function m_remove_interrupt
; ---------------------------------
_m_remove_interrupt:
;src/made.c:180: cpct_asicRemoveLinesInterruptHandler();
;src/made.c:181: }
	jp	_cpct_asicRemoveLinesInterruptHandler
	.area _CODE
	.area _INITIALIZER
__xinit__m_int_idx:
	.db #0x00	; 0
__xinit__m_frame_c:
	.db #0x00	; 0
	.area _CABS (ABS)
