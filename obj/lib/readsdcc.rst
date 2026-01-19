ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 1
Hexadecimal [32-Bits]



                                      1 ;	FDC Code reading AMSDOS file
                                      2 ;	Without system.
                                      3 ;	V1.0
                                      4 ;
                                      5 ;	By Targhan/Arkos
                                      6 ;
                                      7 ;	AMSDOS limitations still present.
                                      8 ;	9 2-sized sectors per track (c1-c9), one side.
                                      9 ;	However, can read sectors up to 41 tracks
                                     10 ;	(used by files copied with Disc'o'Magic, for example).
                                     11 ;
                                     12 ;	Can't read ASCII files (who cares ?)
                                     13 ;
                                     14 ;
                                     15 ;	Filename entered follow the format =
                                     16 ;	AAAAAAAABBB
                                     17 ;	Use upper case only. Do not put the '.'.
                                     18 ;
                                     19 ;
                                     20 ;
                                     21 ;	Proper use =
                                     22 ;	call FDCON	to turn the drive ON
                                     23 ;
                                     24 ;	ld a,drive	(0-3)
                                     25 ;	ld b,head	(0-1)
                                     26 ;	call FDCVARS	to tell which drive to use, head to read.
                                     27 ;
                                     28 ;	ld hl,FILENAME
                                     29 ;	ld de,destination
                                     30 ;	ld bc,buffer	read below about it.
                                     31 ;	call LOADFILE	to load the file.
                                     32 ;	Return =
                                     33 ;	A=state. 0=ok  1=disc missing  2=read fail
                                     34 ;	3=file not found
                                     35 ;
                                     36 ;	When you've loaded all the files you wanted =
                                     37 ;	call FDCOFF
                                     38 ;
                                     39 ;	You shouldn't need it, but...
                                     40 ;	call RECALIBR
                                     41 ;	to recalibrate the current drive (use FDCON
                                     42 ;	and FDCVARS first !). AMSDOS does it when you turn
                                     43 ;	the CPC on. You can also do it when an error disc
                                     44 ;	happened, before trying loading the file again.
                                     45 ;
                                     46 ;	That's it !
                                     47 ;
                                     48 ;
                                     49 ;	Notes
                                     50 ;	- The 'buffer' of LOADFILE CAN be equal to DE. It is used
                                     51 ;	  to load one sector of the Directory. In the case you want
                                     52 ;	  to load a screen in #c000, you might want to set BC to
                                     53 ;	  another address, so that you don't see garbage at the
                                     54 ;	  beginning of the loading.
                                     55 ;	- By changing the Head, you can read the file on the second
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 2
Hexadecimal [32-Bits]



                                     56 ;  	 side of a 3"5 disc.
                                     57 ;	- Automatically skips the AMSDOS header.
                                     58 ;	- Even if the file is not found, 512 bytes will be use
                                     59 ;	from the 'destination' address.
                                     60 ;	- The User of a file is ignored (who cares ?), except for deleted files.
                                     61 ;	- No buffer is needed.
                                     62 ;	- The interruptions are CUT by the loading code.
                                     63 ;	- Interruptions are turned on when turning on the FDC, so
                                     64 ;	  put #c9fb in #38 before if you don't want your
                                     65 ;	  interruptions code to be run at this moment.
                                     66 ;	- Some little tables are defined at the end. You can relocate
                                     67 ;	  them where you want if needed.
                                     68 ;
                                     69 ;
                                     70 ;
                                     71 ;; Adaptation for CPCTelera by Christophe Kohler and Arnaud Bouche (@Arnaud6128)
                                     72 ;; 07/2026 Fix loading TABSECTS in DE
                                     73 
                         000000C1    74 .equ DIRFSECT,0xC1
                         00000004    75 .equ NBMAXENT,4
                         00000000    76 .equ DIRTRACK, 0
                                     77 
                                     78 ;;void asm_LoadFile(u8* fileName, u8* destBuffer, u8* sectorTable) __z88dk_callee;
    00001BB7                         79 _asm_load_file::
                                     80 	;; CPCtelera get parameters from the Stack
                                     81 	
                                     82 	
                                     83  ;; Get parameters from HL and DE registers and stack ((16 + 16) + (8 + 8) bits), with __sdcccall(1) convention
                                     84    ;; HL = File name
                                     85    ;; DE = Destination buffer size minimum of 512kb
                                     86    
                                     87    ;; Get next parameters from the stack 
    00001BB7 F1               [10]   88    pop  af   ;; [3] AF = Return Address
    00001BB8 C1               [10]   89    pop  bc   ;; [3] BC = BC = Sector table buffer of 256Kb
    00001BB9 F5               [11]   90    push af          ;; [4] AF = Returning back address in the stack because function uses __z88dk_callee convention
                                     91 	
                                     92 	;; Store the sector table address
    00001BBA ED 43 85 1E      [20]   93 	ld (TABSECTS), bc
                                     94 	
                                     95 	;; Save IX and IY register to be restored
    00001BBE DD 22 D5 1B      [20]   96 	ld  (RESTORE_IX + 2), ix
    00001BC2 FD 22 D9 1B      [20]   97 	ld  (RESTORE_IY + 2), iy
                                     98 
    00001BC6 AF               [ 4]   99     xor a
    00001BC7 06 00            [ 7]  100     ld b,#0
    00001BC9 CD E9 1B         [17]  101     call FDCVARS
                                    102    
                                    103     ;; Buffer = Destination
    00001BCC 42               [ 4]  104     ld b, d
    00001BCD 4B               [ 4]  105 	ld c, e
    00001BCE CD 21 1C         [17]  106     call LOADFILE
                                    107     
    00001BD1 30 09            [12]  108 	jr nc,ERROR
                                    109 	
    00001BD3                        110 RESTORE_IX:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 3
