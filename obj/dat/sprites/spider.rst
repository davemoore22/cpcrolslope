ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 1
Hexadecimal [32-Bits]



                                      1 .area SPRITES
                                      2 
                                      3 ;; File 'out/spider_0.h.s' generated using cpct_pack
                                      4 ;; Compresor used:   zx7b
                                      5 ;; Files compressed: [ 'dat/spider_0.bin' ]
                                      6 ;; Uncompressed:     256 bytes
                                      7 ;; Compressed:       56 bytes
                                      8 ;; Space saved:      200 bytes
                                      9 ;;
                                     10 
                                     11 ;; Declaration of the compressed array and
                                     12 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                     13 .globl _spider_0
                                     14 .globl _spider_0_end
                                     15 
                                     16 ;; Compressed and uncompressed sizes
                         00000038    17 _spider_0_size_z == 56
                         00000100    18 _spider_0_size   == 256
                                     19 
                                     20 
                                     21 ;; File 'out/spider_0.s' generated using cpct_pack
                                     22 ;; Compresor used:   zx7b
                                     23 ;; Files compressed: [ 'dat/spider_0.bin' ]
                                     24 ;; Uncompressed:     256 bytes
                                     25 ;; Compressed:       56 bytes
                                     26 ;; Space saved:      200 bytes
                                     27 ;;
                                     28 
                                     29 ;; Data array definition
    00004FE3                         30 _spider_0::
    00004FE3 AB AA 00 8B 0D E8 0C    31    .db  0xab, 0xaa, 0x00, 0x8b, 0x0d, 0xe8, 0x0c, 0x00, 0x0e, 0x4b, 0x01, 0x07, 0x2b, 0x00, 0x64, 0x0e
             00 0E 4B 01 07 2B 00
             64 0E
    00004FF3 89 4F 1E EB 0C 0F FA    32    .db  0x89, 0x4f, 0x1e, 0xeb, 0x0c, 0x0f, 0xfa, 0x10, 0xe2, 0x2f, 0x26, 0x10, 0x0f, 0x6e, 0x02, 0x68
             10 E2 2F 26 10 0F 6E
             02 68
    00005003 05 05 0F 32 02 0E 00    33    .db  0x05, 0x05, 0x0f, 0x32, 0x02, 0x0e, 0x00, 0xe8, 0x0f, 0x0e, 0x3c, 0x05, 0x0a, 0xd1, 0x07, 0x00
             E8 0F 0E 3C 05 0A D1
             07 00
    00005013 00 46 03 01 00 08 6B    34    .db  0x00, 0x46, 0x03, 0x01, 0x00, 0x08, 0x6b, 0x05
             05
                                     35 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000037    36 _spider_0_end == . - 1
                                     37 
                                     38 ;; File 'out/spider_10.h.s' generated using cpct_pack
                                     39 ;; Compresor used:   zx7b
                                     40 ;; Files compressed: [ 'dat/spider_10.bin' ]
                                     41 ;; Uncompressed:     256 bytes
                                     42 ;; Compressed:       74 bytes
                                     43 ;; Space saved:      182 bytes
                                     44 ;;
                                     45 
                                     46 ;; Declaration of the compressed array and
                                     47 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                     48 .globl _spider_10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 2
Hexadecimal [32-Bits]



                                     49 .globl _spider_10_end
                                     50 
                                     51 ;; Compressed and uncompressed sizes
                         0000004A    52 _spider_10_size_z == 74
                         00000100    53 _spider_10_size   == 256
                                     54 
                                     55 
                                     56 ;; File 'out/spider_10.s' generated using cpct_pack
                                     57 ;; Compresor used:   zx7b
                                     58 ;; Files compressed: [ 'dat/spider_10.bin' ]
                                     59 ;; Uncompressed:     256 bytes
                                     60 ;; Compressed:       74 bytes
                                     61 ;; Space saved:      182 bytes
                                     62 ;;
                                     63 
                                     64 ;; Data array definition
    0000501B                         65 _spider_10::
    0000501B AB AA 00 0E 16 07 07    66    .db  0xab, 0xaa, 0x00, 0x0e, 0x16, 0x07, 0x07, 0x05, 0x00, 0x1d, 0xf1, 0x08, 0x23, 0x18, 0xe8, 0x0f
             05 00 1D F1 08 23 18
             E8 0F
    0000502B 00 47 03 59 06 08 3B    67    .db  0x00, 0x47, 0x03, 0x59, 0x06, 0x08, 0x3b, 0x02, 0x05, 0x05, 0x0f, 0x48, 0x4c, 0x0b, 0x06, 0x0f
             02 05 05 0F 48 4C 0B
             06 0F
    0000503B DF 15 0E 3E 0A 02 0F    68    .db  0xdf, 0x15, 0x0e, 0x3e, 0x0a, 0x02, 0x0f, 0xae, 0x0a, 0xd0, 0x20, 0x02, 0x04, 0x0f, 0xf7, 0x03
             AE 0A D0 20 02 04 0F
             F7 03
    0000504B 0A 9E 01 03 04 7A 08    69    .db  0x0a, 0x9e, 0x01, 0x03, 0x04, 0x7a, 0x08, 0x0f, 0x35, 0x04, 0x06, 0x06, 0x0f, 0x4a, 0x04, 0x71
             0F 35 04 06 06 0F 4A
             04 71
    0000505B 02 04 01 7D 02 01 00    70    .db  0x02, 0x04, 0x01, 0x7d, 0x02, 0x01, 0x00, 0xac, 0x82, 0x00
             AC 82 00
                                     71 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000081    72 _spider_10_end == . - 1
                                     73 
                                     74 ;; File 'out/spider_11.h.s' generated using cpct_pack
                                     75 ;; Compresor used:   zx7b
                                     76 ;; Files compressed: [ 'dat/spider_11.bin' ]
                                     77 ;; Uncompressed:     256 bytes
                                     78 ;; Compressed:       84 bytes
                                     79 ;; Space saved:      172 bytes
                                     80 ;;
                                     81 
                                     82 ;; Declaration of the compressed array and
                                     83 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                     84 .globl _spider_11
                                     85 .globl _spider_11_end
                                     86 
                                     87 ;; Compressed and uncompressed sizes
                         00000054    88 _spider_11_size_z == 84
                         00000100    89 _spider_11_size   == 256
                                     90 
                                     91 
                                     92 ;; File 'out/spider_11.s' generated using cpct_pack
                                     93 ;; Compresor used:   zx7b
                                     94 ;; Files compressed: [ 'dat/spider_11.bin' ]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 3
