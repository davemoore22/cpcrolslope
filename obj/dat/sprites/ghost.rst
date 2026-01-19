ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 1
Hexadecimal [32-Bits]



                                      1 .area SPRITES
                                      2 
                                      3 ;; File 'out/ghost_0.s' generated using cpct_pack
                                      4 ;; Compresor used:   zx7b
                                      5 ;; Files compressed: [ 'dat/ghost_0.bin' ]
                                      6 ;; Uncompressed:     256 bytes
                                      7 ;; Compressed:       6 bytes
                                      8 ;; Space saved:      250 bytes
                                      9 ;;
                                     10 
                                     11 ;; Data array definition
    000044C0                         12 _ghost_0::
    000044C0 AB AA 00 A9 AA 00       13    .db  0xab, 0xaa, 0x00, 0xa9, 0xaa, 0x00
                                     14 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000005    15 _ghost_0_end == . - 1
                                     16 
                                     17 ;; File 'out/ghost_1.s' generated using cpct_pack
                                     18 ;; Compresor used:   zx7b
                                     19 ;; Files compressed: [ 'dat/ghost_1.bin' ]
                                     20 ;; Uncompressed:     256 bytes
                                     21 ;; Compressed:       48 bytes
                                     22 ;; Space saved:      208 bytes
                                     23 ;;
                                     24 
                                     25 ;; Data array definition
    000044C6                         26 _ghost_1::
    000044C6 AC AA 00 A6 88 00 00    27    .db  0xac, 0xaa, 0x00, 0xa6, 0x88, 0x00, 0x00, 0x04, 0x52, 0x00, 0x0e, 0x0d, 0xc6, 0x0c, 0x00, 0x07
             04 52 00 0E 0D C6 0C
             00 07
    000044D6 4F 05 00 1E 8C 05 0F    28    .db  0x4f, 0x05, 0x00, 0x1e, 0x8c, 0x05, 0x0f, 0x12, 0x4d, 0x0f, 0x37, 0x0e, 0xd1, 0x0f, 0x1d, 0x05
             12 4D 0F 37 0E D1 0F
             1D 05
    000044E6 0F D5 04 0F A8 44 08    29    .db  0x0f, 0xd5, 0x04, 0x0f, 0xa8, 0x44, 0x08, 0x00, 0x00, 0x03, 0x07, 0x00, 0x8d, 0x08, 0x40, 0x01
             00 00 03 07 00 8D 08
             40 01
                                     30 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000035    31 _ghost_1_end == . - 1
                                     32 
                                     33 ;; File 'out/ghost_2.s' generated using cpct_pack
                                     34 ;; Compresor used:   zx7b
                                     35 ;; Files compressed: [ 'dat/ghost_2.bin' ]
                                     36 ;; Uncompressed:     256 bytes
                                     37 ;; Compressed:       50 bytes
                                     38 ;; Space saved:      206 bytes
                                     39 ;;
                                     40 
                                     41 ;; Data array definition
    000044F6                         42 _ghost_2::
    000044F6 58 55 00 4D 05 00 11    43    .db  0x58, 0x55, 0x00, 0x4d, 0x05, 0x00, 0x11, 0x8d, 0x05, 0x11, 0x9e, 0x10, 0x0f, 0x87, 0x05, 0x05
             8D 05 11 9E 10 0F 87
             05 05
    00004506 0F 32 51 BA 0F A1 10    44    .db  0x0f, 0x32, 0x51, 0xba, 0x0f, 0xa1, 0x10, 0x0f, 0xee, 0xa8, 0x05, 0x0f, 0x06, 0x00, 0x0f, 0x04
             0F EE A8 05 0F 06 00
             0F 04
    00004516 5F 0F 81 01 10 0F 0E    45    .db  0x5f, 0x0f, 0x81, 0x01, 0x10, 0x0f, 0x0e, 0x06, 0x06, 0x01, 0x08, 0x08, 0x05, 0x07, 0x03, 0x00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 2
