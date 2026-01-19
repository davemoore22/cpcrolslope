;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module intro
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _v_snowball_set_frame
	.globl _v_spider_set_frame
	.globl _v_set_intro_spider_sprite_pos
	.globl _v_set_intro_snowball_sprite_pos
	.globl _v_set_intro_ghost_sprite_pos
	.globl _v_set_intro_roland_sprite_pos
	.globl _v_clear_screen
	.globl _v_blank_screen_mode_1
	.globl _u_wait_for_duration_or_kp
	.globl _u_clock_interrupt
	.globl _d_gfx_decompress_to_screen
	.globl _d_load
	.globl _a_page_disconnect_safe
	.globl _a_page_connect_safe
	.globl _a_load_ghost_sprites
	.globl _a_load_snowball_sprites
	.globl _a_load_spider_sprites
	.globl _a_load_roland_sprites
	.globl _a_clear_sprites
	.globl _a_set_hardware_sprite_palette
	.globl _cpct_asicRemoveLinesInterruptHandler
	.globl _cpct_asicSetLinesInterruptHandler
	.globl _cpct_asicPageDisconnect
	.globl _cpct_asicPageConnect
	.globl _cpct_asicSetPalette
	.globl _cpct_asicSetBorder
	.globl _cpct_asicSetSpriteZoom
	.globl _cpct_waitVSYNCStart
	.globl _cpct_waitVSYNC
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _g_ghost_bob
	.globl _i_start
	.globl _i_stop
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
_i_int_idx:
	.ds 1
_i_frame_c:
	.ds 1
_show_roland:
	.ds 1
_g_ghost_bob::
	.ds 2
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
;src/intro.c:107: void i_start(void) {
;	---------------------------------
; Function i_start
; ---------------------------------
_i_start::
;src/intro.c:110: a_clear_sprites();
	call	_a_clear_sprites
;src/intro.c:111: v_blank_screen_mode_1();
	call	_v_blank_screen_mode_1
;src/intro.c:112: v_clear_screen();
	call	_v_clear_screen
;src/intro.c:114: show_roland = false;
	xor	a, a
	ld	(_show_roland+0), a
;src/intro.c:115: i_draw_bg();
	call	_i_draw_bg
;src/intro.c:118: i_reset_timers();
	call	_i_reset_timers
;src/intro.c:119: i_add_interrupt();
	call	_i_add_interrupt
;src/intro.c:120: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
	ld	hl, #0x0fff
	call	_cpct_asicSetBorder
;src/intro.c:123: i_ani_roland_l(140, INTRO_SPEED_LEFT);
	ld	l, #0x08
	ld	a, #0x8c
	call	_i_ani_roland_l
;src/intro.c:124: if (g_skip)
	ld	hl, #_g_skip
	bit	0, (hl)
;src/intro.c:125: return;
	ret	NZ
;src/intro.c:126: i_ani_spider_l(144, INTRO_SPEED_LEFT);
	ld	l, #0x08
	ld	a, #0x90
	call	_i_ani_spider_l
;src/intro.c:127: if (g_skip)
	ld	hl, #_g_skip
	bit	0, (hl)
;src/intro.c:128: return;
	ret	NZ
;src/intro.c:129: show_roland = true;
	ld	hl, #_show_roland
	ld	(hl), #0x01
;src/intro.c:130: i_ani_roland_r(140, INTRO_SPEED_RIGHT);
	ld	l, #0x08
	ld	a, #0x8c
	call	_i_ani_roland_r
;src/intro.c:131: if (g_skip)
	ld	hl, #_g_skip
	bit	0, (hl)
;src/intro.c:132: return;
	ret	NZ
;src/intro.c:133: i_ani_snowball_r(140, INTRO_SPEED_RIGHT);
	ld	l, #0x08
	ld	a, #0x8c
	call	_i_ani_snowball_r
;src/intro.c:134: if (g_skip)
	ld	hl, #_g_skip
	bit	0, (hl)
;src/intro.c:135: return;
	ret	NZ
;src/intro.c:138: cpct_waitVSYNCStart();
	call	_cpct_waitVSYNCStart
;src/intro.c:139: cpct_asicPageDisconnect();
	call	_cpct_asicPageDisconnect
;src/intro.c:140: cpct_drawSprite(img_in, v_pos, 10, 24);
	ld	hl, #0x180a
	push	hl
	ld	de, #0xf203
	ld	hl, #_img_in
	call	_cpct_drawSprite
;src/intro.c:141: cpct_asicPageConnect();
	call	_cpct_asicPageConnect
;src/intro.c:143: i_ani_roland_l(140, INTRO_SPEED_LEFT);
	ld	l, #0x08
	ld	a, #0x8c
	call	_i_ani_roland_l
;src/intro.c:144: if (g_skip)
	ld	hl, #_g_skip
	bit	0, (hl)
;src/intro.c:145: return;
	ret	NZ
;src/intro.c:146: i_ani_ghost_l(124, INTRO_SPEED_LEFT);
	ld	l, #0x08
	ld	a, #0x7c
	call	_i_ani_ghost_l
;src/intro.c:147: if (g_skip)
	ld	hl, #_g_skip
	bit	0, (hl)
	ret	Z
;src/intro.c:148: return;
;src/intro.c:149: }
	ret