Hexadecimal [32-Bits]



                                     95 ;; Uncompressed:     256 bytes
                                     96 ;; Compressed:       84 bytes
                                     97 ;; Space saved:      172 bytes
                                     98 ;;
                                     99 
                                    100 ;; Data array definition
    00005065                        101 _spider_11::
    00005065 58 55 00 2F 7D 08 3F   102    .db  0x58, 0x55, 0x00, 0x2f, 0x7d, 0x08, 0x3f, 0x7c, 0x63, 0x1f, 0xdc, 0x1e, 0x74, 0x4f, 0x5e, 0x1f
             7C 63 1F DC 1E 74 4F
             5E 1F
    00005075 03 0F 03 0F 2D 02 10   103    .db  0x03, 0x0f, 0x03, 0x0f, 0x2d, 0x02, 0x10, 0x94, 0x00, 0x07, 0x5d, 0xfb, 0x10, 0x11, 0xf8, 0x10
             94 00 07 5D FB 10 11
             F8 10
    00005085 89 00 0A 06 04 06 00   104    .db  0x89, 0x00, 0x0a, 0x06, 0x04, 0x06, 0x00, 0xc6, 0x08, 0x30, 0x68, 0x03, 0x0f, 0x03, 0xdf, 0x11
             C6 08 30 68 03 0F 03
             DF 11
    00005095 04 0F FC 08 04 08 08   105    .db  0x04, 0x0f, 0xfc, 0x08, 0x04, 0x08, 0x08, 0x35, 0x0a, 0x04, 0x04, 0x08, 0x0f, 0x8b, 0x06, 0x06
             35 0A 04 04 08 0F 8B
             06 06
    000050A5 00 64 0E 00 73 0A 0F   106    .db  0x00, 0x64, 0x0e, 0x00, 0x73, 0x0a, 0x0f, 0x77, 0x0e, 0x5c, 0x04, 0x03, 0x01, 0x5f, 0x02, 0x01
             77 0E 5C 04 03 01 5F
             02 01
    000050B5 00 A4 88 00            107    .db  0x00, 0xa4, 0x88, 0x00
                                    108 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000000D5   109 _spider_11_end == . - 1
                                    110 
                                    111 ;; File 'out/spider_1.h.s' generated using cpct_pack
                                    112 ;; Compresor used:   zx7b
                                    113 ;; Files compressed: [ 'dat/spider_1.bin' ]
                                    114 ;; Uncompressed:     256 bytes
                                    115 ;; Compressed:       56 bytes
                                    116 ;; Space saved:      200 bytes
                                    117 ;;
                                    118 
                                    119 ;; Declaration of the compressed array and
                                    120 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    121 .globl _spider_1
                                    122 .globl _spider_1_end
                                    123 
                                    124 ;; Compressed and uncompressed sizes
                         00000038   125 _spider_1_size_z == 56
                         00000100   126 _spider_1_size   == 256
                                    127 
                                    128 
                                    129 ;; File 'out/spider_1.s' generated using cpct_pack
                                    130 ;; Compresor used:   zx7b
                                    131 ;; Files compressed: [ 'dat/spider_1.bin' ]
                                    132 ;; Uncompressed:     256 bytes
                                    133 ;; Compressed:       56 bytes
                                    134 ;; Space saved:      200 bytes
                                    135 ;;
                                    136 
                                    137 ;; Data array definition
    000050B9                        138 _spider_1::
    000050B9 C0 AA 00 6A AA 00 45   139    .db  0xc0, 0xaa, 0x00, 0x6a, 0xaa, 0x00, 0x45, 0x28, 0x0f, 0x0c, 0x11, 0x10, 0x3d, 0x00, 0x10, 0x51
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 4
Hexadecimal  28-Bits]



             28 0F 0C 11 10 3D 00
             10 51
    000050C1 0F 0C 11 10 3D 00 10   140    .db  0x0f, 0xea, 0x00, 0x05, 0x0b, 0x11, 0x3b, 0x0f, 0x07, 0x57, 0x00, 0x10, 0xe3, 0x0f, 0x05, 0x10
             51 0F EA 00 05 0B 11
             3B 0F
    000050D1 07 57 00 10 E3 0F 05   141    .db  0xa9, 0x00, 0x50, 0x07, 0x10, 0x12, 0x0f, 0x47, 0x00, 0x5c, 0x0f, 0x00, 0xc7, 0x06, 0x00, 0x01
             10 A9 00 50 07 10 12
             0F 47
    000050E1 00 5C 0F 00 C7 06 00   142    .db  0x7c, 0x08, 0x06, 0x08, 0x01, 0x00, 0x90, 0x00
             01
                                    143 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         0000010D   144 _spider_1_end == . - 1
                                    145 
                                    146 ;; File 'out/spider_2.h.s' generated using cpct_pack
                                    147 ;; Compresor used:   zx7b
                                    148 ;; Files compressed: [ 'dat/spider_2.bin' ]
                                    149 ;; Uncompressed:     256 bytes
                                    150 ;; Compressed:       56 bytes
                                    151 ;; Space saved:      200 bytes
                                    152 ;;
                                    153 
                                    154 ;; Declaration of the compressed array and
                                    155 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    156 .globl _spider_2
                                    157 .globl _spider_2_end
                                    158 
                                    159 ;; Compressed and uncompressed sizes
                         00000038   160 _spider_2_size_z == 56
                         00000100   161 _spider_2_size   == 256
                                    162 
                                    163 
                                    164 ;; File 'out/spider_2.s' generated using cpct_pack
                                    165 ;; Compresor used:   zx7b
                                    166 ;; Files compressed: [ 'dat/spider_2.bin' ]
                                    167 ;; Uncompressed:     256 bytes
                                    168 ;; Compressed:       56 bytes
                                    169 ;; Space saved:      200 bytes
                                    170 ;;
                                    171 
                                    172 ;; Data array definition
    0000010E                        173 _spider_2::
    000050E9 7C 08 06 08 01 00 90   174    .db  0xb0, 0xaa, 0x00, 0x3a, 0xa8, 0x0d, 0x0b, 0xee, 0x00, 0x0e, 0x06, 0x01, 0x10, 0x0f, 0xe5, 0x0e
             00 00 0E 06 01 10 0F
             E5 0E
    000050F1 83 4F 1E EB 0C 0F 7A   175    .db  0x83, 0x4f, 0x1e, 0xeb, 0x0c, 0x0f, 0x7a, 0x10, 0xe2, 0x0f, 0x38, 0x10, 0xb8, 0x0f, 0x8b, 0x02
             10 E2 0F 38 10 B8 0F
             8B 02
    000050F1 B0 AA 00 3A A8 0D 0B   176    .db  0x02, 0x12, 0x0c, 0x3e, 0x00, 0x0e, 0x5f, 0x05, 0x00, 0x0f, 0x9d, 0x00, 0x00, 0x01, 0x21, 0x08
             EE 00 0E 06 01 10 0F
             E5 0E
    00005101 83 4F 1E EB 0C 0F 7A   177    .db  0x02, 0x02, 0x08, 0x08, 0x07, 0x07, 0x06, 0x05
             10
                                    178 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000145   179 _spider_2_end == . - 1
                                    180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 5