Hexadecimal  06-Bits]



             06 06 01 08 08 05 07
             03 00
    0000451E 06 01                   46    .db  0xac, 0x00
                                     47 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000067    48 _ghost_2_end == . - 1
                                     49 
                                     50 ;; File 'out/ghost_3.s' generated using cpct_pack
                                     51 ;; Compresor used:   zx7b
                                     52 ;; Files compressed: [ 'dat/ghost_3.bin' ]
                                     53 ;; Uncompressed:     256 bytes
                                     54 ;; Compressed:       38 bytes
                                     55 ;; Space saved:      218 bytes
                                     56 ;;
                                     57 
                                     58 ;; Data array definition
    00000068                         59 _ghost_3::
    00004520 08 08 05 07 03 00 AC    60    .db  0x60, 0x55, 0x00, 0x35, 0x45, 0x06, 0x71, 0x02, 0x0f, 0xb5, 0x20, 0x17, 0x3e, 0x1f, 0x06, 0x02
             00 0F B5 20 17 3E 1F
             06 02
    00004528 08 1A 10 04 53 10 00    61    .db  0x08, 0x1a, 0x10, 0x04, 0x53, 0x10, 0x00, 0x02, 0x0e, 0x2f, 0x00, 0x00, 0x47, 0x02, 0x05, 0x05
             02 0E 2F 00 00 47 02
             05 05
    00004528 60 55 00 35 45 06       62    .db  0x00, 0x04, 0x05, 0x07, 0x18, 0x08
                                     63 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         0000008D    64 _ghost_3_end == . - 1
                                     65 
                                     66 ;; File 'out/ghost_4.s' generated using cpct_pack
                                     67 ;; Compresor used:   zx7b
                                     68 ;; Files compressed: [ 'dat/ghost_4.bin' ]
                                     69 ;; Uncompressed:     256 bytes
                                     70 ;; Compressed:       37 bytes
                                     71 ;; Space saved:      219 bytes
                                     72 ;;
                                     73 
                                     74 ;; Data array definition
    0000008E                         75 _ghost_4::
    0000452E 71 02 0F B5 20 17 3E    76    .db  0xac, 0xaa, 0x0f, 0xa6, 0x01, 0x0f, 0x4a, 0x05, 0x00, 0x0e, 0xf5, 0x07, 0x0f, 0x16, 0x0e, 0x31
             1F 06 02 08 1A 10 04
             53 10
    0000453E 00 02 0E 2F 00 00 47    77    .db  0x0f, 0x17, 0x00, 0x03, 0x05, 0x11, 0x0f, 0xa1, 0x02, 0x07, 0x0f, 0x32, 0x8a, 0x07, 0x00, 0x12
             02 05 05 00 04 05 07
             18 08
    0000454E 08 07 08 11 08          78    .db  0x08, 0x07, 0x08, 0x11, 0x08
                                     79 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000000B2    80 _ghost_4_end == . - 1
                                     81 
                                     82 ;; File 'out/ghost_5.s' generated using cpct_pack
                                     83 ;; Compresor used:   zx7b
                                     84 ;; Files compressed: [ 'dat/ghost_5.bin' ]
                                     85 ;; Uncompressed:     256 bytes
                                     86 ;; Compressed:       58 bytes
                                     87 ;; Space saved:      198 bytes
                                     88 ;;
                                     89 
                                     90 ;; Data array definition
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 3
Hexadecimal [32-Bits]



    000000B3                         91 _ghost_5::
    0000454E AC AA 0F A6 01 0F 4A    92    .db  0x60, 0x55, 0x06, 0x06, 0x01, 0x15, 0x0f, 0xa1, 0x01, 0x01, 0x05, 0x0f, 0x48, 0x1d, 0x75, 0x4f
             05 00 0E F5 07 0F 16
             0E 31
    0000455E 0F 17 00 03 05 11 0F    93    .db  0x53, 0x04, 0x1f, 0x85, 0x07, 0x03, 0x02, 0x02, 0x0f, 0xc2, 0x05, 0x04, 0x20, 0x03, 0x0f, 0x52
             A1 02 07 0F 32 8A 07
             00 12
    0000456E 08 07 08 11 08 0F B4    94    .db  0x0e, 0x0f, 0xdd, 0x41, 0x08, 0x0f, 0xb4, 0x08, 0x0f, 0xaa, 0x07, 0x51, 0x07, 0x08, 0x0f, 0x2c
             08 0F AA 07 51 07 08
             0F 2C
    00004573 08 08 05 07 05 03 02    95    .db  0x08, 0x08, 0x05, 0x07, 0x05, 0x03, 0x02, 0x00, 0x81, 0x00
             00 81 00
                                     96 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000000EC    97 _ghost_5_end == . - 1
                                     98 
                                     99 ;; File 'out/ghost_6.s' generated using cpct_pack
                                    100 ;; Compresor used:   zx7b
                                    101 ;; Files compressed: [ 'dat/ghost_6.bin' ]
                                    102 ;; Uncompressed:     256 bytes
                                    103 ;; Compressed:       86 bytes
                                    104 ;; Space saved:      170 bytes
                                    105 ;;
                                    106 
                                    107 ;; Data array definition
    000000ED                        108 _ghost_6::
    00004573 60 55 06 06 01 15 0F   109    .db  0x58, 0x55, 0x1f, 0x1d, 0x8f, 0x61, 0x00, 0x0d, 0x33, 0x21, 0x02, 0xd3, 0x1d, 0x0b, 0x0f, 0x10
             A1 01 01 05 0F 48 1D
             75 4F
    00004583 53 04 1F 85 07 03 02   110    .db  0x07, 0x53, 0x00, 0x40, 0x3f, 0xfb, 0x10, 0x61, 0x6b, 0x07, 0x51, 0x0b, 0x70, 0xfa, 0x00, 0xc1
             02 0F C2 05 04 20 03
             0F 52
    00004593 0E 0F DD 41 08 0F B4   111    .db  0x51, 0x0e, 0x21, 0x3f, 0x1d, 0x70, 0x2d, 0x5d, 0x73, 0x1c, 0x0f, 0xf1, 0x50, 0x07, 0x1b, 0x08
             08 0F AA 07 51 07 08
             0F 2C
    000045A3 08 08 05 07 05 03 02   112    .db  0x07, 0x07, 0x13, 0x1f, 0x0f, 0xeb, 0x02, 0x08, 0x08, 0x0a, 0x21, 0xf3, 0x02, 0xba, 0x05, 0x0b
             00 81 00 21 F3 02 BA
             05 0B
    000045AD 21 32 05 04 0C 90 05   113    .db  0x21, 0x32, 0x05, 0x04, 0x0c, 0x90, 0x05, 0x02, 0x10, 0x19, 0x04, 0x02, 0x0c, 0xf4, 0x10, 0x8b
             02 10 19 04 02 0C F4
             10 8B
    000045AD 58 55 1F 1D 8F 61      114    .db  0x02, 0x02, 0x00, 0x92, 0x80, 0x00
                                    115 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000142   116 _ghost_6_end == . - 1
                                    117 
                                    118 ;; File 'out/ghost_7.s' generated using cpct_pack
                                    119 ;; Compresor used:   zx7b
                                    120 ;; Files compressed: [ 'dat/ghost_7.bin' ]
                                    121 ;; Uncompressed:     256 bytes
                                    122 ;; Compressed:       103 bytes
                                    123 ;; Space saved:      153 bytes
                                    124 ;;
                                    125 
                                    126 ;; Data array definition
    00000143                        127 _ghost_7::
    000045B3 00 0D 33 21 02 D3 1D   128    .db  0xc0, 0xaa, 0x02, 0xea, 0x0f, 0x1c, 0xeb, 0x07, 0x0f, 0xfa, 0x0c, 0xba, 0x05, 0x0f, 0x16, 0x05
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 4
Hexadecimal  0B-Bits]



             07 0F FA 0C BA 05 0F
             16 05
    000045BB 0F 10 07 53 00 40 3F   129    .db  0x42, 0x0f, 0xdf, 0x5b, 0x74, 0x0a, 0x00, 0xc7, 0x2a, 0x2c, 0xdd, 0x0a, 0x0f, 0xdd, 0x4b, 0x71
             FB 10 61 6B 07 51 0B
             70 FA
    000045CB 00 C1 51 0E 21 3F 1D   130    .db  0x07, 0x11, 0x0e, 0x03, 0x7d, 0x0f, 0x8e, 0x37, 0x0d, 0x18, 0x02, 0xff, 0x0f, 0x1e, 0x9b, 0x1c
             70 2D 5D 73 1C 0F F1
             50 07
    000045DB 1B 08 07 07 13 1F 0F   131    .db  0x33, 0x0f, 0x6f, 0x03, 0x00, 0x08, 0x01, 0xbe, 0x1c, 0x23, 0x0f, 0xcf, 0x13, 0x07, 0x03, 0x07
             EB 02 08 08 0A 21 F3
             02 BA
    000045EB 05 0B 21 32 05 04 0C   132    .db  0x08, 0x07, 0x07, 0x0f, 0x2c, 0x16, 0xe7, 0x11, 0x05, 0x05, 0x10, 0xc9, 0x07, 0x0e, 0x03, 0x03
             90 05 02 10 19 04 02
             0C F4
    000045FB 10 8B 02 02 00 92 80   133    .db  0x0e, 0x26, 0x14, 0x13, 0x73, 0x03, 0x05, 0x0e, 0x08, 0x13, 0xf9, 0x02, 0x41, 0x04, 0x04, 0x0e
             00 08 13 F9 02 41 04
             04 0E
    00004603 8C 02 02 00 32 82 00   134    .db  0x8c, 0x02, 0x02, 0x00, 0x32, 0x82, 0x00
                                    135 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000001A9   136 _ghost_7_end == . - 1
                                    137 
                                    138 ;; File 'out/ghost_8.s' generated using cpct_pack
                                    139 ;; Compresor used:   zx7b
                                    140 ;; Files compressed: [ 'dat/ghost_8.bin' ]
                                    141 ;; Uncompressed:     256 bytes
                                    142 ;; Compressed:       53 bytes
                                    143 ;; Space saved:      203 bytes
                                    144 ;;
                                    145 
                                    146 ;; Data array definition
    000001AA                        147 _ghost_8::
    00004603 C0 AA 02 EA 0F 1C EB   148    .db  0xab, 0xaa, 0x0f, 0x05, 0x0f, 0x69, 0x08, 0x0f, 0xd1, 0x03, 0x05, 0x03, 0x0f, 0x58, 0x04, 0x0f
             07 0F FA 0C BA 05 0F
             16 05
    00004613 42 0F DF 5B 74 0A 00   149    .db  0x14, 0x10, 0x05, 0x0f, 0xba, 0x08, 0x54, 0x02, 0x03, 0x0f, 0x8c, 0x05, 0x02, 0x0f, 0x4a, 0xa2
             C7 2A 2C DD 0A 0F DD
             4B 71
    00004623 07 11 0E 03 7D 0F 8E   150    .db  0x05, 0x07, 0x07, 0x0f, 0x08, 0x04, 0x07, 0x04, 0x0e, 0x45, 0x03, 0x03, 0x28, 0x0e, 0xa3, 0x02
             37 0D 18 02 FF 0F 1E
             9B 1C
    00004633 33 0F 6F 03 00         151    .db  0x02, 0x00, 0x84, 0x82, 0x00
                                    152 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         000001DE   153 _ghost_8_end == . - 1
                                    154 