Hexadecimal [32-Bits]



    00001BD3 DD 21 00 00      [14]  111     ld ix, #0000
                                    112    
    00001BD7                        113 RESTORE_IY:
    00001BD7 FD 21 00 00      [14]  114 	ld iy, #0000
    00001BDB C9               [10]  115     ret 
                                    116 	
    00001BDC                        117 ERROR: 
    00001BDC 01 10 7F         [10]  118     ld bc,#0x7f10 ; CK : Screen border RED
    00001BDF ED 49            [12]  119     out (c),c
    00001BE1 0E 4C            [ 7]  120     ld c,#0x4c
    00001BE3 ED 49            [12]  121     out (c),c
    00001BE5 CD 16 1C         [17]  122 	call FDCOFF
    00001BE8 C9               [10]  123     ret 
    00001BE9                        124 FDCVARS: 
    00001BE9 32 74 1E         [13]  125     ld (FDCDRIVE),a
    00001BEC 4F               [ 4]  126     ld c,a
    00001BED 78               [ 4]  127     ld a,b
    00001BEE 32 75 1E         [13]  128     ld (FDCHEAD),a
    00001BF1 17               [ 4]  129     rla 
    00001BF2 17               [ 4]  130     rla 
    00001BF3 E6 04            [ 7]  131     and #0b100
    00001BF5 B1               [ 4]  132     or c
    00001BF6 32 76 1E         [13]  133     ld (FDCIDDR),a
    00001BF9 C9               [10]  134     ret 
                                    135 ;Turn FDC on and wait a bit.	
    00001BFA                        136 _asm_fdc_on::
    00001BFA                        137 FDCON: 
    00001BFA 3A 73 1E         [13]  138     ld a,(FDCMOTOR)
    00001BFD B7               [ 4]  139     or a
    00001BFE C0               [11]  140     ret nz
    00001BFF 3C               [ 4]  141     inc a
    00001C00 32 73 1E         [13]  142     ld (FDCMOTOR),a
    00001C03 01 7E FA         [10]  143     ld bc,#0xFA7E
    00001C06 3E 01            [ 7]  144     ld a,#1
    00001C08 ED 79            [12]  145     out (c),a
    00001C0A FB               [ 4]  146 	ei ;Wait for motor to get full speed
    00001C0B 01 2C 01         [10]  147     ld bc,#300
    00001C0E                        148 WAIT: 
    00001C0E 76               [ 4]  149     halt
    00001C0F 0B               [ 6]  150     dec bc
    00001C10 78               [ 4]  151     ld a,b
    00001C11 B1               [ 4]  152     or c
    00001C12 20 FA            [12]  153     jr nz,WAIT
    00001C14 F3               [ 4]  154 	di
    00001C15 C9               [10]  155     ret
                                    156 ;Turn FDC off.	
    00001C16                        157 _asm_fdc_off::
    00001C16                        158 FDCOFF: 
    00001C16 AF               [ 4]  159     xor a
    00001C17 32 73 1E         [13]  160     ld (FDCMOTOR),a
    00001C1A 01 7E FA         [10]  161     ld bc,#0xFA7E
    00001C1D AF               [ 4]  162     xor a
    00001C1E ED 79            [12]  163     out (c),a
    00001C20 C9               [10]  164     ret 
                                    165 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 4
