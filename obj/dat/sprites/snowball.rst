ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 1
Hexadecimal [32-Bits]



                                      1 .area SPRITES
                                      2 
                                      3 ;; File 'out/snowball_0.h.s' generated using cpct_pack
                                      4 ;; Compresor used:   zx7b
                                      5 ;; Files compressed: [ 'dat/snowball_0.bin' ]
                                      6 ;; Uncompressed:     256 bytes
                                      7 ;; Compressed:       61 bytes
                                      8 ;; Space saved:      195 bytes
                                      9 ;;
                                     10 
                                     11 ;; Declaration of the compressed array and
                                     12 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                     13 .globl _snowball_0
                                     14 .globl _snowball_0_end
                                     15 
                                     16 ;; Compressed and uncompressed sizes
                         0000003D    17 _snowball_0_size_z == 61
                         00000100    18 _snowball_0_size   == 256
                                     19 
                                     20 
                                     21 ;; File 'out/snowball_0.s' generated using cpct_pack
                                     22 ;; Compresor used:   zx7b
                                     23 ;; Files compressed: [ 'dat/snowball_0.bin' ]
                                     24 ;; Uncompressed:     256 bytes
                                     25 ;; Compressed:       61 bytes
                                     26 ;; Space saved:      195 bytes
                                     27 ;;
                                     28 
                                     29 ;; Data array definition
    00004B3D                         30 _snowball_0::
    00004B3D B0 AA 00 BA 0B 0A F8    31    .db  0xb0, 0xaa, 0x00, 0xba, 0x0b, 0x0a, 0xf8, 0x00, 0x0e, 0xaf, 0x0d, 0x08, 0x00, 0xa1, 0x68, 0x74
             00 0E AF 0D 08 00 A1
             68 74
    00004B4D 0F 0E 3D 00 0E 55 00    32    .db  0x0f, 0x0e, 0x3d, 0x00, 0x0e, 0x55, 0x00, 0x0e, 0xaa, 0x00, 0x54, 0x1e, 0xa9, 0x00, 0x0e, 0x0f
             0E AA 00 54 1E A9 00
             0E 0F
    00004B5D 1E 1E 4D 00 5E 95 00    33    .db  0x1e, 0x1e, 0x4d, 0x00, 0x5e, 0x95, 0x00, 0x02, 0x0f, 0x4a, 0x3f, 0x6a, 0x00, 0x0f, 0xaa, 0x00
             02 0F 4A 3F 6A 00 0F
             AA 00
    00004B6D D5 0F D1 06 00 47 09    34    .db  0xd5, 0x0f, 0xd1, 0x06, 0x00, 0x47, 0x09, 0x02, 0x08, 0x2b, 0x00, 0xa1, 0x0a
             02 08 2B 00 A1 0A
                                     35 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         0000003C    36 _snowball_0_end == . - 1
                                     37 
                                     38 ;; File 'out/snowball_10.h.s' generated using cpct_pack
                                     39 ;; Compresor used:   zx7b
                                     40 ;; Files compressed: [ 'dat/snowball_10.bin' ]
                                     41 ;; Uncompressed:     256 bytes
                                     42 ;; Compressed:       65 bytes
                                     43 ;; Space saved:      191 bytes
                                     44 ;;
                                     45 
                                     46 ;; Declaration of the compressed array and
                                     47 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                     48 .globl _snowball_10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 2
Hexadecimal [32-Bits]



                                     49 .globl _snowball_10_end
                                     50 
                                     51 ;; Compressed and uncompressed sizes
                         00000041    52 _snowball_10_size_z == 65
                         00000100    53 _snowball_10_size   == 256
                                     54 
                                     55 
                                     56 ;; File 'out/snowball_10.s' generated using cpct_pack
                                     57 ;; Compresor used:   zx7b
                                     58 ;; Files compressed: [ 'dat/snowball_10.bin' ]
                                     59 ;; Uncompressed:     256 bytes
                                     60 ;; Compressed:       65 bytes
                                     61 ;; Space saved:      191 bytes
                                     62 ;;
                                     63 
                                     64 ;; Data array definition
    00004B7A                         65 _snowball_10::
    00004B7A 80 55 0F D5 08 0F D4    66    .db  0x80, 0x55, 0x0f, 0xd5, 0x08, 0x0f, 0xd4, 0x8a, 0x30, 0x93, 0x43, 0x0f, 0x98, 0x09, 0x0f, 0x6a
             8A 30 93 43 0F 98 09
             0F 6A
    00004B8A 04 0F D0 0E 0F 0F 10    67    .db  0x04, 0x0f, 0xd0, 0x0e, 0x0f, 0x0f, 0x10, 0xba, 0x0f, 0xa3, 0x02, 0x0f, 0x56, 0x10, 0x0f, 0x33
             BA 0F A3 02 0F 56 10
             0F 33
    00004B9A 21 10 F4 0F 43 21 08    68    .db  0x21, 0x10, 0xf4, 0x0f, 0x43, 0x21, 0x08, 0x0f, 0x37, 0x02, 0x04, 0x0a, 0x0f, 0x8a, 0x11, 0xd1
             0F 37 02 04 0A 0F 8A
             11 D1
    00004BAA 0F 1D 02 08 0A 0F C5    69    .db  0x0f, 0x1d, 0x02, 0x08, 0x0a, 0x0f, 0xc5, 0x13, 0xe8, 0x00, 0x0a, 0x00, 0x6b, 0x00, 0x00, 0xd1
             13 E8 00 0A 00 6B 00
             00 D1
    00004BBA 02                      70    .db  0x02
                                     71 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         0000007D    72 _snowball_10_end == . - 1
                                     73 
                                     74 ;; File 'out/snowball_11.h.s' generated using cpct_pack
                                     75 ;; Compresor used:   zx7b
                                     76 ;; Files compressed: [ 'dat/snowball_11.bin' ]
                                     77 ;; Uncompressed:     256 bytes
                                     78 ;; Compressed:       63 bytes
                                     79 ;; Space saved:      193 bytes
                                     80 ;;
                                     81 
                                     82 ;; Declaration of the compressed array and
                                     83 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                     84 .globl _snowball_11
                                     85 .globl _snowball_11_end
                                     86 
                                     87 ;; Compressed and uncompressed sizes
                         0000003F    88 _snowball_11_size_z == 63
                         00000100    89 _snowball_11_size   == 256
                                     90 
                                     91 
                                     92 ;; File 'out/snowball_11.s' generated using cpct_pack
                                     93 ;; Compresor used:   zx7b
                                     94 ;; Files compressed: [ 'dat/snowball_11.bin' ]
                                     95 ;; Uncompressed:     256 bytes
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 3
Hexadecimal [32-Bits]



                                     96 ;; Compressed:       63 bytes
                                     97 ;; Space saved:      193 bytes
                                     98 ;;
                                     99 
                                    100 ;; Data array definition
    00004BBB                        101 _snowball_11::
    00004BBB 60 55 41 35 0F 30 54   102    .db  0x60, 0x55, 0x41, 0x35, 0x0f, 0x30, 0x54, 0x8b, 0x58, 0x2e, 0x0f, 0x0f, 0x09, 0x0f, 0xb4, 0x00
             8B 58 2E 0F 0F 09 0F
             B4 00
    00004BCB 0F FA 04 0F 42 0E 0A   103    .db  0x0f, 0xfa, 0x04, 0x0f, 0x42, 0x0e, 0x0a, 0x5d, 0x1e, 0xa9, 0x0a, 0x0e, 0x16, 0x0f, 0x17, 0x0e
             5D 1E A9 0A 0E 16 0F
             17 0E
    00004BDB 1D 0F 7F 08 1D D1 0F   104    .db  0x1d, 0x0f, 0x7f, 0x08, 0x1d, 0xd1, 0x0f, 0x8b, 0x0a, 0x04, 0x02, 0x0f, 0x48, 0x0d, 0x47, 0x00
             8B 0A 04 02 0F 48 0D
             47 00
    00004BEB 0D 08 5F 0E 81 00 0A   105    .db  0x0d, 0x08, 0x5f, 0x0e, 0x81, 0x00, 0x0a, 0x0b, 0x2b, 0x00, 0x02, 0x71, 0x00, 0x8b, 0x00
             0B 2B 00 02 71 00 8B
             00
                                    106 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000000BC   107 _snowball_11_end == . - 1
                                    108 
                                    109 ;; File 'out/snowball_12.h.s' generated using cpct_pack
                                    110 ;; Compresor used:   zx7b
                                    111 ;; Files compressed: [ 'dat/snowball_12.bin' ]
                                    112 ;; Uncompressed:     256 bytes
                                    113 ;; Compressed:       80 bytes
                                    114 ;; Space saved:      176 bytes
                                    115 ;;
                                    116 
                                    117 ;; Declaration of the compressed array and
                                    118 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    119 .globl _snowball_12
                                    120 .globl _snowball_12_end
                                    121 
                                    122 ;; Compressed and uncompressed sizes
                         00000050   123 _snowball_12_size_z == 80
                         00000100   124 _snowball_12_size   == 256
                                    125 
                                    126 
                                    127 ;; File 'out/snowball_12.s' generated using cpct_pack
                                    128 ;; Compresor used:   zx7b
                                    129 ;; Files compressed: [ 'dat/snowball_12.bin' ]
                                    130 ;; Uncompressed:     256 bytes
                                    131 ;; Compressed:       80 bytes
                                    132 ;; Space saved:      176 bytes
                                    133 ;;
                                    134 
                                    135 ;; Data array definition
    00004BFA                        136 _snowball_12::
    00004BFA 80 55 0F D5 08 41 0F   137    .db  0x80, 0x55, 0x0f, 0xd5, 0x08, 0x41, 0x0f, 0x83, 0x00, 0x83, 0x0a, 0x02, 0x1f, 0x0c, 0x0b, 0x01
             83 00 83 0A 02 1F 0C
             0B 01
    00004C0A 0F 7E 31 86 09 0F 02   138    .db  0x0f, 0x7e, 0x31, 0x86, 0x09, 0x0f, 0x02, 0x56, 0x0f, 0xd7, 0x06, 0x54, 0x0f, 0x10, 0xe9, 0x0f
             56 0F D7 06 54 0F 10
             E9 0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 4
