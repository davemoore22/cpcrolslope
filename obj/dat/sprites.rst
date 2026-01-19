                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module sprites
                                      6 	
                                      7 	.optsdcc -mz80 sdcccall(1)
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cpctelera_sprites_palette
                                     12 	.globl _mode_sprites_palette
                                     13 	.globl _titles_sprites_palette_mania
                                     14 	.globl _titles_sprites_palette_zen
                                     15 	.globl _titles_sprites_palette_classic
                                     16 	.globl _ghost_sprites_palette
                                     17 	.globl _spider_sprites_palette
                                     18 	.globl _snowball_sprites_palette
                                     19 	.globl _roland_sprites_palette
                                     20 	.globl _cpctelera_sprites_data
                                     21 	.globl _mode_sprites_data
                                     22 	.globl _titles_sprites_data
                                     23 	.globl _ghost_sprites_data
                                     24 	.globl _spider_sprites_data
                                     25 	.globl _snowball_sprites_data
                                     26 	.globl _roland_sprites_data
                                     27 ;--------------------------------------------------------
                                     28 ; special function registers
                                     29 ;--------------------------------------------------------
                                     30 ;--------------------------------------------------------
                                     31 ; ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area _DATA
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area _INITIALIZED
                                     38 ;--------------------------------------------------------
                                     39 ; absolute external ram data
                                     40 ;--------------------------------------------------------
                                     41 	.area _DABS (ABS)
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area _HOME
                                     46 	.area _GSINIT
                                     47 	.area _GSFINAL
                                     48 	.area _GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area _HOME
                                     53 	.area _HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area _DATA
                                     58 	.area _DATA
    000090EC                         59 _roland_sprites_data:
    000090EC 9F 49                   60 	.dw _roland_0
    000090EE 17 4A                   61 	.dw (_roland_0 + 120)
    000090F0 18 4A                   62 	.dw _roland_1
    000090F2 7C 4A                   63 	.dw (_roland_1 + 100)
    000090F4 7D 4A                   64 	.dw _roland_2
    000090F6 F2 4A                   65 	.dw (_roland_2 + 117)
    000090F8 F3 4A                   66 	.dw _roland_3
    000090FA 3C 4B                   67 	.dw (_roland_3 + 73)
    000090FC                         68 _snowball_sprites_data:
    000090FC 3D 4B                   69 	.dw _snowball_0
    000090FE 79 4B                   70 	.dw (_snowball_0 + 60)
    00009100 32 4D                   71 	.dw _snowball_1
    00009102 7C 4D                   72 	.dw (_snowball_1 + 74)
    00009104 7D 4D                   73 	.dw _snowball_2
    00009106 D2 4D                   74 	.dw (_snowball_2 + 85)
    00009108 D3 4D                   75 	.dw _snowball_3
    0000910A 2A 4E                   76 	.dw (_snowball_3 + 87)
    0000910C 2B 4E                   77 	.dw _snowball_4
    0000910E 80 4E                   78 	.dw (_snowball_4 + 85)
    00009110 81 4E                   79 	.dw _snowball_5
    00009112 BE 4E                   80 	.dw (_snowball_5 + 61)
    00009114 BF 4E                   81 	.dw _snowball_6
    00009116 00 4F                   82 	.dw (_snowball_6 + 65)
    00009118 01 4F                   83 	.dw _snowball_7
    0000911A 43 4F                   84 	.dw (_snowball_7 + 66)
    0000911C 44 4F                   85 	.dw _snowball_8
    0000911E 8E 4F                   86 	.dw (_snowball_8 + 74)
    00009120 8F 4F                   87 	.dw _snowball_9
    00009122 E2 4F                   88 	.dw (_snowball_9 + 83)
    00009124 7A 4B                   89 	.dw _snowball_10
    00009126 BA 4B                   90 	.dw (_snowball_10 + 64)
    00009128 BB 4B                   91 	.dw _snowball_11
    0000912A F9 4B                   92 	.dw (_snowball_11 + 62)
    0000912C FA 4B                   93 	.dw _snowball_12
    0000912E 49 4C                   94 	.dw (_snowball_12 + 79)
    00009130 4A 4C                   95 	.dw _snowball_13
    00009132 8D 4C                   96 	.dw (_snowball_13 + 67)
    00009134 8E 4C                   97 	.dw _snowball_14
    00009136 E1 4C                   98 	.dw (_snowball_14 + 83)
    00009138 E2 4C                   99 	.dw _snowball_15
    0000913A 31 4D                  100 	.dw (_snowball_15 + 79)
    0000913C                        101 _spider_sprites_data:
    0000913C E3 4F                  102 	.dw _spider_0
    0000913E 1A 50                  103 	.dw (_spider_0 + 55)
    00009140 B9 50                  104 	.dw _spider_1
    00009142 F0 50                  105 	.dw (_spider_1 + 55)
    00009144 F1 50                  106 	.dw _spider_2
    00009146 28 51                  107 	.dw (_spider_2 + 55)
    00009148 29 51                  108 	.dw _spider_3
    0000914A 58 51                  109 	.dw (_spider_3 + 47)
    0000914C 59 51                  110 	.dw _spider_4
    0000914E 89 51                  111 	.dw (_spider_4 + 48)
    00009150 8A 51                  112 	.dw _spider_5
    00009152 B4 51                  113 	.dw (_spider_5 + 42)
    00009154 B5 51                  114 	.dw _spider_6
    00009156 F9 51                  115 	.dw (_spider_6 + 68)
    00009158 FA 51                  116 	.dw _spider_7
    0000915A 48 52                  117 	.dw (_spider_7 + 78)
    0000915C 49 52                  118 	.dw _spider_8
    0000915E 99 52                  119 	.dw (_spider_8 + 80)
    00009160 9A 52                  120 	.dw _spider_9
    00009162 EB 52                  121 	.dw (_spider_9 + 81)
    00009164 1B 50                  122 	.dw _spider_10
    00009166 64 50                  123 	.dw (_spider_10 + 73)
    00009168 65 50                  124 	.dw _spider_11
    0000916A B8 50                  125 	.dw (_spider_11 + 83)
    0000916C                        126 _ghost_sprites_data:
    0000916C C0 44                  127 	.dw _ghost_0
    0000916E C5 44                  128 	.dw (_ghost_0 + 5)
    00009170 C6 44                  129 	.dw _ghost_1
    00009172 F5 44                  130 	.dw (_ghost_1 + 47)
    00009174 F6 44                  131 	.dw _ghost_2
    00009176 27 45                  132 	.dw (_ghost_2 + 49)
    00009178 28 45                  133 	.dw _ghost_3
    0000917A 4D 45                  134 	.dw (_ghost_3 + 37)
    0000917C 4E 45                  135 	.dw _ghost_4
    0000917E 72 45                  136 	.dw (_ghost_4 + 36)
    00009180 73 45                  137 	.dw _ghost_5
    00009182 AC 45                  138 	.dw (_ghost_5 + 57)
    00009184 AD 45                  139 	.dw _ghost_6
    00009186 02 46                  140 	.dw (_ghost_6 + 85)
    00009188 03 46                  141 	.dw _ghost_7
    0000918A 69 46                  142 	.dw (_ghost_7 + 102)
    0000918C 6A 46                  143 	.dw _ghost_8
    0000918E 9E 46                  144 	.dw (_ghost_8 + 52)
    00009190                        145 _titles_sprites_data:
    00009190 9F 49                  146 	.dw _roland_0
    00009192 17 4A                  147 	.dw (_roland_0 + 120)
    00009194 18 4A                  148 	.dw _roland_1
    00009196 7C 4A                  149 	.dw (_roland_1 + 100)
    00009198 7D 4A                  150 	.dw _roland_2
    0000919A F2 4A                  151 	.dw (_roland_2 + 117)
    0000919C F3 4A                  152 	.dw _roland_3
    0000919E 3C 4B                  153 	.dw (_roland_3 + 73)
    000091A0 01 40                  154 	.dw _controls_0
    000091A2 49 40                  155 	.dw (_controls_0 + 72)
    000091A4 4A 40                  156 	.dw _controls_1
    000091A6 93 40                  157 	.dw (_controls_1 + 73)
    000091A8 94 40                  158 	.dw _controls_2
    000091AA E2 40                  159 	.dw (_controls_2 + 78)
    000091AC E3 40                  160 	.dw _controls_3
    000091AE 2F 41                  161 	.dw (_controls_3 + 76)
    000091B0 05 49                  162 	.dw _play_0
    000091B2 4C 49                  163 	.dw (_play_0 + 71)
    000091B4 4D 49                  164 	.dw _play_1
    000091B6 8C 49                  165 	.dw (_play_1 + 63)
    000091B8 8D 49                  166 	.dw _play_2
    000091BA 9E 49                  167 	.dw (_play_2 + 17)
    000091BC                        168 _mode_sprites_data:
    000091BC 9F 46                  169 	.dw _mode_0
    000091BE E7 46                  170 	.dw (_mode_0 + 72)
    000091C0 E8 46                  171 	.dw _mode_1
    000091C2 36 47                  172 	.dw (_mode_1 + 78)
    000091C4 37 47                  173 	.dw _mode_2
    000091C6 85 47                  174 	.dw (_mode_2 + 78)
    000091C8 86 47                  175 	.dw _mode_3
    000091CA C1 47                  176 	.dw (_mode_3 + 59)
    000091CC C2 47                  177 	.dw _mode_4
    000091CE 08 48                  178 	.dw (_mode_4 + 70)
    000091D0 09 48                  179 	.dw _mode_5
    000091D2 4F 48                  180 	.dw (_mode_5 + 70)
    000091D4 50 48                  181 	.dw _mode_6
    000091D6 82 48                  182 	.dw (_mode_6 + 50)
    000091D8 83 48                  183 	.dw _mode_7
    000091DA C9 48                  184 	.dw (_mode_7 + 70)
    000091DC CA 48                  185 	.dw _mode_8
    000091DE 04 49                  186 	.dw (_mode_8 + 58)
    000091E0                        187 _cpctelera_sprites_data:
    000091E0 30 41                  188 	.dw _cpctelera_0
    000091E2 39 41                  189 	.dw (_cpctelera_0 + 9)
    000091E4 F4 41                  190 	.dw _cpctelera_1
    000091E6 1C 42                  191 	.dw (_cpctelera_1 + 40)
    000091E8 1D 42                  192 	.dw _cpctelera_2
    000091EA 7D 42                  193 	.dw (_cpctelera_2 + 96)
    000091EC 7E 42                  194 	.dw _cpctelera_3
    000091EE A0 42                  195 	.dw (_cpctelera_3 + 34)
    000091F0 A1 42                  196 	.dw _cpctelera_4
    000091F2 16 43                  197 	.dw (_cpctelera_4 + 117)
    000091F4 17 43                  198 	.dw _cpctelera_5
    000091F6 97 43                  199 	.dw (_cpctelera_5 + 128)
    000091F8 98 43                  200 	.dw _cpctelera_6
    000091FA F2 43                  201 	.dw (_cpctelera_6 + 90)
    000091FC F3 43                  202 	.dw _cpctelera_7
    000091FE 36 44                  203 	.dw (_cpctelera_7 + 67)
    00009200 37 44                  204 	.dw _cpctelera_8
    00009202 66 44                  205 	.dw (_cpctelera_8 + 47)
    00009204 67 44                  206 	.dw _cpctelera_9
    00009206 BF 44                  207 	.dw (_cpctelera_9 + 88)
    00009208 3A 41                  208 	.dw _cpctelera_10
    0000920A 99 41                  209 	.dw (_cpctelera_10 + 95)
    0000920C 9A 41                  210 	.dw _cpctelera_11
    0000920E A1 41                  211 	.dw (_cpctelera_11 + 7)
    00009210 A2 41                  212 	.dw _cpctelera_12
    00009212 A7 41                  213 	.dw (_cpctelera_12 + 5)
    00009214 A8 41                  214 	.dw _cpctelera_13
    00009216 C7 41                  215 	.dw (_cpctelera_13 + 31)
    00009218 C8 41                  216 	.dw _cpctelera_14
    0000921A ED 41                  217 	.dw (_cpctelera_14 + 37)
    0000921C EE 41                  218 	.dw _cpctelera_15
    0000921E F3 41                  219 	.dw (_cpctelera_15 + 5)
    00009220                        220 _roland_sprites_palette:
    00009220 FF 0F                  221 	.dw #0x0fff
    00009222 13 01                  222 	.dw #0x0113
    00009224 42 01                  223 	.dw #0x0142
    00009226 27 03                  224 	.dw #0x0327
    00009228 F0 04                  225 	.dw #0x04f0
    0000922A F0 08                  226 	.dw #0x08f0
    0000922C 80 00                  227 	.dw #0x0080
    0000922E F0 0A                  228 	.dw #0x0af0
    00009230 2A 05                  229 	.dw #0x052a
    00009232 57 05                  230 	.dw #0x0557
    00009234 F0 0C                  231 	.dw #0x0cf0
    00009236 2D 08                  232 	.dw #0x082d
    00009238 F0 0D                  233 	.dw #0x0df0
    0000923A 79 08                  234 	.dw #0x0879
    0000923C 3F 0B                  235 	.dw #0x0b3f
    0000923E AF 0E                  236 	.dw #0x0eaf
    00009240                        237 _snowball_sprites_palette:
    00009240 FF 0F                  238 	.dw #0x0fff
    00009242 57 03                  239 	.dw #0x0357
    00009244 57 03                  240 	.dw #0x0357
    00009246 57 03                  241 	.dw #0x0357
    00009248 8C 07                  242 	.dw #0x078c
    0000924A 8C 07                  243 	.dw #0x078c
    0000924C BF 0B                  244 	.dw #0x0bbf
    0000924E BF 0B                  245 	.dw #0x0bbf
    00009250 AF 0B                  246 	.dw #0x0baf
    00009252 DF 0D                  247 	.dw #0x0ddf
    00009254 EF 0E                  248 	.dw #0x0eef
    00009256 0C 05                  249 	.dw #0x050c
    00009258 00 00                  250 	.dw #0x0000
    0000925A 00 00                  251 	.dw #0x0000
    0000925C D3 0D                  252 	.dw #0x0dd3
    0000925E 0C 05                  253 	.dw #0x050c
    00009260                        254 _spider_sprites_palette:
    00009260 FF 0F                  255 	.dw #0x0fff
    00009262 01 00                  256 	.dw #0x0001
    00009264 4C 05                  257 	.dw #0x054c
    00009266 F6 06                  258 	.dw #0x06f6
    00009268 7D 08                  259 	.dw #0x087d
    0000926A 4D 0B                  260 	.dw #0x0b4d
    0000926C 8E 0C                  261 	.dw #0x0c8e
    0000926E 9A 0F                  262 	.dw #0x0f9a
    00009270 DE 0D                  263 	.dw #0x0dde
    00009272 00 00                  264 	.dw #0x0000
    00009274 EA 0B                  265 	.dw #0x0bea
    00009276 0B 05                  266 	.dw #0x050b
    00009278 00 00                  267 	.dw #0x0000
    0000927A 00 00                  268 	.dw #0x0000
    0000927C 00 00                  269 	.dw #0x0000
    0000927E 00 00                  270 	.dw #0x0000
    00009280                        271 _ghost_sprites_palette:
    00009280 FF 0F                  272 	.dw #0x0fff
    00009282 C0 09                  273 	.dw #0x09c0
    00009284 39 0B                  274 	.dw #0x0b39
    00009286 4A 0C                  275 	.dw #0x0c4a
    00009288 5B 0D                  276 	.dw #0x0d5b
    0000928A 8D 0E                  277 	.dw #0x0e8d
    0000928C F0 0D                  278 	.dw #0x0df0
    0000928E AE 0F                  279 	.dw #0x0fae
    00009290 CE 0F                  280 	.dw #0x0fce
    00009292 00 00                  281 	.dw #0x0000
    00009294 00 00                  282 	.dw #0x0000
    00009296 00 00                  283 	.dw #0x0000
    00009298 00 00                  284 	.dw #0x0000
    0000929A 00 00                  285 	.dw #0x0000
    0000929C 00 00                  286 	.dw #0x0000
    0000929E 00 00                  287 	.dw #0x0000
    000092A0                        288 _titles_sprites_palette_classic:
    000092A0 FF 0F                  289 	.dw #0x0fff
    000092A2 13 01                  290 	.dw #0x0113
    000092A4 42 01                  291 	.dw #0x0142
    000092A6 27 03                  292 	.dw #0x0327
    000092A8 F0 04                  293 	.dw #0x04f0
    000092AA F0 08                  294 	.dw #0x08f0
    000092AC BF 0F                  295 	.dw #0x0fbf
    000092AE F0 0A                  296 	.dw #0x0af0
    000092B0 EF 0F                  297 	.dw #0x0fef
    000092B2 57 05                  298 	.dw #0x0557
    000092B4 F0 0C                  299 	.dw #0x0cf0
    000092B6 2D 08                  300 	.dw #0x082d
    000092B8 F0 0D                  301 	.dw #0x0df0
    000092BA 79 08                  302 	.dw #0x0879
    000092BC 3F 0B                  303 	.dw #0x0b3f
    000092BE AF 0E                  304 	.dw #0x0eaf
    000092C0                        305 _titles_sprites_palette_zen:
    000092C0 FF 0F                  306 	.dw #0x0fff
    000092C2 13 01                  307 	.dw #0x0113
    000092C4 06 06                  308 	.dw #0x0606
    000092C6 27 03                  309 	.dw #0x0327
    000092C8 08 08                  310 	.dw #0x0808
    000092CA 0A 0A                  311 	.dw #0x0a0a
    000092CC BF 0F                  312 	.dw #0x0fbf
    000092CE 0C 0C                  313 	.dw #0x0c0c
    000092D0 EF 0F                  314 	.dw #0x0fef
    000092D2 57 05                  315 	.dw #0x0557
    000092D4 0D 0D                  316 	.dw #0x0d0d
    000092D6 2D 08                  317 	.dw #0x082d
    000092D8 0F 0F                  318 	.dw #0x0f0f
    000092DA 79 08                  319 	.dw #0x0879
    000092DC 3F 0B                  320 	.dw #0x0b3f
    000092DE AF 0E                  321 	.dw #0x0eaf
    000092E0                        322 _titles_sprites_palette_mania:
    000092E0 FF 0F                  323 	.dw #0x0fff
    000092E2 13 01                  324 	.dw #0x0113
    000092E4 55 00                  325 	.dw #0x0055
    000092E6 27 03                  326 	.dw #0x0327
    000092E8 77 00                  327 	.dw #0x0077
    000092EA 99 00                  328 	.dw #0x0099
    000092EC BF 0F                  329 	.dw #0x0fbf
    000092EE BB 00                  330 	.dw #0x00bb
    000092F0 EF 0F                  331 	.dw #0x0fef
    000092F2 57 05                  332 	.dw #0x0557
    000092F4 DD 00                  333 	.dw #0x00dd
    000092F6 2D 08                  334 	.dw #0x082d
    000092F8 FF 00                  335 	.dw #0x00ff
    000092FA 79 08                  336 	.dw #0x0879
    000092FC 3F 0B                  337 	.dw #0x0b3f
    000092FE AF 0E                  338 	.dw #0x0eaf
    00009300                        339 _mode_sprites_palette:
    00009300 FF 0F                  340 	.dw #0x0fff
    00009302 13 01                  341 	.dw #0x0113
    00009304 42 01                  342 	.dw #0x0142
    00009306 27 03                  343 	.dw #0x0327
    00009308 F0 04                  344 	.dw #0x04f0
    0000930A F0 08                  345 	.dw #0x08f0
    0000930C BF 0F                  346 	.dw #0x0fbf
    0000930E F0 0A                  347 	.dw #0x0af0
    00009310 EF 0F                  348 	.dw #0x0fef
    00009312 57 05                  349 	.dw #0x0557
    00009314 F0 0C                  350 	.dw #0x0cf0
    00009316 2D 08                  351 	.dw #0x082d
    00009318 F0 0D                  352 	.dw #0x0df0
    0000931A 79 08                  353 	.dw #0x0879
    0000931C 3F 0B                  354 	.dw #0x0b3f
    0000931E AF 0E                  355 	.dw #0x0eaf
    00009320                        356 _cpctelera_sprites_palette:
    00009320 FF 0F                  357 	.dw #0x0fff
    00009322 00 00                  358 	.dw #0x0000
    00009324 11 01                  359 	.dw #0x0111
    00009326 22 02                  360 	.dw #0x0222
    00009328 94 02                  361 	.dw #0x0294
    0000932A 41 04                  362 	.dw #0x0441
    0000932C 55 05                  363 	.dw #0x0555
    0000932E 87 08                  364 	.dw #0x0887
    00009330 99 09                  365 	.dw #0x0999
    00009332 CC 0C                  366 	.dw #0x0ccc
    00009334 D2 0E                  367 	.dw #0x0ed2
    00009336 F1 0D                  368 	.dw #0x0df1
    00009338 F7 0D                  369 	.dw #0x0df7
    0000933A EE 0E                  370 	.dw #0x0eee
    0000933C FA 0F                  371 	.dw #0x0ffa
    0000933E FD 0F                  372 	.dw #0x0ffd
                                    373 	.area _INITIALIZER
                                    374 	.area _CABS (ABS)