Hexadecimal [32-Bits]



                                    166 ;Recalibrate current drive uncomment if needed
                                    167 ;;asm_Recalibrate::
                                    168 ;RECALIBR:
                                    169 ;    call RECALIB2
                                    170 ;    call RECALIB2
                                    171 ;    ret 
                                    172 ;RECALIB2: 
                                    173 ;    ld a,#0b00000111
                                    174 ;    call PUTFDC
                                    175 ;    ld a,(FDCIDDR)
                                    176 ;    call PUTFDC
                                    177 ;    jr WAITEND
                                    178 
                                    179 ;Load a file
                                    180 ;HL=Filename
                                    181 ;DE=Where to load it
                                    182 ;BC=#200 buffer
                                    183 ;RET=A=state. 0=ok  1=disc missing  2=read fail
                                    184 ;3=file not found	
    00001C21                        185 LOADFILE: 
    00001C21 22 81 1E         [16]  186     ld (PTFILENM),hl
    00001C24 ED 53 7D 1E      [20]  187     ld (LOADWHER),de
    00001C28 ED 43 7F 1E      [20]  188     ld (ADBUFFER),bc
    00001C2C CD 87 1D         [17]  189     call BUILDTAB
    00001C2F 38 02            [12]  190 	jr c,LF_TABOK
    00001C31 AF               [ 4]  191 	xor a
    00001C32 C9               [10]  192 	ret
                                    193 	
    00001C33                        194 LF_TABOK:
    00001C33 3E 80            [ 7]  195 	ld a,#128
    00001C35 32 F0 1C         [13]  196 	ld (SKIPBYTE+1),a	
                                    197 	
                                    198 ;Reading the file		
    00001C38 DD 2A 85 1E      [20]  199     ld ix,(TABSECTS)
    00001C3C                        200 LOADLP: 
    00001C3C DD 7E 00         [19]  201     ld a,+0(ix)
    00001C3F FE FF            [ 7]  202     cp #0xff
    00001C41 28 26            [12]  203     jr z,LOADFOK
    00001C43 FE FE            [ 7]  204     cp #0xfe
    00001C45 28 1C            [12]  205     jr z,LOADNEXT
    00001C47 DD 46 01         [19]  206     ld b,+1(ix)
    00001C4A DD E5            [15]  207     push ix
    00001C4C 2A 7D 1E         [16]  208 	ld hl,(LOADWHER)	
    00001C4F CD B5 1C         [17]  209     call READSECT
    00001C52 DD E1            [14]  210     pop ix
    00001C54 D0               [11]  211     ret nc
    00001C55 22 7D 1E         [16]  212     ld (LOADWHER),hl
    00001C58 2A 83 1E         [16]  213     ld hl,(TOREAD)
    00001C5B 7D               [ 4]  214     ld a,l
    00001C5C B4               [ 4]  215     or h
    00001C5D 28 0A            [12]  216     jr z,LOADFOK
    00001C5F AF               [ 4]  217     xor a
    00001C60 32 F0 1C         [13]  218     ld (SKIPBYTE+1),a
    00001C63                        219 LOADNEXT: 
    00001C63 DD 23            [10]  220     inc ix
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 5
Hexadecimal [32-Bits]



    00001C65 DD 23            [10]  221     inc ix
    00001C67 18 D3            [12]  222     jr LOADLP
    00001C69                        223 LOADFOK: 
    00001C69 37               [ 4]  224     scf
    00001C6A C9               [10]  225     ret 
                                    226 ;Wait for the end of the current instruction (using ST0).	
    00001C6B                        227 WAITEND: 
    00001C6B 3E 08            [ 7]  228     ld a,#0b00001000
    00001C6D CD 88 1C         [17]  229     call PUTFDC
    00001C70 CD 96 1C         [17]  230     call GETFDC ;Get ST0
    00001C73 32 77 1E         [13]  231     ld (ST0),a
    00001C76 CD 96 1C         [17]  232     call GETFDC
    00001C79 AF               [ 4]  233     xor a
    00001C7A 32 78 1E         [13]  234     ld (ST1),a ;Reset ST1 and ST2
    00001C7D 32 79 1E         [13]  235     ld (ST2),a
    00001C80 3A 77 1E         [13]  236     ld a,(ST0)
    00001C83 CB 6F            [ 8]  237     bit 5,a ;Instruction over ?
    00001C85 28 E4            [12]  238     jr z,WAITEND
    00001C87 C9               [10]  239     ret 
                                    240 ;Send data to FDC
                                    241 ;A=data	
    00001C88                        242 PUTFDC: 
    00001C88 F5               [11]  243     push af
                                    244     ;;ex af,af'
    00001C89 01 7E FB         [10]  245     ld bc,#0xFB7E
    00001C8C                        246 PUTFD2: 
    00001C8C ED 78            [12]  247     in a,(c)
    00001C8E F2 8C 1C         [10]  248     jp p,PUTFD2
                                    249     ;;ex af,af'
    00001C91 F1               [10]  250 	pop af
    00001C92 0C               [ 4]  251     inc c
    00001C93 ED 79            [12]  252     out (c),a
    00001C95 C9               [10]  253     ret 
                                    254 ;Get data from FDC
                                    255 ;Ret = A=FDC data	
    00001C96                        256 GETFDC: 
    00001C96 01 7E FB         [10]  257     ld bc,#0xFB7E
    00001C99                        258 GETFD2: 
    00001C99 ED 78            [12]  259     in a,(c)
    00001C9B F2 99 1C         [10]  260     jp p,GETFD2
    00001C9E 0C               [ 4]  261     inc c
    00001C9F ED 78            [12]  262     in a,(c)
    00001CA1 C9               [10]  263     ret 
                                    264 ;Track change
                                    265 ;a=nb piste	
    00001CA2                        266 GOTOPIST: 
    00001CA2 F5               [11]  267     push af
    00001CA3 3E 0F            [ 7]  268     ld a,#0b00001111
    00001CA5 CD 88 1C         [17]  269     call PUTFDC
    00001CA8 3A 76 1E         [13]  270     ld a,(FDCIDDR)
    00001CAB CD 88 1C         [17]  271     call PUTFDC
    00001CAE F1               [10]  272     pop af
    00001CAF CD 88 1C         [17]  273     call PUTFDC
    00001CB2 C3 6B 1C         [10]  274     jp WAITEND
                                    275      
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 6
Hexadecimal [32-Bits]



                                    276 ;Read sector.
                                    277 ;A=track
                                    278 ;B=ID sector
                                    279 ;RET=A=state.Carry=1=ok A=0=ok  1=disc missing  2=read fail
                                    280 ;3=file not found
                                    281 ;HL=Where new data should be loaded
    00001CB5                        282 READSECT: 
    00001CB5 22 11 1D         [16]  283 	ld (RSTarget+1),hl
    00001CB8 32 CB 1C         [13]  284     ld (RSPIST+1),a
    00001CBB C5               [11]  285     push bc
    00001CBC CD A2 1C         [17]  286     call GOTOPIST
                                    287 
    00001CBF 3E 46            [ 7]  288     ld a,#0b01000110 ; Command "Read sector"
    00001CC1 CD 88 1C         [17]  289     call PUTFDC
    00001CC4 3A 76 1E         [13]  290     ld a,(FDCIDDR) ;ID drive
    00001CC7 CD 88 1C         [17]  291     call PUTFDC
    00001CCA                        292 RSPIST: 
    00001CCA 3E 00            [ 7]  293     ld a,#0 ;track
    00001CCC CD 88 1C         [17]  294     call PUTFDC
    00001CCF AF               [ 4]  295     xor a ;head
    00001CD0 CD 88 1C         [17]  296     call PUTFDC
    00001CD3 C1               [10]  297     pop bc ;ID sect
    00001CD4 78               [ 4]  298     ld a,b
    00001CD5 F5               [11]  299     push af
    00001CD6 CD 88 1C         [17]  300     call PUTFDC
    00001CD9 3E 02            [ 7]  301     ld a,#2 ;size
    00001CDB CD 88 1C         [17]  302     call PUTFDC
    00001CDE F1               [10]  303     pop af ;last sect to read
    00001CDF CD 88 1C         [17]  304     call PUTFDC
    00001CE2 3E 52            [ 7]  305     ld a,#0x52 ;GAP
    00001CE4 CD 88 1C         [17]  306     call PUTFDC
    00001CE7 3E FF            [ 7]  307     ld a,#0xFF
    00001CE9 CD 88 1C         [17]  308     call PUTFDC
    00001CEC 01 7E FB         [10]  309     ld bc,#0xFB7E ; Information état FDC
    00001CEF                        310 SKIPBYTE: 
    00001CEF 3E 00            [ 7]  311     ld a,#0 ;If header, skip it
    00001CF1 B7               [ 4]  312     or a
    00001CF2 28 1C            [12]  313     jr z,RSAVLOOP
    00001CF4 5F               [ 4]  314     ld e,a
    00001CF5 21 87 1E         [10]  315     ld hl,#BUFHEAD
                                    316 ;Read bytes to the header buffer.	
    00001CF8                        317 RSSKIPLP: 
    00001CF8 ED 78            [12]  318     in a,(c) ;FDC ready for transf ?
    00001CFA F2 F8 1C         [10]  319     jp p,RSSKIPLP
    00001CFD E6 20            [ 7]  320     and ##0b00100000 ;FDC performing ?
    00001CFF 28 39            [12]  321     jr z,RSFIN
    00001D01 0C               [ 4]  322     inc c
    00001D02 ED 78            [12]  323     in a,(c)
    00001D04 77               [ 7]  324     ld (hl),a
    00001D05 23               [ 6]  325     inc hl
    00001D06 0D               [ 4]  326     dec c
    00001D07 1D               [ 4]  327     dec e
    00001D08 20 EE            [12]  328     jr nz,RSSKIPLP
    00001D0A 2A C7 1E         [16]  329     ld hl,(BUFHEAD+64) ;get filesize
    00001D0D 22 83 1E         [16]  330     ld (TOREAD),hl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 7
