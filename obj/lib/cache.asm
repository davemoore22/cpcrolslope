;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module cache
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _a_page_disconnect_safe
	.globl _a_page_connect_safe
	.globl _a_sprite_flip_horizontal_inplace
	.globl _cpct_asicCopySpriteData
	.globl _cpct_zx7b_decrunch_s
	.globl _cpct_pageMemory
	.globl _cpct_memcpy
	.globl _cpct_memset
	.globl _g_sprite_banks
	.globl _c_sprite_cache_bank_init
	.globl _c_sprite_cache_bank_upload
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_sprite_banks::
	.ds 15
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;src/lib/cache.c:37: void c_sprite_cache_bank_init(void) {
;	---------------------------------
; Function c_sprite_cache_bank_init
; ---------------------------------
_c_sprite_cache_bank_init::
	call	___sdcc_enter_ix
	dec	sp
;src/lib/cache.c:42: g_sprite_banks[SPR_BANK_ROLAND_L].offset = bank_offset;
	ld	hl, #0x0000
	ld	(_g_sprite_banks), hl
;src/lib/cache.c:43: g_sprite_banks[SPR_BANK_ROLAND_L].count = 4;
	ld	hl, #_g_sprite_banks + 2
	ld	(hl), #0x04
;src/lib/cache.c:44: for (u8 i = 0; i < 4; i++) {
	ld	de, #0x0000
	ld	-1 (ix), #0x00
00107$:
	ld	a, -1 (ix)
	sub	a, #0x04
	jr	NC, 00101$
;src/lib/cache.c:46: &roland_sprites_data[i], bank_offset, false);
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	bc, #_roland_sprites_data
	add	hl, bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_c_expand_sprite_to_bank
	pop	de
;src/lib/cache.c:47: bank_offset += SPRITE_BYTES;
	inc	d
;src/lib/cache.c:44: for (u8 i = 0; i < 4; i++) {
	inc	-1 (ix)
	jr	00107$
00101$:
;src/lib/cache.c:51: g_sprite_banks[SPR_BANK_ROLAND_R].offset = bank_offset;
	ld	((_g_sprite_banks + 3)), de
;src/lib/cache.c:52: g_sprite_banks[SPR_BANK_ROLAND_R].count = 4;
	ld	hl, #_g_sprite_banks + 5
	ld	(hl), #0x04
;src/lib/cache.c:53: for (u8 i = 0; i < 4; i++) {
	ld	c, #0x00
00110$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00102$
;src/lib/cache.c:55: &roland_sprites_data[i], bank_offset, true);
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_roland_sprites_data)
	ld	l, a
	ld	a, h
	adc	a, #>(_roland_sprites_data)
	push	bc
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, a
	call	_c_expand_sprite_to_bank
	pop	de
	pop	bc
;src/lib/cache.c:56: bank_offset += SPRITE_BYTES;
	inc	d
;src/lib/cache.c:53: for (u8 i = 0; i < 4; i++) {
	inc	c
	jr	00110$
00102$:
;src/lib/cache.c:60: g_sprite_banks[SPR_BANK_MODE_CLASSIC].offset = bank_offset;
	ld	((_g_sprite_banks + 6)), de
;src/lib/cache.c:61: g_sprite_banks[SPR_BANK_MODE_CLASSIC].count = 4;
	ld	hl, #_g_sprite_banks + 8
	ld	(hl), #0x04
;src/lib/cache.c:62: for (u8 i = 0; i < 4; i++) {
	ld	c, #0x00
00113$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00103$
;src/lib/cache.c:64: &mode_sprites_data[i], bank_offset, false);
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_mode_sprites_data)
	ld	l, a
	ld	a, h
	adc	a, #>(_mode_sprites_data)
	ld	h, a
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_c_expand_sprite_to_bank
	pop	de
	pop	bc
;src/lib/cache.c:65: bank_offset += SPRITE_BYTES;
	inc	d
;src/lib/cache.c:62: for (u8 i = 0; i < 4; i++) {
	inc	c
	jr	00113$
00103$:
;src/lib/cache.c:69: g_sprite_banks[SPR_BANK_MODE_MANIA].offset = bank_offset;
	ld	((_g_sprite_banks + 9)), de
;src/lib/cache.c:70: g_sprite_banks[SPR_BANK_MODE_MANIA].count = 3;
	ld	hl, #_g_sprite_banks + 11
	ld	(hl), #0x03
;src/lib/cache.c:71: for (u8 i = 0; i < 3; i++) {
	ld	c, #0x00
00116$:
;src/lib/cache.c:73: &mode_sprites_data[4 + i], bank_offset, false);
	ld	a,c
	cp	a,#0x03
	jr	NC, 00104$
	add	a, #0x04
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_mode_sprites_data
	add	hl, de
	pop	de
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_c_expand_sprite_to_bank
	pop	de
	pop	bc
;src/lib/cache.c:74: bank_offset += SPRITE_BYTES;
	inc	d
;src/lib/cache.c:71: for (u8 i = 0; i < 3; i++) {
	inc	c
	jr	00116$
00104$:
;src/lib/cache.c:78: g_sprite_banks[SPR_BANK_MODE_ZEN].offset = bank_offset;
	ld	((_g_sprite_banks + 12)), de
;src/lib/cache.c:79: g_sprite_banks[SPR_BANK_MODE_ZEN].count = 2;
	ld	hl, #_g_sprite_banks + 14
	ld	(hl), #0x02
;src/lib/cache.c:80: for (u8 i = 0; i < 2; i++) {
	ld	c, #0x00
00119$:
;src/lib/cache.c:82: &mode_sprites_data[7 + i], bank_offset, false);
	ld	a,c
	cp	a,#0x02
	jr	NC, 00121$
	add	a, #0x07
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, #<(_mode_sprites_data)
	add	a, l
	ld	l, a
	ld	a, #>(_mode_sprites_data)
	adc	a, h
	ld	h, a
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_c_expand_sprite_to_bank
	pop	de
	pop	bc
;src/lib/cache.c:83: bank_offset += SPRITE_BYTES;
	inc	d
;src/lib/cache.c:80: for (u8 i = 0; i < 2; i++) {
	inc	c
	jr	00119$
00121$:
;src/lib/cache.c:85: }
	inc	sp
	pop	ix
	ret
_bank_counts:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x02	; 2
;src/lib/cache.c:87: void c_sprite_cache_bank_upload(
;	---------------------------------
; Function c_sprite_cache_bank_upload
; ---------------------------------
_c_sprite_cache_bank_upload::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
	ld	c, l
;src/lib/cache.c:90: const sprite_bank_desc_t *b = &g_sprite_banks[bank];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	ld	de, #_g_sprite_banks
	add	hl, de
;src/lib/cache.c:92: if (index >= b->count)
	ld	e, l
	ld	d, h
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, b
;src/lib/cache.c:93: return;
	jr	NC, 00103$
;src/lib/cache.c:95: u16 offset = b->offset + (index * SPRITE_BYTES);
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	xor	a, a
	ld	h, c
	ld	l, #0x00
	add	hl, de
;src/lib/cache.c:97: c_fetch_sprite_from_bank_and_upload(offset, hw_id);
	ld	a, 4 (ix)
	push	af
	inc	sp
	call	_c_fetch_sprite_from_bank_and_upload
00103$:
;src/lib/cache.c:98: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;src/lib/cache.c:101: static void c_expand_sprite_to_bank(const sprite_data_t *src,
;	---------------------------------
; Function c_expand_sprite_to_bank
; ---------------------------------
_c_expand_sprite_to_bank:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	de
;src/lib/cache.c:105: a_page_disconnect_safe();
	push	hl
	call	_a_page_disconnect_safe
;src/lib/cache.c:109: cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);
	ld	de, #0x0100
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0xbf00
	call	_cpct_memset
	pop	hl
;src/lib/cache.c:110: cpct_zx7b_decrunch_s(buf_end, src->end);
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0xbfff
	call	_cpct_zx7b_decrunch_s
;src/lib/cache.c:113: if (flip_horizontal)
	bit	0, 4 (ix)
	jr	Z, 00102$
;src/lib/cache.c:114: a_sprite_flip_horizontal_inplace(HW_SPRITE_BUFFER);
	ld	hl, #0xbf00
	call	_a_sprite_flip_horizontal_inplace
00102$:
;src/lib/cache.c:117: cpct_pageMemory(RAMCFG_6 | BANK_0);
	ld	l, #0x06
	call	_cpct_pageMemory
;src/lib/cache.c:120: cpct_memcpy((u8 *)(SPRITE_BANK_BASE + bank_offset), HW_SPRITE_BUFFER,
	pop	hl
	push	hl
	ld	de, #0x4001
	add	hl, de
	ld	de, #0x0100
	push	de
	ld	de, #0xbf00
	call	_cpct_memcpy
;src/lib/cache.c:124: cpct_pageMemory(RAMCFG_0 | BANK_0);
	ld	l, #0x00
	call	_cpct_pageMemory
;src/lib/cache.c:127: a_page_connect_safe();
	call	_a_page_connect_safe
;src/lib/cache.c:128: }
	pop	af
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;src/lib/cache.c:131: static void c_fetch_sprite_from_bank_and_upload(
;	---------------------------------
; Function c_fetch_sprite_from_bank_and_upload
; ---------------------------------
_c_fetch_sprite_from_bank_and_upload:
;src/lib/cache.c:135: a_page_disconnect_safe();
	push	hl
	call	_a_page_disconnect_safe
;src/lib/cache.c:138: cpct_pageMemory(RAMCFG_6 | BANK_0);
	ld	l, #0x06
	call	_cpct_pageMemory
;src/lib/cache.c:141: cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);
	ld	de, #0x0100
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0xbf00
	call	_cpct_memset
	pop	hl
;src/lib/cache.c:142: cpct_memcpy(HW_SPRITE_BUFFER, (u8 *)(SPRITE_BANK_BASE + bank_offset),
	ld	bc, #0x4001
	add	hl, bc
	ld	de, #0x0100
	ex	de, hl
	push	hl
	ld	hl, #0xbf00
	call	_cpct_memcpy
;src/lib/cache.c:146: cpct_pageMemory(RAMCFG_0 | BANK_0);
	ld	l, #0x00
	call	_cpct_pageMemory
;src/lib/cache.c:149: a_page_connect_safe();
	call	_a_page_connect_safe
;src/lib/cache.c:152: cpct_asicCopySpriteData(hw_id, HW_SPRITE_BUFFER);
	ld	iy, #2
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, #0x00
	ld	de, #0xbf00
	call	_cpct_asicCopySpriteData
;src/lib/cache.c:153: }
	pop	hl
	inc	sp
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
