                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _t_stop
                                     13 	.globl _t_do
                                     14 	.globl _t_start
                                     15 	.globl _p_stop
                                     16 	.globl _p_start
                                     17 	.globl _m_stop
                                     18 	.globl _m_start
                                     19 	.globl _i_stop
                                     20 	.globl _i_start
                                     21 	.globl _v_blank_screen_no_asic
                                     22 	.globl _h_get_details
                                     23 	.globl _d_load_music
                                     24 	.globl _d_load_gfx_to_extended_memory
                                     25 	.globl _c_sprite_cache_bank_init
                                     26 	.globl _a_page_connect_safe
                                     27 	.globl _cpct_asicUnlock
                                     28 	.globl _cpct_asicSetPalette
                                     29 	.globl _cpct_setVideoMode
                                     30 	.globl _cpct_drawSprite
                                     31 	.globl _cpct_pageMemory
                                     32 	.globl _cpct_setStackLocation
                                     33 	.globl _cpct_removeInterruptHandler
                                     34 	.globl _cpct_disableFirmware
                                     35 	.globl _g_skip
                                     36 	.globl _g_hw
                                     37 ;--------------------------------------------------------
                                     38 ; special function registers
                                     39 ;--------------------------------------------------------
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area _DATA
    00008400                         44 _g_hw::
    00008400                         45 	.ds 1
                                     46 ;--------------------------------------------------------
                                     47 ; ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area _INITIALIZED
    00009358                         50 _g_skip::
    00009358                         51 	.ds 1
                                     52 ;--------------------------------------------------------
                                     53 ; absolute external ram data
                                     54 ;--------------------------------------------------------
                                     55 	.area _DABS (ABS)
                                     56 ;--------------------------------------------------------
                                     57 ; global & static initialisations
                                     58 ;--------------------------------------------------------
                                     59 	.area _HOME
                                     60 	.area _GSINIT
                                     61 	.area _GSFINAL
                                     62 	.area _GSINIT
                                     63 ;--------------------------------------------------------
                                     64 ; Home
                                     65 ;--------------------------------------------------------
                                     66 	.area _HOME
                                     67 	.area _HOME
                                     68 ;--------------------------------------------------------
                                     69 ; code
                                     70 ;--------------------------------------------------------
                                     71 	.area _CODE
                                     72 ;src/main.c:35: cpctm_createTransparentMaskTable(v_mask_table, MASK_TABLE_LOC, M1, 0);
                                     73 ;	---------------------------------
                                     74 ; Function dummy_cpct_transparentMaskTable0M1_container
                                     75 ; ---------------------------------
    000006D8                         76 _dummy_cpct_transparentMaskTable0M1_container::
                                     77 	.area _v_mask_table_ (ABS) 
    00008000                         78 	.org 0x8000 
    00008000                         79 _v_mask_table::
    00008000 FF EE DD CC BB AA 99    80 	.db 0xFF, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88 
             88
    00008008 77 66 55 44 33 22 11    81 	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
             00
    00008010 EE EE CC CC AA AA 88    82 	.db 0xEE, 0xEE, 0xCC, 0xCC, 0xAA, 0xAA, 0x88, 0x88 
             88
    00008018 66 66 44 44 22 22 00    83 	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
             00
    00008020 DD CC DD CC 99 88 99    84 	.db 0xDD, 0xCC, 0xDD, 0xCC, 0x99, 0x88, 0x99, 0x88 
             88
    00008028 55 44 55 44 11 00 11    85 	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
             00
    00008030 CC CC CC CC 88 88 88    86 	.db 0xCC, 0xCC, 0xCC, 0xCC, 0x88, 0x88, 0x88, 0x88 
             88
    00008038 44 44 44 44 00 00 00    87 	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
             00
    00008040 BB AA 99 88 BB AA 99    88 	.db 0xBB, 0xAA, 0x99, 0x88, 0xBB, 0xAA, 0x99, 0x88 
             88
    00008048 33 22 11 00 33 22 11    89 	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
             00
    00008050 AA AA 88 88 AA AA 88    90 	.db 0xAA, 0xAA, 0x88, 0x88, 0xAA, 0xAA, 0x88, 0x88 
             88
    00008058 22 22 00 00 22 22 00    91 	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
             00
    00008060 99 88 99 88 99 88 99    92 	.db 0x99, 0x88, 0x99, 0x88, 0x99, 0x88, 0x99, 0x88 
             88
    00008068 11 00 11 00 11 00 11    93 	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
             00
    00008070 88 88 88 88 88 88 88    94 	.db 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88 
             88
    00008078 00 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
             00
    00008080 77 66 55 44 33 22 11    96 	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
             00
    00008088 77 66 55 44 33 22 11    97 	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
             00
    00008090 66 66 44 44 22 22 00    98 	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
             00
    00008098 66 66 44 44 22 22 00    99 	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
             00
    000080A0 55 44 55 44 11 00 11   100 	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
             00
    000080A8 55 44 55 44 11 00 11   101 	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
             00
    000080B0 44 44 44 44 00 00 00   102 	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
             00
    000080B8 44 44 44 44 00 00 00   103 	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
             00
    000080C0 33 22 11 00 33 22 11   104 	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
             00
    000080C8 33 22 11 00 33 22 11   105 	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
             00
    000080D0 22 22 00 00 22 22 00   106 	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
             00
    000080D8 22 22 00 00 22 22 00   107 	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
             00
    000080E0 11 00 11 00 11 00 11   108 	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
             00
    000080E8 11 00 11 00 11 00 11   109 	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
             00
    000080F0 00 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
             00
    000080F8 00 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
             00
                                    112 	.area _CSEG (REL, CON) 
                                    113 ;src/main.c:37: void main(void) {
                                    114 ;	---------------------------------
                                    115 ; Function main
                                    116 ; ---------------------------------
    000093A2                        117 _main::
                                    118 ;src/main.c:39: cpct_setVideoMode(1);
    000093A2 2E 01            [ 7]  119 	ld	l, #0x01
    000093A4 CD 59 2F         [17]  120 	call	_cpct_setVideoMode
                                    121 ;src/main.c:40: cpct_pageMemory(RAMCFG_0 | BANK_0);
    000093A7 2E 00            [ 7]  122 	ld	l, #0x00
    000093A9 CD 50 30         [17]  123 	call	_cpct_pageMemory
                                    124 ;src/main.c:42: v_blank_screen_no_asic();
    000093AC CD 2F 16         [17]  125 	call	_v_blank_screen_no_asic
                                    126 ;src/main.c:43: cpct_disableFirmware();
    000093AF CD 1B 1F         [17]  127 	call	_cpct_disableFirmware
                                    128 ;src/main.c:45: cpct_setStackLocation(STACK_LOC);
    000093B2 21 FF 00         [10]  129 	ld	hl, #0x00ff
    000093B5 CD 85 2E         [17]  130 	call	_cpct_setStackLocation
                                    131 ;src/main.c:46: cpct_removeInterruptHandler();
    000093B8 CD 1B 1F         [17]  132 	call	_cpct_removeInterruptHandler
                                    133 ;src/main.c:48: g_hw = h_get_details();
    000093BB CD CC 1A         [17]  134 	call	_h_get_details
    000093BE 32 00 84         [13]  135 	ld	(_g_hw+0), a
                                    136 ;src/main.c:50: if (HW_IS_PLUS(g_hw) && HW_HAS_128K(g_hw)) {
    000093C1 3A 00 84         [13]  137 	ld	a, (_g_hw)
    000093C4 CB 57            [ 8]  138 	bit	2, a
    000093C6 28 56            [12]  139 	jr	Z, 00109$
    000093C8 E6 03            [ 7]  140 	and	a, #0x03
    000093CA D6 01            [ 7]  141 	sub	a, #0x01
    000093CC 38 50            [12]  142 	jr	C, 00109$
                                    143 ;src/main.c:52: cpct_asicUnlock();
    000093CE CD 84 2F         [17]  144 	call	_cpct_asicUnlock
                                    145 ;src/main.c:53: a_page_connect_safe();
    000093D1 CD A5 12         [17]  146 	call	_a_page_connect_safe
                                    147 ;src/main.c:55: while (1) {
    000093D4                        148 00106$:
                                    149 ;src/main.c:58: cpct_drawSprite(img_loading_data, v_pos, 25, 13);
    000093D4 21 19 0D         [10]  150 	ld	hl, #0xd19
    000093D7 E5               [11]  151 	push	hl
    000093D8 11 8B F3         [10]  152 	ld	de, #0xf38b
    000093DB 21 A7 8F         [10]  153 	ld	hl, #_img_loading_data
    000093DE CD 37 2D         [17]  154 	call	_cpct_drawSprite
                                    155 ;src/main.c:59: cpct_asicSetPalette(m_load_pal, 4);
    000093E1 11 04 00         [10]  156 	ld	de, #0x0004
    000093E4 21 26 94         [10]  157 	ld	hl, #_m_load_pal
    000093E7 CD 0D 2D         [17]  158 	call	_cpct_asicSetPalette
                                    159 ;src/main.c:61: d_load_gfx_to_extended_memory();
    000093EA CD EB 14         [17]  160 	call	_d_load_gfx_to_extended_memory
                                    161 ;src/main.c:62: c_sprite_cache_bank_init();
    000093ED CD C2 12         [17]  162 	call	_c_sprite_cache_bank_init
                                    163 ;src/main.c:63: d_load_music();
    000093F0 CD 56 15         [17]  164 	call	_d_load_music
                                    165 ;src/main.c:69: p_start();
    000093F3 CD D8 06         [17]  166 	call	_p_start
                                    167 ;src/main.c:70: p_stop();
    000093F6 CD 23 07         [17]  168 	call	_p_stop
                                    169 ;src/main.c:72: if (!g_skip) {
    000093F9 21 58 93         [10]  170 	ld	hl, #_g_skip
    000093FC CB 46            [12]  171 	bit	0, (hl)
    000093FE 20 06            [12]  172 	jr	NZ, 00102$
                                    173 ;src/main.c:73: m_start();
    00009400 CD A6 05         [17]  174 	call	_m_start
                                    175 ;src/main.c:74: m_stop();
    00009403 CD F0 05         [17]  176 	call	_m_stop
    00009406                        177 00102$:
                                    178 ;src/main.c:77: if (!g_skip) {
    00009406 21 58 93         [10]  179 	ld	hl, #_g_skip
    00009409 CB 46            [12]  180 	bit	0, (hl)
    0000940B 20 06            [12]  181 	jr	NZ, 00104$
                                    182 ;src/main.c:78: i_start();
    0000940D CD 00 01         [17]  183 	call	_i_start
                                    184 ;src/main.c:79: i_stop();
    00009410 CD D6 01         [17]  185 	call	_i_stop
    00009413                        186 00104$:
                                    187 ;src/main.c:82: t_start();
    00009413 CD B4 08         [17]  188 	call	_t_start
                                    189 ;src/main.c:83: t_do();
    00009416 CD 6A 09         [17]  190 	call	_t_do
                                    191 ;src/main.c:84: t_stop();
    00009419 CD C2 09         [17]  192 	call	_t_stop
    0000941C 18 B6            [12]  193 	jr	00106$
    0000941E                        194 00109$:
                                    195 ;src/main.c:88: cpct_setVideoMode(1);
    0000941E 2E 01            [ 7]  196 	ld	l, #0x01
    00009420 CD 59 2F         [17]  197 	call	_cpct_setVideoMode
                                    198 ;src/main.c:89: v_blank_screen_no_asic();
                                    199 ;src/main.c:91: }
    00009423 C3 2F 16         [10]  200 	jp	_v_blank_screen_no_asic
    00009426                        201 _m_load_pal:
    00009426 00 00                  202 	.dw #0x0000
    00009428 F1 01                  203 	.dw #0x01f1
    0000942A F0 06                  204 	.dw #0x06f0
    0000942C F0 0F                  205 	.dw #0x0ff0
                                    206 	.area _CODE
                                    207 	.area _INITIALIZER
    00009388                        208 __xinit__g_skip:
    00009388 00                     209 	.db #0x00	;  0
                                    210 	.area _CABS (ABS)