Hexadecimal [32-Bits]



    00004C1A B8 0A 20 BE 10 0F E9   139    .db  0xb8, 0x0a, 0x20, 0xbe, 0x10, 0x0f, 0xe9, 0x10, 0x9a, 0x00, 0x0a, 0x09, 0x26, 0x08, 0x21, 0x00
             10 9A 00 0A 09 26 08
             21 00
    00004C2A D6 0F 21 F1 23 75 0F   140    .db  0xd6, 0x0f, 0x21, 0xf1, 0x23, 0x75, 0x0f, 0x10, 0xd7, 0x08, 0x0f, 0xad, 0x0a, 0x11, 0x42, 0x00
             10 D7 08 0F AD 0A 11
             42 00
    00004C3A 08 0F B7 11 0F E6 13   141    .db  0x08, 0x0f, 0xb7, 0x11, 0x0f, 0xe6, 0x13, 0xe8, 0x00, 0x04, 0x00, 0x6b, 0x00, 0x00, 0xd1, 0x02
             E8 00 04 00 6B 00 00
             D1 02
                                    142 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         0000010C   143 _snowball_12_end == . - 1
                                    144 
                                    145 ;; File 'out/snowball_13.h.s' generated using cpct_pack
                                    146 ;; Compresor used:   zx7b
                                    147 ;; Files compressed: [ 'dat/snowball_13.bin' ]
                                    148 ;; Uncompressed:     256 bytes
                                    149 ;; Compressed:       68 bytes
                                    150 ;; Space saved:      188 bytes
                                    151 ;;
                                    152 
                                    153 ;; Declaration of the compressed array and
                                    154 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    155 .globl _snowball_13
                                    156 .globl _snowball_13_end
                                    157 
                                    158 ;; Compressed and uncompressed sizes
                         00000044   159 _snowball_13_size_z == 68
                         00000100   160 _snowball_13_size   == 256
                                    161 
                                    162 
                                    163 ;; File 'out/snowball_13.s' generated using cpct_pack
                                    164 ;; Compresor used:   zx7b
                                    165 ;; Files compressed: [ 'dat/snowball_13.bin' ]
                                    166 ;; Uncompressed:     256 bytes
                                    167 ;; Compressed:       68 bytes
                                    168 ;; Space saved:      188 bytes
                                    169 ;;
                                    170 
                                    171 ;; Data array definition
    00004C4A                        172 _snowball_13::
    00004C4A C0 AA 00 EA 1F A1 0F   173    .db  0xc0, 0xaa, 0x00, 0xea, 0x1f, 0xa1, 0x0f, 0x4d, 0x9e, 0x0f, 0x3a, 0x0a, 0x0f, 0xaa, 0x0a, 0x51
             4D 9E 0F 3A 0A 0F AA
             0A 51
    00004C5A 0F A9 3C 00 B9 0A 1E   174    .db  0x0f, 0xa9, 0x3c, 0x00, 0xb9, 0x0a, 0x1e, 0x28, 0x08, 0x00, 0xad, 0x0d, 0x0f, 0x3b, 0x09, 0x00
             28 08 00 AD 0D 0F 3B
             09 00
    00004C6A 0E 7A 1D 0F 73 00 09   175    .db  0x0e, 0x7a, 0x1d, 0x0f, 0x73, 0x00, 0x09, 0x7d, 0x02, 0x0f, 0x25, 0x0b, 0x0e, 0x9e, 0x00, 0x0a
             7D 02 0F 25 0B 0E 9E
             00 0A
    00004C7A 00 2E 08 0D 0F E5 0D   176    .db  0x00, 0x2e, 0x08, 0x0d, 0x0f, 0xe5, 0x0d, 0x3a, 0x0e, 0xae, 0x00, 0x04, 0x0b, 0x2b, 0x00, 0x02
             3A 0E AE 00 04 0B 2B
             00 02
    00004C8A 71 00 8B 00            177    .db  0x71, 0x00, 0x8b, 0x00
                                    178 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000150   179 _snowball_13_end == . - 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 5
