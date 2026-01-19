ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 1
Hexadecimal [32-Bits]



                                      1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                      2 
                                      3 .area _CODE
                                      4 
                                      5 ; Routines for Hardware Detection
                                      6 ;
                                      7 ; Adapted from those used by ChibiAkumas:
                                      8 ;
                                      9 ; https://www.chibiakumas.com/z80/platform3.php
                                     10 
                                     11 ;Bank numbers
                         000000C0    12 BANK_0 .equ 0xC0
                         000000C4    13 BANK_1 .equ 0xC4
                         000000C5    14 BANK_2 .equ 0xC5
                         000000C6    15 BANK_3 .equ 0xC6
                         000000C7    16 BANK_4 .equ 0xC7
                         000000CC    17 BANK_5 .equ 0xCC
                         000000CD    18 BANK_6 .equ 0xCD
                         000000CE    19 BANK_7 .equ 0xCE
                         000000CF    20 BANK_8 .equ 0xCF
                                     21 
                                     22 ;Memory address of swappable area
                         00004000    23 BANK_BASE_ADDR .equ 0x4000	
                                     24 
                                     25 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     26 
                                     27 ; Top level routine called from C
    00001ACC                         28 _h_get_details::
    00001ACC                         29 h_get_details:	
                                     30 
    00001ACC 11 00 00         [10]   31 	ld  de, #0x0000
                                     32 
    00001ACF D5               [11]   33 	push de							; First test for a Plus machine
    00001AD0 CD 87 1B         [17]   34 		call Initialise_Plus
    00001AD3 CD 4C 1B         [17]   35 		call Test_For_Plus
    00001AD6 D1               [10]   36 	pop de
    00001AD7 30 01            [12]   37 	jr  nc, Test_Memory
    00001AD9 14               [ 4]   38 	inc d							; D = 1 if Plus
                                     39 
    00001ADA                         40 Test_Memory:
                                     41 
    00001ADA D5               [11]   42 	push de							; Now test for the amount of Memory present
    00001ADB 16 C7            [ 7]   43 		ld  d, #BANK_4
    00001ADD CD FD 1A         [17]   44 		call Bank_Test_128
    00001AE0 D1               [10]   45 	pop de
    00001AE1 D2 A8 1B         [10]   46 	jp nc, Restore_System_State
    00001AE4 1C               [ 4]   47 	inc e							; E = 1 if 128K+
                                     48 
    00001AE5 D5               [11]   49 	push de
    00001AE6 16 CF            [ 7]   50 		ld  d, #BANK_8
    00001AE8 CD 22 1B         [17]   51 		call Bank_Test_256
    00001AEB D1               [10]   52 	pop de
    00001AEC D2 A8 1B         [10]   53 	jp nc, Restore_System_State
    00001AEF 1C               [ 4]   54 	inc e							; E = 2 if 256K+
                                     55 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 2