Hexadecimal [32-Bits]



                                    331 	;Normal reading code.
    00001D10                        332 RSAVLOOP: 
    00001D10                        333 RSTarget:	
    00001D10 21 00 00         [10]  334 	ld hl,#0
    00001D13 ED 5B 83 1E      [20]  335     ld de,(TOREAD)
    00001D17                        336 RSLOOP: 
    00001D17 ED 78            [12]  337     in a,(c) ;FDC ready for transf ?
    00001D19 F2 17 1D         [10]  338     jp p,RSLOOP
    00001D1C E6 20            [ 7]  339     and #0b00100000 ;FDC performing ?
    00001D1E 28 1A            [12]  340     jr z,RSFIN
    00001D20 0C               [ 4]  341     inc c
    00001D21 ED 78            [12]  342     in a,(c) ; get data from port FDC
    00001D23 77               [ 7]  343     ld (hl),a ; copy to destination buffer
    00001D24 23               [ 6]  344     inc hl
    00001D25 0D               [ 4]  345     dec c
    00001D26 1B               [ 6]  346     dec de
    00001D27 7B               [ 4]  347     ld a,e
    00001D28 B2               [ 4]  348     or d
    00001D29 20 EC            [12]  349     jr nz,RSLOOP
                                    350 ;Reading with saving. Done if end of file but sectors left.	
    00001D2B                        351 RSWASTE: 
    00001D2B ED 78            [12]  352     in a,(c) ;FDC ready for transf ?
    00001D2D F2 2B 1D         [10]  353     jp p,RSWASTE
    00001D30 E6 20            [ 7]  354     and #0b00100000 ;FDC performing ?
    00001D32 28 06            [12]  355     jr z,RSFIN
    00001D34 0C               [ 4]  356     inc c
    00001D35 ED 78            [12]  357     in a,(c)
    00001D37 0D               [ 4]  358     dec c
    00001D38 18 F1            [12]  359     jr RSWASTE
                                    360 ;Reading instr result	
    00001D3A                        361 RSFIN: 
    00001D3A ED 53 83 1E      [20]  362     ld (TOREAD),de
    00001D3E CD 96 1C         [17]  363     call GETFDC
    00001D41 32 77 1E         [13]  364     ld (ST0),a
    00001D44 CD 96 1C         [17]  365     call GETFDC
    00001D47 32 78 1E         [13]  366     ld (ST1),a
    00001D4A CD 96 1C         [17]  367     call GETFDC
    00001D4D 32 79 1E         [13]  368     ld (ST2),a
    00001D50 CD 96 1C         [17]  369     call GETFDC
    00001D53 CD 96 1C         [17]  370     call GETFDC
    00001D56 CD 96 1C         [17]  371     call GETFDC
    00001D59 CD 96 1C         [17]  372     call GETFDC
                                    373 ;Test errors.
                                    374 ;ret= Carry=1=ok a=0=ok  a=1=disc missing  2=read fail
                                    375 ;ute ST0, ST1, ST2	
    00001D5C 3A 77 1E         [13]  376     ld a,(ST0)
    00001D5F CB 7F            [ 8]  377     bit 7,a
    00001D61 20 18            [12]  378     jr nz,TESTEJEC ;no disc
    00001D63 CB 5F            [ 8]  379     bit 3,a
    00001D65 20 14            [12]  380     jr nz,TESTEJEC ;no disc
    00001D67 CB 67            [ 8]  381     bit 4,a
    00001D69 20 14            [12]  382     jr nz,TESTFAIL ;Read fail
    00001D6B 3A 78 1E         [13]  383     ld a,(ST1)
    00001D6E E6 37            [ 7]  384     and #0b00110111
    00001D70 20 0D            [12]  385     jr nz,TESTFAIL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 8
