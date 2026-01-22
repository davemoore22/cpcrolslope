                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module video
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cpct_asicSetPalette
                                     12 	.globl _cpct_asicSetBorder
                                     13 	.globl _cpct_asicSetSpriteZoom
                                     14 	.globl _cpct_asicSetSpritePosition
                                     15 	.globl _cpct_setPALColour
                                     16 	.globl _cpct_setPalette
                                     17 	.globl _cpct_waitVSYNCStart
                                     18 	.globl _cpct_waitVSYNC
                                     19 	.globl _cpct_memset_f64
                                     20 	.globl _v_blank_screen_no_asic
                                     21 	.globl _v_blank_screen_mode_1
                                     22 	.globl _v_clear_screen
                                     23 	.globl _v_set_intro_ghost_sprite_pos
                                     24 	.globl _v_set_intro_roland_sprite_pos
                                     25 	.globl _v_set_title_roland_sprite_pos
                                     26 	.globl _v_set_made_cpctelera_sprite_pos
                                     27 	.globl _v_set_intro_spider_sprite_pos
                                     28 	.globl _v_set_intro_snowball_sprite_pos
                                     29 	.globl _v_spider_set_frame
                                     30 	.globl _v_snowball_set_frame
                                     31 ;--------------------------------------------------------
                                     32 ; special function registers
                                     33 ;--------------------------------------------------------
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area _DATA
                                     38 ;--------------------------------------------------------
                                     39 ; ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area _INITIALIZED
    0000936E                         42 _v_pixel_scroll:
    0000936E                         43 	.ds 1
    0000936F                         44 _v_char_scroll:
    0000936F                         45 	.ds 2
    00009371                         46 _last_frame:
    00009371                         47 	.ds 1
                                     48 ;--------------------------------------------------------
                                     49 ; absolute external ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area _DABS (ABS)
                                     52 ;--------------------------------------------------------
                                     53 ; global & static initialisations
                                     54 ;--------------------------------------------------------
                                     55 	.area _HOME
                                     56 	.area _GSINIT
                                     57 	.area _GSFINAL
                                     58 	.area _GSINIT
                                     59 ;--------------------------------------------------------
                                     60 ; Home
                                     61 ;--------------------------------------------------------
                                     62 	.area _HOME
                                     63 	.area _HOME
                                     64 ;--------------------------------------------------------
                                     65 ; code
                                     66 ;--------------------------------------------------------
                                     67 	.area _CODE
                                     68 ;src/lib/video.c:24: void v_blank_screen_no_asic(void) {
                                     69 ;	---------------------------------
                                     70 ; Function v_blank_screen_no_asic
                                     71 ; ---------------------------------
    0000162F                         72 _v_blank_screen_no_asic::
                                     73 ;src/lib/video.c:29: cpct_setPalette(black_palette, 4);
    0000162F 11 04 00         [10]   74 	ld	de, #0x0004
    00001632 21 3F 16         [10]   75 	ld	hl, #_v_blank_screen_no_asic_black_palette_10000_256
    00001635 CD 84 2C         [17]   76 	call	_cpct_setPalette
                                     77 ;src/lib/video.c:30: cpct_setBorder(HW_BLACK);
    00001638 2E 14            [ 7]   78 	ld	l, #0x14
    0000163A 3E 10            [ 7]   79 	ld	a, #0x10
                                     80 ;src/lib/video.c:31: }
    0000163C C3 1E 2D         [10]   81 	jp	_cpct_setPALColour
    0000163F                         82 _v_blank_screen_no_asic_black_palette_10000_256:
    0000163F 14 00                   83 	.dw #0x0014
    00001641 14 00                   84 	.dw #0x0014
    00001643 14 00                   85 	.dw #0x0014
    00001645 14 00                   86 	.dw #0x0014
                                     87 ;src/lib/video.c:34: void v_blank_screen_mode_1(void) {
                                     88 ;	---------------------------------
                                     89 ; Function v_blank_screen_mode_1
                                     90 ; ---------------------------------
    00001647                         91 _v_blank_screen_mode_1::
                                     92 ;src/lib/video.c:40: cpct_waitVSYNC();
    00001647 CD 67 2F         [17]   93 	call	_cpct_waitVSYNC
                                     94 ;src/lib/video.c:41: cpct_asicSetPalette(palette, 4);
    0000164A 11 04 00         [10]   95 	ld	de, #0x0004
    0000164D 21 59 16         [10]   96 	ld	hl, #_v_blank_screen_mode_1_palette_10000_258
    00001650 CD 0D 2D         [17]   97 	call	_cpct_asicSetPalette
                                     98 ;src/lib/video.c:42: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
    00001653 21 FF 0F         [10]   99 	ld	hl, #0x0fff
                                    100 ;src/lib/video.c:43: }
    00001656 C3 FA 2D         [10]  101 	jp	_cpct_asicSetBorder
    00001659                        102 _v_blank_screen_mode_1_palette_10000_258:
    00001659 FF 0F                  103 	.dw #0x0fff
    0000165B FF 0F                  104 	.dw #0x0fff
    0000165D FF 0F                  105 	.dw #0x0fff
    0000165F FF 0F                  106 	.dw #0x0fff
                                    107 ;src/lib/video.c:46: void v_clear_screen(void) {
                                    108 ;	---------------------------------
                                    109 ; Function v_clear_screen
                                    110 ; ---------------------------------
    00001661                        111 _v_clear_screen::
                                    112 ;src/lib/video.c:48: cpct_waitVSYNCStart();
    00001661 CD 59 30         [17]  113 	call	_cpct_waitVSYNCStart
                                    114 ;src/lib/video.c:49: cpct_clearScreen_f64(0);
    00001664 21 00 40         [10]  115 	ld	hl, #0x4000
    00001667 E5               [11]  116 	push	hl
    00001668 11 00 00         [10]  117 	ld	de, #0x0000
    0000166B 26 C0            [ 7]  118 	ld	h, #0xc0
    0000166D CD 3C 2E         [17]  119 	call	_cpct_memset_f64
                                    120 ;src/lib/video.c:50: }
    00001670 C9               [10]  121 	ret
                                    122 ;src/lib/video.c:116: void v_set_intro_ghost_sprite_pos(i16 x_m2, i16 y, bool reversed) {
                                    123 ;	---------------------------------
                                    124 ; Function v_set_intro_ghost_sprite_pos
                                    125 ; ---------------------------------
    00001671                        126 _v_set_intro_ghost_sprite_pos::
    00001671 DD E5            [15]  127 	push	ix
    00001673 DD 21 00 00      [14]  128 	ld	ix,#0
    00001677 DD 39            [15]  129 	add	ix,sp
    00001679 F5               [11]  130 	push	af
    0000167A F5               [11]  131 	push	af
    0000167B 3B               [ 6]  132 	dec	sp
    0000167C DD 75 FE         [19]  133 	ld	-2 (ix), l
    0000167F DD 74 FF         [19]  134 	ld	-1 (ix), h
                                    135 ;src/lib/video.c:120: y += g_ghost_bob.y_off;
    00001682 3A 55 93         [13]  136 	ld	a, (#(_g_ghost_bob + 1) + 0)
    00001685 6F               [ 4]  137 	ld	l, a
    00001686 07               [ 4]  138 	rlca
    00001687 9F               [ 4]  139 	sbc	a, a
    00001688 67               [ 4]  140 	ld	h, a
    00001689 19               [11]  141 	add	hl, de
    0000168A DD 75 FC         [19]  142 	ld	-4 (ix), l
    0000168D DD 74 FD         [19]  143 	ld	-3 (ix), h
                                    144 ;src/lib/video.c:122: for (u8 row = 0; row < 3; row++) {
    00001690 0E 00            [ 7]  145 	ld	c, #0x00
    00001692                        146 00107$:
    00001692 79               [ 4]  147 	ld	a, c
    00001693 D6 03            [ 7]  148 	sub	a, #0x03
    00001695 30 54            [12]  149 	jr	NC, 00109$
                                    150 ;src/lib/video.c:123: for (u8 col = 0; col < 3; col++) {
    00001697 06 00            [ 7]  151 	ld	b, #0x00
    00001699                        152 00104$:
    00001699 78               [ 4]  153 	ld	a, b
    0000169A D6 03            [ 7]  154 	sub	a, #0x03
    0000169C 30 4A            [12]  155 	jr	NC, 00108$
                                    156 ;src/lib/video.c:125: u8 tile_col = reversed ? (2 - col) : col;
    0000169E DD CB 04 46      [20]  157 	bit	0, 4 (ix)
    000016A2 28 07            [12]  158 	jr	Z, 00111$
    000016A4 58               [ 4]  159 	ld	e, b
    000016A5 3E 02            [ 7]  160 	ld	a, #0x02
    000016A7 93               [ 4]  161 	sub	a, e
    000016A8 57               [ 4]  162 	ld	d, a
    000016A9 18 01            [12]  163 	jr	00112$
    000016AB                        164 00111$:
    000016AB 50               [ 4]  165 	ld	d, b
    000016AC                        166 00112$:
                                    167 ;src/lib/video.c:126: u8 spr_idx = (row * 3) + tile_col;
    000016AC 79               [ 4]  168 	ld	a, c
    000016AD 5F               [ 4]  169 	ld	e, a
    000016AE 87               [ 4]  170 	add	a, a
    000016AF 83               [ 4]  171 	add	a, e
    000016B0 5A               [ 4]  172 	ld	e, d
    000016B1 83               [ 4]  173 	add	a, e
    000016B2 DD 77 FB         [19]  174 	ld	-5 (ix), a
                                    175 ;src/lib/video.c:129: spr_idx, x_m2 + (col << 5), y + (row << 4));
    000016B5 69               [ 4]  176 	ld	l, c
    000016B6 26 00            [ 7]  177 	ld	h, #0x00
    000016B8 29               [11]  178 	add	hl, hl
    000016B9 29               [11]  179 	add	hl, hl
    000016BA 29               [11]  180 	add	hl, hl
    000016BB 29               [11]  181 	add	hl, hl
    000016BC E5               [11]  182 	push	hl
    000016BD FD E1            [14]  183 	pop	iy
    000016BF DD 5E FC         [19]  184 	ld	e, -4 (ix)
    000016C2 DD 56 FD         [19]  185 	ld	d, -3 (ix)
    000016C5 FD 19            [15]  186 	add	iy, de
    000016C7 68               [ 4]  187 	ld	l, b
    000016C8 26 00            [ 7]  188 	ld	h, #0x00
    000016CA 29               [11]  189 	add	hl, hl
    000016CB 29               [11]  190 	add	hl, hl
    000016CC 29               [11]  191 	add	hl, hl
    000016CD 29               [11]  192 	add	hl, hl
    000016CE 29               [11]  193 	add	hl, hl
    000016CF 7D               [ 4]  194 	ld	a, l
    000016D0 DD 86 FE         [19]  195 	add	a, -2 (ix)
    000016D3 5F               [ 4]  196 	ld	e, a
    000016D4 7C               [ 4]  197 	ld	a, h
    000016D5 DD 8E FF         [19]  198 	adc	a, -1 (ix)
    000016D8 57               [ 4]  199 	ld	d, a
    000016D9 DD 6E FB         [19]  200 	ld	l, -5 (ix)
    000016DC 26 00            [ 7]  201 	ld	h, #0x00
    000016DE C5               [11]  202 	push	bc
    000016DF FD E5            [15]  203 	push	iy
    000016E1 CD 07 1F         [17]  204 	call	_cpct_asicSetSpritePosition
    000016E4 C1               [10]  205 	pop	bc
                                    206 ;src/lib/video.c:123: for (u8 col = 0; col < 3; col++) {
    000016E5 04               [ 4]  207 	inc	b
    000016E6 18 B1            [12]  208 	jr	00104$
    000016E8                        209 00108$:
                                    210 ;src/lib/video.c:122: for (u8 row = 0; row < 3; row++) {
    000016E8 0C               [ 4]  211 	inc	c
    000016E9 18 A7            [12]  212 	jr	00107$
    000016EB                        213 00109$:
                                    214 ;src/lib/video.c:132: }
    000016EB DD F9            [10]  215 	ld	sp, ix
    000016ED DD E1            [14]  216 	pop	ix
    000016EF E1               [10]  217 	pop	hl
    000016F0 33               [ 6]  218 	inc	sp
    000016F1 E9               [ 4]  219 	jp	(hl)
                                    220 ;src/lib/video.c:134: void v_set_intro_roland_sprite_pos(i16 x_m2, i16 y, bool reversed) {
                                    221 ;	---------------------------------
                                    222 ; Function v_set_intro_roland_sprite_pos
                                    223 ; ---------------------------------
    000016F2                        224 _v_set_intro_roland_sprite_pos::
    000016F2 DD E5            [15]  225 	push	ix
    000016F4 DD 21 00 00      [14]  226 	ld	ix,#0
    000016F8 DD 39            [15]  227 	add	ix,sp
    000016FA F5               [11]  228 	push	af
    000016FB F5               [11]  229 	push	af
    000016FC 3B               [ 6]  230 	dec	sp
    000016FD DD 75 FE         [19]  231 	ld	-2 (ix), l
    00001700 DD 74 FF         [19]  232 	ld	-1 (ix), h
    00001703 DD 73 FC         [19]  233 	ld	-4 (ix), e
    00001706 DD 72 FD         [19]  234 	ld	-3 (ix), d
                                    235 ;src/lib/video.c:136: for (u8 row = 0; row < 2; row++) {
    00001709 0E 00            [ 7]  236 	ld	c, #0x00
    0000170B                        237 00107$:
    0000170B 79               [ 4]  238 	ld	a, c
    0000170C D6 02            [ 7]  239 	sub	a, #0x02
    0000170E 30 51            [12]  240 	jr	NC, 00109$
                                    241 ;src/lib/video.c:137: for (u8 col = 0; col < 2; col++) {
    00001710 06 00            [ 7]  242 	ld	b, #0x00
    00001712                        243 00104$:
    00001712 78               [ 4]  244 	ld	a, b
    00001713 D6 02            [ 7]  245 	sub	a, #0x02
    00001715 30 47            [12]  246 	jr	NC, 00108$
                                    247 ;src/lib/video.c:139: u8 tile_col = reversed ? (1 - col) : col;
    00001717 DD CB 04 46      [20]  248 	bit	0, 4 (ix)
    0000171B 28 07            [12]  249 	jr	Z, 00111$
    0000171D 58               [ 4]  250 	ld	e, b
    0000171E 3E 01            [ 7]  251 	ld	a, #0x01
    00001720 93               [ 4]  252 	sub	a, e
    00001721 5F               [ 4]  253 	ld	e, a
    00001722 18 01            [12]  254 	jr	00112$
    00001724                        255 00111$:
    00001724 58               [ 4]  256 	ld	e, b
    00001725                        257 00112$:
                                    258 ;src/lib/video.c:140: u8 spr_idx = (row * 2) + tile_col;
    00001725 79               [ 4]  259 	ld	a, c
    00001726 87               [ 4]  260 	add	a, a
    00001727 83               [ 4]  261 	add	a, e
    00001728 DD 77 FB         [19]  262 	ld	-5 (ix), a
                                    263 ;src/lib/video.c:143: spr_idx, x_m2 + (col << 5), y + (row << 4));
    0000172B 69               [ 4]  264 	ld	l, c
    0000172C 26 00            [ 7]  265 	ld	h, #0x00
    0000172E 29               [11]  266 	add	hl, hl
    0000172F 29               [11]  267 	add	hl, hl
    00001730 29               [11]  268 	add	hl, hl
    00001731 29               [11]  269 	add	hl, hl
    00001732 E5               [11]  270 	push	hl
    00001733 FD E1            [14]  271 	pop	iy
    00001735 DD 5E FC         [19]  272 	ld	e, -4 (ix)
    00001738 DD 56 FD         [19]  273 	ld	d, -3 (ix)
    0000173B FD 19            [15]  274 	add	iy, de
    0000173D 68               [ 4]  275 	ld	l, b
    0000173E 26 00            [ 7]  276 	ld	h, #0x00
    00001740 29               [11]  277 	add	hl, hl
    00001741 29               [11]  278 	add	hl, hl
    00001742 29               [11]  279 	add	hl, hl
    00001743 29               [11]  280 	add	hl, hl
    00001744 29               [11]  281 	add	hl, hl
    00001745 7D               [ 4]  282 	ld	a, l
    00001746 DD 86 FE         [19]  283 	add	a, -2 (ix)
    00001749 5F               [ 4]  284 	ld	e, a
    0000174A 7C               [ 4]  285 	ld	a, h
    0000174B DD 8E FF         [19]  286 	adc	a, -1 (ix)
    0000174E 57               [ 4]  287 	ld	d, a
    0000174F DD 6E FB         [19]  288 	ld	l, -5 (ix)
    00001752 26 00            [ 7]  289 	ld	h, #0x00
    00001754 C5               [11]  290 	push	bc
    00001755 FD E5            [15]  291 	push	iy
    00001757 CD 07 1F         [17]  292 	call	_cpct_asicSetSpritePosition
    0000175A C1               [10]  293 	pop	bc
                                    294 ;src/lib/video.c:137: for (u8 col = 0; col < 2; col++) {
    0000175B 04               [ 4]  295 	inc	b
    0000175C 18 B4            [12]  296 	jr	00104$
    0000175E                        297 00108$:
                                    298 ;src/lib/video.c:136: for (u8 row = 0; row < 2; row++) {
    0000175E 0C               [ 4]  299 	inc	c
    0000175F 18 AA            [12]  300 	jr	00107$
    00001761                        301 00109$:
                                    302 ;src/lib/video.c:146: }
    00001761 DD F9            [10]  303 	ld	sp, ix
    00001763 DD E1            [14]  304 	pop	ix
    00001765 E1               [10]  305 	pop	hl
    00001766 33               [ 6]  306 	inc	sp
    00001767 E9               [ 4]  307 	jp	(hl)
                                    308 ;src/lib/video.c:148: void v_set_title_roland_sprite_pos(i16 x_m2, i16 y, bool reversed) {
                                    309 ;	---------------------------------
                                    310 ; Function v_set_title_roland_sprite_pos
                                    311 ; ---------------------------------
    00001768                        312 _v_set_title_roland_sprite_pos::
    00001768 DD E5            [15]  313 	push	ix
    0000176A DD 21 00 00      [14]  314 	ld	ix,#0
    0000176E DD 39            [15]  315 	add	ix,sp
    00001770 F5               [11]  316 	push	af
    00001771 F5               [11]  317 	push	af
    00001772 3B               [ 6]  318 	dec	sp
    00001773 DD 75 FE         [19]  319 	ld	-2 (ix), l
    00001776 DD 74 FF         [19]  320 	ld	-1 (ix), h
    00001779 DD 73 FC         [19]  321 	ld	-4 (ix), e
    0000177C DD 72 FD         [19]  322 	ld	-3 (ix), d
                                    323 ;src/lib/video.c:150: for (u8 row = 0; row < 2; row++) {
    0000177F 0E 00            [ 7]  324 	ld	c, #0x00
    00001781                        325 00107$:
    00001781 79               [ 4]  326 	ld	a, c
    00001782 D6 02            [ 7]  327 	sub	a, #0x02
    00001784 30 51            [12]  328 	jr	NC, 00109$
                                    329 ;src/lib/video.c:151: for (u8 col = 0; col < 2; col++) {
    00001786 06 00            [ 7]  330 	ld	b, #0x00
    00001788                        331 00104$:
    00001788 78               [ 4]  332 	ld	a, b
    00001789 D6 02            [ 7]  333 	sub	a, #0x02
    0000178B 30 47            [12]  334 	jr	NC, 00108$
                                    335 ;src/lib/video.c:153: u8 tile_col = reversed ? (1 - col) : col;
    0000178D DD CB 04 46      [20]  336 	bit	0, 4 (ix)
    00001791 28 07            [12]  337 	jr	Z, 00111$
    00001793 58               [ 4]  338 	ld	e, b
    00001794 3E 01            [ 7]  339 	ld	a, #0x01
    00001796 93               [ 4]  340 	sub	a, e
    00001797 5F               [ 4]  341 	ld	e, a
    00001798 18 01            [12]  342 	jr	00112$
    0000179A                        343 00111$:
    0000179A 58               [ 4]  344 	ld	e, b
    0000179B                        345 00112$:
                                    346 ;src/lib/video.c:154: u8 spr_idx = HW_SPRITE_TITLE_ROLAND_START +
    0000179B 79               [ 4]  347 	ld	a, c
    0000179C 87               [ 4]  348 	add	a, a
    0000179D 83               [ 4]  349 	add	a, e
    0000179E DD 77 FB         [19]  350 	ld	-5 (ix), a
                                    351 ;src/lib/video.c:158: spr_idx, x_m2 + (col << 5), y + (row << 4));
    000017A1 69               [ 4]  352 	ld	l, c
    000017A2 26 00            [ 7]  353 	ld	h, #0x00
    000017A4 29               [11]  354 	add	hl, hl
    000017A5 29               [11]  355 	add	hl, hl
    000017A6 29               [11]  356 	add	hl, hl
    000017A7 29               [11]  357 	add	hl, hl
    000017A8 E5               [11]  358 	push	hl
    000017A9 FD E1            [14]  359 	pop	iy
    000017AB DD 5E FC         [19]  360 	ld	e, -4 (ix)
    000017AE DD 56 FD         [19]  361 	ld	d, -3 (ix)
    000017B1 FD 19            [15]  362 	add	iy, de
    000017B3 68               [ 4]  363 	ld	l, b
    000017B4 26 00            [ 7]  364 	ld	h, #0x00
    000017B6 29               [11]  365 	add	hl, hl
    000017B7 29               [11]  366 	add	hl, hl
    000017B8 29               [11]  367 	add	hl, hl
    000017B9 29               [11]  368 	add	hl, hl
    000017BA 29               [11]  369 	add	hl, hl
    000017BB 7D               [ 4]  370 	ld	a, l
    000017BC DD 86 FE         [19]  371 	add	a, -2 (ix)
    000017BF 5F               [ 4]  372 	ld	e, a
    000017C0 7C               [ 4]  373 	ld	a, h
    000017C1 DD 8E FF         [19]  374 	adc	a, -1 (ix)
    000017C4 57               [ 4]  375 	ld	d, a
    000017C5 DD 6E FB         [19]  376 	ld	l, -5 (ix)
    000017C8 26 00            [ 7]  377 	ld	h, #0x00
    000017CA C5               [11]  378 	push	bc
    000017CB FD E5            [15]  379 	push	iy
    000017CD CD 07 1F         [17]  380 	call	_cpct_asicSetSpritePosition
    000017D0 C1               [10]  381 	pop	bc
                                    382 ;src/lib/video.c:151: for (u8 col = 0; col < 2; col++) {
    000017D1 04               [ 4]  383 	inc	b
    000017D2 18 B4            [12]  384 	jr	00104$
    000017D4                        385 00108$:
                                    386 ;src/lib/video.c:150: for (u8 row = 0; row < 2; row++) {
    000017D4 0C               [ 4]  387 	inc	c
    000017D5 18 AA            [12]  388 	jr	00107$
    000017D7                        389 00109$:
                                    390 ;src/lib/video.c:161: }
    000017D7 DD F9            [10]  391 	ld	sp, ix
    000017D9 DD E1            [14]  392 	pop	ix
    000017DB E1               [10]  393 	pop	hl
    000017DC 33               [ 6]  394 	inc	sp
    000017DD E9               [ 4]  395 	jp	(hl)
                                    396 ;src/lib/video.c:163: void v_set_made_cpctelera_sprite_pos(i16 x_m2, i16 y, bool reversed) {
                                    397 ;	---------------------------------
                                    398 ; Function v_set_made_cpctelera_sprite_pos
                                    399 ; ---------------------------------
    000017DE                        400 _v_set_made_cpctelera_sprite_pos::
    000017DE DD E5            [15]  401 	push	ix
    000017E0 DD 21 00 00      [14]  402 	ld	ix,#0
    000017E4 DD 39            [15]  403 	add	ix,sp
    000017E6 F5               [11]  404 	push	af
    000017E7 F5               [11]  405 	push	af
    000017E8 3B               [ 6]  406 	dec	sp
    000017E9 DD 75 FE         [19]  407 	ld	-2 (ix), l
    000017EC DD 74 FF         [19]  408 	ld	-1 (ix), h
    000017EF DD 73 FC         [19]  409 	ld	-4 (ix), e
    000017F2 DD 72 FD         [19]  410 	ld	-3 (ix), d
                                    411 ;src/lib/video.c:167: for (u8 row = 0; row < 4; row++) {
    000017F5 0E 00            [ 7]  412 	ld	c, #0x00
    000017F7                        413 00107$:
    000017F7 79               [ 4]  414 	ld	a, c
    000017F8 D6 04            [ 7]  415 	sub	a, #0x04
    000017FA 30 52            [12]  416 	jr	NC, 00109$
                                    417 ;src/lib/video.c:168: for (u8 col = 0; col < 4; col++) {
    000017FC 06 00            [ 7]  418 	ld	b, #0x00
    000017FE                        419 00104$:
    000017FE 78               [ 4]  420 	ld	a, b
    000017FF D6 04            [ 7]  421 	sub	a, #0x04
    00001801 30 48            [12]  422 	jr	NC, 00108$
                                    423 ;src/lib/video.c:170: u8 tile_col = reversed ? (3 - col) : col;
    00001803 DD CB 04 46      [20]  424 	bit	0, 4 (ix)
    00001807 28 07            [12]  425 	jr	Z, 00111$
    00001809 58               [ 4]  426 	ld	e, b
    0000180A 3E 03            [ 7]  427 	ld	a, #0x03
    0000180C 93               [ 4]  428 	sub	a, e
    0000180D 5F               [ 4]  429 	ld	e, a
    0000180E 18 01            [12]  430 	jr	00112$
    00001810                        431 00111$:
    00001810 58               [ 4]  432 	ld	e, b
    00001811                        433 00112$:
                                    434 ;src/lib/video.c:171: u8 spr_idx = (row * 4) + tile_col;
    00001811 79               [ 4]  435 	ld	a, c
    00001812 87               [ 4]  436 	add	a, a
    00001813 87               [ 4]  437 	add	a, a
    00001814 83               [ 4]  438 	add	a, e
    00001815 DD 77 FB         [19]  439 	ld	-5 (ix), a
                                    440 ;src/lib/video.c:174: spr_idx, x_m2 + (col << 5), y + (row << 4));
    00001818 69               [ 4]  441 	ld	l, c
    00001819 26 00            [ 7]  442 	ld	h, #0x00
    0000181B 29               [11]  443 	add	hl, hl
    0000181C 29               [11]  444 	add	hl, hl
    0000181D 29               [11]  445 	add	hl, hl
    0000181E 29               [11]  446 	add	hl, hl
    0000181F E5               [11]  447 	push	hl
    00001820 FD E1            [14]  448 	pop	iy
    00001822 DD 5E FC         [19]  449 	ld	e, -4 (ix)
    00001825 DD 56 FD         [19]  450 	ld	d, -3 (ix)
    00001828 FD 19            [15]  451 	add	iy, de
    0000182A 68               [ 4]  452 	ld	l, b
    0000182B 26 00            [ 7]  453 	ld	h, #0x00
    0000182D 29               [11]  454 	add	hl, hl
    0000182E 29               [11]  455 	add	hl, hl
    0000182F 29               [11]  456 	add	hl, hl
    00001830 29               [11]  457 	add	hl, hl
    00001831 29               [11]  458 	add	hl, hl
    00001832 7D               [ 4]  459 	ld	a, l
    00001833 DD 86 FE         [19]  460 	add	a, -2 (ix)
    00001836 5F               [ 4]  461 	ld	e, a
    00001837 7C               [ 4]  462 	ld	a, h
    00001838 DD 8E FF         [19]  463 	adc	a, -1 (ix)
    0000183B 57               [ 4]  464 	ld	d, a
    0000183C DD 6E FB         [19]  465 	ld	l, -5 (ix)
    0000183F 26 00            [ 7]  466 	ld	h, #0x00
    00001841 C5               [11]  467 	push	bc
    00001842 FD E5            [15]  468 	push	iy
    00001844 CD 07 1F         [17]  469 	call	_cpct_asicSetSpritePosition
    00001847 C1               [10]  470 	pop	bc
                                    471 ;src/lib/video.c:168: for (u8 col = 0; col < 4; col++) {
    00001848 04               [ 4]  472 	inc	b
    00001849 18 B3            [12]  473 	jr	00104$
    0000184B                        474 00108$:
                                    475 ;src/lib/video.c:167: for (u8 row = 0; row < 4; row++) {
    0000184B 0C               [ 4]  476 	inc	c
    0000184C 18 A9            [12]  477 	jr	00107$
    0000184E                        478 00109$:
                                    479 ;src/lib/video.c:177: }
    0000184E DD F9            [10]  480 	ld	sp, ix
    00001850 DD E1            [14]  481 	pop	ix
    00001852 E1               [10]  482 	pop	hl
    00001853 33               [ 6]  483 	inc	sp
    00001854 E9               [ 4]  484 	jp	(hl)
                                    485 ;src/lib/video.c:180: void v_set_intro_spider_sprite_pos(i16 x_m2, i16 y, bool reversed) {
                                    486 ;	---------------------------------
                                    487 ; Function v_set_intro_spider_sprite_pos
                                    488 ; ---------------------------------
    00001855                        489 _v_set_intro_spider_sprite_pos::
    00001855 DD E5            [15]  490 	push	ix
    00001857 DD 21 00 00      [14]  491 	ld	ix,#0
    0000185B DD 39            [15]  492 	add	ix,sp
    0000185D FD 21 F7 FF      [14]  493 	ld	iy, #-9
    00001861 FD 39            [15]  494 	add	iy, sp
    00001863 FD F9            [10]  495 	ld	sp, iy
    00001865 DD 75 FD         [19]  496 	ld	-3 (ix), l
    00001868 DD 74 FE         [19]  497 	ld	-2 (ix), h
    0000186B DD 73 FB         [19]  498 	ld	-5 (ix), e
    0000186E DD 72 FC         [19]  499 	ld	-4 (ix), d
                                    500 ;src/lib/video.c:187: for (u8 frame = 0; frame < SPIDER_FRAMES; frame++) {
    00001871 DD 7E FD         [19]  501 	ld	a, -3 (ix)
    00001874 C6 20            [ 7]  502 	add	a, #0x20
    00001876 DD 77 F7         [19]  503 	ld	-9 (ix), a
    00001879 DD 7E FE         [19]  504 	ld	a, -2 (ix)
    0000187C CE 00            [ 7]  505 	adc	a, #0x00
    0000187E DD 77 F8         [19]  506 	ld	-8 (ix), a
    00001881 DD 7E FB         [19]  507 	ld	a, -5 (ix)
    00001884 C6 10            [ 7]  508 	add	a, #0x10
    00001886 DD 77 F9         [19]  509 	ld	-7 (ix), a
    00001889 DD 7E FC         [19]  510 	ld	a, -4 (ix)
    0000188C CE 00            [ 7]  511 	adc	a, #0x00
    0000188E DD 77 FA         [19]  512 	ld	-6 (ix), a
    00001891 DD 36 FF 00      [19]  513 	ld	-1 (ix), #0x00
    00001895                        514 00103$:
    00001895 DD 7E FF         [19]  515 	ld	a, -1 (ix)
    00001898 D6 03            [ 7]  516 	sub	a, #0x03
    0000189A 30 70            [12]  517 	jr	NC, 00105$
                                    518 ;src/lib/video.c:198: const u8 *s = spider_frame_sprites[frame];
    0000189C DD 6E FF         [19]  519 	ld	l, -1 (ix)
    0000189F 26 00            [ 7]  520 	ld	h, #0x00
    000018A1 29               [11]  521 	add	hl, hl
    000018A2 29               [11]  522 	add	hl, hl
    000018A3 11 13 19         [10]  523 	ld	de, #_v_set_intro_spider_sprite_pos_spider_frame_sprites_10001_287
    000018A6 19               [11]  524 	add	hl, de
    000018A7 4D               [ 4]  525 	ld	c, l
    000018A8 44               [ 4]  526 	ld	b, h
                                    527 ;src/lib/video.c:200: cpct_asicSetSpritePosition(s[0], x_m2 + 0, y + 0);
    000018A9 0A               [ 7]  528 	ld	a, (bc)
    000018AA 26 00            [ 7]  529 	ld	h, #0x00
    000018AC C5               [11]  530 	push	bc
    000018AD DD 5E FB         [19]  531 	ld	e, -5 (ix)
    000018B0 DD 56 FC         [19]  532 	ld	d, -4 (ix)
    000018B3 D5               [11]  533 	push	de
    000018B4 DD 5E FD         [19]  534 	ld	e, -3 (ix)
    000018B7 DD 56 FE         [19]  535 	ld	d, -2 (ix)
    000018BA 6F               [ 4]  536 	ld	l, a
    000018BB CD 07 1F         [17]  537 	call	_cpct_asicSetSpritePosition
    000018BE C1               [10]  538 	pop	bc
                                    539 ;src/lib/video.c:201: cpct_asicSetSpritePosition(s[1], x_m2 + 32, y + 0);
    000018BF 69               [ 4]  540 	ld	l, c
    000018C0 60               [ 4]  541 	ld	h, b
    000018C1 23               [ 6]  542 	inc	hl
    000018C2 6E               [ 7]  543 	ld	l, (hl)
    000018C3 26 00            [ 7]  544 	ld	h, #0x00
    000018C5 C5               [11]  545 	push	bc
    000018C6 DD 5E FB         [19]  546 	ld	e, -5 (ix)
    000018C9 DD 56 FC         [19]  547 	ld	d, -4 (ix)
    000018CC D5               [11]  548 	push	de
    000018CD DD 5E F7         [19]  549 	ld	e, -9 (ix)
    000018D0 DD 56 F8         [19]  550 	ld	d, -8 (ix)
    000018D3 CD 07 1F         [17]  551 	call	_cpct_asicSetSpritePosition
    000018D6 C1               [10]  552 	pop	bc
                                    553 ;src/lib/video.c:202: cpct_asicSetSpritePosition(s[2], x_m2 + 0, y + 16);
    000018D7 69               [ 4]  554 	ld	l, c
    000018D8 60               [ 4]  555 	ld	h, b
    000018D9 23               [ 6]  556 	inc	hl
    000018DA 23               [ 6]  557 	inc	hl
    000018DB 6E               [ 7]  558 	ld	l, (hl)
    000018DC 26 00            [ 7]  559 	ld	h, #0x00
    000018DE C5               [11]  560 	push	bc
    000018DF DD 5E F9         [19]  561 	ld	e, -7 (ix)
    000018E2 DD 56 FA         [19]  562 	ld	d, -6 (ix)
    000018E5 D5               [11]  563 	push	de
    000018E6 DD 5E FD         [19]  564 	ld	e, -3 (ix)
    000018E9 DD 56 FE         [19]  565 	ld	d, -2 (ix)
    000018EC CD 07 1F         [17]  566 	call	_cpct_asicSetSpritePosition
    000018EF C1               [10]  567 	pop	bc
                                    568 ;src/lib/video.c:203: cpct_asicSetSpritePosition(s[3], x_m2 + 32, y + 16);
    000018F0 21 03 00         [10]  569 	ld	hl, #3
    000018F3 09               [11]  570 	add	hl, bc
    000018F4 6E               [ 7]  571 	ld	l, (hl)
    000018F5 26 00            [ 7]  572 	ld	h, #0x00
    000018F7 DD 5E F9         [19]  573 	ld	e, -7 (ix)
    000018FA DD 56 FA         [19]  574 	ld	d, -6 (ix)
    000018FD D5               [11]  575 	push	de
    000018FE DD 5E F7         [19]  576 	ld	e, -9 (ix)
    00001901 DD 56 F8         [19]  577 	ld	d, -8 (ix)
    00001904 CD 07 1F         [17]  578 	call	_cpct_asicSetSpritePosition
                                    579 ;src/lib/video.c:187: for (u8 frame = 0; frame < SPIDER_FRAMES; frame++) {
    00001907 DD 34 FF         [23]  580 	inc	-1 (ix)
    0000190A 18 89            [12]  581 	jr	00103$
    0000190C                        582 00105$:
                                    583 ;src/lib/video.c:205: }
    0000190C DD F9            [10]  584 	ld	sp, ix
    0000190E DD E1            [14]  585 	pop	ix
    00001910 E1               [10]  586 	pop	hl
    00001911 33               [ 6]  587 	inc	sp
    00001912 E9               [ 4]  588 	jp	(hl)
    00001913                        589 _v_set_intro_spider_sprite_pos_spider_frame_sprites_10001_287:
    00001913 00                     590 	.db #0x00	; 0
    00001914 01                     591 	.db #0x01	; 1
    00001915 06                     592 	.db #0x06	; 6
    00001916 07                     593 	.db #0x07	; 7
    00001917 02                     594 	.db #0x02	; 2
    00001918 03                     595 	.db #0x03	; 3
    00001919 08                     596 	.db #0x08	; 8
    0000191A 09                     597 	.db #0x09	; 9
    0000191B 04                     598 	.db #0x04	; 4
    0000191C 05                     599 	.db #0x05	; 5
    0000191D 0A                     600 	.db #0x0a	; 10
    0000191E 0B                     601 	.db #0x0b	; 11
                                    602 ;src/lib/video.c:208: void v_set_intro_snowball_sprite_pos(i16 x_m2, i16 y, bool reversed) {
                                    603 ;	---------------------------------
                                    604 ; Function v_set_intro_snowball_sprite_pos
                                    605 ; ---------------------------------
    0000191F                        606 _v_set_intro_snowball_sprite_pos::
    0000191F DD E5            [15]  607 	push	ix
    00001921 DD 21 00 00      [14]  608 	ld	ix,#0
    00001925 DD 39            [15]  609 	add	ix,sp
    00001927 FD 21 F7 FF      [14]  610 	ld	iy, #-9
    0000192B FD 39            [15]  611 	add	iy, sp
    0000192D FD F9            [10]  612 	ld	sp, iy
    0000192F DD 75 FD         [19]  613 	ld	-3 (ix), l
    00001932 DD 74 FE         [19]  614 	ld	-2 (ix), h
    00001935 DD 73 FB         [19]  615 	ld	-5 (ix), e
    00001938 DD 72 FC         [19]  616 	ld	-4 (ix), d
                                    617 ;src/lib/video.c:217: for (u8 frame = 0; frame < SNOWBALL_FRAMES; frame++) {
    0000193B DD 7E FD         [19]  618 	ld	a, -3 (ix)
    0000193E C6 20            [ 7]  619 	add	a, #0x20
    00001940 DD 77 F7         [19]  620 	ld	-9 (ix), a
    00001943 DD 7E FE         [19]  621 	ld	a, -2 (ix)
    00001946 CE 00            [ 7]  622 	adc	a, #0x00
    00001948 DD 77 F8         [19]  623 	ld	-8 (ix), a
    0000194B DD 7E FB         [19]  624 	ld	a, -5 (ix)
    0000194E C6 10            [ 7]  625 	add	a, #0x10
    00001950 DD 77 F9         [19]  626 	ld	-7 (ix), a
    00001953 DD 7E FC         [19]  627 	ld	a, -4 (ix)
    00001956 CE 00            [ 7]  628 	adc	a, #0x00
    00001958 DD 77 FA         [19]  629 	ld	-6 (ix), a
    0000195B DD 36 FF 00      [19]  630 	ld	-1 (ix), #0x00
    0000195F                        631 00103$:
    0000195F DD 7E FF         [19]  632 	ld	a, -1 (ix)
    00001962 D6 04            [ 7]  633 	sub	a, #0x04
    00001964 30 70            [12]  634 	jr	NC, 00105$
                                    635 ;src/lib/video.c:228: const u8 *s = snowball_frame_sprites[frame];
    00001966 DD 6E FF         [19]  636 	ld	l, -1 (ix)
    00001969 26 00            [ 7]  637 	ld	h, #0x00
    0000196B 29               [11]  638 	add	hl, hl
    0000196C 29               [11]  639 	add	hl, hl
    0000196D 11 DD 19         [10]  640 	ld	de, #_v_set_intro_snowball_sprite_pos_snowball_frame_sprites_10001_292
    00001970 19               [11]  641 	add	hl, de
    00001971 4D               [ 4]  642 	ld	c, l
    00001972 44               [ 4]  643 	ld	b, h
                                    644 ;src/lib/video.c:230: cpct_asicSetSpritePosition(s[0], x_m2 + 0, y + 0);
    00001973 0A               [ 7]  645 	ld	a, (bc)
    00001974 26 00            [ 7]  646 	ld	h, #0x00
    00001976 C5               [11]  647 	push	bc
    00001977 DD 5E FB         [19]  648 	ld	e, -5 (ix)
    0000197A DD 56 FC         [19]  649 	ld	d, -4 (ix)
    0000197D D5               [11]  650 	push	de
    0000197E DD 5E FD         [19]  651 	ld	e, -3 (ix)
    00001981 DD 56 FE         [19]  652 	ld	d, -2 (ix)
    00001984 6F               [ 4]  653 	ld	l, a
    00001985 CD 07 1F         [17]  654 	call	_cpct_asicSetSpritePosition
    00001988 C1               [10]  655 	pop	bc
                                    656 ;src/lib/video.c:231: cpct_asicSetSpritePosition(s[1], x_m2 + 32, y + 0);
    00001989 69               [ 4]  657 	ld	l, c
    0000198A 60               [ 4]  658 	ld	h, b
    0000198B 23               [ 6]  659 	inc	hl
    0000198C 6E               [ 7]  660 	ld	l, (hl)
    0000198D 26 00            [ 7]  661 	ld	h, #0x00
    0000198F C5               [11]  662 	push	bc
    00001990 DD 5E FB         [19]  663 	ld	e, -5 (ix)
    00001993 DD 56 FC         [19]  664 	ld	d, -4 (ix)
    00001996 D5               [11]  665 	push	de
    00001997 DD 5E F7         [19]  666 	ld	e, -9 (ix)
    0000199A DD 56 F8         [19]  667 	ld	d, -8 (ix)
    0000199D CD 07 1F         [17]  668 	call	_cpct_asicSetSpritePosition
    000019A0 C1               [10]  669 	pop	bc
                                    670 ;src/lib/video.c:232: cpct_asicSetSpritePosition(s[2], x_m2 + 0, y + 16);
    000019A1 69               [ 4]  671 	ld	l, c
    000019A2 60               [ 4]  672 	ld	h, b
    000019A3 23               [ 6]  673 	inc	hl
    000019A4 23               [ 6]  674 	inc	hl
    000019A5 6E               [ 7]  675 	ld	l, (hl)
    000019A6 26 00            [ 7]  676 	ld	h, #0x00
    000019A8 C5               [11]  677 	push	bc
    000019A9 DD 5E F9         [19]  678 	ld	e, -7 (ix)
    000019AC DD 56 FA         [19]  679 	ld	d, -6 (ix)
    000019AF D5               [11]  680 	push	de
    000019B0 DD 5E FD         [19]  681 	ld	e, -3 (ix)
    000019B3 DD 56 FE         [19]  682 	ld	d, -2 (ix)
    000019B6 CD 07 1F         [17]  683 	call	_cpct_asicSetSpritePosition
    000019B9 C1               [10]  684 	pop	bc
                                    685 ;src/lib/video.c:233: cpct_asicSetSpritePosition(s[3], x_m2 + 32, y + 16);
    000019BA 21 03 00         [10]  686 	ld	hl, #3
    000019BD 09               [11]  687 	add	hl, bc
    000019BE 6E               [ 7]  688 	ld	l, (hl)
    000019BF 26 00            [ 7]  689 	ld	h, #0x00
    000019C1 DD 5E F9         [19]  690 	ld	e, -7 (ix)
    000019C4 DD 56 FA         [19]  691 	ld	d, -6 (ix)
    000019C7 D5               [11]  692 	push	de
    000019C8 DD 5E F7         [19]  693 	ld	e, -9 (ix)
    000019CB DD 56 F8         [19]  694 	ld	d, -8 (ix)
    000019CE CD 07 1F         [17]  695 	call	_cpct_asicSetSpritePosition
                                    696 ;src/lib/video.c:217: for (u8 frame = 0; frame < SNOWBALL_FRAMES; frame++) {
    000019D1 DD 34 FF         [23]  697 	inc	-1 (ix)
    000019D4 18 89            [12]  698 	jr	00103$
    000019D6                        699 00105$:
                                    700 ;src/lib/video.c:235: }
    000019D6 DD F9            [10]  701 	ld	sp, ix
    000019D8 DD E1            [14]  702 	pop	ix
    000019DA E1               [10]  703 	pop	hl
    000019DB 33               [ 6]  704 	inc	sp
    000019DC E9               [ 4]  705 	jp	(hl)
    000019DD                        706 _v_set_intro_snowball_sprite_pos_snowball_frame_sprites_10001_292:
    000019DD 00                     707 	.db #0x00	; 0
    000019DE 01                     708 	.db #0x01	; 1
    000019DF 08                     709 	.db #0x08	; 8
    000019E0 09                     710 	.db #0x09	; 9
    000019E1 02                     711 	.db #0x02	; 2
    000019E2 03                     712 	.db #0x03	; 3
    000019E3 0A                     713 	.db #0x0a	; 10
    000019E4 0B                     714 	.db #0x0b	; 11
    000019E5 04                     715 	.db #0x04	; 4
    000019E6 05                     716 	.db #0x05	; 5
    000019E7 0C                     717 	.db #0x0c	; 12
    000019E8 0D                     718 	.db #0x0d	; 13
    000019E9 06                     719 	.db #0x06	; 6
    000019EA 07                     720 	.db #0x07	; 7
    000019EB 0E                     721 	.db #0x0e	; 14
    000019EC 0F                     722 	.db #0x0f	; 15
                                    723 ;src/lib/video.c:270: void v_spider_set_frame(u8 frame) {
                                    724 ;	---------------------------------
                                    725 ; Function v_spider_set_frame
                                    726 ; ---------------------------------
    000019ED                        727 _v_spider_set_frame::
    000019ED 4F               [ 4]  728 	ld	c, a
                                    729 ;src/lib/video.c:275: if (frame == last_frame)
                                    730 ;src/lib/video.c:276: return;
                                    731 ;src/lib/video.c:279: if (last_frame != 0xFF) {
    000019EE 3A 71 93         [13]  732 	ld	a,(_last_frame+0)
    000019F1 B9               [ 4]  733 	cp	a,c
    000019F2 C8               [11]  734 	ret	Z
    000019F3 3C               [ 4]  735 	inc	a
    000019F4 28 26            [12]  736 	jr	Z, 00120$
                                    737 ;src/lib/video.c:280: for (u8 i = 0; i < 4; i++)
    000019F6 06 00            [ 7]  738 	ld	b, #0x00
    000019F8                        739 00108$:
    000019F8 78               [ 4]  740 	ld	a, b
    000019F9 D6 04            [ 7]  741 	sub	a, #0x04
    000019FB 30 1F            [12]  742 	jr	NC, 00120$
                                    743 ;src/lib/video.c:282: spider_frame_sprites[last_frame][i], 0, 0);
    000019FD 3A 71 93         [13]  744 	ld	a, (_last_frame)
    00001A00 6F               [ 4]  745 	ld	l, a
    00001A01 26 00            [ 7]  746 	ld	h, #0x00
    00001A03 29               [11]  747 	add	hl, hl
    00001A04 29               [11]  748 	add	hl, hl
    00001A05 11 44 1A         [10]  749 	ld	de, #_v_spider_set_frame_spider_frame_sprites_10000_296
    00001A08 19               [11]  750 	add	hl, de
    00001A09 58               [ 4]  751 	ld	e, b
    00001A0A 16 00            [ 7]  752 	ld	d, #0x00
    00001A0C 19               [11]  753 	add	hl, de
    00001A0D 6E               [ 7]  754 	ld	l, (hl)
    00001A0E 26 00            [ 7]  755 	ld	h, #0x00
    00001A10 C5               [11]  756 	push	bc
    00001A11 11 00 00         [10]  757 	ld	de, #0x00
    00001A14 D5               [11]  758 	push	de
    00001A15 CD E6 2D         [17]  759 	call	_cpct_asicSetSpriteZoom
    00001A18 C1               [10]  760 	pop	bc
                                    761 ;src/lib/video.c:280: for (u8 i = 0; i < 4; i++)
    00001A19 04               [ 4]  762 	inc	b
    00001A1A 18 DC            [12]  763 	jr	00108$
                                    764 ;src/lib/video.c:286: for (u8 i = 0; i < 4; i++)
    00001A1C                        765 00120$:
    00001A1C 06 00            [ 7]  766 	ld	b, #0x00
    00001A1E                        767 00111$:
    00001A1E 78               [ 4]  768 	ld	a, b
    00001A1F D6 04            [ 7]  769 	sub	a, #0x04
    00001A21 30 1C            [12]  770 	jr	NC, 00106$
                                    771 ;src/lib/video.c:287: cpct_asicSetSpriteZoom(spider_frame_sprites[frame][i], 2, 1);
    00001A23 69               [ 4]  772 	ld	l, c
    00001A24 26 00            [ 7]  773 	ld	h, #0x00
    00001A26 29               [11]  774 	add	hl, hl
    00001A27 29               [11]  775 	add	hl, hl
    00001A28 11 44 1A         [10]  776 	ld	de, #_v_spider_set_frame_spider_frame_sprites_10000_296
    00001A2B 19               [11]  777 	add	hl, de
    00001A2C 58               [ 4]  778 	ld	e, b
    00001A2D 16 00            [ 7]  779 	ld	d, #0x00
    00001A2F 19               [11]  780 	add	hl, de
    00001A30 6E               [ 7]  781 	ld	l, (hl)
    00001A31 26 00            [ 7]  782 	ld	h, #0x00
    00001A33 C5               [11]  783 	push	bc
    00001A34 11 02 01         [10]  784 	ld	de, #0x102
    00001A37 D5               [11]  785 	push	de
    00001A38 CD E6 2D         [17]  786 	call	_cpct_asicSetSpriteZoom
    00001A3B C1               [10]  787 	pop	bc
                                    788 ;src/lib/video.c:286: for (u8 i = 0; i < 4; i++)
    00001A3C 04               [ 4]  789 	inc	b
    00001A3D 18 DF            [12]  790 	jr	00111$
    00001A3F                        791 00106$:
                                    792 ;src/lib/video.c:289: last_frame = frame;
    00001A3F 21 71 93         [10]  793 	ld	hl, #_last_frame
    00001A42 71               [ 7]  794 	ld	(hl), c
                                    795 ;src/lib/video.c:290: }
    00001A43 C9               [10]  796 	ret
    00001A44                        797 _v_spider_set_frame_spider_frame_sprites_10000_296:
    00001A44 00                     798 	.db #0x00	; 0
    00001A45 01                     799 	.db #0x01	; 1
    00001A46 06                     800 	.db #0x06	; 6
    00001A47 07                     801 	.db #0x07	; 7
    00001A48 02                     802 	.db #0x02	; 2
    00001A49 03                     803 	.db #0x03	; 3
    00001A4A 08                     804 	.db #0x08	; 8
    00001A4B 09                     805 	.db #0x09	; 9
    00001A4C 04                     806 	.db #0x04	; 4
    00001A4D 05                     807 	.db #0x05	; 5
    00001A4E 0A                     808 	.db #0x0a	; 10
    00001A4F 0B                     809 	.db #0x0b	; 11
                                    810 ;src/lib/video.c:292: void v_snowball_set_frame(u8 frame) {
                                    811 ;	---------------------------------
                                    812 ; Function v_snowball_set_frame
                                    813 ; ---------------------------------
    00001A50                        814 _v_snowball_set_frame::
    00001A50 4F               [ 4]  815 	ld	c, a
                                    816 ;src/lib/video.c:297: if (frame == last_frame)
                                    817 ;src/lib/video.c:298: return;
                                    818 ;src/lib/video.c:301: if (last_frame != 0xFF) {
    00001A51 3A 71 93         [13]  819 	ld	a,(_last_frame+0)
    00001A54 B9               [ 4]  820 	cp	a,c
    00001A55 C8               [11]  821 	ret	Z
    00001A56 3C               [ 4]  822 	inc	a
    00001A57 28 26            [12]  823 	jr	Z, 00120$
                                    824 ;src/lib/video.c:302: for (u8 i = 0; i < 5; i++)
    00001A59 06 00            [ 7]  825 	ld	b, #0x00
    00001A5B                        826 00108$:
    00001A5B 78               [ 4]  827 	ld	a, b
    00001A5C D6 05            [ 7]  828 	sub	a, #0x05
    00001A5E 30 1F            [12]  829 	jr	NC, 00120$
                                    830 ;src/lib/video.c:304: snowball_frame_sprites[last_frame][i], 0, 0);
    00001A60 3A 71 93         [13]  831 	ld	a, (_last_frame)
    00001A63 6F               [ 4]  832 	ld	l, a
    00001A64 26 00            [ 7]  833 	ld	h, #0x00
    00001A66 29               [11]  834 	add	hl, hl
    00001A67 29               [11]  835 	add	hl, hl
    00001A68 11 A7 1A         [10]  836 	ld	de, #_v_snowball_set_frame_snowball_frame_sprites_10000_301
    00001A6B 19               [11]  837 	add	hl, de
    00001A6C 58               [ 4]  838 	ld	e, b
    00001A6D 16 00            [ 7]  839 	ld	d, #0x00
    00001A6F 19               [11]  840 	add	hl, de
    00001A70 6E               [ 7]  841 	ld	l, (hl)
    00001A71 26 00            [ 7]  842 	ld	h, #0x00
    00001A73 C5               [11]  843 	push	bc
    00001A74 11 00 00         [10]  844 	ld	de, #0x00
    00001A77 D5               [11]  845 	push	de
    00001A78 CD E6 2D         [17]  846 	call	_cpct_asicSetSpriteZoom
    00001A7B C1               [10]  847 	pop	bc
                                    848 ;src/lib/video.c:302: for (u8 i = 0; i < 5; i++)
    00001A7C 04               [ 4]  849 	inc	b
    00001A7D 18 DC            [12]  850 	jr	00108$
                                    851 ;src/lib/video.c:308: for (u8 i = 0; i < 5; i++)
    00001A7F                        852 00120$:
    00001A7F 06 00            [ 7]  853 	ld	b, #0x00
    00001A81                        854 00111$:
    00001A81 78               [ 4]  855 	ld	a, b
    00001A82 D6 05            [ 7]  856 	sub	a, #0x05
    00001A84 30 1C            [12]  857 	jr	NC, 00106$
                                    858 ;src/lib/video.c:309: cpct_asicSetSpriteZoom(snowball_frame_sprites[frame][i], 2, 1);
    00001A86 69               [ 4]  859 	ld	l, c
    00001A87 26 00            [ 7]  860 	ld	h, #0x00
    00001A89 29               [11]  861 	add	hl, hl
    00001A8A 29               [11]  862 	add	hl, hl
    00001A8B 11 A7 1A         [10]  863 	ld	de, #_v_snowball_set_frame_snowball_frame_sprites_10000_301
    00001A8E 19               [11]  864 	add	hl, de
    00001A8F 58               [ 4]  865 	ld	e, b
    00001A90 16 00            [ 7]  866 	ld	d, #0x00
    00001A92 19               [11]  867 	add	hl, de
    00001A93 6E               [ 7]  868 	ld	l, (hl)
    00001A94 26 00            [ 7]  869 	ld	h, #0x00
    00001A96 C5               [11]  870 	push	bc
    00001A97 11 02 01         [10]  871 	ld	de, #0x102
    00001A9A D5               [11]  872 	push	de
    00001A9B CD E6 2D         [17]  873 	call	_cpct_asicSetSpriteZoom
    00001A9E C1               [10]  874 	pop	bc
                                    875 ;src/lib/video.c:308: for (u8 i = 0; i < 5; i++)
    00001A9F 04               [ 4]  876 	inc	b
    00001AA0 18 DF            [12]  877 	jr	00111$
    00001AA2                        878 00106$:
                                    879 ;src/lib/video.c:311: last_frame = frame;
    00001AA2 21 71 93         [10]  880 	ld	hl, #_last_frame
    00001AA5 71               [ 7]  881 	ld	(hl), c
                                    882 ;src/lib/video.c:312: }
    00001AA6 C9               [10]  883 	ret
    00001AA7                        884 _v_snowball_set_frame_snowball_frame_sprites_10000_301:
    00001AA7 00                     885 	.db #0x00	; 0
    00001AA8 01                     886 	.db #0x01	; 1
    00001AA9 08                     887 	.db #0x08	; 8
    00001AAA 09                     888 	.db #0x09	; 9
    00001AAB 02                     889 	.db #0x02	; 2
    00001AAC 03                     890 	.db #0x03	; 3
    00001AAD 0A                     891 	.db #0x0a	; 10
    00001AAE 0B                     892 	.db #0x0b	; 11
    00001AAF 04                     893 	.db #0x04	; 4
    00001AB0 05                     894 	.db #0x05	; 5
    00001AB1 0C                     895 	.db #0x0c	; 12
    00001AB2 0D                     896 	.db #0x0d	; 13
    00001AB3 06                     897 	.db #0x06	; 6
    00001AB4 07                     898 	.db #0x07	; 7
    00001AB5 0E                     899 	.db #0x0e	; 14
    00001AB6 0F                     900 	.db #0x0f	; 15
                                    901 	.area _CODE
                                    902 	.area _INITIALIZER
    0000939E                        903 __xinit__v_pixel_scroll:
    0000939E 00                     904 	.db #0x00	; 0
    0000939F                        905 __xinit__v_char_scroll:
    0000939F 00 00                  906 	.dw #0x0000
    000093A1                        907 __xinit__last_frame:
    000093A1 FF                     908 	.db #0xff	; 255
                                    909 	.area _CABS (ABS)