Hexadecimal [32-Bits]



                                    180 
                                    181 ;; File 'out/snowball_14.h.s' generated using cpct_pack
                                    182 ;; Compresor used:   zx7b
                                    183 ;; Files compressed: [ 'dat/snowball_14.bin' ]
                                    184 ;; Uncompressed:     256 bytes
                                    185 ;; Compressed:       84 bytes
                                    186 ;; Space saved:      172 bytes
                                    187 ;;
                                    188 
                                    189 ;; Declaration of the compressed array and
                                    190 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    191 .globl _snowball_14
                                    192 .globl _snowball_14_end
                                    193 
                                    194 ;; Compressed and uncompressed sizes
                         00000054   195 _snowball_14_size_z == 84
                         00000100   196 _snowball_14_size   == 256
                                    197 
                                    198 
                                    199 ;; File 'out/snowball_14.s' generated using cpct_pack
                                    200 ;; Compresor used:   zx7b
                                    201 ;; Files compressed: [ 'dat/snowball_14.bin' ]
                                    202 ;; Uncompressed:     256 bytes
                                    203 ;; Compressed:       84 bytes
                                    204 ;; Space saved:      172 bytes
                                    205 ;;
                                    206 
                                    207 ;; Data array definition
    00004C8E                        208 _snowball_14::
    00004C8E AB AA 02 32 0B C6 0F   209    .db  0xab, 0xaa, 0x02, 0x32, 0x0b, 0xc6, 0x0f, 0x47, 0x09, 0x09, 0x0d, 0x49, 0x30, 0x41, 0x0f, 0xdf
             47 09 09 0D 49 30 41
             0F DF
    00004C9E 04 54 0F 1E AF 41 0F   210    .db  0x04, 0x54, 0x0f, 0x1e, 0xaf, 0x41, 0x0f, 0x27, 0x09, 0x08, 0x0f, 0x7a, 0x10, 0x5c, 0x0a, 0x08
             27 09 08 0F 7A 10 5C
             0A 08
    00004CAE 10 49 12 20 C7 10 71   211    .db  0x10, 0x49, 0x12, 0x20, 0xc7, 0x10, 0x71, 0x06, 0x08, 0x00, 0x64, 0x0f, 0x21, 0x37, 0x09, 0x0f
             06 08 00 64 0F 21 37
             09 0F
    00004CBE 50 21 AE 07 0F 12 02   212    .db  0x50, 0x21, 0xae, 0x07, 0x0f, 0x12, 0x02, 0x11, 0x05, 0x0a, 0x0a, 0x10, 0x92, 0x00, 0x0f, 0x1e
             11 05 0A 0A 10 92 00
             0F 1E
    00004CCE 11 12 FA 04 1F 42 11   213    .db  0x11, 0x12, 0xfa, 0x04, 0x1f, 0x42, 0x11, 0x04, 0x0f, 0xd7, 0x13, 0xe2, 0x00, 0x08, 0x00, 0x6b
             04 0F D7 13 E2 00 08
             00 6B
    00004CDE 00 00 D1 02            214    .db  0x00, 0x00, 0xd1, 0x02
                                    215 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000001A4   216 _snowball_14_end == . - 1
                                    217 
                                    218 ;; File 'out/snowball_15.h.s' generated using cpct_pack
                                    219 ;; Compresor used:   zx7b
                                    220 ;; Files compressed: [ 'dat/snowball_15.bin' ]
                                    221 ;; Uncompressed:     256 bytes
                                    222 ;; Compressed:       80 bytes
                                    223 ;; Space saved:      176 bytes
                                    224 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 6
Hexadecimal [32-Bits]



                                    225 
                                    226 ;; Declaration of the compressed array and
                                    227 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    228 .globl _snowball_15
                                    229 .globl _snowball_15_end
                                    230 
                                    231 ;; Compressed and uncompressed sizes
                         00000050   232 _snowball_15_size_z == 80
                         00000100   233 _snowball_15_size   == 256
                                    234 
                                    235 
                                    236 ;; File 'out/snowball_15.s' generated using cpct_pack
                                    237 ;; Compresor used:   zx7b
                                    238 ;; Files compressed: [ 'dat/snowball_15.bin' ]
                                    239 ;; Uncompressed:     256 bytes
                                    240 ;; Compressed:       80 bytes
                                    241 ;; Space saved:      176 bytes
                                    242 ;;
                                    243 
                                    244 ;; Data array definition
    00004CE2                        245 _snowball_15::
    00004CE2 56 55 21 47 D7 0F 4D   246    .db  0x56, 0x55, 0x21, 0x47, 0xd7, 0x0f, 0x4d, 0x09, 0x09, 0x0f, 0x64, 0x4c, 0x75, 0x02, 0x00, 0x1f
             09 09 0F 64 4C 75 02
             00 1F
    00004CF2 F4 00 0F FA 02 09 0F   247    .db  0xf4, 0x00, 0x0f, 0xfa, 0x02, 0x09, 0x0f, 0x2e, 0x04, 0x5f, 0xd1, 0x0e, 0x0f, 0x6b, 0x0b, 0xe2
             2E 04 5F D1 0E 0F 6B
             0B E2
    00004D02 0E AE 00 2C B9 2D 0F   248    .db  0x0e, 0xae, 0x00, 0x2c, 0xb9, 0x2d, 0x0f, 0xee, 0x09, 0x1d, 0x0a, 0x0f, 0x1c, 0x08, 0x1d, 0xb4
             EE 09 1D 0A 0F 1C 08
             1D B4
    00004D12 0A 0A 0D 12 02 0F 28   249    .db  0x0a, 0x0a, 0x0d, 0x12, 0x02, 0x0f, 0x28, 0x0d, 0x0e, 0xf1, 0x1f, 0x07, 0x04, 0x04, 0x0d, 0x0f
             0D 0E F1 1F 07 04 04
             0D 0F
    00004D22 D9 04 0D D5 0E AE 00   250    .db  0xd9, 0x04, 0x0d, 0xd5, 0x0e, 0xae, 0x00, 0x08, 0x0b, 0x2b, 0x00, 0x02, 0x71, 0x00, 0x8b, 0x00
             08 0B 2B 00 02 71 00
             8B 00
                                    251 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000001F4   252 _snowball_15_end == . - 1
                                    253 
                                    254 ;; File 'out/snowball_1.h.s' generated using cpct_pack
                                    255 ;; Compresor used:   zx7b
                                    256 ;; Files compressed: [ 'dat/snowball_1.bin' ]
                                    257 ;; Uncompressed:     256 bytes
                                    258 ;; Compressed:       75 bytes
                                    259 ;; Space saved:      181 bytes
                                    260 ;;
                                    261 
                                    262 ;; Declaration of the compressed array and
                                    263 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    264 .globl _snowball_1
                                    265 .globl _snowball_1_end
                                    266 
                                    267 ;; Compressed and uncompressed sizes
                         0000004B   268 _snowball_1_size_z == 75
                         00000100   269 _snowball_1_size   == 256
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 7
Hexadecimal [32-Bits]



                                    270 
                                    271 
                                    272 ;; File 'out/snowball_1.s' generated using cpct_pack
                                    273 ;; Compresor used:   zx7b
                                    274 ;; Files compressed: [ 'dat/snowball_1.bin' ]
                                    275 ;; Uncompressed:     256 bytes
                                    276 ;; Compressed:       75 bytes
                                    277 ;; Space saved:      181 bytes
                                    278 ;;
                                    279 
                                    280 ;; Data array definition
    00004D32                        281 _snowball_1::
    00004D32 AB AA 00 13 10 6F 02   282    .db  0xab, 0xaa, 0x00, 0x13, 0x10, 0x6f, 0x02, 0x10, 0xaa, 0x0e, 0x5c, 0x22, 0x07, 0x0f, 0x00, 0xd7
             10 AA 0E 5C 22 07 0F
             00 D7
    00004D42 21 0F D3 53 75 0F 5D   283    .db  0x21, 0x0f, 0xd3, 0x53, 0x75, 0x0f, 0x5d, 0x02, 0x31, 0x5f, 0x0e, 0x71, 0x5f, 0x31, 0x0e, 0xc7
             02 31 5F 0E 71 5F 31
             0E C7
    00004D52 70 07 41 00 3F 57 00   284    .db  0x70, 0x07, 0x41, 0x00, 0x3f, 0x57, 0x00, 0x0b, 0x6a, 0x10, 0x1f, 0x77, 0x0f, 0x71, 0x10, 0x31
             0B 6A 10 1F 77 0F 71
             10 31
    00004D62 02 00 34 25 0D 0F 7D   285    .db  0x02, 0x00, 0x34, 0x25, 0x0d, 0x0f, 0x7d, 0x10, 0x75, 0x0e, 0x00, 0x13, 0x97, 0x0f, 0x10, 0xee
             10 75 0E 00 13 97 0F
             10 EE
    00004D72 0F 09 00 06 0A 00 08   286    .db  0x0f, 0x09, 0x00, 0x06, 0x0a, 0x00, 0x08, 0x04, 0x04, 0x1a, 0x02
             04 04 1A 02
                                    287 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         0000023F   288 _snowball_1_end == . - 1
                                    289 
                                    290 ;; File 'out/snowball_2.h.s' generated using cpct_pack
                                    291 ;; Compresor used:   zx7b
                                    292 ;; Files compressed: [ 'dat/snowball_2.bin' ]
                                    293 ;; Uncompressed:     256 bytes
                                    294 ;; Compressed:       86 bytes
                                    295 ;; Space saved:      170 bytes
                                    296 ;;
                                    297 
                                    298 ;; Declaration of the compressed array and
                                    299 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    300 .globl _snowball_2
                                    301 .globl _snowball_2_end
                                    302 
                                    303 ;; Compressed and uncompressed sizes
                         00000056   304 _snowball_2_size_z == 86
                         00000100   305 _snowball_2_size   == 256
                                    306 
                                    307 
                                    308 ;; File 'out/snowball_2.s' generated using cpct_pack
                                    309 ;; Compresor used:   zx7b
                                    310 ;; Files compressed: [ 'dat/snowball_2.bin' ]
                                    311 ;; Uncompressed:     256 bytes
                                    312 ;; Compressed:       86 bytes
                                    313 ;; Space saved:      170 bytes
                                    314 ;;
                                    315 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 8
