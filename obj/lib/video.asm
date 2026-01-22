;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module video
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_asicSetPalette
	.globl _cpct_asicSetBorder
	.globl _cpct_asicSetSpriteZoom
	.globl _cpct_asicSetSpritePosition
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNCStart
	.globl _cpct_waitVSYNC
	.globl _cpct_memset_f64
	.globl _v_blank_screen_no_asic
	.globl _v_blank_screen_mode_1
	.globl _v_clear_screen
	.globl _v_set_intro_ghost_sprite_pos
	.globl _v_set_intro_roland_sprite_pos
	.globl _v_set_title_roland_sprite_pos
	.globl _v_set_made_cpctelera_sprite_pos
	.globl _v_set_intro_spider_sprite_pos
	.globl _v_set_intro_snowball_sprite_pos
	.globl _v_spider_set_frame
	.globl _v_snowball_set_frame
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
_v_pixel_scroll:
	.ds 1
_v_char_scroll:
	.ds 2
_last_frame:
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
;src/lib/video.c:24: void v_blank_screen_no_asic(void) {
;	---------------------------------
; Function v_blank_screen_no_asic
; ---------------------------------
_v_blank_screen_no_asic::
;src/lib/video.c:29: cpct_setPalette(black_palette, 4);
	ld	de, #0x0004
	ld	hl, #_v_blank_screen_no_asic_black_palette_10000_256
	call	_cpct_setPalette
;src/lib/video.c:30: cpct_setBorder(HW_BLACK);
	ld	l, #0x14
	ld	a, #0x10
;src/lib/video.c:31: }
	jp	_cpct_setPALColour
_v_blank_screen_no_asic_black_palette_10000_256:
	.dw #0x0014
	.dw #0x0014
	.dw #0x0014
	.dw #0x0014
;src/lib/video.c:34: void v_blank_screen_mode_1(void) {
;	---------------------------------
; Function v_blank_screen_mode_1
; ---------------------------------
_v_blank_screen_mode_1::
;src/lib/video.c:40: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/lib/video.c:41: cpct_asicSetPalette(palette, 4);
	ld	de, #0x0004
	ld	hl, #_v_blank_screen_mode_1_palette_10000_258
	call	_cpct_asicSetPalette
;src/lib/video.c:42: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
	ld	hl, #0x0fff
;src/lib/video.c:43: }
	jp	_cpct_asicSetBorder
_v_blank_screen_mode_1_palette_10000_258:
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
;src/lib/video.c:46: void v_clear_screen(void) {
;	---------------------------------
; Function v_clear_screen
; ---------------------------------
_v_clear_screen::
;src/lib/video.c:48: cpct_waitVSYNCStart();
	call	_cpct_waitVSYNCStart
;src/lib/video.c:49: cpct_clearScreen_f64(0);
	ld	hl, #0x4000
	push	hl
	ld	de, #0x0000
	ld	h, #0xc0
	call	_cpct_memset_f64
;src/lib/video.c:50: }
	ret