Hexadecimal [32-Bits]



                                    181 ;; File 'out/spider_3.h.s' generated using cpct_pack
                                    182 ;; Compresor used:   zx7b
                                    183 ;; Files compressed: [ 'dat/spider_3.bin' ]
                                    184 ;; Uncompressed:     256 bytes
                                    185 ;; Compressed:       48 bytes
                                    186 ;; Space saved:      208 bytes
                                    187 ;;
                                    188 
                                    189 ;; Declaration of the compressed array and
                                    190 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    191 .globl _spider_3
                                    192 .globl _spider_3_end
                                    193 
                                    194 ;; Compressed and uncompressed sizes
                         00000030   195 _spider_3_size_z == 48
                         00000100   196 _spider_3_size   == 256
                                    197 
                                    198 
                                    199 ;; File 'out/spider_3.s' generated using cpct_pack
                                    200 ;; Compresor used:   zx7b
                                    201 ;; Files compressed: [ 'dat/spider_3.bin' ]
                                    202 ;; Uncompressed:     256 bytes
                                    203 ;; Compressed:       48 bytes
                                    204 ;; Space saved:      208 bytes
                                    205 ;;
                                    206 
                                    207 ;; Data array definition
    00000146                        208 _spider_3::
    00005109 E2 0F 38 10 B8 0F 8B   209    .db  0x80, 0x55, 0x00, 0xd5, 0x54, 0x00, 0x11, 0xd4, 0x0f, 0x86, 0x11, 0x10, 0xbe, 0x00, 0x10, 0x28
             02 02 12 0C 3E 00 0E
             5F 05
    00005119 00 0F 9D 00 00 01 21   210    .db  0x1f, 0x1e, 0xf5, 0x07, 0x07, 0x12, 0x0f, 0xd9, 0x07, 0x05, 0x00, 0x94, 0x10, 0x0f, 0xf1, 0x05
             08 02 02 08 08 07 07
             06 05
    00005129 10 54 00 05 28 10 89   211    .db  0x10, 0x54, 0x00, 0x05, 0x28, 0x10, 0x89, 0x0f, 0x0b, 0x00, 0x0e, 0x08, 0x01, 0x00, 0x92, 0x00
             0F 0B 00 0E 08 01 00
             92 00
                                    212 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000175   213 _spider_3_end == . - 1
                                    214 
                                    215 ;; File 'out/spider_4.h.s' generated using cpct_pack
                                    216 ;; Compresor used:   zx7b
                                    217 ;; Files compressed: [ 'dat/spider_4.bin' ]
                                    218 ;; Uncompressed:     256 bytes
                                    219 ;; Compressed:       49 bytes
                                    220 ;; Space saved:      207 bytes
                                    221 ;;
                                    222 
                                    223 ;; Declaration of the compressed array and
                                    224 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    225 .globl _spider_4
                                    226 .globl _spider_4_end
                                    227 
                                    228 ;; Compressed and uncompressed sizes
                         00000031   229 _spider_4_size_z == 49
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 6
Hexadecimal [32-Bits]



                         00000100   230 _spider_4_size   == 256
                                    231 
                                    232 
                                    233 ;; File 'out/spider_4.s' generated using cpct_pack
                                    234 ;; Compresor used:   zx7b
                                    235 ;; Files compressed: [ 'dat/spider_4.bin' ]
                                    236 ;; Uncompressed:     256 bytes
                                    237 ;; Compressed:       49 bytes
                                    238 ;; Space saved:      207 bytes
                                    239 ;;
                                    240 
                                    241 ;; Data array definition
    00000176                        242 _spider_4::
    00005129 80 55 00 D5 54 00 11   243    .db  0xc0, 0xaa, 0x00, 0xea, 0x20, 0x0d, 0xe0, 0x0b, 0x00, 0x0e, 0x6e, 0x01, 0x10, 0x50, 0x0f, 0x0e
             D4 0F 86 11 10 BE 00
             10 28
    00005139 1F 1E F5 07 07 12 0F   244    .db  0x1e, 0x4f, 0x38, 0x00, 0x0e, 0x5a, 0x10, 0x0f, 0x37, 0x10, 0x71, 0x0f, 0x1c, 0x10, 0x0f, 0xdc
             D9 07 05 00 94 10 0F
             F1 05
    00005149 10 54 00 05 28 10 89   245    .db  0x02, 0x45, 0x02, 0x12, 0x0c, 0x9f, 0x00, 0x00, 0x01, 0x23, 0x08, 0x08, 0x05, 0x00, 0x07, 0x48
             0F 0B 00 0E 08 01 00
             92 00
    00005159 05                     246    .db  0x05
                                    247 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000001A6   248 _spider_4_end == . - 1
                                    249 
                                    250 ;; File 'out/spider_5.h.s' generated using cpct_pack
                                    251 ;; Compresor used:   zx7b
                                    252 ;; Files compressed: [ 'dat/spider_5.bin' ]
                                    253 ;; Uncompressed:     256 bytes
                                    254 ;; Compressed:       43 bytes
                                    255 ;; Space saved:      213 bytes
                                    256 ;;
                                    257 
                                    258 ;; Declaration of the compressed array and
                                    259 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    260 .globl _spider_5
                                    261 .globl _spider_5_end
                                    262 
                                    263 ;; Compressed and uncompressed sizes
                         0000002B   264 _spider_5_size_z == 43
                         00000100   265 _spider_5_size   == 256
                                    266 
                                    267 
                                    268 ;; File 'out/spider_5.s' generated using cpct_pack
                                    269 ;; Compresor used:   zx7b
                                    270 ;; Files compressed: [ 'dat/spider_5.bin' ]
                                    271 ;; Uncompressed:     256 bytes
                                    272 ;; Compressed:       43 bytes
                                    273 ;; Space saved:      213 bytes
                                    274 ;;
                                    275 
                                    276 ;; Data array definition
    000001A7                        277 _spider_5::
    00005159 C0 AA 00 EA 20 0D E0   278    .db  0x56, 0x55, 0x00, 0x53, 0x00, 0x55, 0x11, 0x0f, 0x1b, 0x11, 0x10, 0xfa, 0x0f, 0xa1, 0x07, 0x07
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 7
Hexadecimal  0B-Bits]



             0F 1B 11 10 FA 0F A1
             07 07
    00005161 00 0E 6E 01 10 50 0F   279    .db  0x13, 0x8c, 0x1f, 0x05, 0x00, 0xa9, 0x10, 0x31, 0x00, 0x07, 0x05, 0x10, 0x45, 0x00, 0x05, 0x28
             0E 1E 4F 38 00 0E 5A
             10 0F
    00005171 37 10 71 0F 1C 10 0F   280    .db  0x10, 0x89, 0x0f, 0x0b, 0x00, 0x0e, 0x08, 0x01, 0x00, 0x92, 0x00
             DC 02 45 02
                                    281 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000001D1   282 _spider_5_end == . - 1
                                    283 
                                    284 ;; File 'out/spider_6.h.s' generated using cpct_pack
                                    285 ;; Compresor used:   zx7b
                                    286 ;; Files compressed: [ 'dat/spider_6.bin' ]
                                    287 ;; Uncompressed:     256 bytes
                                    288 ;; Compressed:       69 bytes
                                    289 ;; Space saved:      187 bytes
                                    290 ;;
                                    291 
                                    292 ;; Declaration of the compressed array and
                                    293 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    294 .globl _spider_6
                                    295 .globl _spider_6_end
                                    296 
                                    297 ;; Compressed and uncompressed sizes
                         00000045   298 _spider_6_size_z == 69
                         00000100   299 _spider_6_size   == 256
                                    300 
                                    301 
                                    302 ;; File 'out/spider_6.s' generated using cpct_pack
                                    303 ;; Compresor used:   zx7b
                                    304 ;; Files compressed: [ 'dat/spider_6.bin' ]
                                    305 ;; Uncompressed:     256 bytes
                                    306 ;; Compressed:       69 bytes
                                    307 ;; Space saved:      187 bytes
                                    308 ;;
                                    309 
                                    310 ;; Data array definition
    000001D2                        311 _spider_6::
    0000517C 12 0C 9F 00 00 01 23   312    .db  0xab, 0xaa, 0xae, 0x30, 0x03, 0x29, 0xee, 0x0e, 0x05, 0x0f, 0x0e, 0x7b, 0x19, 0x70, 0x8e, 0x48
             08 08 05 00 07 48 05
             8E 48
    0000518A 03 0F 0E F7 0F 35 2D   313    .db  0x03, 0x0f, 0x0e, 0xf7, 0x0f, 0x35, 0x2d, 0xdf, 0x45, 0x0b, 0xf1, 0x1f, 0x08, 0x3f, 0x0e, 0xf7
             DF 45 0B F1 1F 08 3F
             0E F7
    0000518A 56 55 00 53 00 55 11   314    .db  0x0f, 0xba, 0x04, 0x0f, 0x8f, 0x1e, 0x0f, 0x87, 0x08, 0x1e, 0x4a, 0x0f, 0x03, 0x06, 0x3f, 0x08
             0F 1B 11 10 FA 0F A1
             07 07
    0000519A 13 8C 1F 05 00 A9 10   315    .db  0x0e, 0x0f, 0xbd, 0x03, 0x06, 0x9e, 0x06, 0x0f, 0x46, 0x01, 0x09, 0x3d, 0x04, 0x01, 0x4c, 0x02
             31 00 07 05 10 45 00
             05 28
    000051AA 10 89 0F 0B 00         316    .db  0x01, 0x00, 0xac, 0x82, 0x00
                                    317 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000216   318 _spider_6_end == . - 1
                                    319 
                                    320 ;; File 'out/spider_7.h.s' generated using cpct_pack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 8
