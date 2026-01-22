;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module titles
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _v_set_title_roland_sprite_pos
	.globl _v_clear_screen
	.globl _v_blank_screen_mode_1
	.globl _d_gfx_decompress_to_screen
	.globl _d_load
	.globl _c_sprite_cache_bank_upload
	.globl _a_page_disconnect_safe
	.globl _a_page_connect_safe
	.globl _a_load_hw_sprite
	.globl _a_blank_hardware_sprite_palette
	.globl _a_clear_sprites
	.globl _a_set_hardware_sprite_palette
	.globl _a_hide_sprite_range
	.globl _cpct_asicRemoveLinesInterruptHandler
	.globl _cpct_asicSetLinesInterruptHandler
	.globl _cpct_asicSetPalette
	.globl _cpct_asicSetPalColour
	.globl _cpct_asicSetBorder
	.globl _cpct_asicSetSpriteZoom
	.globl _cpct_asicSetSpritePosition
	.globl _cpct_PLY_AKG_Play
	.globl _cpct_PLY_AKG_Init
	.globl _cpct_waitVSYNC
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_if
	.globl _g_game_mode
	.globl _t_start
	.globl _t_do
	.globl _t_stop
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_t_roland_x:
	.ds 2
_t_roland_start_x:
	.ds 2
_t_roland_end_x:
	.ds 2
_t_roland_step:
	.ds 1
_t_roland_y:
	.ds 1
_t_roland_active:
	.ds 1
_t_poll_title_input_left_was_down_10000_356:
	.ds 1
_t_poll_title_input_right_was_down_10000_356:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_game_mode::
	.ds 1
_t_int_idx:
	.ds 1
_t_frame_c:
	.ds 1
_text_phase:
	.ds 1
_text_tick:
	.ds 1
_slopes_phase:
	.ds 1
_slopes_dir:
	.ds 1
_slopes_tick:
	.ds 1
_t_roland_right:
	.ds 1
_t_mode_cooldown:
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
;src/titles.c:565: static bool left_was_down = false;
;src/titles.c:566: static bool right_was_down = false;
	xor	a, a
	ld	(_t_poll_title_input_left_was_down_10000_356+0), a
	ld	(_t_poll_title_input_right_was_down_10000_356+0), a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/titles.c:158: void t_start(void) {
;	---------------------------------
; Function t_start
; ---------------------------------
_t_start::
;src/titles.c:160: a_clear_sprites();
	call	_a_clear_sprites
;src/titles.c:161: v_blank_screen_mode_1();
	call	_v_blank_screen_mode_1
;src/titles.c:162: v_clear_screen();
	call	_v_clear_screen
;src/titles.c:163: g_game_mode = 0;
	xor	a, a
	ld	(_g_game_mode+0), a
;src/titles.c:166: t_load_static_title_sprites();
	call	_t_load_static_title_sprites
;src/titles.c:169: t_init_roland_slots(140);
	ld	a, #0x8c
	call	_t_init_roland_slots
;src/titles.c:170: t_load_roland_from_cache(false);
	xor	a, a
	call	_t_load_roland_from_cache
;src/titles.c:173: t_load_game_mode_word();
	call	_t_load_game_mode_word
;src/titles.c:175: a_blank_hardware_sprite_palette();
	call	_a_blank_hardware_sprite_palette
;src/titles.c:176: t_draw_bg();
	call	_t_draw_bg
;src/titles.c:177: a_set_hardware_sprite_palette(roland_sprites_palette);
	ld	hl, #_roland_sprites_palette
	call	_a_set_hardware_sprite_palette
;src/titles.c:178: t_draw_game_mode();
	call	_t_draw_game_mode
;src/titles.c:179: t_draw_static_sprites();
	call	_t_draw_static_sprites
;src/titles.c:181: cpct_PLY_AKG_Init(TITLE_MUSIC_LOC, 0);
	ld	de, #0x0000
	ld	hl, #0xad00
	call	_cpct_PLY_AKG_Init
;src/titles.c:183: t_reset_timers();
	call	_t_reset_timers
;src/titles.c:184: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
	ld	hl, #0x0fff
;src/titles.c:185: }
	jp	_cpct_asicSetBorder
_text_col_top:
	.dw #0x0fd9
	.dw #0x0fea
	.dw #0x0ffb
	.dw #0x0ffc
	.dw #0x0ffd
	.dw #0x0ffc
	.dw #0x0ffb
	.dw #0x0fea
_text_col_bottom:
	.dw #0x0ffd
	.dw #0x0ffc
	.dw #0x0ffb
	.dw #0x0fea
	.dw #0x0fd9
	.dw #0x0fea
	.dw #0x0ffb
	.dw #0x0ffc
_roland_band_colours:
	.dw #0x000f
	.dw #0x031f
	.dw #0x053f
	.dw #0x084f
	.dw #0x0b6f
	.dw #0x0d7f
	.dw #0x0d9f
_t_pal_blank:
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
	.dw #0x0fff
_t_pal_top:
	.dw #0x0fff
	.dw #0x099b
	.dw #0x0114
	.dw #0x077d
_t_slopes_ramp:
	.dw #0x066c
	.dw #0x077d
	.dw #0x088e
	.dw #0x099f
	.dw #0x0aaf
	.dw #0x099f
	.dw #0x088e
	.dw #0x077d
_t_pal_slopes:
	.dw #0x0fff
	.dw #0x05f0
	.dw #0x0000
	.dw #0x0bf4
_t_pal_trees:
	.dw #0x0fff
	.dw #0x0a68
	.dw #0x0411
	.dw #0x0735
_t_pal_middle:
	.dw #0x051d
	.dw #0x0538
	.dw #0x0a5e
	.dw #0x0fff