Hexadecimal [32-Bits]



    00001D72 3A 79 1E         [13]  386     ld a,(ST2)
    00001D75 E6 30            [ 7]  387     and #0b00110000
    00001D77 20 06            [12]  388     jr nz,TESTFAIL
                                    389 ;No error.
    00001D79 37               [ 4]  390 	scf
    00001D7A C9               [10]  391 	ret
    00001D7B                        392 TESTEJEC: 
    00001D7B 3E 01            [ 7]  393     ld a,#1
    00001D7D B7               [ 4]  394     or a
    00001D7E C9               [10]  395     ret 
    00001D7F                        396 TESTFAIL: 
    00001D7F 3E 02            [ 7]  397     ld a,#2
    00001D81 B7               [ 4]  398     or a
    00001D82 C9               [10]  399     ret 
    00001D83                        400 ERRFNF: 
    00001D83 3E 03            [ 7]  401     ld a,#3
    00001D85 B7               [ 4]  402     or a
    00001D86 C9               [10]  403     ret 
                                    404 ;Search a file in the AMSDOS directory, and
                                    405 ;build the sector table.
                                    406 ;RET=A=state. 0=ok  1=disc missing  2=read fail
                                    407 ;3=file not found	
    00001D87                        408 BUILDTAB: 
                                    409     ;.db 0xed, 0xff ; breackpoint
    00001D87 3E C1            [ 7]  410     ld a,#DIRFSECT ;First sector of the directory #c1
    00001D89 32 B0 1D         [13]  411     ld (BTSECT+1),a
    00001D8C C6 04            [ 7]  412     add a,#4
    00001D8E 32 E8 1D         [13]  413     ld (BTESECT+1),a
    00001D91 AF               [ 4]  414     xor a
    00001D92 32 7A 1E         [13]  415     ld (FILFOUND),a
    00001D95 32 F0 1C         [13]  416     ld (SKIPBYTE+1),a
    00001D98 21 FF FF         [10]  417     ld hl,#0xffff
    00001D9B 22 83 1E         [16]  418     ld (TOREAD),hl
    00001D9E 2A 85 1E         [16]  419     ld hl,(TABSECTS)
    00001DA1 ED 5B 85 1E      [20]  420     ld de,(TABSECTS)
    00001DA5 13               [ 6]  421 	inc de
    00001DA6 01 00 01         [10]  422     ld bc,#256 ; Size of buffer
    00001DA9 36 FE            [10]  423     ld (hl),#0xfe
    00001DAB ED B0            [21]  424     ldir ; Repeats LDI (LD (DE),(HL), then increments DE, HL, and decrements BC) until BC=0. Note that if BC=0 before this instruction is called, it will loop around until BC=0 again.
    00001DAD                        425 BTLOOP: 
    00001DAD 3E 00            [ 7]  426     ld a,#DIRTRACK ; track DIRTRACK = 0
    00001DAF                        427 BTSECT: 
    00001DAF 06 C1            [ 7]  428     ld b,#0xc1 ; ID sector CK : the value will be automodified
    00001DB1 2A 7F 1E         [16]  429 	ld hl,(ADBUFFER)
    00001DB4 CD B5 1C         [17]  430     call READSECT ;HL=Where new data should be loaded (LOADWHER)
    00001DB7 D0               [11]  431     ret nc
                                    432 	
    00001DB8 2A 7F 1E         [16]  433     ld hl,(ADBUFFER)
    00001DBB 22 C5 1D         [16]  434     ld (BTBUFF+1),hl
                                    435 ;Search in the loaded sector the right entry(ies)	
    00001DBE 06 10            [ 7]  436     ld b,#16
    00001DC0                        437 BTENTLP: 
    00001DC0 C5               [11]  438     push bc
    00001DC1 2A 81 1E         [16]  439     ld hl,(PTFILENM)
    00001DC4                        440 BTBUFF: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                          Page 9