_ghost_sine:
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x03	;  3
	.db #0x02	;  2
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0xfe	; -2
	.db #0xfd	; -3
	.db #0xfc	; -4
	.db #0xfd	; -3
	.db #0xfe	; -2
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x02	;  2
	.db #0x03	;  3
	.db #0x04	;  4
	.db #0x03	;  3
	.db #0x02	;  2
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0xfe	; -2
	.db #0xfd	; -3
	.db #0xfc	; -4
	.db #0xfd	; -3
	.db #0xfe	; -2
	.db #0xff	; -1
_i_pal_in:
	.dw #0x0fff
	.dw #0x0bff
	.dw #0x0000
	.dw #0x05ff
_i_pal_ice:
	.dw #0x0a7f
	.dw #0x0eaf
	.dw #0x085e
	.dw #0x0edf
_i_pal_trees:
	.dw #0x0fff
	.dw #0x0a68
	.dw #0x0411
	.dw #0x0735
_i_pal_blank_white:
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
_i_pal_blank_ice:
	.dw #0x0a7f
	.dw #0x0a7f
	.dw #0x0a7f
	.dw #0x0a7f
_i_pal_top:
	.dw #0x0fff
	.dw #0x077d
	.dw #0x0114
	.dw #0x099b
;src/intro.c:152: void i_stop(void) {
;	---------------------------------
; Function i_stop
; ---------------------------------
_i_stop::
;src/intro.c:154: u_wait_for_duration_or_kp(5);
	ld	hl, #0x0005
	call	_u_wait_for_duration_or_kp
;src/intro.c:156: v_clear_screen();
	call	_v_clear_screen
;src/intro.c:158: i_remove_interrupt();
	call	_i_remove_interrupt
;src/intro.c:159: v_blank_screen_mode_1();
	call	_v_blank_screen_mode_1
;src/intro.c:160: v_clear_screen();
;src/intro.c:161: }
	jp	_v_clear_screen
;src/intro.c:163: static void i_draw_bg(void) {
;	---------------------------------
; Function i_draw_bg
; ---------------------------------
_i_draw_bg:
;src/intro.c:165: if (HW_HAS_128K(g_hw))
	ld	a, (_g_hw)
	and	a, #0x03
	sub	a, #0x01
	jr	C, 00102$
;src/intro.c:166: d_gfx_decompress_to_screen(GFX_INTRO);
	ld	a, #0x02
	jp	_d_gfx_decompress_to_screen
00102$:
;src/intro.c:168: a_page_disconnect_safe();
	call	_a_page_disconnect_safe
;src/intro.c:169: d_load("INTRO   SCR", VIDEO_MEM_START);
	ld	de, #0xc000
	ld	hl, #___str_0
	call	_d_load
;src/intro.c:170: a_page_connect_safe();
;src/intro.c:172: }
	jp	_a_page_connect_safe
