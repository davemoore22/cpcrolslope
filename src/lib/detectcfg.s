;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.area _CODE

; Routines for Hardware Detection
;
; Adapted from those used by ChibiAkumas:
;
; https://www.chibiakumas.com/z80/platform3.php

;Bank numbers
BANK_0 .equ 0xC0
BANK_1 .equ 0xC4
BANK_2 .equ 0xC5
BANK_3 .equ 0xC6
BANK_4 .equ 0xC7
BANK_5 .equ 0xCC
BANK_6 .equ 0xCD
BANK_7 .equ 0xCE
BANK_8 .equ 0xCF

;Memory address of swappable area
BANK_BASE_ADDR .equ 0x4000	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Top level routine called from C
_h_get_details::
h_get_details:	

	ld  de, #0x0000

	push de							; First test for a Plus machine
		call Initialise_Plus
		call Test_For_Plus
	pop de
	jr  nc, Test_Memory
	inc d							; D = 1 if Plus

Test_Memory:

	push de							; Now test for the amount of Memory present
		ld  d, #BANK_4
		call Bank_Test_128
	pop de
	jp nc, Restore_System_State
	inc e							; E = 1 if 128K+

	push de
		ld  d, #BANK_8
		call Bank_Test_256
	pop de
	jp nc, Restore_System_State
	inc e							; E = 2 if 256K+

	ld   a, e						; Return results in A				
	and  #0x03
	ld   b, a						; RAM size → bits 0–1

	ld   a, d						; Plus flag
	and  #0x01
	rlca							; Shift into bit 1
	rlca							; Shift into bit 2

	or   b							; Combine

	jp Restore_System_State								; Return in A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Test banks (128k)
Bank_Test_128:

	ld a, #BANK_0					; Turn Bank 0 on (Base 64k)
	call Bank_Switch_Set_Current

	ld a, #0x69						; Store a byte in the base bank
	ld (BANK_BASE_ADDR), a

	ld a, d
	call Bank_Switch_Set_Current	; Try to turn on the extra bank
	
	ld a, (BANK_BASE_ADDR)			; Alter the bye at the same location
	cpl 
	ld (BANK_BASE_ADDR),a
	
	ld a, #BANK_0					; Turn off the Extra bank
	call Bank_Switch_Set_Current
	
	ld a, (BANK_BASE_ADDR)			; Is the byte we wrote first still there?
	cp #0x69
	jr nz, Bank_Fail				; If it is, then we must have extra ram!
	scf
	ret

Bank_Fail:

	or a
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Test banks (256k+)

; Remember that on a 128K machine, trying to turn on the 256k bank will actually
; turn on the matching 128k bank, not do nothing like on 64k systems! Therefore
; we cannot use the code above and need to use this instead
Bank_Test_256:

	ld a, d							
	and #0b11000111
	call Bank_Switch_Set_Current	; Turn on matching 128k bank

	ld a, #0x69						; Set the marker bit
	ld (BANK_BASE_ADDR), a

	ld a, d
	call Bank_Switch_Set_Current	; Turn on the bank we want to test
	
	ld a, (BANK_BASE_ADDR)			; Flip the bits
	cpl 			
	ld (BANK_BASE_ADDR), a
	
	ld a, d
	and #0b11000111					; Turn on the first bank again
	call Bank_Switch_Set_Current
	
	ld a, (BANK_BASE_ADDR)			; Is the byte we wrote first still there
	cp #0x69
	jr nz, Bank_Fail				; If it is, then we must have extra ram!
	
	
	ld a, #BANK_0
	call Bank_Switch_Set_Current	; Turn off bank switching
	scf
	ret	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
Test_For_Plus:

	ld a, #BANK_0					; Set Bank 0 at &4000
	call Bank_Switch_Set_Current
	
	ld a, #0x69
	ld (BANK_BASE_ADDR), a			; Store a byte at that address

	call CpcPlus_Bank_Enable		; Turn on the Plus bank (note that this will 
									; do nothing on a non-Plus)
	
	ld a ,(BANK_BASE_ADDR)			; Read in the data from that address
	cpl 							; Alter it
	ld (BANK_BASE_ADDR), a			; Save it back
	
	call CpcPlus_Bank_Disable		; Turn off the plus bank
	
	ld a, (BANK_BASE_ADDR)			; See if the data is still in the non-Plus
	cp #0x69						; bank - if it isn't then turning on the
	jr nz, Plus_Fail				; Plus bank didn't work
		
	scf								; Set carry flag
	ret

Plus_Fail:
	or a							; Clear carry flag
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BankSwitch_Default_Mem:

	ld a, #0xC0

Bank_Switch_Set_Current:			; This allows us to remember 'current' bank

	ld bc, #0x7fc0
	ld (BankSwitch_Current_Storage - 2), a
	out (c), a
	ret

	.db 0xC0, 0x00
BankSwitch_Current_Storage:			
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
CpcPlus_Bank_Enable:	

	ld bc, #0x7fb8					; Page in Plus registers
	out (c), c				
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CpcPlus_Bank_Disable:

	ld bc, #0x7fa0					; Page out Plus registers
	out (c), c
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Initialise_Plus:					; Turn on the CPC Plus

	ld bc, #0xbc00
	ld hl, #Plus_Init_Sequence
	ld e, #17

Plus_Init_Loop:						;Send the Plus init sequence

	ld a, (hl)
	out (c), a
	inc hl
	dec e
	jr nz, Plus_Init_Loop
	ret

;This is a special sequence to unock the CPC+ Asic
Plus_Init_Sequence:

	.db 0xff,0x00,0xff,0x77,0xb3,0x51,0xa8,0xd4
	.db 0x62,0x39,0x9c,0x46,0x2b,0x15,0x8a,0xcd
	.db 0xee

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Restore_System_State:

	push af
		ld a, #BANK_0
		ld bc, #0x7FC0
		out (c), a					; restore base RAM

		ld bc, #0x7FA0
		out (c), c					; ASIC off
	pop af

	ret