Hexadecimal [32-Bits]



    00001DC4 11 00 00         [10]  441     ld de,#0
    00001DC7 1A               [ 7]  442     ld a,(de)
    00001DC8 FE E5            [ 7]  443     cp #0xe5 ;ignore deleted files
    00001DCA 28 07            [12]  444     jr z,BTNEXT
    00001DCC 13               [ 6]  445     inc de
    00001DCD CD 1D 1E         [17]  446     call CMP
    00001DD0 DC F7 1D         [17]  447     call c,BTFOUND
    00001DD3                        448 BTNEXT: 
    00001DD3 2A C5 1D         [16]  449     ld hl,(BTBUFF+1)
    00001DD6 11 20 00         [10]  450     ld de,#32
    00001DD9 19               [11]  451     add hl,de
    00001DDA 22 C5 1D         [16]  452     ld (BTBUFF+1),hl
    00001DDD C1               [10]  453     pop bc
    00001DDE 10 E0            [13]  454     djnz BTENTLP
                                    455 ;Next sector	
    00001DE0 3A B0 1D         [13]  456     ld a,(BTSECT+1)
    00001DE3 3C               [ 4]  457     inc a
    00001DE4 32 B0 1D         [13]  458     ld (BTSECT+1),a
    00001DE7                        459 BTESECT:  
    00001DE7 FE C5            [ 7]  460     cp #0xc5 ; CK : the track value will be automodified
    00001DE9 20 C2            [12]  461     jr nz,BTLOOP
    00001DEB 3A 7A 1E         [13]  462     ld a,(FILFOUND)
    00001DEE B7               [ 4]  463     or a
    00001DEF 28 02            [12]  464     jr z,BTNOFND
                                    465 ;No error.
    00001DF1 37               [ 4]  466     scf
    00001DF2 C9               [10]  467     ret 
    00001DF3                        468 BTNOFND: 
    00001DF3 3E 03            [ 7]  469     ld a,#3 ;File not found
    00001DF5 B7               [ 4]  470 	or a            ;Shoudln't be needed.
    00001DF6 C9               [10]  471     ret 
                                    472 ;Right entry found.	
    00001DF7                        473 BTFOUND: 
    00001DF7 3E 01            [ 7]  474     ld a,#1
    00001DF9 32 7A 1E         [13]  475     ld (FILFOUND),a
    00001DFC DD 2A C5 1D      [20]  476     ld ix,(BTBUFF+1)
    00001E00 DD 7E 0C         [19]  477     ld a,+12(ix)
    00001E03 6F               [ 4]  478     ld l,a
    00001E04 26 00            [ 7]  479     ld h,#0
    00001E06 29               [11]  480     add hl,hl
    00001E07 29               [11]  481     add hl,hl
    00001E08 29               [11]  482     add hl,hl
    00001E09 29               [11]  483     add hl,hl
    00001E0A 29               [11]  484     add hl,hl
    00001E0B 29               [11]  485     add hl,hl
    00001E0C ED 5B 85 1E      [20]  486     ld de,(TABSECTS)
    00001E10 19               [11]  487     add hl,de
    00001E11 EB               [ 4]  488     ex de,hl
    00001E12 FD                     489     .db 253 ; ??  defb #fd : ld l,e
    00001E13 6B                     490     .db 107
    00001E14 FD                     491     .db 253 ; ?? defb #fd : ld h,d
    00001E15 62                     492     .db 98
    00001E16 11 10 00         [10]  493     ld de,#16
    00001E19 DD 19            [15]  494     add ix,de
                                    495 ;ix=source
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 10
Hexadecimal [32-Bits]



                                    496 ;iy=dest	
    00001E1B 18 10            [12]  497     jr CONV
                                    498 
                                    499 ;Compare two strings. 7th bit to 0.
                                    500 ;DE=     buffer   HL=filename
                                    501 ;RET=    Carry=OK	
    00001E1D                        502 CMP: 
    00001E1D 06 0B            [ 7]  503     ld b,#11
    00001E1F                        504 CM2: 
    00001E1F 1A               [ 7]  505     ld a,(de)
    00001E20 CB BF            [ 8]  506     res 7,a
    00001E22 BE               [ 7]  507     cp (hl)
    00001E23 20 06            [12]  508     jr nz,CMPNOT
    00001E25 23               [ 6]  509     inc hl
    00001E26 13               [ 6]  510     inc de
    00001E27 10 F6            [13]  511     djnz CM2
    00001E29 37               [ 4]  512     scf
    00001E2A C9               [10]  513     ret 
                                    514 	
    00001E2B                        515 CMPNOT: 
    00001E2B B7               [ 4]  516     or a
    00001E2C C9               [10]  517     ret 
                                    518 	
                                    519 ;Convert block table to table of tracks+sects
                                    520 ;IX=src  IY=dest	
    00001E2D                        521 CONV: 
    00001E2D 06 10            [ 7]  522     ld b,#16 ;Reading 16 blocks max
    00001E2F                        523 CVNEXT: 
    00001E2F DD 7E 00         [19]  524     ld a,+0(ix) ;read block number
    00001E32 B7               [ 4]  525     or a
    00001E33 C8               [11]  526     ret z
    00001E34 DD 23            [10]  527     inc ix
    00001E36 C5               [11]  528     push bc
    00001E37 6F               [ 4]  529     ld l,a
    00001E38 26 00            [ 7]  530     ld h,#0
    00001E3A 29               [11]  531     add hl,hl
    00001E3B CD 61 1E         [17]  532     call DIV9
    00001E3E FD 71 00         [19]  533     ld +0(iy),c ;get track
                                    534 ;  sect1	
    00001E41 2A 7B 1E         [16]  535     ld hl,(RESTE)
    00001E44 7D               [ 4]  536     ld a,l
    00001E45 C6 C1            [ 7]  537     add a,#DIRFSECT ; DIRFSECT equ #c1
    00001E47 FD 77 01         [19]  538     ld +1(iy),a
                                    539 ; sect2	
    00001E4A 3C               [ 4]  540     inc a
    00001E4B FE CA            [ 7]  541     cp #0xCA
    00001E4D 20 03            [12]  542     jr nz,CVP2
    00001E4F 3E C1            [ 7]  543     ld a,#0xC1
    00001E51 0C               [ 4]  544     inc c
    00001E52                        545 CVP2: 
    00001E52 FD 71 02         [19]  546     ld +2(iy),c
    00001E55 FD 77 03         [19]  547     ld +3(iy),a
    00001E58 11 04 00         [10]  548  	ld de,#NBMAXENT ;ld de,#NBMAXENT ;  ld de,4
    00001E5B FD 19            [15]  549     add iy,de
    00001E5D C1               [10]  550     pop bc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180 / ZX-Next / eZ80 / R800)                           Page 11