Hexadecimal [32-Bits]



                                    316 ;; Data array definition
    00004D7D                        317 _snowball_2::
    00004D7D B0 AA 00 BA 0B 0A F8   318    .db  0xb0, 0xaa, 0x00, 0xba, 0x0b, 0x0a, 0xf8, 0x00, 0x0e, 0xaf, 0x02, 0x1f, 0x0d, 0xd6, 0x0c, 0x0f
             00 0E AF 02 1F 0D D6
             0C 0F
    00004D8D F5 0E 03 F5 0F 13 1D   319    .db  0xf5, 0x0e, 0x03, 0xf5, 0x0f, 0x13, 0x1d, 0x0d, 0x77, 0x00, 0x0e, 0xb5, 0x1d, 0x0f, 0x3b, 0x02
             0D 77 00 0E B5 1D 0F
             3B 02
    00004D9D 08 0E C8 0F 1A 3D A6   320    .db  0x08, 0x0e, 0xc8, 0x0f, 0x1a, 0x3d, 0xa6, 0x6a, 0x0c, 0x0f, 0xfb, 0x0e, 0x0b, 0xeb, 0x0f, 0x8b
             6A 0C 0F FB 0E 0B EB
             0F 8B
    00004DAD 0E 1F EB 02 0F 06 47   321    .db  0x0e, 0x1f, 0xeb, 0x02, 0x0f, 0x06, 0x47, 0x0f, 0x37, 0x1f, 0x5c, 0x2a, 0x00, 0x00, 0xd3, 0x0c
             0F 37 1F 5C 2A 00 00
             D3 0C
    00004DBD 0F BE 00 0F 7A 08 11   322    .db  0x0f, 0xbe, 0x00, 0x0f, 0x7a, 0x08, 0x11, 0xa2, 0x09, 0x09, 0x0f, 0x49, 0x02, 0x04, 0x04, 0x04
             A2 09 09 0F 49 02 04
             04 04
    00004DCD B1 08 08 00 8C 0A      323    .db  0xb1, 0x08, 0x08, 0x00, 0x8c, 0x0a
                                    324 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000295   325 _snowball_2_end == . - 1
                                    326 
                                    327 ;; File 'out/snowball_3.h.s' generated using cpct_pack
                                    328 ;; Compresor used:   zx7b
                                    329 ;; Files compressed: [ 'dat/snowball_3.bin' ]
                                    330 ;; Uncompressed:     256 bytes
                                    331 ;; Compressed:       88 bytes
                                    332 ;; Space saved:      168 bytes
                                    333 ;;
                                    334 
                                    335 ;; Declaration of the compressed array and
                                    336 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    337 .globl _snowball_3
                                    338 .globl _snowball_3_end
                                    339 
                                    340 ;; Compressed and uncompressed sizes
                         00000058   341 _snowball_3_size_z == 88
                         00000100   342 _snowball_3_size   == 256
                                    343 
                                    344 
                                    345 ;; File 'out/snowball_3.s' generated using cpct_pack
                                    346 ;; Compresor used:   zx7b
                                    347 ;; Files compressed: [ 'dat/snowball_3.bin' ]
                                    348 ;; Uncompressed:     256 bytes
                                    349 ;; Compressed:       88 bytes
                                    350 ;; Space saved:      168 bytes
                                    351 ;;
                                    352 
                                    353 ;; Data array definition
    00004DD3                        354 _snowball_3::
    00004DD3 C0 AA 02 01 2A 13 1F   355    .db  0xc0, 0xaa, 0x02, 0x01, 0x2a, 0x13, 0x1f, 0x63, 0x02, 0x10, 0xa8, 0x0f, 0x13, 0x12, 0x11, 0x0f
             63 02 10 A8 0F 13 12
             11 0F
    00004DE3 0F 43 08 10 A5 00 11   356    .db  0x0f, 0x43, 0x08, 0x10, 0xa5, 0x00, 0x11, 0x21, 0xd6, 0x0f, 0x4d, 0x21, 0x10, 0xd7, 0x0f, 0x10
             21 D6 0F 4D 21 10 D7
             0F 10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 9
