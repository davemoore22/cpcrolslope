                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module utilities
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cpct_waitVSYNC
                                     12 	.globl _cpct_isAnyKeyPressed_f
                                     13 	.globl _cpct_isAnyKeyPressed
                                     14 	.globl _cpct_scanKeyboard_f
                                     15 	.globl _g_clock
                                     16 	.globl _g_clock_on
                                     17 	.globl _u_clock_interrupt
                                     18 	.globl _u_reset_clock
                                     19 	.globl _u_clock_tick
                                     20 	.globl _u_clear_input
                                     21 	.globl _u_wait_for_duration_or_kp
                                     22 ;--------------------------------------------------------
                                     23 ; special function registers
                                     24 ;--------------------------------------------------------
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area _DATA
    0000934F                         29 _g_clock_on::
    0000934F                         30 	.ds 1
    00009350                         31 _u_clock_interrupt_count_10000_259:
    00009350                         32 	.ds 1
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area _INITIALIZED
    0000936A                         37 _g_clock::
    0000936A                         38 	.ds 4
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area _DABS (ABS)
                                     43 ;--------------------------------------------------------
                                     44 ; global & static initialisations
                                     45 ;--------------------------------------------------------
                                     46 	.area _HOME
                                     47 	.area _GSINIT
                                     48 	.area _GSFINAL
                                     49 	.area _GSINIT
                                     50 ;src/lib/utilities.c:31: static u8 count = 0;
    0000937D AF               [ 4]   51 	xor	a, a
    0000937E 32 50 93         [13]   52 	ld	(_u_clock_interrupt_count_10000_259+0), a
                                     53 ;--------------------------------------------------------
                                     54 ; Home
                                     55 ;--------------------------------------------------------
                                     56 	.area _HOME
                                     57 	.area _HOME
                                     58 ;--------------------------------------------------------
                                     59 ; code
                                     60 ;--------------------------------------------------------
                                     61 	.area _CODE
                                     62 ;src/lib/utilities.c:29: void u_clock_interrupt(void) {
                                     63 ;	---------------------------------
                                     64 ; Function u_clock_interrupt
                                     65 ; ---------------------------------
    00001571                         66 _u_clock_interrupt::
                                     67 ;src/lib/utilities.c:34: if (g_clock_on) {
    00001571 21 4F 93         [10]   68 	ld	hl, #_g_clock_on
    00001574 CB 46            [12]   69 	bit	0, (hl)
    00001576 C8               [11]   70 	ret	Z
                                     71 ;src/lib/utilities.c:41: if (++count == 6)
    00001577 FD 21 50 93      [14]   72 	ld	iy, #_u_clock_interrupt_count_10000_259
    0000157B FD 34 00         [23]   73 	inc	0 (iy)
    0000157E 3A 50 93         [13]   74 	ld	a, (_u_clock_interrupt_count_10000_259+0)
    00001581 D6 06            [ 7]   75 	sub	a, #0x06
    00001583 20 04            [12]   76 	jr	NZ, 00102$
                                     77 ;src/lib/utilities.c:42: count = 0;
    00001585 FD 36 00 00      [19]   78 	ld	0 (iy), #0x00
    00001589                         79 00102$:
                                     80 ;src/lib/utilities.c:43: if (count == 5) {
    00001589 3A 50 93         [13]   81 	ld	a, (_u_clock_interrupt_count_10000_259+0)
    0000158C D6 05            [ 7]   82 	sub	a, #0x05
    0000158E C0               [11]   83 	ret	NZ
                                     84 ;src/lib/utilities.c:44: g_clock.ms += 20;
    0000158F 2A 6A 93         [16]   85 	ld	hl, (#_g_clock + 0)
    00001592 01 14 00         [10]   86 	ld	bc, #0x0014
    00001595 09               [11]   87 	add	hl, bc
    00001596 22 6A 93         [16]   88 	ld	(_g_clock), hl
                                     89 ;src/lib/utilities.c:45: if (g_clock.ms == 1000) {
    00001599 7D               [ 4]   90 	ld	a, l
    0000159A D6 E8            [ 7]   91 	sub	a, #0xe8
    0000159C C0               [11]   92 	ret	NZ
    0000159D 7C               [ 4]   93 	ld	a, h
    0000159E D6 03            [ 7]   94 	sub	a, #0x03
    000015A0 C0               [11]   95 	ret	NZ
                                     96 ;src/lib/utilities.c:46: ++g_clock.s;
    000015A1 2A 6C 93         [16]   97 	ld	hl, (#(_g_clock + 2) + 0)
    000015A4 23               [ 6]   98 	inc	hl
    000015A5 22 6C 93         [16]   99 	ld	((_g_clock + 2)), hl
                                    100 ;src/lib/utilities.c:47: g_clock.ms = 0;
    000015A8 21 00 00         [10]  101 	ld	hl, #0x0000
    000015AB 22 6A 93         [16]  102 	ld	(_g_clock), hl
                                    103 ;src/lib/utilities.c:57: }
    000015AE C9               [10]  104 	ret
                                    105 ;src/lib/utilities.c:60: void u_reset_clock(void) {
                                    106 ;	---------------------------------
                                    107 ; Function u_reset_clock
                                    108 ; ---------------------------------
    000015AF                        109 _u_reset_clock::
                                    110 ;src/lib/utilities.c:62: g_clock.ms = g_clock.s = 0;
    000015AF 21 00 00         [10]  111 	ld	hl, #0x0000
    000015B2 22 6C 93         [16]  112 	ld	((_g_clock + 2)), hl
    000015B5 22 6A 93         [16]  113 	ld	(_g_clock), hl
                                    114 ;src/lib/utilities.c:63: }
    000015B8 C9               [10]  115 	ret
                                    116 ;src/lib/utilities.c:65: void u_clock_tick(void) {
                                    117 ;	---------------------------------
                                    118 ; Function u_clock_tick
                                    119 ; ---------------------------------
    000015B9                        120 _u_clock_tick::
                                    121 ;src/lib/utilities.c:67: g_clock.ms += 20;
    000015B9 2A 6A 93         [16]  122 	ld	hl, (#_g_clock + 0)
    000015BC 01 14 00         [10]  123 	ld	bc, #0x0014
    000015BF 09               [11]  124 	add	hl, bc
    000015C0 22 6A 93         [16]  125 	ld	(_g_clock), hl
                                    126 ;src/lib/utilities.c:68: if (g_clock.ms >= 1000) {
    000015C3 11 E8 03         [10]  127 	ld	de, #0x03e8
    000015C6 BF               [ 4]  128 	cp	a, a
    000015C7 ED 52            [15]  129 	sbc	hl, de
    000015C9 D8               [11]  130 	ret	C
                                    131 ;src/lib/utilities.c:69: g_clock.ms = 0;
    000015CA 21 00 00         [10]  132 	ld	hl, #0x0000
    000015CD 22 6A 93         [16]  133 	ld	(_g_clock), hl
                                    134 ;src/lib/utilities.c:70: ++g_clock.s;
    000015D0 2A 6C 93         [16]  135 	ld	hl, (#(_g_clock + 2) + 0)
    000015D3 23               [ 6]  136 	inc	hl
    000015D4 22 6C 93         [16]  137 	ld	((_g_clock + 2)), hl
                                    138 ;src/lib/utilities.c:72: }
    000015D7 C9               [10]  139 	ret
                                    140 ;src/lib/utilities.c:75: void u_clear_input(void) {
                                    141 ;	---------------------------------
                                    142 ; Function u_clear_input
                                    143 ; ---------------------------------
    000015D8                        144 _u_clear_input::
                                    145 ;src/lib/utilities.c:77: cpct_scanKeyboard_f();
    000015D8 CD 97 2C         [17]  146 	call	_cpct_scanKeyboard_f
                                    147 ;src/lib/utilities.c:78: while (cpct_isAnyKeyPressed_f())
    000015DB                        148 00101$:
    000015DB CD FE 2E         [17]  149 	call	_cpct_isAnyKeyPressed_f
    000015DE B7               [ 4]  150 	or	a, a
    000015DF C8               [11]  151 	ret	Z
                                    152 ;src/lib/utilities.c:79: cpct_scanKeyboard_f();
    000015E0 CD 97 2C         [17]  153 	call	_cpct_scanKeyboard_f
                                    154 ;src/lib/utilities.c:80: }
    000015E3 18 F6            [12]  155 	jr	00101$
                                    156 ;src/lib/utilities.c:82: void u_wait_for_duration_or_kp(u16 duration) {
                                    157 ;	---------------------------------
                                    158 ; Function u_wait_for_duration_or_kp
                                    159 ; ---------------------------------
    000015E5                        160 _u_wait_for_duration_or_kp::
    000015E5 DD E5            [15]  161 	push	ix
    000015E7 DD 21 00 00      [14]  162 	ld	ix,#0
    000015EB DD 39            [15]  163 	add	ix,sp
    000015ED 3B               [ 6]  164 	dec	sp
    000015EE EB               [ 4]  165 	ex	de, hl
                                    166 ;src/lib/utilities.c:84: g_clock_on = true;
    000015EF 21 4F 93         [10]  167 	ld	hl, #_g_clock_on
    000015F2 36 01            [10]  168 	ld	(hl), #0x01
                                    169 ;src/lib/utilities.c:86: u_clear_input();
    000015F4 D5               [11]  170 	push	de
    000015F5 CD D8 15         [17]  171 	call	_u_clear_input
    000015F8 D1               [10]  172 	pop	de
                                    173 ;src/lib/utilities.c:88: bool kp = false;
    000015F9 DD 36 FF 00      [19]  174 	ld	-1 (ix), #0x00
                                    175 ;src/lib/utilities.c:89: while ((!kp) && (g_clock.s < duration)) {
    000015FD                        176 00104$:
    000015FD DD CB FF 46      [20]  177 	bit	0, -1 (ix)
    00001601 20 21            [12]  178 	jr	NZ, 00106$
    00001603 2A 6C 93         [16]  179 	ld	hl, (#(_g_clock + 2) + 0)
    00001606 AF               [ 4]  180 	xor	a, a
    00001607 ED 52            [15]  181 	sbc	hl, de
    00001609 30 19            [12]  182 	jr	NC, 00106$
                                    183 ;src/lib/utilities.c:91: cpct_waitVSYNC();
    0000160B D5               [11]  184 	push	de
    0000160C CD 67 2F         [17]  185 	call	_cpct_waitVSYNC
                                    186 ;src/lib/utilities.c:92: u_clock_tick();
    0000160F CD B9 15         [17]  187 	call	_u_clock_tick
                                    188 ;src/lib/utilities.c:93: if (cpct_isAnyKeyPressed()) {
    00001612 CD 8A 2E         [17]  189 	call	_cpct_isAnyKeyPressed
    00001615 D1               [10]  190 	pop	de
    00001616 B7               [ 4]  191 	or	a, a
    00001617 28 E4            [12]  192 	jr	Z, 00104$
                                    193 ;src/lib/utilities.c:94: kp = true;
    00001619 DD 36 FF 01      [19]  194 	ld	-1 (ix), #0x01
                                    195 ;src/lib/utilities.c:95: g_skip = true;
    0000161D 21 58 93         [10]  196 	ld	hl, #_g_skip
    00001620 36 01            [10]  197 	ld	(hl), #0x01
    00001622 18 D9            [12]  198 	jr	00104$
    00001624                        199 00106$:
                                    200 ;src/lib/utilities.c:99: u_clear_input();
    00001624 CD D8 15         [17]  201 	call	_u_clear_input
                                    202 ;src/lib/utilities.c:102: g_clock_on = false;
    00001627 AF               [ 4]  203 	xor	a, a
    00001628 32 4F 93         [13]  204 	ld	(_g_clock_on+0), a
                                    205 ;src/lib/utilities.c:103: }
    0000162B 33               [ 6]  206 	inc	sp
    0000162C DD E1            [14]  207 	pop	ix
    0000162E C9               [10]  208 	ret
                                    209 	.area _CODE
                                    210 	.area _INITIALIZER
    0000939A                        211 __xinit__g_clock:
    0000939A 00 00                  212 	.dw #0x0000
    0000939C 00 00                  213 	.dw #0x0000
                                    214 	.area _CABS (ABS)
