                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module presents
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _v_clear_screen
                                     12 	.globl _v_blank_screen_mode_1
                                     13 	.globl _u_wait_for_duration_or_kp
                                     14 	.globl _u_reset_clock
                                     15 	.globl _u_clock_interrupt
                                     16 	.globl _d_gfx_decompress_to_screen
                                     17 	.globl _d_load
                                     18 	.globl _a_page_disconnect_safe
                                     19 	.globl _a_page_connect_safe
                                     20 	.globl _a_clear_sprites
                                     21 	.globl _cpct_asicRemoveLinesInterruptHandler
                                     22 	.globl _cpct_asicSetLinesInterruptHandler
                                     23 	.globl _cpct_asicSetPalette
                                     24 	.globl _cpct_asicSetPalColour
                                     25 	.globl _cpct_asicSetBorder
                                     26 	.globl _cpct_waitVSYNC
                                     27 	.globl _cpct_scanKeyboard_if
                                     28 	.globl _p_start
                                     29 	.globl _p_stop
                                     30 ;--------------------------------------------------------
                                     31 ; special function registers
                                     32 ;--------------------------------------------------------
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area _DATA
    00008401                         37 _p_interrupt_bg_pulse_tick_30000_274:
    00008401                         38 	.ds 1
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area _INITIALIZED
    00009359                         43 _p_int_idx:
    00009359                         44 	.ds 1
    0000935A                         45 _p_frame_c:
    0000935A                         46 	.ds 1
    0000935B                         47 _p_raster_phase:
    0000935B                         48 	.ds 1
    0000935C                         49 _p_raster_tick:
    0000935C                         50 	.ds 1
    0000935D                         51 _p_star_pulse:
    0000935D                         52 	.ds 1
    0000935E                         53 _p_star_pulse_dir:
    0000935E                         54 	.ds 1
                                     55 ;--------------------------------------------------------
                                     56 ; absolute external ram data
                                     57 ;--------------------------------------------------------
                                     58 	.area _DABS (ABS)
                                     59 ;--------------------------------------------------------
                                     60 ; global & static initialisations
                                     61 ;--------------------------------------------------------
                                     62 	.area _HOME
                                     63 	.area _GSINIT
                                     64 	.area _GSFINAL
                                     65 	.area _GSINIT
                                     66 ;src/presents.c:174: static u8 bg_pulse_tick = 0;
    00009372 AF               [ 4]   67 	xor	a, a
    00009373 32 01 84         [13]   68 	ld	(_p_interrupt_bg_pulse_tick_30000_274+0), a
                                     69 ;--------------------------------------------------------
                                     70 ; Home
                                     71 ;--------------------------------------------------------
                                     72 	.area _HOME
                                     73 	.area _HOME
                                     74 ;--------------------------------------------------------
                                     75 ; code
                                     76 ;--------------------------------------------------------
                                     77 	.area _CODE
                                     78 ;src/presents.c:62: void p_start(void) {
                                     79 ;	---------------------------------
                                     80 ; Function p_start
                                     81 ; ---------------------------------
    000006D8                         82 _p_start::
                                     83 ;src/presents.c:65: v_blank_screen_mode_1();
    000006D8 CD 47 16         [17]   84 	call	_v_blank_screen_mode_1
                                     85 ;src/presents.c:66: v_clear_screen();
    000006DB CD 61 16         [17]   86 	call	_v_clear_screen
                                     87 ;src/presents.c:69: p_draw_bg();
    000006DE CD 34 07         [17]   88 	call	_p_draw_bg
                                     89 ;src/presents.c:72: p_reset_timers();
    000006E1 CD 2C 07         [17]   90 	call	_p_reset_timers
                                     91 ;src/presents.c:73: p_add_interrupt();
    000006E4 CD 64 07         [17]   92 	call	_p_add_interrupt
                                     93 ;src/presents.c:74: cpct_asicSetPalette(p_pal_usual, 4);
    000006E7 11 04 00         [10]   94 	ld	de, #0x0004
    000006EA 21 13 07         [10]   95 	ld	hl, #_p_pal_usual
    000006ED CD 0D 2D         [17]   96 	call	_cpct_asicSetPalette
                                     97 ;src/presents.c:75: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
    000006F0 21 FF 0F         [10]   98 	ld	hl, #0x0fff
    000006F3 CD FA 2D         [17]   99 	call	_cpct_asicSetBorder
                                    100 ;src/presents.c:77: g_clock_on = true;
    000006F6 21 4F 93         [10]  101 	ld	hl, #_g_clock_on
    000006F9 36 01            [10]  102 	ld	(hl), #0x01
                                    103 ;src/presents.c:78: u_reset_clock();
    000006FB CD AF 15         [17]  104 	call	_u_reset_clock
                                    105 ;src/presents.c:79: u_wait_for_duration_or_kp(25);
    000006FE 21 19 00         [10]  106 	ld	hl, #0x0019
    00000701 CD E5 15         [17]  107 	call	_u_wait_for_duration_or_kp
                                    108 ;src/presents.c:80: g_clock_on = false;
    00000704 AF               [ 4]  109 	xor	a, a
    00000705 32 4F 93         [13]  110 	ld	(_g_clock_on+0), a
                                    111 ;src/presents.c:83: a_clear_sprites();
                                    112 ;src/presents.c:84: }
    00000708 C3 A9 11         [10]  113 	jp	_a_clear_sprites
    0000070B                        114 _p_pal_blank:
    0000070B FF 0F                  115 	.dw #0x0fff
    0000070D FF 0F                  116 	.dw #0x0fff
    0000070F FF 0F                  117 	.dw #0x0fff
    00000711 FF 0F                  118 	.dw #0x0fff
    00000713                        119 _p_pal_usual:
    00000713 FF 0F                  120 	.dw #0x0fff
    00000715 1D 05                  121 	.dw #0x051d
    00000717 24 03                  122 	.dw #0x0324
    00000719 68 07                  123 	.dw #0x0768
    0000071B                        124 _p_pal_white:
    0000071B FF 0F                  125 	.dw #0x0fff
    0000071D FF 0F                  126 	.dw #0x0fff
    0000071F FF 0F                  127 	.dw #0x0fff
    00000721 FF 0F                  128 	.dw #0x0fff
                                    129 ;src/presents.c:87: void p_stop(void) {
                                    130 ;	---------------------------------
                                    131 ; Function p_stop
                                    132 ; ---------------------------------
    00000723                        133 _p_stop::
                                    134 ;src/presents.c:89: p_remove_interrupt();
    00000723 CD B1 08         [17]  135 	call	_p_remove_interrupt
                                    136 ;src/presents.c:91: v_blank_screen_mode_1();
    00000726 CD 47 16         [17]  137 	call	_v_blank_screen_mode_1
                                    138 ;src/presents.c:92: v_clear_screen();
                                    139 ;src/presents.c:93: }
    00000729 C3 61 16         [10]  140 	jp	_v_clear_screen
                                    141 ;src/presents.c:96: static void p_reset_timers(void) {
                                    142 ;	---------------------------------
                                    143 ; Function p_reset_timers
                                    144 ; ---------------------------------
    0000072C                        145 _p_reset_timers:
                                    146 ;src/presents.c:98: p_int_idx = 0;
                                    147 ;src/presents.c:99: p_frame_c = 0;
    0000072C AF               [ 4]  148 	xor	a, a
    0000072D 32 59 93         [13]  149 	ld	(_p_int_idx+0), a
    00000730 32 5A 93         [13]  150 	ld	(_p_frame_c+0), a
                                    151 ;src/presents.c:100: }
    00000733 C9               [10]  152 	ret
                                    153 ;src/presents.c:103: static void p_draw_bg(void) {
                                    154 ;	---------------------------------
                                    155 ; Function p_draw_bg
                                    156 ; ---------------------------------
    00000734                        157 _p_draw_bg:
                                    158 ;src/presents.c:105: if (HW_HAS_128K(g_hw))
    00000734 3A 00 84         [13]  159 	ld	a, (_g_hw)
    00000737 E6 03            [ 7]  160 	and	a, #0x03
    00000739 D6 01            [ 7]  161 	sub	a, #0x01
    0000073B 38 06            [12]  162 	jr	C, 00102$
                                    163 ;src/presents.c:106: d_gfx_decompress_to_screen(GFX_PRESENTS);
    0000073D AF               [ 4]  164 	xor	a, a
    0000073E CD D0 14         [17]  165 	call	_d_gfx_decompress_to_screen
    00000741 18 0F            [12]  166 	jr	00103$
    00000743                        167 00102$:
                                    168 ;src/presents.c:108: a_page_disconnect_safe();
    00000743 CD B4 12         [17]  169 	call	_a_page_disconnect_safe
                                    170 ;src/presents.c:109: d_load("PRESENTSSCR", VIDEO_MEM_START);
    00000746 11 00 C0         [10]  171 	ld	de, #0xc000
    00000749 21 58 07         [10]  172 	ld	hl, #___str_0
    0000074C CD 7C 14         [17]  173 	call	_d_load
                                    174 ;src/presents.c:110: a_page_connect_safe();
    0000074F CD A5 12         [17]  175 	call	_a_page_connect_safe
    00000752                        176 00103$:
                                    177 ;src/presents.c:112: cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
    00000752 21 FF 0F         [10]  178 	ld	hl, #0x0fff
                                    179 ;src/presents.c:113: }
    00000755 C3 FA 2D         [10]  180 	jp	_cpct_asicSetBorder
    00000758                        181 ___str_0:
    00000758 50 52 45 53 45 4E 54   182 	.ascii "PRESENTSSCR"
             53 53 43 52
    00000763 00                     183 	.db 0x00
                                    184 ;src/presents.c:115: static void p_add_interrupt(void) {
                                    185 ;	---------------------------------
                                    186 ; Function p_add_interrupt
                                    187 ; ---------------------------------
    00000764                        188 _p_add_interrupt:
                                    189 ;src/presents.c:130: cpct_waitVSYNC();
    00000764 CD 67 2F         [17]  190 	call	_cpct_waitVSYNC
                                    191 ;src/presents.c:132: cpct_asicSetLinesInterruptHandler(p_interrupt, lines, sizeof(lines));
    00000767 21 0A 00         [10]  192 	ld	hl, #0x000a
    0000076A E5               [11]  193 	push	hl
    0000076B 11 75 07         [10]  194 	ld	de, #_p_add_interrupt_lines_10000_268
    0000076E 21 7F 07         [10]  195 	ld	hl, #_p_interrupt
    00000771 CD C5 2F         [17]  196 	call	_cpct_asicSetLinesInterruptHandler
                                    197 ;src/presents.c:133: }
    00000774 C9               [10]  198 	ret
    00000775                        199 _p_add_interrupt_lines_10000_268:
    00000775 00                     200 	.db #0x00	; 0
    00000776 01                     201 	.db #0x01	; 1
    00000777 51                     202 	.db #0x51	; 81	'Q'
    00000778 55                     203 	.db #0x55	; 85	'U'
    00000779 59                     204 	.db #0x59	; 89	'Y'
    0000077A 5D                     205 	.db #0x5d	; 93
    0000077B 61                     206 	.db #0x61	; 97	'a'
    0000077C 65                     207 	.db #0x65	; 101	'e'
    0000077D 69                     208 	.db #0x69	; 105	'i'
    0000077E 6D                     209 	.db #0x6d	; 109	'm'
                                    210 ;src/presents.c:135: static void p_interrupt(u8 line) __z88dk_fastcall {
                                    211 ;	---------------------------------
                                    212 ; Function p_interrupt
                                    213 ; ---------------------------------
    0000077F                        214 _p_interrupt:
    0000077F 4D               [ 4]  215 	ld	c, l
                                    216 ;src/presents.c:151: if (line == 0) {
    00000780 79               [ 4]  217 	ld	a, c
    00000781 B7               [ 4]  218 	or	a, a
    00000782 C2 19 08         [10]  219 	jp	NZ, 00137$
                                    220 ;src/presents.c:153: if (p_int_idx == 0) {
    00000785 3A 59 93         [13]  221 	ld	a, (_p_int_idx+0)
    00000788 B7               [ 4]  222 	or	a, a
    00000789 20 12            [12]  223 	jr	NZ, 00104$
                                    224 ;src/presents.c:154: if (++p_frame_c == FC_MAX)
    0000078B FD 21 5A 93      [14]  225 	ld	iy, #_p_frame_c
    0000078F FD 34 00         [23]  226 	inc	0 (iy)
    00000792 3A 5A 93         [13]  227 	ld	a, (_p_frame_c+0)
    00000795 D6 32            [ 7]  228 	sub	a, #0x32
    00000797 20 04            [12]  229 	jr	NZ, 00104$
                                    230 ;src/presents.c:155: p_frame_c = 0;
    00000799 FD 36 00 00      [19]  231 	ld	0 (iy), #0x00
    0000079D                        232 00104$:
                                    233 ;src/presents.c:158: if (p_int_idx == 1)
    0000079D 3A 59 93         [13]  234 	ld	a, (_p_int_idx+0)
    000007A0 3D               [ 4]  235 	dec	a
    000007A1 20 03            [12]  236 	jr	NZ, 00106$
                                    237 ;src/presents.c:159: cpct_scanKeyboard_if();
    000007A3 CD 96 2E         [17]  238 	call	_cpct_scanKeyboard_if
    000007A6                        239 00106$:
                                    240 ;src/presents.c:161: if (p_int_idx == 2)
    000007A6 3A 59 93         [13]  241 	ld	a, (_p_int_idx+0)
    000007A9 D6 02            [ 7]  242 	sub	a, #0x02
    000007AB 20 03            [12]  243 	jr	NZ, 00108$
                                    244 ;src/presents.c:162: u_clock_interrupt();
    000007AD CD 71 15         [17]  245 	call	_u_clock_interrupt
    000007B0                        246 00108$:
                                    247 ;src/presents.c:164: if (p_int_idx == 3) {
    000007B0 3A 59 93         [13]  248 	ld	a, (_p_int_idx+0)
    000007B3 D6 03            [ 7]  249 	sub	a, #0x03
    000007B5 20 12            [12]  250 	jr	NZ, 00112$
                                    251 ;src/presents.c:166: p_raster_phase++;
    000007B7 FD 21 5B 93      [14]  252 	ld	iy, #_p_raster_phase
    000007BB FD 34 00         [23]  253 	inc	0 (iy)
                                    254 ;src/presents.c:167: if (p_raster_phase >= RASTER_COLOUR_COUNT)
    000007BE 3A 5B 93         [13]  255 	ld	a, (_p_raster_phase+0)
    000007C1 D6 15            [ 7]  256 	sub	a, #0x15
    000007C3 38 04            [12]  257 	jr	C, 00112$
                                    258 ;src/presents.c:168: p_raster_phase = 0;
    000007C5 FD 36 00 00      [19]  259 	ld	0 (iy), #0x00
    000007C9                        260 00112$:
                                    261 ;src/presents.c:171: if (p_int_idx == 4) {
    000007C9 3A 59 93         [13]  262 	ld	a, (_p_int_idx+0)
    000007CC D6 04            [ 7]  263 	sub	a, #0x04
    000007CE 20 37            [12]  264 	jr	NZ, 00121$
                                    265 ;src/presents.c:175: if (++bg_pulse_tick >= BG_PULSE_SPEED) {
    000007D0 FD 21 01 84      [14]  266 	ld	iy, #_p_interrupt_bg_pulse_tick_30000_274
    000007D4 FD 34 00         [23]  267 	inc	0 (iy)
    000007D7 3A 01 84         [13]  268 	ld	a, (_p_interrupt_bg_pulse_tick_30000_274+0)
    000007DA D6 02            [ 7]  269 	sub	a, #0x02
    000007DC 38 29            [12]  270 	jr	C, 00121$
                                    271 ;src/presents.c:176: bg_pulse_tick = 0;
    000007DE FD 36 00 00      [19]  272 	ld	0 (iy), #0x00
                                    273 ;src/presents.c:178: p_star_pulse += p_star_pulse_dir;
    000007E2 3A 5D 93         [13]  274 	ld	a, (_p_star_pulse)
    000007E5 21 5E 93         [10]  275 	ld	hl, #_p_star_pulse_dir
    000007E8 86               [ 7]  276 	add	a, (hl)
                                    277 ;src/presents.c:180: if (p_star_pulse >= BG_PULSE_MAX) {
    000007E9 32 5D 93         [13]  278 	ld	(_p_star_pulse+0), a
    000007EC D6 0C            [ 7]  279 	sub	a, #0x0c
    000007EE 38 0C            [12]  280 	jr	C, 00116$
                                    281 ;src/presents.c:181: p_star_pulse = BG_PULSE_MAX;
    000007F0 21 5D 93         [10]  282 	ld	hl, #_p_star_pulse
    000007F3 36 0C            [10]  283 	ld	(hl), #0x0c
                                    284 ;src/presents.c:182: p_star_pulse_dir = -1;
    000007F5 21 5E 93         [10]  285 	ld	hl, #_p_star_pulse_dir
    000007F8 36 FF            [10]  286 	ld	(hl), #0xff
    000007FA 18 0B            [12]  287 	jr	00121$
    000007FC                        288 00116$:
                                    289 ;src/presents.c:183: } else if (p_star_pulse == 0) {
    000007FC 3A 5D 93         [13]  290 	ld	a, (_p_star_pulse+0)
    000007FF B7               [ 4]  291 	or	a, a
    00000800 20 05            [12]  292 	jr	NZ, 00121$
                                    293 ;src/presents.c:184: p_star_pulse_dir = 1;
    00000802 21 5E 93         [10]  294 	ld	hl, #_p_star_pulse_dir
    00000805 36 01            [10]  295 	ld	(hl), #0x01
    00000807                        296 00121$:
                                    297 ;src/presents.c:189: if (++p_int_idx == 6)
    00000807 FD 21 59 93      [14]  298 	ld	iy, #_p_int_idx
    0000080B FD 34 00         [23]  299 	inc	0 (iy)
    0000080E 3A 59 93         [13]  300 	ld	a, (_p_int_idx+0)
    00000811 D6 06            [ 7]  301 	sub	a, #0x06
    00000813 C0               [11]  302 	ret	NZ
                                    303 ;src/presents.c:190: p_int_idx = 0;
    00000814 FD 36 00 00      [19]  304 	ld	0 (iy), #0x00
    00000818 C9               [10]  305 	ret
    00000819                        306 00137$:
                                    307 ;src/presents.c:192: } else if (line == RASTER_RESET_LINE) {
    00000819 79               [ 4]  308 	ld	a, c
    0000081A 3D               [ 4]  309 	dec	a
    0000081B 20 21            [12]  310 	jr	NZ, 00134$
                                    311 ;src/presents.c:193: cpct_asicSetPalColour(0, p_pal_usual[0]);
    0000081D ED 5B 13 07      [20]  312 	ld	de, (#_p_pal_usual + 0)
    00000821 21 00 00         [10]  313 	ld	hl, #0x0000
    00000824 CD 2A 2D         [17]  314 	call	_cpct_asicSetPalColour
                                    315 ;src/presents.c:195: cpctm_asicColor(p_star_pulse, 0, p_star_pulse));
    00000827 3A 5D 93         [13]  316 	ld	a, (_p_star_pulse)
    0000082A E6 0F            [ 7]  317 	and	a, #0x0f
    0000082C 5F               [ 4]  318 	ld	e, a
    0000082D 16 00            [ 7]  319 	ld	d, #0x00
    0000082F 6B               [ 4]  320 	ld	l, e
    00000830 62               [ 4]  321 	ld	h, d
    00000831 29               [11]  322 	add	hl, hl
    00000832 29               [11]  323 	add	hl, hl
    00000833 29               [11]  324 	add	hl, hl
    00000834 29               [11]  325 	add	hl, hl
    00000835 7D               [ 4]  326 	ld	a, l
    00000836 B3               [ 4]  327 	or	a, e
                                    328 ;src/presents.c:194: cpct_asicSetPalColour(1, /* Star colour */
    00000837 5F               [ 4]  329 	ld	e, a
    00000838 21 01 00         [10]  330 	ld	hl, #0x0001
    0000083B C3 2A 2D         [10]  331 	jp	_cpct_asicSetPalColour
    0000083E                        332 00134$:
                                    333 ;src/presents.c:197: } else if (line == TEXT_RASTER_Y_END) {
    0000083E 79               [ 4]  334 	ld	a, c
    0000083F D6 6D            [ 7]  335 	sub	a, #0x6d
    00000841 20 0A            [12]  336 	jr	NZ, 00131$
                                    337 ;src/presents.c:199: cpct_asicSetPalColour(2, p_pal_usual[2]);
    00000843 ED 5B 17 07      [20]  338 	ld	de, (#(_p_pal_usual + 4) + 0)
    00000847 21 02 00         [10]  339 	ld	hl, #0x0002
    0000084A C3 2A 2D         [10]  340 	jp	_cpct_asicSetPalColour
    0000084D                        341 00131$:
                                    342 ;src/presents.c:200: } else if (line < TEXT_RASTER_Y_START || line > TEXT_RASTER_Y_END) {
    0000084D 79               [ 4]  343 	ld	a, c
    0000084E D6 51            [ 7]  344 	sub	a, #0x51
    00000850 D8               [11]  345 	ret	C
    00000851 3E 6D            [ 7]  346 	ld	a, #0x6d
    00000853 91               [ 4]  347 	sub	a, c
                                    348 ;src/presents.c:201: return;
    00000854 D8               [11]  349 	ret	C
                                    350 ;src/presents.c:205: u8 band = (line - TEXT_RASTER_Y_START) >> 2;
    00000855 79               [ 4]  351 	ld	a, c
    00000856 06 00            [ 7]  352 	ld	b, #0x00
    00000858 C6 AF            [ 7]  353 	add	a, #0xaf
    0000085A 4F               [ 4]  354 	ld	c, a
    0000085B 78               [ 4]  355 	ld	a, b
    0000085C CE FF            [ 7]  356 	adc	a, #0xff
    0000085E 47               [ 4]  357 	ld	b, a
    0000085F CB 28            [ 8]  358 	sra	b
    00000861 CB 19            [ 8]  359 	rr	c
    00000863 CB 28            [ 8]  360 	sra	b
    00000865 CB 19            [ 8]  361 	rr	c
    00000867 79               [ 4]  362 	ld	a, c
                                    363 ;src/presents.c:208: u8 idx = band + RASTER_COLOUR_COUNT - p_raster_phase;
    00000868 C6 15            [ 7]  364 	add	a, #0x15
    0000086A 21 5B 93         [10]  365 	ld	hl, #_p_raster_phase
    0000086D 96               [ 7]  366 	sub	a, (hl)
                                    367 ;src/presents.c:209: if (idx >= RASTER_COLOUR_COUNT)
    0000086E 6F               [ 4]  368 	ld	l, a
    0000086F D6 15            [ 7]  369 	sub	a, #0x15
    00000871 38 04            [12]  370 	jr	C, 00125$
                                    371 ;src/presents.c:210: idx -= RASTER_COLOUR_COUNT;
    00000873 7D               [ 4]  372 	ld	a, l
    00000874 C6 EB            [ 7]  373 	add	a, #0xeb
    00000876 6F               [ 4]  374 	ld	l, a
    00000877                        375 00125$:
                                    376 ;src/presents.c:215: cpct_asicSetPalColour(2, p_raster_colours[idx]);
    00000877 01 87 08         [10]  377 	ld	bc, #_p_interrupt_p_raster_colours_10000_270+0
    0000087A 26 00            [ 7]  378 	ld	h, #0x00
    0000087C 29               [11]  379 	add	hl, hl
    0000087D 09               [11]  380 	add	hl, bc
    0000087E 5E               [ 7]  381 	ld	e, (hl)
    0000087F 23               [ 6]  382 	inc	hl
    00000880 56               [ 7]  383 	ld	d, (hl)
    00000881 21 02 00         [10]  384 	ld	hl, #0x0002
                                    385 ;src/presents.c:217: }
    00000884 C3 2A 2D         [10]  386 	jp	_cpct_asicSetPalColour
    00000887                        387 _p_interrupt_p_raster_colours_10000_270:
    00000887 E6 00                  388 	.dw #0x00e6
    00000889 F4 00                  389 	.dw #0x00f4
    0000088B F2 00                  390 	.dw #0x00f2
    0000088D F0 01                  391 	.dw #0x01f0
    0000088F F0 03                  392 	.dw #0x03f0
    00000891 F0 05                  393 	.dw #0x05f0
    00000893 F0 07                  394 	.dw #0x07f0
    00000895 F0 09                  395 	.dw #0x09f0
    00000897 F0 0B                  396 	.dw #0x0bf0
    00000899 E0 0E                  397 	.dw #0x0ee0
    0000089B B0 0E                  398 	.dw #0x0eb0
    0000089D 80 0E                  399 	.dw #0x0e80
    0000089F 42 0D                  400 	.dw #0x0d42
    000008A1 23 0C                  401 	.dw #0x0c23
    000008A3 24 0B                  402 	.dw #0x0b24
    000008A5 26 09                  403 	.dw #0x0926
    000008A7 38 07                  404 	.dw #0x0738
    000008A9 58 05                  405 	.dw #0x0558
    000008AB 77 03                  406 	.dw #0x0377
    000008AD 96 02                  407 	.dw #0x0296
    000008AF C6 01                  408 	.dw #0x01c6
                                    409 ;src/presents.c:219: static void p_remove_interrupt(void) {
                                    410 ;	---------------------------------
                                    411 ; Function p_remove_interrupt
                                    412 ; ---------------------------------
    000008B1                        413 _p_remove_interrupt:
                                    414 ;src/presents.c:221: cpct_asicRemoveLinesInterruptHandler();
                                    415 ;src/presents.c:222: }
    000008B1 C3 3A 30         [10]  416 	jp	_cpct_asicRemoveLinesInterruptHandler
                                    417 	.area _CODE
                                    418 	.area _INITIALIZER
    00009389                        419 __xinit__p_int_idx:
    00009389 00                     420 	.db #0x00	; 0
    0000938A                        421 __xinit__p_frame_c:
    0000938A 00                     422 	.db #0x00	; 0
    0000938B                        423 __xinit__p_raster_phase:
    0000938B 00                     424 	.db #0x00	; 0
    0000938C                        425 __xinit__p_raster_tick:
    0000938C 00                     426 	.db #0x00	; 0
    0000938D                        427 __xinit__p_star_pulse:
    0000938D 00                     428 	.db #0x00	; 0
    0000938E                        429 __xinit__p_star_pulse_dir:
    0000938E 01                     430 	.db #0x01	;  1
                                    431 	.area _CABS (ABS)