Hexadecimal [32-Bits]



    00001E5E 10 CF            [13]  551     djnz CVNEXT
    00001E60 C9               [10]  552     ret 
                                    553 	
    00001E61                        554 DIV9: 
                                    555     ;ld de,#NBMAXENT+5 ;Not optimised. Who cares ?
    00001E61 11 09 00         [10]  556 	ld de,#NBMAXENT + #5
    00001E64 0E 00            [ 7]  557     ld c,#0
    00001E66                        558 DIV91: 
    00001E66 B7               [ 4]  559     or a
    00001E67 ED 52            [15]  560     sbc hl,de
    00001E69 38 03            [12]  561     jr c,DIV92
    00001E6B 0C               [ 4]  562     inc c
    00001E6C 18 F8            [12]  563     jr DIV91
    00001E6E                        564 DIV92: 
    00001E6E 19               [11]  565     add hl,de
    00001E6F 22 7B 1E         [16]  566     ld (RESTE),hl
    00001E72 C9               [10]  567     ret 
                                    568 	
    00001E73                        569 FDCMOTOR:  ;Drive motor (0-1)
    00001E73 00                     570     .db 0 
    00001E74                        571 FDCDRIVE:  ;Drive used (0-3)
    00001E74 00                     572     .db 0
    00001E75                        573 FDCHEAD:   ;Head used (0-1)
    00001E75 00                     574     .db 0
    00001E76                        575 FDCIDDR:   ;Drive ID.
    00001E76 00                     576     .db 0
    00001E77                        577 ST0: 
    00001E77 00                     578     .db 0
    00001E78                        579 ST1: 
    00001E78 00                     580     .db 0
    00001E79                        581 ST2: 
    00001E79 00                     582     .db 0
    00001E7A                        583 FILFOUND: 
    00001E7A 00                     584     .db 0
    00001E7B                        585 RESTE: 
    00001E7B 00 00                  586     .dw 0
    00001E7D                        587 LOADWHER: ;Where to load the file
    00001E7D 00 00                  588     .dw 0
    00001E7F                        589 ADBUFFER: ;#200 buffer
    00001E7F 00 00                  590     .dw 0
    00001E81                        591 PTFILENM: ;Point on the filename
    00001E81 00 00                  592     .dw 0
    00001E83                        593 TOREAD: ;Size (decrease)
    00001E83 00 00                  594     .dw 0
                                    595 ;Table where is build the sector table.
                                    596 ;One directory entry can contain 16 blocks, hence '16'
                                    597 ;One block=2 sectors, each one defined by a track+sect ID. Hence the '*4'.
    00001E85                        598 TABSECTS: ;16*4*4, #0xfe
    00001E85 00 00                  599     .dw 0
    00001E87                        600 BUFHEAD: ;Header put here
    00001E87                        601     .blkb 128
