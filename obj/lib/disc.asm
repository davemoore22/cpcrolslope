;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module disc
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _asm_fdc_on
	.globl _asm_fdc_off
	.globl _asm_load_file
	.globl _a_page_disconnect_safe
	.globl _a_page_connect_safe
	.globl _cpct_zx7b_decrunch_s
	.globl _cpct_pageMemory
	.globl _d_disk_table
	.globl _d_gfx_resources
	.globl _d_load
	.globl _d_gfx_resource_end
	.globl _d_gfx_resource_start
	.globl _d_gfx_decompress_to_screen
	.globl _d_load_gfx_to_extended_memory
	.globl _d_load_music
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_d_disk_table	=	0x8200
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
;src/lib/disc.c:43: void d_load(char file_name[12], u8 *loc) {
;	---------------------------------
; Function d_load
; ---------------------------------
_d_load::
;src/lib/disc.c:45: asm_fdc_on();
	push	hl
	push	de
	call	_asm_fdc_on
	pop	de
	pop	bc
;src/lib/disc.c:46: asm_load_file(file_name, loc, d_disk_table);
	ld	hl, #_d_disk_table
	push	hl
	ld	l, c
	ld	h, b
	call	_asm_load_file
;src/lib/disc.c:47: asm_fdc_off();
;src/lib/disc.c:48: }
	jp	_asm_fdc_off
	.area _CODE
	.area _CODE
_d_gfx_resources:
	.dw #0x0000
	.dw #0x03c3
	.dw #0x03c3
	.dw #0x07ca
	.dw #0x0b8d
	.dw #0x1085
	.dw #0x1c12
	.dw #0x179b
	.area _CODE
	.area _CODE
;src/lib/disc.c:50: const u8 *d_gfx_resource_end(gfx_id_t id) {
;	---------------------------------
; Function d_gfx_resource_end
; ---------------------------------
_d_gfx_resource_end::
	ld	l, a
;src/lib/disc.c:52: return GFX_BANK_BASE + d_gfx_resources[id].offset +
	ld	bc, #_d_gfx_resources+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x4001
	add	hl, bc
	ld	c, l
	ld	b, h
;src/lib/disc.c:53: d_gfx_resources[id].size - 1;
	ex	de, hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ex	de, hl
	dec	de
;src/lib/disc.c:54: }
	ret
;src/lib/disc.c:56: const u8 *d_gfx_resource_start(gfx_id_t id) {
;	---------------------------------
; Function d_gfx_resource_start
; ---------------------------------
_d_gfx_resource_start::
	ld	l, a
;src/lib/disc.c:58: return GFX_BANK_BASE + d_gfx_resources[id].offset;
	ld	bc, #_d_gfx_resources+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x4001
	add	hl, bc
	ex	de, hl
;src/lib/disc.c:59: }
	ret
;src/lib/disc.c:61: void d_gfx_decompress_to_screen(gfx_id_t id) {
;	---------------------------------
; Function d_gfx_decompress_to_screen
; ---------------------------------
_d_gfx_decompress_to_screen::
;src/lib/disc.c:63: const u8 *end = d_gfx_resource_end(id);
	call	_d_gfx_resource_end
;src/lib/disc.c:65: a_page_disconnect_safe();
	push	de
	call	_a_page_disconnect_safe
;src/lib/disc.c:66: cpct_pageMemory(RAMCFG_7 | BANK_0);
	ld	l, #0x07
	call	_cpct_pageMemory
	pop	de
;src/lib/disc.c:67: cpct_zx7b_decrunch_s(VIDEO_MEM_END, end);
	ld	hl, #0xffff
	call	_cpct_zx7b_decrunch_s
;src/lib/disc.c:68: cpct_pageMemory(RAMCFG_0 | BANK_0);
	ld	l, #0x00
	call	_cpct_pageMemory
;src/lib/disc.c:69: a_page_connect_safe();
;src/lib/disc.c:70: }
	jp	_a_page_connect_safe
;src/lib/disc.c:72: void d_load_gfx_to_extended_memory(void) {
;	---------------------------------
; Function d_load_gfx_to_extended_memory
; ---------------------------------
_d_load_gfx_to_extended_memory::
;src/lib/disc.c:74: a_page_disconnect_safe();
	call	_a_page_disconnect_safe
;src/lib/disc.c:75: cpct_pageMemory(RAMCFG_7 | BANK_0);
	ld	l, #0x07
	call	_cpct_pageMemory
;src/lib/disc.c:77: d_load("PRESENTSBIN", d_gfx_resource_start(GFX_PRESENTS));
	xor	a, a
	call	_d_gfx_resource_start
	ld	hl, #___str_0
	call	_d_load
;src/lib/disc.c:78: d_load("MADEWITHBIN", d_gfx_resource_start(GFX_MADEWIDTH));
	ld	a, #0x01
	call	_d_gfx_resource_start
	ld	hl, #___str_1
	call	_d_load
;src/lib/disc.c:79: d_load("INTRO   BIN", d_gfx_resource_start(GFX_INTRO));
	ld	a, #0x02
	call	_d_gfx_resource_start
	ld	hl, #___str_2
	call	_d_load
;src/lib/disc.c:80: d_load("TITLE   BIN", d_gfx_resource_start(GFX_TITLE));
	ld	a, #0x03
	call	_d_gfx_resource_start
	ld	hl, #___str_3
	call	_d_load
;src/lib/disc.c:82: cpct_pageMemory(RAMCFG_0 | BANK_0);
	ld	l, #0x00
	call	_cpct_pageMemory
;src/lib/disc.c:83: a_page_connect_safe();
;src/lib/disc.c:84: }
	jp	_a_page_connect_safe
	.area _CODE
	.area _CODE
___str_0:
	.ascii "PRESENTSBIN"
	.db 0x00
	.area _CODE
	.area _CODE
___str_1:
	.ascii "MADEWITHBIN"
	.db 0x00
	.area _CODE
	.area _CODE
___str_2:
	.ascii "INTRO   BIN"
	.db 0x00
	.area _CODE
	.area _CODE
___str_3:
	.ascii "TITLE   BIN"
	.db 0x00
	.area _CODE
	.area _CODE
;src/lib/disc.c:86: void d_load_music(void) {
;	---------------------------------
; Function d_load_music
; ---------------------------------
_d_load_music::
;src/lib/disc.c:88: a_page_disconnect_safe();
	call	_a_page_disconnect_safe
;src/lib/disc.c:89: d_load("MUSIC   BIN", MUSIC_LOC);
	ld	de, #0xb000
	ld	hl, #___str_4
	call	_d_load
;src/lib/disc.c:90: a_page_connect_safe();
;src/lib/disc.c:91: }
	jp	_a_page_connect_safe
	.area _CODE
	.area _CODE
___str_4:
	.ascii "MUSIC   BIN"
	.db 0x00
	.area _CODE
	.area _CODE
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
