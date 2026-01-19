;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module sprites
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpctelera_sprites_palette
	.globl _mode_sprites_palette
	.globl _titles_sprites_palette_mania
	.globl _titles_sprites_palette_zen
	.globl _titles_sprites_palette_classic
	.globl _ghost_sprites_palette
	.globl _spider_sprites_palette
	.globl _snowball_sprites_palette
	.globl _roland_sprites_palette
	.globl _cpctelera_sprites_data
	.globl _mode_sprites_data
	.globl _titles_sprites_data
	.globl _ghost_sprites_data
	.globl _spider_sprites_data
	.globl _snowball_sprites_data
	.globl _roland_sprites_data
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _DATA
	.area _DATA
_roland_sprites_data:
	.dw _roland_0
	.dw (_roland_0 + 120)
	.dw _roland_1
	.dw (_roland_1 + 100)
	.dw _roland_2
	.dw (_roland_2 + 117)
	.dw _roland_3
	.dw (_roland_3 + 73)
_snowball_sprites_data:
	.dw _snowball_0
	.dw (_snowball_0 + 60)
	.dw _snowball_1
	.dw (_snowball_1 + 74)
	.dw _snowball_2
	.dw (_snowball_2 + 85)
	.dw _snowball_3
	.dw (_snowball_3 + 87)
	.dw _snowball_4
	.dw (_snowball_4 + 85)
	.dw _snowball_5
	.dw (_snowball_5 + 61)
	.dw _snowball_6
	.dw (_snowball_6 + 65)
	.dw _snowball_7
	.dw (_snowball_7 + 66)
	.dw _snowball_8
	.dw (_snowball_8 + 74)
	.dw _snowball_9
	.dw (_snowball_9 + 83)
	.dw _snowball_10
	.dw (_snowball_10 + 64)
	.dw _snowball_11
	.dw (_snowball_11 + 62)
	.dw _snowball_12
	.dw (_snowball_12 + 79)
	.dw _snowball_13
	.dw (_snowball_13 + 67)
	.dw _snowball_14
	.dw (_snowball_14 + 83)
	.dw _snowball_15
	.dw (_snowball_15 + 79)
_spider_sprites_data:
	.dw _spider_0
	.dw (_spider_0 + 55)
	.dw _spider_1
	.dw (_spider_1 + 55)
	.dw _spider_2
	.dw (_spider_2 + 55)
	.dw _spider_3
	.dw (_spider_3 + 47)
	.dw _spider_4
	.dw (_spider_4 + 48)
	.dw _spider_5
	.dw (_spider_5 + 42)
	.dw _spider_6
	.dw (_spider_6 + 68)
	.dw _spider_7
	.dw (_spider_7 + 78)
	.dw _spider_8
	.dw (_spider_8 + 80)
	.dw _spider_9
	.dw (_spider_9 + 81)
	.dw _spider_10
	.dw (_spider_10 + 73)
	.dw _spider_11
	.dw (_spider_11 + 83)
_ghost_sprites_data:
	.dw _ghost_0
	.dw (_ghost_0 + 5)
	.dw _ghost_1
	.dw (_ghost_1 + 47)
	.dw _ghost_2
	.dw (_ghost_2 + 49)
	.dw _ghost_3
	.dw (_ghost_3 + 37)
	.dw _ghost_4
	.dw (_ghost_4 + 36)
	.dw _ghost_5
	.dw (_ghost_5 + 57)
	.dw _ghost_6
	.dw (_ghost_6 + 85)
	.dw _ghost_7
	.dw (_ghost_7 + 102)
	.dw _ghost_8
	.dw (_ghost_8 + 52)
_titles_sprites_data:
	.dw _roland_0
	.dw (_roland_0 + 120)
	.dw _roland_1
	.dw (_roland_1 + 100)
	.dw _roland_2
	.dw (_roland_2 + 117)
	.dw _roland_3
	.dw (_roland_3 + 73)
	.dw _controls_0
	.dw (_controls_0 + 72)
	.dw _controls_1
	.dw (_controls_1 + 73)
	.dw _controls_2
	.dw (_controls_2 + 78)
	.dw _controls_3
	.dw (_controls_3 + 76)
	.dw _play_0
	.dw (_play_0 + 71)
	.dw _play_1
	.dw (_play_1 + 63)
	.dw _play_2
	.dw (_play_2 + 17)
_mode_sprites_data:
	.dw _mode_0
	.dw (_mode_0 + 72)
	.dw _mode_1
	.dw (_mode_1 + 78)
	.dw _mode_2
	.dw (_mode_2 + 78)
	.dw _mode_3
	.dw (_mode_3 + 59)
	.dw _mode_4
	.dw (_mode_4 + 70)
	.dw _mode_5
	.dw (_mode_5 + 70)
	.dw _mode_6
	.dw (_mode_6 + 50)
	.dw _mode_7
	.dw (_mode_7 + 70)
	.dw _mode_8
	.dw (_mode_8 + 58)
