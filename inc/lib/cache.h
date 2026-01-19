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

/* CPC Telera Main Include */
#include "main.h"

#define SPRITE_BANK_BASE ((u8 *)0x4001)

/* Sprite banks for title screen */
typedef enum {
	SPR_BANK_ROLAND_L,     /* 4 frames */
	SPR_BANK_ROLAND_R,     /* 4 frames (flipped) */
	SPR_BANK_MODE_CLASSIC, /* 4 sprites */
	SPR_BANK_MODE_MANIA,   /* 3 sprites */
	SPR_BANK_MODE_ZEN,     /* 2 sprites */
	SPR_BANK_COUNT
} sprite_bank_id_t;

typedef struct {
		u16 offset; /* Offset inside Bank 6 */
		u8 count;   /* Number of sprites in this bank */
} sprite_bank_desc_t;

extern sprite_bank_desc_t g_sprite_banks[SPR_BANK_COUNT];

void c_sprite_cache_bank_init(void);
void c_sprite_cache_bank_upload(
	const sprite_bank_id_t bank, const u8 index, const u8 hw_id);
/*
 * Sprite Cache layout in Bank 6:

┌──────────────────────────┐
│ Roland L [0]             │
│ Roland L [1]             │
│ Roland L [2]             │
│ Roland L [3]             │
│ Roland R [0]             │
│ Roland R [1]             │
│ Roland R [2]             │
│ Roland R [3]             │
│ Classic [0]              │
│ Classic [1]              │
│ Classic [2]              │
│ Classic [3]              │
│ Mania [0]                │
│ Mania [1]                │
│ Mania [2]                │
│ Zen [0]                  │
│ Zen [1]                  │
└──────────────────────────┘

*/