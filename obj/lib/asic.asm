;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module asic
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_asicPageDisconnect
	.globl _cpct_asicPageConnect
	.globl _cpct_asicSetSpritePalette
	.globl _cpct_asicSetSpritePalColour
	.globl _cpct_asicSetSpriteZoom
	.globl _cpct_asicSetSpritePosition
	.globl _cpct_asicCopySpriteData
	.globl _cpct_zx7b_decrunch_s
	.globl _cpct_waitVSYNCStart
	.globl _cpct_memset
	.globl _a_sprite_flip_horizontal_inplace
	.globl _a_set_hardware_sprite_palette
	.globl _a_blank_hardware_sprite_palette
	.globl _a_load_roland_sprites
	.globl _a_load_ghost_sprites
	.globl _a_load_spider_sprites
	.globl _a_load_snowball_sprites
	.globl _a_load_cpctelera_sprites
	.globl _a_load_hw_sprite
	.globl _a_load_sprite_set
	.globl _a_clear_sprites
	.globl _a_load_sprite_range
	.globl _a_hide_sprite_range
	.globl _a_clear_all_sprites
	.globl _a_show_sprite
	.globl _a_hide_sprite
	.globl _a_set_sprite_zoom_range
	.globl _a_page_connect_safe
	.globl _a_page_disconnect_safe
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
_a_asic_paged:
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
;src/lib/asic.c:23: void a_sprite_flip_horizontal_inplace(u8 *sprite) {
;	---------------------------------
; Function a_sprite_flip_horizontal_inplace
; ---------------------------------
_a_sprite_flip_horizontal_inplace::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ex	de, hl
;src/lib/asic.c:25: for (u8 y = 0; y < SPRITE_H; y++) {
	ld	-2 (ix), #0x00
00107$:
	ld	a, -2 (ix)
	sub	a, #0x10
	jr	NC, 00109$
;src/lib/asic.c:26: u8 *row = sprite + y * SPRITE_W;
	ld	l, -2 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	(sp), hl
;src/lib/asic.c:28: for (u8 x = 0; x < (SPRITE_W >> 1); x++) {
	ld	-1 (ix), #0x00
00104$:
	ld	a, -1 (ix)
	sub	a, #0x08
	jr	NC, 00108$
;src/lib/asic.c:29: u8 tmp = row[x];
	ld	a, -5 (ix)
	add	a, -1 (ix)
	ld	c, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	-3 (ix), a
;src/lib/asic.c:30: row[x] = row[SPRITE_W - 1 - x];
	ld	l, -1 (ix)
	ld	a, #0x0f
	sub	a, l
	add	a, -5 (ix)
	ld	l, a
	ld	a, #0x00
	adc	a, -4 (ix)
	ld	h, a
	ld	a, (hl)
	ld	(bc), a
;src/lib/asic.c:31: row[SPRITE_W - 1 - x] = tmp;
	ld	a, -3 (ix)
	ld	(hl), a
;src/lib/asic.c:28: for (u8 x = 0; x < (SPRITE_W >> 1); x++) {
	inc	-1 (ix)
	jr	00104$
00108$:
;src/lib/asic.c:25: for (u8 y = 0; y < SPRITE_H; y++) {
	inc	-2 (ix)
	jr	00107$
00109$:
;src/lib/asic.c:34: }
	ld	sp, ix
	pop	ix
	ret
;src/lib/asic.c:36: void a_set_hardware_sprite_palette(const u16 *palette) {
;	---------------------------------
; Function a_set_hardware_sprite_palette
; ---------------------------------
_a_set_hardware_sprite_palette::
;src/lib/asic.c:38: cpct_asicSetSpritePalette(palette, 16);
	ld	de, #0x0010
;src/lib/asic.c:39: }
	jp	_cpct_asicSetSpritePalette
;src/lib/asic.c:41: void a_blank_hardware_sprite_palette(void) {
;	---------------------------------
; Function a_blank_hardware_sprite_palette
; ---------------------------------
_a_blank_hardware_sprite_palette::
;src/lib/asic.c:43: for (u8 i = 0; i < 16; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x10
	ret	NC
;src/lib/asic.c:44: cpct_asicSetSpritePalColour(i, 0xFFF);
	ld	l, c
	ld	h, #0x00
	push	bc
	ld	de, #0x0fff
	call	_cpct_asicSetSpritePalColour
	pop	bc
;src/lib/asic.c:43: for (u8 i = 0; i < 16; i++)
	inc	c
;src/lib/asic.c:45: }
	jr	00103$
;src/lib/asic.c:47: void a_load_roland_sprites(bool flip) {
;	---------------------------------
; Function a_load_roland_sprites
; ---------------------------------
_a_load_roland_sprites::
	ld	b, a
;src/lib/asic.c:49: a_load_sprite_set(roland_sprites_data, NULL, 4, flip);
	ld	c, #0x04
	push	bc
	ld	de, #0x0000
	ld	hl, #_roland_sprites_data
	call	_a_load_sprite_set
;src/lib/asic.c:50: }
	ret
;src/lib/asic.c:52: void a_load_ghost_sprites(bool flip) {
;	---------------------------------
; Function a_load_ghost_sprites
; ---------------------------------
_a_load_ghost_sprites::
	ld	b, a
;src/lib/asic.c:54: a_load_sprite_set(ghost_sprites_data, NULL, 9, flip);
	ld	c, #0x09
	push	bc
	ld	de, #0x0000
	ld	hl, #_ghost_sprites_data
	call	_a_load_sprite_set
;src/lib/asic.c:55: }
	ret
;src/lib/asic.c:57: void a_load_spider_sprites(bool flip) {
;	---------------------------------
; Function a_load_spider_sprites
; ---------------------------------
_a_load_spider_sprites::
	ld	b, a
;src/lib/asic.c:59: a_load_sprite_set(spider_sprites_data, NULL, 12, flip);
	ld	c, #0x0c
	push	bc
	ld	de, #0x0000
	ld	hl, #_spider_sprites_data
	call	_a_load_sprite_set
;src/lib/asic.c:60: }
	ret
;src/lib/asic.c:62: void a_load_snowball_sprites(bool flip) {
;	---------------------------------
; Function a_load_snowball_sprites
; ---------------------------------
_a_load_snowball_sprites::
	ld	b, a
;src/lib/asic.c:64: a_load_sprite_set(snowball_sprites_data, NULL, 16, flip);
	ld	c, #0x10
	push	bc
	ld	de, #0x0000
	ld	hl, #_snowball_sprites_data
	call	_a_load_sprite_set
;src/lib/asic.c:65: }
	ret
;src/lib/asic.c:67: void a_load_cpctelera_sprites(bool flip) {
;	---------------------------------
; Function a_load_cpctelera_sprites
; ---------------------------------
_a_load_cpctelera_sprites::
	ld	b, a
;src/lib/asic.c:69: a_load_sprite_set(cpctelera_sprites_data, NULL, 16, flip);
	ld	c, #0x10
	push	bc
	ld	de, #0x0000
	ld	hl, #_cpctelera_sprites_data
	call	_a_load_sprite_set
;src/lib/asic.c:70: }
	ret
;src/lib/asic.c:72: void a_load_hw_sprite(u8 hw_id, u8 frame, const sprite_data_t *sprite_table,
;	---------------------------------
; Function a_load_hw_sprite
; ---------------------------------
_a_load_hw_sprite::
	ld	c, a
	ld	b, l
;src/lib/asic.c:77: cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);
	push	bc
	ld	hl, #0x0100
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xbf
	call	_cpct_memset
;src/lib/asic.c:79: cpct_waitVSYNCStart();
	call	_cpct_waitVSYNCStart
;src/lib/asic.c:80: cpct_asicPageDisconnect();
	call	_cpct_asicPageDisconnect
	pop	bc
;src/lib/asic.c:81: cpct_zx7b_decrunch_s(dst_end, sprite_table[frame].end);
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	e, h
	ld	hl, #2
	add	hl, sp
	add	a, (hl)
	inc	hl
	ld	b, a
	ld	a, e
	adc	a, (hl)
	ld	h, a
	ld	l, b
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #0xbfff
	call	_cpct_zx7b_decrunch_s
;src/lib/asic.c:82: cpct_asicPageConnect();
	call	_cpct_asicPageConnect
	pop	bc
;src/lib/asic.c:84: if (flip_horizontal)
	ld	hl, #4
	add	hl, sp
	bit	0, (hl)
	jr	Z, 00102$
;src/lib/asic.c:85: a_sprite_flip_horizontal_inplace(HW_SPRITE_BUFFER);
	push	bc
	ld	hl, #0xbf00
	call	_a_sprite_flip_horizontal_inplace
	pop	bc
00102$:
;src/lib/asic.c:87: cpct_asicCopySpriteData(hw_id, HW_SPRITE_BUFFER);
	ld	h, #0x00
	ld	de, #0xbf00
	ld	l, c
	call	_cpct_asicCopySpriteData
;src/lib/asic.c:88: }
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;src/lib/asic.c:90: void a_load_sprite_set(const sprite_data_t *sprites,
;	---------------------------------
; Function a_load_sprite_set
; ---------------------------------
_a_load_sprite_set::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ex	(sp), hl
;src/lib/asic.c:93: for (u8 i = 0; i < count; i++) {
	ld	-1 (ix), #0x00
00106$:
	ld	a, -1 (ix)
	sub	a, 4 (ix)
	jr	NC, 00108$
;src/lib/asic.c:95: if (layout) {
	ld	a, d
	or	a, e
	jr	Z, 00102$
;src/lib/asic.c:96: const sprite_load_t *s = &layout[i];
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, de
;src/lib/asic.c:98: s->hw_id, s->frame, sprites, flip_horizontal);
	ld	c,l
	ld	b,h
	inc	hl
	ld	l, (hl)
	ld	a, (bc)
	push	bc
	push	de
	ld	h, 5 (ix)
	push	hl
	inc	sp
	push	hl
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ex	(sp), hl
	call	_a_load_hw_sprite
	pop	de
	pop	bc
;src/lib/asic.c:99: cpct_asicSetSpriteZoom(s->hw_id, 2, 1);
	ld	a, (bc)
	ld	h, #0x00
	push	de
	ld	b, #0x01
	push	bc
	inc	sp
	ld	b, #0x02
	push	bc
	inc	sp
	ld	l, a
	call	_cpct_asicSetSpriteZoom
	pop	de
	jr	00107$
00102$:
;src/lib/asic.c:101: a_load_hw_sprite(i, i, sprites, flip_horizontal);
	push	de
	ld	a, 5 (ix)
	push	af
	inc	sp
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	ld	l, -1 (ix)
	ld	a, -1 (ix)
	call	_a_load_hw_sprite
	pop	de
;src/lib/asic.c:102: cpct_asicSetSpriteZoom(i, 2, 1);
	ld	l, -1 (ix)
	ld	h, #0x00
	push	de
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	de
00107$:
;src/lib/asic.c:93: for (u8 i = 0; i < count; i++) {
	inc	-1 (ix)
	jr	00106$
00108$:
;src/lib/asic.c:105: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;src/lib/asic.c:107: void a_clear_sprites(void) {
;	---------------------------------
; Function a_clear_sprites
; ---------------------------------
_a_clear_sprites::
;src/lib/asic.c:109: for (u8 i = 0; i < 16; i++) {
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x10
	ret	NC
;src/lib/asic.c:110: cpct_asicSetSpriteZoom(i, 0, 0);
	ld	l, c
	ld	h, #0x00
	push	hl
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
	pop	hl
;src/lib/asic.c:111: cpct_asicSetSpritePosition(i, -64, -64);
	push	bc
	ld	de, #0xffc0
	push	de
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/asic.c:109: for (u8 i = 0; i < 16; i++) {
	inc	c
;src/lib/asic.c:113: }
	jr	00103$
;src/lib/asic.c:115: void a_load_sprite_range(u8 slot_start, const u8 *const *sprites, u8 count) {
;	---------------------------------
; Function a_load_sprite_range
; ---------------------------------
_a_load_sprite_range::
	call	___sdcc_enter_ix
	push	af
	push	af
	ld	-2 (ix), a
	inc	sp
	inc	sp
	push	de
;src/lib/asic.c:117: for (u8 i = 0; i < count; i++) {
	ld	-1 (ix), #0x00
00103$:
	ld	a, -1 (ix)
	sub	a, 4 (ix)
	jr	NC, 00105$
;src/lib/asic.c:118: cpct_asicCopySpriteData(slot_start + i, sprites[i]);
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	pop	de
	push	de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -2 (ix)
	ld	h, #0x00
	add	hl, bc
	push	hl
	call	_cpct_asicCopySpriteData
	pop	hl
;src/lib/asic.c:119: cpct_asicSetSpriteZoom(slot_start + i, 2, 1);
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
;src/lib/asic.c:117: for (u8 i = 0; i < count; i++) {
	inc	-1 (ix)
	jr	00103$
00105$:
;src/lib/asic.c:121: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;src/lib/asic.c:123: void a_hide_sprite_range(u8 slot_start, u8 count) {
;	---------------------------------
; Function a_hide_sprite_range
; ---------------------------------
_a_hide_sprite_range::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	-1 (ix), a
	ld	c, l
;src/lib/asic.c:125: for (u8 i = 0; i < count; i++) {
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	jr	NC, 00105$
;src/lib/asic.c:126: cpct_asicSetSpriteZoom(slot_start + i, 0, 0);
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, b
	ld	h, #0x00
	add	hl, de
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/lib/asic.c:125: for (u8 i = 0; i < count; i++) {
	inc	b
	jr	00103$
00105$:
;src/lib/asic.c:128: }
	inc	sp
	pop	ix
	ret
;src/lib/asic.c:130: void a_clear_all_sprites(void) {
;	---------------------------------
; Function a_clear_all_sprites
; ---------------------------------
_a_clear_all_sprites::
;src/lib/asic.c:132: for (u8 i = 0; i < 16; i++) {
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x10
	ret	NC
;src/lib/asic.c:133: cpct_asicSetSpriteZoom(i, 0, 0);
	ld	l, c
	ld	h, #0x00
	push	hl
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
	pop	hl
;src/lib/asic.c:134: cpct_asicSetSpritePosition(i, -64, -64);
	push	bc
	ld	de, #0xffc0
	push	de
	call	_cpct_asicSetSpritePosition
	pop	bc
;src/lib/asic.c:132: for (u8 i = 0; i < 16; i++) {
	inc	c
;src/lib/asic.c:136: }
	jr	00103$
;src/lib/asic.c:138: void a_show_sprite(u8 slot) {
;	---------------------------------
; Function a_show_sprite
; ---------------------------------
_a_show_sprite::
;src/lib/asic.c:140: cpct_asicSetSpriteZoom(slot, 2, 1);
	ld	h, #0x00
	ld	d, #0x01
	push	de
	inc	sp
	ld	d, #0x02
	push	de
	inc	sp
	ld	l, a
	call	_cpct_asicSetSpriteZoom
;src/lib/asic.c:141: }
	ret
;src/lib/asic.c:143: void a_hide_sprite(u8 slot) {
;	---------------------------------
; Function a_hide_sprite
; ---------------------------------
_a_hide_sprite::
;src/lib/asic.c:145: cpct_asicSetSpriteZoom(slot, 0, 0);
	ld	l, a
	ld	h, #0x00
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
;src/lib/asic.c:146: }
	ret
;src/lib/asic.c:148: void a_set_sprite_zoom_range(u8 slot_start, u8 zoom_x, u8 zoom_y, u8 count) {
;	---------------------------------
; Function a_set_sprite_zoom_range
; ---------------------------------
_a_set_sprite_zoom_range::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	-1 (ix), a
	ld	b, l
;src/lib/asic.c:150: for (u8 i = 0; i < count; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, 5 (ix)
	jr	NC, 00105$
;src/lib/asic.c:151: cpct_asicSetSpriteZoom(slot_start + i, zoom_x, zoom_y);
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, c
	ld	h, #0x00
	add	hl, de
	push	bc
	ld	a, 4 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/lib/asic.c:150: for (u8 i = 0; i < count; i++)
	inc	c
	jr	00103$
00105$:
;src/lib/asic.c:152: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;src/lib/asic.c:154: void a_page_connect_safe(void) {
;	---------------------------------
; Function a_page_connect_safe
; ---------------------------------
_a_page_connect_safe::
;src/lib/asic.c:156: if (!a_asic_paged) {
	ld	hl, #_a_asic_paged
	bit	0, (hl)
	ret	NZ
;src/lib/asic.c:157: cpct_asicPageConnect();
	call	_cpct_asicPageConnect
;src/lib/asic.c:158: a_asic_paged = true;
	ld	hl, #_a_asic_paged
	ld	(hl), #0x01
;src/lib/asic.c:160: }
	ret
;src/lib/asic.c:162: void a_page_disconnect_safe(void) {
;	---------------------------------
; Function a_page_disconnect_safe
; ---------------------------------
_a_page_disconnect_safe::
;src/lib/asic.c:164: if (a_asic_paged) {
	ld	hl, #_a_asic_paged
	bit	0, (hl)
	ret	Z
;src/lib/asic.c:165: cpct_asicPageDisconnect();
	call	_cpct_asicPageDisconnect
;src/lib/asic.c:166: a_asic_paged = false;
	xor	a, a
	ld	(_a_asic_paged+0), a
;src/lib/asic.c:168: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__a_asic_paged:
	.db #0x00	;  0
	.area _CABS (ABS)