Hexadecimal [32-Bits]



    00004DF3 C7 08 02 0F 95 12 74   357    .db  0xc7, 0x08, 0x02, 0x0f, 0x95, 0x12, 0x74, 0x7d, 0x41, 0x00, 0x53, 0x23, 0x10, 0xeb, 0x13, 0x30
             7D 41 00 53 23 10 EB
             13 30
    00004E03 FA 0F 9A 57 00 0F A6   358    .db  0xfa, 0x0f, 0x9a, 0x57, 0x00, 0x0f, 0xa6, 0x02, 0x41, 0x0f, 0x34, 0x1f, 0xbf, 0x0f, 0xa6, 0x00
             02 41 0F 34 1F BF 0F
             A6 00
    00004E13 04 00 2E 00 0A 0F AB   359    .db  0x04, 0x00, 0x2e, 0x00, 0x0a, 0x0f, 0xab, 0x09, 0x51, 0x09, 0x00, 0x0f, 0x72, 0x00, 0x04, 0x77
             09 51 09 00 0F 72 00
             04 77
    00004E23 08 00 0A 08 04 04 0D   360    .db  0x08, 0x00, 0x0a, 0x08, 0x04, 0x04, 0x0d, 0x02
             02
                                    361 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000002ED   362 _snowball_3_end == . - 1
                                    363 
                                    364 ;; File 'out/snowball_4.h.s' generated using cpct_pack
                                    365 ;; Compresor used:   zx7b
                                    366 ;; Files compressed: [ 'dat/snowball_4.bin' ]
                                    367 ;; Uncompressed:     256 bytes
                                    368 ;; Compressed:       86 bytes
                                    369 ;; Space saved:      170 bytes
                                    370 ;;
                                    371 
                                    372 ;; Declaration of the compressed array and
                                    373 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    374 .globl _snowball_4
                                    375 .globl _snowball_4_end
                                    376 
                                    377 ;; Compressed and uncompressed sizes
                         00000056   378 _snowball_4_size_z == 86
                         00000100   379 _snowball_4_size   == 256
                                    380 
                                    381 
                                    382 ;; File 'out/snowball_4.s' generated using cpct_pack
                                    383 ;; Compresor used:   zx7b
                                    384 ;; Files compressed: [ 'dat/snowball_4.bin' ]
                                    385 ;; Uncompressed:     256 bytes
                                    386 ;; Compressed:       86 bytes
                                    387 ;; Space saved:      170 bytes
                                    388 ;;
                                    389 
                                    390 ;; Data array definition
    00004E2B                        391 _snowball_4::
    00004E2B 58 55 00 5D 0B 0A 00   392    .db  0x58, 0x55, 0x00, 0x5d, 0x0b, 0x0a, 0x00, 0xfc, 0x0e, 0x02, 0x57, 0x0f, 0x0d, 0x69, 0x04, 0x00
             FC 0E 02 57 0F 0D 69
             04 00
    00004E3B A8 1D 1B D3 00 1D F4   393    .db  0xa8, 0x1d, 0x1b, 0xd3, 0x00, 0x1d, 0xf4, 0x00, 0x0f, 0xf5, 0x0e, 0x04, 0x74, 0x0e, 0x04, 0x0f
             00 0F F5 0E 04 74 0E
             04 0F
    00004E4B A3 1E 1D 04 48 AD 00   394    .db  0xa3, 0x1e, 0x1d, 0x04, 0x48, 0xad, 0x00, 0x4d, 0x0e, 0xe7, 0x0f, 0xba, 0x0e, 0x00, 0xeb, 0x4c
             4D 0E E7 0F BA 0E 00
             EB 4C
    00004E5B 08 0F 2B 02 40 1E 1D   395    .db  0x08, 0x0f, 0x2b, 0x02, 0x40, 0x1e, 0x1d, 0x87, 0x0f, 0x00, 0x6b, 0x2c, 0x2e, 0x00, 0x08, 0x04
             87 0F 00 6B 2C 2E 00
             08 04
    00004E6B 0D 62 09 1F 85 06 0C   396    .db  0x0d, 0x62, 0x09, 0x1f, 0x85, 0x06, 0x0c, 0x0a, 0x09, 0x0f, 0x8d, 0x00, 0x08, 0xbe, 0x02, 0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 10
Hexadecimal  0A-Bits]



             0A 09 0F 8D 00 08 BE
             02 00
    00004E73 09 0F 8D 00 08 BE      397    .db  0x05, 0x72, 0x08, 0x00, 0xb4, 0x0a
                                    398 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000343   399 _snowball_4_end == . - 1
                                    400 
                                    401 ;; File 'out/snowball_5.h.s' generated using cpct_pack
                                    402 ;; Compresor used:   zx7b
                                    403 ;; Files compressed: [ 'dat/snowball_5.bin' ]
                                    404 ;; Uncompressed:     256 bytes
                                    405 ;; Compressed:       62 bytes
                                    406 ;; Space saved:      194 bytes
                                    407 ;;
                                    408 
                                    409 ;; Declaration of the compressed array and
                                    410 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    411 .globl _snowball_5
                                    412 .globl _snowball_5_end
                                    413 
                                    414 ;; Compressed and uncompressed sizes
                         0000003E   415 _snowball_5_size_z == 62
                         00000100   416 _snowball_5_size   == 256
                                    417 
                                    418 
                                    419 ;; File 'out/snowball_5.s' generated using cpct_pack
                                    420 ;; Compresor used:   zx7b
                                    421 ;; Files compressed: [ 'dat/snowball_5.bin' ]
                                    422 ;; Uncompressed:     256 bytes
                                    423 ;; Compressed:       62 bytes
                                    424 ;; Space saved:      194 bytes
                                    425 ;;
                                    426 
                                    427 ;; Data array definition
    00000344                        428 _snowball_5::
    00004E79 02 00 05 72 08 00 B4   429    .db  0x58, 0x55, 0x02, 0x13, 0x35, 0x0f, 0x8e, 0x02, 0x10, 0x0f, 0x7a, 0x00, 0x1d, 0x11, 0x0f, 0x37
             0A 10 0F 7A 00 1D 11
             0F 37
    00004E81 04 10 D4 0F AE 00 21   430    .db  0x04, 0x10, 0xd4, 0x0f, 0xae, 0x00, 0x21, 0xbb, 0x0f, 0x05, 0xe9, 0x10, 0x42, 0x61, 0x1f, 0x8e
             BB 0F 05 E9 10 42 61
             1F 8E
    00004E81 58 55 02 13 35 0F 8E   431    .db  0x09, 0x11, 0x04, 0x52, 0x20, 0x0e, 0x08, 0x20, 0x6f, 0x00, 0x0f, 0xd1, 0x20, 0xa9, 0x0f, 0xa3
             02 10 0F 7A 00 1D 11
             0F 37
    00004E91 04 10 D4 0F AE 00 21   432    .db  0x08, 0x0f, 0x56, 0x02, 0x0f, 0xad, 0x00, 0x0f, 0x6a, 0x00, 0xd5, 0x0a, 0x51, 0x02
             BB 0F 05 E9 10 42 61
                                    433 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000381   434 _snowball_5_end == . - 1
                                    435 
                                    436 ;; File 'out/snowball_6.h.s' generated using cpct_pack
                                    437 ;; Compresor used:   zx7b
                                    438 ;; Files compressed: [ 'dat/snowball_6.bin' ]
                                    439 ;; Uncompressed:     256 bytes
                                    440 ;; Compressed:       66 bytes
                                    441 ;; Space saved:      190 bytes
                                    442 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 11