Hexadecimal [32-Bits]



                                    321 ;; Compresor used:   zx7b
                                    322 ;; Files compressed: [ 'dat/spider_7.bin' ]
                                    323 ;; Uncompressed:     256 bytes
                                    324 ;; Compressed:       79 bytes
                                    325 ;; Space saved:      177 bytes
                                    326 ;;
                                    327 
                                    328 ;; Declaration of the compressed array and
                                    329 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    330 .globl _spider_7
                                    331 .globl _spider_7_end
                                    332 
                                    333 ;; Compressed and uncompressed sizes
                         0000004F   334 _spider_7_size_z == 79
                         00000100   335 _spider_7_size   == 256
                                    336 
                                    337 
                                    338 ;; File 'out/spider_7.s' generated using cpct_pack
                                    339 ;; Compresor used:   zx7b
                                    340 ;; Files compressed: [ 'dat/spider_7.bin' ]
                                    341 ;; Uncompressed:     256 bytes
                                    342 ;; Compressed:       79 bytes
                                    343 ;; Space saved:      177 bytes
                                    344 ;;
                                    345 
                                    346 ;; Data array definition
    00000217                        347 _spider_7::
    000051AF 0E 08 01 00 92 00 DD   348    .db  0x80, 0x55, 0x63, 0xd5, 0x00, 0x0f, 0xdd, 0x7c, 0x00, 0xc7, 0x2d, 0x0f, 0x5f, 0x02, 0x10, 0x2c
             7C 00 C7 2D 0F 5F 02
             10 2C
    000051B5 F4 03 07 03 60 DA 06   349    .db  0xf4, 0x03, 0x07, 0x03, 0x60, 0xda, 0x06, 0x11, 0x10, 0xe8, 0x2f, 0xc1, 0x06, 0x04, 0x06, 0x00
             11 10 E8 2F C1 06 04
             06 00
    000051B5 AB AA AE 30 03 29 EE   350    .db  0xc5, 0x10, 0x98, 0x0f, 0x14, 0x00, 0xfb, 0x03, 0x04, 0x0a, 0x0f, 0xe9, 0x0b, 0x0f, 0x08, 0x7d
             0E 05 0F 0E 7B 19 70
             8E 48
    000051C5 03 0F 0E F7 0F 35 2D   351    .db  0x08, 0x09, 0x0a, 0x04, 0x04, 0x08, 0x1e, 0x0f, 0x06, 0x13, 0x69, 0x2a, 0x01, 0x47, 0x0a, 0x0f
             DF 45 0B F1 1F 08 3F
             0E F7
    000051D5 0F BA 04 0F 8F 1E 0F   352    .db  0x0f, 0x0e, 0x06, 0x0f, 0xa6, 0x01, 0x03, 0x01, 0x5a, 0x02, 0x01, 0x00, 0xa4, 0x88, 0x00
             87 08 1E 4A 0F 03 06
             3F
                                    353 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000265   354 _spider_7_end == . - 1
                                    355 
                                    356 ;; File 'out/spider_8.h.s' generated using cpct_pack
                                    357 ;; Compresor used:   zx7b
                                    358 ;; Files compressed: [ 'dat/spider_8.bin' ]
                                    359 ;; Uncompressed:     256 bytes
                                    360 ;; Compressed:       81 bytes
                                    361 ;; Space saved:      175 bytes
                                    362 ;;
                                    363 
                                    364 ;; Declaration of the compressed array and
                                    365 ;; the address of the latest byte of the compressed array (for unpacking purposes)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 9
