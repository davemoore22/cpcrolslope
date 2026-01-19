                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module disc
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _asm_fdc_on
                                     12 	.globl _asm_fdc_off
                                     13 	.globl _asm_load_file
                                     14 	.globl _a_page_disconnect_safe
                                     15 	.globl _a_page_connect_safe
                                     16 	.globl _cpct_zx7b_decrunch_s
                                     17 	.globl _cpct_pageMemory
                                     18 	.globl _d_disk_table
                                     19 	.globl _d_gfx_resources
                                     20 	.globl _d_load
                                     21 	.globl _d_gfx_resource_end
                                     22 	.globl _d_gfx_resource_start
                                     23 	.globl _d_gfx_decompress_to_screen
                                     24 	.globl _d_load_gfx_to_extended_memory
                                     25 	.globl _d_load_music
                                     26 ;--------------------------------------------------------
                                     27 ; special function registers
                                     28 ;--------------------------------------------------------
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area _DATA
                         00008200    33 _d_disk_table	=	0x8200
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area _INITIALIZED
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area _DABS (ABS)
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area _HOME
                                     46 	.area _GSINIT
                                     47 	.area _GSFINAL
                                     48 	.area _GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area _HOME
                                     53 	.area _HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area _CODE
                                     58 ;src/lib/disc.c:43: void d_load(char file_name[12], u8 *loc) {
                                     59 ;	---------------------------------
                                     60 ; Function d_load
                                     61 ; ---------------------------------
    0000147C                         62 _d_load::
                                     63 ;src/lib/disc.c:45: asm_fdc_on();
    0000147C E5               [11]   64 	push	hl
    0000147D D5               [11]   65 	push	de
    0000147E CD FA 1B         [17]   66 	call	_asm_fdc_on
    00001481 D1               [10]   67 	pop	de
    00001482 C1               [10]   68 	pop	bc
                                     69 ;src/lib/disc.c:46: asm_load_file(file_name, loc, d_disk_table);
    00001483 21 00 82         [10]   70 	ld	hl, #_d_disk_table
    00001486 E5               [11]   71 	push	hl
    00001487 69               [ 4]   72 	ld	l, c
    00001488 60               [ 4]   73 	ld	h, b
    00001489 CD B7 1B         [17]   74 	call	_asm_load_file
                                     75 ;src/lib/disc.c:47: asm_fdc_off();
                                     76 ;src/lib/disc.c:48: }
    0000148C C3 16 1C         [10]   77 	jp	_asm_fdc_off
                                     78 	.area _CODE
                                     79 	.area _CODE
    0000148F                         80 _d_gfx_resources:
    0000148F 00 00                   81 	.dw #0x0000
    00001491 C3 03                   82 	.dw #0x03c3
    00001493 C3 03                   83 	.dw #0x03c3
    00001495 CA 07                   84 	.dw #0x07ca
    00001497 8D 0B                   85 	.dw #0x0b8d
    00001499 85 10                   86 	.dw #0x1085
    0000149B 12 1C                   87 	.dw #0x1c12
    0000149D 9B 17                   88 	.dw #0x179b
                                     89 	.area _CODE
                                     90 	.area _CODE
                                     91 ;src/lib/disc.c:50: const u8 *d_gfx_resource_end(gfx_id_t id) {
                                     92 ;	---------------------------------
                                     93 ; Function d_gfx_resource_end
                                     94 ; ---------------------------------
    0000149F                         95 _d_gfx_resource_end::
    0000149F 6F               [ 4]   96 	ld	l, a
                                     97 ;src/lib/disc.c:52: return GFX_BANK_BASE + d_gfx_resources[id].offset +
    000014A0 01 8F 14         [10]   98 	ld	bc, #_d_gfx_resources+0
    000014A3 26 00            [ 7]   99 	ld	h, #0x00
    000014A5 29               [11]  100 	add	hl, hl
    000014A6 29               [11]  101 	add	hl, hl
    000014A7 09               [11]  102 	add	hl, bc
    000014A8 5D               [ 4]  103 	ld	e, l
    000014A9 54               [ 4]  104 	ld	d, h
    000014AA 4E               [ 7]  105 	ld	c, (hl)
    000014AB 23               [ 6]  106 	inc	hl
    000014AC 46               [ 7]  107 	ld	b, (hl)
    000014AD 21 01 40         [10]  108 	ld	hl, #0x4001
    000014B0 09               [11]  109 	add	hl, bc
    000014B1 4D               [ 4]  110 	ld	c, l
    000014B2 44               [ 4]  111 	ld	b, h
                                    112 ;src/lib/disc.c:53: d_gfx_resources[id].size - 1;
    000014B3 EB               [ 4]  113 	ex	de, hl
    000014B4 23               [ 6]  114 	inc	hl
    000014B5 23               [ 6]  115 	inc	hl
    000014B6 7E               [ 7]  116 	ld	a, (hl)
    000014B7 23               [ 6]  117 	inc	hl
    000014B8 66               [ 7]  118 	ld	h, (hl)
    000014B9 6F               [ 4]  119 	ld	l, a
    000014BA 09               [11]  120 	add	hl, bc
    000014BB EB               [ 4]  121 	ex	de, hl
    000014BC 1B               [ 6]  122 	dec	de
                                    123 ;src/lib/disc.c:54: }
    000014BD C9               [10]  124 	ret
                                    125 ;src/lib/disc.c:56: const u8 *d_gfx_resource_start(gfx_id_t id) {
                                    126 ;	---------------------------------
                                    127 ; Function d_gfx_resource_start
                                    128 ; ---------------------------------
    000014BE                        129 _d_gfx_resource_start::
    000014BE 6F               [ 4]  130 	ld	l, a
                                    131 ;src/lib/disc.c:58: return GFX_BANK_BASE + d_gfx_resources[id].offset;
    000014BF 01 8F 14         [10]  132 	ld	bc, #_d_gfx_resources+0
    000014C2 26 00            [ 7]  133 	ld	h, #0x00
    000014C4 29               [11]  134 	add	hl, hl
    000014C5 29               [11]  135 	add	hl, hl
    000014C6 09               [11]  136 	add	hl, bc
    000014C7 4E               [ 7]  137 	ld	c, (hl)
    000014C8 23               [ 6]  138 	inc	hl
    000014C9 46               [ 7]  139 	ld	b, (hl)
    000014CA 21 01 40         [10]  140 	ld	hl, #0x4001
    000014CD 09               [11]  141 	add	hl, bc
    000014CE EB               [ 4]  142 	ex	de, hl
                                    143 ;src/lib/disc.c:59: }
    000014CF C9               [10]  144 	ret
                                    145 ;src/lib/disc.c:61: void d_gfx_decompress_to_screen(gfx_id_t id) {
                                    146 ;	---------------------------------
                                    147 ; Function d_gfx_decompress_to_screen
                                    148 ; ---------------------------------
    000014D0                        149 _d_gfx_decompress_to_screen::
                                    150 ;src/lib/disc.c:63: const u8 *end = d_gfx_resource_end(id);
    000014D0 CD 9F 14         [17]  151 	call	_d_gfx_resource_end
                                    152 ;src/lib/disc.c:65: a_page_disconnect_safe();
    000014D3 D5               [11]  153 	push	de
    000014D4 CD B4 12         [17]  154 	call	_a_page_disconnect_safe
                                    155 ;src/lib/disc.c:66: cpct_pageMemory(RAMCFG_7 | BANK_0);
    000014D7 2E 07            [ 7]  156 	ld	l, #0x07
    000014D9 CD 50 30         [17]  157 	call	_cpct_pageMemory
    000014DC D1               [10]  158 	pop	de
                                    159 ;src/lib/disc.c:67: cpct_zx7b_decrunch_s(VIDEO_MEM_END, end);
    000014DD 21 FF FF         [10]  160 	ld	hl, #0xffff
    000014E0 CD 18 2F         [17]  161 	call	_cpct_zx7b_decrunch_s
                                    162 ;src/lib/disc.c:68: cpct_pageMemory(RAMCFG_0 | BANK_0);
    000014E3 2E 00            [ 7]  163 	ld	l, #0x00
    000014E5 CD 50 30         [17]  164 	call	_cpct_pageMemory
                                    165 ;src/lib/disc.c:69: a_page_connect_safe();
                                    166 ;src/lib/disc.c:70: }
    000014E8 C3 A5 12         [10]  167 	jp	_a_page_connect_safe
                                    168 ;src/lib/disc.c:72: void d_load_gfx_to_extended_memory(void) {
                                    169 ;	---------------------------------
                                    170 ; Function d_load_gfx_to_extended_memory
                                    171 ; ---------------------------------
    000014EB                        172 _d_load_gfx_to_extended_memory::
                                    173 ;src/lib/disc.c:74: a_page_disconnect_safe();
    000014EB CD B4 12         [17]  174 	call	_a_page_disconnect_safe
                                    175 ;src/lib/disc.c:75: cpct_pageMemory(RAMCFG_7 | BANK_0);
    000014EE 2E 07            [ 7]  176 	ld	l, #0x07
    000014F0 CD 50 30         [17]  177 	call	_cpct_pageMemory
                                    178 ;src/lib/disc.c:77: d_load("PRESENTSBIN", d_gfx_resource_start(GFX_PRESENTS));
    000014F3 AF               [ 4]  179 	xor	a, a
    000014F4 CD BE 14         [17]  180 	call	_d_gfx_resource_start
    000014F7 21 26 15         [10]  181 	ld	hl, #___str_0
    000014FA CD 7C 14         [17]  182 	call	_d_load
                                    183 ;src/lib/disc.c:78: d_load("MADEWITHBIN", d_gfx_resource_start(GFX_MADEWIDTH));
    000014FD 3E 01            [ 7]  184 	ld	a, #0x01
    000014FF CD BE 14         [17]  185 	call	_d_gfx_resource_start
    00001502 21 32 15         [10]  186 	ld	hl, #___str_1
    00001505 CD 7C 14         [17]  187 	call	_d_load
                                    188 ;src/lib/disc.c:79: d_load("INTRO   BIN", d_gfx_resource_start(GFX_INTRO));
    00001508 3E 02            [ 7]  189 	ld	a, #0x02
    0000150A CD BE 14         [17]  190 	call	_d_gfx_resource_start
    0000150D 21 3E 15         [10]  191 	ld	hl, #___str_2
    00001510 CD 7C 14         [17]  192 	call	_d_load
                                    193 ;src/lib/disc.c:80: d_load("TITLE   BIN", d_gfx_resource_start(GFX_TITLE));
    00001513 3E 03            [ 7]  194 	ld	a, #0x03
    00001515 CD BE 14         [17]  195 	call	_d_gfx_resource_start
    00001518 21 4A 15         [10]  196 	ld	hl, #___str_3
    0000151B CD 7C 14         [17]  197 	call	_d_load
                                    198 ;src/lib/disc.c:82: cpct_pageMemory(RAMCFG_0 | BANK_0);
    0000151E 2E 00            [ 7]  199 	ld	l, #0x00
    00001520 CD 50 30         [17]  200 	call	_cpct_pageMemory
                                    201 ;src/lib/disc.c:83: a_page_connect_safe();
                                    202 ;src/lib/disc.c:84: }
    00001523 C3 A5 12         [10]  203 	jp	_a_page_connect_safe
                                    204 	.area _CODE
                                    205 	.area _CODE
    00001526                        206 ___str_0:
    00001526 50 52 45 53 45 4E 54   207 	.ascii "PRESENTSBIN"
             53 42 49 4E
    00001531 00                     208 	.db 0x00
                                    209 	.area _CODE
                                    210 	.area _CODE
    00001532                        211 ___str_1:
    00001532 4D 41 44 45 57 49 54   212 	.ascii "MADEWITHBIN"
             48 42 49 4E
    0000153D 00                     213 	.db 0x00
                                    214 	.area _CODE
                                    215 	.area _CODE
    0000153E                        216 ___str_2:
    0000153E 49 4E 54 52 4F 20 20   217 	.ascii "INTRO   BIN"
             20 42 49 4E
    00001549 00                     218 	.db 0x00
                                    219 	.area _CODE
                                    220 	.area _CODE
    0000154A                        221 ___str_3:
    0000154A 54 49 54 4C 45 20 20   222 	.ascii "TITLE   BIN"
             20 42 49 4E
    00001555 00                     223 	.db 0x00
                                    224 	.area _CODE
                                    225 	.area _CODE
                                    226 ;src/lib/disc.c:86: void d_load_music(void) {
                                    227 ;	---------------------------------
                                    228 ; Function d_load_music
                                    229 ; ---------------------------------
    00001556                        230 _d_load_music::
                                    231 ;src/lib/disc.c:88: a_page_disconnect_safe();
    00001556 CD B4 12         [17]  232 	call	_a_page_disconnect_safe
                                    233 ;src/lib/disc.c:89: d_load("MUSIC   BIN", MUSIC_LOC);
    00001559 11 00 B0         [10]  234 	ld	de, #0xb000
    0000155C 21 65 15         [10]  235 	ld	hl, #___str_4
    0000155F CD 7C 14         [17]  236 	call	_d_load
                                    237 ;src/lib/disc.c:90: a_page_connect_safe();
                                    238 ;src/lib/disc.c:91: }
    00001562 C3 A5 12         [10]  239 	jp	_a_page_connect_safe
                                    240 	.area _CODE
                                    241 	.area _CODE
    00001565                        242 ___str_4:
    00001565 4D 55 53 49 43 20 20   243 	.ascii "MUSIC   BIN"
             20 42 49 4E
    00001570 00                     244 	.db 0x00
                                    245 	.area _CODE
                                    246 	.area _CODE
                                    247 	.area _CODE
                                    248 	.area _CODE
                                    249 	.area _INITIALIZER
                                    250 	.area _CABS (ABS)
