ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 1
Hexadecimal [32-Bits]



                                      1 .area _CODE
                                      2 
                                      3 ; HL = start_char (character address)
                                      4 
                         000000BC     5 CRTC_INDEX  .equ 0xBC
                                      6 
                                      7 
    00001AB7                          8 _a_crtc_set_start::
    00001AB7                          9 a_crtc_set_start:
    00001AB7 01 BC 00         [10]   10     ld  bc, #CRTC_INDEX
                                     11 
                                     12     ; R12 = high byte of start address
    00001ABA 3E 0C            [ 7]   13     ld  a, #12
    00001ABC ED 79            [12]   14     out (c), a
    00001ABE 04               [ 4]   15     inc b
    00001ABF 7C               [ 4]   16     ld  a, h
    00001AC0 ED 79            [12]   17     out (c), a
    00001AC2 05               [ 4]   18     dec b
                                     19 
                                     20     ; R13 = low byte of start address
    00001AC3 3E 0D            [ 7]   21     ld  a, #13
    00001AC5 ED 79            [12]   22     out (c), a
    00001AC7 04               [ 4]   23     inc b
    00001AC8 7D               [ 4]   24     ld  a, l
    00001AC9 ED 79            [12]   25     out (c), a
                                     26 
    00001ACB C9               [10]   27     ret