Hexadecimal [32-Bits]



                                    366 .globl _spider_8
                                    367 .globl _spider_8_end
                                    368 
                                    369 ;; Compressed and uncompressed sizes
                         00000051   370 _spider_8_size_z == 81
                         00000100   371 _spider_8_size   == 256
                                    372 
                                    373 
                                    374 ;; File 'out/spider_8.s' generated using cpct_pack
                                    375 ;; Compresor used:   zx7b
                                    376 ;; Files compressed: [ 'dat/spider_8.bin' ]
                                    377 ;; Uncompressed:     256 bytes
                                    378 ;; Compressed:       81 bytes
                                    379 ;; Space saved:      175 bytes
                                    380 ;;
                                    381 
                                    382 ;; Data array definition
    00000266                        383 _spider_8::
    000051E4 08 0E 0F BD 03 06 9E   384    .db  0xc0, 0xaa, 0x00, 0xea, 0x2d, 0x08, 0x23, 0xa3, 0x28, 0x05, 0x0e, 0x00, 0xf7, 0x6d, 0x02, 0x0f
             06 0F 46 01 09 3D 04
             01 4C
    000051F4 02 01 00 AC 82 00 63   385    .db  0xfb, 0x1d, 0x02, 0x05, 0x05, 0x0f, 0x63, 0x03, 0x0e, 0x3c, 0x06, 0x0f, 0x8d, 0x1e, 0x46, 0xe3
             03 0E 3C 06 0F 8D 1E
             46 E3
    000051FA 04 00 0F 15 FF 0F 23   386    .db  0x04, 0x00, 0x0f, 0x15, 0xff, 0x0f, 0x23, 0x0a, 0xfb, 0x20, 0x02, 0x0f, 0x6e, 0x0a, 0x4d, 0x04
             0A FB 20 02 0F 6E 0A
             4D 04
    000051FA 80 55 63 D5 00 0F DD   387    .db  0x0f, 0x0f, 0x13, 0x0a, 0x4f, 0x02, 0x03, 0x09, 0x04, 0xfd, 0x0e, 0x04, 0x08, 0x0f, 0x6f, 0x06
             7C 00 C7 2D 0F 5F 02
             10 2C
    0000520A F4 03 07 03 60 DA 06   388    .db  0x04, 0xb4, 0x06, 0x0f, 0x4a, 0x04, 0x71, 0x02, 0x04, 0x01, 0x7d, 0x02, 0x01, 0x00, 0xac, 0x82
             11 10 E8 2F C1 06 04
             06 00
    0000521A C5                     389    .db  0x00
                                    390 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000002B6   391 _spider_8_end == . - 1
                                    392 
                                    393 ;; File 'out/spider_9.h.s' generated using cpct_pack
                                    394 ;; Compresor used:   zx7b
                                    395 ;; Files compressed: [ 'dat/spider_9.bin' ]
                                    396 ;; Uncompressed:     256 bytes
                                    397 ;; Compressed:       82 bytes
                                    398 ;; Space saved:      174 bytes
                                    399 ;;
                                    400 
                                    401 ;; Declaration of the compressed array and
                                    402 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    403 .globl _spider_9
                                    404 .globl _spider_9_end
                                    405 
                                    406 ;; Compressed and uncompressed sizes
                         00000052   407 _spider_9_size_z == 82
                         00000100   408 _spider_9_size   == 256
                                    409 
                                    410 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 10
