ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 1
Hexadecimal [32-Bits]



                                      1 .area SPRITES
                                      2 
                                      3 ;; File 'out/play_0.s' generated using cpct_pack
                                      4 ;; Compresor used:   zx7b
                                      5 ;; Files compressed: [ 'dat/play_0.bin' ]
                                      6 ;; Uncompressed:     256 bytes
                                      7 ;; Compressed:       72 bytes
                                      8 ;; Space saved:      184 bytes
                                      9 ;;
                                     10 
                                     11 ;; Data array definition
    00004905                         12 _play_0::
    00004905 C0 AA 00 EA A8 B8 B0    13    .db  0xc0, 0xaa, 0x00, 0xea, 0xa8, 0xb8, 0xb0, 0xaf, 0xc2, 0x78, 0x18, 0x10, 0xa6, 0x0f, 0x81, 0x00
             AF C2 78 18 10 A6 0F
             81 00
    00004915 04 BB 02 0C 0C 0F 58    14    .db  0x04, 0xbb, 0x02, 0x0c, 0x0c, 0x0f, 0x58, 0x03, 0x70, 0x04, 0x06, 0x0a, 0x77, 0x0a, 0x0f, 0x0e
             03 70 04 06 0A 77 0A
             0F 0E
    00004925 C6 0F 74 00 05 DD 02    15    .db  0xc6, 0x0f, 0x74, 0x00, 0x05, 0xdd, 0x02, 0x07, 0x07, 0x02, 0x18, 0x85, 0x06, 0x75, 0x08, 0x1d
             07 07 02 18 85 06 75
             08 1D
    00004935 0F 05 53 05 00 0F 76    16    .db  0x0f, 0x05, 0x53, 0x05, 0x00, 0x0f, 0x76, 0x08, 0x35, 0x02, 0x10, 0x8d, 0x00, 0x04, 0x08, 0xa1
             08 35 02 10 8D 00 04
             08 A1
    00004945 0C 00 D7 02 00 50 AA    17    .db  0x0c, 0x00, 0xd7, 0x02, 0x00, 0x50, 0xaa, 0x00
             00
                                     18 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000047    19 _play_0_end == . - 1
                                     20 
                                     21 ;; File 'out/play_1.s' generated using cpct_pack
                                     22 ;; Compresor used:   zx7b
                                     23 ;; Files compressed: [ 'dat/play_1.bin' ]
                                     24 ;; Uncompressed:     256 bytes
                                     25 ;; Compressed:       64 bytes
                                     26 ;; Space saved:      192 bytes
                                     27 ;;
                                     28 
                                     29 ;; Data array definition
    0000494D                         30 _play_1::
    0000494D AB AA 00 09 08 B1 8B    31    .db  0xab, 0xaa, 0x00, 0x09, 0x08, 0xb1, 0x8b, 0x02, 0x0f, 0x12, 0x05, 0x10, 0xdc, 0x0c, 0x0c, 0x27
             02 0F 12 05 10 DC 0C
             0C 27
    0000495D 0C 65 0F 01 07 A6 10    32    .db  0x0c, 0x65, 0x0f, 0x01, 0x07, 0xa6, 0x10, 0x00, 0x9b, 0x0a, 0x0f, 0x46, 0x09, 0x05, 0xd7, 0x07
             00 9B 0A 0F 46 09 05
             D7 07
    0000496D 07 0F 94 09 D1 00 05    33    .db  0x07, 0x0f, 0x94, 0x09, 0xd1, 0x00, 0x05, 0xf5, 0x0f, 0x05, 0x05, 0x0f, 0x97, 0x05, 0xd5, 0x09
             F5 0F 05 05 0F 97 05
             D5 09
    0000497D 05 C3 02 04 04 11 04    34    .db  0x05, 0xc3, 0x02, 0x04, 0x04, 0x11, 0x04, 0x03, 0x05, 0xef, 0x02, 0x02, 0x00, 0xca, 0xaa, 0x00
             03 05 EF 02 02 00 CA
             AA 00
                                     35 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000087    36 _play_1_end == . - 1
                                     37 
                                     38 ;; File 'out/play_2.s' generated using cpct_pack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 2
Hexadecimal [32-Bits]



                                     39 ;; Compresor used:   zx7b
                                     40 ;; Files compressed: [ 'dat//play_2.bin' ]
                                     41 ;; Uncompressed:     256 bytes
                                     42 ;; Compressed:       18 bytes
                                     43 ;; Space saved:      238 bytes
                                     44 ;;
                                     45 
                                     46 ;; Data array definition
    0000498D                         47 _play_2::
    0000498D 60 55 60 75 10 D5 0F    48    .db  0x60, 0x55, 0x60, 0x75, 0x10, 0xd5, 0x0f, 0x47, 0x0c, 0x02, 0x0f, 0x65, 0x02, 0x54, 0x00, 0xa3
             47 0C 02 0F 65 02 54
             00 A3
    0000499D 82 00                   49    .db  0x82, 0x00
                                     50 ;; Address of the latest byte of the compressed array (for unpacking purposes)
                         00000099    51 _play_2_end == . - 1
                                     52 