_t_pal_ice:
	.dw #0x0a7f
	.dw #0x0eaf
	.dw #0x085e
	.dw #0x0edf
_t_pal_text:
	.dw #0x094e
	.dw #0x0ebf
	.dw #0x07f0
	.dw #0x0ce1
;src/titles.c:187: void t_do(void) {
;	---------------------------------
; Function t_do
; ---------------------------------
_t_do::
;src/titles.c:189: t_add_interrupt();
	call	_t_add_interrupt
;src/titles.c:191: t_start_roland_scroll(false, 140, 4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	l, #0x8c
	xor	a, a
	call	_t_start_roland_scroll
;src/titles.c:193: while (1) {
00115$:
;src/titles.c:196: if (t_mode_cooldown > 0) {
	ld	a, (_t_mode_cooldown+0)
	or	a, a
	jr	Z, 00112$
;src/titles.c:197: t_mode_cooldown--;
	ld	hl, #_t_mode_cooldown
	dec	(hl)
	jr	00113$
00112$:
;src/titles.c:199: title_input_t input = t_poll_title_input();
	call	_t_poll_title_input
;src/titles.c:201: if (input != TITLE_INPUT_NONE) {
;src/titles.c:202: t_change_game_mode((i8)input);
	or	a,a
	jr	Z, 00113$
	call	_t_change_game_mode
;src/titles.c:203: t_mode_cooldown = TITLE_MODE_COOLDOWN_FRAMES;
	ld	hl, #_t_mode_cooldown
	ld	(hl), #0x19
;src/titles.c:204: if (g_game_mode == 0)
	ld	a, (_g_game_mode+0)
	or	a, a
	jr	NZ, 00107$
;src/titles.c:206: titles_sprites_palette_classic);
	ld	hl, #_titles_sprites_palette_classic
	call	_a_set_hardware_sprite_palette
	jr	00113$
00107$:
;src/titles.c:207: else if (g_game_mode == 1)
	ld	a, (_g_game_mode+0)
	dec	a
	jr	NZ, 00104$
;src/titles.c:209: titles_sprites_palette_mania);
	ld	hl, #_titles_sprites_palette_mania
	call	_a_set_hardware_sprite_palette
	jr	00113$
00104$:
;src/titles.c:210: else if (g_game_mode == 2)
	ld	a, (_g_game_mode+0)
	sub	a, #0x02
	jr	NZ, 00113$
;src/titles.c:212: titles_sprites_palette_zen);
	ld	hl, #_titles_sprites_palette_zen
	call	_a_set_hardware_sprite_palette
00113$:
;src/titles.c:217: t_update_roland();
	call	_t_update_roland
;src/titles.c:219: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/titles.c:221: }
	jr	00115$
;src/titles.c:223: void t_stop(void) {
;	---------------------------------
; Function t_stop
; ---------------------------------
_t_stop::
;src/titles.c:225: t_remove_interrupt();
	call	_t_remove_interrupt
;src/titles.c:226: a_clear_sprites();
	call	_a_clear_sprites
;src/titles.c:227: v_blank_screen_mode_1();
;src/titles.c:228: }
	jp	_v_blank_screen_mode_1
;src/titles.c:230: static void t_draw_static_sprites(void) {
;	---------------------------------
; Function t_draw_static_sprites
; ---------------------------------
_t_draw_static_sprites:
;src/titles.c:233: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_CONTROLS_START, 192, 88);
	ld	hl, #0x0058
	push	hl
	ld	de, #0x00c0
	ld	l, #0x04
	call	_cpct_asicSetSpritePosition
;src/titles.c:234: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_CONTROLS_START + 1, 416, 88);
	ld	hl, #0x0058
	push	hl
	ld	de, #0x01a0
	ld	l, #0x05
	call	_cpct_asicSetSpritePosition
;src/titles.c:236: HW_SPRITE_TITLE_CONTROLS_START + 2, 276, 128);
	ld	hl, #0x0080
	push	hl
	ld	de, #0x0114
	ld	l, #0x06
	call	_cpct_asicSetSpritePosition
;src/titles.c:238: HW_SPRITE_TITLE_CONTROLS_START + 3, 276, 144);
	ld	hl, #0x0090
	push	hl
	ld	de, #0x0114
	ld	l, #0x07
	call	_cpct_asicSetSpritePosition
;src/titles.c:239: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0004
	call	_cpct_asicSetSpriteZoom
;src/titles.c:240: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 1, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0005
	call	_cpct_asicSetSpriteZoom
;src/titles.c:241: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 2, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0006
	call	_cpct_asicSetSpriteZoom
;src/titles.c:242: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 3, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0007
	call	_cpct_asicSetSpriteZoom
;src/titles.c:246: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START, x, y);
	ld	hl, #0x0080
	push	hl
	ld	de, #0x0134
	ld	l, #0x08
	call	_cpct_asicSetSpritePosition
;src/titles.c:247: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0008
	call	_cpct_asicSetSpriteZoom
;src/titles.c:249: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START + 1, x, y);
	ld	hl, #0x0080
	push	hl
	ld	de, #0x0154
	ld	l, #0x09
	call	_cpct_asicSetSpritePosition
;src/titles.c:250: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + 1, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x0009
	call	_cpct_asicSetSpriteZoom
;src/titles.c:252: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START + 2, x, y);
	ld	hl, #0x0080
	push	hl
	ld	de, #0x0174
	ld	l, #0x0a
	call	_cpct_asicSetSpritePosition
;src/titles.c:253: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + 2, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x000a
	call	_cpct_asicSetSpriteZoom
;src/titles.c:254: }
	ret
