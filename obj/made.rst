                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module made
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _v_set_made_cpctelera_sprite_pos
                                     12 	.globl _v_clear_screen
                                     13 	.globl _v_blank_screen_mode_1
                                     14 	.globl _u_wait_for_duration_or_kp
                                     15 	.globl _u_reset_clock
                                     16 	.globl _u_clock_interrupt
                                     17 	.globl _d_gfx_decompress_to_screen
                                     18 	.globl _d_load
                                     19 	.globl _a_page_disconnect_safe
                                     20 	.globl _a_page_connect_safe
                                     21 	.globl _a_load_cpctelera_sprites
                                     22 	.globl _a_clear_sprites
                                     23 	.globl _a_set_hardware_sprite_palette
                                     24 	.globl _cpct_asicRemoveLinesInterruptHandler
                                     25 	.globl _cpct_asicSetLinesInterruptHandler
                                     26 	.globl _cpct_asicSetPalette
                                     27 	.globl _cpct_asicSetBorder
                                     28 	.globl _cpct_waitVSYNC
                                     29 	.globl _cpct_scanKeyboard_if
                                     30 	.globl _m_start
                                     31 	.globl _m_stop
                                     32 ;--------------------------------------------------------
                                     33 ; special function registers
                                     34 ;--------------------------------------------------------
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area _DATA
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area _INITIALIZED
    00009356                         43 _m_int_idx:
    00009356                         44 	.ds 1
    00009357                         45 _m_frame_c:
    00009357                         46 	.ds 1
                                     47 ;--------------------------------------------------------
                                     48 ; absolute external ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area _DABS (ABS)
                                     51 ;--------------------------------------------------------
                                     52 ; global & static initialisations
                                     53 ;--------------------------------------------------------
                                     54 	.area _HOME
                                     55 	.area _GSINIT
                                     56 	.area _GSFINAL
                                     57 	.area _GSINIT
                                     58 ;--------------------------------------------------------
                                     59 ; Home
                                     60 ;--------------------------------------------------------
                                     61 	.area _HOME
                                     62 	.area _HOME
                                     63 ;--------------------------------------------------------
                                     64 ; code
                                     65 ;--------------------------------------------------------
                                     66 	.area _CODE
                                     67 ;src/made.c:74: void m_start(void) {
                                     68 ;	---------------------------------
                                     69 ; Function m_start
                                     70 ; ---------------------------------
    000005A6                         71 _m_start::
                                     72 ;src/made.c:77: a_clear_sprites();
    000005A6 CD A9 11         [17]   73 	call	_a_clear_sprites
                                     74 ;src/made.c:78: v_blank_screen_mode_1();
    000005A9 CD 47 16         [17]   75 	call	_v_blank_screen_mode_1
                                     76 ;src/made.c:79: v_clear_screen();
    000005AC CD 61 16         [17]   77 	call	_v_clear_screen
                                     78 ;src/made.c:82: m_draw_bg();
    000005AF CD 1A 06         [17]   79 	call	_m_draw_bg
                                     80 ;src/made.c:83: m_draw_hw_sprites();
    000005B2 CD 04 06         [17]   81 	call	_m_draw_hw_sprites
                                     82 ;src/made.c:85: m_reset_timers();
    000005B5 CD FC 05         [17]   83 	call	_m_reset_timers
                                     84 ;src/made.c:86: m_add_interrupt();
    000005B8 CD 4B 06         [17]   85 	call	_m_add_interrupt
                                     86 ;src/made.c:88: g_clock_on = true;
    000005BB 21 4F 93         [10]   87 	ld	hl, #_g_clock_on
    000005BE 36 01            [10]   88 	ld	(hl), #0x01
                                     89 ;src/made.c:89: u_reset_clock();
    000005C0 CD AF 15         [17]   90 	call	_u_reset_clock
                                     91 ;src/made.c:90: u_wait_for_duration_or_kp(15);
    000005C3 21 0F 00         [10]   92 	ld	hl, #0x000f
    000005C6 CD E5 15         [17]   93 	call	_u_wait_for_duration_or_kp
                                     94 ;src/made.c:91: g_clock_on = false;
    000005C9 AF               [ 4]   95 	xor	a, a
    000005CA 32 4F 93         [13]   96 	ld	(_g_clock_on+0), a
                                     97 ;src/made.c:94: a_clear_sprites();
                                     98 ;src/made.c:95: }
    000005CD C3 A9 11         [10]   99 	jp	_a_clear_sprites
    000005D0                        100 _m_pal_blank:
    000005D0 FF 0F                  101 	.dw #0x0fff
    000005D2 FF 0F                  102 	.dw #0x0fff
    000005D4 FF 0F                  103 	.dw #0x0fff
    000005D6 FF 0F                  104 	.dw #0x0fff
    000005D8                        105 _m_pal_usual:
    000005D8 FF 0F                  106 	.dw #0x0fff
    000005DA 00 00                  107 	.dw #0x0000
    000005DC 99 09                  108 	.dw #0x0999
    000005DE 95 02                  109 	.dw #0x0295
    000005E0                        110 _m_pal_text:
    000005E0 FF 0F                  111 	.dw #0x0fff
    000005E2 00 00                  112 	.dw #0x0000
    000005E4 AF 0B                  113 	.dw #0x0baf
    000005E6 5F 05                  114 	.dw #0x055f
    000005E8                        115 _m_pal_logo:
    000005E8 FF 0F                  116 	.dw #0x0fff
    000005EA 61 05                  117 	.dw #0x0561
    000005EC 00 00                  118 	.dw #0x0000
    000005EE D4 0C                  119 	.dw #0x0cd4
                                    120 ;src/made.c:98: void m_stop(void) {
                                    121 ;	---------------------------------
                                    122 ; Function m_stop
                                    123 ; ---------------------------------
    000005F0                        124 _m_stop::
                                    125 ;src/made.c:100: m_remove_interrupt();
    000005F0 CD D5 06         [17]  126 	call	_m_remove_interrupt
                                    127 ;src/made.c:101: a_clear_sprites();
    000005F3 CD A9 11         [17]  128 	call	_a_clear_sprites
                                    129 ;src/made.c:103: v_blank_screen_mode_1();
    000005F6 CD 47 16         [17]  130 	call	_v_blank_screen_mode_1
                                    131 ;src/made.c:104: v_clear_screen();
                                    132 ;src/made.c:105: }
    000005F9 C3 61 16         [10]  133 	jp	_v_clear_screen
                                    134 ;src/made.c:108: static void m_reset_timers(void) {
                                    135 ;	---------------------------------
                                    136 ; Function m_reset_timers
                                    137 ; ---------------------------------
    000005FC                        138 _m_reset_timers:
                                    139 ;src/made.c:110: m_int_idx = 0;
                                    140 ;src/made.c:111: m_frame_c = 0;
    000005FC AF               [ 4]  141 	xor	a, a
    000005FD 32 56 93         [13]  142 	ld	(_m_int_idx+0), a
    00000600 32 57 93         [13]  143 	ld	(_m_frame_c+0), a
                                    144 ;src/made.c:112: }
    00000603 C9               [10]  145 	ret
                                    146 ;src/made.c:114: static void m_draw_hw_sprites(void) {
                                    147 ;	---------------------------------
                                    148 ; Function m_draw_hw_sprites
                                    149 ; ---------------------------------
    00000604                        150 _m_draw_hw_sprites:
                                    151 ;src/made.c:116: a_load_cpctelera_sprites(false);
    00000604 AF               [ 4]  152 	xor	a, a
    00000605 CD C7 10         [17]  153 	call	_a_load_cpctelera_sprites
                                    154 ;src/made.c:117: v_set_made_cpctelera_sprite_pos(454, 36, false);
    00000608 AF               [ 4]  155 	xor	a, a
    00000609 F5               [11]  156 	push	af
    0000060A 33               [ 6]  157 	inc	sp
    0000060B 11 24 00         [10]  158 	ld	de, #0x0024
    0000060E 21 C6 01         [10]  159 	ld	hl, #0x01c6
    00000611 CD DE 17         [17]  160 	call	_v_set_made_cpctelera_sprite_pos
                                    161 ;src/made.c:118: a_set_hardware_sprite_palette(cpctelera_sprites_palette);
    00000614 21 20 93         [10]  162 	ld	hl, #_cpctelera_sprites_palette
                                    163 ;src/made.c:119: }
    00000617 C3 75 10         [10]  164 	jp	_a_set_hardware_sprite_palette
                                    165 ;src/made.c:122: static void m_draw_bg(void) {
                                    166 ;	---------------------------------
                                    167 ; Function m_draw_bg
                                    168 ; ---------------------------------
    0000061A                        169 _m_draw_bg:
                                    170 ;src/made.c:124: if (HW_HAS_128K(g_hw))
    0000061A 3A 00 84         [13]  171 	ld	a, (_g_hw)
    0000061D E6 03            [ 7]  172 	and	a, #0x03
    0000061F D6 01            [ 7]  173 	sub	a, #0x01
    00000621 38 07            [12]  174 	jr	C, 00102$
                                    175 ;src/made.c:125: d_gfx_decompress_to_screen(GFX_MADEWIDTH);
    00000623 3E 01            [ 7]  176 	ld	a, #0x01
    00000625 CD D0 14         [17]  177 	call	_d_gfx_decompress_to_screen
    00000628 18 0F            [12]  178 	jr	00103$
    0000062A                        179 00102$:
                                    180 ;src/made.c:127: a_page_disconnect_safe();
    0000062A CD B4 12         [17]  181 	call	_a_page_disconnect_safe
                                    182 ;src/made.c:128: d_load("MADEWITHSCR", VIDEO_MEM_START);
    0000062D 11 00 C0         [10]  183 	ld	de, #0xc000
    00000630 21 3F 06         [10]  184 	ld	hl, #___str_0
    00000633 CD 7C 14         [17]  185 	call	_d_load
                                    186 ;src/made.c:129: a_page_connect_safe();
    00000636 CD A5 12         [17]  187 	call	_a_page_connect_safe
    00000639                        188 00103$:
                                    189 ;src/made.c:132: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
    00000639 21 FF 0F         [10]  190 	ld	hl, #0x0fff
                                    191 ;src/made.c:133: }
    0000063C C3 FA 2D         [10]  192 	jp	_cpct_asicSetBorder
    0000063F                        193 ___str_0:
    0000063F 4D 41 44 45 57 49 54   194 	.ascii "MADEWITHSCR"
             48 53 43 52
    0000064A 00                     195 	.db 0x00
                                    196 ;src/made.c:135: static void m_add_interrupt(void) {
                                    197 ;	---------------------------------
                                    198 ; Function m_add_interrupt
                                    199 ; ---------------------------------
    0000064B                        200 _m_add_interrupt:
                                    201 ;src/made.c:145: cpct_waitVSYNC();
    0000064B CD 67 2F         [17]  202 	call	_cpct_waitVSYNC
                                    203 ;src/made.c:147: cpct_asicSetLinesInterruptHandler(m_interrupt, lines, sizeof(lines));
    0000064E 21 05 00         [10]  204 	ld	hl, #0x0005
    00000651 E5               [11]  205 	push	hl
    00000652 11 5C 06         [10]  206 	ld	de, #_m_add_interrupt_lines_10000_271
    00000655 21 61 06         [10]  207 	ld	hl, #_m_interrupt
    00000658 CD C5 2F         [17]  208 	call	_cpct_asicSetLinesInterruptHandler
                                    209 ;src/made.c:148: }
    0000065B C9               [10]  210 	ret
    0000065C                        211 _m_add_interrupt_lines_10000_271:
    0000065C 00                     212 	.db #0x00	; 0
    0000065D 28                     213 	.db #0x28	; 40
    0000065E 38                     214 	.db #0x38	; 56	'8'
    0000065F 76                     215 	.db #0x76	; 118	'v'
    00000660 86                     216 	.db #0x86	; 134
                                    217 ;src/made.c:150: static void m_interrupt(u8 line) __z88dk_fastcall {
                                    218 ;	---------------------------------
                                    219 ; Function m_interrupt
                                    220 ; ---------------------------------
    00000661                        221 _m_interrupt:
    00000661 7D               [ 4]  222 	ld	a, l
                                    223 ;src/made.c:152: if (line == MADE_DO_STUFF) {
    00000662 B7               [ 4]  224 	or	a, a
    00000663 20 3D            [12]  225 	jr	NZ, 00123$
                                    226 ;src/made.c:154: if (m_int_idx == 0) {
    00000665 3A 56 93         [13]  227 	ld	a, (_m_int_idx+0)
    00000668 B7               [ 4]  228 	or	a, a
    00000669 20 12            [12]  229 	jr	NZ, 00104$
                                    230 ;src/made.c:155: if (++m_frame_c == FC_MAX)
    0000066B FD 21 57 93      [14]  231 	ld	iy, #_m_frame_c
    0000066F FD 34 00         [23]  232 	inc	0 (iy)
    00000672 3A 57 93         [13]  233 	ld	a, (_m_frame_c+0)
    00000675 D6 32            [ 7]  234 	sub	a, #0x32
    00000677 20 04            [12]  235 	jr	NZ, 00104$
                                    236 ;src/made.c:156: m_frame_c = 0;
    00000679 FD 36 00 00      [19]  237 	ld	0 (iy), #0x00
    0000067D                        238 00104$:
                                    239 ;src/made.c:159: if (m_int_idx == 1)
    0000067D 3A 56 93         [13]  240 	ld	a, (_m_int_idx+0)
    00000680 3D               [ 4]  241 	dec	a
    00000681 20 03            [12]  242 	jr	NZ, 00106$
                                    243 ;src/made.c:160: cpct_scanKeyboard_if();
    00000683 CD 96 2E         [17]  244 	call	_cpct_scanKeyboard_if
    00000686                        245 00106$:
                                    246 ;src/made.c:162: if (m_int_idx == 3)
    00000686 3A 56 93         [13]  247 	ld	a, (_m_int_idx+0)
    00000689 D6 03            [ 7]  248 	sub	a, #0x03
    0000068B 20 03            [12]  249 	jr	NZ, 00108$
                                    250 ;src/made.c:163: u_clock_interrupt();
    0000068D CD 71 15         [17]  251 	call	_u_clock_interrupt
    00000690                        252 00108$:
                                    253 ;src/made.c:165: if (++m_int_idx == 6)
    00000690 FD 21 56 93      [14]  254 	ld	iy, #_m_int_idx
    00000694 FD 34 00         [23]  255 	inc	0 (iy)
    00000697 3A 56 93         [13]  256 	ld	a, (_m_int_idx+0)
    0000069A D6 06            [ 7]  257 	sub	a, #0x06
    0000069C C0               [11]  258 	ret	NZ
                                    259 ;src/made.c:166: m_int_idx = 0;
    0000069D FD 36 00 00      [19]  260 	ld	0 (iy), #0x00
    000006A1 C9               [10]  261 	ret
    000006A2                        262 00123$:
                                    263 ;src/made.c:168: } else if (line == MADE_TEXT_TOP)
    000006A2 FE 28            [ 7]  264 	cp	a, #0x28
    000006A4 20 09            [12]  265 	jr	NZ, 00120$
                                    266 ;src/made.c:169: cpct_asicSetPalette(m_pal_text, 4);
    000006A6 11 04 00         [10]  267 	ld	de, #0x0004
    000006A9 21 E0 05         [10]  268 	ld	hl, #_m_pal_text
    000006AC C3 0D 2D         [10]  269 	jp	_cpct_asicSetPalette
    000006AF                        270 00120$:
                                    271 ;src/made.c:170: else if (line == MADE_CPC_TELERA)
    000006AF FE 38            [ 7]  272 	cp	a, #0x38
    000006B1 20 09            [12]  273 	jr	NZ, 00117$
                                    274 ;src/made.c:171: cpct_asicSetPalette(m_pal_usual, 4);
    000006B3 11 04 00         [10]  275 	ld	de, #0x0004
    000006B6 21 D8 05         [10]  276 	ld	hl, #_m_pal_usual
    000006B9 C3 0D 2D         [10]  277 	jp	_cpct_asicSetPalette
    000006BC                        278 00117$:
                                    279 ;src/made.c:172: else if (line == MADE_TEXT_BOTTOM)
    000006BC FE 76            [ 7]  280 	cp	a, #0x76
    000006BE 20 09            [12]  281 	jr	NZ, 00114$
                                    282 ;src/made.c:173: cpct_asicSetPalette(m_pal_text, 4);
    000006C0 11 04 00         [10]  283 	ld	de, #0x0004
    000006C3 21 E0 05         [10]  284 	ld	hl, #_m_pal_text
    000006C6 C3 0D 2D         [10]  285 	jp	_cpct_asicSetPalette
    000006C9                        286 00114$:
                                    287 ;src/made.c:174: else if (line == MADE_GX4000)
    000006C9 D6 86            [ 7]  288 	sub	a, #0x86
    000006CB C0               [11]  289 	ret	NZ
                                    290 ;src/made.c:175: cpct_asicSetPalette(m_pal_logo, 4);
    000006CC 11 04 00         [10]  291 	ld	de, #0x0004
    000006CF 21 E8 05         [10]  292 	ld	hl, #_m_pal_logo
                                    293 ;src/made.c:176: }
    000006D2 C3 0D 2D         [10]  294 	jp	_cpct_asicSetPalette
                                    295 ;src/made.c:178: static void m_remove_interrupt(void) {
                                    296 ;	---------------------------------
                                    297 ; Function m_remove_interrupt
                                    298 ; ---------------------------------
    000006D5                        299 _m_remove_interrupt:
                                    300 ;src/made.c:180: cpct_asicRemoveLinesInterruptHandler();
                                    301 ;src/made.c:181: }
    000006D5 C3 3A 30         [10]  302 	jp	_cpct_asicRemoveLinesInterruptHandler
                                    303 	.area _CODE
                                    304 	.area _INITIALIZER
    00009386                        305 __xinit__m_int_idx:
    00009386 00                     306 	.db #0x00	; 0
    00009387                        307 __xinit__m_frame_c:
    00009387 00                     308 	.db #0x00	; 0
                                    309 	.area _CABS (ABS)