Hexadecimal  1F-Bits]



                                    443 
                                    444 ;; Declaration of the compressed array and
                                    445 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    446 .globl _snowball_6
                                    447 .globl _snowball_6_end
                                    448 
                                    449 ;; Compressed and uncompressed sizes
                         00000042   450 _snowball_6_size_z == 66
                         00000100   451 _snowball_6_size   == 256
                                    452 
                                    453 
                                    454 ;; File 'out/snowball_6.s' generated using cpct_pack
                                    455 ;; Compresor used:   zx7b
                                    456 ;; Files compressed: [ 'dat/snowball_6.bin' ]
                                    457 ;; Uncompressed:     256 bytes
                                    458 ;; Compressed:       66 bytes
                                    459 ;; Space saved:      190 bytes
                                    460 ;;
                                    461 
                                    462 ;; Data array definition
    00000382                        463 _snowball_6::
    00004EA0 8E 09 11 04 52 20 0E   464    .db  0x60, 0x55, 0x00, 0x75, 0x0b, 0x0a, 0xf1, 0x00, 0x0e, 0x5f, 0x02, 0x0f, 0xa5, 0x0d, 0xa3, 0x00
             08 20 6F 00 0F D1 20
             A9 0F
    00004EB0 A3 08 0F 56 02 0F AD   465    .db  0x1d, 0x8f, 0x0f, 0x89, 0x1d, 0x0f, 0xbb, 0x0e, 0x3d, 0xf8, 0x0f, 0x89, 0x1e, 0x00, 0x0f, 0x2b
             00 0F 6A 00 D5 0A 51
             02 2B
    00004EBF 00 0F D1 0E 68 0F 86   466    .db  0x00, 0x0f, 0xd1, 0x0e, 0x68, 0x0f, 0x86, 0x2e, 0x10, 0x7a, 0x0f, 0xae, 0x1c, 0x0e, 0x00, 0x0f
             2E 10 7A 0F AE 1C 0E
             00 0F
    00004EBF 60 55 00 75 0B 0A F1   467    .db  0x00, 0x08, 0x7a, 0x09, 0x0f, 0x56, 0x0a, 0x0f, 0xb5, 0x02, 0x04, 0x04, 0x04, 0x62, 0x08, 0x00
             00 0E 5F 02 0F A5 0D
             A3 00
    00004ECF 1D 8F                  468    .db  0xa5, 0x0a
                                    469 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000003C3   470 _snowball_6_end == . - 1
                                    471 
                                    472 ;; File 'out/snowball_7.h.s' generated using cpct_pack
                                    473 ;; Compresor used:   zx7b
                                    474 ;; Files compressed: [ 'dat/snowball_7.bin' ]
                                    475 ;; Uncompressed:     256 bytes
                                    476 ;; Compressed:       67 bytes
                                    477 ;; Space saved:      189 bytes
                                    478 ;;
                                    479 
                                    480 ;; Declaration of the compressed array and
                                    481 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    482 .globl _snowball_7
                                    483 .globl _snowball_7_end
                                    484 
                                    485 ;; Compressed and uncompressed sizes
                         00000043   486 _snowball_7_size_z == 67
                         00000100   487 _snowball_7_size   == 256
                                    488 
                                    489 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 12
Hexadecimal [32-Bits]



                                    490 ;; File 'out/snowball_7.s' generated using cpct_pack
                                    491 ;; Compresor used:   zx7b
                                    492 ;; Files compressed: [ 'dat/snowball_7.bin' ]
                                    493 ;; Uncompressed:     256 bytes
                                    494 ;; Compressed:       67 bytes
                                    495 ;; Space saved:      189 bytes
                                    496 ;;
                                    497 
                                    498 ;; Data array definition
    000003C4                        499 _snowball_7::
    00004ED1 0F 89 1D 0F BB 0E 3D   500    .db  0xb0, 0xaa, 0x02, 0x13, 0x6a, 0x0f, 0x1c, 0x02, 0x10, 0x0f, 0xf5, 0x11, 0xe8, 0x0f, 0x8e, 0x21
             F8 0F 89 1E 00 0F 2B
             00 0F
    00004EE1 D1 0E 68 0F 86 2E 10   501    .db  0x0f, 0xe6, 0x21, 0x68, 0x0f, 0x86, 0x41, 0x10, 0xbe, 0x00, 0x20, 0x42, 0x0f, 0x57, 0x00, 0x0f
             7A 0F AE 1C 0E 00 0F
             00 08
    00004EF1 7A 09 0F 56 0A 0F B5   502    .db  0x85, 0x10, 0x0f, 0x6e, 0xa0, 0x4c, 0x08, 0x30, 0x0f, 0xeb, 0x06, 0xc0, 0x0f, 0x53, 0x09, 0x00
             02 04 04 04 62 08 00
             A5 0A
    00004F01 08 0F 00 6D 0F 2B 0A   503    .db  0x08, 0x0f, 0x00, 0x6d, 0x0f, 0x2b, 0x0a, 0x0f, 0x4a, 0x00, 0x0a, 0x53, 0x08, 0x00, 0x0a, 0x04
             0F 4A 00 0A 53 08 00
             0A 04
    00004F01 B0 AA 02               504    .db  0x04, 0x12, 0x02
                                    505 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000406   506 _snowball_7_end == . - 1
                                    507 
                                    508 ;; File 'out/snowball_8.h.s' generated using cpct_pack
                                    509 ;; Compresor used:   zx7b
                                    510 ;; Files compressed: [ 'dat/snowball_8.bin' ]
                                    511 ;; Uncompressed:     256 bytes
                                    512 ;; Compressed:       75 bytes
                                    513 ;; Space saved:      181 bytes
                                    514 ;;
                                    515 
                                    516 ;; Declaration of the compressed array and
                                    517 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    518 .globl _snowball_8
                                    519 .globl _snowball_8_end
                                    520 
                                    521 ;; Compressed and uncompressed sizes
                         0000004B   522 _snowball_8_size_z == 75
                         00000100   523 _snowball_8_size   == 256
                                    524 
                                    525 
                                    526 ;; File 'out/snowball_8.s' generated using cpct_pack
                                    527 ;; Compresor used:   zx7b
                                    528 ;; Files compressed: [ 'dat/snowball_8.bin' ]
                                    529 ;; Uncompressed:     256 bytes
                                    530 ;; Compressed:       75 bytes
                                    531 ;; Space saved:      181 bytes
                                    532 ;;
                                    533 
                                    534 ;; Data array definition
    00000407                        535 _snowball_8::
    00004F04 13 6A 0F 1C 02 10 0F   536    .db  0x58, 0x55, 0x02, 0x10, 0x0f, 0x75, 0xa8, 0x02, 0x10, 0x0f, 0x72, 0x12, 0x34, 0x0f, 0x5d, 0x53
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 13
Hexadecimal  F5-Bits]



             02 10 0F 72 12 34 0F
             5D 53
    00004F0C 11 E8 0F 8E 21 0F E6   537    .db  0x00, 0xc7, 0x0f, 0x71, 0x05, 0x2f, 0x7d, 0x10, 0x26, 0xf0, 0x07, 0x2e, 0xd1, 0x20, 0x18, 0x04
             21 68 0F 86 41 10 BE
             00 20
    00004F1C 42 0F 57 00 0F 85 10   538    .db  0x86, 0x0b, 0x0f, 0xa7, 0x10, 0x04, 0x10, 0xef, 0x0f, 0x10, 0xee, 0x11, 0xba, 0x00, 0x0a, 0x10
             0F 6E A0 4C 08 30 0F
             EB 06
    00004F2C C0 0F 53 09 00 08 0F   539    .db  0x5b, 0x02, 0x11, 0x0e, 0xdf, 0x10, 0x53, 0x08, 0x11, 0x8d, 0x08, 0x08, 0x0f, 0xb2, 0x11, 0x0f
             00 6D 0F 2B 0A 0F 4A
             00 0A
    00004F3C 53 08 00 0A 04 04 12   540    .db  0xe6, 0x13, 0xe8, 0x00, 0x04, 0x00, 0x6b, 0x00, 0x00, 0xd1, 0x02
             02 00 D1 02
                                    541 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000451   542 _snowball_8_end == . - 1
                                    543 
                                    544 ;; File 'out/snowball_9.h.s' generated using cpct_pack
                                    545 ;; Compresor used:   zx7b
                                    546 ;; Files compressed: [ 'dat/snowball_9.bin' ]
                                    547 ;; Uncompressed:     256 bytes
                                    548 ;; Compressed:       84 bytes
                                    549 ;; Space saved:      172 bytes
                                    550 ;;
                                    551 
                                    552 ;; Declaration of the compressed array and
                                    553 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    554 .globl _snowball_9
                                    555 .globl _snowball_9_end
                                    556 
                                    557 ;; Compressed and uncompressed sizes
                         00000054   558 _snowball_9_size_z == 84
                         00000100   559 _snowball_9_size   == 256
                                    560 
                                    561 
                                    562 ;; File 'out/snowball_9.s' generated using cpct_pack
                                    563 ;; Compresor used:   zx7b
                                    564 ;; Files compressed: [ 'dat/snowball_9.bin' ]
                                    565 ;; Uncompressed:     256 bytes
                                    566 ;; Compressed:       84 bytes
                                    567 ;; Space saved:      172 bytes
                                    568 ;;
                                    569 
                                    570 ;; Data array definition
    00004F44                        571 _snowball_9::
    00004F44 58 55 02 10 0F 75 A8   572    .db  0xab, 0xaa, 0x00, 0x4e, 0x2f, 0x1f, 0x00, 0x9e, 0x0f, 0xae, 0x01, 0x4f, 0x0a, 0x56, 0x1e, 0x02
             02 10 0F 72 12 34 0F
             5D 53
    00004F54 00 C7 0F 71 05 2F 7D   573    .db  0x0a, 0x23, 0x0e, 0xa1, 0x0f, 0x04, 0x30, 0xef, 0x1e, 0x3d, 0xfa, 0x0e, 0x1e, 0xeb, 0x0f, 0x00
             10 26 F0 07 2E D1 20
             18 04
    00004F64 86 0B 0F A7 10 04 10   574    .db  0xee, 0x0a, 0x58, 0x6a, 0x0e, 0x0f, 0x03, 0x7f, 0x0a, 0x1e, 0x73, 0x0a, 0x03, 0xb5, 0x0a, 0x09
             EF 0F 10 EE 11 BA 00
             0A 10
    00004F74 5B 02 11 0E DF 10 53   575    .db  0x0f, 0xd2, 0x0a, 0x0e, 0x94, 0x00, 0xba, 0x0e, 0x0f, 0xee, 0x02, 0x0f, 0xfa, 0x0e, 0x00, 0xeb
             08 11 8D 08 08 0F B2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 14