;src/titles.c:257: static void t_reset_timers(void) {
;	---------------------------------
; Function t_reset_timers
; ---------------------------------
_t_reset_timers:
;src/titles.c:259: t_int_idx = 0;
;src/titles.c:260: t_frame_c = 0;
	xor	a, a
	ld	(_t_int_idx+0), a
	ld	(_t_frame_c+0), a
;src/titles.c:261: }
	ret
;src/titles.c:263: static void t_draw_game_mode(void) {
;	---------------------------------
; Function t_draw_game_mode
; ---------------------------------
_t_draw_game_mode:
;src/titles.c:269: for (u8 i = 0; i < 4; i++)
	ld	c, #0x00
00110$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00101$
;src/titles.c:270: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_MODE_START + i, 0, 0);
	ld	e, c
	ld	d, #0x00
	ld	hl, #0x000b
	add	hl, de
	push	bc
	ld	de, #0x00
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/titles.c:269: for (u8 i = 0; i < 4; i++)
	inc	c
	jr	00110$
00101$:
;src/titles.c:274: if (g_game_mode == 0) {
	ld	a, (_g_game_mode+0)
	or	a, a
	jr	NZ, 00106$
;src/titles.c:276: x = 87 * 2;
	ld	de, #0x00ae
;src/titles.c:277: count = 4;
	ld	c, #0x04
	jr	00122$
00106$:
;src/titles.c:279: } else if (g_game_mode == 1) {
	ld	a, (_g_game_mode+0)
	dec	a
	jr	NZ, 00103$
;src/titles.c:281: x = 155 * 2;
	ld	de, #0x0136
;src/titles.c:282: count = 3;
	ld	c, #0x03
	jr	00122$
00103$:
;src/titles.c:286: x = 207 * 2;
	ld	de, #0x019e
;src/titles.c:287: count = 2;
	ld	c, #0x02
;src/titles.c:291: for (u8 i = 0; i < count; i++) {
00122$:
	ld	b, #0x00
00113$:
;src/titles.c:293: HW_SPRITE_TITLE_MODE_START + i, x, y);
	ld	a,b
	cp	a,c
	ret	NC
	ld	h, #0x00
	add	a, #0x0b
	ld	l, a
	jr	NC, 00163$
	inc	h
00163$:
	push	hl
	push	bc
	push	de
	ld	bc, #0x0069
	push	bc
	call	_cpct_asicSetSpritePosition
	pop	de
	pop	bc
	pop	hl
;src/titles.c:294: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_MODE_START + i, 2, 1);
	push	bc
	push	de
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	de
	pop	bc
;src/titles.c:295: x += 32;
	ld	hl, #0x0020
	add	hl, de
	ex	de, hl
;src/titles.c:291: for (u8 i = 0; i < count; i++) {
	inc	b
;src/titles.c:297: }
	jr	00113$
;src/titles.c:300: static void t_draw_bg(void) {
;	---------------------------------
; Function t_draw_bg
; ---------------------------------
_t_draw_bg:
;src/titles.c:302: if (HW_HAS_128K(g_hw))
	ld	a, (_g_hw)
	and	a, #0x03
	sub	a, #0x01
	jr	C, 00102$
;src/titles.c:303: d_gfx_decompress_to_screen(GFX_TITLE);
	ld	a, #0x03
	jp	_d_gfx_decompress_to_screen
00102$:
;src/titles.c:305: a_page_disconnect_safe();
	call	_a_page_disconnect_safe
;src/titles.c:306: d_load("TITLE   SCR", VIDEO_MEM_START);
	ld	de, #0xc000
	ld	hl, #___str_0
	call	_d_load
;src/titles.c:307: a_page_connect_safe();
;src/titles.c:309: }
	jp	_a_page_connect_safe
___str_0:
	.ascii "TITLE   SCR"
	.db 0x00
;src/titles.c:311: static void t_add_interrupt(void) {
;	---------------------------------
; Function t_add_interrupt
; ---------------------------------
_t_add_interrupt:
;src/titles.c:329: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/titles.c:331: cpct_asicSetLinesInterruptHandler(t_interrupt, lines, sizeof(lines));
	ld	hl, #0x000d
	push	hl
	ld	de, #_t_add_interrupt_lines_10000_302
	ld	hl, #_t_interrupt
	call	_cpct_asicSetLinesInterruptHandler
;src/titles.c:332: }
	ret
_t_add_interrupt_lines_10000_302:
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x12	; 18
	.db #0x18	; 24
	.db #0x1e	; 30
	.db #0x24	; 36
	.db #0x2a	; 42
	.db #0x32	; 50	'2'
	.db #0x50	; 80	'P'
	.db #0x78	; 120	'x'
	.db #0xa9	; 169
	.db #0xb8	; 184
;src/titles.c:334: static void t_remove_interrupt(void) {
;	---------------------------------
; Function t_remove_interrupt
; ---------------------------------
_t_remove_interrupt:
;src/titles.c:336: cpct_asicRemoveLinesInterruptHandler();
;src/titles.c:337: }
	jp	_cpct_asicRemoveLinesInterruptHandler
