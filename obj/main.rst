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
                                     23 	.globl _d_load_gfx_to_extended_memory
                                     24 	.globl _c_sprite_cache_bank_init
                                     25 	.globl _a_page_disconnect_safe
                                     26 	.globl _a_page_connect_safe
                                     27 	.globl _cpct_asicUnlock
                                     28 	.globl _cpct_asicSetPalette
                                     29 	.globl _cpct_setVideoMode
                                     30 	.globl _cpct_drawSprite
                                     31 	.globl _cpct_pageMemory
                                     32 	.globl _cpct_setStackLocation
                                     33 	.globl _cpct_memcpy
                                     34 	.globl _cpct_removeInterruptHandler
                                     35 	.globl _cpct_disableFirmware
                                     36 	.globl _g_skip
                                     37 	.globl _g_hw
                                     38 ;--------------------------------------------------------
                                     39 ; special function registers
                                     40 ;--------------------------------------------------------
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area _DATA
    00008400                         45 _g_hw::
    00008400                         46 	.ds 1
                                     47 ;--------------------------------------------------------
                                     48 ; ram data
                                     49 ;--------------------------------------------------------
                                     50 	.area _INITIALIZED
    00009358                         51 _g_skip::
    00009358                         52 	.ds 1
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
                                     73 ;src/main.c:35: cpctm_createTransparentMaskTable(v_mask_table, MASK_TABLE_LOC, M1, 0);
                                     74 ;	---------------------------------
                                     75 ; Function dummy_cpct_transparentMaskTable0M1_container
                                     76 ; ---------------------------------
    000006D8                         77 _dummy_cpct_transparentMaskTable0M1_container::
                                     78 	.area _v_mask_table_ (ABS) 
    00008000                         79 	.org 0x8000 
    00008000                         80 _v_mask_table::
    00008000 FF EE DD CC BB AA 99    81 	.db 0xFF, 0xEE, 0xDD, 0xCC, 0xBB, 0xAA, 0x99, 0x88 
             88
    00008008 77 66 55 44 33 22 11    82 	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
             00
    00008010 EE EE CC CC AA AA 88    83 	.db 0xEE, 0xEE, 0xCC, 0xCC, 0xAA, 0xAA, 0x88, 0x88 
             88
    00008018 66 66 44 44 22 22 00    84 	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
             00
    00008020 DD CC DD CC 99 88 99    85 	.db 0xDD, 0xCC, 0xDD, 0xCC, 0x99, 0x88, 0x99, 0x88 
             88
    00008028 55 44 55 44 11 00 11    86 	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
             00
    00008030 CC CC CC CC 88 88 88    87 	.db 0xCC, 0xCC, 0xCC, 0xCC, 0x88, 0x88, 0x88, 0x88 
             88
    00008038 44 44 44 44 00 00 00    88 	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
             00
    00008040 BB AA 99 88 BB AA 99    89 	.db 0xBB, 0xAA, 0x99, 0x88, 0xBB, 0xAA, 0x99, 0x88 
             88
    00008048 33 22 11 00 33 22 11    90 	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
             00
    00008050 AA AA 88 88 AA AA 88    91 	.db 0xAA, 0xAA, 0x88, 0x88, 0xAA, 0xAA, 0x88, 0x88 
             88
    00008058 22 22 00 00 22 22 00    92 	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
             00
    00008060 99 88 99 88 99 88 99    93 	.db 0x99, 0x88, 0x99, 0x88, 0x99, 0x88, 0x99, 0x88 
             88
    00008068 11 00 11 00 11 00 11    94 	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
             00
    00008070 88 88 88 88 88 88 88    95 	.db 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88 
             88
    00008078 00 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
             00
    00008080 77 66 55 44 33 22 11    97 	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
             00
    00008088 77 66 55 44 33 22 11    98 	.db 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11, 0x00 
             00
    00008090 66 66 44 44 22 22 00    99 	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
             00
    00008098 66 66 44 44 22 22 00   100 	.db 0x66, 0x66, 0x44, 0x44, 0x22, 0x22, 0x00, 0x00 
             00
    000080A0 55 44 55 44 11 00 11   101 	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
             00
    000080A8 55 44 55 44 11 00 11   102 	.db 0x55, 0x44, 0x55, 0x44, 0x11, 0x00, 0x11, 0x00 
             00
    000080B0 44 44 44 44 00 00 00   103 	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
             00
    000080B8 44 44 44 44 00 00 00   104 	.db 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00 
             00
    000080C0 33 22 11 00 33 22 11   105 	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
             00
    000080C8 33 22 11 00 33 22 11   106 	.db 0x33, 0x22, 0x11, 0x00, 0x33, 0x22, 0x11, 0x00 
             00
    000080D0 22 22 00 00 22 22 00   107 	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
             00
    000080D8 22 22 00 00 22 22 00   108 	.db 0x22, 0x22, 0x00, 0x00, 0x22, 0x22, 0x00, 0x00 
             00
    000080E0 11 00 11 00 11 00 11   109 	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
             00
    000080E8 11 00 11 00 11 00 11   110 	.db 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00 
             00
    000080F0 00 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
             00
    000080F8 00 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
             00
                                    113 	.area _CSEG (REL, CON) 
                                    114 ;src/main.c:37: void main(void) {
                                    115 ;	---------------------------------
                                    116 ; Function main
                                    117 ; ---------------------------------
    000093A2                        118 _main::
                                    119 ;src/main.c:39: cpct_setVideoMode(1);
    000093A2 2E 01            [ 7]  120 	ld	l, #0x01
    000093A4 CD 59 2F         [17]  121 	call	_cpct_setVideoMode
                                    122 ;src/main.c:40: cpct_pageMemory(RAMCFG_0 | BANK_0);
    000093A7 2E 00            [ 7]  123 	ld	l, #0x00
    000093A9 CD 50 30         [17]  124 	call	_cpct_pageMemory
                                    125 ;src/main.c:42: v_blank_screen_no_asic();
    000093AC CD 2F 16         [17]  126 	call	_v_blank_screen_no_asic
                                    127 ;src/main.c:43: cpct_disableFirmware();
    000093AF CD 1B 1F         [17]  128 	call	_cpct_disableFirmware
                                    129 ;src/main.c:45: cpct_setStackLocation(STACK_LOC);
    000093B2 21 FF 00         [10]  130 	ld	hl, #0x00ff
    000093B5 CD 85 2E         [17]  131 	call	_cpct_setStackLocation
                                    132 ;src/main.c:46: cpct_removeInterruptHandler();
    000093B8 CD 1B 1F         [17]  133 	call	_cpct_removeInterruptHandler
                                    134 ;src/main.c:48: g_hw = h_get_details();
    000093BB CD CC 1A         [17]  135 	call	_h_get_details
    000093BE 32 00 84         [13]  136 	ld	(_g_hw+0), a
                                    137 ;src/main.c:50: if (HW_IS_PLUS(g_hw) && HW_HAS_128K(g_hw)) {
    000093C1 3A 00 84         [13]  138 	ld	a, (_g_hw)
    000093C4 CB 57            [ 8]  139 	bit	2, a
    000093C6 28 66            [12]  140 	jr	Z, 00109$
    000093C8 E6 03            [ 7]  141 	and	a, #0x03
    000093CA D6 01            [ 7]  142 	sub	a, #0x01
    000093CC 38 60            [12]  143 	jr	C, 00109$
                                    144 ;src/main.c:52: cpct_asicUnlock();
    000093CE CD 84 2F         [17]  145 	call	_cpct_asicUnlock
                                    146 ;src/main.c:53: a_page_connect_safe();
    000093D1 CD A5 12         [17]  147 	call	_a_page_connect_safe
                                    148 ;src/main.c:55: while (1) {
    000093D4                        149 00106$:
                                    150 ;src/main.c:58: cpct_drawSprite(img_loading_data, v_pos, 25, 13);
    000093D4 21 19 0D         [10]  151 	ld	hl, #0xd19
    000093D7 E5               [11]  152 	push	hl
    000093D8 11 8B F3         [10]  153 	ld	de, #0xf38b
    000093DB 21 A7 8F         [10]  154 	ld	hl, #_img_loading_data
    000093DE CD 37 2D         [17]  155 	call	_cpct_drawSprite
                                    156 ;src/main.c:59: cpct_asicSetPalette(m_load_pal, 4);
    000093E1 11 04 00         [10]  157 	ld	de, #0x0004
    000093E4 21 36 94         [10]  158 	ld	hl, #_m_load_pal
    000093E7 CD 0D 2D         [17]  159 	call	_cpct_asicSetPalette
                                    160 ;src/main.c:61: d_load_gfx_to_extended_memory();
    000093EA CD EB 14         [17]  161 	call	_d_load_gfx_to_extended_memory
                                    162 ;src/main.c:62: c_sprite_cache_bank_init();
    000093ED CD C2 12         [17]  163 	call	_c_sprite_cache_bank_init
                                    164 ;src/main.c:65: a_page_disconnect_safe();
    000093F0 CD B4 12         [17]  165 	call	_a_page_disconnect_safe
                                    166 ;src/main.c:66: cpct_memcpy(MUSIC_LOC, (u8 *)0x7000, 1843);
    000093F3 21 33 07         [10]  167 	ld	hl, #0x0733
    000093F6 E5               [11]  168 	push	hl
    000093F7 11 00 70         [10]  169 	ld	de, #0x7000
    000093FA 21 00 B0         [10]  170 	ld	hl, #0xb000
    000093FD CD 7D 2F         [17]  171 	call	_cpct_memcpy
                                    172 ;src/main.c:67: a_page_connect_safe();
    00009400 CD A5 12         [17]  173 	call	_a_page_connect_safe
                                    174 ;src/main.c:69: p_start();
    00009403 CD D8 06         [17]  175 	call	_p_start
                                    176 ;src/main.c:70: p_stop();
    00009406 CD 23 07         [17]  177 	call	_p_stop
                                    178 ;src/main.c:72: if (!g_skip) {
    00009409 21 58 93         [10]  179 	ld	hl, #_g_skip
    0000940C CB 46            [12]  180 	bit	0, (hl)
    0000940E 20 06            [12]  181 	jr	NZ, 00102$
                                    182 ;src/main.c:73: m_start();
    00009410 CD A6 05         [17]  183 	call	_m_start
                                    184 ;src/main.c:74: m_stop();
    00009413 CD F0 05         [17]  185 	call	_m_stop
    00009416                        186 00102$:
                                    187 ;src/main.c:77: if (!g_skip) {
    00009416 21 58 93         [10]  188 	ld	hl, #_g_skip
    00009419 CB 46            [12]  189 	bit	0, (hl)
    0000941B 20 06            [12]  190 	jr	NZ, 00104$
                                    191 ;src/main.c:78: i_start();
    0000941D CD 00 01         [17]  192 	call	_i_start
                                    193 ;src/main.c:79: i_stop();
    00009420 CD D6 01         [17]  194 	call	_i_stop
    00009423                        195 00104$:
                                    196 ;src/main.c:82: t_start();
    00009423 CD B4 08         [17]  197 	call	_t_start
                                    198 ;src/main.c:83: t_do();
    00009426 CD 6A 09         [17]  199 	call	_t_do
                                    200 ;src/main.c:84: t_stop();
    00009429 CD C2 09         [17]  201 	call	_t_stop
    0000942C 18 A6            [12]  202 	jr	00106$
    0000942E                        203 00109$:
                                    204 ;src/main.c:88: cpct_setVideoMode(1);
    0000942E 2E 01            [ 7]  205 	ld	l, #0x01
    00009430 CD 59 2F         [17]  206 	call	_cpct_setVideoMode
                                    207 ;src/main.c:89: v_blank_screen_no_asic();
                                    208 ;src/main.c:91: }
    00009433 C3 2F 16         [10]  209 	jp	_v_blank_screen_no_asic
    00009436                        210 _m_load_pal:
    00009436 00 00                  211 	.dw #0x0000
    00009438 F1 01                  212 	.dw #0x01f1
    0000943A F0 06                  213 	.dw #0x06f0
    0000943C F0 0F                  214 	.dw #0x0ff0
                                    215 	.area _CODE
                                    216 	.area _INITIALIZER
    00009388                        217 __xinit__g_skip:
    00009388 00                     218 	.db #0x00	;  0
                                    219 	.area _CABS (ABS)