Hexadecimal  11-Bits]



             00 EB
    00004F83 0F E6 13 E8 00 04 00   576    .db  0x04, 0x0d, 0x2f, 0x00, 0x0d, 0x3e, 0x0e, 0xae, 0x00, 0x04, 0x08, 0x08, 0x0b, 0x23, 0x00, 0x02
             6B 00 00 D1 02 0B 23
             00 02
    00004F8F 71 00 8B 00            577    .db  0x71, 0x00, 0x8b, 0x00
                                    578 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000004A5   579 _snowball_9_end == . - 1
                                    580 
                                    581 ;; File 'out/snowball_0.h.s' generated using cpct_pack
                                    582 ;; Compresor used:   zx7b
                                    583 ;; Files compressed: [ 'dat/snowball_0.bin' ]
                                    584 ;; Uncompressed:     256 bytes
                                    585 ;; Compressed:       61 bytes
                                    586 ;; Space saved:      195 bytes
                                    587 ;;
                                    588 
                                    589 ;; Declaration of the compressed array and
                                    590 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    591 .globl _snowball_0
                                    592 .globl _snowball_0_end
                                    593 
                                    594 ;; Compressed and uncompressed sizes
                         0000003D   595 _snowball_0_size_z == 61
                         00000100   596 _snowball_0_size   == 256
                                    597 
                                    598 
                                    599 ;; File 'out/snowball_10.h.s' generated using cpct_pack
                                    600 ;; Compresor used:   zx7b
                                    601 ;; Files compressed: [ 'dat/snowball_10.bin' ]
                                    602 ;; Uncompressed:     256 bytes
                                    603 ;; Compressed:       65 bytes
                                    604 ;; Space saved:      191 bytes
                                    605 ;;
                                    606 
                                    607 ;; Declaration of the compressed array and
                                    608 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    609 .globl _snowball_10
                                    610 .globl _snowball_10_end
                                    611 
                                    612 ;; Compressed and uncompressed sizes
                         00000041   613 _snowball_10_size_z == 65
                         00000100   614 _snowball_10_size   == 256
                                    615 
                                    616 
                                    617 ;; File 'out/snowball_11.h.s' generated using cpct_pack
                                    618 ;; Compresor used:   zx7b
                                    619 ;; Files compressed: [ 'dat/snowball_11.bin' ]
                                    620 ;; Uncompressed:     256 bytes
                                    621 ;; Compressed:       63 bytes
                                    622 ;; Space saved:      193 bytes
                                    623 ;;
                                    624 
                                    625 ;; Declaration of the compressed array and
                                    626 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    627 .globl _snowball_11
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 15
Hexadecimal [32-Bits]



                                    628 .globl _snowball_11_end
                                    629 
                                    630 ;; Compressed and uncompressed sizes
                         0000003F   631 _snowball_11_size_z == 63
                         00000100   632 _snowball_11_size   == 256
                                    633 
                                    634 
                                    635 ;; File 'out/snowball_12.h.s' generated using cpct_pack
                                    636 ;; Compresor used:   zx7b
                                    637 ;; Files compressed: [ 'dat/snowball_12.bin' ]
                                    638 ;; Uncompressed:     256 bytes
                                    639 ;; Compressed:       80 bytes
                                    640 ;; Space saved:      176 bytes
                                    641 ;;
                                    642 
                                    643 ;; Declaration of the compressed array and
                                    644 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    645 .globl _snowball_12
                                    646 .globl _snowball_12_end
                                    647 
                                    648 ;; Compressed and uncompressed sizes
                         00000050   649 _snowball_12_size_z == 80
                         00000100   650 _snowball_12_size   == 256
                                    651 
                                    652 
                                    653 ;; File 'out/snowball_13.h.s' generated using cpct_pack
                                    654 ;; Compresor used:   zx7b
                                    655 ;; Files compressed: [ 'dat/snowball_13.bin' ]
                                    656 ;; Uncompressed:     256 bytes
                                    657 ;; Compressed:       68 bytes
                                    658 ;; Space saved:      188 bytes
                                    659 ;;
                                    660 
                                    661 ;; Declaration of the compressed array and
                                    662 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    663 .globl _snowball_13
                                    664 .globl _snowball_13_end
                                    665 
                                    666 ;; Compressed and uncompressed sizes
                         00000044   667 _snowball_13_size_z == 68
                         00000100   668 _snowball_13_size   == 256
                                    669 
                                    670 
                                    671 ;; File 'out/snowball_14.h.s' generated using cpct_pack
                                    672 ;; Compresor used:   zx7b
                                    673 ;; Files compressed: [ 'dat/snowball_14.bin' ]
                                    674 ;; Uncompressed:     256 bytes
                                    675 ;; Compressed:       84 bytes
                                    676 ;; Space saved:      172 bytes
                                    677 ;;
                                    678 
                                    679 ;; Declaration of the compressed array and
                                    680 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    681 .globl _snowball_14
                                    682 .globl _snowball_14_end
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 16
Hexadecimal [32-Bits]



                                    683 
                                    684 ;; Compressed and uncompressed sizes
                         00000054   685 _snowball_14_size_z == 84
                         00000100   686 _snowball_14_size   == 256
                                    687 
                                    688 
                                    689 ;; File 'out/snowball_15.h.s' generated using cpct_pack
                                    690 ;; Compresor used:   zx7b
                                    691 ;; Files compressed: [ 'dat/snowball_15.bin' ]
                                    692 ;; Uncompressed:     256 bytes
                                    693 ;; Compressed:       80 bytes
                                    694 ;; Space saved:      176 bytes
                                    695 ;;
                                    696 
                                    697 ;; Declaration of the compressed array and
                                    698 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    699 .globl _snowball_15
                                    700 .globl _snowball_15_end
                                    701 
                                    702 ;; Compressed and uncompressed sizes
                         00000050   703 _snowball_15_size_z == 80
                         00000100   704 _snowball_15_size   == 256
                                    705 
                                    706 
                                    707 ;; File 'out/snowball_1.h.s' generated using cpct_pack
                                    708 ;; Compresor used:   zx7b
                                    709 ;; Files compressed: [ 'dat/snowball_1.bin' ]
                                    710 ;; Uncompressed:     256 bytes
                                    711 ;; Compressed:       75 bytes
                                    712 ;; Space saved:      181 bytes
                                    713 ;;
                                    714 
                                    715 ;; Declaration of the compressed array and
                                    716 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    717 .globl _snowball_1
                                    718 .globl _snowball_1_end
                                    719 
                                    720 ;; Compressed and uncompressed sizes
                         0000004B   721 _snowball_1_size_z == 75
                         00000100   722 _snowball_1_size   == 256
                                    723 
                                    724 
                                    725 ;; File 'out/snowball_2.h.s' generated using cpct_pack
                                    726 ;; Compresor used:   zx7b
                                    727 ;; Files compressed: [ 'dat/snowball_2.bin' ]
                                    728 ;; Uncompressed:     256 bytes
                                    729 ;; Compressed:       86 bytes
                                    730 ;; Space saved:      170 bytes
                                    731 ;;
                                    732 
                                    733 ;; Declaration of the compressed array and
                                    734 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    735 .globl _snowball_2
                                    736 .globl _snowball_2_end
                                    737 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 17