Hexadecimal [32-Bits]



                                    411 ;; File 'out/spider_9.s' generated using cpct_pack
                                    412 ;; Compresor used:   zx7b
                                    413 ;; Files compressed: [ 'dat/spider_9.bin' ]
                                    414 ;; Uncompressed:     256 bytes
                                    415 ;; Compressed:       82 bytes
                                    416 ;; Space saved:      174 bytes
                                    417 ;;
                                    418 
                                    419 ;; Data array definition
    000002B7                        420 _spider_9::
    0000521B 10 98 0F 14 00 FB 03   421    .db  0xac, 0xaa, 0x00, 0x2f, 0x3e, 0x08, 0x3f, 0x3e, 0x63, 0x1f, 0x6e, 0x1e, 0xba, 0x4f, 0x1f, 0x10
             04 0A 0F E9 0B 0F 08
             7D 08
    0000522B 09 0A 04 04 08 1E 0F   422    .db  0xbf, 0x03, 0x0f, 0x03, 0x0f, 0x16, 0x02, 0x10, 0x00, 0xca, 0x07, 0x5c, 0x7d, 0x10, 0x11, 0x10
             06 13 69 2A 01 47 0A
             0F 0F
    0000523B 0E 06 0F A6 01 03 01   423    .db  0xfc, 0x0f, 0xc1, 0x06, 0x04, 0x06, 0x00, 0xc5, 0x08, 0x30, 0x68, 0x0b, 0x14, 0x00, 0x03, 0xff
             5A 02 01 00 A4 88 00
             03 FF
    00005249 04 0A 0F F4 08 08 09   424    .db  0x04, 0x0a, 0x0f, 0xf4, 0x08, 0x08, 0x09, 0xca, 0x0a, 0x04, 0x04, 0x08, 0x0f, 0x23, 0x06, 0x04
             CA 0A 04 04 08 0F 23
             06 04
    00005249 C0 AA 00 EA 2D 08 23   425    .db  0x00, 0x1a, 0xfd, 0x00, 0x09, 0xf8, 0x0f, 0xa6, 0x01, 0x03, 0x01, 0x5a, 0x02, 0x01, 0x00, 0xa4
             A3 28 05 0E 00 F7 6D
             02 0F
    00005259 FB 1D                  426    .db  0x88, 0x00
                                    427 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000308   428 _spider_9_end == . - 1
                                    429 
                                    430 ;; File 'out/spider_0.h.s' generated using cpct_pack
                                    431 ;; Compresor used:   zx7b
                                    432 ;; Files compressed: [ 'dat/spider_0.bin' ]
                                    433 ;; Uncompressed:     256 bytes
                                    434 ;; Compressed:       56 bytes
                                    435 ;; Space saved:      200 bytes
                                    436 ;;
                                    437 
                                    438 ;; Declaration of the compressed array and
                                    439 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    440 .globl _spider_0
                                    441 .globl _spider_0_end
                                    442 
                                    443 ;; Compressed and uncompressed sizes
                         00000038   444 _spider_0_size_z == 56
                         00000100   445 _spider_0_size   == 256
                                    446 
                                    447 
                                    448 ;; File 'out/spider_10.h.s' generated using cpct_pack
                                    449 ;; Compresor used:   zx7b
                                    450 ;; Files compressed: [ 'dat/spider_10.bin' ]
                                    451 ;; Uncompressed:     256 bytes
                                    452 ;; Compressed:       74 bytes
                                    453 ;; Space saved:      182 bytes
                                    454 ;;
                                    455 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 11
