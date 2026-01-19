/*
 * Roland on the Slopes for the Amstrad CPC Plus
 * Copyright (C) 2026 Dave Moore
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include "main.h"

/* For Image Decompression */
#define VIDEO_MEM_END ((void *)0xFFFF)
#define VIDEO_MEM_START ((void *)0xC000)

#define ASIC_GET_G(c) (((c) >> 8) & 0x0F)
#define ASIC_GET_R(c) (((c) >> 4) & 0x0F)
#define ASIC_GET_B(c) ((c) & 0x0F)

#define SCREEN_WIDTH_M1 320
#define SCREEN_WIDTH_M2 (SCREEN_WIDTH_M1 * 2)
#define SPRITE_WIDTH_M1 64
#define SPRITE_WIDTH_M2 (SPRITE_WIDTH_M1 * 2)
#define SPRITE_WIDTH_ZOOM (SPRITE_WIDTH_M1 * 4)

#define SPRITE_W 16
#define SPRITE_H 16
#define SPRITE_BYTES (SPRITE_W * SPRITE_H)

#define NULL ((void *)0)

#define STACK_LOC ((void *)0x00FF)
#define MASK_TABLE_LOC 0x8000 /* 0x0200 bytes long */
#define DISK_TABLE_LOC 0x8200 /* 0x0200 bytes long */

#define FC_MAX 50
