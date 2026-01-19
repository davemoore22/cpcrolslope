.area _CODE

; HL = start_char (character address)

CRTC_INDEX  .equ 0xBC


_a_crtc_set_start::
a_crtc_set_start:
    ld  bc, #CRTC_INDEX

    ; R12 = high byte of start address
    ld  a, #12
    out (c), a
    inc b
    ld  a, h
    out (c), a
    dec b

    ; R13 = low byte of start address
    ld  a, #13
    out (c), a
    inc b
    ld  a, l
    out (c), a

    ret
