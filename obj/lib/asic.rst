                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module asic
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cpct_asicPageDisconnect
                                     12 	.globl _cpct_asicPageConnect
                                     13 	.globl _cpct_asicSetSpritePalette
                                     14 	.globl _cpct_asicSetSpritePalColour
                                     15 	.globl _cpct_asicSetSpriteZoom
                                     16 	.globl _cpct_asicSetSpritePosition
                                     17 	.globl _cpct_asicCopySpriteData
                                     18 	.globl _cpct_zx7b_decrunch_s
                                     19 	.globl _cpct_waitVSYNCStart
                                     20 	.globl _cpct_memset
                                     21 	.globl _a_sprite_flip_horizontal_inplace
                                     22 	.globl _a_set_hardware_sprite_palette
                                     23 	.globl _a_blank_hardware_sprite_palette
                                     24 	.globl _a_load_roland_sprites
                                     25 	.globl _a_load_ghost_sprites
                                     26 	.globl _a_load_spider_sprites
                                     27 	.globl _a_load_snowball_sprites
                                     28 	.globl _a_load_cpctelera_sprites
                                     29 	.globl _a_load_hw_sprite
                                     30 	.globl _a_load_sprite_set
                                     31 	.globl _a_clear_sprites
                                     32 	.globl _a_load_sprite_range
                                     33 	.globl _a_hide_sprite_range
                                     34 	.globl _a_clear_all_sprites
                                     35 	.globl _a_show_sprite
                                     36 	.globl _a_hide_sprite
                                     37 	.globl _a_set_sprite_zoom_range
                                     38 	.globl _a_page_connect_safe
                                     39 	.globl _a_page_disconnect_safe
                                     40 ;--------------------------------------------------------
                                     41 ; special function registers
                                     42 ;--------------------------------------------------------
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area _DATA
                                     47 ;--------------------------------------------------------
                                     48 ; ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area _INITIALIZED
    00009369                         51 _a_asic_paged:
    00009369                         52 	.ds 1
                                     53 ;--------------------------------------------------------
                                     54 ; absolute external ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area _DABS (ABS)
                                     57 ;--------------------------------------------------------
                                     58 ; global & static initialisations
                                     59 ;--------------------------------------------------------
                                     60 	.area _HOME
                                     61 	.area _GSINIT
                                     62 	.area _GSFINAL
                                     63 	.area _GSINIT
                                     64 ;--------------------------------------------------------
                                     65 ; Home
                                     66 ;--------------------------------------------------------
                                     67 	.area _HOME
                                     68 	.area _HOME
                                     69 ;--------------------------------------------------------
                                     70 ; code
                                     71 ;--------------------------------------------------------
                                     72 	.area _CODE
                                     73 ;src/lib/asic.c:23: void a_sprite_flip_horizontal_inplace(u8 *sprite) {
                                     74 ;	---------------------------------
                                     75 ; Function a_sprite_flip_horizontal_inplace
                                     76 ; ---------------------------------
    00001012                         77 _a_sprite_flip_horizontal_inplace::
    00001012 DD E5            [15]   78 	push	ix
    00001014 DD 21 00 00      [14]   79 	ld	ix,#0
    00001018 DD 39            [15]   80 	add	ix,sp
    0000101A F5               [11]   81 	push	af
    0000101B F5               [11]   82 	push	af
    0000101C 3B               [ 6]   83 	dec	sp
    0000101D EB               [ 4]   84 	ex	de, hl
                                     85 ;src/lib/asic.c:25: for (u8 y = 0; y < SPRITE_H; y++) {
    0000101E DD 36 FE 00      [19]   86 	ld	-2 (ix), #0x00
    00001022                         87 00107$:
    00001022 DD 7E FE         [19]   88 	ld	a, -2 (ix)
    00001025 D6 10            [ 7]   89 	sub	a, #0x10
    00001027 30 47            [12]   90 	jr	NC, 00109$
                                     91 ;src/lib/asic.c:26: u8 *row = sprite + y * SPRITE_W;
    00001029 DD 6E FE         [19]   92 	ld	l, -2 (ix)
    0000102C 26 00            [ 7]   93 	ld	h, #0x00
    0000102E 29               [11]   94 	add	hl, hl
    0000102F 29               [11]   95 	add	hl, hl
    00001030 29               [11]   96 	add	hl, hl
    00001031 29               [11]   97 	add	hl, hl
    00001032 19               [11]   98 	add	hl, de
    00001033 E3               [19]   99 	ex	(sp), hl
                                    100 ;src/lib/asic.c:28: for (u8 x = 0; x < (SPRITE_W >> 1); x++) {
    00001034 DD 36 FF 00      [19]  101 	ld	-1 (ix), #0x00
    00001038                        102 00104$:
    00001038 DD 7E FF         [19]  103 	ld	a, -1 (ix)
    0000103B D6 08            [ 7]  104 	sub	a, #0x08
    0000103D 30 2C            [12]  105 	jr	NC, 00108$
                                    106 ;src/lib/asic.c:29: u8 tmp = row[x];
    0000103F DD 7E FB         [19]  107 	ld	a, -5 (ix)
    00001042 DD 86 FF         [19]  108 	add	a, -1 (ix)
    00001045 4F               [ 4]  109 	ld	c, a
    00001046 DD 7E FC         [19]  110 	ld	a, -4 (ix)
    00001049 CE 00            [ 7]  111 	adc	a, #0x00
    0000104B 47               [ 4]  112 	ld	b, a
    0000104C 0A               [ 7]  113 	ld	a, (bc)
    0000104D DD 77 FD         [19]  114 	ld	-3 (ix), a
                                    115 ;src/lib/asic.c:30: row[x] = row[SPRITE_W - 1 - x];
    00001050 DD 6E FF         [19]  116 	ld	l, -1 (ix)
    00001053 3E 0F            [ 7]  117 	ld	a, #0x0f
    00001055 95               [ 4]  118 	sub	a, l
    00001056 DD 86 FB         [19]  119 	add	a, -5 (ix)
    00001059 6F               [ 4]  120 	ld	l, a
    0000105A 3E 00            [ 7]  121 	ld	a, #0x00
    0000105C DD 8E FC         [19]  122 	adc	a, -4 (ix)
    0000105F 67               [ 4]  123 	ld	h, a
    00001060 7E               [ 7]  124 	ld	a, (hl)
    00001061 02               [ 7]  125 	ld	(bc), a
                                    126 ;src/lib/asic.c:31: row[SPRITE_W - 1 - x] = tmp;
    00001062 DD 7E FD         [19]  127 	ld	a, -3 (ix)
    00001065 77               [ 7]  128 	ld	(hl), a
                                    129 ;src/lib/asic.c:28: for (u8 x = 0; x < (SPRITE_W >> 1); x++) {
    00001066 DD 34 FF         [23]  130 	inc	-1 (ix)
    00001069 18 CD            [12]  131 	jr	00104$
    0000106B                        132 00108$:
                                    133 ;src/lib/asic.c:25: for (u8 y = 0; y < SPRITE_H; y++) {
    0000106B DD 34 FE         [23]  134 	inc	-2 (ix)
    0000106E 18 B2            [12]  135 	jr	00107$
    00001070                        136 00109$:
                                    137 ;src/lib/asic.c:34: }
    00001070 DD F9            [10]  138 	ld	sp, ix
    00001072 DD E1            [14]  139 	pop	ix
    00001074 C9               [10]  140 	ret
                                    141 ;src/lib/asic.c:36: void a_set_hardware_sprite_palette(const u16 *palette) {
                                    142 ;	---------------------------------
                                    143 ; Function a_set_hardware_sprite_palette
                                    144 ; ---------------------------------
    00001075                        145 _a_set_hardware_sprite_palette::
                                    146 ;src/lib/asic.c:38: cpct_asicSetSpritePalette(palette, 16);
    00001075 11 10 00         [10]  147 	ld	de, #0x0010
                                    148 ;src/lib/asic.c:39: }
    00001078 C3 B4 2F         [10]  149 	jp	_cpct_asicSetSpritePalette
                                    150 ;src/lib/asic.c:41: void a_blank_hardware_sprite_palette(void) {
                                    151 ;	---------------------------------
                                    152 ; Function a_blank_hardware_sprite_palette
                                    153 ; ---------------------------------
    0000107B                        154 _a_blank_hardware_sprite_palette::
                                    155 ;src/lib/asic.c:43: for (u8 i = 0; i < 16; i++)
    0000107B 0E 00            [ 7]  156 	ld	c, #0x00
    0000107D                        157 00103$:
    0000107D 79               [ 4]  158 	ld	a, c
    0000107E D6 10            [ 7]  159 	sub	a, #0x10
    00001080 D0               [11]  160 	ret	NC
                                    161 ;src/lib/asic.c:44: cpct_asicSetSpritePalColour(i, 0xFFF);
    00001081 69               [ 4]  162 	ld	l, c
    00001082 26 00            [ 7]  163 	ld	h, #0x00
    00001084 C5               [11]  164 	push	bc
    00001085 11 FF 0F         [10]  165 	ld	de, #0x0fff
    00001088 CD 2D 30         [17]  166 	call	_cpct_asicSetSpritePalColour
    0000108B C1               [10]  167 	pop	bc
                                    168 ;src/lib/asic.c:43: for (u8 i = 0; i < 16; i++)
    0000108C 0C               [ 4]  169 	inc	c
                                    170 ;src/lib/asic.c:45: }
    0000108D 18 EE            [12]  171 	jr	00103$
                                    172 ;src/lib/asic.c:47: void a_load_roland_sprites(bool flip) {
                                    173 ;	---------------------------------
                                    174 ; Function a_load_roland_sprites
                                    175 ; ---------------------------------
    0000108F                        176 _a_load_roland_sprites::
    0000108F 47               [ 4]  177 	ld	b, a
                                    178 ;src/lib/asic.c:49: a_load_sprite_set(roland_sprites_data, NULL, 4, flip);
    00001090 0E 04            [ 7]  179 	ld	c, #0x04
    00001092 C5               [11]  180 	push	bc
    00001093 11 00 00         [10]  181 	ld	de, #0x0000
    00001096 21 EC 90         [10]  182 	ld	hl, #_roland_sprites_data
    00001099 CD 2A 11         [17]  183 	call	_a_load_sprite_set
                                    184 ;src/lib/asic.c:50: }
    0000109C C9               [10]  185 	ret
                                    186 ;src/lib/asic.c:52: void a_load_ghost_sprites(bool flip) {
                                    187 ;	---------------------------------
                                    188 ; Function a_load_ghost_sprites
                                    189 ; ---------------------------------
    0000109D                        190 _a_load_ghost_sprites::
    0000109D 47               [ 4]  191 	ld	b, a
                                    192 ;src/lib/asic.c:54: a_load_sprite_set(ghost_sprites_data, NULL, 9, flip);
    0000109E 0E 09            [ 7]  193 	ld	c, #0x09
    000010A0 C5               [11]  194 	push	bc
    000010A1 11 00 00         [10]  195 	ld	de, #0x0000
    000010A4 21 6C 91         [10]  196 	ld	hl, #_ghost_sprites_data
    000010A7 CD 2A 11         [17]  197 	call	_a_load_sprite_set
                                    198 ;src/lib/asic.c:55: }
    000010AA C9               [10]  199 	ret
                                    200 ;src/lib/asic.c:57: void a_load_spider_sprites(bool flip) {
                                    201 ;	---------------------------------
                                    202 ; Function a_load_spider_sprites
                                    203 ; ---------------------------------
    000010AB                        204 _a_load_spider_sprites::
    000010AB 47               [ 4]  205 	ld	b, a
                                    206 ;src/lib/asic.c:59: a_load_sprite_set(spider_sprites_data, NULL, 12, flip);
    000010AC 0E 0C            [ 7]  207 	ld	c, #0x0c
    000010AE C5               [11]  208 	push	bc
    000010AF 11 00 00         [10]  209 	ld	de, #0x0000
    000010B2 21 3C 91         [10]  210 	ld	hl, #_spider_sprites_data
    000010B5 CD 2A 11         [17]  211 	call	_a_load_sprite_set
                                    212 ;src/lib/asic.c:60: }
    000010B8 C9               [10]  213 	ret
                                    214 ;src/lib/asic.c:62: void a_load_snowball_sprites(bool flip) {
                                    215 ;	---------------------------------
                                    216 ; Function a_load_snowball_sprites
                                    217 ; ---------------------------------
    000010B9                        218 _a_load_snowball_sprites::
    000010B9 47               [ 4]  219 	ld	b, a
                                    220 ;src/lib/asic.c:64: a_load_sprite_set(snowball_sprites_data, NULL, 16, flip);
    000010BA 0E 10            [ 7]  221 	ld	c, #0x10
    000010BC C5               [11]  222 	push	bc
    000010BD 11 00 00         [10]  223 	ld	de, #0x0000
    000010C0 21 FC 90         [10]  224 	ld	hl, #_snowball_sprites_data
    000010C3 CD 2A 11         [17]  225 	call	_a_load_sprite_set
                                    226 ;src/lib/asic.c:65: }
    000010C6 C9               [10]  227 	ret
                                    228 ;src/lib/asic.c:67: void a_load_cpctelera_sprites(bool flip) {
                                    229 ;	---------------------------------
                                    230 ; Function a_load_cpctelera_sprites
                                    231 ; ---------------------------------
    000010C7                        232 _a_load_cpctelera_sprites::
    000010C7 47               [ 4]  233 	ld	b, a
                                    234 ;src/lib/asic.c:69: a_load_sprite_set(cpctelera_sprites_data, NULL, 16, flip);
    000010C8 0E 10            [ 7]  235 	ld	c, #0x10
    000010CA C5               [11]  236 	push	bc
    000010CB 11 00 00         [10]  237 	ld	de, #0x0000
    000010CE 21 E0 91         [10]  238 	ld	hl, #_cpctelera_sprites_data
    000010D1 CD 2A 11         [17]  239 	call	_a_load_sprite_set
                                    240 ;src/lib/asic.c:70: }
    000010D4 C9               [10]  241 	ret
                                    242 ;src/lib/asic.c:72: void a_load_hw_sprite(u8 hw_id, u8 frame, const sprite_data_t *sprite_table,
                                    243 ;	---------------------------------
                                    244 ; Function a_load_hw_sprite
                                    245 ; ---------------------------------
    000010D5                        246 _a_load_hw_sprite::
    000010D5 4F               [ 4]  247 	ld	c, a
    000010D6 45               [ 4]  248 	ld	b, l
                                    249 ;src/lib/asic.c:77: cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);
    000010D7 C5               [11]  250 	push	bc
    000010D8 21 00 01         [10]  251 	ld	hl, #0x0100
    000010DB E5               [11]  252 	push	hl
    000010DC AF               [ 4]  253 	xor	a, a
    000010DD F5               [11]  254 	push	af
    000010DE 33               [ 6]  255 	inc	sp
    000010DF 26 BF            [ 7]  256 	ld	h, #0xbf
    000010E1 CD 76 2F         [17]  257 	call	_cpct_memset
                                    258 ;src/lib/asic.c:79: cpct_waitVSYNCStart();
    000010E4 CD 59 30         [17]  259 	call	_cpct_waitVSYNCStart
                                    260 ;src/lib/asic.c:80: cpct_asicPageDisconnect();
    000010E7 CD DA 2D         [17]  261 	call	_cpct_asicPageDisconnect
    000010EA C1               [10]  262 	pop	bc
                                    263 ;src/lib/asic.c:81: cpct_zx7b_decrunch_s(dst_end, sprite_table[frame].end);
    000010EB 68               [ 4]  264 	ld	l, b
    000010EC 26 00            [ 7]  265 	ld	h, #0x00
    000010EE 29               [11]  266 	add	hl, hl
    000010EF 29               [11]  267 	add	hl, hl
    000010F0 7D               [ 4]  268 	ld	a, l
    000010F1 5C               [ 4]  269 	ld	e, h
    000010F2 21 02 00         [10]  270 	ld	hl, #2
    000010F5 39               [11]  271 	add	hl, sp
    000010F6 86               [ 7]  272 	add	a, (hl)
    000010F7 23               [ 6]  273 	inc	hl
    000010F8 47               [ 4]  274 	ld	b, a
    000010F9 7B               [ 4]  275 	ld	a, e
    000010FA 8E               [ 7]  276 	adc	a, (hl)
    000010FB 67               [ 4]  277 	ld	h, a
    000010FC 68               [ 4]  278 	ld	l, b
    000010FD 23               [ 6]  279 	inc	hl
    000010FE 23               [ 6]  280 	inc	hl
    000010FF 5E               [ 7]  281 	ld	e, (hl)
    00001100 23               [ 6]  282 	inc	hl
    00001101 56               [ 7]  283 	ld	d, (hl)
    00001102 C5               [11]  284 	push	bc
    00001103 21 FF BF         [10]  285 	ld	hl, #0xbfff
    00001106 CD 18 2F         [17]  286 	call	_cpct_zx7b_decrunch_s
                                    287 ;src/lib/asic.c:82: cpct_asicPageConnect();
    00001109 CD E0 2D         [17]  288 	call	_cpct_asicPageConnect
    0000110C C1               [10]  289 	pop	bc
                                    290 ;src/lib/asic.c:84: if (flip_horizontal)
    0000110D 21 04 00         [10]  291 	ld	hl, #4
    00001110 39               [11]  292 	add	hl, sp
    00001111 CB 46            [12]  293 	bit	0, (hl)
    00001113 28 08            [12]  294 	jr	Z, 00102$
                                    295 ;src/lib/asic.c:85: a_sprite_flip_horizontal_inplace(HW_SPRITE_BUFFER);
    00001115 C5               [11]  296 	push	bc
    00001116 21 00 BF         [10]  297 	ld	hl, #0xbf00
    00001119 CD 12 10         [17]  298 	call	_a_sprite_flip_horizontal_inplace
    0000111C C1               [10]  299 	pop	bc
    0000111D                        300 00102$:
                                    301 ;src/lib/asic.c:87: cpct_asicCopySpriteData(hw_id, HW_SPRITE_BUFFER);
    0000111D 26 00            [ 7]  302 	ld	h, #0x00
    0000111F 11 00 BF         [10]  303 	ld	de, #0xbf00
    00001122 69               [ 4]  304 	ld	l, c
    00001123 CD 03 2E         [17]  305 	call	_cpct_asicCopySpriteData
                                    306 ;src/lib/asic.c:88: }
    00001126 E1               [10]  307 	pop	hl
    00001127 F1               [10]  308 	pop	af
    00001128 33               [ 6]  309 	inc	sp
    00001129 E9               [ 4]  310 	jp	(hl)
                                    311 ;src/lib/asic.c:90: void a_load_sprite_set(const sprite_data_t *sprites,
                                    312 ;	---------------------------------
                                    313 ; Function a_load_sprite_set
                                    314 ; ---------------------------------
    0000112A                        315 _a_load_sprite_set::
    0000112A DD E5            [15]  316 	push	ix
    0000112C DD 21 00 00      [14]  317 	ld	ix,#0
    00001130 DD 39            [15]  318 	add	ix,sp
    00001132 F5               [11]  319 	push	af
    00001133 3B               [ 6]  320 	dec	sp
    00001134 E3               [19]  321 	ex	(sp), hl
                                    322 ;src/lib/asic.c:93: for (u8 i = 0; i < count; i++) {
    00001135 DD 36 FF 00      [19]  323 	ld	-1 (ix), #0x00
    00001139                        324 00106$:
    00001139 DD 7E FF         [19]  325 	ld	a, -1 (ix)
    0000113C DD 96 04         [19]  326 	sub	a, 4 (ix)
    0000113F 30 61            [12]  327 	jr	NC, 00108$
                                    328 ;src/lib/asic.c:95: if (layout) {
    00001141 7A               [ 4]  329 	ld	a, d
    00001142 B3               [ 4]  330 	or	a, e
    00001143 28 33            [12]  331 	jr	Z, 00102$
                                    332 ;src/lib/asic.c:96: const sprite_load_t *s = &layout[i];
    00001145 DD 6E FF         [19]  333 	ld	l, -1 (ix)
    00001148 26 00            [ 7]  334 	ld	h, #0x00
    0000114A 29               [11]  335 	add	hl, hl
    0000114B 19               [11]  336 	add	hl, de
                                    337 ;src/lib/asic.c:98: s->hw_id, s->frame, sprites, flip_horizontal);
    0000114C 4D               [ 4]  338 	ld	c,l
    0000114D 44               [ 4]  339 	ld	b,h
    0000114E 23               [ 6]  340 	inc	hl
    0000114F 6E               [ 7]  341 	ld	l, (hl)
    00001150 0A               [ 7]  342 	ld	a, (bc)
    00001151 C5               [11]  343 	push	bc
    00001152 D5               [11]  344 	push	de
    00001153 DD 66 05         [19]  345 	ld	h, 5 (ix)
    00001156 E5               [11]  346 	push	hl
    00001157 33               [ 6]  347 	inc	sp
    00001158 E5               [11]  348 	push	hl
    00001159 DD 6E FD         [19]  349 	ld	l, -3 (ix)
    0000115C DD 66 FE         [19]  350 	ld	h, -2 (ix)
    0000115F E3               [19]  351 	ex	(sp), hl
    00001160 CD D5 10         [17]  352 	call	_a_load_hw_sprite
    00001163 D1               [10]  353 	pop	de
    00001164 C1               [10]  354 	pop	bc
                                    355 ;src/lib/asic.c:99: cpct_asicSetSpriteZoom(s->hw_id, 2, 1);
    00001165 0A               [ 7]  356 	ld	a, (bc)
    00001166 26 00            [ 7]  357 	ld	h, #0x00
    00001168 D5               [11]  358 	push	de
    00001169 06 01            [ 7]  359 	ld	b, #0x01
    0000116B C5               [11]  360 	push	bc
    0000116C 33               [ 6]  361 	inc	sp
    0000116D 06 02            [ 7]  362 	ld	b, #0x02
    0000116F C5               [11]  363 	push	bc
    00001170 33               [ 6]  364 	inc	sp
    00001171 6F               [ 4]  365 	ld	l, a
    00001172 CD E6 2D         [17]  366 	call	_cpct_asicSetSpriteZoom
    00001175 D1               [10]  367 	pop	de
    00001176 18 25            [12]  368 	jr	00107$
    00001178                        369 00102$:
                                    370 ;src/lib/asic.c:101: a_load_hw_sprite(i, i, sprites, flip_horizontal);
    00001178 D5               [11]  371 	push	de
    00001179 DD 7E 05         [19]  372 	ld	a, 5 (ix)
    0000117C F5               [11]  373 	push	af
    0000117D 33               [ 6]  374 	inc	sp
    0000117E DD 6E FD         [19]  375 	ld	l, -3 (ix)
    00001181 DD 66 FE         [19]  376 	ld	h, -2 (ix)
    00001184 E5               [11]  377 	push	hl
    00001185 DD 6E FF         [19]  378 	ld	l, -1 (ix)
    00001188 DD 7E FF         [19]  379 	ld	a, -1 (ix)
    0000118B CD D5 10         [17]  380 	call	_a_load_hw_sprite
    0000118E D1               [10]  381 	pop	de
                                    382 ;src/lib/asic.c:102: cpct_asicSetSpriteZoom(i, 2, 1);
    0000118F DD 6E FF         [19]  383 	ld	l, -1 (ix)
    00001192 26 00            [ 7]  384 	ld	h, #0x00
    00001194 D5               [11]  385 	push	de
    00001195 11 02 01         [10]  386 	ld	de, #0x102
    00001198 D5               [11]  387 	push	de
    00001199 CD E6 2D         [17]  388 	call	_cpct_asicSetSpriteZoom
    0000119C D1               [10]  389 	pop	de
    0000119D                        390 00107$:
                                    391 ;src/lib/asic.c:93: for (u8 i = 0; i < count; i++) {
    0000119D DD 34 FF         [23]  392 	inc	-1 (ix)
    000011A0 18 97            [12]  393 	jr	00106$
    000011A2                        394 00108$:
                                    395 ;src/lib/asic.c:105: }
    000011A2 DD F9            [10]  396 	ld	sp, ix
    000011A4 DD E1            [14]  397 	pop	ix
    000011A6 E1               [10]  398 	pop	hl
    000011A7 F1               [10]  399 	pop	af
    000011A8 E9               [ 4]  400 	jp	(hl)
                                    401 ;src/lib/asic.c:107: void a_clear_sprites(void) {
                                    402 ;	---------------------------------
                                    403 ; Function a_clear_sprites
                                    404 ; ---------------------------------
    000011A9                        405 _a_clear_sprites::
                                    406 ;src/lib/asic.c:109: for (u8 i = 0; i < 16; i++) {
    000011A9 0E 00            [ 7]  407 	ld	c, #0x00
    000011AB                        408 00103$:
    000011AB 79               [ 4]  409 	ld	a, c
    000011AC D6 10            [ 7]  410 	sub	a, #0x10
    000011AE D0               [11]  411 	ret	NC
                                    412 ;src/lib/asic.c:110: cpct_asicSetSpriteZoom(i, 0, 0);
    000011AF 69               [ 4]  413 	ld	l, c
    000011B0 26 00            [ 7]  414 	ld	h, #0x00
    000011B2 E5               [11]  415 	push	hl
    000011B3 C5               [11]  416 	push	bc
    000011B4 11 00 00         [10]  417 	ld	de, #0x00
    000011B7 D5               [11]  418 	push	de
    000011B8 CD E6 2D         [17]  419 	call	_cpct_asicSetSpriteZoom
    000011BB C1               [10]  420 	pop	bc
    000011BC E1               [10]  421 	pop	hl
                                    422 ;src/lib/asic.c:111: cpct_asicSetSpritePosition(i, -64, -64);
    000011BD C5               [11]  423 	push	bc
    000011BE 11 C0 FF         [10]  424 	ld	de, #0xffc0
    000011C1 D5               [11]  425 	push	de
    000011C2 CD 07 1F         [17]  426 	call	_cpct_asicSetSpritePosition
    000011C5 C1               [10]  427 	pop	bc
                                    428 ;src/lib/asic.c:109: for (u8 i = 0; i < 16; i++) {
    000011C6 0C               [ 4]  429 	inc	c
                                    430 ;src/lib/asic.c:113: }
    000011C7 18 E2            [12]  431 	jr	00103$
                                    432 ;src/lib/asic.c:115: void a_load_sprite_range(u8 slot_start, const u8 *const *sprites, u8 count) {
                                    433 ;	---------------------------------
                                    434 ; Function a_load_sprite_range
                                    435 ; ---------------------------------
    000011C9                        436 _a_load_sprite_range::
    000011C9 CD AA 2F         [17]  437 	call	___sdcc_enter_ix
    000011CC F5               [11]  438 	push	af
    000011CD F5               [11]  439 	push	af
    000011CE DD 77 FE         [19]  440 	ld	-2 (ix), a
    000011D1 33               [ 6]  441 	inc	sp
    000011D2 33               [ 6]  442 	inc	sp
    000011D3 D5               [11]  443 	push	de
                                    444 ;src/lib/asic.c:117: for (u8 i = 0; i < count; i++) {
    000011D4 DD 36 FF 00      [19]  445 	ld	-1 (ix), #0x00
    000011D8                        446 00103$:
    000011D8 DD 7E FF         [19]  447 	ld	a, -1 (ix)
    000011DB DD 96 04         [19]  448 	sub	a, 4 (ix)
    000011DE 30 25            [12]  449 	jr	NC, 00105$
                                    450 ;src/lib/asic.c:118: cpct_asicCopySpriteData(slot_start + i, sprites[i]);
    000011E0 DD 4E FF         [19]  451 	ld	c, -1 (ix)
    000011E3 06 00            [ 7]  452 	ld	b, #0x00
    000011E5 69               [ 4]  453 	ld	l, c
    000011E6 60               [ 4]  454 	ld	h, b
    000011E7 29               [11]  455 	add	hl, hl
    000011E8 D1               [10]  456 	pop	de
    000011E9 D5               [11]  457 	push	de
    000011EA 19               [11]  458 	add	hl, de
    000011EB 5E               [ 7]  459 	ld	e, (hl)
    000011EC 23               [ 6]  460 	inc	hl
    000011ED 56               [ 7]  461 	ld	d, (hl)
    000011EE DD 6E FE         [19]  462 	ld	l, -2 (ix)
    000011F1 26 00            [ 7]  463 	ld	h, #0x00
    000011F3 09               [11]  464 	add	hl, bc
    000011F4 E5               [11]  465 	push	hl
    000011F5 CD 03 2E         [17]  466 	call	_cpct_asicCopySpriteData
    000011F8 E1               [10]  467 	pop	hl
                                    468 ;src/lib/asic.c:119: cpct_asicSetSpriteZoom(slot_start + i, 2, 1);
    000011F9 11 02 01         [10]  469 	ld	de, #0x102
    000011FC D5               [11]  470 	push	de
    000011FD CD E6 2D         [17]  471 	call	_cpct_asicSetSpriteZoom
                                    472 ;src/lib/asic.c:117: for (u8 i = 0; i < count; i++) {
    00001200 DD 34 FF         [23]  473 	inc	-1 (ix)
    00001203 18 D3            [12]  474 	jr	00103$
    00001205                        475 00105$:
                                    476 ;src/lib/asic.c:121: }
    00001205 DD F9            [10]  477 	ld	sp, ix
    00001207 DD E1            [14]  478 	pop	ix
    00001209 E1               [10]  479 	pop	hl
    0000120A 33               [ 6]  480 	inc	sp
    0000120B E9               [ 4]  481 	jp	(hl)
                                    482 ;src/lib/asic.c:123: void a_hide_sprite_range(u8 slot_start, u8 count) {
                                    483 ;	---------------------------------
                                    484 ; Function a_hide_sprite_range
                                    485 ; ---------------------------------
    0000120C                        486 _a_hide_sprite_range::
    0000120C DD E5            [15]  487 	push	ix
    0000120E DD 21 00 00      [14]  488 	ld	ix,#0
    00001212 DD 39            [15]  489 	add	ix,sp
    00001214 3B               [ 6]  490 	dec	sp
    00001215 DD 77 FF         [19]  491 	ld	-1 (ix), a
    00001218 4D               [ 4]  492 	ld	c, l
                                    493 ;src/lib/asic.c:125: for (u8 i = 0; i < count; i++) {
    00001219 06 00            [ 7]  494 	ld	b, #0x00
    0000121B                        495 00103$:
    0000121B 78               [ 4]  496 	ld	a, b
    0000121C 91               [ 4]  497 	sub	a, c
    0000121D 30 15            [12]  498 	jr	NC, 00105$
                                    499 ;src/lib/asic.c:126: cpct_asicSetSpriteZoom(slot_start + i, 0, 0);
    0000121F DD 5E FF         [19]  500 	ld	e, -1 (ix)
    00001222 16 00            [ 7]  501 	ld	d, #0x00
    00001224 68               [ 4]  502 	ld	l, b
    00001225 26 00            [ 7]  503 	ld	h, #0x00
    00001227 19               [11]  504 	add	hl, de
    00001228 C5               [11]  505 	push	bc
    00001229 11 00 00         [10]  506 	ld	de, #0x00
    0000122C D5               [11]  507 	push	de
    0000122D CD E6 2D         [17]  508 	call	_cpct_asicSetSpriteZoom
    00001230 C1               [10]  509 	pop	bc
                                    510 ;src/lib/asic.c:125: for (u8 i = 0; i < count; i++) {
    00001231 04               [ 4]  511 	inc	b
    00001232 18 E7            [12]  512 	jr	00103$
    00001234                        513 00105$:
                                    514 ;src/lib/asic.c:128: }
    00001234 33               [ 6]  515 	inc	sp
    00001235 DD E1            [14]  516 	pop	ix
    00001237 C9               [10]  517 	ret
                                    518 ;src/lib/asic.c:130: void a_clear_all_sprites(void) {
                                    519 ;	---------------------------------
                                    520 ; Function a_clear_all_sprites
                                    521 ; ---------------------------------
    00001238                        522 _a_clear_all_sprites::
                                    523 ;src/lib/asic.c:132: for (u8 i = 0; i < 16; i++) {
    00001238 0E 00            [ 7]  524 	ld	c, #0x00
    0000123A                        525 00103$:
    0000123A 79               [ 4]  526 	ld	a, c
    0000123B D6 10            [ 7]  527 	sub	a, #0x10
    0000123D D0               [11]  528 	ret	NC
                                    529 ;src/lib/asic.c:133: cpct_asicSetSpriteZoom(i, 0, 0);
    0000123E 69               [ 4]  530 	ld	l, c
    0000123F 26 00            [ 7]  531 	ld	h, #0x00
    00001241 E5               [11]  532 	push	hl
    00001242 C5               [11]  533 	push	bc
    00001243 11 00 00         [10]  534 	ld	de, #0x00
    00001246 D5               [11]  535 	push	de
    00001247 CD E6 2D         [17]  536 	call	_cpct_asicSetSpriteZoom
    0000124A C1               [10]  537 	pop	bc
    0000124B E1               [10]  538 	pop	hl
                                    539 ;src/lib/asic.c:134: cpct_asicSetSpritePosition(i, -64, -64);
    0000124C C5               [11]  540 	push	bc
    0000124D 11 C0 FF         [10]  541 	ld	de, #0xffc0
    00001250 D5               [11]  542 	push	de
    00001251 CD 07 1F         [17]  543 	call	_cpct_asicSetSpritePosition
    00001254 C1               [10]  544 	pop	bc
                                    545 ;src/lib/asic.c:132: for (u8 i = 0; i < 16; i++) {
    00001255 0C               [ 4]  546 	inc	c
                                    547 ;src/lib/asic.c:136: }
    00001256 18 E2            [12]  548 	jr	00103$
                                    549 ;src/lib/asic.c:138: void a_show_sprite(u8 slot) {
                                    550 ;	---------------------------------
                                    551 ; Function a_show_sprite
                                    552 ; ---------------------------------
    00001258                        553 _a_show_sprite::
                                    554 ;src/lib/asic.c:140: cpct_asicSetSpriteZoom(slot, 2, 1);
    00001258 26 00            [ 7]  555 	ld	h, #0x00
    0000125A 16 01            [ 7]  556 	ld	d, #0x01
    0000125C D5               [11]  557 	push	de
    0000125D 33               [ 6]  558 	inc	sp
    0000125E 16 02            [ 7]  559 	ld	d, #0x02
    00001260 D5               [11]  560 	push	de
    00001261 33               [ 6]  561 	inc	sp
    00001262 6F               [ 4]  562 	ld	l, a
    00001263 CD E6 2D         [17]  563 	call	_cpct_asicSetSpriteZoom
                                    564 ;src/lib/asic.c:141: }
    00001266 C9               [10]  565 	ret
                                    566 ;src/lib/asic.c:143: void a_hide_sprite(u8 slot) {
                                    567 ;	---------------------------------
                                    568 ; Function a_hide_sprite
                                    569 ; ---------------------------------
    00001267                        570 _a_hide_sprite::
                                    571 ;src/lib/asic.c:145: cpct_asicSetSpriteZoom(slot, 0, 0);
    00001267 6F               [ 4]  572 	ld	l, a
    00001268 26 00            [ 7]  573 	ld	h, #0x00
    0000126A 11 00 00         [10]  574 	ld	de, #0x00
    0000126D D5               [11]  575 	push	de
    0000126E CD E6 2D         [17]  576 	call	_cpct_asicSetSpriteZoom
                                    577 ;src/lib/asic.c:146: }
    00001271 C9               [10]  578 	ret
                                    579 ;src/lib/asic.c:148: void a_set_sprite_zoom_range(u8 slot_start, u8 zoom_x, u8 zoom_y, u8 count) {
                                    580 ;	---------------------------------
                                    581 ; Function a_set_sprite_zoom_range
                                    582 ; ---------------------------------
    00001272                        583 _a_set_sprite_zoom_range::
    00001272 DD E5            [15]  584 	push	ix
    00001274 DD 21 00 00      [14]  585 	ld	ix,#0
    00001278 DD 39            [15]  586 	add	ix,sp
    0000127A 3B               [ 6]  587 	dec	sp
    0000127B DD 77 FF         [19]  588 	ld	-1 (ix), a
    0000127E 45               [ 4]  589 	ld	b, l
                                    590 ;src/lib/asic.c:150: for (u8 i = 0; i < count; i++)
    0000127F 0E 00            [ 7]  591 	ld	c, #0x00
    00001281                        592 00103$:
    00001281 79               [ 4]  593 	ld	a, c
    00001282 DD 96 05         [19]  594 	sub	a, 5 (ix)
    00001285 30 18            [12]  595 	jr	NC, 00105$
                                    596 ;src/lib/asic.c:151: cpct_asicSetSpriteZoom(slot_start + i, zoom_x, zoom_y);
    00001287 DD 5E FF         [19]  597 	ld	e, -1 (ix)
    0000128A 16 00            [ 7]  598 	ld	d, #0x00
    0000128C 69               [ 4]  599 	ld	l, c
    0000128D 26 00            [ 7]  600 	ld	h, #0x00
    0000128F 19               [11]  601 	add	hl, de
    00001290 C5               [11]  602 	push	bc
    00001291 DD 7E 04         [19]  603 	ld	a, 4 (ix)
    00001294 F5               [11]  604 	push	af
    00001295 33               [ 6]  605 	inc	sp
    00001296 C5               [11]  606 	push	bc
    00001297 33               [ 6]  607 	inc	sp
    00001298 CD E6 2D         [17]  608 	call	_cpct_asicSetSpriteZoom
    0000129B C1               [10]  609 	pop	bc
                                    610 ;src/lib/asic.c:150: for (u8 i = 0; i < count; i++)
    0000129C 0C               [ 4]  611 	inc	c
    0000129D 18 E2            [12]  612 	jr	00103$
    0000129F                        613 00105$:
                                    614 ;src/lib/asic.c:152: }
    0000129F 33               [ 6]  615 	inc	sp
    000012A0 DD E1            [14]  616 	pop	ix
    000012A2 E1               [10]  617 	pop	hl
    000012A3 F1               [10]  618 	pop	af
    000012A4 E9               [ 4]  619 	jp	(hl)
                                    620 ;src/lib/asic.c:154: void a_page_connect_safe(void) {
                                    621 ;	---------------------------------
                                    622 ; Function a_page_connect_safe
                                    623 ; ---------------------------------
    000012A5                        624 _a_page_connect_safe::
                                    625 ;src/lib/asic.c:156: if (!a_asic_paged) {
    000012A5 21 69 93         [10]  626 	ld	hl, #_a_asic_paged
    000012A8 CB 46            [12]  627 	bit	0, (hl)
    000012AA C0               [11]  628 	ret	NZ
                                    629 ;src/lib/asic.c:157: cpct_asicPageConnect();
    000012AB CD E0 2D         [17]  630 	call	_cpct_asicPageConnect
                                    631 ;src/lib/asic.c:158: a_asic_paged = true;
    000012AE 21 69 93         [10]  632 	ld	hl, #_a_asic_paged
    000012B1 36 01            [10]  633 	ld	(hl), #0x01
                                    634 ;src/lib/asic.c:160: }
    000012B3 C9               [10]  635 	ret
                                    636 ;src/lib/asic.c:162: void a_page_disconnect_safe(void) {
                                    637 ;	---------------------------------
                                    638 ; Function a_page_disconnect_safe
                                    639 ; ---------------------------------
    000012B4                        640 _a_page_disconnect_safe::
                                    641 ;src/lib/asic.c:164: if (a_asic_paged) {
    000012B4 21 69 93         [10]  642 	ld	hl, #_a_asic_paged
    000012B7 CB 46            [12]  643 	bit	0, (hl)
    000012B9 C8               [11]  644 	ret	Z
                                    645 ;src/lib/asic.c:165: cpct_asicPageDisconnect();
    000012BA CD DA 2D         [17]  646 	call	_cpct_asicPageDisconnect
                                    647 ;src/lib/asic.c:166: a_asic_paged = false;
    000012BD AF               [ 4]  648 	xor	a, a
    000012BE 32 69 93         [13]  649 	ld	(_a_asic_paged+0), a
                                    650 ;src/lib/asic.c:168: }
    000012C1 C9               [10]  651 	ret
                                    652 	.area _CODE
                                    653 	.area _INITIALIZER
    00009399                        654 __xinit__a_asic_paged:
    00009399 00                     655 	.db #0x00	;  0
                                    656 	.area _CABS (ABS)