___str_0:
	.ascii "INTRO   SCR"
	.db 0x00
;src/intro.c:174: static void i_reset_timers(void) {
;	---------------------------------
; Function i_reset_timers
; ---------------------------------
_i_reset_timers:
;src/intro.c:176: i_int_idx = 0;
;src/intro.c:177: i_frame_c = 0;
	xor	a, a
	ld	(_i_int_idx+0), a
	ld	(_i_frame_c+0), a
;src/intro.c:178: }
	ret
;src/intro.c:180: static void i_add_interrupt(void) {
;	---------------------------------
; Function i_add_interrupt
; ---------------------------------
_i_add_interrupt:
;src/intro.c:191: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/intro.c:193: cpct_asicSetLinesInterruptHandler(i_interrupt, lines, sizeof(lines));
	ld	hl, #0x0006
	push	hl
	ld	de, #_i_add_interrupt_lines_10000_280
	ld	hl, #_i_interrupt
	call	_cpct_asicSetLinesInterruptHandler
;src/intro.c:194: }
	ret
_i_add_interrupt_lines_10000_280:
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x50	; 80	'P'
	.db #0x78	; 120	'x'
	.db #0xa9	; 169
	.db #0xb8	; 184
;src/intro.c:196: static void i_remove_interrupt(void) {
;	---------------------------------
; Function i_remove_interrupt
; ---------------------------------
_i_remove_interrupt:
;src/intro.c:198: cpct_asicRemoveLinesInterruptHandler();
;src/intro.c:199: }
	jp	_cpct_asicRemoveLinesInterruptHandler
