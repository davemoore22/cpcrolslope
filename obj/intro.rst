                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module intro
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _v_snowball_set_frame
                                     12 	.globl _v_spider_set_frame
                                     13 	.globl _v_set_intro_spider_sprite_pos
                                     14 	.globl _v_set_intro_snowball_sprite_pos
                                     15 	.globl _v_set_intro_ghost_sprite_pos
                                     16 	.globl _v_set_intro_roland_sprite_pos
                                     17 	.globl _v_clear_screen
                                     18 	.globl _v_blank_screen_mode_1
                                     19 	.globl _u_wait_for_duration_or_kp
                                     20 	.globl _u_clock_interrupt
                                     21 	.globl _d_gfx_decompress_to_screen
                                     22 	.globl _d_load
                                     23 	.globl _a_page_disconnect_safe
                                     24 	.globl _a_page_connect_safe
                                     25 	.globl _a_load_ghost_sprites
                                     26 	.globl _a_load_snowball_sprites
                                     27 	.globl _a_load_spider_sprites
                                     28 	.globl _a_load_roland_sprites
                                     29 	.globl _a_clear_sprites
                                     30 	.globl _a_set_hardware_sprite_palette
                                     31 	.globl _cpct_asicRemoveLinesInterruptHandler
                                     32 	.globl _cpct_asicSetLinesInterruptHandler
                                     33 	.globl _cpct_asicPageDisconnect
                                     34 	.globl _cpct_asicPageConnect
                                     35 	.globl _cpct_asicSetPalette
                                     36 	.globl _cpct_asicSetBorder
                                     37 	.globl _cpct_asicSetSpriteZoom
                                     38 	.globl _cpct_waitVSYNCStart
                                     39 	.globl _cpct_waitVSYNC
                                     40 	.globl _cpct_drawSprite
                                     41 	.globl _cpct_isAnyKeyPressed
                                     42 	.globl _cpct_scanKeyboard_if
                                     43 	.globl _g_ghost_bob
                                     44 	.globl _i_start
                                     45 	.globl _i_stop
                                     46 ;--------------------------------------------------------
                                     47 ; special function registers
                                     48 ;--------------------------------------------------------
                                     49 ;--------------------------------------------------------
                                     50 ; ram data
                                     51 ;--------------------------------------------------------
                                     52 	.area _DATA
                                     53 ;--------------------------------------------------------
                                     54 ; ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area _INITIALIZED
    00009351                         57 _i_int_idx:
    00009351                         58 	.ds 1
    00009352                         59 _i_frame_c:
    00009352                         60 	.ds 1
    00009353                         61 _show_roland:
    00009353                         62 	.ds 1
    00009354                         63 _g_ghost_bob::
    00009354                         64 	.ds 2
                                     65 ;--------------------------------------------------------
                                     66 ; absolute external ram data
                                     67 ;--------------------------------------------------------
                                     68 	.area _DABS (ABS)
                                     69 ;--------------------------------------------------------
                                     70 ; global & static initialisations
                                     71 ;--------------------------------------------------------
                                     72 	.area _HOME
                                     73 	.area _GSINIT
                                     74 	.area _GSFINAL
                                     75 	.area _GSINIT
                                     76 ;--------------------------------------------------------
                                     77 ; Home
                                     78 ;--------------------------------------------------------
                                     79 	.area _HOME
                                     80 	.area _HOME
                                     81 ;--------------------------------------------------------
                                     82 ; code
                                     83 ;--------------------------------------------------------
                                     84 	.area _CODE
                                     85 ;src/intro.c:107: void i_start(void) {
                                     86 ;	---------------------------------
                                     87 ; Function i_start
                                     88 ; ---------------------------------
    00000100                         89 _i_start::
                                     90 ;src/intro.c:110: a_clear_sprites();
    00000100 CD A9 11         [17]   91 	call	_a_clear_sprites
                                     92 ;src/intro.c:111: v_blank_screen_mode_1();
    00000103 CD 47 16         [17]   93 	call	_v_blank_screen_mode_1
                                     94 ;src/intro.c:112: v_clear_screen();
    00000106 CD 61 16         [17]   95 	call	_v_clear_screen
                                     96 ;src/intro.c:114: show_roland = false;
    00000109 AF               [ 4]   97 	xor	a, a
    0000010A 32 53 93         [13]   98 	ld	(_show_roland+0), a
                                     99 ;src/intro.c:115: i_draw_bg();
    0000010D CD E8 01         [17]  100 	call	_i_draw_bg
                                    101 ;src/intro.c:118: i_reset_timers();
    00000110 CD 11 02         [17]  102 	call	_i_reset_timers
                                    103 ;src/intro.c:119: i_add_interrupt();
    00000113 CD 19 02         [17]  104 	call	_i_add_interrupt
                                    105 ;src/intro.c:120: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
    00000116 21 FF 0F         [10]  106 	ld	hl, #0x0fff
    00000119 CD FA 2D         [17]  107 	call	_cpct_asicSetBorder
                                    108 ;src/intro.c:123: i_ani_roland_l(140, INTRO_SPEED_LEFT);
    0000011C 2E 08            [ 7]  109 	ld	l, #0x08
    0000011E 3E 8C            [ 7]  110 	ld	a, #0x8c
    00000120 CD D3 03         [17]  111 	call	_i_ani_roland_l
                                    112 ;src/intro.c:124: if (g_skip)
    00000123 21 58 93         [10]  113 	ld	hl, #_g_skip
    00000126 CB 46            [12]  114 	bit	0, (hl)
                                    115 ;src/intro.c:125: return;
    00000128 C0               [11]  116 	ret	NZ
                                    117 ;src/intro.c:126: i_ani_spider_l(144, INTRO_SPEED_LEFT);
    00000129 2E 08            [ 7]  118 	ld	l, #0x08
    0000012B 3E 90            [ 7]  119 	ld	a, #0x90
    0000012D CD 49 05         [17]  120 	call	_i_ani_spider_l
                                    121 ;src/intro.c:127: if (g_skip)
    00000130 21 58 93         [10]  122 	ld	hl, #_g_skip
    00000133 CB 46            [12]  123 	bit	0, (hl)
                                    124 ;src/intro.c:128: return;
    00000135 C0               [11]  125 	ret	NZ
                                    126 ;src/intro.c:129: show_roland = true;
    00000136 21 53 93         [10]  127 	ld	hl, #_show_roland
    00000139 36 01            [10]  128 	ld	(hl), #0x01
                                    129 ;src/intro.c:130: i_ani_roland_r(140, INTRO_SPEED_RIGHT);
    0000013B 2E 08            [ 7]  130 	ld	l, #0x08
    0000013D 3E 8C            [ 7]  131 	ld	a, #0x8c
    0000013F CD F8 03         [17]  132 	call	_i_ani_roland_r
                                    133 ;src/intro.c:131: if (g_skip)
    00000142 21 58 93         [10]  134 	ld	hl, #_g_skip
    00000145 CB 46            [12]  135 	bit	0, (hl)
                                    136 ;src/intro.c:132: return;
    00000147 C0               [11]  137 	ret	NZ
                                    138 ;src/intro.c:133: i_ani_snowball_r(140, INTRO_SPEED_RIGHT);
    00000148 2E 08            [ 7]  139 	ld	l, #0x08
    0000014A 3E 8C            [ 7]  140 	ld	a, #0x8c
    0000014C CD F7 04         [17]  141 	call	_i_ani_snowball_r
                                    142 ;src/intro.c:134: if (g_skip)
    0000014F 21 58 93         [10]  143 	ld	hl, #_g_skip
    00000152 CB 46            [12]  144 	bit	0, (hl)
                                    145 ;src/intro.c:135: return;
    00000154 C0               [11]  146 	ret	NZ
                                    147 ;src/intro.c:138: cpct_waitVSYNCStart();
    00000155 CD 59 30         [17]  148 	call	_cpct_waitVSYNCStart
                                    149 ;src/intro.c:139: cpct_asicPageDisconnect();
    00000158 CD DA 2D         [17]  150 	call	_cpct_asicPageDisconnect
                                    151 ;src/intro.c:140: cpct_drawSprite(img_in, v_pos, 10, 24);
    0000015B 21 0A 18         [10]  152 	ld	hl, #0x180a
    0000015E E5               [11]  153 	push	hl
    0000015F 11 03 F2         [10]  154 	ld	de, #0xf203
    00000162 21 B7 8E         [10]  155 	ld	hl, #_img_in
    00000165 CD 37 2D         [17]  156 	call	_cpct_drawSprite
                                    157 ;src/intro.c:141: cpct_asicPageConnect();
    00000168 CD E0 2D         [17]  158 	call	_cpct_asicPageConnect
                                    159 ;src/intro.c:143: i_ani_roland_l(140, INTRO_SPEED_LEFT);
    0000016B 2E 08            [ 7]  160 	ld	l, #0x08
    0000016D 3E 8C            [ 7]  161 	ld	a, #0x8c
    0000016F CD D3 03         [17]  162 	call	_i_ani_roland_l
                                    163 ;src/intro.c:144: if (g_skip)
    00000172 21 58 93         [10]  164 	ld	hl, #_g_skip
    00000175 CB 46            [12]  165 	bit	0, (hl)
                                    166 ;src/intro.c:145: return;
    00000177 C0               [11]  167 	ret	NZ
                                    168 ;src/intro.c:146: i_ani_ghost_l(124, INTRO_SPEED_LEFT);
    00000178 2E 08            [ 7]  169 	ld	l, #0x08
    0000017A 3E 7C            [ 7]  170 	ld	a, #0x7c
    0000017C CD AB 03         [17]  171 	call	_i_ani_ghost_l
                                    172 ;src/intro.c:147: if (g_skip)
    0000017F 21 58 93         [10]  173 	ld	hl, #_g_skip
    00000182 CB 46            [12]  174 	bit	0, (hl)
    00000184 C8               [11]  175 	ret	Z
                                    176 ;src/intro.c:148: return;
                                    177 ;src/intro.c:149: }
    00000185 C9               [10]  178 	ret
    00000186                        179 _ghost_sine:
    00000186 00                     180 	.db #0x00	;  0
    00000187 01                     181 	.db #0x01	;  1
    00000188 02                     182 	.db #0x02	;  2
    00000189 03                     183 	.db #0x03	;  3
    0000018A 04                     184 	.db #0x04	;  4
    0000018B 03                     185 	.db #0x03	;  3
    0000018C 02                     186 	.db #0x02	;  2
    0000018D 01                     187 	.db #0x01	;  1
    0000018E 00                     188 	.db #0x00	;  0
    0000018F FF                     189 	.db #0xff	; -1
    00000190 FE                     190 	.db #0xfe	; -2
    00000191 FD                     191 	.db #0xfd	; -3
    00000192 FC                     192 	.db #0xfc	; -4
    00000193 FD                     193 	.db #0xfd	; -3
    00000194 FE                     194 	.db #0xfe	; -2
    00000195 FF                     195 	.db #0xff	; -1
    00000196 00                     196 	.db #0x00	;  0
    00000197 01                     197 	.db #0x01	;  1
    00000198 02                     198 	.db #0x02	;  2
    00000199 03                     199 	.db #0x03	;  3
    0000019A 04                     200 	.db #0x04	;  4
    0000019B 03                     201 	.db #0x03	;  3
    0000019C 02                     202 	.db #0x02	;  2
    0000019D 01                     203 	.db #0x01	;  1
    0000019E 00                     204 	.db #0x00	;  0
    0000019F FF                     205 	.db #0xff	; -1
    000001A0 FE                     206 	.db #0xfe	; -2
    000001A1 FD                     207 	.db #0xfd	; -3
    000001A2 FC                     208 	.db #0xfc	; -4
    000001A3 FD                     209 	.db #0xfd	; -3
    000001A4 FE                     210 	.db #0xfe	; -2
    000001A5 FF                     211 	.db #0xff	; -1
    000001A6                        212 _i_pal_in:
    000001A6 FF 0F                  213 	.dw #0x0fff
    000001A8 FF 0B                  214 	.dw #0x0bff
    000001AA 00 00                  215 	.dw #0x0000
    000001AC FF 05                  216 	.dw #0x05ff
    000001AE                        217 _i_pal_ice:
    000001AE 7F 0A                  218 	.dw #0x0a7f
    000001B0 AF 0E                  219 	.dw #0x0eaf
    000001B2 5E 08                  220 	.dw #0x085e
    000001B4 DF 0E                  221 	.dw #0x0edf
    000001B6                        222 _i_pal_trees:
    000001B6 FF 0F                  223 	.dw #0x0fff
    000001B8 68 0A                  224 	.dw #0x0a68
    000001BA 11 04                  225 	.dw #0x0411
    000001BC 35 07                  226 	.dw #0x0735
    000001BE                        227 _i_pal_blank_white:
    000001BE FF 0F                  228 	.dw #0x0fff
    000001C0 FF 0F                  229 	.dw #0x0fff
    000001C2 FF 0F                  230 	.dw #0x0fff
    000001C4 FF 0F                  231 	.dw #0x0fff
    000001C6                        232 _i_pal_blank_ice:
    000001C6 7F 0A                  233 	.dw #0x0a7f
    000001C8 7F 0A                  234 	.dw #0x0a7f
    000001CA 7F 0A                  235 	.dw #0x0a7f
    000001CC 7F 0A                  236 	.dw #0x0a7f
    000001CE                        237 _i_pal_top:
    000001CE FF 0F                  238 	.dw #0x0fff
    000001D0 7D 07                  239 	.dw #0x077d
    000001D2 14 01                  240 	.dw #0x0114
    000001D4 9B 09                  241 	.dw #0x099b
                                    242 ;src/intro.c:152: void i_stop(void) {
                                    243 ;	---------------------------------
                                    244 ; Function i_stop
                                    245 ; ---------------------------------
    000001D6                        246 _i_stop::
                                    247 ;src/intro.c:154: u_wait_for_duration_or_kp(5);
    000001D6 21 05 00         [10]  248 	ld	hl, #0x0005
    000001D9 CD E5 15         [17]  249 	call	_u_wait_for_duration_or_kp
                                    250 ;src/intro.c:156: v_clear_screen();
    000001DC CD 61 16         [17]  251 	call	_v_clear_screen
                                    252 ;src/intro.c:158: i_remove_interrupt();
    000001DF CD 30 02         [17]  253 	call	_i_remove_interrupt
                                    254 ;src/intro.c:159: v_blank_screen_mode_1();
    000001E2 CD 47 16         [17]  255 	call	_v_blank_screen_mode_1
                                    256 ;src/intro.c:160: v_clear_screen();
                                    257 ;src/intro.c:161: }
    000001E5 C3 61 16         [10]  258 	jp	_v_clear_screen
                                    259 ;src/intro.c:163: static void i_draw_bg(void) {
                                    260 ;	---------------------------------
                                    261 ; Function i_draw_bg
                                    262 ; ---------------------------------
    000001E8                        263 _i_draw_bg:
                                    264 ;src/intro.c:165: if (HW_HAS_128K(g_hw))
    000001E8 3A 00 84         [13]  265 	ld	a, (_g_hw)
    000001EB E6 03            [ 7]  266 	and	a, #0x03
    000001ED D6 01            [ 7]  267 	sub	a, #0x01
    000001EF 38 05            [12]  268 	jr	C, 00102$
                                    269 ;src/intro.c:166: d_gfx_decompress_to_screen(GFX_INTRO);
    000001F1 3E 02            [ 7]  270 	ld	a, #0x02
    000001F3 C3 D0 14         [10]  271 	jp	_d_gfx_decompress_to_screen
    000001F6                        272 00102$:
                                    273 ;src/intro.c:168: a_page_disconnect_safe();
    000001F6 CD B4 12         [17]  274 	call	_a_page_disconnect_safe
                                    275 ;src/intro.c:169: d_load("INTRO   SCR", VIDEO_MEM_START);
    000001F9 11 00 C0         [10]  276 	ld	de, #0xc000
    000001FC 21 05 02         [10]  277 	ld	hl, #___str_0
    000001FF CD 7C 14         [17]  278 	call	_d_load
                                    279 ;src/intro.c:170: a_page_connect_safe();
                                    280 ;src/intro.c:172: }
    00000202 C3 A5 12         [10]  281 	jp	_a_page_connect_safe
    00000205                        282 ___str_0:
    00000205 49 4E 54 52 4F 20 20   283 	.ascii "INTRO   SCR"
             20 53 43 52
    00000210 00                     284 	.db 0x00
                                    285 ;src/intro.c:174: static void i_reset_timers(void) {
                                    286 ;	---------------------------------
                                    287 ; Function i_reset_timers
                                    288 ; ---------------------------------
    00000211                        289 _i_reset_timers:
                                    290 ;src/intro.c:176: i_int_idx = 0;
                                    291 ;src/intro.c:177: i_frame_c = 0;
    00000211 AF               [ 4]  292 	xor	a, a
    00000212 32 51 93         [13]  293 	ld	(_i_int_idx+0), a
    00000215 32 52 93         [13]  294 	ld	(_i_frame_c+0), a
                                    295 ;src/intro.c:178: }
    00000218 C9               [10]  296 	ret
                                    297 ;src/intro.c:180: static void i_add_interrupt(void) {
                                    298 ;	---------------------------------
                                    299 ; Function i_add_interrupt
                                    300 ; ---------------------------------
    00000219                        301 _i_add_interrupt:
                                    302 ;src/intro.c:191: cpct_waitVSYNC();
    00000219 CD 67 2F         [17]  303 	call	_cpct_waitVSYNC
                                    304 ;src/intro.c:193: cpct_asicSetLinesInterruptHandler(i_interrupt, lines, sizeof(lines));
    0000021C 21 06 00         [10]  305 	ld	hl, #0x0006
    0000021F E5               [11]  306 	push	hl
    00000220 11 2A 02         [10]  307 	ld	de, #_i_add_interrupt_lines_10000_280
    00000223 21 33 02         [10]  308 	ld	hl, #_i_interrupt
    00000226 CD C5 2F         [17]  309 	call	_cpct_asicSetLinesInterruptHandler
                                    310 ;src/intro.c:194: }
    00000229 C9               [10]  311 	ret
    0000022A                        312 _i_add_interrupt_lines_10000_280:
    0000022A 00                     313 	.db #0x00	; 0
    0000022B 32                     314 	.db #0x32	; 50	'2'
    0000022C 50                     315 	.db #0x50	; 80	'P'
    0000022D 78                     316 	.db #0x78	; 120	'x'
    0000022E A9                     317 	.db #0xa9	; 169
    0000022F B8                     318 	.db #0xb8	; 184
                                    319 ;src/intro.c:196: static void i_remove_interrupt(void) {
                                    320 ;	---------------------------------
                                    321 ; Function i_remove_interrupt
                                    322 ; ---------------------------------
    00000230                        323 _i_remove_interrupt:
                                    324 ;src/intro.c:198: cpct_asicRemoveLinesInterruptHandler();
                                    325 ;src/intro.c:199: }
    00000230 C3 3A 30         [10]  326 	jp	_cpct_asicRemoveLinesInterruptHandler
                                    327 ;src/intro.c:201: static void i_interrupt(u8 line) __z88dk_fastcall {
                                    328 ;	---------------------------------
                                    329 ; Function i_interrupt
                                    330 ; ---------------------------------
    00000233                        331 _i_interrupt:
    00000233 7D               [ 4]  332 	ld	a, l
                                    333 ;src/intro.c:203: if (line == INTRO_RASTER_TOP) {
    00000234 B7               [ 4]  334 	or	a, a
    00000235 20 19            [12]  335 	jr	NZ, 00129$
                                    336 ;src/intro.c:204: if (!show_roland)
    00000237 21 53 93         [10]  337 	ld	hl, #_show_roland
    0000023A CB 46            [12]  338 	bit	0, (hl)
    0000023C 20 09            [12]  339 	jr	NZ, 00102$
                                    340 ;src/intro.c:205: cpct_asicSetPalette(i_pal_blank_white, 4);
    0000023E 11 04 00         [10]  341 	ld	de, #0x0004
    00000241 21 BE 01         [10]  342 	ld	hl, #_i_pal_blank_white
    00000244 C3 0D 2D         [10]  343 	jp	_cpct_asicSetPalette
    00000247                        344 00102$:
                                    345 ;src/intro.c:207: cpct_asicSetPalette(i_pal_top, 4);
    00000247 11 04 00         [10]  346 	ld	de, #0x0004
    0000024A 21 CE 01         [10]  347 	ld	hl, #_i_pal_top
    0000024D C3 0D 2D         [10]  348 	jp	_cpct_asicSetPalette
    00000250                        349 00129$:
                                    350 ;src/intro.c:208: } else if (line == INTRO_RASTER_SLOPES) {
    00000250 FE 32            [ 7]  351 	cp	a, #0x32
    00000252 20 09            [12]  352 	jr	NZ, 00126$
                                    353 ;src/intro.c:209: cpct_asicSetPalette(i_pal_in, 4);
    00000254 11 04 00         [10]  354 	ld	de, #0x0004
    00000257 21 A6 01         [10]  355 	ld	hl, #_i_pal_in
    0000025A C3 0D 2D         [10]  356 	jp	_cpct_asicSetPalette
    0000025D                        357 00126$:
                                    358 ;src/intro.c:210: } else if (line == INTRO_RASTER_SCENERY) {
    0000025D FE 50            [ 7]  359 	cp	a, #0x50
    0000025F 20 09            [12]  360 	jr	NZ, 00123$
                                    361 ;src/intro.c:211: cpct_asicSetPalette(i_pal_trees, 4);
    00000261 11 04 00         [10]  362 	ld	de, #0x0004
    00000264 21 B6 01         [10]  363 	ld	hl, #_i_pal_trees
    00000267 C3 0D 2D         [10]  364 	jp	_cpct_asicSetPalette
    0000026A                        365 00123$:
                                    366 ;src/intro.c:212: } else if (line == INTRO_RASTER_DO_STUFF) {
    0000026A FE 78            [ 7]  367 	cp	a, #0x78
    0000026C 20 3D            [12]  368 	jr	NZ, 00120$
                                    369 ;src/intro.c:214: if (i_int_idx == 0) {
    0000026E 3A 51 93         [13]  370 	ld	a, (_i_int_idx+0)
    00000271 B7               [ 4]  371 	or	a, a
    00000272 20 12            [12]  372 	jr	NZ, 00107$
                                    373 ;src/intro.c:215: if (++i_frame_c == FC_MAX)
    00000274 FD 21 52 93      [14]  374 	ld	iy, #_i_frame_c
    00000278 FD 34 00         [23]  375 	inc	0 (iy)
    0000027B 3A 52 93         [13]  376 	ld	a, (_i_frame_c+0)
    0000027E D6 32            [ 7]  377 	sub	a, #0x32
    00000280 20 04            [12]  378 	jr	NZ, 00107$
                                    379 ;src/intro.c:216: i_frame_c = 0;
    00000282 FD 36 00 00      [19]  380 	ld	0 (iy), #0x00
    00000286                        381 00107$:
                                    382 ;src/intro.c:219: if (i_int_idx == 1)
    00000286 3A 51 93         [13]  383 	ld	a, (_i_int_idx+0)
    00000289 3D               [ 4]  384 	dec	a
    0000028A 20 03            [12]  385 	jr	NZ, 00109$
                                    386 ;src/intro.c:220: cpct_scanKeyboard_if();
    0000028C CD 96 2E         [17]  387 	call	_cpct_scanKeyboard_if
    0000028F                        388 00109$:
                                    389 ;src/intro.c:222: if (i_int_idx == 2)
    0000028F 3A 51 93         [13]  390 	ld	a, (_i_int_idx+0)
    00000292 D6 02            [ 7]  391 	sub	a, #0x02
    00000294 20 03            [12]  392 	jr	NZ, 00111$
                                    393 ;src/intro.c:223: u_clock_interrupt();
    00000296 CD 71 15         [17]  394 	call	_u_clock_interrupt
    00000299                        395 00111$:
                                    396 ;src/intro.c:225: if (++i_int_idx == 6)
    00000299 FD 21 51 93      [14]  397 	ld	iy, #_i_int_idx
    0000029D FD 34 00         [23]  398 	inc	0 (iy)
    000002A0 3A 51 93         [13]  399 	ld	a, (_i_int_idx+0)
    000002A3 D6 06            [ 7]  400 	sub	a, #0x06
    000002A5 C0               [11]  401 	ret	NZ
                                    402 ;src/intro.c:226: i_int_idx = 0;
    000002A6 FD 36 00 00      [19]  403 	ld	0 (iy), #0x00
    000002AA C9               [10]  404 	ret
    000002AB                        405 00120$:
                                    406 ;src/intro.c:227: } else if (line == INTRO_RASTER_ICE) {
    000002AB FE A9            [ 7]  407 	cp	a, #0xa9
    000002AD 20 09            [12]  408 	jr	NZ, 00117$
                                    409 ;src/intro.c:228: cpct_asicSetPalette(i_pal_ice, 4);
    000002AF 11 04 00         [10]  410 	ld	de, #0x0004
    000002B2 21 AE 01         [10]  411 	ld	hl, #_i_pal_ice
    000002B5 C3 0D 2D         [10]  412 	jp	_cpct_asicSetPalette
    000002B8                        413 00117$:
                                    414 ;src/intro.c:229: } else if (line == INTRO_RASTER_TEXT) {
    000002B8 D6 B8            [ 7]  415 	sub	a, #0xb8
    000002BA C0               [11]  416 	ret	NZ
                                    417 ;src/intro.c:230: cpct_asicSetPalette(i_pal_blank_ice, 4);
    000002BB 11 04 00         [10]  418 	ld	de, #0x0004
    000002BE 21 C6 01         [10]  419 	ld	hl, #_i_pal_blank_ice
                                    420 ;src/intro.c:232: }
    000002C1 C3 0D 2D         [10]  421 	jp	_cpct_asicSetPalette
                                    422 ;src/intro.c:234: static void i_scroll_sprite_h(i16 start_x, i16 end_x, i16 step, u8 y,
                                    423 ;	---------------------------------
                                    424 ; Function i_scroll_sprite_h
                                    425 ; ---------------------------------
    000002C4                        426 _i_scroll_sprite_h:
    000002C4 DD E5            [15]  427 	push	ix
    000002C6 DD 21 00 00      [14]  428 	ld	ix,#0
    000002CA DD 39            [15]  429 	add	ix,sp
    000002CC F5               [11]  430 	push	af
    000002CD 3B               [ 6]  431 	dec	sp
    000002CE 4B               [ 4]  432 	ld	c, e
    000002CF 42               [ 4]  433 	ld	b, d
                                    434 ;src/intro.c:238: load_fn(reversed);
    000002D0 E5               [11]  435 	push	hl
    000002D1 C5               [11]  436 	push	bc
    000002D2 DD 7E 07         [19]  437 	ld	a, 7 (ix)
    000002D5 DD 6E 08         [19]  438 	ld	l, 8 (ix)
    000002D8 DD 66 09         [19]  439 	ld	h, 9 (ix)
    000002DB CD 89 2E         [17]  440 	call	___sdcc_call_hl
                                    441 ;src/intro.c:239: a_set_hardware_sprite_palette(palette);
    000002DE DD 6E 0A         [19]  442 	ld	l, 10 (ix)
    000002E1 DD 66 0B         [19]  443 	ld	h, 11 (ix)
    000002E4 CD 75 10         [17]  444 	call	_a_set_hardware_sprite_palette
    000002E7 C1               [10]  445 	pop	bc
    000002E8 E1               [10]  446 	pop	hl
                                    447 ;src/intro.c:241: for (i16 x = start_x; (step > 0) ? (x <= end_x) : (x >= end_x);
    000002E9 DD 75 FE         [19]  448 	ld	-2 (ix), l
    000002EC DD 74 FF         [19]  449 	ld	-1 (ix), h
    000002EF AF               [ 4]  450 	xor	a, a
    000002F0 DD BE 04         [19]  451 	cp	a, 4 (ix)
    000002F3 DD 9E 05         [19]  452 	sbc	a, 5 (ix)
    000002F6 E2 FB 02         [10]  453 	jp	PO, 00148$
    000002F9 EE 80            [ 7]  454 	xor	a, #0x80
    000002FB                        455 00148$:
    000002FB 07               [ 4]  456 	rlca
    000002FC E6 01            [ 7]  457 	and	a,#0x01
    000002FE DD 77 FD         [19]  458 	ld	-3 (ix), a
    00000301                        459 00107$:
    00000301 DD 7E FD         [19]  460 	ld	a, -3 (ix)
    00000304 B7               [ 4]  461 	or	a, a
    00000305 28 14            [12]  462 	jr	Z, 00111$
    00000307 79               [ 4]  463 	ld	a, c
    00000308 DD 96 FE         [19]  464 	sub	a, -2 (ix)
    0000030B 78               [ 4]  465 	ld	a, b
    0000030C DD 9E FF         [19]  466 	sbc	a, -1 (ix)
    0000030F E2 14 03         [10]  467 	jp	PO, 00149$
    00000312 EE 80            [ 7]  468 	xor	a, #0x80
    00000314                        469 00149$:
    00000314 07               [ 4]  470 	rlca
    00000315 E6 01            [ 7]  471 	and	a,#0x01
    00000317 EE 01            [ 7]  472 	xor	a, #0x01
    00000319 18 12            [12]  473 	jr	00112$
    0000031B                        474 00111$:
    0000031B DD 7E FE         [19]  475 	ld	a, -2 (ix)
    0000031E 91               [ 4]  476 	sub	a, c
    0000031F DD 7E FF         [19]  477 	ld	a, -1 (ix)
    00000322 98               [ 4]  478 	sbc	a, b
    00000323 E2 28 03         [10]  479 	jp	PO, 00150$
    00000326 EE 80            [ 7]  480 	xor	a, #0x80
    00000328                        481 00150$:
    00000328 07               [ 4]  482 	rlca
    00000329 E6 01            [ 7]  483 	and	a,#0x01
    0000032B EE 01            [ 7]  484 	xor	a, #0x01
    0000032D                        485 00112$:
    0000032D B7               [ 4]  486 	or	a, a
    0000032E 28 6E            [12]  487 	jr	Z, 00109$
                                    488 ;src/intro.c:244: pos_fn(x, y, reversed);
    00000330 DD 5E 06         [19]  489 	ld	e, 6 (ix)
    00000333 16 00            [ 7]  490 	ld	d, #0x00
    00000335 C5               [11]  491 	push	bc
    00000336 DD 7E 07         [19]  492 	ld	a, 7 (ix)
    00000339 F5               [11]  493 	push	af
    0000033A 33               [ 6]  494 	inc	sp
    0000033B DD 6E FE         [19]  495 	ld	l, -2 (ix)
    0000033E DD 66 FF         [19]  496 	ld	h, -1 (ix)
    00000341 FD E5            [15]  497 	push	iy
    00000343 E3               [19]  498 	ex	(sp), hl
    00000344 DD 6E 0C         [19]  499 	ld	l, 12 (ix)
    00000347 E3               [19]  500 	ex	(sp), hl
    00000348 E3               [19]  501 	ex	(sp), hl
    00000349 DD 66 0D         [19]  502 	ld	h, 13 (ix)
    0000034C E3               [19]  503 	ex	(sp), hl
    0000034D FD E1            [14]  504 	pop	iy
    0000034F CD A8 2F         [17]  505 	call	___sdcc_call_iy
    00000352 C1               [10]  506 	pop	bc
                                    507 ;src/intro.c:246: if (tick_fn)
    00000353 DD 7E 0F         [19]  508 	ld	a, 15 (ix)
    00000356 DD B6 0E         [19]  509 	or	a, 14 (ix)
    00000359 28 19            [12]  510 	jr	Z, 00102$
                                    511 ;src/intro.c:247: tick_fn(tick_state);
    0000035B C5               [11]  512 	push	bc
    0000035C DD 6E 10         [19]  513 	ld	l, 16 (ix)
    0000035F DD 66 11         [19]  514 	ld	h, 17 (ix)
    00000362 FD E5            [15]  515 	push	iy
    00000364 E3               [19]  516 	ex	(sp), hl
    00000365 DD 6E 0E         [19]  517 	ld	l, 14 (ix)
    00000368 E3               [19]  518 	ex	(sp), hl
    00000369 E3               [19]  519 	ex	(sp), hl
    0000036A DD 66 0F         [19]  520 	ld	h, 15 (ix)
    0000036D E3               [19]  521 	ex	(sp), hl
    0000036E FD E1            [14]  522 	pop	iy
    00000370 CD A8 2F         [17]  523 	call	___sdcc_call_iy
    00000373 C1               [10]  524 	pop	bc
    00000374                        525 00102$:
                                    526 ;src/intro.c:249: cpct_waitVSYNC();
    00000374 C5               [11]  527 	push	bc
    00000375 CD 67 2F         [17]  528 	call	_cpct_waitVSYNC
                                    529 ;src/intro.c:250: if (cpct_isAnyKeyPressed()) {
    00000378 CD 8A 2E         [17]  530 	call	_cpct_isAnyKeyPressed
    0000037B C1               [10]  531 	pop	bc
    0000037C B7               [ 4]  532 	or	a, a
    0000037D 28 0A            [12]  533 	jr	Z, 00108$
                                    534 ;src/intro.c:251: g_skip = true;
    0000037F FD 21 58 93      [14]  535 	ld	iy, #_g_skip
    00000383 FD 36 00 01      [19]  536 	ld	0 (iy), #0x01
                                    537 ;src/intro.c:252: return;
    00000387 18 15            [12]  538 	jr	00109$
    00000389                        539 00108$:
                                    540 ;src/intro.c:242: x += step) {
    00000389 DD 7E FE         [19]  541 	ld	a, -2 (ix)
    0000038C DD 86 04         [19]  542 	add	a, 4 (ix)
    0000038F DD 77 FE         [19]  543 	ld	-2 (ix), a
    00000392 DD 7E FF         [19]  544 	ld	a, -1 (ix)
    00000395 DD 8E 05         [19]  545 	adc	a, 5 (ix)
    00000398 DD 77 FF         [19]  546 	ld	-1 (ix), a
    0000039B C3 01 03         [10]  547 	jp	00107$
    0000039E                        548 00109$:
                                    549 ;src/intro.c:255: }
    0000039E DD F9            [10]  550 	ld	sp, ix
    000003A0 DD E1            [14]  551 	pop	ix
    000003A2 E1               [10]  552 	pop	hl
    000003A3 F1               [10]  553 	pop	af
    000003A4 F1               [10]  554 	pop	af
    000003A5 F1               [10]  555 	pop	af
    000003A6 F1               [10]  556 	pop	af
    000003A7 F1               [10]  557 	pop	af
    000003A8 F1               [10]  558 	pop	af
    000003A9 F1               [10]  559 	pop	af
    000003AA E9               [ 4]  560 	jp	(hl)
                                    561 ;src/intro.c:257: static void i_ani_ghost_l(u8 y, u8 speed) {
                                    562 ;	---------------------------------
                                    563 ; Function i_ani_ghost_l
                                    564 ; ---------------------------------
    000003AB                        565 _i_ani_ghost_l:
    000003AB 57               [ 4]  566 	ld	d, a
    000003AC 4D               [ 4]  567 	ld	c, l
                                    568 ;src/intro.c:261: v_set_intro_ghost_sprite_pos, i_ghost_tick, (u8 *)&g_ghost_bob);
                                    569 ;src/intro.c:260: a_load_ghost_sprites, ghost_sprites_palette,
                                    570 ;src/intro.c:259: i_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y, false,
    000003AD 06 00            [ 7]  571 	ld	b, #0x00
    000003AF 21 54 93         [10]  572 	ld	hl, #_g_ghost_bob
    000003B2 E5               [11]  573 	push	hl
    000003B3 21 94 05         [10]  574 	ld	hl, #_i_ghost_tick
    000003B6 E5               [11]  575 	push	hl
    000003B7 21 71 16         [10]  576 	ld	hl, #_v_set_intro_ghost_sprite_pos
    000003BA E5               [11]  577 	push	hl
    000003BB 21 80 92         [10]  578 	ld	hl, #_ghost_sprites_palette
    000003BE E5               [11]  579 	push	hl
    000003BF 21 9D 10         [10]  580 	ld	hl, #_a_load_ghost_sprites
    000003C2 E5               [11]  581 	push	hl
    000003C3 AF               [ 4]  582 	xor	a, a
    000003C4 F5               [11]  583 	push	af
    000003C5 33               [ 6]  584 	inc	sp
    000003C6 D5               [11]  585 	push	de
    000003C7 33               [ 6]  586 	inc	sp
    000003C8 C5               [11]  587 	push	bc
    000003C9 11 80 02         [10]  588 	ld	de, #0x0280
    000003CC 21 00 FF         [10]  589 	ld	hl, #0xff00
    000003CF CD C4 02         [17]  590 	call	_i_scroll_sprite_h
                                    591 ;src/intro.c:262: }
    000003D2 C9               [10]  592 	ret
                                    593 ;src/intro.c:264: static void i_ani_roland_l(u8 y, u8 speed) {
                                    594 ;	---------------------------------
                                    595 ; Function i_ani_roland_l
                                    596 ; ---------------------------------
    000003D3                        597 _i_ani_roland_l:
    000003D3 57               [ 4]  598 	ld	d, a
    000003D4 4D               [ 4]  599 	ld	c, l
                                    600 ;src/intro.c:267: a_load_roland_sprites, roland_sprites_palette,
                                    601 ;src/intro.c:266: i_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y, false,
    000003D5 06 00            [ 7]  602 	ld	b, #0x00
    000003D7 21 00 00         [10]  603 	ld	hl, #0x0000
    000003DA E5               [11]  604 	push	hl
    000003DB E5               [11]  605 	push	hl
    000003DC 21 F2 16         [10]  606 	ld	hl, #_v_set_intro_roland_sprite_pos
    000003DF E5               [11]  607 	push	hl
    000003E0 21 20 92         [10]  608 	ld	hl, #_roland_sprites_palette
    000003E3 E5               [11]  609 	push	hl
    000003E4 21 8F 10         [10]  610 	ld	hl, #_a_load_roland_sprites
    000003E7 E5               [11]  611 	push	hl
    000003E8 AF               [ 4]  612 	xor	a, a
    000003E9 F5               [11]  613 	push	af
    000003EA 33               [ 6]  614 	inc	sp
    000003EB D5               [11]  615 	push	de
    000003EC 33               [ 6]  616 	inc	sp
    000003ED C5               [11]  617 	push	bc
    000003EE 11 80 02         [10]  618 	ld	de, #0x0280
    000003F1 21 00 FF         [10]  619 	ld	hl, #0xff00
    000003F4 CD C4 02         [17]  620 	call	_i_scroll_sprite_h
                                    621 ;src/intro.c:269: }
    000003F7 C9               [10]  622 	ret
                                    623 ;src/intro.c:271: static void i_ani_roland_r(u8 y, u8 speed) {
                                    624 ;	---------------------------------
                                    625 ; Function i_ani_roland_r
                                    626 ; ---------------------------------
    000003F8                        627 _i_ani_roland_r:
    000003F8 47               [ 4]  628 	ld	b, a
                                    629 ;src/intro.c:274: a_load_roland_sprites, roland_sprites_palette,
    000003F9 11 20 92         [10]  630 	ld	de, #_roland_sprites_palette+0
                                    631 ;src/intro.c:273: i_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y, true,
    000003FC AF               [ 4]  632 	xor	a, a
    000003FD 67               [ 4]  633 	ld	h, a
    000003FE 95               [ 4]  634 	sub	a, l
    000003FF 4F               [ 4]  635 	ld	c, a
    00000400 9F               [ 4]  636 	sbc	a, a
    00000401 94               [ 4]  637 	sub	a, h
    00000402 21 00 00         [10]  638 	ld	hl, #0x0000
    00000405 E5               [11]  639 	push	hl
    00000406 E5               [11]  640 	push	hl
    00000407 21 F2 16         [10]  641 	ld	hl, #_v_set_intro_roland_sprite_pos
    0000040A E5               [11]  642 	push	hl
    0000040B D5               [11]  643 	push	de
    0000040C 21 8F 10         [10]  644 	ld	hl, #_a_load_roland_sprites
    0000040F E5               [11]  645 	push	hl
    00000410 26 01            [ 7]  646 	ld	h, #0x01
    00000412 68               [ 4]  647 	ld	l, b
    00000413 E5               [11]  648 	push	hl
    00000414 47               [ 4]  649 	ld	b, a
    00000415 C5               [11]  650 	push	bc
    00000416 11 00 FF         [10]  651 	ld	de, #0xff00
    00000419 21 80 02         [10]  652 	ld	hl, #0x0280
    0000041C CD C4 02         [17]  653 	call	_i_scroll_sprite_h
                                    654 ;src/intro.c:276: }
    0000041F C9               [10]  655 	ret
                                    656 ;src/intro.c:278: static void i_spider_tick(u8 *state_ptr) {
                                    657 ;	---------------------------------
                                    658 ; Function i_spider_tick
                                    659 ; ---------------------------------
    00000420                        660 _i_spider_tick:
    00000420 DD E5            [15]  661 	push	ix
    00000422 DD 21 00 00      [14]  662 	ld	ix,#0
    00000426 DD 39            [15]  663 	add	ix,sp
    00000428 F5               [11]  664 	push	af
                                    665 ;src/intro.c:280: sprite_anim_state_t *s = (sprite_anim_state_t *)state_ptr;
                                    666 ;src/intro.c:282: if (++s->count == 8) {
    00000429 5D               [ 4]  667 	ld	e, l
    0000042A 54               [ 4]  668 	ld	d, h
    0000042B 23               [ 6]  669 	inc	hl
    0000042C E3               [19]  670 	ex	(sp), hl
    0000042D E1               [10]  671 	pop	hl
    0000042E E5               [11]  672 	push	hl
    0000042F 7E               [ 7]  673 	ld	a, (hl)
    00000430 3C               [ 4]  674 	inc	a
    00000431 E1               [10]  675 	pop	hl
    00000432 E5               [11]  676 	push	hl
    00000433 77               [ 7]  677 	ld	(hl), a
    00000434 D6 08            [ 7]  678 	sub	a, #0x08
    00000436 20 1F            [12]  679 	jr	NZ, 00106$
                                    680 ;src/intro.c:284: v_spider_set_frame(s->frame);
    00000438 6B               [ 4]  681 	ld	l, e
    00000439 62               [ 4]  682 	ld	h, d
    0000043A 7E               [ 7]  683 	ld	a, (hl)
    0000043B E5               [11]  684 	push	hl
    0000043C D5               [11]  685 	push	de
    0000043D CD ED 19         [17]  686 	call	_v_spider_set_frame
    00000440 D1               [10]  687 	pop	de
    00000441 E1               [10]  688 	pop	hl
                                    689 ;src/intro.c:286: s->frame += s->dir;
    00000442 4E               [ 7]  690 	ld	c, (hl)
    00000443 13               [ 6]  691 	inc	de
    00000444 13               [ 6]  692 	inc	de
    00000445 1A               [ 7]  693 	ld	a, (de)
    00000446 81               [ 4]  694 	add	a, c
                                    695 ;src/intro.c:289: if (s->frame == 2 || s->frame == 0)
    00000447 77               [ 7]  696 	ld	(hl), a
    00000448 FE 02            [ 7]  697 	cp	a, #0x02
    0000044A 28 03            [12]  698 	jr	Z, 00101$
    0000044C B7               [ 4]  699 	or	a, a
    0000044D 20 04            [12]  700 	jr	NZ, 00102$
    0000044F                        701 00101$:
                                    702 ;src/intro.c:290: s->dir = -s->dir;
    0000044F 1A               [ 7]  703 	ld	a, (de)
    00000450 ED 44            [ 8]  704 	neg
    00000452 12               [ 7]  705 	ld	(de), a
    00000453                        706 00102$:
                                    707 ;src/intro.c:292: s->count = 0;
    00000453 E1               [10]  708 	pop	hl
    00000454 36 00            [10]  709 	ld	(hl), #0x00
    00000456 E5               [11]  710 	push	hl
    00000457                        711 00106$:
                                    712 ;src/intro.c:294: }
    00000457 F1               [10]  713 	pop	af
    00000458 DD E1            [14]  714 	pop	ix
    0000045A C9               [10]  715 	ret
                                    716 ;src/intro.c:296: static void i_snowball_tick(u8 *state_ptr) {
                                    717 ;	---------------------------------
                                    718 ; Function i_snowball_tick
                                    719 ; ---------------------------------
    0000045B                        720 _i_snowball_tick:
                                    721 ;src/intro.c:298: sprite_anim_state_t *s = (sprite_anim_state_t *)state_ptr;
                                    722 ;src/intro.c:300: if (++s->count == 8) {
    0000045B 4D               [ 4]  723 	ld	c, l
    0000045C 44               [ 4]  724 	ld	b, h
    0000045D 03               [ 6]  725 	inc	bc
    0000045E 0A               [ 7]  726 	ld	a, (bc)
    0000045F 3C               [ 4]  727 	inc	a
    00000460 02               [ 7]  728 	ld	(bc), a
    00000461 D6 08            [ 7]  729 	sub	a, #0x08
    00000463 C0               [11]  730 	ret	NZ
                                    731 ;src/intro.c:302: v_snowball_set_frame(s->frame);
    00000464 7E               [ 7]  732 	ld	a, (hl)
    00000465 E5               [11]  733 	push	hl
    00000466 C5               [11]  734 	push	bc
    00000467 CD 50 1A         [17]  735 	call	_v_snowball_set_frame
    0000046A C1               [10]  736 	pop	bc
    0000046B E1               [10]  737 	pop	hl
                                    738 ;src/intro.c:304: s->frame++;
    0000046C 34               [11]  739 	inc	(hl)
    0000046D 7E               [ 7]  740 	ld	a, (hl)
                                    741 ;src/intro.c:305: if (s->frame > 3)
    0000046E FE 04            [ 7]  742 	cp	a, #0x04
    00000470 38 02            [12]  743 	jr	C, 00102$
                                    744 ;src/intro.c:306: s->frame = 0;
    00000472 36 00            [10]  745 	ld	(hl), #0x00
    00000474                        746 00102$:
                                    747 ;src/intro.c:308: s->count = 0;
    00000474 AF               [ 4]  748 	xor	a, a
    00000475 02               [ 7]  749 	ld	(bc), a
                                    750 ;src/intro.c:310: }
    00000476 C9               [10]  751 	ret
                                    752 ;src/intro.c:312: static void i_spider_init(void) {
                                    753 ;	---------------------------------
                                    754 ; Function i_spider_init
                                    755 ; ---------------------------------
    00000477                        756 _i_spider_init:
                                    757 ;src/intro.c:314: for (u8 i = 0; i < 3; i++)
    00000477 0E 00            [ 7]  758 	ld	c, #0x00
    00000479                        759 00104$:
    00000479 79               [ 4]  760 	ld	a, c
    0000047A D6 03            [ 7]  761 	sub	a, #0x03
    0000047C 30 0F            [12]  762 	jr	NC, 00101$
                                    763 ;src/intro.c:315: cpct_asicSetSpriteZoom(i, 2, 1);
    0000047E 69               [ 4]  764 	ld	l, c
    0000047F 26 00            [ 7]  765 	ld	h, #0x00
    00000481 C5               [11]  766 	push	bc
    00000482 11 02 01         [10]  767 	ld	de, #0x102
    00000485 D5               [11]  768 	push	de
    00000486 CD E6 2D         [17]  769 	call	_cpct_asicSetSpriteZoom
    00000489 C1               [10]  770 	pop	bc
                                    771 ;src/intro.c:314: for (u8 i = 0; i < 3; i++)
    0000048A 0C               [ 4]  772 	inc	c
    0000048B 18 EC            [12]  773 	jr	00104$
    0000048D                        774 00101$:
                                    775 ;src/intro.c:317: for (u8 i = 3; i < 12; i++)
    0000048D 0E 03            [ 7]  776 	ld	c, #0x03
    0000048F                        777 00107$:
    0000048F 79               [ 4]  778 	ld	a, c
    00000490 D6 0C            [ 7]  779 	sub	a, #0x0c
    00000492 D0               [11]  780 	ret	NC
                                    781 ;src/intro.c:318: cpct_asicSetSpriteZoom(i, 0, 0);
    00000493 69               [ 4]  782 	ld	l, c
    00000494 26 00            [ 7]  783 	ld	h, #0x00
    00000496 C5               [11]  784 	push	bc
    00000497 11 00 00         [10]  785 	ld	de, #0x00
    0000049A D5               [11]  786 	push	de
    0000049B CD E6 2D         [17]  787 	call	_cpct_asicSetSpriteZoom
    0000049E C1               [10]  788 	pop	bc
                                    789 ;src/intro.c:317: for (u8 i = 3; i < 12; i++)
    0000049F 0C               [ 4]  790 	inc	c
                                    791 ;src/intro.c:319: }
    000004A0 18 ED            [12]  792 	jr	00107$
                                    793 ;src/intro.c:321: static void i_snowball_init(void) {
                                    794 ;	---------------------------------
                                    795 ; Function i_snowball_init
                                    796 ; ---------------------------------
    000004A2                        797 _i_snowball_init:
                                    798 ;src/intro.c:323: for (u8 i = 2; i < 8; i++)
    000004A2 0E 02            [ 7]  799 	ld	c, #0x02
    000004A4                        800 00104$:
    000004A4 79               [ 4]  801 	ld	a, c
    000004A5 D6 08            [ 7]  802 	sub	a, #0x08
    000004A7 30 0F            [12]  803 	jr	NC, 00101$
                                    804 ;src/intro.c:324: cpct_asicSetSpriteZoom(i, 0, 0);
    000004A9 69               [ 4]  805 	ld	l, c
    000004AA 26 00            [ 7]  806 	ld	h, #0x00
    000004AC C5               [11]  807 	push	bc
    000004AD 11 00 00         [10]  808 	ld	de, #0x00
    000004B0 D5               [11]  809 	push	de
    000004B1 CD E6 2D         [17]  810 	call	_cpct_asicSetSpriteZoom
    000004B4 C1               [10]  811 	pop	bc
                                    812 ;src/intro.c:323: for (u8 i = 2; i < 8; i++)
    000004B5 0C               [ 4]  813 	inc	c
    000004B6 18 EC            [12]  814 	jr	00104$
    000004B8                        815 00101$:
                                    816 ;src/intro.c:325: for (u8 i = 10; i < 16; i++)
    000004B8 0E 0A            [ 7]  817 	ld	c, #0x0a
    000004BA                        818 00107$:
    000004BA 79               [ 4]  819 	ld	a, c
    000004BB D6 10            [ 7]  820 	sub	a, #0x10
    000004BD 30 0F            [12]  821 	jr	NC, 00102$
                                    822 ;src/intro.c:326: cpct_asicSetSpriteZoom(i, 0, 0);
    000004BF 69               [ 4]  823 	ld	l, c
    000004C0 26 00            [ 7]  824 	ld	h, #0x00
    000004C2 C5               [11]  825 	push	bc
    000004C3 11 00 00         [10]  826 	ld	de, #0x00
    000004C6 D5               [11]  827 	push	de
    000004C7 CD E6 2D         [17]  828 	call	_cpct_asicSetSpriteZoom
    000004CA C1               [10]  829 	pop	bc
                                    830 ;src/intro.c:325: for (u8 i = 10; i < 16; i++)
    000004CB 0C               [ 4]  831 	inc	c
    000004CC 18 EC            [12]  832 	jr	00107$
    000004CE                        833 00102$:
                                    834 ;src/intro.c:328: cpct_asicSetSpriteZoom(0, 2, 1);
    000004CE 21 02 01         [10]  835 	ld	hl, #0x102
    000004D1 E5               [11]  836 	push	hl
    000004D2 21 00 00         [10]  837 	ld	hl, #0x0000
    000004D5 CD E6 2D         [17]  838 	call	_cpct_asicSetSpriteZoom
                                    839 ;src/intro.c:329: cpct_asicSetSpriteZoom(1, 2, 1);
    000004D8 21 02 01         [10]  840 	ld	hl, #0x102
    000004DB E5               [11]  841 	push	hl
    000004DC 21 01 00         [10]  842 	ld	hl, #0x0001
    000004DF CD E6 2D         [17]  843 	call	_cpct_asicSetSpriteZoom
                                    844 ;src/intro.c:330: cpct_asicSetSpriteZoom(8, 2, 1);
    000004E2 21 02 01         [10]  845 	ld	hl, #0x102
    000004E5 E5               [11]  846 	push	hl
    000004E6 21 08 00         [10]  847 	ld	hl, #0x0008
    000004E9 CD E6 2D         [17]  848 	call	_cpct_asicSetSpriteZoom
                                    849 ;src/intro.c:331: cpct_asicSetSpriteZoom(9, 2, 1);
    000004EC 21 02 01         [10]  850 	ld	hl, #0x102
    000004EF E5               [11]  851 	push	hl
    000004F0 21 09 00         [10]  852 	ld	hl, #0x0009
    000004F3 CD E6 2D         [17]  853 	call	_cpct_asicSetSpriteZoom
                                    854 ;src/intro.c:332: }
    000004F6 C9               [10]  855 	ret
                                    856 ;src/intro.c:334: static void i_ani_snowball_r(u8 y, u8 speed) {
                                    857 ;	---------------------------------
                                    858 ; Function i_ani_snowball_r
                                    859 ; ---------------------------------
    000004F7                        860 _i_ani_snowball_r:
    000004F7 DD E5            [15]  861 	push	ix
    000004F9 DD 21 00 00      [14]  862 	ld	ix,#0
    000004FD DD 39            [15]  863 	add	ix,sp
    000004FF F5               [11]  864 	push	af
    00000500 3B               [ 6]  865 	dec	sp
    00000501 57               [ 4]  866 	ld	d, a
    00000502 5D               [ 4]  867 	ld	e, l
                                    868 ;src/intro.c:336: sprite_anim_state_t state = {.frame = 0, .count = 0, .dir = 1};
    00000503 DD 36 FD 00      [19]  869 	ld	-3 (ix), #0x00
    00000507 DD 36 FE 00      [19]  870 	ld	-2 (ix), #0x00
    0000050B DD 36 FF 01      [19]  871 	ld	-1 (ix), #0x01
                                    872 ;src/intro.c:338: a_load_snowball_sprites(false);
    0000050F D5               [11]  873 	push	de
    00000510 AF               [ 4]  874 	xor	a, a
    00000511 CD B9 10         [17]  875 	call	_a_load_snowball_sprites
                                    876 ;src/intro.c:339: i_snowball_init();
    00000514 CD A2 04         [17]  877 	call	_i_snowball_init
    00000517 D1               [10]  878 	pop	de
                                    879 ;src/intro.c:343: v_set_intro_snowball_sprite_pos, i_snowball_tick, (u8 *)&state);
                                    880 ;src/intro.c:342: a_load_snowball_sprites, snowball_sprites_palette,
                                    881 ;src/intro.c:341: i_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y, false,
    00000518 4B               [ 4]  882 	ld	c, e
    00000519 AF               [ 4]  883 	xor	a, a
    0000051A 47               [ 4]  884 	ld	b, a
    0000051B 91               [ 4]  885 	sub	a, c
    0000051C 4F               [ 4]  886 	ld	c, a
    0000051D 9F               [ 4]  887 	sbc	a, a
    0000051E 90               [ 4]  888 	sub	a, b
    0000051F 47               [ 4]  889 	ld	b, a
    00000520 21 00 00         [10]  890 	ld	hl, #0
    00000523 39               [11]  891 	add	hl, sp
    00000524 E5               [11]  892 	push	hl
    00000525 21 5B 04         [10]  893 	ld	hl, #_i_snowball_tick
    00000528 E5               [11]  894 	push	hl
    00000529 21 1F 19         [10]  895 	ld	hl, #_v_set_intro_snowball_sprite_pos
    0000052C E5               [11]  896 	push	hl
    0000052D 21 40 92         [10]  897 	ld	hl, #_snowball_sprites_palette
    00000530 E5               [11]  898 	push	hl
    00000531 21 B9 10         [10]  899 	ld	hl, #_a_load_snowball_sprites
    00000534 E5               [11]  900 	push	hl
    00000535 AF               [ 4]  901 	xor	a, a
    00000536 F5               [11]  902 	push	af
    00000537 33               [ 6]  903 	inc	sp
    00000538 D5               [11]  904 	push	de
    00000539 33               [ 6]  905 	inc	sp
    0000053A C5               [11]  906 	push	bc
    0000053B 11 00 FF         [10]  907 	ld	de, #0xff00
    0000053E 21 80 02         [10]  908 	ld	hl, #0x0280
    00000541 CD C4 02         [17]  909 	call	_i_scroll_sprite_h
                                    910 ;src/intro.c:344: }
    00000544 DD F9            [10]  911 	ld	sp, ix
    00000546 DD E1            [14]  912 	pop	ix
    00000548 C9               [10]  913 	ret
                                    914 ;src/intro.c:346: static void i_ani_spider_l(u8 y, u8 speed) {
                                    915 ;	---------------------------------
                                    916 ; Function i_ani_spider_l
                                    917 ; ---------------------------------
    00000549                        918 _i_ani_spider_l:
    00000549 DD E5            [15]  919 	push	ix
    0000054B DD 21 00 00      [14]  920 	ld	ix,#0
    0000054F DD 39            [15]  921 	add	ix,sp
    00000551 F5               [11]  922 	push	af
    00000552 3B               [ 6]  923 	dec	sp
    00000553 47               [ 4]  924 	ld	b, a
    00000554 4D               [ 4]  925 	ld	c, l
                                    926 ;src/intro.c:348: sprite_anim_state_t state = {.frame = 0, .count = 0, .dir = 1};
    00000555 DD 36 FD 00      [19]  927 	ld	-3 (ix), #0x00
    00000559 DD 36 FE 00      [19]  928 	ld	-2 (ix), #0x00
    0000055D DD 36 FF 01      [19]  929 	ld	-1 (ix), #0x01
                                    930 ;src/intro.c:350: a_load_spider_sprites(false);
    00000561 C5               [11]  931 	push	bc
    00000562 AF               [ 4]  932 	xor	a, a
    00000563 CD AB 10         [17]  933 	call	_a_load_spider_sprites
                                    934 ;src/intro.c:351: i_spider_init();
    00000566 CD 77 04         [17]  935 	call	_i_spider_init
    00000569 C1               [10]  936 	pop	bc
                                    937 ;src/intro.c:355: v_set_intro_spider_sprite_pos, i_spider_tick, (u8 *)&state);
    0000056A 21 00 00         [10]  938 	ld	hl, #0
    0000056D 39               [11]  939 	add	hl, sp
                                    940 ;src/intro.c:354: a_load_spider_sprites, spider_sprites_palette,
    0000056E 11 60 92         [10]  941 	ld	de, #_spider_sprites_palette+0
                                    942 ;src/intro.c:353: i_scroll_sprite_h(-SPRITE_WIDTH_M2, SCREEN_WIDTH_M2, speed, y, false,
    00000571 AF               [ 4]  943 	xor	a, a
    00000572 E5               [11]  944 	push	hl
    00000573 21 20 04         [10]  945 	ld	hl, #_i_spider_tick
    00000576 E5               [11]  946 	push	hl
    00000577 21 55 18         [10]  947 	ld	hl, #_v_set_intro_spider_sprite_pos
    0000057A E5               [11]  948 	push	hl
    0000057B D5               [11]  949 	push	de
    0000057C 21 AB 10         [10]  950 	ld	hl, #_a_load_spider_sprites
    0000057F E5               [11]  951 	push	hl
    00000580 26 00            [ 7]  952 	ld	h, #0x00
    00000582 68               [ 4]  953 	ld	l, b
    00000583 E5               [11]  954 	push	hl
    00000584 47               [ 4]  955 	ld	b, a
    00000585 C5               [11]  956 	push	bc
    00000586 11 80 02         [10]  957 	ld	de, #0x0280
    00000589 21 80 FF         [10]  958 	ld	hl, #0xff80
    0000058C CD C4 02         [17]  959 	call	_i_scroll_sprite_h
                                    960 ;src/intro.c:356: }
    0000058F DD F9            [10]  961 	ld	sp, ix
    00000591 DD E1            [14]  962 	pop	ix
    00000593 C9               [10]  963 	ret
                                    964 ;src/intro.c:358: static void i_ghost_tick(u8 *state_ptr) {
                                    965 ;	---------------------------------
                                    966 ; Function i_ghost_tick
                                    967 ; ---------------------------------
    00000594                        968 _i_ghost_tick:
                                    969 ;src/intro.c:360: ghost_bob_t *s = (ghost_bob_t *)state_ptr;
                                    970 ;src/intro.c:362: s->phase = (s->phase + 1) & 31; /* Keep between 0 and 31 */
    00000594 5D               [ 4]  971 	ld	e, l
    00000595 54               [ 4]  972 	ld	d, h
    00000596 7E               [ 7]  973 	ld	a, (hl)
    00000597 3C               [ 4]  974 	inc	a
    00000598 E6 1F            [ 7]  975 	and	a, #0x1f
    0000059A 4F               [ 4]  976 	ld	c, a
    0000059B 71               [ 7]  977 	ld	(hl), c
                                    978 ;src/intro.c:363: s->y_off = ghost_sine[s->phase];
    0000059C 13               [ 6]  979 	inc	de
    0000059D 21 86 01         [10]  980 	ld	hl, #_ghost_sine+0
    000005A0 06 00            [ 7]  981 	ld	b, #0x00
    000005A2 09               [11]  982 	add	hl, bc
    000005A3 7E               [ 7]  983 	ld	a, (hl)
    000005A4 12               [ 7]  984 	ld	(de), a
                                    985 ;src/intro.c:364: }
    000005A5 C9               [10]  986 	ret
                                    987 	.area _CODE
                                    988 	.area _INITIALIZER
    00009381                        989 __xinit__i_int_idx:
    00009381 00                     990 	.db #0x00	; 0
    00009382                        991 __xinit__i_frame_c:
    00009382 00                     992 	.db #0x00	; 0
    00009383                        993 __xinit__show_roland:
    00009383 00                     994 	.db #0x00	;  0
    00009384                        995 __xinit__g_ghost_bob:
    00009384 00                     996 	.db #0x00	; 0
    00009385 00                     997 	.db #0x00	;  0
                                    998 	.area _CABS (ABS)