Hexadecimal [32-Bits]



                                    738 ;; Compressed and uncompressed sizes
                         00000056   739 _snowball_2_size_z == 86
                         00000100   740 _snowball_2_size   == 256
                                    741 
                                    742 
                                    743 ;; File 'out/snowball_3.h.s' generated using cpct_pack
                                    744 ;; Compresor used:   zx7b
                                    745 ;; Files compressed: [ 'dat/snowball_3.bin' ]
                                    746 ;; Uncompressed:     256 bytes
                                    747 ;; Compressed:       88 bytes
                                    748 ;; Space saved:      168 bytes
                                    749 ;;
                                    750 
                                    751 ;; Declaration of the compressed array and
                                    752 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    753 .globl _snowball_3
                                    754 .globl _snowball_3_end
                                    755 
                                    756 ;; Compressed and uncompressed sizes
                         00000058   757 _snowball_3_size_z == 88
                         00000100   758 _snowball_3_size   == 256
                                    759 
                                    760 
                                    761 ;; File 'out/snowball_4.h.s' generated using cpct_pack
                                    762 ;; Compresor used:   zx7b
                                    763 ;; Files compressed: [ 'dat/snowball_4.bin' ]
                                    764 ;; Uncompressed:     256 bytes
                                    765 ;; Compressed:       86 bytes
                                    766 ;; Space saved:      170 bytes
                                    767 ;;
                                    768 
                                    769 ;; Declaration of the compressed array and
                                    770 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    771 .globl _snowball_4
                                    772 .globl _snowball_4_end
                                    773 
                                    774 ;; Compressed and uncompressed sizes
                         00000056   775 _snowball_4_size_z == 86
                         00000100   776 _snowball_4_size   == 256
                                    777 
                                    778 
                                    779 ;; File 'out/snowball_5.h.s' generated using cpct_pack
                                    780 ;; Compresor used:   zx7b
                                    781 ;; Files compressed: [ 'dat/snowball_5.bin' ]
                                    782 ;; Uncompressed:     256 bytes
                                    783 ;; Compressed:       62 bytes
                                    784 ;; Space saved:      194 bytes
                                    785 ;;
                                    786 
                                    787 ;; Declaration of the compressed array and
                                    788 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    789 .globl _snowball_5
                                    790 .globl _snowball_5_end
                                    791 
                                    792 ;; Compressed and uncompressed sizes
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 18
Hexadecimal [32-Bits]



                         0000003E   793 _snowball_5_size_z == 62
                         00000100   794 _snowball_5_size   == 256
                                    795 
                                    796 
                                    797 ;; File 'out/snowball_6.h.s' generated using cpct_pack
                                    798 ;; Compresor used:   zx7b
                                    799 ;; Files compressed: [ 'dat/snowball_6.bin' ]
                                    800 ;; Uncompressed:     256 bytes
                                    801 ;; Compressed:       66 bytes
                                    802 ;; Space saved:      190 bytes
                                    803 ;;
                                    804 
                                    805 ;; Declaration of the compressed array and
                                    806 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    807 .globl _snowball_6
                                    808 .globl _snowball_6_end
                                    809 
                                    810 ;; Compressed and uncompressed sizes
                         00000042   811 _snowball_6_size_z == 66
                         00000100   812 _snowball_6_size   == 256
                                    813 
                                    814 
                                    815 ;; File 'out/snowball_7.h.s' generated using cpct_pack
                                    816 ;; Compresor used:   zx7b
                                    817 ;; Files compressed: [ 'dat/snowball_7.bin' ]
                                    818 ;; Uncompressed:     256 bytes
                                    819 ;; Compressed:       67 bytes
                                    820 ;; Space saved:      189 bytes
                                    821 ;;
                                    822 
                                    823 ;; Declaration of the compressed array and
                                    824 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    825 .globl _snowball_7
                                    826 .globl _snowball_7_end
                                    827 
                                    828 ;; Compressed and uncompressed sizes
                         00000043   829 _snowball_7_size_z == 67
                         00000100   830 _snowball_7_size   == 256
                                    831 
                                    832 
                                    833 ;; File 'out/snowball_8.h.s' generated using cpct_pack
                                    834 ;; Compresor used:   zx7b
                                    835 ;; Files compressed: [ 'dat/snowball_8.bin' ]
                                    836 ;; Uncompressed:     256 bytes
                                    837 ;; Compressed:       75 bytes
                                    838 ;; Space saved:      181 bytes
                                    839 ;;
                                    840 
                                    841 ;; Declaration of the compressed array and
                                    842 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    843 .globl _snowball_8
                                    844 .globl _snowball_8_end
                                    845 
                                    846 ;; Compressed and uncompressed sizes
                         0000004B   847 _snowball_8_size_z == 75
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 19
Hexadecimal [32-Bits]



                         00000100   848 _snowball_8_size   == 256
                                    849 
                                    850 
                                    851 ;; File 'out/snowball_9.h.s' generated using cpct_pack
                                    852 ;; Compresor used:   zx7b
                                    853 ;; Files compressed: [ 'dat/snowball_9.bin' ]
                                    854 ;; Uncompressed:     256 bytes
                                    855 ;; Compressed:       84 bytes
                                    856 ;; Space saved:      172 bytes
                                    857 ;;
                                    858 
                                    859 ;; Declaration of the compressed array and
                                    860 ;; the address of the latest byte of the compressed array (for unpacking purposes)
                                    861 .globl _snowball_9
                                    862 .globl _snowball_9_end
                                    863 
                                    864 ;; Compressed and uncompressed sizes
                         00000054   865 _snowball_9_size_z == 84
                         00000100   866 _snowball_9_size   == 256
                                    867 
                                    868 