;src/intro.c:201: static void i_interrupt(u8 line) __z88dk_fastcall {
;	---------------------------------
; Function i_interrupt
; ---------------------------------
_i_interrupt:
	ld	a, l
;src/intro.c:203: if (line == INTRO_RASTER_TOP) {
	or	a, a
	jr	NZ, 00129$
;src/intro.c:204: if (!show_roland)
	ld	hl, #_show_roland
	bit	0, (hl)
	jr	NZ, 00102$
;src/intro.c:205: cpct_asicSetPalette(i_pal_blank_white, 4);
	ld	de, #0x0004
	ld	hl, #_i_pal_blank_white
	jp	_cpct_asicSetPalette
00102$:
;src/intro.c:207: cpct_asicSetPalette(i_pal_top, 4);
	ld	de, #0x0004
	ld	hl, #_i_pal_top
	jp	_cpct_asicSetPalette
00129$:
;src/intro.c:208: } else if (line == INTRO_RASTER_SLOPES) {
	cp	a, #0x32
	jr	NZ, 00126$
;src/intro.c:209: cpct_asicSetPalette(i_pal_in, 4);
	ld	de, #0x0004
	ld	hl, #_i_pal_in
	jp	_cpct_asicSetPalette
00126$:
;src/intro.c:210: } else if (line == INTRO_RASTER_SCENERY) {
	cp	a, #0x50
	jr	NZ, 00123$
;src/intro.c:211: cpct_asicSetPalette(i_pal_trees, 4);
	ld	de, #0x0004
	ld	hl, #_i_pal_trees
	jp	_cpct_asicSetPalette
00123$:
;src/intro.c:212: } else if (line == INTRO_RASTER_DO_STUFF) {
	cp	a, #0x78
	jr	NZ, 00120$
;src/intro.c:214: if (i_int_idx == 0) {
	ld	a, (_i_int_idx+0)
	or	a, a
	jr	NZ, 00107$
;src/intro.c:215: if (++i_frame_c == FC_MAX)
	ld	iy, #_i_frame_c
	inc	0 (iy)
	ld	a, (_i_frame_c+0)
	sub	a, #0x32
	jr	NZ, 00107$
;src/intro.c:216: i_frame_c = 0;
	ld	0 (iy), #0x00
00107$:
;src/intro.c:219: if (i_int_idx == 1)
	ld	a, (_i_int_idx+0)
	dec	a
	jr	NZ, 00109$
;src/intro.c:220: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
00109$:
;src/intro.c:222: if (i_int_idx == 2)
	ld	a, (_i_int_idx+0)
	sub	a, #0x02
	jr	NZ, 00111$
;src/intro.c:223: u_clock_interrupt();
	call	_u_clock_interrupt
00111$:
;src/intro.c:225: if (++i_int_idx == 6)
	ld	iy, #_i_int_idx
	inc	0 (iy)
	ld	a, (_i_int_idx+0)
	sub	a, #0x06
	ret	NZ
;src/intro.c:226: i_int_idx = 0;
	ld	0 (iy), #0x00
	ret
00120$:
;src/intro.c:227: } else if (line == INTRO_RASTER_ICE) {
	cp	a, #0xa9
	jr	NZ, 00117$
;src/intro.c:228: cpct_asicSetPalette(i_pal_ice, 4);
	ld	de, #0x0004
	ld	hl, #_i_pal_ice
	jp	_cpct_asicSetPalette
00117$:
;src/intro.c:229: } else if (line == INTRO_RASTER_TEXT) {
	sub	a, #0xb8
	ret	NZ
;src/intro.c:230: cpct_asicSetPalette(i_pal_blank_ice, 4);
	ld	de, #0x0004
	ld	hl, #_i_pal_blank_ice
;src/intro.c:232: }
	jp	_cpct_asicSetPalette
;src/intro.c:234: static void i_scroll_sprite_h(i16 start_x, i16 end_x, i16 step, u8 y,
;	---------------------------------
; Function i_scroll_sprite_h
; ---------------------------------
_i_scroll_sprite_h:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	c, e
	ld	b, d
;src/intro.c:238: load_fn(reversed);
	push	hl
	push	bc
	ld	a, 7 (ix)
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	call	___sdcc_call_hl
;src/intro.c:239: a_set_hardware_sprite_palette(palette);
	ld	l, 10 (ix)
	ld	h, 11 (ix)
	call	_a_set_hardware_sprite_palette
	pop	bc
	pop	hl
;src/intro.c:241: for (i16 x = start_x; (step > 0) ? (x <= end_x) : (x >= end_x);
	ld	-2 (ix), l
	ld	-1 (ix), h
	xor	a, a
	cp	a, 4 (ix)
	sbc	a, 5 (ix)
	jp	PO, 00148$
	xor	a, #0x80
00148$:
	rlca
	and	a,#0x01
	ld	-3 (ix), a
00107$:
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00111$
	ld	a, c
	sub	a, -2 (ix)
	ld	a, b
	sbc	a, -1 (ix)
	jp	PO, 00149$
	xor	a, #0x80
00149$:
	rlca
	and	a,#0x01
	xor	a, #0x01
	jr	00112$
00111$:
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jp	PO, 00150$
	xor	a, #0x80
00150$:
	rlca
	and	a,#0x01
	xor	a, #0x01
00112$:
	or	a, a
	jr	Z, 00109$
;src/intro.c:244: pos_fn(x, y, reversed);
	ld	e, 6 (ix)
	ld	d, #0x00
	push	bc
	ld	a, 7 (ix)
	push	af
	inc	sp
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	iy
	ex	(sp), hl
	ld	l, 12 (ix)
	ex	(sp), hl
	ex	(sp), hl
	ld	h, 13 (ix)
	ex	(sp), hl
	pop	iy
	call	___sdcc_call_iy
	pop	bc
;src/intro.c:246: if (tick_fn)
	ld	a, 15 (ix)
	or	a, 14 (ix)
	jr	Z, 00102$
;src/intro.c:247: tick_fn(tick_state);
	push	bc
	ld	l, 16 (ix)
	ld	h, 17 (ix)
	push	iy
	ex	(sp), hl
	ld	l, 14 (ix)
	ex	(sp), hl
	ex	(sp), hl
	ld	h, 15 (ix)
	ex	(sp), hl
	pop	iy
	call	___sdcc_call_iy
	pop	bc
00102$:
;src/intro.c:249: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
;src/intro.c:250: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00108$
;src/intro.c:251: g_skip = true;
	ld	iy, #_g_skip
	ld	0 (iy), #0x01
;src/intro.c:252: return;
	jr	00109$
00108$:
;src/intro.c:242: x += step) {
	ld	a, -2 (ix)
	add	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, -1 (ix)
	adc	a, 5 (ix)
	ld	-1 (ix), a
	jp	00107$
00109$:
;src/intro.c:255: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	pop	af
	pop	af
	pop	af
	pop	af
	pop	af
	jp	(hl)
;src/intro.c:257: static void i_ani_ghost_l(u8 y, u8 speed) {
;	---------------------------------
; Function i_ani_ghost_l
; ---------------------------------
_i_ani_ghost_l:
	ld	d, a
	ld	c, l
;src/intro.c:261: v_set_intro_ghost_sprite_pos, i_ghost_tick, (u8 *)&g_ghost_bob);
;src/intro.c:260: a_load_ghost_sprites, ghost_sprites_palette,
;src/intro.c:259: i_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y, false,
	ld	b, #0x00
	ld	hl, #_g_ghost_bob
	push	hl
	ld	hl, #_i_ghost_tick
	push	hl
	ld	hl, #_v_set_intro_ghost_sprite_pos
	push	hl
	ld	hl, #_ghost_sprites_palette
	push	hl
	ld	hl, #_a_load_ghost_sprites
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	ld	de, #0x0280
	ld	hl, #0xff00
	call	_i_scroll_sprite_h
;src/intro.c:262: }
	ret
;src/intro.c:264: static void i_ani_roland_l(u8 y, u8 speed) {
;	---------------------------------
; Function i_ani_roland_l
; ---------------------------------
_i_ani_roland_l:
	ld	d, a
	ld	c, l
;src/intro.c:267: a_load_roland_sprites, roland_sprites_palette,
;src/intro.c:266: i_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y, false,
	ld	b, #0x00
	ld	hl, #0x0000
	push	hl
	push	hl
	ld	hl, #_v_set_intro_roland_sprite_pos
	push	hl
	ld	hl, #_roland_sprites_palette
	push	hl
	ld	hl, #_a_load_roland_sprites
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	ld	de, #0x0280
	ld	hl, #0xff00
	call	_i_scroll_sprite_h
;src/intro.c:269: }
	ret
;src/intro.c:271: static void i_ani_roland_r(u8 y, u8 speed) {
;	---------------------------------
; Function i_ani_roland_r
; ---------------------------------
_i_ani_roland_r:
	ld	b, a
;src/intro.c:274: a_load_roland_sprites, roland_sprites_palette,
	ld	de, #_roland_sprites_palette+0
;src/intro.c:273: i_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y, true,
	xor	a, a
	ld	h, a
	sub	a, l
	ld	c, a
	sbc	a, a
	sub	a, h
	ld	hl, #0x0000
	push	hl
	push	hl
	ld	hl, #_v_set_intro_roland_sprite_pos
	push	hl
	push	de
	ld	hl, #_a_load_roland_sprites
	push	hl
	ld	h, #0x01
	ld	l, b
	push	hl
	ld	b, a
	push	bc
	ld	de, #0xff00
	ld	hl, #0x0280
	call	_i_scroll_sprite_h
;src/intro.c:276: }
	ret
;src/intro.c:278: static void i_spider_tick(u8 *state_ptr) {
;	---------------------------------
; Function i_spider_tick
; ---------------------------------
_i_spider_tick:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/intro.c:280: sprite_anim_state_t *s = (sprite_anim_state_t *)state_ptr;
;src/intro.c:282: if (++s->count == 8) {
	ld	e, l
	ld	d, h
	inc	hl
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	inc	a
	pop	hl
	push	hl
	ld	(hl), a
	sub	a, #0x08
	jr	NZ, 00106$
;src/intro.c:284: v_spider_set_frame(s->frame);
	ld	l, e
	ld	h, d
	ld	a, (hl)
	push	hl
	push	de
	call	_v_spider_set_frame
	pop	de
	pop	hl
;src/intro.c:286: s->frame += s->dir;
	ld	c, (hl)
	inc	de
	inc	de
	ld	a, (de)
	add	a, c
;src/intro.c:289: if (s->frame == 2 || s->frame == 0)
	ld	(hl), a
	cp	a, #0x02
	jr	Z, 00101$
	or	a, a
	jr	NZ, 00102$
00101$:
;src/intro.c:290: s->dir = -s->dir;
	ld	a, (de)
	neg
	ld	(de), a
00102$:
;src/intro.c:292: s->count = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
00106$:
;src/intro.c:294: }
	pop	af
	pop	ix
	ret
;src/intro.c:296: static void i_snowball_tick(u8 *state_ptr) {
;	---------------------------------
; Function i_snowball_tick
; ---------------------------------
_i_snowball_tick:
;src/intro.c:298: sprite_anim_state_t *s = (sprite_anim_state_t *)state_ptr;
;src/intro.c:300: if (++s->count == 8) {
	ld	c, l
	ld	b, h
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
	sub	a, #0x08
	ret	NZ
;src/intro.c:302: v_snowball_set_frame(s->frame);
	ld	a, (hl)
	push	hl
	push	bc
	call	_v_snowball_set_frame
	pop	bc
	pop	hl
;src/intro.c:304: s->frame++;
	inc	(hl)
	ld	a, (hl)
;src/intro.c:305: if (s->frame > 3)
	cp	a, #0x04
	jr	C, 00102$
;src/intro.c:306: s->frame = 0;
	ld	(hl), #0x00
00102$:
;src/intro.c:308: s->count = 0;
	xor	a, a
	ld	(bc), a
;src/intro.c:310: }
	ret
;src/intro.c:312: static void i_spider_init(void) {
;	---------------------------------
; Function i_spider_init
; ---------------------------------
_i_spider_init:
;src/intro.c:314: for (u8 i = 0; i < 3; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00101$
;src/intro.c:315: cpct_asicSetSpriteZoom(i, 2, 1);
	ld	l, c
	ld	h, #0x00
	push	bc
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/intro.c:314: for (u8 i = 0; i < 3; i++)
	inc	c
	jr	00104$
00101$:
;src/intro.c:317: for (u8 i = 3; i < 12; i++)
	ld	c, #0x03
00107$:
	ld	a, c
	sub	a, #0x0c
	ret	NC
;src/intro.c:318: cpct_asicSetSpriteZoom(i, 0, 0);
	ld	l, c
	ld	h, #0x00
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/intro.c:317: for (u8 i = 3; i < 12; i++)
	inc	c
;src/intro.c:319: }
	jr	00107$
;src/intro.c:321: static void i_snowball_init(void) {
;	---------------------------------
; Function i_snowball_init
; ---------------------------------
_i_snowball_init:
;src/intro.c:323: for (u8 i = 2; i < 8; i++)
	ld	c, #0x02
00104$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;src/intro.c:324: cpct_asicSetSpriteZoom(i, 0, 0);
	ld	l, c
	ld	h, #0x00
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/intro.c:323: for (u8 i = 2; i < 8; i++)
	inc	c
	jr	00104$
00101$:
;src/intro.c:325: for (u8 i = 10; i < 16; i++)
	ld	c, #0x0a
00107$:
	ld	a, c
	sub	a, #0x10
	jr	NC, 00102$
;src/intro.c:326: cpct_asicSetSpriteZoom(i, 0, 0);
	ld	l, c
	ld	h, #0x00
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/intro.c:325: for (u8 i = 10; i < 16; i++)
	inc	c
	jr	00107$
00102$:
;src/intro.c:328: cpct_asicSetSpriteZoom(0, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0000
	call	_cpct_asicSetSpriteZoom
;src/intro.c:329: cpct_asicSetSpriteZoom(1, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0001
	call	_cpct_asicSetSpriteZoom
;src/intro.c:330: cpct_asicSetSpriteZoom(8, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0008
	call	_cpct_asicSetSpriteZoom
;src/intro.c:331: cpct_asicSetSpriteZoom(9, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0009
	call	_cpct_asicSetSpriteZoom
;src/intro.c:332: }
	ret
;src/intro.c:334: static void i_ani_snowball_r(u8 y, u8 speed) {
;	---------------------------------
; Function i_ani_snowball_r
; ---------------------------------
_i_ani_snowball_r:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	d, a
	ld	e, l
;src/intro.c:336: sprite_anim_state_t state = {.frame = 0, .count = 0, .dir = 1};
	ld	-3 (ix), #0x00
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x01
;src/intro.c:338: a_load_snowball_sprites(false);
	push	de
	xor	a, a
	call	_a_load_snowball_sprites
;src/intro.c:339: i_snowball_init();
	call	_i_snowball_init
	pop	de
;src/intro.c:343: v_set_intro_snowball_sprite_pos, i_snowball_tick, (u8 *)&state);
;src/intro.c:342: a_load_snowball_sprites, snowball_sprites_palette,
;src/intro.c:341: i_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y, false,
	ld	c, e
	xor	a, a
	ld	b, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #_i_snowball_tick
	push	hl
	ld	hl, #_v_set_intro_snowball_sprite_pos
	push	hl
	ld	hl, #_snowball_sprites_palette
	push	hl
	ld	hl, #_a_load_snowball_sprites
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	ld	de, #0xff00
	ld	hl, #0x0280
	call	_i_scroll_sprite_h
;src/intro.c:344: }
	ld	sp, ix
	pop	ix
	ret
;src/intro.c:346: static void i_ani_spider_l(u8 y, u8 speed) {
;	---------------------------------
; Function i_ani_spider_l
; ---------------------------------
_i_ani_spider_l:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	b, a
	ld	c, l
;src/intro.c:348: sprite_anim_state_t state = {.frame = 0, .count = 0, .dir = 1};
	ld	-3 (ix), #0x00
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x01
;src/intro.c:350: a_load_spider_sprites(false);
	push	bc
	xor	a, a
	call	_a_load_spider_sprites
;src/intro.c:351: i_spider_init();
	call	_i_spider_init
	pop	bc
;src/intro.c:355: v_set_intro_spider_sprite_pos, i_spider_tick, (u8 *)&state);
	ld	hl, #0
	add	hl, sp
;src/intro.c:354: a_load_spider_sprites, spider_sprites_palette,
	ld	de, #_spider_sprites_palette+0
;src/intro.c:353: i_scroll_sprite_h(-SPRITE_WIDTH_M2, SCREEN_WIDTH_M2, speed, y, false,
	xor	a, a
	push	hl
	ld	hl, #_i_spider_tick
	push	hl
	ld	hl, #_v_set_intro_spider_sprite_pos
	push	hl
	push	de
	ld	hl, #_a_load_spider_sprites
	push	hl
	ld	h, #0x00
	ld	l, b
	push	hl
	ld	b, a
	push	bc
	ld	de, #0x0280
	ld	hl, #0xff80
	call	_i_scroll_sprite_h
;src/intro.c:356: }
	ld	sp, ix
	pop	ix
	ret
;src/intro.c:358: static void i_ghost_tick(u8 *state_ptr) {
;	---------------------------------
; Function i_ghost_tick
; ---------------------------------
_i_ghost_tick:
;src/intro.c:360: ghost_bob_t *s = (ghost_bob_t *)state_ptr;
;src/intro.c:362: s->phase = (s->phase + 1) & 31; /* Keep between 0 and 31 */
	ld	e, l
	ld	d, h
	ld	a, (hl)
	inc	a
	and	a, #0x1f
	ld	c, a
	ld	(hl), c
;src/intro.c:363: s->y_off = ghost_sine[s->phase];
	inc	de
	ld	hl, #_ghost_sine+0
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;src/intro.c:364: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__i_int_idx:
	.db #0x00	; 0
__xinit__i_frame_c:
	.db #0x00	; 0
__xinit__show_roland:
	.db #0x00	;  0
__xinit__g_ghost_bob:
	.db #0x00	; 0
	.db #0x00	;  0
	.area _CABS (ABS)
