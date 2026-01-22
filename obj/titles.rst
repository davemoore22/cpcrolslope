                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module titles
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _v_set_title_roland_sprite_pos
                                     12 	.globl _v_clear_screen
                                     13 	.globl _v_blank_screen_mode_1
                                     14 	.globl _d_gfx_decompress_to_screen
                                     15 	.globl _d_load
                                     16 	.globl _c_sprite_cache_bank_upload
                                     17 	.globl _a_page_disconnect_safe
                                     18 	.globl _a_page_connect_safe
                                     19 	.globl _a_load_hw_sprite
                                     20 	.globl _a_blank_hardware_sprite_palette
                                     21 	.globl _a_clear_sprites
                                     22 	.globl _a_set_hardware_sprite_palette
                                     23 	.globl _a_hide_sprite_range
                                     24 	.globl _cpct_asicRemoveLinesInterruptHandler
                                     25 	.globl _cpct_asicSetLinesInterruptHandler
                                     26 	.globl _cpct_asicSetPalette
                                     27 	.globl _cpct_asicSetPalColour
                                     28 	.globl _cpct_asicSetBorder
                                     29 	.globl _cpct_asicSetSpriteZoom
                                     30 	.globl _cpct_asicSetSpritePosition
                                     31 	.globl _cpct_PLY_AKG_Play
                                     32 	.globl _cpct_PLY_AKG_Init
                                     33 	.globl _cpct_waitVSYNC
                                     34 	.globl _cpct_isKeyPressed
                                     35 	.globl _cpct_scanKeyboard_if
                                     36 	.globl _g_game_mode
                                     37 	.globl _t_start
                                     38 	.globl _t_do
                                     39 	.globl _t_stop
                                     40 ;--------------------------------------------------------
                                     41 ; special function registers
                                     42 ;--------------------------------------------------------
                                     43 ;--------------------------------------------------------
                                     44 ; ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area _DATA
    00008402                         47 _t_roland_x:
    00008402                         48 	.ds 2
    00008404                         49 _t_roland_start_x:
    00008404                         50 	.ds 2
    00008406                         51 _t_roland_end_x:
    00008406                         52 	.ds 2
    00008408                         53 _t_roland_step:
    00008408                         54 	.ds 1
    00008409                         55 _t_roland_y:
    00008409                         56 	.ds 1
    0000840A                         57 _t_roland_active:
    0000840A                         58 	.ds 1
    0000840B                         59 _t_poll_title_input_left_was_down_10000_356:
    0000840B                         60 	.ds 1
    0000840C                         61 _t_poll_title_input_right_was_down_10000_356:
    0000840C                         62 	.ds 1
                                     63 ;--------------------------------------------------------
                                     64 ; ram data
                                     65 ;--------------------------------------------------------
                                     66 	.area _INITIALIZED
    0000935F                         67 _g_game_mode::
    0000935F                         68 	.ds 1
    00009360                         69 _t_int_idx:
    00009360                         70 	.ds 1
    00009361                         71 _t_frame_c:
    00009361                         72 	.ds 1
    00009362                         73 _text_phase:
    00009362                         74 	.ds 1
    00009363                         75 _text_tick:
    00009363                         76 	.ds 1
    00009364                         77 _slopes_phase:
    00009364                         78 	.ds 1
    00009365                         79 _slopes_dir:
    00009365                         80 	.ds 1
    00009366                         81 _slopes_tick:
    00009366                         82 	.ds 1
    00009367                         83 _t_roland_right:
    00009367                         84 	.ds 1
    00009368                         85 _t_mode_cooldown:
    00009368                         86 	.ds 1
                                     87 ;--------------------------------------------------------
                                     88 ; absolute external ram data
                                     89 ;--------------------------------------------------------
                                     90 	.area _DABS (ABS)
                                     91 ;--------------------------------------------------------
                                     92 ; global & static initialisations
                                     93 ;--------------------------------------------------------
                                     94 	.area _HOME
                                     95 	.area _GSINIT
                                     96 	.area _GSFINAL
                                     97 	.area _GSINIT
                                     98 ;src/titles.c:565: static bool left_was_down = false;
                                     99 ;src/titles.c:566: static bool right_was_down = false;
    00009376 AF               [ 4]  100 	xor	a, a
    00009377 32 0B 84         [13]  101 	ld	(_t_poll_title_input_left_was_down_10000_356+0), a
    0000937A 32 0C 84         [13]  102 	ld	(_t_poll_title_input_right_was_down_10000_356+0), a
                                    103 ;--------------------------------------------------------
                                    104 ; Home
                                    105 ;--------------------------------------------------------
                                    106 	.area _HOME
                                    107 	.area _HOME
                                    108 ;--------------------------------------------------------
                                    109 ; code
                                    110 ;--------------------------------------------------------
                                    111 	.area _CODE
                                    112 ;src/titles.c:158: void t_start(void) {
                                    113 ;	---------------------------------
                                    114 ; Function t_start
                                    115 ; ---------------------------------
    000008B4                        116 _t_start::
                                    117 ;src/titles.c:160: a_clear_sprites();
    000008B4 CD A9 11         [17]  118 	call	_a_clear_sprites
                                    119 ;src/titles.c:161: v_blank_screen_mode_1();
    000008B7 CD 47 16         [17]  120 	call	_v_blank_screen_mode_1
                                    121 ;src/titles.c:162: v_clear_screen();
    000008BA CD 61 16         [17]  122 	call	_v_clear_screen
                                    123 ;src/titles.c:163: g_game_mode = 0;
    000008BD AF               [ 4]  124 	xor	a, a
    000008BE 32 5F 93         [13]  125 	ld	(_g_game_mode+0), a
                                    126 ;src/titles.c:166: t_load_static_title_sprites();
    000008C1 CD FE 0D         [17]  127 	call	_t_load_static_title_sprites
                                    128 ;src/titles.c:169: t_init_roland_slots(140);
    000008C4 3E 8C            [ 7]  129 	ld	a, #0x8c
    000008C6 CD C6 0D         [17]  130 	call	_t_init_roland_slots
                                    131 ;src/titles.c:170: t_load_roland_from_cache(false);
    000008C9 AF               [ 4]  132 	xor	a, a
    000008CA CD 8C 0D         [17]  133 	call	_t_load_roland_from_cache
                                    134 ;src/titles.c:173: t_load_game_mode_word();
    000008CD CD 53 0E         [17]  135 	call	_t_load_game_mode_word
                                    136 ;src/titles.c:175: a_blank_hardware_sprite_palette();
    000008D0 CD 7B 10         [17]  137 	call	_a_blank_hardware_sprite_palette
                                    138 ;src/titles.c:176: t_draw_bg();
    000008D3 CD D4 0A         [17]  139 	call	_t_draw_bg
                                    140 ;src/titles.c:177: a_set_hardware_sprite_palette(roland_sprites_palette);
    000008D6 21 20 92         [10]  141 	ld	hl, #_roland_sprites_palette
    000008D9 CD 75 10         [17]  142 	call	_a_set_hardware_sprite_palette
                                    143 ;src/titles.c:178: t_draw_game_mode();
    000008DC CD 6E 0A         [17]  144 	call	_t_draw_game_mode
                                    145 ;src/titles.c:179: t_draw_static_sprites();
    000008DF CD CB 09         [17]  146 	call	_t_draw_static_sprites
                                    147 ;src/titles.c:181: cpct_PLY_AKG_Init(TITLE_MUSIC_LOC, 0);
    000008E2 11 00 00         [10]  148 	ld	de, #0x0000
    000008E5 21 00 AD         [10]  149 	ld	hl, #0xad00
    000008E8 CD 7C 20         [17]  150 	call	_cpct_PLY_AKG_Init
                                    151 ;src/titles.c:183: t_reset_timers();
    000008EB CD 66 0A         [17]  152 	call	_t_reset_timers
                                    153 ;src/titles.c:184: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
    000008EE 21 FF 0F         [10]  154 	ld	hl, #0x0fff
                                    155 ;src/titles.c:185: }
    000008F1 C3 FA 2D         [10]  156 	jp	_cpct_asicSetBorder
    000008F4                        157 _text_col_top:
    000008F4 D9 0F                  158 	.dw #0x0fd9
    000008F6 EA 0F                  159 	.dw #0x0fea
    000008F8 FB 0F                  160 	.dw #0x0ffb
    000008FA FC 0F                  161 	.dw #0x0ffc
    000008FC FD 0F                  162 	.dw #0x0ffd
    000008FE FC 0F                  163 	.dw #0x0ffc
    00000900 FB 0F                  164 	.dw #0x0ffb
    00000902 EA 0F                  165 	.dw #0x0fea
    00000904                        166 _text_col_bottom:
    00000904 FD 0F                  167 	.dw #0x0ffd
    00000906 FC 0F                  168 	.dw #0x0ffc
    00000908 FB 0F                  169 	.dw #0x0ffb
    0000090A EA 0F                  170 	.dw #0x0fea
    0000090C D9 0F                  171 	.dw #0x0fd9
    0000090E EA 0F                  172 	.dw #0x0fea
    00000910 FB 0F                  173 	.dw #0x0ffb
    00000912 FC 0F                  174 	.dw #0x0ffc
    00000914                        175 _roland_band_colours:
    00000914 0F 00                  176 	.dw #0x000f
    00000916 1F 03                  177 	.dw #0x031f
    00000918 3F 05                  178 	.dw #0x053f
    0000091A 4F 08                  179 	.dw #0x084f
    0000091C 6F 0B                  180 	.dw #0x0b6f
    0000091E 7F 0D                  181 	.dw #0x0d7f
    00000920 9F 0D                  182 	.dw #0x0d9f
    00000922                        183 _t_pal_blank:
    00000922 FF 0F                  184 	.dw #0x0fff
    00000924 FF 0F                  185 	.dw #0x0fff
    00000926 FF 0F                  186 	.dw #0x0fff
    00000928 FF 0F                  187 	.dw #0x0fff
    0000092A                        188 _t_pal_top:
    0000092A FF 0F                  189 	.dw #0x0fff
    0000092C 9B 09                  190 	.dw #0x099b
    0000092E 14 01                  191 	.dw #0x0114
    00000930 7D 07                  192 	.dw #0x077d
    00000932                        193 _t_slopes_ramp:
    00000932 6C 06                  194 	.dw #0x066c
    00000934 7D 07                  195 	.dw #0x077d
    00000936 8E 08                  196 	.dw #0x088e
    00000938 9F 09                  197 	.dw #0x099f
    0000093A AF 0A                  198 	.dw #0x0aaf
    0000093C 9F 09                  199 	.dw #0x099f
    0000093E 8E 08                  200 	.dw #0x088e
    00000940 7D 07                  201 	.dw #0x077d
    00000942                        202 _t_pal_slopes:
    00000942 FF 0F                  203 	.dw #0x0fff
    00000944 F0 05                  204 	.dw #0x05f0
    00000946 00 00                  205 	.dw #0x0000
    00000948 F4 0B                  206 	.dw #0x0bf4
    0000094A                        207 _t_pal_trees:
    0000094A FF 0F                  208 	.dw #0x0fff
    0000094C 68 0A                  209 	.dw #0x0a68
    0000094E 11 04                  210 	.dw #0x0411
    00000950 35 07                  211 	.dw #0x0735
    00000952                        212 _t_pal_middle:
    00000952 1D 05                  213 	.dw #0x051d
    00000954 38 05                  214 	.dw #0x0538
    00000956 5E 0A                  215 	.dw #0x0a5e
    00000958 FF 0F                  216 	.dw #0x0fff
    0000095A                        217 _t_pal_ice:
    0000095A 7F 0A                  218 	.dw #0x0a7f
    0000095C AF 0E                  219 	.dw #0x0eaf
    0000095E 5E 08                  220 	.dw #0x085e
    00000960 DF 0E                  221 	.dw #0x0edf
    00000962                        222 _t_pal_text:
    00000962 4E 09                  223 	.dw #0x094e
    00000964 BF 0E                  224 	.dw #0x0ebf
    00000966 F0 07                  225 	.dw #0x07f0
    00000968 E1 0C                  226 	.dw #0x0ce1
                                    227 ;src/titles.c:187: void t_do(void) {
                                    228 ;	---------------------------------
                                    229 ; Function t_do
                                    230 ; ---------------------------------
    0000096A                        231 _t_do::
                                    232 ;src/titles.c:189: t_add_interrupt();
    0000096A CD FD 0A         [17]  233 	call	_t_add_interrupt
                                    234 ;src/titles.c:191: t_start_roland_scroll(false, 140, 4);
    0000096D 3E 04            [ 7]  235 	ld	a, #0x04
    0000096F F5               [11]  236 	push	af
    00000970 33               [ 6]  237 	inc	sp
    00000971 2E 8C            [ 7]  238 	ld	l, #0x8c
    00000973 AF               [ 4]  239 	xor	a, a
    00000974 CD 36 0F         [17]  240 	call	_t_start_roland_scroll
                                    241 ;src/titles.c:193: while (1) {
    00000977                        242 00115$:
                                    243 ;src/titles.c:196: if (t_mode_cooldown > 0) {
    00000977 3A 68 93         [13]  244 	ld	a, (_t_mode_cooldown+0)
    0000097A B7               [ 4]  245 	or	a, a
    0000097B 28 06            [12]  246 	jr	Z, 00112$
                                    247 ;src/titles.c:197: t_mode_cooldown--;
    0000097D 21 68 93         [10]  248 	ld	hl, #_t_mode_cooldown
    00000980 35               [11]  249 	dec	(hl)
    00000981 18 37            [12]  250 	jr	00113$
    00000983                        251 00112$:
                                    252 ;src/titles.c:199: title_input_t input = t_poll_title_input();
    00000983 CD F8 0E         [17]  253 	call	_t_poll_title_input
                                    254 ;src/titles.c:201: if (input != TITLE_INPUT_NONE) {
                                    255 ;src/titles.c:202: t_change_game_mode((i8)input);
    00000986 B7               [ 4]  256 	or	a,a
    00000987 28 31            [12]  257 	jr	Z, 00113$
    00000989 CD B2 0E         [17]  258 	call	_t_change_game_mode
                                    259 ;src/titles.c:203: t_mode_cooldown = TITLE_MODE_COOLDOWN_FRAMES;
    0000098C 21 68 93         [10]  260 	ld	hl, #_t_mode_cooldown
    0000098F 36 19            [10]  261 	ld	(hl), #0x19
                                    262 ;src/titles.c:204: if (g_game_mode == 0)
    00000991 3A 5F 93         [13]  263 	ld	a, (_g_game_mode+0)
    00000994 B7               [ 4]  264 	or	a, a
    00000995 20 08            [12]  265 	jr	NZ, 00107$
                                    266 ;src/titles.c:206: titles_sprites_palette_classic);
    00000997 21 A0 92         [10]  267 	ld	hl, #_titles_sprites_palette_classic
    0000099A CD 75 10         [17]  268 	call	_a_set_hardware_sprite_palette
    0000099D 18 1B            [12]  269 	jr	00113$
    0000099F                        270 00107$:
                                    271 ;src/titles.c:207: else if (g_game_mode == 1)
    0000099F 3A 5F 93         [13]  272 	ld	a, (_g_game_mode+0)
    000009A2 3D               [ 4]  273 	dec	a
    000009A3 20 08            [12]  274 	jr	NZ, 00104$
                                    275 ;src/titles.c:209: titles_sprites_palette_mania);
    000009A5 21 E0 92         [10]  276 	ld	hl, #_titles_sprites_palette_mania
    000009A8 CD 75 10         [17]  277 	call	_a_set_hardware_sprite_palette
    000009AB 18 0D            [12]  278 	jr	00113$
    000009AD                        279 00104$:
                                    280 ;src/titles.c:210: else if (g_game_mode == 2)
    000009AD 3A 5F 93         [13]  281 	ld	a, (_g_game_mode+0)
    000009B0 D6 02            [ 7]  282 	sub	a, #0x02
    000009B2 20 06            [12]  283 	jr	NZ, 00113$
                                    284 ;src/titles.c:212: titles_sprites_palette_zen);
    000009B4 21 C0 92         [10]  285 	ld	hl, #_titles_sprites_palette_zen
    000009B7 CD 75 10         [17]  286 	call	_a_set_hardware_sprite_palette
    000009BA                        287 00113$:
                                    288 ;src/titles.c:217: t_update_roland();
    000009BA CD 84 0F         [17]  289 	call	_t_update_roland
                                    290 ;src/titles.c:219: cpct_waitVSYNC();
    000009BD CD 67 2F         [17]  291 	call	_cpct_waitVSYNC
                                    292 ;src/titles.c:221: }
    000009C0 18 B5            [12]  293 	jr	00115$
                                    294 ;src/titles.c:223: void t_stop(void) {
                                    295 ;	---------------------------------
                                    296 ; Function t_stop
                                    297 ; ---------------------------------
    000009C2                        298 _t_stop::
                                    299 ;src/titles.c:225: t_remove_interrupt();
    000009C2 CD 1B 0B         [17]  300 	call	_t_remove_interrupt
                                    301 ;src/titles.c:226: a_clear_sprites();
    000009C5 CD A9 11         [17]  302 	call	_a_clear_sprites
                                    303 ;src/titles.c:227: v_blank_screen_mode_1();
                                    304 ;src/titles.c:228: }
    000009C8 C3 47 16         [10]  305 	jp	_v_blank_screen_mode_1
                                    306 ;src/titles.c:230: static void t_draw_static_sprites(void) {
                                    307 ;	---------------------------------
                                    308 ; Function t_draw_static_sprites
                                    309 ; ---------------------------------
    000009CB                        310 _t_draw_static_sprites:
                                    311 ;src/titles.c:233: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_CONTROLS_START, 192, 88);
    000009CB 21 58 00         [10]  312 	ld	hl, #0x0058
    000009CE E5               [11]  313 	push	hl
    000009CF 11 C0 00         [10]  314 	ld	de, #0x00c0
    000009D2 2E 04            [ 7]  315 	ld	l, #0x04
    000009D4 CD 07 1F         [17]  316 	call	_cpct_asicSetSpritePosition
                                    317 ;src/titles.c:234: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_CONTROLS_START + 1, 416, 88);
    000009D7 21 58 00         [10]  318 	ld	hl, #0x0058
    000009DA E5               [11]  319 	push	hl
    000009DB 11 A0 01         [10]  320 	ld	de, #0x01a0
    000009DE 2E 05            [ 7]  321 	ld	l, #0x05
    000009E0 CD 07 1F         [17]  322 	call	_cpct_asicSetSpritePosition
                                    323 ;src/titles.c:236: HW_SPRITE_TITLE_CONTROLS_START + 2, 276, 128);
    000009E3 21 80 00         [10]  324 	ld	hl, #0x0080
    000009E6 E5               [11]  325 	push	hl
    000009E7 11 14 01         [10]  326 	ld	de, #0x0114
    000009EA 2E 06            [ 7]  327 	ld	l, #0x06
    000009EC CD 07 1F         [17]  328 	call	_cpct_asicSetSpritePosition
                                    329 ;src/titles.c:238: HW_SPRITE_TITLE_CONTROLS_START + 3, 276, 144);
    000009EF 21 90 00         [10]  330 	ld	hl, #0x0090
    000009F2 E5               [11]  331 	push	hl
    000009F3 11 14 01         [10]  332 	ld	de, #0x0114
    000009F6 2E 07            [ 7]  333 	ld	l, #0x07
    000009F8 CD 07 1F         [17]  334 	call	_cpct_asicSetSpritePosition
                                    335 ;src/titles.c:239: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START, 2, 1);
    000009FB 21 02 01         [10]  336 	ld	hl, #0x102
    000009FE E5               [11]  337 	push	hl
    000009FF 21 04 00         [10]  338 	ld	hl, #0x0004
    00000A02 CD E6 2D         [17]  339 	call	_cpct_asicSetSpriteZoom
                                    340 ;src/titles.c:240: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 1, 2, 1);
    00000A05 21 02 01         [10]  341 	ld	hl, #0x102
    00000A08 E5               [11]  342 	push	hl
    00000A09 21 05 00         [10]  343 	ld	hl, #0x0005
    00000A0C CD E6 2D         [17]  344 	call	_cpct_asicSetSpriteZoom
                                    345 ;src/titles.c:241: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 2, 2, 1);
    00000A0F 21 02 01         [10]  346 	ld	hl, #0x102
    00000A12 E5               [11]  347 	push	hl
    00000A13 21 06 00         [10]  348 	ld	hl, #0x0006
    00000A16 CD E6 2D         [17]  349 	call	_cpct_asicSetSpriteZoom
                                    350 ;src/titles.c:242: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 3, 2, 1);
    00000A19 21 02 01         [10]  351 	ld	hl, #0x102
    00000A1C E5               [11]  352 	push	hl
    00000A1D 21 07 00         [10]  353 	ld	hl, #0x0007
    00000A20 CD E6 2D         [17]  354 	call	_cpct_asicSetSpriteZoom
                                    355 ;src/titles.c:246: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START, x, y);
    00000A23 21 80 00         [10]  356 	ld	hl, #0x0080
    00000A26 E5               [11]  357 	push	hl
    00000A27 11 34 01         [10]  358 	ld	de, #0x0134
    00000A2A 2E 08            [ 7]  359 	ld	l, #0x08
    00000A2C CD 07 1F         [17]  360 	call	_cpct_asicSetSpritePosition
                                    361 ;src/titles.c:247: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START, 2, 1);
    00000A2F 21 02 01         [10]  362 	ld	hl, #0x102
    00000A32 E5               [11]  363 	push	hl
    00000A33 21 08 00         [10]  364 	ld	hl, #0x0008
    00000A36 CD E6 2D         [17]  365 	call	_cpct_asicSetSpriteZoom
                                    366 ;src/titles.c:249: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START + 1, x, y);
    00000A39 21 80 00         [10]  367 	ld	hl, #0x0080
    00000A3C E5               [11]  368 	push	hl
    00000A3D 11 54 01         [10]  369 	ld	de, #0x0154
    00000A40 2E 09            [ 7]  370 	ld	l, #0x09
    00000A42 CD 07 1F         [17]  371 	call	_cpct_asicSetSpritePosition
                                    372 ;src/titles.c:250: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + 1, 2, 1);
    00000A45 21 02 01         [10]  373 	ld	hl, #0x102
    00000A48 E5               [11]  374 	push	hl
    00000A49 21 09 00         [10]  375 	ld	hl, #0x0009
    00000A4C CD E6 2D         [17]  376 	call	_cpct_asicSetSpriteZoom
                                    377 ;src/titles.c:252: cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START + 2, x, y);
    00000A4F 21 80 00         [10]  378 	ld	hl, #0x0080
    00000A52 E5               [11]  379 	push	hl
    00000A53 11 74 01         [10]  380 	ld	de, #0x0174
    00000A56 2E 0A            [ 7]  381 	ld	l, #0x0a
    00000A58 CD 07 1F         [17]  382 	call	_cpct_asicSetSpritePosition
                                    383 ;src/titles.c:253: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + 2, 2, 1);
    00000A5B 21 02 01         [10]  384 	ld	hl, #0x102
    00000A5E E5               [11]  385 	push	hl
    00000A5F 21 0A 00         [10]  386 	ld	hl, #0x000a
    00000A62 CD E6 2D         [17]  387 	call	_cpct_asicSetSpriteZoom
                                    388 ;src/titles.c:254: }
    00000A65 C9               [10]  389 	ret
                                    390 ;src/titles.c:257: static void t_reset_timers(void) {
                                    391 ;	---------------------------------
                                    392 ; Function t_reset_timers
                                    393 ; ---------------------------------
    00000A66                        394 _t_reset_timers:
                                    395 ;src/titles.c:259: t_int_idx = 0;
                                    396 ;src/titles.c:260: t_frame_c = 0;
    00000A66 AF               [ 4]  397 	xor	a, a
    00000A67 32 60 93         [13]  398 	ld	(_t_int_idx+0), a
    00000A6A 32 61 93         [13]  399 	ld	(_t_frame_c+0), a
                                    400 ;src/titles.c:261: }
    00000A6D C9               [10]  401 	ret
                                    402 ;src/titles.c:263: static void t_draw_game_mode(void) {
                                    403 ;	---------------------------------
                                    404 ; Function t_draw_game_mode
                                    405 ; ---------------------------------
    00000A6E                        406 _t_draw_game_mode:
                                    407 ;src/titles.c:269: for (u8 i = 0; i < 4; i++)
    00000A6E 0E 00            [ 7]  408 	ld	c, #0x00
    00000A70                        409 00110$:
    00000A70 79               [ 4]  410 	ld	a, c
    00000A71 D6 04            [ 7]  411 	sub	a, #0x04
    00000A73 30 13            [12]  412 	jr	NC, 00101$
                                    413 ;src/titles.c:270: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_MODE_START + i, 0, 0);
    00000A75 59               [ 4]  414 	ld	e, c
    00000A76 16 00            [ 7]  415 	ld	d, #0x00
    00000A78 21 0B 00         [10]  416 	ld	hl, #0x000b
    00000A7B 19               [11]  417 	add	hl, de
    00000A7C C5               [11]  418 	push	bc
    00000A7D 11 00 00         [10]  419 	ld	de, #0x00
    00000A80 D5               [11]  420 	push	de
    00000A81 CD E6 2D         [17]  421 	call	_cpct_asicSetSpriteZoom
    00000A84 C1               [10]  422 	pop	bc
                                    423 ;src/titles.c:269: for (u8 i = 0; i < 4; i++)
    00000A85 0C               [ 4]  424 	inc	c
    00000A86 18 E8            [12]  425 	jr	00110$
    00000A88                        426 00101$:
                                    427 ;src/titles.c:274: if (g_game_mode == 0) {
    00000A88 3A 5F 93         [13]  428 	ld	a, (_g_game_mode+0)
    00000A8B B7               [ 4]  429 	or	a, a
    00000A8C 20 07            [12]  430 	jr	NZ, 00106$
                                    431 ;src/titles.c:276: x = 87 * 2;
    00000A8E 11 AE 00         [10]  432 	ld	de, #0x00ae
                                    433 ;src/titles.c:277: count = 4;
    00000A91 0E 04            [ 7]  434 	ld	c, #0x04
    00000A93 18 12            [12]  435 	jr	00122$
    00000A95                        436 00106$:
                                    437 ;src/titles.c:279: } else if (g_game_mode == 1) {
    00000A95 3A 5F 93         [13]  438 	ld	a, (_g_game_mode+0)
    00000A98 3D               [ 4]  439 	dec	a
    00000A99 20 07            [12]  440 	jr	NZ, 00103$
                                    441 ;src/titles.c:281: x = 155 * 2;
    00000A9B 11 36 01         [10]  442 	ld	de, #0x0136
                                    443 ;src/titles.c:282: count = 3;
    00000A9E 0E 03            [ 7]  444 	ld	c, #0x03
    00000AA0 18 05            [12]  445 	jr	00122$
    00000AA2                        446 00103$:
                                    447 ;src/titles.c:286: x = 207 * 2;
    00000AA2 11 9E 01         [10]  448 	ld	de, #0x019e
                                    449 ;src/titles.c:287: count = 2;
    00000AA5 0E 02            [ 7]  450 	ld	c, #0x02
                                    451 ;src/titles.c:291: for (u8 i = 0; i < count; i++) {
    00000AA7                        452 00122$:
    00000AA7 06 00            [ 7]  453 	ld	b, #0x00
    00000AA9                        454 00113$:
                                    455 ;src/titles.c:293: HW_SPRITE_TITLE_MODE_START + i, x, y);
    00000AA9 78               [ 4]  456 	ld	a,b
    00000AAA B9               [ 4]  457 	cp	a,c
    00000AAB D0               [11]  458 	ret	NC
    00000AAC 26 00            [ 7]  459 	ld	h, #0x00
    00000AAE C6 0B            [ 7]  460 	add	a, #0x0b
    00000AB0 6F               [ 4]  461 	ld	l, a
    00000AB1 30 01            [12]  462 	jr	NC, 00163$
    00000AB3 24               [ 4]  463 	inc	h
    00000AB4                        464 00163$:
    00000AB4 E5               [11]  465 	push	hl
    00000AB5 C5               [11]  466 	push	bc
    00000AB6 D5               [11]  467 	push	de
    00000AB7 01 69 00         [10]  468 	ld	bc, #0x0069
    00000ABA C5               [11]  469 	push	bc
    00000ABB CD 07 1F         [17]  470 	call	_cpct_asicSetSpritePosition
    00000ABE D1               [10]  471 	pop	de
    00000ABF C1               [10]  472 	pop	bc
    00000AC0 E1               [10]  473 	pop	hl
                                    474 ;src/titles.c:294: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_MODE_START + i, 2, 1);
    00000AC1 C5               [11]  475 	push	bc
    00000AC2 D5               [11]  476 	push	de
    00000AC3 11 02 01         [10]  477 	ld	de, #0x102
    00000AC6 D5               [11]  478 	push	de
    00000AC7 CD E6 2D         [17]  479 	call	_cpct_asicSetSpriteZoom
    00000ACA D1               [10]  480 	pop	de
    00000ACB C1               [10]  481 	pop	bc
                                    482 ;src/titles.c:295: x += 32;
    00000ACC 21 20 00         [10]  483 	ld	hl, #0x0020
    00000ACF 19               [11]  484 	add	hl, de
    00000AD0 EB               [ 4]  485 	ex	de, hl
                                    486 ;src/titles.c:291: for (u8 i = 0; i < count; i++) {
    00000AD1 04               [ 4]  487 	inc	b
                                    488 ;src/titles.c:297: }
    00000AD2 18 D5            [12]  489 	jr	00113$
                                    490 ;src/titles.c:300: static void t_draw_bg(void) {
                                    491 ;	---------------------------------
                                    492 ; Function t_draw_bg
                                    493 ; ---------------------------------
    00000AD4                        494 _t_draw_bg:
                                    495 ;src/titles.c:302: if (HW_HAS_128K(g_hw))
    00000AD4 3A 00 84         [13]  496 	ld	a, (_g_hw)
    00000AD7 E6 03            [ 7]  497 	and	a, #0x03
    00000AD9 D6 01            [ 7]  498 	sub	a, #0x01
    00000ADB 38 05            [12]  499 	jr	C, 00102$
                                    500 ;src/titles.c:303: d_gfx_decompress_to_screen(GFX_TITLE);
    00000ADD 3E 03            [ 7]  501 	ld	a, #0x03
    00000ADF C3 D0 14         [10]  502 	jp	_d_gfx_decompress_to_screen
    00000AE2                        503 00102$:
                                    504 ;src/titles.c:305: a_page_disconnect_safe();
    00000AE2 CD B4 12         [17]  505 	call	_a_page_disconnect_safe
                                    506 ;src/titles.c:306: d_load("TITLE   SCR", VIDEO_MEM_START);
    00000AE5 11 00 C0         [10]  507 	ld	de, #0xc000
    00000AE8 21 F1 0A         [10]  508 	ld	hl, #___str_0
    00000AEB CD 7C 14         [17]  509 	call	_d_load
                                    510 ;src/titles.c:307: a_page_connect_safe();
                                    511 ;src/titles.c:309: }
    00000AEE C3 A5 12         [10]  512 	jp	_a_page_connect_safe
    00000AF1                        513 ___str_0:
    00000AF1 54 49 54 4C 45 20 20   514 	.ascii "TITLE   SCR"
             20 53 43 52
    00000AFC 00                     515 	.db 0x00
                                    516 ;src/titles.c:311: static void t_add_interrupt(void) {
                                    517 ;	---------------------------------
                                    518 ; Function t_add_interrupt
                                    519 ; ---------------------------------
    00000AFD                        520 _t_add_interrupt:
                                    521 ;src/titles.c:329: cpct_waitVSYNC();
    00000AFD CD 67 2F         [17]  522 	call	_cpct_waitVSYNC
                                    523 ;src/titles.c:331: cpct_asicSetLinesInterruptHandler(t_interrupt, lines, sizeof(lines));
    00000B00 21 0D 00         [10]  524 	ld	hl, #0x000d
    00000B03 E5               [11]  525 	push	hl
    00000B04 11 0E 0B         [10]  526 	ld	de, #_t_add_interrupt_lines_10000_302
    00000B07 21 1E 0B         [10]  527 	ld	hl, #_t_interrupt
    00000B0A CD C5 2F         [17]  528 	call	_cpct_asicSetLinesInterruptHandler
                                    529 ;src/titles.c:332: }
    00000B0D C9               [10]  530 	ret
    00000B0E                        531 _t_add_interrupt_lines_10000_302:
    00000B0E 00                     532 	.db #0x00	; 0
    00000B0F 06                     533 	.db #0x06	; 6
    00000B10 0C                     534 	.db #0x0c	; 12
    00000B11 12                     535 	.db #0x12	; 18
    00000B12 18                     536 	.db #0x18	; 24
    00000B13 1E                     537 	.db #0x1e	; 30
    00000B14 24                     538 	.db #0x24	; 36
    00000B15 2A                     539 	.db #0x2a	; 42
    00000B16 32                     540 	.db #0x32	; 50	'2'
    00000B17 50                     541 	.db #0x50	; 80	'P'
    00000B18 78                     542 	.db #0x78	; 120	'x'
    00000B19 A9                     543 	.db #0xa9	; 169
    00000B1A B8                     544 	.db #0xb8	; 184
                                    545 ;src/titles.c:334: static void t_remove_interrupt(void) {
                                    546 ;	---------------------------------
                                    547 ; Function t_remove_interrupt
                                    548 ; ---------------------------------
    00000B1B                        549 _t_remove_interrupt:
                                    550 ;src/titles.c:336: cpct_asicRemoveLinesInterruptHandler();
                                    551 ;src/titles.c:337: }
    00000B1B C3 3A 30         [10]  552 	jp	_cpct_asicRemoveLinesInterruptHandler
                                    553 ;src/titles.c:339: static void t_interrupt(u8 line) __z88dk_fastcall {
                                    554 ;	---------------------------------
                                    555 ; Function t_interrupt
                                    556 ; ---------------------------------
    00000B1E                        557 _t_interrupt:
    00000B1E DD E5            [15]  558 	push	ix
    00000B20 DD 21 00 00      [14]  559 	ld	ix,#0
    00000B24 DD 39            [15]  560 	add	ix,sp
    00000B26 3B               [ 6]  561 	dec	sp
                                    562 ;src/titles.c:341: if (line < TITLES_RASTER_SLOPES) {
    00000B27 DD 75 FF         [19]  563 	ld	-1 (ix), l
    00000B2A 7D               [ 4]  564 	ld	a, l
    00000B2B D6 32            [ 7]  565 	sub	a, #0x32
    00000B2D 30 4D            [12]  566 	jr	NC, 00136$
                                    567 ;src/titles.c:343: if (line == 0) {
    00000B2F DD 7E FF         [19]  568 	ld	a, -1 (ix)
    00000B32 B7               [ 4]  569 	or	a, a
    00000B33 20 28            [12]  570 	jr	NZ, 00102$
                                    571 ;src/titles.c:345: cpct_asicSetPalColour(0, t_pal_top[0]);
    00000B35 ED 5B 2A 09      [20]  572 	ld	de, (#_t_pal_top + 0)
    00000B39 21 00 00         [10]  573 	ld	hl, #0x0000
    00000B3C CD 2A 2D         [17]  574 	call	_cpct_asicSetPalColour
                                    575 ;src/titles.c:346: cpct_asicSetPalColour(1, t_pal_top[1]);
    00000B3F ED 5B 2C 09      [20]  576 	ld	de, (#_t_pal_top + 2)
    00000B43 21 01 00         [10]  577 	ld	hl, #0x0001
    00000B46 CD 2A 2D         [17]  578 	call	_cpct_asicSetPalColour
                                    579 ;src/titles.c:347: cpct_asicSetPalColour(2, t_pal_top[2]);
    00000B49 ED 5B 2E 09      [20]  580 	ld	de, (#_t_pal_top + 4)
    00000B4D 21 02 00         [10]  581 	ld	hl, #0x0002
    00000B50 CD 2A 2D         [17]  582 	call	_cpct_asicSetPalColour
                                    583 ;src/titles.c:348: cpct_asicSetPalColour(3, t_pal_top[3]);
    00000B53 ED 5B 30 09      [20]  584 	ld	de, (#_t_pal_top + 6)
    00000B57 21 03 00         [10]  585 	ld	hl, #0x0003
    00000B5A CD 2A 2D         [17]  586 	call	_cpct_asicSetPalColour
    00000B5D                        587 00102$:
                                    588 ;src/titles.c:352: u8 band = (line - TITLES_RASTER_ROLAND_START) >> 3;
    00000B5D DD 6E FF         [19]  589 	ld	l, -1 (ix)
    00000B60 01 00 03         [10]  590 	ld	bc, #0x300
    00000B63                        591 00252$:
    00000B63 CB 29            [ 8]  592 	sra	c
    00000B65 CB 1D            [ 8]  593 	rr	l
    00000B67 10 FA            [13]  594 	djnz	00252$
                                    595 ;src/titles.c:355: cpct_asicSetPalColour(1, roland_band_colours[band]);
    00000B69 01 14 09         [10]  596 	ld	bc, #_roland_band_colours+0
    00000B6C 26 00            [ 7]  597 	ld	h, #0x00
    00000B6E 29               [11]  598 	add	hl, hl
    00000B6F 09               [11]  599 	add	hl, bc
    00000B70 5E               [ 7]  600 	ld	e, (hl)
    00000B71 23               [ 6]  601 	inc	hl
    00000B72 56               [ 7]  602 	ld	d, (hl)
    00000B73 21 01 00         [10]  603 	ld	hl, #0x0001
    00000B76 CD 2A 2D         [17]  604 	call	_cpct_asicSetPalColour
    00000B79 C3 6E 0C         [10]  605 	jp	00138$
    00000B7C                        606 00136$:
                                    607 ;src/titles.c:357: } else if (line == TITLES_RASTER_SLOPES) {
    00000B7C DD 7E FF         [19]  608 	ld	a, -1 (ix)
    00000B7F D6 32            [ 7]  609 	sub	a, #0x32
    00000B81 20 06            [12]  610 	jr	NZ, 00133$
                                    611 ;src/titles.c:360: t_update_slopes_cycle();
    00000B83 CD 72 0C         [17]  612 	call	_t_update_slopes_cycle
    00000B86 C3 6E 0C         [10]  613 	jp	00138$
    00000B89                        614 00133$:
                                    615 ;src/titles.c:361: } else if (line == TITLES_RASTER_TREES) {
    00000B89 DD 7E FF         [19]  616 	ld	a, -1 (ix)
    00000B8C D6 50            [ 7]  617 	sub	a, #0x50
    00000B8E 20 0C            [12]  618 	jr	NZ, 00130$
                                    619 ;src/titles.c:364: cpct_asicSetPalette(t_pal_trees, 4);
    00000B90 11 04 00         [10]  620 	ld	de, #0x0004
    00000B93 21 4A 09         [10]  621 	ld	hl, #_t_pal_trees
    00000B96 CD 0D 2D         [17]  622 	call	_cpct_asicSetPalette
    00000B99 C3 6E 0C         [10]  623 	jp	00138$
    00000B9C                        624 00130$:
                                    625 ;src/titles.c:365: } else if (line == TITLES_RASTER_DO_STUFF) {
    00000B9C DD 7E FF         [19]  626 	ld	a, -1 (ix)
    00000B9F D6 78            [ 7]  627 	sub	a, #0x78
    00000BA1 C2 24 0C         [10]  628 	jp	NZ, 00127$
                                    629 ;src/titles.c:368: if (t_int_idx == 0) {
    00000BA4 3A 60 93         [13]  630 	ld	a, (_t_int_idx+0)
    00000BA7 B7               [ 4]  631 	or	a, a
    00000BA8 20 12            [12]  632 	jr	NZ, 00106$
                                    633 ;src/titles.c:369: if (++t_frame_c == FC_MAX)
    00000BAA FD 21 61 93      [14]  634 	ld	iy, #_t_frame_c
    00000BAE FD 34 00         [23]  635 	inc	0 (iy)
    00000BB1 3A 61 93         [13]  636 	ld	a, (_t_frame_c+0)
    00000BB4 D6 32            [ 7]  637 	sub	a, #0x32
    00000BB6 20 04            [12]  638 	jr	NZ, 00106$
                                    639 ;src/titles.c:370: t_frame_c = 0;
    00000BB8 FD 36 00 00      [19]  640 	ld	0 (iy), #0x00
    00000BBC                        641 00106$:
                                    642 ;src/titles.c:374: cpct_PLY_AKG_Play();
    00000BBC CD 4E 21         [17]  643 	call	_cpct_PLY_AKG_Play
                                    644 ;src/titles.c:376: if (t_int_idx == 2)
    00000BBF 3A 60 93         [13]  645 	ld	a, (_t_int_idx+0)
    00000BC2 D6 02            [ 7]  646 	sub	a, #0x02
    00000BC4 20 03            [12]  647 	jr	NZ, 00108$
                                    648 ;src/titles.c:377: cpct_scanKeyboard_if();
    00000BC6 CD 96 2E         [17]  649 	call	_cpct_scanKeyboard_if
    00000BC9                        650 00108$:
                                    651 ;src/titles.c:379: if (t_int_idx == 4) {
    00000BC9 3A 60 93         [13]  652 	ld	a, (_t_int_idx+0)
    00000BCC D6 04            [ 7]  653 	sub	a, #0x04
    00000BCE 20 24            [12]  654 	jr	NZ, 00114$
                                    655 ;src/titles.c:381: if (++text_tick >= TITLES_TEXT_SPEED) {
    00000BD0 FD 21 63 93      [14]  656 	ld	iy, #_text_tick
    00000BD4 FD 34 00         [23]  657 	inc	0 (iy)
    00000BD7 3A 63 93         [13]  658 	ld	a, (_text_tick+0)
    00000BDA D6 02            [ 7]  659 	sub	a, #0x02
    00000BDC 38 16            [12]  660 	jr	C, 00114$
                                    661 ;src/titles.c:382: text_tick = 0;
    00000BDE FD 36 00 00      [19]  662 	ld	0 (iy), #0x00
                                    663 ;src/titles.c:383: if (++text_phase >= TITLES_TEXT_COLOUR_COUNT)
    00000BE2 FD 21 62 93      [14]  664 	ld	iy, #_text_phase
    00000BE6 FD 34 00         [23]  665 	inc	0 (iy)
    00000BE9 3A 62 93         [13]  666 	ld	a, (_text_phase+0)
    00000BEC D6 08            [ 7]  667 	sub	a, #0x08
    00000BEE 38 04            [12]  668 	jr	C, 00114$
                                    669 ;src/titles.c:384: text_phase = 0;
    00000BF0 FD 36 00 00      [19]  670 	ld	0 (iy), #0x00
    00000BF4                        671 00114$:
                                    672 ;src/titles.c:388: if (t_int_idx == 5) {
    00000BF4 3A 60 93         [13]  673 	ld	a, (_t_int_idx+0)
    00000BF7 D6 05            [ 7]  674 	sub	a, #0x05
    00000BF9 20 15            [12]  675 	jr	NZ, 00118$
                                    676 ;src/titles.c:390: if (++slopes_tick >= SLOPES_SPEED) {
    00000BFB FD 21 66 93      [14]  677 	ld	iy, #_slopes_tick
    00000BFF FD 34 00         [23]  678 	inc	0 (iy)
    00000C02 3A 66 93         [13]  679 	ld	a, (_slopes_tick+0)
    00000C05 D6 02            [ 7]  680 	sub	a, #0x02
    00000C07 38 07            [12]  681 	jr	C, 00118$
                                    682 ;src/titles.c:391: slopes_tick = 0;
    00000C09 FD 36 00 00      [19]  683 	ld	0 (iy), #0x00
                                    684 ;src/titles.c:392: t_step_slopes_phase();
    00000C0D CD A4 0C         [17]  685 	call	_t_step_slopes_phase
    00000C10                        686 00118$:
                                    687 ;src/titles.c:396: if (++t_int_idx == 6)
    00000C10 FD 21 60 93      [14]  688 	ld	iy, #_t_int_idx
    00000C14 FD 34 00         [23]  689 	inc	0 (iy)
    00000C17 3A 60 93         [13]  690 	ld	a, (_t_int_idx+0)
    00000C1A D6 06            [ 7]  691 	sub	a, #0x06
    00000C1C 20 50            [12]  692 	jr	NZ, 00138$
                                    693 ;src/titles.c:397: t_int_idx = 0;
    00000C1E FD 36 00 00      [19]  694 	ld	0 (iy), #0x00
    00000C22 18 4A            [12]  695 	jr	00138$
    00000C24                        696 00127$:
                                    697 ;src/titles.c:399: } else if (line == TITLES_RASTER_ICE) {
    00000C24 DD 7E FF         [19]  698 	ld	a, -1 (ix)
    00000C27 D6 A9            [ 7]  699 	sub	a, #0xa9
    00000C29 20 0B            [12]  700 	jr	NZ, 00124$
                                    701 ;src/titles.c:402: cpct_asicSetPalette(t_pal_ice, 4);
    00000C2B 11 04 00         [10]  702 	ld	de, #0x0004
    00000C2E 21 5A 09         [10]  703 	ld	hl, #_t_pal_ice
    00000C31 CD 0D 2D         [17]  704 	call	_cpct_asicSetPalette
    00000C34 18 38            [12]  705 	jr	00138$
    00000C36                        706 00124$:
                                    707 ;src/titles.c:403: } else if (line == TITLES_RASTER_TEXT) {
    00000C36 DD 7E FF         [19]  708 	ld	a, -1 (ix)
    00000C39 D6 B8            [ 7]  709 	sub	a, #0xb8
    00000C3B 20 31            [12]  710 	jr	NZ, 00138$
                                    711 ;src/titles.c:406: u8 idx = text_phase;
    00000C3D 3A 62 93         [13]  712 	ld	a, (_text_phase)
    00000C40 4F               [ 4]  713 	ld	c, a
                                    714 ;src/titles.c:407: cpct_asicSetPalColour(2, cpctm_asicColor(0, 0, 0));
    00000C41 C5               [11]  715 	push	bc
    00000C42 11 00 00         [10]  716 	ld	de, #0x0000
    00000C45 21 02 00         [10]  717 	ld	hl, #0x0002
    00000C48 CD 2A 2D         [17]  718 	call	_cpct_asicSetPalColour
    00000C4B C1               [10]  719 	pop	bc
                                    720 ;src/titles.c:408: cpct_asicSetPalColour(1, text_col_top[idx]);
    00000C4C AF               [ 4]  721 	xor	a, a
    00000C4D 47               [ 4]  722 	ld	b, a
    00000C4E CB 21            [ 8]  723 	sla	c
    00000C50 CB 10            [ 8]  724 	rl	b
    00000C52 21 F4 08         [10]  725 	ld	hl, #_text_col_top
    00000C55 09               [11]  726 	add	hl, bc
    00000C56 5E               [ 7]  727 	ld	e, (hl)
    00000C57 23               [ 6]  728 	inc	hl
    00000C58 56               [ 7]  729 	ld	d, (hl)
    00000C59 C5               [11]  730 	push	bc
    00000C5A 21 01 00         [10]  731 	ld	hl, #0x0001
    00000C5D CD 2A 2D         [17]  732 	call	_cpct_asicSetPalColour
    00000C60 C1               [10]  733 	pop	bc
                                    734 ;src/titles.c:409: cpct_asicSetPalColour(3, text_col_bottom[idx]);
    00000C61 21 04 09         [10]  735 	ld	hl, #_text_col_bottom
    00000C64 09               [11]  736 	add	hl, bc
    00000C65 5E               [ 7]  737 	ld	e, (hl)
    00000C66 23               [ 6]  738 	inc	hl
    00000C67 56               [ 7]  739 	ld	d, (hl)
    00000C68 21 03 00         [10]  740 	ld	hl, #0x0003
    00000C6B CD 2A 2D         [17]  741 	call	_cpct_asicSetPalColour
    00000C6E                        742 00138$:
                                    743 ;src/titles.c:411: }
    00000C6E 33               [ 6]  744 	inc	sp
    00000C6F DD E1            [14]  745 	pop	ix
    00000C71 C9               [10]  746 	ret
                                    747 ;src/titles.c:413: static void t_update_slopes_cycle(void) {
                                    748 ;	---------------------------------
                                    749 ; Function t_update_slopes_cycle
                                    750 ; ---------------------------------
    00000C72                        751 _t_update_slopes_cycle:
                                    752 ;src/titles.c:416: u8 idx_bottom = slopes_phase;
    00000C72 3A 64 93         [13]  753 	ld	a, (_slopes_phase)
    00000C75 6F               [ 4]  754 	ld	l, a
                                    755 ;src/titles.c:419: u8 idx_top = slopes_phase + 1;
    00000C76 3A 64 93         [13]  756 	ld	a, (_slopes_phase)
                                    757 ;src/titles.c:420: if (idx_top >= SLOPES_RAMP_COUNT)
    00000C79 3C               [ 4]  758 	inc	a
    00000C7A 5F               [ 4]  759 	ld	e, a
    00000C7B D6 08            [ 7]  760 	sub	a, #0x08
    00000C7D 38 02            [12]  761 	jr	C, 00102$
                                    762 ;src/titles.c:421: idx_top = SLOPES_RAMP_COUNT - 1;
    00000C7F 1E 07            [ 7]  763 	ld	e, #0x07
    00000C81                        764 00102$:
                                    765 ;src/titles.c:423: cpct_asicSetPalColour(1, t_slopes_ramp[idx_bottom]);
    00000C81 01 32 09         [10]  766 	ld	bc, #_t_slopes_ramp+0
    00000C84 26 00            [ 7]  767 	ld	h, #0x00
    00000C86 29               [11]  768 	add	hl, hl
    00000C87 09               [11]  769 	add	hl, bc
    00000C88 7E               [ 7]  770 	ld	a, (hl)
    00000C89 23               [ 6]  771 	inc	hl
    00000C8A 56               [ 7]  772 	ld	d, (hl)
    00000C8B C5               [11]  773 	push	bc
    00000C8C D5               [11]  774 	push	de
    00000C8D 5F               [ 4]  775 	ld	e, a
    00000C8E 21 01 00         [10]  776 	ld	hl, #0x0001
    00000C91 CD 2A 2D         [17]  777 	call	_cpct_asicSetPalColour
    00000C94 D1               [10]  778 	pop	de
    00000C95 C1               [10]  779 	pop	bc
                                    780 ;src/titles.c:424: cpct_asicSetPalColour(3, t_slopes_ramp[idx_top]);
    00000C96 16 00            [ 7]  781 	ld	d, #0x00
    00000C98 EB               [ 4]  782 	ex	de, hl
    00000C99 29               [11]  783 	add	hl, hl
    00000C9A 09               [11]  784 	add	hl, bc
    00000C9B 5E               [ 7]  785 	ld	e, (hl)
    00000C9C 23               [ 6]  786 	inc	hl
    00000C9D 56               [ 7]  787 	ld	d, (hl)
    00000C9E 21 03 00         [10]  788 	ld	hl, #0x0003
                                    789 ;src/titles.c:425: }
    00000CA1 C3 2A 2D         [10]  790 	jp	_cpct_asicSetPalColour
                                    791 ;src/titles.c:427: static void t_step_slopes_phase(void) {
                                    792 ;	---------------------------------
                                    793 ; Function t_step_slopes_phase
                                    794 ; ---------------------------------
    00000CA4                        795 _t_step_slopes_phase:
                                    796 ;src/titles.c:429: slopes_phase += slopes_dir;
    00000CA4 3A 64 93         [13]  797 	ld	a, (_slopes_phase)
    00000CA7 21 65 93         [10]  798 	ld	hl, #_slopes_dir
    00000CAA 86               [ 7]  799 	add	a, (hl)
                                    800 ;src/titles.c:431: if (slopes_phase == SLOPES_RAMP_COUNT - 2)
    00000CAB 32 64 93         [13]  801 	ld	(_slopes_phase+0), a
    00000CAE D6 06            [ 7]  802 	sub	a, #0x06
    00000CB0 20 06            [12]  803 	jr	NZ, 00104$
                                    804 ;src/titles.c:432: slopes_dir = -1;
    00000CB2 21 65 93         [10]  805 	ld	hl, #_slopes_dir
    00000CB5 36 FF            [10]  806 	ld	(hl), #0xff
    00000CB7 C9               [10]  807 	ret
    00000CB8                        808 00104$:
                                    809 ;src/titles.c:433: else if (slopes_phase == 0)
    00000CB8 3A 64 93         [13]  810 	ld	a, (_slopes_phase+0)
    00000CBB B7               [ 4]  811 	or	a, a
    00000CBC C0               [11]  812 	ret	NZ
                                    813 ;src/titles.c:434: slopes_dir = 1;
    00000CBD 21 65 93         [10]  814 	ld	hl, #_slopes_dir
    00000CC0 36 01            [10]  815 	ld	(hl), #0x01
                                    816 ;src/titles.c:435: }
    00000CC2 C9               [10]  817 	ret
                                    818 ;src/titles.c:437: static void t_ani_roland_l(u8 y, u8 speed) {
                                    819 ;	---------------------------------
                                    820 ; Function t_ani_roland_l
                                    821 ; ---------------------------------
    00000CC3                        822 _t_ani_roland_l:
    00000CC3 67               [ 4]  823 	ld	h, a
                                    824 ;src/titles.c:439: t_load_roland_from_cache(false);
    00000CC4 E5               [11]  825 	push	hl
    00000CC5 AF               [ 4]  826 	xor	a, a
    00000CC6 CD 8C 0D         [17]  827 	call	_t_load_roland_from_cache
    00000CC9 E1               [10]  828 	pop	hl
                                    829 ;src/titles.c:441: t_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y,
    00000CCA AF               [ 4]  830 	xor	a, a
    00000CCB 11 68 17         [10]  831 	ld	de, #_v_set_title_roland_sprite_pos
    00000CCE D5               [11]  832 	push	de
    00000CCF E5               [11]  833 	push	hl
    00000CD0 33               [ 6]  834 	inc	sp
    00000CD1 67               [ 4]  835 	ld	h, a
    00000CD2 E5               [11]  836 	push	hl
    00000CD3 11 80 02         [10]  837 	ld	de, #0x0280
    00000CD6 21 00 FF         [10]  838 	ld	hl, #0xff00
    00000CD9 CD FF 0C         [17]  839 	call	_t_scroll_sprite_h
                                    840 ;src/titles.c:443: }
    00000CDC C9               [10]  841 	ret
                                    842 ;src/titles.c:445: static void t_ani_roland_r(u8 y, u8 speed) {
                                    843 ;	---------------------------------
                                    844 ; Function t_ani_roland_r
                                    845 ; ---------------------------------
    00000CDD                        846 _t_ani_roland_r:
    00000CDD 67               [ 4]  847 	ld	h, a
                                    848 ;src/titles.c:447: t_load_roland_from_cache(true);
    00000CDE E5               [11]  849 	push	hl
    00000CDF 3E 01            [ 7]  850 	ld	a, #0x01
    00000CE1 CD 8C 0D         [17]  851 	call	_t_load_roland_from_cache
    00000CE4 E1               [10]  852 	pop	hl
                                    853 ;src/titles.c:449: t_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y,
    00000CE5 7D               [ 4]  854 	ld	a, l
    00000CE6 06 00            [ 7]  855 	ld	b, #0x00
    00000CE8 ED 44            [ 8]  856 	neg
    00000CEA 4F               [ 4]  857 	ld	c, a
    00000CEB 9F               [ 4]  858 	sbc	a, a
    00000CEC 90               [ 4]  859 	sub	a, b
    00000CED 11 68 17         [10]  860 	ld	de, #_v_set_title_roland_sprite_pos
    00000CF0 D5               [11]  861 	push	de
    00000CF1 E5               [11]  862 	push	hl
    00000CF2 33               [ 6]  863 	inc	sp
    00000CF3 47               [ 4]  864 	ld	b, a
    00000CF4 C5               [11]  865 	push	bc
    00000CF5 11 00 FF         [10]  866 	ld	de, #0xff00
    00000CF8 21 80 02         [10]  867 	ld	hl, #0x0280
    00000CFB CD FF 0C         [17]  868 	call	_t_scroll_sprite_h
                                    869 ;src/titles.c:451: }
    00000CFE C9               [10]  870 	ret
                                    871 ;src/titles.c:453: static void t_scroll_sprite_h(
                                    872 ;	---------------------------------
                                    873 ; Function t_scroll_sprite_h
                                    874 ; ---------------------------------
    00000CFF                        875 _t_scroll_sprite_h:
    00000CFF DD E5            [15]  876 	push	ix
    00000D01 DD 21 00 00      [14]  877 	ld	ix,#0
    00000D05 DD 39            [15]  878 	add	ix,sp
    00000D07 F5               [11]  879 	push	af
    00000D08 3B               [ 6]  880 	dec	sp
    00000D09 4D               [ 4]  881 	ld	c, l
    00000D0A 44               [ 4]  882 	ld	b, h
    00000D0B DD 73 FE         [19]  883 	ld	-2 (ix), e
    00000D0E DD 72 FF         [19]  884 	ld	-1 (ix), d
                                    885 ;src/titles.c:456: for (i16 x = start_x; (step > 0) ? (x <= end_x) : (x >= end_x);
    00000D11 AF               [ 4]  886 	xor	a, a
    00000D12 DD BE 04         [19]  887 	cp	a, 4 (ix)
    00000D15 DD 9E 05         [19]  888 	sbc	a, 5 (ix)
    00000D18 E2 1D 0D         [10]  889 	jp	PO, 00130$
    00000D1B EE 80            [ 7]  890 	xor	a, #0x80
    00000D1D                        891 00130$:
    00000D1D 07               [ 4]  892 	rlca
    00000D1E E6 01            [ 7]  893 	and	a,#0x01
    00000D20 DD 77 FD         [19]  894 	ld	-3 (ix), a
    00000D23                        895 00103$:
    00000D23 DD 7E FD         [19]  896 	ld	a, -3 (ix)
    00000D26 B7               [ 4]  897 	or	a, a
    00000D27 28 14            [12]  898 	jr	Z, 00107$
    00000D29 DD 7E FE         [19]  899 	ld	a, -2 (ix)
    00000D2C 91               [ 4]  900 	sub	a, c
    00000D2D DD 7E FF         [19]  901 	ld	a, -1 (ix)
    00000D30 98               [ 4]  902 	sbc	a, b
    00000D31 E2 36 0D         [10]  903 	jp	PO, 00131$
    00000D34 EE 80            [ 7]  904 	xor	a, #0x80
    00000D36                        905 00131$:
    00000D36 07               [ 4]  906 	rlca
    00000D37 E6 01            [ 7]  907 	and	a,#0x01
    00000D39 EE 01            [ 7]  908 	xor	a, #0x01
    00000D3B 18 12            [12]  909 	jr	00108$
    00000D3D                        910 00107$:
    00000D3D 79               [ 4]  911 	ld	a, c
    00000D3E DD 96 FE         [19]  912 	sub	a, -2 (ix)
    00000D41 78               [ 4]  913 	ld	a, b
    00000D42 DD 9E FF         [19]  914 	sbc	a, -1 (ix)
    00000D45 E2 4A 0D         [10]  915 	jp	PO, 00132$
    00000D48 EE 80            [ 7]  916 	xor	a, #0x80
    00000D4A                        917 00132$:
    00000D4A 07               [ 4]  918 	rlca
    00000D4B E6 01            [ 7]  919 	and	a,#0x01
    00000D4D EE 01            [ 7]  920 	xor	a, #0x01
    00000D4F                        921 00108$:
    00000D4F B7               [ 4]  922 	or	a, a
    00000D50 28 31            [12]  923 	jr	Z, 00105$
                                    924 ;src/titles.c:459: pos_fn(x, y, t_roland_right);
    00000D52 DD 5E 06         [19]  925 	ld	e, 6 (ix)
    00000D55 16 00            [ 7]  926 	ld	d, #0x00
    00000D57 C5               [11]  927 	push	bc
    00000D58 3A 67 93         [13]  928 	ld	a, (_t_roland_right)
    00000D5B F5               [11]  929 	push	af
    00000D5C 33               [ 6]  930 	inc	sp
    00000D5D 69               [ 4]  931 	ld	l, c
    00000D5E 60               [ 4]  932 	ld	h, b
    00000D5F FD E5            [15]  933 	push	iy
    00000D61 E3               [19]  934 	ex	(sp), hl
    00000D62 DD 6E 07         [19]  935 	ld	l, 7 (ix)
    00000D65 E3               [19]  936 	ex	(sp), hl
    00000D66 E3               [19]  937 	ex	(sp), hl
    00000D67 DD 66 08         [19]  938 	ld	h, 8 (ix)
    00000D6A E3               [19]  939 	ex	(sp), hl
    00000D6B FD E1            [14]  940 	pop	iy
    00000D6D CD A8 2F         [17]  941 	call	___sdcc_call_iy
                                    942 ;src/titles.c:461: t_poll_title_input();
    00000D70 CD F8 0E         [17]  943 	call	_t_poll_title_input
                                    944 ;src/titles.c:462: cpct_waitVSYNC();
    00000D73 CD 67 2F         [17]  945 	call	_cpct_waitVSYNC
    00000D76 C1               [10]  946 	pop	bc
                                    947 ;src/titles.c:457: x += step) {
    00000D77 79               [ 4]  948 	ld	a, c
    00000D78 DD 86 04         [19]  949 	add	a, 4 (ix)
    00000D7B 4F               [ 4]  950 	ld	c, a
    00000D7C 78               [ 4]  951 	ld	a, b
    00000D7D DD 8E 05         [19]  952 	adc	a, 5 (ix)
    00000D80 47               [ 4]  953 	ld	b, a
    00000D81 18 A0            [12]  954 	jr	00103$
    00000D83                        955 00105$:
                                    956 ;src/titles.c:464: }
    00000D83 DD F9            [10]  957 	ld	sp, ix
    00000D85 DD E1            [14]  958 	pop	ix
    00000D87 E1               [10]  959 	pop	hl
    00000D88 F1               [10]  960 	pop	af
    00000D89 F1               [10]  961 	pop	af
    00000D8A 33               [ 6]  962 	inc	sp
    00000D8B E9               [ 4]  963 	jp	(hl)
                                    964 ;src/titles.c:466: static void t_load_roland_from_cache(bool right) {
                                    965 ;	---------------------------------
                                    966 ; Function t_load_roland_from_cache
                                    967 ; ---------------------------------
    00000D8C                        968 _t_load_roland_from_cache:
    00000D8C 4F               [ 4]  969 	ld	c, a
                                    970 ;src/titles.c:468: sprite_bank_id_t bank = right ? SPR_BANK_ROLAND_R : SPR_BANK_ROLAND_L;
    00000D8D CB 41            [ 8]  971 	bit	0, c
    00000D8F 28 04            [12]  972 	jr	Z, 00107$
    00000D91 06 01            [ 7]  973 	ld	b, #0x01
    00000D93 18 02            [12]  974 	jr	00108$
    00000D95                        975 00107$:
    00000D95 06 00            [ 7]  976 	ld	b, #0x00
    00000D97                        977 00108$:
                                    978 ;src/titles.c:470: for (u8 i = 0; i < 4; i++) {
    00000D97 16 00            [ 7]  979 	ld	d, #0x00
    00000D99                        980 00103$:
    00000D99 7A               [ 4]  981 	ld	a, d
    00000D9A D6 04            [ 7]  982 	sub	a, #0x04
    00000D9C 30 23            [12]  983 	jr	NC, 00101$
                                    984 ;src/titles.c:471: cpct_waitVSYNC();
    00000D9E C5               [11]  985 	push	bc
    00000D9F D5               [11]  986 	push	de
    00000DA0 CD 67 2F         [17]  987 	call	_cpct_waitVSYNC
    00000DA3 D1               [10]  988 	pop	de
    00000DA4 C1               [10]  989 	pop	bc
                                    990 ;src/titles.c:472: c_sprite_cache_bank_upload(bank, i, ASIC_SPR_ROLAND_START + i);
    00000DA5 C5               [11]  991 	push	bc
    00000DA6 D5               [11]  992 	push	de
    00000DA7 D5               [11]  993 	push	de
    00000DA8 33               [ 6]  994 	inc	sp
    00000DA9 6A               [ 4]  995 	ld	l, d
    00000DAA 78               [ 4]  996 	ld	a, b
    00000DAB CD B2 13         [17]  997 	call	_c_sprite_cache_bank_upload
    00000DAE D1               [10]  998 	pop	de
    00000DAF C1               [10]  999 	pop	bc
                                   1000 ;src/titles.c:473: cpct_asicSetSpriteZoom(ASIC_SPR_ROLAND_START + i, 2, 1);
    00000DB0 6A               [ 4] 1001 	ld	l, d
    00000DB1 26 00            [ 7] 1002 	ld	h, #0x00
    00000DB3 C5               [11] 1003 	push	bc
    00000DB4 D5               [11] 1004 	push	de
    00000DB5 11 02 01         [10] 1005 	ld	de, #0x102
    00000DB8 D5               [11] 1006 	push	de
    00000DB9 CD E6 2D         [17] 1007 	call	_cpct_asicSetSpriteZoom
    00000DBC D1               [10] 1008 	pop	de
    00000DBD C1               [10] 1009 	pop	bc
                                   1010 ;src/titles.c:470: for (u8 i = 0; i < 4; i++) {
    00000DBE 14               [ 4] 1011 	inc	d
    00000DBF 18 D8            [12] 1012 	jr	00103$
    00000DC1                       1013 00101$:
                                   1014 ;src/titles.c:476: t_roland_right = right;
    00000DC1 21 67 93         [10] 1015 	ld	hl, #_t_roland_right
    00000DC4 71               [ 7] 1016 	ld	(hl), c
                                   1017 ;src/titles.c:477: }
    00000DC5 C9               [10] 1018 	ret
                                   1019 ;src/titles.c:479: static void t_init_roland_slots(u8 y) {
                                   1020 ;	---------------------------------
                                   1021 ; Function t_init_roland_slots
                                   1022 ; ---------------------------------
    00000DC6                       1023 _t_init_roland_slots:
    00000DC6 CD AA 2F         [17] 1024 	call	___sdcc_enter_ix
    00000DC9 3B               [ 6] 1025 	dec	sp
    00000DCA DD 77 FF         [19] 1026 	ld	-1 (ix), a
                                   1027 ;src/titles.c:483: for (u8 i = 0; i < 4; i++) {
    00000DCD 11 00 FF         [10] 1028 	ld	de, #0xff00
    00000DD0 0E 00            [ 7] 1029 	ld	c, #0x00
    00000DD2                       1030 00103$:
    00000DD2 79               [ 4] 1031 	ld	a, c
    00000DD3 D6 04            [ 7] 1032 	sub	a, #0x04
    00000DD5 30 23            [12] 1033 	jr	NC, 00105$
                                   1034 ;src/titles.c:484: cpct_asicSetSpritePosition(ASIC_SPR_ROLAND_START + i, x, y);
    00000DD7 DD 46 FF         [19] 1035 	ld	b, -1 (ix)
    00000DDA AF               [ 4] 1036 	xor	a, a
    00000DDB 69               [ 4] 1037 	ld	l, c
    00000DDC 26 00            [ 7] 1038 	ld	h, #0x00
    00000DDE E5               [11] 1039 	push	hl
    00000DDF C5               [11] 1040 	push	bc
    00000DE0 D5               [11] 1041 	push	de
    00000DE1 E5               [11] 1042 	push	hl
    00000DE2 68               [ 4] 1043 	ld	l, b
    00000DE3 67               [ 4] 1044 	ld	h, a
    00000DE4 E3               [19] 1045 	ex	(sp), hl
    00000DE5 CD 07 1F         [17] 1046 	call	_cpct_asicSetSpritePosition
    00000DE8 D1               [10] 1047 	pop	de
    00000DE9 C1               [10] 1048 	pop	bc
    00000DEA E1               [10] 1049 	pop	hl
                                   1050 ;src/titles.c:485: cpct_asicSetSpriteZoom(ASIC_SPR_ROLAND_START + i, 2, 1);
    00000DEB C5               [11] 1051 	push	bc
    00000DEC D5               [11] 1052 	push	de
    00000DED 11 02 01         [10] 1053 	ld	de, #0x102
    00000DF0 D5               [11] 1054 	push	de
    00000DF1 CD E6 2D         [17] 1055 	call	_cpct_asicSetSpriteZoom
    00000DF4 D1               [10] 1056 	pop	de
    00000DF5 C1               [10] 1057 	pop	bc
                                   1058 ;src/titles.c:486: x += SPRITE_WIDTH_ZOOM;
    00000DF6 14               [ 4] 1059 	inc	d
                                   1060 ;src/titles.c:483: for (u8 i = 0; i < 4; i++) {
    00000DF7 0C               [ 4] 1061 	inc	c
    00000DF8 18 D8            [12] 1062 	jr	00103$
    00000DFA                       1063 00105$:
                                   1064 ;src/titles.c:488: }
    00000DFA 33               [ 6] 1065 	inc	sp
    00000DFB DD E1            [14] 1066 	pop	ix
    00000DFD C9               [10] 1067 	ret
                                   1068 ;src/titles.c:490: static void t_load_static_title_sprites(void) {
                                   1069 ;	---------------------------------
                                   1070 ; Function t_load_static_title_sprites
                                   1071 ; ---------------------------------
    00000DFE                       1072 _t_load_static_title_sprites:
                                   1073 ;src/titles.c:493: for (u8 i = 0; i < 4; i++) {
    00000DFE 0E 00            [ 7] 1074 	ld	c, #0x00
    00000E00                       1075 00104$:
    00000E00 79               [ 4] 1076 	ld	a, c
    00000E01 D6 04            [ 7] 1077 	sub	a, #0x04
    00000E03 30 24            [12] 1078 	jr	NC, 00101$
                                   1079 ;src/titles.c:496: titles_sprites_data, false);
    00000E05 11 90 91         [10] 1080 	ld	de, #_titles_sprites_data
                                   1081 ;src/titles.c:495: a_load_hw_sprite(HW_SPRITE_TITLE_CONTROLS_START + i, 4 + i,
    00000E08 79               [ 4] 1082 	ld	a, c
    00000E09 C6 04            [ 7] 1083 	add	a, #0x04
    00000E0B C5               [11] 1084 	push	bc
    00000E0C 26 00            [ 7] 1085 	ld	h, #0x00
    00000E0E E5               [11] 1086 	push	hl
    00000E0F 33               [ 6] 1087 	inc	sp
    00000E10 D5               [11] 1088 	push	de
    00000E11 6F               [ 4] 1089 	ld	l, a
    00000E12 CD D5 10         [17] 1090 	call	_a_load_hw_sprite
    00000E15 C1               [10] 1091 	pop	bc
                                   1092 ;src/titles.c:499: HW_SPRITE_TITLE_CONTROLS_START + i, 2, 1);
    00000E16 59               [ 4] 1093 	ld	e, c
    00000E17 16 00            [ 7] 1094 	ld	d, #0x00
    00000E19 21 04 00         [10] 1095 	ld	hl, #0x0004
    00000E1C 19               [11] 1096 	add	hl, de
    00000E1D C5               [11] 1097 	push	bc
    00000E1E 11 02 01         [10] 1098 	ld	de, #0x102
    00000E21 D5               [11] 1099 	push	de
    00000E22 CD E6 2D         [17] 1100 	call	_cpct_asicSetSpriteZoom
    00000E25 C1               [10] 1101 	pop	bc
                                   1102 ;src/titles.c:493: for (u8 i = 0; i < 4; i++) {
    00000E26 0C               [ 4] 1103 	inc	c
    00000E27 18 D7            [12] 1104 	jr	00104$
    00000E29                       1105 00101$:
                                   1106 ;src/titles.c:503: for (u8 i = 0; i < 3; i++) {
    00000E29 0E 00            [ 7] 1107 	ld	c, #0x00
    00000E2B                       1108 00107$:
    00000E2B 79               [ 4] 1109 	ld	a, c
    00000E2C D6 03            [ 7] 1110 	sub	a, #0x03
    00000E2E D0               [11] 1111 	ret	NC
                                   1112 ;src/titles.c:505: titles_sprites_data, false);
    00000E2F 11 90 91         [10] 1113 	ld	de, #_titles_sprites_data
                                   1114 ;src/titles.c:504: a_load_hw_sprite(HW_SPRITE_TITLE_PLAY_START + i, 8 + i,
    00000E32 79               [ 4] 1115 	ld	a, c
    00000E33 C6 08            [ 7] 1116 	add	a, #0x08
    00000E35 C5               [11] 1117 	push	bc
    00000E36 26 00            [ 7] 1118 	ld	h, #0x00
    00000E38 E5               [11] 1119 	push	hl
    00000E39 33               [ 6] 1120 	inc	sp
    00000E3A D5               [11] 1121 	push	de
    00000E3B 6F               [ 4] 1122 	ld	l, a
    00000E3C CD D5 10         [17] 1123 	call	_a_load_hw_sprite
    00000E3F C1               [10] 1124 	pop	bc
                                   1125 ;src/titles.c:506: cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + i, 2, 1);
    00000E40 59               [ 4] 1126 	ld	e, c
    00000E41 16 00            [ 7] 1127 	ld	d, #0x00
    00000E43 21 08 00         [10] 1128 	ld	hl, #0x0008
    00000E46 19               [11] 1129 	add	hl, de
    00000E47 C5               [11] 1130 	push	bc
    00000E48 11 02 01         [10] 1131 	ld	de, #0x102
    00000E4B D5               [11] 1132 	push	de
    00000E4C CD E6 2D         [17] 1133 	call	_cpct_asicSetSpriteZoom
    00000E4F C1               [10] 1134 	pop	bc
                                   1135 ;src/titles.c:503: for (u8 i = 0; i < 3; i++) {
    00000E50 0C               [ 4] 1136 	inc	c
                                   1137 ;src/titles.c:508: }
    00000E51 18 D8            [12] 1138 	jr	00107$
                                   1139 ;src/titles.c:510: static void t_load_game_mode_word(void) {
                                   1140 ;	---------------------------------
                                   1141 ; Function t_load_game_mode_word
                                   1142 ; ---------------------------------
    00000E53                       1143 _t_load_game_mode_word:
    00000E53 CD AA 2F         [17] 1144 	call	___sdcc_enter_ix
    00000E56 3B               [ 6] 1145 	dec	sp
                                   1146 ;src/titles.c:515: if (g_game_mode == 0) {
    00000E57 3A 5F 93         [13] 1147 	ld	a, (_g_game_mode+0)
    00000E5A B7               [ 4] 1148 	or	a, a
    00000E5B 20 08            [12] 1149 	jr	NZ, 00105$
                                   1150 ;src/titles.c:516: bank = SPR_BANK_MODE_CLASSIC;
    00000E5D DD 36 FF 02      [19] 1151 	ld	-1 (ix), #0x02
                                   1152 ;src/titles.c:517: count = 4;
    00000E61 0E 04            [ 7] 1153 	ld	c, #0x04
    00000E63 18 14            [12] 1154 	jr	00106$
    00000E65                       1155 00105$:
                                   1156 ;src/titles.c:518: } else if (g_game_mode == 1) {
    00000E65 3A 5F 93         [13] 1157 	ld	a, (_g_game_mode+0)
    00000E68 3D               [ 4] 1158 	dec	a
    00000E69 20 08            [12] 1159 	jr	NZ, 00102$
                                   1160 ;src/titles.c:519: bank = SPR_BANK_MODE_MANIA;
    00000E6B DD 36 FF 03      [19] 1161 	ld	-1 (ix), #0x03
                                   1162 ;src/titles.c:520: count = 3;
    00000E6F 0E 03            [ 7] 1163 	ld	c, #0x03
    00000E71 18 06            [12] 1164 	jr	00106$
    00000E73                       1165 00102$:
                                   1166 ;src/titles.c:522: bank = SPR_BANK_MODE_ZEN;
    00000E73 DD 36 FF 04      [19] 1167 	ld	-1 (ix), #0x04
                                   1168 ;src/titles.c:523: count = 2;
    00000E77 0E 02            [ 7] 1169 	ld	c, #0x02
    00000E79                       1170 00106$:
                                   1171 ;src/titles.c:527: a_hide_sprite_range(ASIC_SPR_MODE_START, 4);
    00000E79 C5               [11] 1172 	push	bc
    00000E7A 2E 04            [ 7] 1173 	ld	l, #0x04
    00000E7C 3E 0B            [ 7] 1174 	ld	a, #0x0b
    00000E7E CD 0C 12         [17] 1175 	call	_a_hide_sprite_range
    00000E81 C1               [10] 1176 	pop	bc
                                   1177 ;src/titles.c:530: for (u8 i = 0; i < count; i++) {
    00000E82 06 00            [ 7] 1178 	ld	b, #0x00
    00000E84                       1179 00109$:
    00000E84 78               [ 4] 1180 	ld	a, b
    00000E85 91               [ 4] 1181 	sub	a, c
    00000E86 30 26            [12] 1182 	jr	NC, 00111$
                                   1183 ;src/titles.c:531: cpct_waitVSYNC();
    00000E88 C5               [11] 1184 	push	bc
    00000E89 CD 67 2F         [17] 1185 	call	_cpct_waitVSYNC
    00000E8C C1               [10] 1186 	pop	bc
                                   1187 ;src/titles.c:532: c_sprite_cache_bank_upload(bank, i, ASIC_SPR_MODE_START + i);
    00000E8D 78               [ 4] 1188 	ld	a, b
    00000E8E C6 0B            [ 7] 1189 	add	a, #0x0b
    00000E90 C5               [11] 1190 	push	bc
    00000E91 F5               [11] 1191 	push	af
    00000E92 33               [ 6] 1192 	inc	sp
    00000E93 68               [ 4] 1193 	ld	l, b
    00000E94 DD 7E FF         [19] 1194 	ld	a, -1 (ix)
    00000E97 CD B2 13         [17] 1195 	call	_c_sprite_cache_bank_upload
    00000E9A C1               [10] 1196 	pop	bc
                                   1197 ;src/titles.c:533: cpct_asicSetSpriteZoom(ASIC_SPR_MODE_START + i, 2, 1);
    00000E9B 58               [ 4] 1198 	ld	e, b
    00000E9C 16 00            [ 7] 1199 	ld	d, #0x00
    00000E9E 21 0B 00         [10] 1200 	ld	hl, #0x000b
    00000EA1 19               [11] 1201 	add	hl, de
    00000EA2 C5               [11] 1202 	push	bc
    00000EA3 11 02 01         [10] 1203 	ld	de, #0x102
    00000EA6 D5               [11] 1204 	push	de
    00000EA7 CD E6 2D         [17] 1205 	call	_cpct_asicSetSpriteZoom
    00000EAA C1               [10] 1206 	pop	bc
                                   1207 ;src/titles.c:530: for (u8 i = 0; i < count; i++) {
    00000EAB 04               [ 4] 1208 	inc	b
    00000EAC 18 D6            [12] 1209 	jr	00109$
    00000EAE                       1210 00111$:
                                   1211 ;src/titles.c:535: }
    00000EAE 33               [ 6] 1212 	inc	sp
    00000EAF DD E1            [14] 1213 	pop	ix
    00000EB1 C9               [10] 1214 	ret
                                   1215 ;src/titles.c:537: static void t_change_game_mode(i8 delta) {
                                   1216 ;	---------------------------------
                                   1217 ; Function t_change_game_mode
                                   1218 ; ---------------------------------
    00000EB2                       1219 _t_change_game_mode:
    00000EB2 4F               [ 4] 1220 	ld	c, a
                                   1221 ;src/titles.c:539: i8 mode = (i8)g_game_mode + delta;
    00000EB3 3A 5F 93         [13] 1222 	ld	a, (_g_game_mode)
    00000EB6 81               [ 4] 1223 	add	a, c
    00000EB7 4F               [ 4] 1224 	ld	c, a
                                   1225 ;src/titles.c:541: if (mode < 0)
    00000EB8 CB 79            [ 8] 1226 	bit	7, c
    00000EBA 28 04            [12] 1227 	jr	Z, 00104$
                                   1228 ;src/titles.c:542: mode = 2;
    00000EBC 0E 02            [ 7] 1229 	ld	c, #0x02
    00000EBE 18 0D            [12] 1230 	jr	00105$
    00000EC0                       1231 00104$:
                                   1232 ;src/titles.c:543: else if (mode > 2)
    00000EC0 3E 02            [ 7] 1233 	ld	a, #0x02
    00000EC2 91               [ 4] 1234 	sub	a, c
    00000EC3 E2 C8 0E         [10] 1235 	jp	PO, 00131$
    00000EC6 EE 80            [ 7] 1236 	xor	a, #0x80
    00000EC8                       1237 00131$:
    00000EC8 F2 CD 0E         [10] 1238 	jp	P, 00105$
                                   1239 ;src/titles.c:544: mode = 0;
    00000ECB 0E 00            [ 7] 1240 	ld	c, #0x00
    00000ECD                       1241 00105$:
                                   1242 ;src/titles.c:546: if ((u8)mode == g_game_mode)
    00000ECD 3A 5F 93         [13] 1243 	ld	a, (_g_game_mode+0)
    00000ED0 91               [ 4] 1244 	sub	a, c
    00000ED1 C8               [11] 1245 	ret	Z
                                   1246 ;src/titles.c:547: return;
                                   1247 ;src/titles.c:549: g_game_mode = (u8)mode;
    00000ED2 21 5F 93         [10] 1248 	ld	hl, #_g_game_mode
    00000ED5 71               [ 7] 1249 	ld	(hl), c
                                   1250 ;src/titles.c:552: cpct_waitVSYNC();
    00000ED6 CD 67 2F         [17] 1251 	call	_cpct_waitVSYNC
                                   1252 ;src/titles.c:553: t_load_game_mode_word();
    00000ED9 CD 53 0E         [17] 1253 	call	_t_load_game_mode_word
                                   1254 ;src/titles.c:554: cpct_waitVSYNC();
    00000EDC CD 67 2F         [17] 1255 	call	_cpct_waitVSYNC
                                   1256 ;src/titles.c:555: t_draw_game_mode();
    00000EDF CD 6E 0A         [17] 1257 	call	_t_draw_game_mode
                                   1258 ;src/titles.c:556: cpct_waitVSYNC();
    00000EE2 CD 67 2F         [17] 1259 	call	_cpct_waitVSYNC
                                   1260 ;src/titles.c:559: cpct_asicSetBorder(cpctm_asicColor(15, g_game_mode, g_game_mode));
    00000EE5 3A 5F 93         [13] 1261 	ld	a, (_g_game_mode)
    00000EE8 E6 0F            [ 7] 1262 	and	a, #0x0f
    00000EEA 67               [ 4] 1263 	ld	h, a
    00000EEB 2E F0            [ 7] 1264 	ld	l, #0xf0
    00000EED B5               [ 4] 1265 	or	a, l
    00000EEE 6F               [ 4] 1266 	ld	l, a
    00000EEF CD FA 2D         [17] 1267 	call	_cpct_asicSetBorder
                                   1268 ;src/titles.c:560: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
    00000EF2 21 FF 0F         [10] 1269 	ld	hl, #0x0fff
                                   1270 ;src/titles.c:561: }
    00000EF5 C3 FA 2D         [10] 1271 	jp	_cpct_asicSetBorder
                                   1272 ;src/titles.c:563: static title_input_t t_poll_title_input(void) {
                                   1273 ;	---------------------------------
                                   1274 ; Function t_poll_title_input
                                   1275 ; ---------------------------------
    00000EF8                       1276 _t_poll_title_input:
                                   1277 ;src/titles.c:568: bool left_down = cpct_isKeyPressed(Key_CursorLeft);
    00000EF8 21 01 01         [10] 1278 	ld	hl, #0x0101
    00000EFB CD 01 2D         [17] 1279 	call	_cpct_isKeyPressed
    00000EFE AF               [ 4] 1280 	xor	a, a
    00000EFF BD               [ 4] 1281 	cp	a, l
    00000F00 17               [ 4] 1282 	rla
    00000F01 5F               [ 4] 1283 	ld	e, a
                                   1284 ;src/titles.c:569: bool right_down = cpct_isKeyPressed(Key_CursorRight);
    00000F02 D5               [11] 1285 	push	de
    00000F03 21 00 02         [10] 1286 	ld	hl, #0x0200
    00000F06 CD 01 2D         [17] 1287 	call	_cpct_isKeyPressed
    00000F09 D1               [10] 1288 	pop	de
    00000F0A AF               [ 4] 1289 	xor	a, a
    00000F0B BD               [ 4] 1290 	cp	a, l
    00000F0C 17               [ 4] 1291 	rla
    00000F0D 47               [ 4] 1292 	ld	b, a
                                   1293 ;src/titles.c:571: title_input_t result = TITLE_INPUT_NONE;
    00000F0E 0E 00            [ 7] 1294 	ld	c, #0x00
                                   1295 ;src/titles.c:573: if (left_down && !left_was_down)
    00000F10 CB 43            [ 8] 1296 	bit	0, e
    00000F12 28 0B            [12] 1297 	jr	Z, 00105$
    00000F14 21 0B 84         [10] 1298 	ld	hl, #_t_poll_title_input_left_was_down_10000_356
    00000F17 CB 46            [12] 1299 	bit	0, (hl)
    00000F19 20 04            [12] 1300 	jr	NZ, 00105$
                                   1301 ;src/titles.c:574: result = TITLE_INPUT_LEFT;
    00000F1B 0E FF            [ 7] 1302 	ld	c, #0xff
    00000F1D 18 0D            [12] 1303 	jr	00106$
    00000F1F                       1304 00105$:
                                   1305 ;src/titles.c:575: else if (right_down && !right_was_down)
    00000F1F CB 40            [ 8] 1306 	bit	0, b
    00000F21 28 09            [12] 1307 	jr	Z, 00106$
    00000F23 21 0C 84         [10] 1308 	ld	hl, #_t_poll_title_input_right_was_down_10000_356
    00000F26 CB 46            [12] 1309 	bit	0, (hl)
    00000F28 20 02            [12] 1310 	jr	NZ, 00106$
                                   1311 ;src/titles.c:576: result = TITLE_INPUT_RIGHT;
    00000F2A 0E 01            [ 7] 1312 	ld	c, #0x01
    00000F2C                       1313 00106$:
                                   1314 ;src/titles.c:578: left_was_down = left_down;
    00000F2C 21 0B 84         [10] 1315 	ld	hl, #_t_poll_title_input_left_was_down_10000_356
    00000F2F 73               [ 7] 1316 	ld	(hl), e
                                   1317 ;src/titles.c:579: right_was_down = right_down;
    00000F30 21 0C 84         [10] 1318 	ld	hl, #_t_poll_title_input_right_was_down_10000_356
    00000F33 70               [ 7] 1319 	ld	(hl), b
                                   1320 ;src/titles.c:581: return result;
    00000F34 79               [ 4] 1321 	ld	a, c
                                   1322 ;src/titles.c:582: }
    00000F35 C9               [10] 1323 	ret
                                   1324 ;src/titles.c:584: static void t_start_roland_scroll(bool right, u8 y, i8 speed) {
                                   1325 ;	---------------------------------
                                   1326 ; Function t_start_roland_scroll
                                   1327 ; ---------------------------------
    00000F36                       1328 _t_start_roland_scroll:
    00000F36 4F               [ 4] 1329 	ld	c, a
    00000F37 7D               [ 4] 1330 	ld	a, l
    00000F38 32 09 84         [13] 1331 	ld	(#_t_roland_y), a
                                   1332 ;src/titles.c:586: t_roland_right = right;
    00000F3B 21 67 93         [10] 1333 	ld	hl, #_t_roland_right
    00000F3E 71               [ 7] 1334 	ld	(hl), c
                                   1335 ;src/titles.c:589: if (right) {
    00000F3F CB 41            [ 8] 1336 	bit	0, c
    00000F41 28 1B            [12] 1337 	jr	Z, 00102$
                                   1338 ;src/titles.c:590: t_roland_start_x = SCREEN_WIDTH_M2;
    00000F43 21 80 02         [10] 1339 	ld	hl, #0x0280
    00000F46 22 04 84         [16] 1340 	ld	(_t_roland_start_x), hl
                                   1341 ;src/titles.c:591: t_roland_end_x = -SPRITE_WIDTH_ZOOM;
    00000F49 21 00 FF         [10] 1342 	ld	hl, #0xff00
    00000F4C 22 06 84         [16] 1343 	ld	(_t_roland_end_x), hl
                                   1344 ;src/titles.c:592: t_roland_step = -speed;
    00000F4F 21 02 00         [10] 1345 	ld	hl, #2
    00000F52 39               [11] 1346 	add	hl, sp
    00000F53 FD 21 08 84      [14] 1347 	ld	iy, #_t_roland_step
    00000F57 AF               [ 4] 1348 	xor	a, a
    00000F58 96               [ 7] 1349 	sub	a, (hl)
    00000F59 FD 77 00         [19] 1350 	ld	0 (iy), a
    00000F5C 18 14            [12] 1351 	jr	00103$
    00000F5E                       1352 00102$:
                                   1353 ;src/titles.c:594: t_roland_start_x = -SPRITE_WIDTH_ZOOM;
    00000F5E 21 00 FF         [10] 1354 	ld	hl, #0xff00
    00000F61 22 04 84         [16] 1355 	ld	(_t_roland_start_x), hl
                                   1356 ;src/titles.c:595: t_roland_end_x = SCREEN_WIDTH_M2;
    00000F64 21 80 02         [10] 1357 	ld	hl, #0x0280
    00000F67 22 06 84         [16] 1358 	ld	(_t_roland_end_x), hl
                                   1359 ;src/titles.c:596: t_roland_step = speed;
    00000F6A 21 02 00         [10] 1360 	ld	hl, #2
    00000F6D 39               [11] 1361 	add	hl, sp
    00000F6E 7E               [ 7] 1362 	ld	a, (hl)
    00000F6F 32 08 84         [13] 1363 	ld	(_t_roland_step+0), a
    00000F72                       1364 00103$:
                                   1365 ;src/titles.c:599: t_roland_x = t_roland_start_x;
    00000F72 2A 04 84         [16] 1366 	ld	hl, (_t_roland_start_x)
    00000F75 22 02 84         [16] 1367 	ld	(_t_roland_x), hl
                                   1368 ;src/titles.c:600: t_roland_active = true;
    00000F78 21 0A 84         [10] 1369 	ld	hl, #_t_roland_active
    00000F7B 36 01            [10] 1370 	ld	(hl), #0x01
                                   1371 ;src/titles.c:602: t_load_roland_from_cache(right);
    00000F7D 79               [ 4] 1372 	ld	a, c
    00000F7E CD 8C 0D         [17] 1373 	call	_t_load_roland_from_cache
                                   1374 ;src/titles.c:603: }
    00000F81 E1               [10] 1375 	pop	hl
    00000F82 33               [ 6] 1376 	inc	sp
    00000F83 E9               [ 4] 1377 	jp	(hl)
                                   1378 ;src/titles.c:605: static void t_update_roland(void) {
                                   1379 ;	---------------------------------
                                   1380 ; Function t_update_roland
                                   1381 ; ---------------------------------
    00000F84                       1382 _t_update_roland:
                                   1383 ;src/titles.c:607: if (!t_roland_active)
    00000F84 21 0A 84         [10] 1384 	ld	hl, #_t_roland_active
    00000F87 CB 46            [12] 1385 	bit	0, (hl)
                                   1386 ;src/titles.c:608: return;
    00000F89 C8               [11] 1387 	ret	Z
                                   1388 ;src/titles.c:610: v_set_title_roland_sprite_pos(t_roland_x, t_roland_y, t_roland_right);
    00000F8A 3A 09 84         [13] 1389 	ld	a, (_t_roland_y)
    00000F8D 5F               [ 4] 1390 	ld	e, a
    00000F8E 16 00            [ 7] 1391 	ld	d, #0x00
    00000F90 3A 67 93         [13] 1392 	ld	a, (_t_roland_right)
    00000F93 F5               [11] 1393 	push	af
    00000F94 33               [ 6] 1394 	inc	sp
    00000F95 2A 02 84         [16] 1395 	ld	hl, (_t_roland_x)
    00000F98 CD 68 17         [17] 1396 	call	_v_set_title_roland_sprite_pos
                                   1397 ;src/titles.c:612: t_roland_x += t_roland_step;
    00000F9B 3A 08 84         [13] 1398 	ld	a, (_t_roland_step)
    00000F9E 4F               [ 4] 1399 	ld	c, a
    00000F9F 07               [ 4] 1400 	rlca
    00000FA0 9F               [ 4] 1401 	sbc	a, a
    00000FA1 5F               [ 4] 1402 	ld	e, a
    00000FA2 79               [ 4] 1403 	ld	a, c
    00000FA3 21 02 84         [10] 1404 	ld	hl, #_t_roland_x
    00000FA6 86               [ 7] 1405 	add	a, (hl)
    00000FA7 77               [ 7] 1406 	ld	(hl), a
    00000FA8 23               [ 6] 1407 	inc	hl
    00000FA9 7B               [ 4] 1408 	ld	a, e
    00000FAA 8E               [ 7] 1409 	adc	a, (hl)
    00000FAB 77               [ 7] 1410 	ld	(hl), a
                                   1411 ;src/titles.c:614: if ((t_roland_step > 0 && t_roland_x > t_roland_end_x) ||
    00000FAC AF               [ 4] 1412 	xor	a, a
    00000FAD 21 08 84         [10] 1413 	ld	hl, #_t_roland_step
    00000FB0 96               [ 7] 1414 	sub	a, (hl)
    00000FB1 E2 B6 0F         [10] 1415 	jp	PO, 00140$
    00000FB4 EE 80            [ 7] 1416 	xor	a, #0x80
    00000FB6                       1417 00140$:
    00000FB6 07               [ 4] 1418 	rlca
    00000FB7 E6 01            [ 7] 1419 	and	a,#0x01
    00000FB9 4F               [ 4] 1420 	ld	c, a
    00000FBA B7               [ 4] 1421 	or	a, a
    00000FBB 28 18            [12] 1422 	jr	Z, 00107$
    00000FBD 21 06 84         [10] 1423 	ld	hl, #_t_roland_end_x
    00000FC0 7E               [ 7] 1424 	ld	a, (hl)
    00000FC1 FD 21 02 84      [14] 1425 	ld	iy, #_t_roland_x
    00000FC5 FD 96 00         [19] 1426 	sub	a, 0 (iy)
    00000FC8 23               [ 6] 1427 	inc	hl
    00000FC9 7E               [ 7] 1428 	ld	a, (hl)
    00000FCA FD 9E 01         [19] 1429 	sbc	a, 1 (iy)
    00000FCD E2 D2 0F         [10] 1430 	jp	PO, 00141$
    00000FD0 EE 80            [ 7] 1431 	xor	a, #0x80
    00000FD2                       1432 00141$:
    00000FD2 FA ED 0F         [10] 1433 	jp	M, 00103$
    00000FD5                       1434 00107$:
                                   1435 ;src/titles.c:615: (t_roland_step < 0 && t_roland_x < t_roland_end_x)) {
    00000FD5 3A 08 84         [13] 1436 	ld	a, (_t_roland_step+0)
    00000FD8 CB 7F            [ 8] 1437 	bit	7, a
    00000FDA C8               [11] 1438 	ret	Z
    00000FDB 21 06 84         [10] 1439 	ld	hl, #_t_roland_end_x
    00000FDE 3A 02 84         [13] 1440 	ld	a, (_t_roland_x+0)
    00000FE1 96               [ 7] 1441 	sub	a, (hl)
    00000FE2 23               [ 6] 1442 	inc	hl
    00000FE3 3A 03 84         [13] 1443 	ld	a, (_t_roland_x+1)
    00000FE6 9E               [ 7] 1444 	sbc	a, (hl)
    00000FE7 E2 EC 0F         [10] 1445 	jp	PO, 00142$
    00000FEA EE 80            [ 7] 1446 	xor	a, #0x80
    00000FEC                       1447 00142$:
    00000FEC F0               [11] 1448 	ret	P
    00000FED                       1449 00103$:
                                   1450 ;src/titles.c:617: t_roland_active = false;
    00000FED AF               [ 4] 1451 	xor	a, a
    00000FEE 32 0A 84         [13] 1452 	ld	(_t_roland_active+0), a
                                   1453 ;src/titles.c:621: (t_roland_step > 0) ? t_roland_step : -t_roland_step);
    00000FF1 79               [ 4] 1454 	ld	a, c
    00000FF2 B7               [ 4] 1455 	or	a, a
    00000FF3 28 06            [12] 1456 	jr	Z, 00110$
    00000FF5 3A 08 84         [13] 1457 	ld	a, (_t_roland_step)
    00000FF8 47               [ 4] 1458 	ld	b, a
    00000FF9 18 06            [12] 1459 	jr	00111$
    00000FFB                       1460 00110$:
    00000FFB 21 08 84         [10] 1461 	ld	hl, #_t_roland_step
    00000FFE AF               [ 4] 1462 	xor	a, a
    00000FFF 96               [ 7] 1463 	sub	a, (hl)
    00001000 47               [ 4] 1464 	ld	b, a
    00001001                       1465 00111$:
                                   1466 ;src/titles.c:620: t_start_roland_scroll(!t_roland_right, t_roland_y,
    00001001 3A 67 93         [13] 1467 	ld	a, (_t_roland_right+0)
    00001004 EE 01            [ 7] 1468 	xor	a, #0x01
    00001006 4F               [ 4] 1469 	ld	c, a
    00001007 C5               [11] 1470 	push	bc
    00001008 33               [ 6] 1471 	inc	sp
    00001009 3A 09 84         [13] 1472 	ld	a, (_t_roland_y)
    0000100C 6F               [ 4] 1473 	ld	l, a
    0000100D 79               [ 4] 1474 	ld	a, c
    0000100E CD 36 0F         [17] 1475 	call	_t_start_roland_scroll
                                   1476 ;src/titles.c:623: }
    00001011 C9               [10] 1477 	ret
                                   1478 	.area _CODE
                                   1479 	.area _INITIALIZER
    0000938F                       1480 __xinit__g_game_mode:
    0000938F 00                    1481 	.db #0x00	; 0
    00009390                       1482 __xinit__t_int_idx:
    00009390 00                    1483 	.db #0x00	; 0
    00009391                       1484 __xinit__t_frame_c:
    00009391 00                    1485 	.db #0x00	; 0
    00009392                       1486 __xinit__text_phase:
    00009392 00                    1487 	.db #0x00	; 0
    00009393                       1488 __xinit__text_tick:
    00009393 00                    1489 	.db #0x00	; 0
    00009394                       1490 __xinit__slopes_phase:
    00009394 00                    1491 	.db #0x00	; 0
    00009395                       1492 __xinit__slopes_dir:
    00009395 01                    1493 	.db #0x01	;  1
    00009396                       1494 __xinit__slopes_tick:
    00009396 00                    1495 	.db #0x00	; 0
    00009397                       1496 __xinit__t_roland_right:
    00009397 00                    1497 	.db #0x00	;  0
    00009398                       1498 __xinit__t_mode_cooldown:
    00009398 00                    1499 	.db #0x00	; 0
                                   1500 	.area _CABS (ABS)