Hexadecimal [32-Bits]



                                    456 ;; Declaration of the compressed array and
                                    457 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    458 .globl _spider_10
                                    459 .globl _spider_10_end
                                    460 
                                    461 ;; Compressed and uncompressed sizes
                         0000004A   462 _spider_10_size_z == 74
                         00000100   463 _spider_10_size   == 256
                                    464 
                                    465 
                                    466 ;; File 'out/spider_11.h.s' generated using cpct_pack
                                    467 ;; Compresor used:   zx7b
                                    468 ;; Files compressed: [ 'dat/spider_11.bin' ]
                                    469 ;; Uncompressed:     256 bytes
                                    470 ;; Compressed:       84 bytes
                                    471 ;; Space saved:      172 bytes
                                    472 ;;
                                    473 
                                    474 ;; Declaration of the compressed array and
                                    475 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    476 .globl _spider_11
                                    477 .globl _spider_11_end
                                    478 
                                    479 ;; Compressed and uncompressed sizes
                         00000054   480 _spider_11_size_z == 84
                         00000100   481 _spider_11_size   == 256
                                    482 
                                    483 
                                    484 ;; File 'out/spider_1.h.s' generated using cpct_pack
                                    485 ;; Compresor used:   zx7b
                                    486 ;; Files compressed: [ 'dat/spider_1.bin' ]
                                    487 ;; Uncompressed:     256 bytes
                                    488 ;; Compressed:       56 bytes
                                    489 ;; Space saved:      200 bytes
                                    490 ;;
                                    491 
                                    492 ;; Declaration of the compressed array and
                                    493 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    494 .globl _spider_1
                                    495 .globl _spider_1_end
                                    496 
                                    497 ;; Compressed and uncompressed sizes
                         00000038   498 _spider_1_size_z == 56
                         00000100   499 _spider_1_size   == 256
                                    500 
                                    501 
                                    502 ;; File 'out/spider_2.h.s' generated using cpct_pack
                                    503 ;; Compresor used:   zx7b
                                    504 ;; Files compressed: [ 'dat/spider_2.bin' ]
                                    505 ;; Uncompressed:     256 bytes
                                    506 ;; Compressed:       56 bytes
                                    507 ;; Space saved:      200 bytes
                                    508 ;;
                                    509 
                                    510 ;; Declaration of the compressed array and
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 12
Hexadecimal [32-Bits]



                                    511 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    512 .globl _spider_2
                                    513 .globl _spider_2_end
                                    514 
                                    515 ;; Compressed and uncompressed sizes
                         00000038   516 _spider_2_size_z == 56
                         00000100   517 _spider_2_size   == 256
                                    518 
                                    519 
                                    520 ;; File 'out/spider_3.h.s' generated using cpct_pack
                                    521 ;; Compresor used:   zx7b
                                    522 ;; Files compressed: [ 'dat/spider_3.bin' ]
                                    523 ;; Uncompressed:     256 bytes
                                    524 ;; Compressed:       48 bytes
                                    525 ;; Space saved:      208 bytes
                                    526 ;;
                                    527 
                                    528 ;; Declaration of the compressed array and
                                    529 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    530 .globl _spider_3
                                    531 .globl _spider_3_end
                                    532 
                                    533 ;; Compressed and uncompressed sizes
                         00000030   534 _spider_3_size_z == 48
                         00000100   535 _spider_3_size   == 256
                                    536 
                                    537 
                                    538 ;; File 'out/spider_4.h.s' generated using cpct_pack
                                    539 ;; Compresor used:   zx7b
                                    540 ;; Files compressed: [ 'dat/spider_4.bin' ]
                                    541 ;; Uncompressed:     256 bytes
                                    542 ;; Compressed:       49 bytes
                                    543 ;; Space saved:      207 bytes
                                    544 ;;
                                    545 
                                    546 ;; Declaration of the compressed array and
                                    547 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    548 .globl _spider_4
                                    549 .globl _spider_4_end
                                    550 
                                    551 ;; Compressed and uncompressed sizes
                         00000031   552 _spider_4_size_z == 49
                         00000100   553 _spider_4_size   == 256
                                    554 
                                    555 
                                    556 ;; File 'out/spider_5.h.s' generated using cpct_pack
                                    557 ;; Compresor used:   zx7b
                                    558 ;; Files compressed: [ 'dat/spider_5.bin' ]
                                    559 ;; Uncompressed:     256 bytes
                                    560 ;; Compressed:       43 bytes
                                    561 ;; Space saved:      213 bytes
                                    562 ;;
                                    563 
                                    564 ;; Declaration of the compressed array and
                                    565 ;; the address of the latest byte of the compressed array (for unpacking purposes)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 13