Hexadecimal [32-Bits]



    00001AF0 7B               [ 4]   56 	ld   a, e						; Return results in A				
    00001AF1 E6 03            [ 7]   57 	and  #0x03
    00001AF3 47               [ 4]   58 	ld   b, a						; RAM size → bits 0–1
                                     59 
    00001AF4 7A               [ 4]   60 	ld   a, d						; Plus flag
    00001AF5 E6 01            [ 7]   61 	and  #0x01
    00001AF7 07               [ 4]   62 	rlca							; Shift into bit 1
    00001AF8 07               [ 4]   63 	rlca							; Shift into bit 2
                                     64 
    00001AF9 B0               [ 4]   65 	or   b							; Combine
                                     66 
    00001AFA C3 A8 1B         [10]   67 	jp Restore_System_State								; Return in A
                                     68 
                                     69 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                     70 
                                     71 ; Test banks (128k)
    00001AFD                         72 Bank_Test_128:
                                     73 
    00001AFD 3E C0            [ 7]   74 	ld a, #BANK_0					; Turn Bank 0 on (Base 64k)
    00001AFF CD 70 1B         [17]   75 	call Bank_Switch_Set_Current
                                     76 
    00001B02 3E 69            [ 7]   77 	ld a, #0x69						; Store a byte in the base bank
    00001B04 32 00 40         [13]   78 	ld (BANK_BASE_ADDR), a
                                     79 
    00001B07 7A               [ 4]   80 	ld a, d
    00001B08 CD 70 1B         [17]   81 	call Bank_Switch_Set_Current	; Try to turn on the extra bank
                                     82 	
    00001B0B 3A 00 40         [13]   83 	ld a, (BANK_BASE_ADDR)			; Alter the bye at the same location
    00001B0E 2F               [ 4]   84 	cpl 
    00001B0F 32 00 40         [13]   85 	ld (BANK_BASE_ADDR),a
                                     86 	
    00001B12 3E C0            [ 7]   87 	ld a, #BANK_0					; Turn off the Extra bank
    00001B14 CD 70 1B         [17]   88 	call Bank_Switch_Set_Current
                                     89 	
    00001B17 3A 00 40         [13]   90 	ld a, (BANK_BASE_ADDR)			; Is the byte we wrote first still there?
    00001B1A FE 69            [ 7]   91 	cp #0x69
    00001B1C 20 02            [12]   92 	jr nz, Bank_Fail				; If it is, then we must have extra ram!
    00001B1E 37               [ 4]   93 	scf
    00001B1F C9               [10]   94 	ret
                                     95 
    00001B20                         96 Bank_Fail:
                                     97 
    00001B20 B7               [ 4]   98 	or a
    00001B21 C9               [10]   99 	ret
                                    100 	
                                    101 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    102 
                                    103 ; Test banks (256k+)
                                    104 
                                    105 ; Remember that on a 128K machine, trying to turn on the 256k bank will actually
                                    106 ; turn on the matching 128k bank, not do nothing like on 64k systems! Therefore
                                    107 ; we cannot use the code above and need to use this instead
    00001B22                        108 Bank_Test_256:
                                    109 
    00001B22 7A               [ 4]  110 	ld a, d							
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 3
Hexadecimal [32-Bits]



    00001B23 E6 C7            [ 7]  111 	and #0b11000111
    00001B25 CD 70 1B         [17]  112 	call Bank_Switch_Set_Current	; Turn on matching 128k bank
                                    113 
    00001B28 3E 69            [ 7]  114 	ld a, #0x69						; Set the marker bit
    00001B2A 32 00 40         [13]  115 	ld (BANK_BASE_ADDR), a
                                    116 
    00001B2D 7A               [ 4]  117 	ld a, d
    00001B2E CD 70 1B         [17]  118 	call Bank_Switch_Set_Current	; Turn on the bank we want to test
                                    119 	
    00001B31 3A 00 40         [13]  120 	ld a, (BANK_BASE_ADDR)			; Flip the bits
    00001B34 2F               [ 4]  121 	cpl 			
    00001B35 32 00 40         [13]  122 	ld (BANK_BASE_ADDR), a
                                    123 	
    00001B38 7A               [ 4]  124 	ld a, d
    00001B39 E6 C7            [ 7]  125 	and #0b11000111					; Turn on the first bank again
    00001B3B CD 70 1B         [17]  126 	call Bank_Switch_Set_Current
                                    127 	
    00001B3E 3A 00 40         [13]  128 	ld a, (BANK_BASE_ADDR)			; Is the byte we wrote first still there
    00001B41 FE 69            [ 7]  129 	cp #0x69
    00001B43 20 DB            [12]  130 	jr nz, Bank_Fail				; If it is, then we must have extra ram!
                                    131 	
                                    132 	
    00001B45 3E C0            [ 7]  133 	ld a, #BANK_0
    00001B47 CD 70 1B         [17]  134 	call Bank_Switch_Set_Current	; Turn off bank switching
    00001B4A 37               [ 4]  135 	scf
    00001B4B C9               [10]  136 	ret	
                                    137 	
                                    138 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    139 	
    00001B4C                        140 Test_For_Plus:
                                    141 
    00001B4C 3E C0            [ 7]  142 	ld a, #BANK_0					; Set Bank 0 at &4000
    00001B4E CD 70 1B         [17]  143 	call Bank_Switch_Set_Current
                                    144 	
    00001B51 3E 69            [ 7]  145 	ld a, #0x69
    00001B53 32 00 40         [13]  146 	ld (BANK_BASE_ADDR), a			; Store a byte at that address
                                    147 
    00001B56 CD 7B 1B         [17]  148 	call CpcPlus_Bank_Enable		; Turn on the Plus bank (note that this will 
                                    149 									; do nothing on a non-Plus)
                                    150 	
    00001B59 3A 00 40         [13]  151 	ld a ,(BANK_BASE_ADDR)			; Read in the data from that address
    00001B5C 2F               [ 4]  152 	cpl 							; Alter it
    00001B5D 32 00 40         [13]  153 	ld (BANK_BASE_ADDR), a			; Save it back
                                    154 	
    00001B60 CD 81 1B         [17]  155 	call CpcPlus_Bank_Disable		; Turn off the plus bank
                                    156 	
    00001B63 3A 00 40         [13]  157 	ld a, (BANK_BASE_ADDR)			; See if the data is still in the non-Plus
    00001B66 FE 69            [ 7]  158 	cp #0x69						; bank - if it isn't then turning on the
    00001B68 20 02            [12]  159 	jr nz, Plus_Fail				; Plus bank didn't work
                                    160 		
    00001B6A 37               [ 4]  161 	scf								; Set carry flag
    00001B6B C9               [10]  162 	ret
                                    163 
    00001B6C                        164 Plus_Fail:
    00001B6C B7               [ 4]  165 	or a							; Clear carry flag
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 4
Hexadecimal [32-Bits]



    00001B6D C9               [10]  166 	ret
                                    167 
                                    168 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    169 
    00001B6E                        170 BankSwitch_Default_Mem:
                                    171 
    00001B6E 3E C0            [ 7]  172 	ld a, #0xC0
                                    173 
    00001B70                        174 Bank_Switch_Set_Current:			; This allows us to remember 'current' bank
                                    175 
    00001B70 01 C0 7F         [10]  176 	ld bc, #0x7fc0
    00001B73 32 79 1B         [13]  177 	ld (BankSwitch_Current_Storage - 2), a
    00001B76 ED 79            [12]  178 	out (c), a
    00001B78 C9               [10]  179 	ret
                                    180 
    00001B79 C0 00                  181 	.db 0xC0, 0x00
    00001B7B                        182 BankSwitch_Current_Storage:			
                                    183 	
                                    184 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    185 	
    00001B7B                        186 CpcPlus_Bank_Enable:	
                                    187 
    00001B7B 01 B8 7F         [10]  188 	ld bc, #0x7fb8					; Page in Plus registers
    00001B7E ED 49            [12]  189 	out (c), c				
    00001B80 C9               [10]  190 	ret
                                    191 
                                    192 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    00001B81                        193 CpcPlus_Bank_Disable:
                                    194 
    00001B81 01 A0 7F         [10]  195 	ld bc, #0x7fa0					; Page out Plus registers
    00001B84 ED 49            [12]  196 	out (c), c
    00001B86 C9               [10]  197 	ret
                                    198 
                                    199 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    200 
    00001B87                        201 Initialise_Plus:					; Turn on the CPC Plus
                                    202 
    00001B87 01 00 BC         [10]  203 	ld bc, #0xbc00
    00001B8A 21 97 1B         [10]  204 	ld hl, #Plus_Init_Sequence
    00001B8D 1E 11            [ 7]  205 	ld e, #17
                                    206 
    00001B8F                        207 Plus_Init_Loop:						;Send the Plus init sequence
                                    208 
    00001B8F 7E               [ 7]  209 	ld a, (hl)
    00001B90 ED 79            [12]  210 	out (c), a
    00001B92 23               [ 6]  211 	inc hl
    00001B93 1D               [ 4]  212 	dec e
    00001B94 20 F9            [12]  213 	jr nz, Plus_Init_Loop
    00001B96 C9               [10]  214 	ret
                                    215 
                                    216 ;This is a special sequence to unock the CPC+ Asic
    00001B97                        217 Plus_Init_Sequence:
                                    218 
    00001B97 FF 00 FF 77 B3 51 A8   219 	.db 0xff,0x00,0xff,0x77,0xb3,0x51,0xa8,0xd4
             D4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 5
Hexadecimal [32-Bits]



    00001B9F 62 39 9C 46 2B 15 8A   220 	.db 0x62,0x39,0x9c,0x46,0x2b,0x15,0x8a,0xcd
             CD
    00001BA7 EE                     221 	.db 0xee
                                    222 
                                    223 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    224 
    00001BA8                        225 Restore_System_State:
                                    226 
    00001BA8 F5               [11]  227 	push af
    00001BA9 3E C0            [ 7]  228 		ld a, #BANK_0
    00001BAB 01 C0 7F         [10]  229 		ld bc, #0x7FC0
    00001BAE ED 79            [12]  230 		out (c), a					; restore base RAM
                                    231 
    00001BB0 01 A0 7F         [10]  232 		ld bc, #0x7FA0
    00001BB3 ED 49            [12]  233 		out (c), c					; ASIC off
    00001BB5 F1               [10]  234 	pop af
                                    235 
    00001BB6 C9               [10]  236 	ret