;src/titles.c:339: static void t_interrupt(u8 line) __z88dk_fastcall {
;	---------------------------------
; Function t_interrupt
; ---------------------------------
_t_interrupt:
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/titles.c:341: if (line < TITLES_RASTER_SLOPES) {
	ld	-1 (ix), l
	ld	a, l
	sub	a, #0x32
	jr	NC, 00136$
;src/titles.c:343: if (line == 0) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00102$
;src/titles.c:345: cpct_asicSetPalColour(0, t_pal_top[0]);
	ld	de, (#_t_pal_top + 0)
	ld	hl, #0x0000
	call	_cpct_asicSetPalColour
;src/titles.c:346: cpct_asicSetPalColour(1, t_pal_top[1]);
	ld	de, (#_t_pal_top + 2)
	ld	hl, #0x0001
	call	_cpct_asicSetPalColour
;src/titles.c:347: cpct_asicSetPalColour(2, t_pal_top[2]);
	ld	de, (#_t_pal_top + 4)
	ld	hl, #0x0002
	call	_cpct_asicSetPalColour
;src/titles.c:348: cpct_asicSetPalColour(3, t_pal_top[3]);
	ld	de, (#_t_pal_top + 6)
	ld	hl, #0x0003
	call	_cpct_asicSetPalColour
00102$:
;src/titles.c:352: u8 band = (line - TITLES_RASTER_ROLAND_START) >> 3;
	ld	l, -1 (ix)
	ld	bc, #0x300
00252$:
	sra	c
	rr	l
	djnz	00252$
;src/titles.c:355: cpct_asicSetPalColour(1, roland_band_colours[band]);
	ld	bc, #_roland_band_colours+0
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0001
	call	_cpct_asicSetPalColour
	jp	00138$
00136$:
;src/titles.c:357: } else if (line == TITLES_RASTER_SLOPES) {
	ld	a, -1 (ix)
	sub	a, #0x32
	jr	NZ, 00133$
;src/titles.c:360: t_update_slopes_cycle();
	call	_t_update_slopes_cycle
	jp	00138$
00133$:
;src/titles.c:361: } else if (line == TITLES_RASTER_TREES) {
	ld	a, -1 (ix)
	sub	a, #0x50
	jr	NZ, 00130$
;src/titles.c:364: cpct_asicSetPalette(t_pal_trees, 4);
	ld	de, #0x0004
	ld	hl, #_t_pal_trees
	call	_cpct_asicSetPalette
	jp	00138$
00130$:
;src/titles.c:365: } else if (line == TITLES_RASTER_DO_STUFF) {
	ld	a, -1 (ix)
	sub	a, #0x78
	jp	NZ, 00127$
;src/titles.c:368: if (t_int_idx == 0) {
	ld	a, (_t_int_idx+0)
	or	a, a
	jr	NZ, 00106$
;src/titles.c:369: if (++t_frame_c == FC_MAX)
	ld	iy, #_t_frame_c
	inc	0 (iy)
	ld	a, (_t_frame_c+0)
	sub	a, #0x32
	jr	NZ, 00106$
;src/titles.c:370: t_frame_c = 0;
	ld	0 (iy), #0x00
00106$:
;src/titles.c:374: cpct_PLY_AKG_Play();
	call	_cpct_PLY_AKG_Play
;src/titles.c:376: if (t_int_idx == 2)
	ld	a, (_t_int_idx+0)
	sub	a, #0x02
	jr	NZ, 00108$
;src/titles.c:377: cpct_scanKeyboard_if();
	call	_cpct_scanKeyboard_if
00108$:
;src/titles.c:379: if (t_int_idx == 4) {
	ld	a, (_t_int_idx+0)
	sub	a, #0x04
	jr	NZ, 00114$
;src/titles.c:381: if (++text_tick >= TITLES_TEXT_SPEED) {
	ld	iy, #_text_tick
	inc	0 (iy)
	ld	a, (_text_tick+0)
	sub	a, #0x02
	jr	C, 00114$
;src/titles.c:382: text_tick = 0;
	ld	0 (iy), #0x00
;src/titles.c:383: if (++text_phase >= TITLES_TEXT_COLOUR_COUNT)
	ld	iy, #_text_phase
	inc	0 (iy)
	ld	a, (_text_phase+0)
	sub	a, #0x08
	jr	C, 00114$
;src/titles.c:384: text_phase = 0;
	ld	0 (iy), #0x00
00114$:
;src/titles.c:388: if (t_int_idx == 5) {
	ld	a, (_t_int_idx+0)
	sub	a, #0x05
	jr	NZ, 00118$
;src/titles.c:390: if (++slopes_tick >= SLOPES_SPEED) {
	ld	iy, #_slopes_tick
	inc	0 (iy)
	ld	a, (_slopes_tick+0)
	sub	a, #0x02
	jr	C, 00118$
;src/titles.c:391: slopes_tick = 0;
	ld	0 (iy), #0x00
;src/titles.c:392: t_step_slopes_phase();
	call	_t_step_slopes_phase
00118$:
;src/titles.c:396: if (++t_int_idx == 6)
	ld	iy, #_t_int_idx
	inc	0 (iy)
	ld	a, (_t_int_idx+0)
	sub	a, #0x06
	jr	NZ, 00138$
;src/titles.c:397: t_int_idx = 0;
	ld	0 (iy), #0x00
	jr	00138$
00127$:
;src/titles.c:399: } else if (line == TITLES_RASTER_ICE) {
	ld	a, -1 (ix)
	sub	a, #0xa9
	jr	NZ, 00124$
;src/titles.c:402: cpct_asicSetPalette(t_pal_ice, 4);
	ld	de, #0x0004
	ld	hl, #_t_pal_ice
	call	_cpct_asicSetPalette
	jr	00138$
00124$:
;src/titles.c:403: } else if (line == TITLES_RASTER_TEXT) {
	ld	a, -1 (ix)
	sub	a, #0xb8
	jr	NZ, 00138$
;src/titles.c:406: u8 idx = text_phase;
	ld	a, (_text_phase)
	ld	c, a
;src/titles.c:407: cpct_asicSetPalColour(2, cpctm_asicColor(0, 0, 0));
	push	bc
	ld	de, #0x0000
	ld	hl, #0x0002
	call	_cpct_asicSetPalColour
	pop	bc
;src/titles.c:408: cpct_asicSetPalColour(1, text_col_top[idx]);
	xor	a, a
	ld	b, a
	sla	c
	rl	b
	ld	hl, #_text_col_top
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #0x0001
	call	_cpct_asicSetPalColour
	pop	bc
;src/titles.c:409: cpct_asicSetPalColour(3, text_col_bottom[idx]);
	ld	hl, #_text_col_bottom
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0003
	call	_cpct_asicSetPalColour
00138$:
;src/titles.c:411: }
	inc	sp
	pop	ix
	ret
;src/titles.c:413: static void t_update_slopes_cycle(void) {
;	---------------------------------
; Function t_update_slopes_cycle
; ---------------------------------
_t_update_slopes_cycle:
;src/titles.c:416: u8 idx_bottom = slopes_phase;
	ld	a, (_slopes_phase)
	ld	l, a
;src/titles.c:419: u8 idx_top = slopes_phase + 1;
	ld	a, (_slopes_phase)
;src/titles.c:420: if (idx_top >= SLOPES_RAMP_COUNT)
	inc	a
	ld	e, a
	sub	a, #0x08
	jr	C, 00102$
;src/titles.c:421: idx_top = SLOPES_RAMP_COUNT - 1;
	ld	e, #0x07
00102$:
;src/titles.c:423: cpct_asicSetPalColour(1, t_slopes_ramp[idx_bottom]);
	ld	bc, #_t_slopes_ramp+0
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	push	de
	ld	e, a
	ld	hl, #0x0001
	call	_cpct_asicSetPalColour
	pop	de
	pop	bc
;src/titles.c:424: cpct_asicSetPalColour(3, t_slopes_ramp[idx_top]);
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0003
;src/titles.c:425: }
	jp	_cpct_asicSetPalColour
;src/titles.c:427: static void t_step_slopes_phase(void) {
;	---------------------------------
; Function t_step_slopes_phase
; ---------------------------------
_t_step_slopes_phase:
;src/titles.c:429: slopes_phase += slopes_dir;
	ld	a, (_slopes_phase)
	ld	hl, #_slopes_dir
	add	a, (hl)
;src/titles.c:431: if (slopes_phase == SLOPES_RAMP_COUNT - 2)
	ld	(_slopes_phase+0), a
	sub	a, #0x06
	jr	NZ, 00104$
;src/titles.c:432: slopes_dir = -1;
	ld	hl, #_slopes_dir
	ld	(hl), #0xff
	ret
00104$:
;src/titles.c:433: else if (slopes_phase == 0)
	ld	a, (_slopes_phase+0)
	or	a, a
	ret	NZ
;src/titles.c:434: slopes_dir = 1;
	ld	hl, #_slopes_dir
	ld	(hl), #0x01
;src/titles.c:435: }
	ret
;src/titles.c:437: static void t_ani_roland_l(u8 y, u8 speed) {
;	---------------------------------
; Function t_ani_roland_l
; ---------------------------------
_t_ani_roland_l:
	ld	h, a
;src/titles.c:439: t_load_roland_from_cache(false);
	push	hl
	xor	a, a
	call	_t_load_roland_from_cache
	pop	hl
;src/titles.c:441: t_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y,
	xor	a, a
	ld	de, #_v_set_title_roland_sprite_pos
	push	de
	push	hl
	inc	sp
	ld	h, a
	push	hl
	ld	de, #0x0280
	ld	hl, #0xff00
	call	_t_scroll_sprite_h
;src/titles.c:443: }
	ret
;src/titles.c:445: static void t_ani_roland_r(u8 y, u8 speed) {
;	---------------------------------
; Function t_ani_roland_r
; ---------------------------------
_t_ani_roland_r:
	ld	h, a
;src/titles.c:447: t_load_roland_from_cache(true);
	push	hl
	ld	a, #0x01
	call	_t_load_roland_from_cache
	pop	hl
;src/titles.c:449: t_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y,
	ld	a, l
	ld	b, #0x00
	neg
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	de, #_v_set_title_roland_sprite_pos
	push	de
	push	hl
	inc	sp
	ld	b, a
	push	bc
	ld	de, #0xff00
	ld	hl, #0x0280
	call	_t_scroll_sprite_h
;src/titles.c:451: }
	ret
;src/titles.c:453: static void t_scroll_sprite_h(
;	---------------------------------
; Function t_scroll_sprite_h
; ---------------------------------
_t_scroll_sprite_h:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	c, l
	ld	b, h
	ld	-2 (ix), e
	ld	-1 (ix), d
;src/titles.c:456: for (i16 x = start_x; (step > 0) ? (x <= end_x) : (x >= end_x);
	xor	a, a
	cp	a, 4 (ix)
	sbc	a, 5 (ix)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	rlca
	and	a,#0x01
	ld	-3 (ix), a
00103$:
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00107$
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jp	PO, 00131$
	xor	a, #0x80
00131$:
	rlca
	and	a,#0x01
	xor	a, #0x01
	jr	00108$
00107$:
	ld	a, c
	sub	a, -2 (ix)
	ld	a, b
	sbc	a, -1 (ix)
	jp	PO, 00132$
	xor	a, #0x80
00132$:
	rlca
	and	a,#0x01
	xor	a, #0x01
00108$:
	or	a, a
	jr	Z, 00105$
;src/titles.c:459: pos_fn(x, y, t_roland_right);
	ld	e, 6 (ix)
	ld	d, #0x00
	push	bc
	ld	a, (_t_roland_right)
	push	af
	inc	sp
	ld	l, c
	ld	h, b
	push	iy
	ex	(sp), hl
	ld	l, 7 (ix)
	ex	(sp), hl
	ex	(sp), hl
	ld	h, 8 (ix)
	ex	(sp), hl
	pop	iy
	call	___sdcc_call_iy
;src/titles.c:461: t_poll_title_input();
	call	_t_poll_title_input
;src/titles.c:462: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	pop	bc
;src/titles.c:457: x += step) {
	ld	a, c
	add	a, 4 (ix)
	ld	c, a
	ld	a, b
	adc	a, 5 (ix)
	ld	b, a
	jr	00103$
00105$:
;src/titles.c:464: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	inc	sp
	jp	(hl)
;src/titles.c:466: static void t_load_roland_from_cache(bool right) {
;	---------------------------------
; Function t_load_roland_from_cache
; ---------------------------------
_t_load_roland_from_cache:
	ld	c, a
;src/titles.c:468: sprite_bank_id_t bank = right ? SPR_BANK_ROLAND_R : SPR_BANK_ROLAND_L;
	bit	0, c
	jr	Z, 00107$
	ld	b, #0x01
	jr	00108$
00107$:
	ld	b, #0x00
00108$:
;src/titles.c:470: for (u8 i = 0; i < 4; i++) {
	ld	d, #0x00
00103$:
	ld	a, d
	sub	a, #0x04
	jr	NC, 00101$
;src/titles.c:471: cpct_waitVSYNC();
	push	bc
	push	de
	call	_cpct_waitVSYNC
	pop	de
	pop	bc
;src/titles.c:472: c_sprite_cache_bank_upload(bank, i, ASIC_SPR_ROLAND_START + i);
	push	bc
	push	de
	push	de
	inc	sp
	ld	l, d
	ld	a, b
	call	_c_sprite_cache_bank_upload
	pop	de
	pop	bc
;src/titles.c:473: cpct_asicSetSpriteZoom(ASIC_SPR_ROLAND_START + i, 2, 1);
	ld	l, d
	ld	h, #0x00
	push	bc
	push	de
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	de
	pop	bc
;src/titles.c:470: for (u8 i = 0; i < 4; i++) {
	inc	d
	jr	00103$
00101$:
;src/titles.c:476: t_roland_right = right;
	ld	hl, #_t_roland_right
	ld	(hl), c
;src/titles.c:477: }
	ret
;src/titles.c:479: static void t_init_roland_slots(u8 y) {
;	---------------------------------
; Function t_init_roland_slots
; ---------------------------------
_t_init_roland_slots:
	call	___sdcc_enter_ix
	dec	sp
	ld	-1 (ix), a
;src/titles.c:483: for (u8 i = 0; i < 4; i++) {
	ld	de, #0xff00
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00105$
;src/titles.c:484: cpct_asicSetSpritePosition(ASIC_SPR_ROLAND_START + i, x, y);
	ld	b, -1 (ix)
	xor	a, a
	ld	l, c
	ld	h, #0x00
	push	hl
	push	bc
	push	de
	push	hl
	ld	l, b
	ld	h, a
	ex	(sp), hl
	call	_cpct_asicSetSpritePosition
	pop	de
	pop	bc
	pop	hl
;src/titles.c:485: cpct_asicSetSpriteZoom(ASIC_SPR_ROLAND_START + i, 2, 1);
	push	bc
	push	de
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	de
	pop	bc
;src/titles.c:486: x += SPRITE_WIDTH_ZOOM;
	inc	d
;src/titles.c:483: for (u8 i = 0; i < 4; i++) {
	inc	c
	jr	00103$
00105$:
;src/titles.c:488: }
	inc	sp
	pop	ix
	ret
;src/titles.c:490: static void t_load_static_title_sprites(void) {
;	---------------------------------
; Function t_load_static_title_sprites
; ---------------------------------
_t_load_static_title_sprites:
;src/titles.c:493: for (u8 i = 0; i < 4; i++) {
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00101$
;src/titles.c:496: titles_sprites_data, false);
	ld	de, #_titles_sprites_data
;src/titles.c:495: a_load_hw_sprite(HW_SPRITE_TITLE_CONTROLS_START + i, 4 + i,
	ld	a, c
	add	a, #0x04
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	push	de
	ld	l, a
	call	_a_load_hw_sprite
	pop	bc
;src/titles.c:499: HW_SPRITE_TITLE_CONTROLS_START + i, 2, 1);
	ld	e, c
	ld	d, #0x00
	ld	hl, #0x0004
	add	hl, de
	push	bc
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/titles.c:493: for (u8 i = 0; i < 4; i++) {
	inc	c
	jr	00104$
00101$:
;src/titles.c:503: for (u8 i = 0; i < 3; i++) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;src/titles.c:505: titles_sprites_data, false);
	ld	de, #_titles_sprites_data
;src/titles.c:504: a_load_hw_sprite(HW_SPRITE_TITLE_PLAY_START + i, 8 + i,
	ld	a, c
	add	a, #0x08
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	push	de
	ld	l, a
	call	_a_load_hw_sprite
	pop	bc
;src/titles.c:506: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + i, 2, 1);
	ld	e, c
	ld	d, #0x00
	ld	hl, #0x0008
	add	hl, de
	push	bc
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/titles.c:503: for (u8 i = 0; i < 3; i++) {
	inc	c
;src/titles.c:508: }
	jr	00107$
;src/titles.c:510: static void t_load_game_mode_word(void) {
;	---------------------------------
; Function t_load_game_mode_word
; ---------------------------------
_t_load_game_mode_word:
	call	___sdcc_enter_ix
	dec	sp
;src/titles.c:515: if (g_game_mode == 0) {
	ld	a, (_g_game_mode+0)
	or	a, a
	jr	NZ, 00105$
;src/titles.c:516: bank = SPR_BANK_MODE_CLASSIC;
	ld	-1 (ix), #0x02
;src/titles.c:517: count = 4;
	ld	c, #0x04
	jr	00106$
00105$:
;src/titles.c:518: } else if (g_game_mode == 1) {
	ld	a, (_g_game_mode+0)
	dec	a
	jr	NZ, 00102$
;src/titles.c:519: bank = SPR_BANK_MODE_MANIA;
	ld	-1 (ix), #0x03
;src/titles.c:520: count = 3;
	ld	c, #0x03
	jr	00106$
00102$:
;src/titles.c:522: bank = SPR_BANK_MODE_ZEN;
	ld	-1 (ix), #0x04
;src/titles.c:523: count = 2;
	ld	c, #0x02
00106$:
;src/titles.c:527: a_hide_sprite_range(ASIC_SPR_MODE_START, 4);
	push	bc
	ld	l, #0x04
	ld	a, #0x0b
	call	_a_hide_sprite_range
	pop	bc
;src/titles.c:530: for (u8 i = 0; i < count; i++) {
	ld	b, #0x00
00109$:
	ld	a, b
	sub	a, c
	jr	NC, 00111$
;src/titles.c:531: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
	pop	bc
;src/titles.c:532: c_sprite_cache_bank_upload(bank, i, ASIC_SPR_MODE_START + i);
	ld	a, b
	add	a, #0x0b
	push	bc
	push	af
	inc	sp
	ld	l, b
	ld	a, -1 (ix)
	call	_c_sprite_cache_bank_upload
	pop	bc
;src/titles.c:533: cpct_asicSetSpriteZoom(ASIC_SPR_MODE_START + i, 2, 1);
	ld	e, b
	ld	d, #0x00
	ld	hl, #0x000b
	add	hl, de
	push	bc
	ld	de, #0x102
	push	de
	call	_cpct_asicSetSpriteZoom
	pop	bc
;src/titles.c:530: for (u8 i = 0; i < count; i++) {
	inc	b
	jr	00109$
00111$:
;src/titles.c:535: }
	inc	sp
	pop	ix
	ret
;src/titles.c:537: static void t_change_game_mode(i8 delta) {
;	---------------------------------
; Function t_change_game_mode
; ---------------------------------
_t_change_game_mode:
	ld	c, a
;src/titles.c:539: i8 mode = (i8)g_game_mode + delta;
	ld	a, (_g_game_mode)
	add	a, c
	ld	c, a
;src/titles.c:541: if (mode < 0)
	bit	7, c
	jr	Z, 00104$
;src/titles.c:542: mode = 2;
	ld	c, #0x02
	jr	00105$
00104$:
;src/titles.c:543: else if (mode > 2)
	ld	a, #0x02
	sub	a, c
	jp	PO, 00131$
	xor	a, #0x80
00131$:
	jp	P, 00105$
;src/titles.c:544: mode = 0;
	ld	c, #0x00
00105$:
;src/titles.c:546: if ((u8)mode == g_game_mode)
	ld	a, (_g_game_mode+0)
	sub	a, c
	ret	Z
;src/titles.c:547: return;
;src/titles.c:549: g_game_mode = (u8)mode;
	ld	hl, #_g_game_mode
	ld	(hl), c
;src/titles.c:552: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/titles.c:553: t_load_game_mode_word();
	call	_t_load_game_mode_word
;src/titles.c:554: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/titles.c:555: t_draw_game_mode();
	call	_t_draw_game_mode
;src/titles.c:556: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/titles.c:559: cpct_asicSetBorder(cpctm_asicColor(15, g_game_mode, g_game_mode));
	ld	a, (_g_game_mode)
	and	a, #0x0f
	ld	h, a
	ld	l, #0xf0
	or	a, l
	ld	l, a
	call	_cpct_asicSetBorder
;src/titles.c:560: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
	ld	hl, #0x0fff
;src/titles.c:561: }
	jp	_cpct_asicSetBorder
;src/titles.c:563: static title_input_t t_poll_title_input(void) {
;	---------------------------------
; Function t_poll_title_input
; ---------------------------------
_t_poll_title_input:
;src/titles.c:568: bool left_down = cpct_isKeyPressed(Key_CursorLeft);
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	xor	a, a
	cp	a, l
	rla
	ld	e, a
;src/titles.c:569: bool right_down = cpct_isKeyPressed(Key_CursorRight);
	push	de
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	pop	de
	xor	a, a
	cp	a, l
	rla
	ld	b, a
;src/titles.c:571: title_input_t result = TITLE_INPUT_NONE;
	ld	c, #0x00
;src/titles.c:573: if (left_down && !left_was_down)
	bit	0, e
	jr	Z, 00105$
	ld	hl, #_t_poll_title_input_left_was_down_10000_356
	bit	0, (hl)
	jr	NZ, 00105$
;src/titles.c:574: result = TITLE_INPUT_LEFT;
	ld	c, #0xff
	jr	00106$
00105$:
;src/titles.c:575: else if (right_down && !right_was_down)
	bit	0, b
	jr	Z, 00106$
	ld	hl, #_t_poll_title_input_right_was_down_10000_356
	bit	0, (hl)
	jr	NZ, 00106$
;src/titles.c:576: result = TITLE_INPUT_RIGHT;
	ld	c, #0x01
00106$:
;src/titles.c:578: left_was_down = left_down;
	ld	hl, #_t_poll_title_input_left_was_down_10000_356
	ld	(hl), e
;src/titles.c:579: right_was_down = right_down;
	ld	hl, #_t_poll_title_input_right_was_down_10000_356
	ld	(hl), b
;src/titles.c:581: return result;
	ld	a, c
;src/titles.c:582: }
	ret
;src/titles.c:584: static void t_start_roland_scroll(bool right, u8 y, i8 speed) {
;	---------------------------------
; Function t_start_roland_scroll
; ---------------------------------
_t_start_roland_scroll:
	ld	c, a
	ld	a, l
	ld	(#_t_roland_y), a
;src/titles.c:586: t_roland_right = right;
	ld	hl, #_t_roland_right
	ld	(hl), c
;src/titles.c:589: if (right) {
	bit	0, c
	jr	Z, 00102$
;src/titles.c:590: t_roland_start_x = SCREEN_WIDTH_M2;
	ld	hl, #0x0280
	ld	(_t_roland_start_x), hl
;src/titles.c:591: t_roland_end_x = -SPRITE_WIDTH_ZOOM;
	ld	hl, #0xff00
	ld	(_t_roland_end_x), hl
;src/titles.c:592: t_roland_step = -speed;
	ld	hl, #2
	add	hl, sp
	ld	iy, #_t_roland_step
	xor	a, a
	sub	a, (hl)
	ld	0 (iy), a
	jr	00103$
00102$:
;src/titles.c:594: t_roland_start_x = -SPRITE_WIDTH_ZOOM;
	ld	hl, #0xff00
	ld	(_t_roland_start_x), hl
;src/titles.c:595: t_roland_end_x = SCREEN_WIDTH_M2;
	ld	hl, #0x0280
	ld	(_t_roland_end_x), hl
;src/titles.c:596: t_roland_step = speed;
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	ld	(_t_roland_step+0), a
00103$:
;src/titles.c:599: t_roland_x = t_roland_start_x;
	ld	hl, (_t_roland_start_x)
	ld	(_t_roland_x), hl
;src/titles.c:600: t_roland_active = true;
	ld	hl, #_t_roland_active
	ld	(hl), #0x01
;src/titles.c:602: t_load_roland_from_cache(right);
	ld	a, c
	call	_t_load_roland_from_cache
;src/titles.c:603: }
	pop	hl
	inc	sp
	jp	(hl)
;src/titles.c:605: static void t_update_roland(void) {
;	---------------------------------
; Function t_update_roland
; ---------------------------------
_t_update_roland:
;src/titles.c:607: if (!t_roland_active)
	ld	hl, #_t_roland_active
	bit	0, (hl)
;src/titles.c:608: return;
	ret	Z
;src/titles.c:610: v_set_title_roland_sprite_pos(t_roland_x, t_roland_y, t_roland_right);
	ld	a, (_t_roland_y)
	ld	e, a
	ld	d, #0x00
	ld	a, (_t_roland_right)
	push	af
	inc	sp
	ld	hl, (_t_roland_x)
	call	_v_set_title_roland_sprite_pos
;src/titles.c:612: t_roland_x += t_roland_step;
	ld	a, (_t_roland_step)
	ld	c, a
	rlca
	sbc	a, a
	ld	e, a
	ld	a, c
	ld	hl, #_t_roland_x
	add	a, (hl)
	ld	(hl), a
	inc	hl
	ld	a, e
	adc	a, (hl)
	ld	(hl), a
;src/titles.c:614: if ((t_roland_step > 0 && t_roland_x > t_roland_end_x) ||
	xor	a, a
	ld	hl, #_t_roland_step
	sub	a, (hl)
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	rlca
	and	a,#0x01
	ld	c, a
	or	a, a
	jr	Z, 00107$
	ld	hl, #_t_roland_end_x
	ld	a, (hl)
	ld	iy, #_t_roland_x
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	jp	PO, 00141$
	xor	a, #0x80
00141$:
	jp	M, 00103$
00107$:
;src/titles.c:615: (t_roland_step < 0 && t_roland_x < t_roland_end_x)) {
	ld	a, (_t_roland_step+0)
	bit	7, a
	ret	Z
	ld	hl, #_t_roland_end_x
	ld	a, (_t_roland_x+0)
	sub	a, (hl)
	inc	hl
	ld	a, (_t_roland_x+1)
	sbc	a, (hl)
	jp	PO, 00142$
	xor	a, #0x80
00142$:
	ret	P
00103$:
;src/titles.c:617: t_roland_active = false;
	xor	a, a
	ld	(_t_roland_active+0), a
;src/titles.c:621: (t_roland_step > 0) ? t_roland_step : -t_roland_step);
	ld	a, c
	or	a, a
	jr	Z, 00110$
	ld	a, (_t_roland_step)
	ld	b, a
	jr	00111$
00110$:
	ld	hl, #_t_roland_step
	xor	a, a
	sub	a, (hl)
	ld	b, a
00111$:
;src/titles.c:620: t_start_roland_scroll(!t_roland_right, t_roland_y,
	ld	a, (_t_roland_right+0)
	xor	a, #0x01
	ld	c, a
	push	bc
	inc	sp
	ld	a, (_t_roland_y)
	ld	l, a
	ld	a, c
	call	_t_start_roland_scroll
;src/titles.c:623: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__g_game_mode:
	.db #0x00	; 0
__xinit__t_int_idx:
	.db #0x00	; 0
__xinit__t_frame_c:
	.db #0x00	; 0
__xinit__text_phase:
	.db #0x00	; 0
__xinit__text_tick:
	.db #0x00	; 0
__xinit__slopes_phase:
	.db #0x00	; 0
__xinit__slopes_dir:
	.db #0x01	;  1
__xinit__slopes_tick:
	.db #0x00	; 0
__xinit__t_roland_right:
	.db #0x00	;  0
__xinit__t_mode_cooldown:
	.db #0x00	; 0
	.area _CABS (ABS)