Hexadecimal [32-Bits]



                                    566 .globl _spider_5
                                    567 .globl _spider_5_end
                                    568 
                                    569 ;; Compressed and uncompressed sizes
                         0000002B   570 _spider_5_size_z == 43
                         00000100   571 _spider_5_size   == 256
                                    572 
                                    573 
                                    574 ;; File 'out/spider_6.h.s' generated using cpct_pack
                                    575 ;; Compresor used:   zx7b
                                    576 ;; Files compressed: [ 'dat/spider_6.bin' ]
                                    577 ;; Uncompressed:     256 bytes
                                    578 ;; Compressed:       69 bytes
                                    579 ;; Space saved:      187 bytes
                                    580 ;;
                                    581 
                                    582 ;; Declaration of the compressed array and
                                    583 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    584 .globl _spider_6
                                    585 .globl _spider_6_end
                                    586 
                                    587 ;; Compressed and uncompressed sizes
                         00000045   588 _spider_6_size_z == 69
                         00000100   589 _spider_6_size   == 256
                                    590 
                                    591 
                                    592 ;; File 'out/spider_7.h.s' generated using cpct_pack
                                    593 ;; Compresor used:   zx7b
                                    594 ;; Files compressed: [ 'dat/spider_7.bin' ]
                                    595 ;; Uncompressed:     256 bytes
                                    596 ;; Compressed:       79 bytes
                                    597 ;; Space saved:      177 bytes
                                    598 ;;
                                    599 
                                    600 ;; Declaration of the compressed array and
                                    601 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    602 .globl _spider_7
                                    603 .globl _spider_7_end
                                    604 
                                    605 ;; Compressed and uncompressed sizes
                         0000004F   606 _spider_7_size_z == 79
                         00000100   607 _spider_7_size   == 256
                                    608 
                                    609 
                                    610 ;; File 'out/spider_8.h.s' generated using cpct_pack
                                    611 ;; Compresor used:   zx7b
                                    612 ;; Files compressed: [ 'dat/spider_8.bin' ]
                                    613 ;; Uncompressed:     256 bytes
                                    614 ;; Compressed:       81 bytes
                                    615 ;; Space saved:      175 bytes
                                    616 ;;
                                    617 
                                    618 ;; Declaration of the compressed array and
                                    619 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    620 .globl _spider_8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 14
Hexadecimal [32-Bits]



                                    621 .globl _spider_8_end
                                    622 
                                    623 ;; Compressed and uncompressed sizes
                         00000051   624 _spider_8_size_z == 81
                         00000100   625 _spider_8_size   == 256
                                    626 
                                    627 
                                    628 ;; File 'out/spider_9.h.s' generated using cpct_pack
                                    629 ;; Compresor used:   zx7b
                                    630 ;; Files compressed: [ 'dat/spider_9.bin' ]
                                    631 ;; Uncompressed:     256 bytes
                                    632 ;; Compressed:       82 bytes
                                    633 ;; Space saved:      174 bytes
                                    634 ;;
                                    635 
                                    636 ;; Declaration of the compressed array and
                                    637 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    638 .globl _spider_9
                                    639 .globl _spider_9_end
                                    640 
                                    641 ;; Compressed and uncompressed sizes
                         00000052   642 _spider_9_size_z == 82
                         00000100   643 _spider_9_size   == 256
                                    644 
                                    645 
