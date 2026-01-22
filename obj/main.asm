;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module main
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _t_stop
	.globl _t_do
	.globl _t_start
	.globl _p_stop
	.globl _p_start
	.globl _m_stop
	.globl _m_start
	.globl _i_stop
	.globl _i_start
	.globl _v_blank_screen_no_asic
	.globl _h_get_details
	.globl _d_load_music
	.globl _d_load_gfx_to_extended_memory
	.globl _c_sprite_cache_bank_init
	.globl _a_page_connect_safe
	.globl _cpct_asicUnlock
	.globl _cpct_asicSetPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawSprite
	.globl _cpct_pageMemory
	.globl _cpct_setStackLocation
	.globl _cpct_removeInterruptHandler
	.globl _cpct_disableFirmware
	.globl _g_skip
	.globl _g_hw
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_hw::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_skip::
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
;src/main.c:35: cpctm_createTransparentMaskTable(v_mask_table, MASK_TABLE_LOC, M1, 0);
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M1_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M1_container::
	.area _v_mask_table_ (ABS) 
	.org 0x8000 
_v_mask_table::
	.db 0xFF, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88 
	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
	.db 0xEE, 0xEE, 0xCC, 0xCC, 0xAA, 0xAA, 0x88, 0x88 
	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
	.db 0xDD, 0xCC, 0xDD, 0xCC, 0x99, 0x88, 0x99, 0x88 
	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
	.db 0xCC, 0xCC, 0xCC, 0xCC, 0x88, 0x88, 0x88, 0x88 
	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
	.db 0xBB, 0xAA, 0x99, 0x88, 0xBB, 0xAA, 0x99, 0x88 
	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
	.db 0xAA, 0xAA, 0x88, 0x88, 0xAA, 0xAA, 0x88, 0x88 
	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
	.db 0x99, 0x88, 0x99, 0x88, 0x99, 0x88, 0x99, 0x88 
	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
	.db 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.area _CSEG (REL, CON) 
;src/main.c:37: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:39: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:40: cpct_pageMemory(RAMCFG_0 | BANK_0);
	ld	l, #0x00
	call	_cpct_pageMemory
;src/main.c:42: v_blank_screen_no_asic();
	call	_v_blank_screen_no_asic
;src/main.c:43: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:45: cpct_setStackLocation(STACK_LOC);
	ld	hl, #0x00ff
	call	_cpct_setStackLocation
;src/main.c:46: cpct_removeInterruptHandler();
	call	_cpct_removeInterruptHandler
;src/main.c:48: g_hw = h_get_details();
	call	_h_get_details
	ld	(_g_hw+0), a
;src/main.c:50: if (HW_IS_PLUS(g_hw) && HW_HAS_128K(g_hw)) {
	ld	a, (_g_hw)
	bit	2, a
	jr	Z, 00109$
	and	a, #0x03
	sub	a, #0x01
	jr	C, 00109$
;src/main.c:52: cpct_asicUnlock();
	call	_cpct_asicUnlock
;src/main.c:53: a_page_connect_safe();
	call	_a_page_connect_safe
;src/main.c:55: while (1) {
00106$:
;src/main.c:58: cpct_drawSprite(img_loading_data, v_pos, 25, 13);
	ld	hl, #0xd19
	push	hl
	ld	de, #0xf38b
	ld	hl, #_img_loading_data
	call	_cpct_drawSprite
;src/main.c:59: cpct_asicSetPalette(m_load_pal, 4);
	ld	de, #0x0004
	ld	hl, #_m_load_pal
	call	_cpct_asicSetPalette
;src/main.c:61: d_load_gfx_to_extended_memory();
	call	_d_load_gfx_to_extended_memory
;src/main.c:62: c_sprite_cache_bank_init();
	call	_c_sprite_cache_bank_init
;src/main.c:63: d_load_music();
	call	_d_load_music
;src/main.c:69: p_start();
	call	_p_start
;src/main.c:70: p_stop();
	call	_p_stop
;src/main.c:72: if (!g_skip) {
	ld	hl, #_g_skip
	bit	0, (hl)
	jr	NZ, 00102$
;src/main.c:73: m_start();
	call	_m_start
;src/main.c:74: m_stop();
	call	_m_stop
00102$:
;src/main.c:77: if (!g_skip) {
	ld	hl, #_g_skip
	bit	0, (hl)
	jr	NZ, 00104$
;src/main.c:78: i_start();
	call	_i_start
;src/main.c:79: i_stop();
	call	_i_stop
00104$:
;src/main.c:82: t_start();
	call	_t_start
;src/main.c:83: t_do();
	call	_t_do
;src/main.c:84: t_stop();
	call	_t_stop
	jr	00106$
00109$:
;src/main.c:88: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:89: v_blank_screen_no_asic();
;src/main.c:91: }
	jp	_v_blank_screen_no_asic
_m_load_pal:
	.dw #0x0000
	.dw #0x01f1
	.dw #0x06f0
	.dw #0x0ff0
	.area _CODE
	.area _INITIALIZER
__xinit__g_skip:
	.db #0x00	;  0
	.area _CABS (ABS)