;src/lib/video.c:116: void v_set_intro_ghost_sprite_pos(i16 x_m2, i16 y, bool reversed) {
;	---------------------------------
; Function v_set_intro_ghost_sprite_pos
; ---------------------------------
_v_set_intro_ghost_sprite_pos::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
;src/lib/video.c:120: y += g_ghost_bob.y_off;
	ld	a, (#(_g_ghost_bob + 1) + 0)
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, de
	ld	-4 (ix), l
	ld	-3 (ix), h
;src/lib/video.c:122: for (u8 row = 0; row < 3; row++) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00109$
;src/lib/video.c:123: for (u8 col = 0; col < 3; col++) {
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x03
	jr	NC, 00108$
;src/lib/video.c:125: u8 tile_col = reversed ? (2 - col) : col;
	bit	0, 4 (ix)
	jr	Z, 00111$
	ld	e, b
	ld	a, #0x02
	sub	a, e
	ld	d, a
	jr	00112$
00111$:
	ld	d, b
00112$:
;src/lib/video.c:126: u8 spr_idx = (row * 3) + tile_col;
	ld	a, c
	ld	e, a
	add	a, a
	add	a, e
	ld	e, d
	add	a, e
	ld	-5 (ix), a
;src/lib/video.c:129: spr_idx, x_m2 + (col << 5), y + (row << 4));
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	iy
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	add	iy, de
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, -2 (ix)
	ld	e, a
	ld	a, h
	adc	a, -1 (ix)
	ld	d, a
	ld	l, -5 (ix)
	ld	h, #0x00
	push	bc
	push	iy
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:123: for (u8 col = 0; col < 3; col++) {
	inc	b
	jr	00104$
00108$:
;src/lib/video.c:122: for (u8 row = 0; row < 3; row++) {
	inc	c
	jr	00107$
00109$:
;src/lib/video.c:132: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;src/lib/video.c:134: void v_set_intro_roland_sprite_pos(i16 x_m2, i16 y, bool reversed) {
;	---------------------------------
; Function v_set_intro_roland_sprite_pos
; ---------------------------------
_v_set_intro_roland_sprite_pos::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	-4 (ix), e
	ld	-3 (ix), d
;src/lib/video.c:136: for (u8 row = 0; row < 2; row++) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x02
	jr	NC, 00109$
;src/lib/video.c:137: for (u8 col = 0; col < 2; col++) {
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x02
	jr	NC, 00108$
;src/lib/video.c:139: u8 tile_col = reversed ? (1 - col) : col;
	bit	0, 4 (ix)
	jr	Z, 00111$
	ld	e, b
	ld	a, #0x01
	sub	a, e
	ld	e, a
	jr	00112$
00111$:
	ld	e, b
00112$:
;src/lib/video.c:140: u8 spr_idx = (row * 2) + tile_col;
	ld	a, c
	add	a, a
	add	a, e
	ld	-5 (ix), a
;src/lib/video.c:143: spr_idx, x_m2 + (col << 5), y + (row << 4));
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	iy
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	add	iy, de
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, -2 (ix)
	ld	e, a
	ld	a, h
	adc	a, -1 (ix)
	ld	d, a
	ld	l, -5 (ix)
	ld	h, #0x00
	push	bc
	push	iy
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:137: for (u8 col = 0; col < 2; col++) {
	inc	b
	jr	00104$
00108$:
;src/lib/video.c:136: for (u8 row = 0; row < 2; row++) {
	inc	c
	jr	00107$
00109$:
;src/lib/video.c:146: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;src/lib/video.c:148: void v_set_title_roland_sprite_pos(i16 x_m2, i16 y, bool reversed) {
;	---------------------------------
; Function v_set_title_roland_sprite_pos
; ---------------------------------
_v_set_title_roland_sprite_pos::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	-4 (ix), e
	ld	-3 (ix), d
;src/lib/video.c:150: for (u8 row = 0; row < 2; row++) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x02
	jr	NC, 00109$
;src/lib/video.c:151: for (u8 col = 0; col < 2; col++) {
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x02
	jr	NC, 00108$
;src/lib/video.c:153: u8 tile_col = reversed ? (1 - col) : col;
	bit	0, 4 (ix)
	jr	Z, 00111$
	ld	e, b
	ld	a, #0x01
	sub	a, e
	ld	e, a
	jr	00112$
00111$:
	ld	e, b
00112$:
;src/lib/video.c:154: u8 spr_idx = HW_SPRITE_TITLE_ROLAND_START +
	ld	a, c
	add	a, a
	add	a, e
	ld	-5 (ix), a
;src/lib/video.c:158: spr_idx, x_m2 + (col << 5), y + (row << 4));
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	iy
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	add	iy, de
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, -2 (ix)
	ld	e, a
	ld	a, h
	adc	a, -1 (ix)
	ld	d, a
	ld	l, -5 (ix)
	ld	h, #0x00
	push	bc
	push	iy
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:151: for (u8 col = 0; col < 2; col++) {
	inc	b
	jr	00104$
00108$:
;src/lib/video.c:150: for (u8 row = 0; row < 2; row++) {
	inc	c
	jr	00107$
00109$:
;src/lib/video.c:161: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;src/lib/video.c:163: void v_set_made_cpctelera_sprite_pos(i16 x_m2, i16 y, bool reversed) {
;	---------------------------------
; Function v_set_made_cpctelera_sprite_pos
; ---------------------------------
_v_set_made_cpctelera_sprite_pos::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	-4 (ix), e
	ld	-3 (ix), d
;src/lib/video.c:167: for (u8 row = 0; row < 4; row++) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00109$
;src/lib/video.c:168: for (u8 col = 0; col < 4; col++) {
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x04
	jr	NC, 00108$
;src/lib/video.c:170: u8 tile_col = reversed ? (3 - col) : col;
	bit	0, 4 (ix)
	jr	Z, 00111$
	ld	e, b
	ld	a, #0x03
	sub	a, e
	ld	e, a
	jr	00112$
00111$:
	ld	e, b
00112$:
;src/lib/video.c:171: u8 spr_idx = (row * 4) + tile_col;
	ld	a, c
	add	a, a
	add	a, a
	add	a, e
	ld	-5 (ix), a
;src/lib/video.c:174: spr_idx, x_m2 + (col << 5), y + (row << 4));
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	iy
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	add	iy, de
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, -2 (ix)
	ld	e, a
	ld	a, h
	adc	a, -1 (ix)
	ld	d, a
	ld	l, -5 (ix)
	ld	h, #0x00
	push	bc
	push	iy
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:168: for (u8 col = 0; col < 4; col++) {
	inc	b
	jr	00104$
00108$:
;src/lib/video.c:167: for (u8 row = 0; row < 4; row++) {
	inc	c
	jr	00107$
00109$:
;src/lib/video.c:177: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;src/lib/video.c:180: void v_set_intro_spider_sprite_pos(i16 x_m2, i16 y, bool reversed) {
;	---------------------------------
; Function v_set_intro_spider_sprite_pos
; ---------------------------------
_v_set_intro_spider_sprite_pos::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-9
	add	iy, sp
	ld	sp, iy
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	-5 (ix), e
	ld	-4 (ix), d
;src/lib/video.c:187: for (u8 frame = 0; frame < SPIDER_FRAMES; frame++) {
	ld	a, -3 (ix)
	add	a, #0x20
	ld	-9 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	a, -5 (ix)
	add	a, #0x10
	ld	-7 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	-1 (ix), #0x00
00103$:
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	NC, 00105$
;src/lib/video.c:198: const u8 *s = spider_frame_sprites[frame];
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_v_set_intro_spider_sprite_pos_spider_frame_sprites_10001_287
	add	hl, de
	ld	c, l
	ld	b, h
;src/lib/video.c:200: cpct_asicSetSpritePosition(s[0], x_m2 + 0, y + 0);
	ld	a, (bc)
	ld	h, #0x00
	push	bc
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	push	de
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	l, a
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:201: cpct_asicSetSpritePosition(s[1], x_m2 + 32, y + 0);
	ld	l, c
	ld	h, b
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	push	de
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:202: cpct_asicSetSpritePosition(s[2], x_m2 + 0, y + 16);
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	push	de
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:203: cpct_asicSetSpritePosition(s[3], x_m2 + 32, y + 16);
	ld	hl, #3
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	push	de
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	call	_cpct_asicSetSpritePosition
;src/lib/video.c:187: for (u8 frame = 0; frame < SPIDER_FRAMES; frame++) {
	inc	-1 (ix)
	jr	00103$
00105$:
;src/lib/video.c:205: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
_v_set_intro_spider_sprite_pos_spider_frame_sprites_10001_287:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0b	; 11
;src/lib/video.c:208: void v_set_intro_snowball_sprite_pos(i16 x_m2, i16 y, bool reversed) {
;	---------------------------------
; Function v_set_intro_snowball_sprite_pos
; ---------------------------------
_v_set_intro_snowball_sprite_pos::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-9
	add	iy, sp
	ld	sp, iy
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	-5 (ix), e
	ld	-4 (ix), d
;src/lib/video.c:217: for (u8 frame = 0; frame < SNOWBALL_FRAMES; frame++) {
	ld	a, -3 (ix)
	add	a, #0x20
	ld	-9 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	a, -5 (ix)
	add	a, #0x10
	ld	-7 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	-1 (ix), #0x00
00103$:
	ld	a, -1 (ix)
	sub	a, #0x04
	jr	NC, 00105$
;src/lib/video.c:228: const u8 *s = snowball_frame_sprites[frame];
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_v_set_intro_snowball_sprite_pos_snowball_frame_sprites_10001_292
	add	hl, de
	ld	c, l
	ld	b, h
;src/lib/video.c:230: cpct_asicSetSpritePosition(s[0], x_m2 + 0, y + 0);
	ld	a, (bc)
	ld	h, #0x00
	push	bc
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	push	de
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	l, a
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:231: cpct_asicSetSpritePosition(s[1], x_m2 + 32, y + 0);
	ld	l, c
	ld	h, b
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	push	de
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:232: cpct_asicSetSpritePosition(s[2], x_m2 + 0, y + 16);
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	push	de
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/video.c:233: cpct_asicSetSpritePosition(s[3], x_m2 + 32, y + 16);
	ld	hl, #3
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	push	de
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	call	_cpct_asicSetSpritePosition
;src/lib/video.c:217: for (u8 frame = 0; frame < SNOWBALL_FRAMES; frame++) {
	inc	-1 (ix)
	jr	00103$
00105$:
;src/lib/video.c:235: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
_v_set_intro_snowball_sprite_pos_snowball_frame_sprites_10001_292:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0f	; 15
;src/lib/video.c:270: void v_spider_set_frame(u8 frame) {
;	---------------------------------
; Function v_spider_set_frame
; ---------------------------------
_v_spider_set_frame::
	ld	c, a
;src/lib/video.c:275: if (frame == last_frame)
;src/lib/video.c:276: return;
;src/lib/video.c:279: if (last_frame != 0xFF) {
	ld	a,(_last_frame+0)
	cp	a,c
	ret	Z
	inc	a
	jr	Z, 00120$
;src/lib/video.c:280: for (u8 i = 0; i < 4; i++)
	ld	b, #0x00
00108$:
	ld	a, b
	sub	a, #0x04
	jr	NC, 00120$
;src/lib/video.c:282: spider_frame_sprites[last_frame][i], 0, 0);
	ld	a, (_last_frame)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_v_spider_set_frame_spider_frame_sprites_10000_296
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/lib/video.c:280: for (u8 i = 0; i < 4; i++)
	inc	b
	jr	00108$
;src/lib/video.c:286: for (u8 i = 0; i < 4; i++)
00120$:
	ld	b, #0x00
00111$:
	ld	a, b
	sub	a, #0x04
	jr	NC, 00106$
;src/lib/video.c:287: cpct_asicSetSpriteZoom(spider_frame_sprites[frame][i], 2, 1);
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_v_spider_set_frame_spider_frame_sprites_10000_296
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/lib/video.c:286: for (u8 i = 0; i < 4; i++)
	inc	b
	jr	00111$
00106$:
;src/lib/video.c:289: last_frame = frame;
	ld	hl, #_last_frame
	ld	(hl), c
;src/lib/video.c:290: }
	ret
_v_spider_set_frame_spider_frame_sprites_10000_296:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0b	; 11
;src/lib/video.c:292: void v_snowball_set_frame(u8 frame) {
;	---------------------------------
; Function v_snowball_set_frame
; ---------------------------------
_v_snowball_set_frame::
	ld	c, a
;src/lib/video.c:297: if (frame == last_frame)
;src/lib/video.c:298: return;
;src/lib/video.c:301: if (last_frame != 0xFF) {
	ld	a,(_last_frame+0)
	cp	a,c
	ret	Z
	inc	a
	jr	Z, 00120$
;src/lib/video.c:302: for (u8 i = 0; i < 5; i++)
	ld	b, #0x00
00108$:
	ld	a, b
	sub	a, #0x05
	jr	NC, 00120$
;src/lib/video.c:304: snowball_frame_sprites[last_frame][i], 0, 0);
	ld	a, (_last_frame)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_v_snowball_set_frame_snowball_frame_sprites_10000_301
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/lib/video.c:302: for (u8 i = 0; i < 5; i++)
	inc	b
	jr	00108$
;src/lib/video.c:308: for (u8 i = 0; i < 5; i++)
00120$:
	ld	b, #0x00
00111$:
	ld	a, b
	sub	a, #0x05
	jr	NC, 00106$
;src/lib/video.c:309: cpct_asicSetSpriteZoom(snowball_frame_sprites[frame][i], 2, 1);
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_v_snowball_set_frame_snowball_frame_sprites_10000_301
	add	hl, de
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/lib/video.c:308: for (u8 i = 0; i < 5; i++)
	inc	b
	jr	00111$
00106$:
;src/lib/video.c:311: last_frame = frame;
	ld	hl, #_last_frame
	ld	(hl), c
;src/lib/video.c:312: }
	ret
_v_snowball_set_frame_snowball_frame_sprites_10000_301:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0f	; 15
	.area _CODE
	.area _INITIALIZER
__xinit__v_pixel_scroll:
	.db #0x00	; 0
__xinit__v_char_scroll:
	.dw #0x0000
__xinit__last_frame:
	.db #0xff	; 255
	.area _CABS (ABS)
