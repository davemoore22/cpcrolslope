                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module cache
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _a_page_disconnect_safe
                                     12 	.globl _a_page_connect_safe
                                     13 	.globl _a_sprite_flip_horizontal_inplace
                                     14 	.globl _cpct_asicCopySpriteData
                                     15 	.globl _cpct_zx7b_decrunch_s
                                     16 	.globl _cpct_pageMemory
                                     17 	.globl _cpct_memcpy
                                     18 	.globl _cpct_memset
                                     19 	.globl _g_sprite_banks
                                     20 	.globl _c_sprite_cache_bank_init
                                     21 	.globl _c_sprite_cache_bank_upload
                                     22 ;--------------------------------------------------------
                                     23 ; special function registers
                                     24 ;--------------------------------------------------------
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area _DATA
    00009340                         29 _g_sprite_banks::
    00009340                         30 	.ds 15
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area _INITIALIZED
                                     35 ;--------------------------------------------------------
                                     36 ; absolute external ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area _DABS (ABS)
                                     39 ;--------------------------------------------------------
                                     40 ; global & static initialisations
                                     41 ;--------------------------------------------------------
                                     42 	.area _HOME
                                     43 	.area _GSINIT
                                     44 	.area _GSFINAL
                                     45 	.area _GSINIT
                                     46 ;--------------------------------------------------------
                                     47 ; Home
                                     48 ;--------------------------------------------------------
                                     49 	.area _HOME
                                     50 	.area _HOME
                                     51 ;--------------------------------------------------------
                                     52 ; code
                                     53 ;--------------------------------------------------------
                                     54 	.area _CODE
                                     55 ;src/lib/cache.c:37: void c_sprite_cache_bank_init(void) {
                                     56 ;	---------------------------------
                                     57 ; Function c_sprite_cache_bank_init
                                     58 ; ---------------------------------
    000012C2                         59 _c_sprite_cache_bank_init::
    000012C2 CD AA 2F         [17]   60 	call	___sdcc_enter_ix
    000012C5 3B               [ 6]   61 	dec	sp
                                     62 ;src/lib/cache.c:42: g_sprite_banks[SPR_BANK_ROLAND_L].offset = bank_offset;
    000012C6 21 00 00         [10]   63 	ld	hl, #0x0000
    000012C9 22 40 93         [16]   64 	ld	(_g_sprite_banks), hl
                                     65 ;src/lib/cache.c:43: g_sprite_banks[SPR_BANK_ROLAND_L].count = 4;
    000012CC 21 42 93         [10]   66 	ld	hl, #_g_sprite_banks + 2
    000012CF 36 04            [10]   67 	ld	(hl), #0x04
                                     68 ;src/lib/cache.c:44: for (u8 i = 0; i < 4; i++) {
    000012D1 11 00 00         [10]   69 	ld	de, #0x0000
    000012D4 DD 36 FF 00      [19]   70 	ld	-1 (ix), #0x00
    000012D8                         71 00107$:
    000012D8 DD 7E FF         [19]   72 	ld	a, -1 (ix)
    000012DB D6 04            [ 7]   73 	sub	a, #0x04
    000012DD 30 19            [12]   74 	jr	NC, 00101$
                                     75 ;src/lib/cache.c:46: &roland_sprites_data[i], bank_offset, false);
    000012DF DD 6E FF         [19]   76 	ld	l, -1 (ix)
    000012E2 26 00            [ 7]   77 	ld	h, #0x00
    000012E4 29               [11]   78 	add	hl, hl
    000012E5 29               [11]   79 	add	hl, hl
    000012E6 01 EC 90         [10]   80 	ld	bc, #_roland_sprites_data
    000012E9 09               [11]   81 	add	hl, bc
    000012EA D5               [11]   82 	push	de
    000012EB AF               [ 4]   83 	xor	a, a
    000012EC F5               [11]   84 	push	af
    000012ED 33               [ 6]   85 	inc	sp
    000012EE CD E5 13         [17]   86 	call	_c_expand_sprite_to_bank
    000012F1 D1               [10]   87 	pop	de
                                     88 ;src/lib/cache.c:47: bank_offset += SPRITE_BYTES;
    000012F2 14               [ 4]   89 	inc	d
                                     90 ;src/lib/cache.c:44: for (u8 i = 0; i < 4; i++) {
    000012F3 DD 34 FF         [23]   91 	inc	-1 (ix)
    000012F6 18 E0            [12]   92 	jr	00107$
    000012F8                         93 00101$:
                                     94 ;src/lib/cache.c:51: g_sprite_banks[SPR_BANK_ROLAND_R].offset = bank_offset;
    000012F8 ED 53 43 93      [20]   95 	ld	((_g_sprite_banks + 3)), de
                                     96 ;src/lib/cache.c:52: g_sprite_banks[SPR_BANK_ROLAND_R].count = 4;
    000012FC 21 45 93         [10]   97 	ld	hl, #_g_sprite_banks + 5
    000012FF 36 04            [10]   98 	ld	(hl), #0x04
                                     99 ;src/lib/cache.c:53: for (u8 i = 0; i < 4; i++) {
    00001301 0E 00            [ 7]  100 	ld	c, #0x00
    00001303                        101 00110$:
    00001303 79               [ 4]  102 	ld	a, c
    00001304 D6 04            [ 7]  103 	sub	a, #0x04
    00001306 30 1C            [12]  104 	jr	NC, 00102$
                                    105 ;src/lib/cache.c:55: &roland_sprites_data[i], bank_offset, true);
    00001308 69               [ 4]  106 	ld	l, c
    00001309 26 00            [ 7]  107 	ld	h, #0x00
    0000130B 29               [11]  108 	add	hl, hl
    0000130C 29               [11]  109 	add	hl, hl
    0000130D 7D               [ 4]  110 	ld	a, l
    0000130E C6 EC            [ 7]  111 	add	a, #<(_roland_sprites_data)
    00001310 6F               [ 4]  112 	ld	l, a
    00001311 7C               [ 4]  113 	ld	a, h
    00001312 CE 90            [ 7]  114 	adc	a, #>(_roland_sprites_data)
    00001314 C5               [11]  115 	push	bc
    00001315 D5               [11]  116 	push	de
    00001316 26 01            [ 7]  117 	ld	h, #0x01
    00001318 E5               [11]  118 	push	hl
    00001319 33               [ 6]  119 	inc	sp
    0000131A 67               [ 4]  120 	ld	h, a
    0000131B CD E5 13         [17]  121 	call	_c_expand_sprite_to_bank
    0000131E D1               [10]  122 	pop	de
    0000131F C1               [10]  123 	pop	bc
                                    124 ;src/lib/cache.c:56: bank_offset += SPRITE_BYTES;
    00001320 14               [ 4]  125 	inc	d
                                    126 ;src/lib/cache.c:53: for (u8 i = 0; i < 4; i++) {
    00001321 0C               [ 4]  127 	inc	c
    00001322 18 DF            [12]  128 	jr	00110$
    00001324                        129 00102$:
                                    130 ;src/lib/cache.c:60: g_sprite_banks[SPR_BANK_MODE_CLASSIC].offset = bank_offset;
    00001324 ED 53 46 93      [20]  131 	ld	((_g_sprite_banks + 6)), de
                                    132 ;src/lib/cache.c:61: g_sprite_banks[SPR_BANK_MODE_CLASSIC].count = 4;
    00001328 21 48 93         [10]  133 	ld	hl, #_g_sprite_banks + 8
    0000132B 36 04            [10]  134 	ld	(hl), #0x04
                                    135 ;src/lib/cache.c:62: for (u8 i = 0; i < 4; i++) {
    0000132D 0E 00            [ 7]  136 	ld	c, #0x00
    0000132F                        137 00113$:
    0000132F 79               [ 4]  138 	ld	a, c
    00001330 D6 04            [ 7]  139 	sub	a, #0x04
    00001332 30 1B            [12]  140 	jr	NC, 00103$
                                    141 ;src/lib/cache.c:64: &mode_sprites_data[i], bank_offset, false);
    00001334 69               [ 4]  142 	ld	l, c
    00001335 26 00            [ 7]  143 	ld	h, #0x00
    00001337 29               [11]  144 	add	hl, hl
    00001338 29               [11]  145 	add	hl, hl
    00001339 7D               [ 4]  146 	ld	a, l
    0000133A C6 BC            [ 7]  147 	add	a, #<(_mode_sprites_data)
    0000133C 6F               [ 4]  148 	ld	l, a
    0000133D 7C               [ 4]  149 	ld	a, h
    0000133E CE 91            [ 7]  150 	adc	a, #>(_mode_sprites_data)
    00001340 67               [ 4]  151 	ld	h, a
    00001341 C5               [11]  152 	push	bc
    00001342 D5               [11]  153 	push	de
    00001343 AF               [ 4]  154 	xor	a, a
    00001344 F5               [11]  155 	push	af
    00001345 33               [ 6]  156 	inc	sp
    00001346 CD E5 13         [17]  157 	call	_c_expand_sprite_to_bank
    00001349 D1               [10]  158 	pop	de
    0000134A C1               [10]  159 	pop	bc
                                    160 ;src/lib/cache.c:65: bank_offset += SPRITE_BYTES;
    0000134B 14               [ 4]  161 	inc	d
                                    162 ;src/lib/cache.c:62: for (u8 i = 0; i < 4; i++) {
    0000134C 0C               [ 4]  163 	inc	c
    0000134D 18 E0            [12]  164 	jr	00113$
    0000134F                        165 00103$:
                                    166 ;src/lib/cache.c:69: g_sprite_banks[SPR_BANK_MODE_MANIA].offset = bank_offset;
    0000134F ED 53 49 93      [20]  167 	ld	((_g_sprite_banks + 9)), de
                                    168 ;src/lib/cache.c:70: g_sprite_banks[SPR_BANK_MODE_MANIA].count = 3;
    00001353 21 4B 93         [10]  169 	ld	hl, #_g_sprite_banks + 11
    00001356 36 03            [10]  170 	ld	(hl), #0x03
                                    171 ;src/lib/cache.c:71: for (u8 i = 0; i < 3; i++) {
    00001358 0E 00            [ 7]  172 	ld	c, #0x00
    0000135A                        173 00116$:
                                    174 ;src/lib/cache.c:73: &mode_sprites_data[4 + i], bank_offset, false);
    0000135A 79               [ 4]  175 	ld	a,c
    0000135B FE 03            [ 7]  176 	cp	a,#0x03
    0000135D 30 1C            [12]  177 	jr	NC, 00104$
    0000135F C6 04            [ 7]  178 	add	a, #0x04
    00001361 6F               [ 4]  179 	ld	l, a
    00001362 07               [ 4]  180 	rlca
    00001363 9F               [ 4]  181 	sbc	a, a
    00001364 67               [ 4]  182 	ld	h, a
    00001365 29               [11]  183 	add	hl, hl
    00001366 29               [11]  184 	add	hl, hl
    00001367 D5               [11]  185 	push	de
    00001368 11 BC 91         [10]  186 	ld	de, #_mode_sprites_data
    0000136B 19               [11]  187 	add	hl, de
    0000136C D1               [10]  188 	pop	de
    0000136D C5               [11]  189 	push	bc
    0000136E D5               [11]  190 	push	de
    0000136F AF               [ 4]  191 	xor	a, a
    00001370 F5               [11]  192 	push	af
    00001371 33               [ 6]  193 	inc	sp
    00001372 CD E5 13         [17]  194 	call	_c_expand_sprite_to_bank
    00001375 D1               [10]  195 	pop	de
    00001376 C1               [10]  196 	pop	bc
                                    197 ;src/lib/cache.c:74: bank_offset += SPRITE_BYTES;
    00001377 14               [ 4]  198 	inc	d
                                    199 ;src/lib/cache.c:71: for (u8 i = 0; i < 3; i++) {
    00001378 0C               [ 4]  200 	inc	c
    00001379 18 DF            [12]  201 	jr	00116$
    0000137B                        202 00104$:
                                    203 ;src/lib/cache.c:78: g_sprite_banks[SPR_BANK_MODE_ZEN].offset = bank_offset;
    0000137B ED 53 4C 93      [20]  204 	ld	((_g_sprite_banks + 12)), de
                                    205 ;src/lib/cache.c:79: g_sprite_banks[SPR_BANK_MODE_ZEN].count = 2;
    0000137F 21 4E 93         [10]  206 	ld	hl, #_g_sprite_banks + 14
    00001382 36 02            [10]  207 	ld	(hl), #0x02
                                    208 ;src/lib/cache.c:80: for (u8 i = 0; i < 2; i++) {
    00001384 0E 00            [ 7]  209 	ld	c, #0x00
    00001386                        210 00119$:
                                    211 ;src/lib/cache.c:82: &mode_sprites_data[7 + i], bank_offset, false);
    00001386 79               [ 4]  212 	ld	a,c
    00001387 FE 02            [ 7]  213 	cp	a,#0x02
    00001389 30 1E            [12]  214 	jr	NC, 00121$
    0000138B C6 07            [ 7]  215 	add	a, #0x07
    0000138D 6F               [ 4]  216 	ld	l, a
    0000138E 07               [ 4]  217 	rlca
    0000138F 9F               [ 4]  218 	sbc	a, a
    00001390 67               [ 4]  219 	ld	h, a
    00001391 29               [11]  220 	add	hl, hl
    00001392 29               [11]  221 	add	hl, hl
    00001393 3E BC            [ 7]  222 	ld	a, #<(_mode_sprites_data)
    00001395 85               [ 4]  223 	add	a, l
    00001396 6F               [ 4]  224 	ld	l, a
    00001397 3E 91            [ 7]  225 	ld	a, #>(_mode_sprites_data)
    00001399 8C               [ 4]  226 	adc	a, h
    0000139A 67               [ 4]  227 	ld	h, a
    0000139B C5               [11]  228 	push	bc
    0000139C D5               [11]  229 	push	de
    0000139D AF               [ 4]  230 	xor	a, a
    0000139E F5               [11]  231 	push	af
    0000139F 33               [ 6]  232 	inc	sp
    000013A0 CD E5 13         [17]  233 	call	_c_expand_sprite_to_bank
    000013A3 D1               [10]  234 	pop	de
    000013A4 C1               [10]  235 	pop	bc
                                    236 ;src/lib/cache.c:83: bank_offset += SPRITE_BYTES;
    000013A5 14               [ 4]  237 	inc	d
                                    238 ;src/lib/cache.c:80: for (u8 i = 0; i < 2; i++) {
    000013A6 0C               [ 4]  239 	inc	c
    000013A7 18 DD            [12]  240 	jr	00119$
    000013A9                        241 00121$:
                                    242 ;src/lib/cache.c:85: }
    000013A9 33               [ 6]  243 	inc	sp
    000013AA DD E1            [14]  244 	pop	ix
    000013AC C9               [10]  245 	ret
    000013AD                        246 _bank_counts:
    000013AD 04                     247 	.db #0x04	; 4
    000013AE 04                     248 	.db #0x04	; 4
    000013AF 04                     249 	.db #0x04	; 4
    000013B0 03                     250 	.db #0x03	; 3
    000013B1 02                     251 	.db #0x02	; 2
                                    252 ;src/lib/cache.c:87: void c_sprite_cache_bank_upload(
                                    253 ;	---------------------------------
                                    254 ; Function c_sprite_cache_bank_upload
                                    255 ; ---------------------------------
    000013B2                        256 _c_sprite_cache_bank_upload::
    000013B2 DD E5            [15]  257 	push	ix
    000013B4 DD 21 00 00      [14]  258 	ld	ix,#0
    000013B8 DD 39            [15]  259 	add	ix,sp
    000013BA 5F               [ 4]  260 	ld	e, a
    000013BB 4D               [ 4]  261 	ld	c, l
                                    262 ;src/lib/cache.c:90: const sprite_bank_desc_t *b = &g_sprite_banks[bank];
    000013BC 16 00            [ 7]  263 	ld	d, #0x00
    000013BE 6B               [ 4]  264 	ld	l, e
    000013BF 62               [ 4]  265 	ld	h, d
    000013C0 29               [11]  266 	add	hl, hl
    000013C1 19               [11]  267 	add	hl, de
    000013C2 11 40 93         [10]  268 	ld	de, #_g_sprite_banks
    000013C5 19               [11]  269 	add	hl, de
                                    270 ;src/lib/cache.c:92: if (index >= b->count)
    000013C6 5D               [ 4]  271 	ld	e, l
    000013C7 54               [ 4]  272 	ld	d, h
    000013C8 23               [ 6]  273 	inc	hl
    000013C9 23               [ 6]  274 	inc	hl
    000013CA 46               [ 7]  275 	ld	b, (hl)
    000013CB 79               [ 4]  276 	ld	a, c
    000013CC 90               [ 4]  277 	sub	a, b
                                    278 ;src/lib/cache.c:93: return;
    000013CD 30 11            [12]  279 	jr	NC, 00103$
                                    280 ;src/lib/cache.c:95: u16 offset = b->offset + (index * SPRITE_BYTES);
    000013CF EB               [ 4]  281 	ex	de,hl
    000013D0 5E               [ 7]  282 	ld	e, (hl)
    000013D1 23               [ 6]  283 	inc	hl
    000013D2 56               [ 7]  284 	ld	d, (hl)
    000013D3 AF               [ 4]  285 	xor	a, a
    000013D4 61               [ 4]  286 	ld	h, c
    000013D5 2E 00            [ 7]  287 	ld	l, #0x00
    000013D7 19               [11]  288 	add	hl, de
                                    289 ;src/lib/cache.c:97: c_fetch_sprite_from_bank_and_upload(offset, hw_id);
    000013D8 DD 7E 04         [19]  290 	ld	a, 4 (ix)
    000013DB F5               [11]  291 	push	af
    000013DC 33               [ 6]  292 	inc	sp
    000013DD CD 3A 14         [17]  293 	call	_c_fetch_sprite_from_bank_and_upload
    000013E0                        294 00103$:
                                    295 ;src/lib/cache.c:98: }
    000013E0 DD E1            [14]  296 	pop	ix
    000013E2 E1               [10]  297 	pop	hl
    000013E3 33               [ 6]  298 	inc	sp
    000013E4 E9               [ 4]  299 	jp	(hl)
                                    300 ;src/lib/cache.c:101: static void c_expand_sprite_to_bank(const sprite_data_t *src,
                                    301 ;	---------------------------------
                                    302 ; Function c_expand_sprite_to_bank
                                    303 ; ---------------------------------
    000013E5                        304 _c_expand_sprite_to_bank:
    000013E5 DD E5            [15]  305 	push	ix
    000013E7 DD 21 00 00      [14]  306 	ld	ix,#0
    000013EB DD 39            [15]  307 	add	ix,sp
    000013ED D5               [11]  308 	push	de
                                    309 ;src/lib/cache.c:105: a_page_disconnect_safe();
    000013EE E5               [11]  310 	push	hl
    000013EF CD B4 12         [17]  311 	call	_a_page_disconnect_safe
                                    312 ;src/lib/cache.c:109: cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);
    000013F2 11 00 01         [10]  313 	ld	de, #0x0100
    000013F5 D5               [11]  314 	push	de
    000013F6 AF               [ 4]  315 	xor	a, a
    000013F7 F5               [11]  316 	push	af
    000013F8 33               [ 6]  317 	inc	sp
    000013F9 21 00 BF         [10]  318 	ld	hl, #0xbf00
    000013FC CD 6F 2F         [17]  319 	call	_cpct_memset
    000013FF E1               [10]  320 	pop	hl
                                    321 ;src/lib/cache.c:110: cpct_zx7b_decrunch_s(buf_end, src->end);
    00001400 23               [ 6]  322 	inc	hl
    00001401 23               [ 6]  323 	inc	hl
    00001402 5E               [ 7]  324 	ld	e, (hl)
    00001403 23               [ 6]  325 	inc	hl
    00001404 56               [ 7]  326 	ld	d, (hl)
    00001405 21 FF BF         [10]  327 	ld	hl, #0xbfff
    00001408 CD 18 2F         [17]  328 	call	_cpct_zx7b_decrunch_s
                                    329 ;src/lib/cache.c:113: if (flip_horizontal)
    0000140B DD CB 04 46      [20]  330 	bit	0, 4 (ix)
    0000140F 28 06            [12]  331 	jr	Z, 00102$
                                    332 ;src/lib/cache.c:114: a_sprite_flip_horizontal_inplace(HW_SPRITE_BUFFER);
    00001411 21 00 BF         [10]  333 	ld	hl, #0xbf00
    00001414 CD 12 10         [17]  334 	call	_a_sprite_flip_horizontal_inplace
    00001417                        335 00102$:
                                    336 ;src/lib/cache.c:117: cpct_pageMemory(RAMCFG_6 | BANK_0);
    00001417 2E 06            [ 7]  337 	ld	l, #0x06
    00001419 CD 50 30         [17]  338 	call	_cpct_pageMemory
                                    339 ;src/lib/cache.c:120: cpct_memcpy((u8 *)(SPRITE_BANK_BASE + bank_offset), HW_SPRITE_BUFFER,
    0000141C E1               [10]  340 	pop	hl
    0000141D E5               [11]  341 	push	hl
    0000141E 11 01 40         [10]  342 	ld	de, #0x4001
    00001421 19               [11]  343 	add	hl, de
    00001422 11 00 01         [10]  344 	ld	de, #0x0100
    00001425 D5               [11]  345 	push	de
    00001426 11 00 BF         [10]  346 	ld	de, #0xbf00
    00001429 CD 7D 2F         [17]  347 	call	_cpct_memcpy
                                    348 ;src/lib/cache.c:124: cpct_pageMemory(RAMCFG_0 | BANK_0);
    0000142C 2E 00            [ 7]  349 	ld	l, #0x00
    0000142E CD 50 30         [17]  350 	call	_cpct_pageMemory
                                    351 ;src/lib/cache.c:127: a_page_connect_safe();
    00001431 CD A5 12         [17]  352 	call	_a_page_connect_safe
                                    353 ;src/lib/cache.c:128: }
    00001434 F1               [10]  354 	pop	af
    00001435 DD E1            [14]  355 	pop	ix
    00001437 E1               [10]  356 	pop	hl
    00001438 33               [ 6]  357 	inc	sp
    00001439 E9               [ 4]  358 	jp	(hl)
                                    359 ;src/lib/cache.c:131: static void c_fetch_sprite_from_bank_and_upload(
                                    360 ;	---------------------------------
                                    361 ; Function c_fetch_sprite_from_bank_and_upload
                                    362 ; ---------------------------------
    0000143A                        363 _c_fetch_sprite_from_bank_and_upload:
                                    364 ;src/lib/cache.c:135: a_page_disconnect_safe();
    0000143A E5               [11]  365 	push	hl
    0000143B CD B4 12         [17]  366 	call	_a_page_disconnect_safe
                                    367 ;src/lib/cache.c:138: cpct_pageMemory(RAMCFG_6 | BANK_0);
    0000143E 2E 06            [ 7]  368 	ld	l, #0x06
    00001440 CD 50 30         [17]  369 	call	_cpct_pageMemory
                                    370 ;src/lib/cache.c:141: cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);
    00001443 11 00 01         [10]  371 	ld	de, #0x0100
    00001446 D5               [11]  372 	push	de
    00001447 AF               [ 4]  373 	xor	a, a
    00001448 F5               [11]  374 	push	af
    00001449 33               [ 6]  375 	inc	sp
    0000144A 21 00 BF         [10]  376 	ld	hl, #0xbf00
    0000144D CD 6F 2F         [17]  377 	call	_cpct_memset
    00001450 E1               [10]  378 	pop	hl
                                    379 ;src/lib/cache.c:142: cpct_memcpy(HW_SPRITE_BUFFER, (u8 *)(SPRITE_BANK_BASE + bank_offset),
    00001451 01 01 40         [10]  380 	ld	bc, #0x4001
    00001454 09               [11]  381 	add	hl, bc
    00001455 11 00 01         [10]  382 	ld	de, #0x0100
    00001458 EB               [ 4]  383 	ex	de, hl
    00001459 E5               [11]  384 	push	hl
    0000145A 21 00 BF         [10]  385 	ld	hl, #0xbf00
    0000145D CD 7D 2F         [17]  386 	call	_cpct_memcpy
                                    387 ;src/lib/cache.c:146: cpct_pageMemory(RAMCFG_0 | BANK_0);
    00001460 2E 00            [ 7]  388 	ld	l, #0x00
    00001462 CD 50 30         [17]  389 	call	_cpct_pageMemory
                                    390 ;src/lib/cache.c:149: a_page_connect_safe();
    00001465 CD A5 12         [17]  391 	call	_a_page_connect_safe
                                    392 ;src/lib/cache.c:152: cpct_asicCopySpriteData(hw_id, HW_SPRITE_BUFFER);
    00001468 FD 21 02 00      [14]  393 	ld	iy, #2
    0000146C FD 39            [15]  394 	add	iy, sp
    0000146E FD 6E 00         [19]  395 	ld	l, 0 (iy)
    00001471 26 00            [ 7]  396 	ld	h, #0x00
    00001473 11 00 BF         [10]  397 	ld	de, #0xbf00
    00001476 CD 03 2E         [17]  398 	call	_cpct_asicCopySpriteData
                                    399 ;src/lib/cache.c:153: }
    00001479 E1               [10]  400 	pop	hl
    0000147A 33               [ 6]  401 	inc	sp
    0000147B E9               [ 4]  402 	jp	(hl)
                                    403 	.area _CODE
                                    404 	.area _INITIALIZER
                                    405 	.area _CABS (ABS)