_cpctelera_sprites_data:
	.dw _cpctelera_0
	.dw (_cpctelera_0 + 9)
	.dw _cpctelera_1
	.dw (_cpctelera_1 + 40)
	.dw _cpctelera_2
	.dw (_cpctelera_2 + 96)
	.dw _cpctelera_3
	.dw (_cpctelera_3 + 34)
	.dw _cpctelera_4
	.dw (_cpctelera_4 + 117)
	.dw _cpctelera_5
	.dw (_cpctelera_5 + 128)
	.dw _cpctelera_6
	.dw (_cpctelera_6 + 90)
	.dw _cpctelera_7
	.dw (_cpctelera_7 + 67)
	.dw _cpctelera_8
	.dw (_cpctelera_8 + 47)
	.dw _cpctelera_9
	.dw (_cpctelera_9 + 88)
	.dw _cpctelera_10
	.dw (_cpctelera_10 + 95)
	.dw _cpctelera_11
	.dw (_cpctelera_11 + 7)
	.dw _cpctelera_12
	.dw (_cpctelera_12 + 5)
	.dw _cpctelera_13
	.dw (_cpctelera_13 + 31)
	.dw _cpctelera_14
	.dw (_cpctelera_14 + 37)
	.dw _cpctelera_15
	.dw (_cpctelera_15 + 5)
_roland_sprites_palette:
	.dw #0x0fff
	.dw #0x0113
	.dw #0x0142
	.dw #0x0327
	.dw #0x04f0
	.dw #0x08f0
	.dw #0x0080
	.dw #0x0af0
	.dw #0x052a
	.dw #0x0557
	.dw #0x0cf0
	.dw #0x082d
	.dw #0x0df0
	.dw #0x0879
	.dw #0x0b3f
	.dw #0x0eaf
_snowball_sprites_palette:
	.dw #0x0fff
	.dw #0x0357
	.dw #0x0357
	.dw #0x0357
	.dw #0x078c
	.dw #0x078c
	.dw #0x0bbf
	.dw #0x0bbf
	.dw #0x0baf
	.dw #0x0ddf
	.dw #0x0eef
	.dw #0x050c
	.dw #0x0000
	.dw #0x0000
	.dw #0x0dd3
	.dw #0x050c
_spider_sprites_palette:
	.dw #0x0fff
	.dw #0x0001
	.dw #0x054c
	.dw #0x06f6
	.dw #0x087d
	.dw #0x0b4d
	.dw #0x0c8e
	.dw #0x0f9a
	.dw #0x0dde
	.dw #0x0000
	.dw #0x0bea
	.dw #0x050b
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_ghost_sprites_palette:
	.dw #0x0fff
	.dw #0x09c0
	.dw #0x0b39
	.dw #0x0c4a
	.dw #0x0d5b
	.dw #0x0e8d
	.dw #0x0df0
	.dw #0x0fae
	.dw #0x0fce
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
_titles_sprites_palette_classic:
	.dw #0x0fff
	.dw #0x0113
	.dw #0x0142
	.dw #0x0327
	.dw #0x04f0
	.dw #0x08f0
	.dw #0x0fbf
	.dw #0x0af0
	.dw #0x0fef
	.dw #0x0557
	.dw #0x0cf0
	.dw #0x082d
	.dw #0x0df0
	.dw #0x0879
	.dw #0x0b3f
	.dw #0x0eaf
_titles_sprites_palette_zen:
	.dw #0x0fff
	.dw #0x0113
	.dw #0x0606
	.dw #0x0327
	.dw #0x0808
	.dw #0x0a0a
	.dw #0x0fbf
	.dw #0x0c0c
	.dw #0x0fef
	.dw #0x0557
	.dw #0x0d0d
	.dw #0x082d
	.dw #0x0f0f
	.dw #0x0879
	.dw #0x0b3f
	.dw #0x0eaf
_titles_sprites_palette_mania:
	.dw #0x0fff
	.dw #0x0113
	.dw #0x0055
	.dw #0x0327
	.dw #0x0077
	.dw #0x0099
	.dw #0x0fbf
	.dw #0x00bb
	.dw #0x0fef
	.dw #0x0557
	.dw #0x00dd
	.dw #0x082d
	.dw #0x00ff
	.dw #0x0879
	.dw #0x0b3f
	.dw #0x0eaf
_mode_sprites_palette:
	.dw #0x0fff
	.dw #0x0113
	.dw #0x0142
	.dw #0x0327
	.dw #0x04f0
	.dw #0x08f0
	.dw #0x0fbf
	.dw #0x0af0
	.dw #0x0fef
	.dw #0x0557
	.dw #0x0cf0
	.dw #0x082d
	.dw #0x0df0
	.dw #0x0879
	.dw #0x0b3f
	.dw #0x0eaf
_cpctelera_sprites_palette:
	.dw #0x0fff
	.dw #0x0000
	.dw #0x0111
	.dw #0x0222
	.dw #0x0294
	.dw #0x0441
	.dw #0x0555
	.dw #0x0887
	.dw #0x0999
	.dw #0x0ccc
	.dw #0x0ed2
	.dw #0x0df1
	.dw #0x0df7
	.dw #0x0eee
	.dw #0x0ffa
	.dw #0x0ffd
	.area _INITIALIZER
	.area _CABS (ABS)
