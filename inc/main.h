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
#include <cpctelera.h>

/* External include for the Bool type */
#include <stdbool.h>

/* Library Includes */
#include "lib/defines.h"
#include "lib/types.h"

#include "lib/asic.h"
#include "lib/cache.h"
#include "lib/disc.h"
#include "lib/hardware.h"
#include "lib/utilities.h"
#include "lib/video.h"

/* Data Includes */
#include "dat/images.h"
#include "dat/sound.h"
#include "dat/sprites.h"

/* Modules */
#include "intro.h"
#include "made.h"
#include "presents.h"
#include "titles.h"

extern bool g_skip;
extern u8 g_hw;

/* Mask Table for Font sprites */
cpctm_declareMaskTable(v_mask_table);

/*
 *
 * Global Memory Map:
 *
 * BANK 0:
 *
 * 0x0000 - 0x0100:			Stack
 * 0x0100 - 0x4000:			Code
 *
 * BANK 1:
 * 0x4000 - 0x8000:			ASIC/Compressed HW Sprite Definitions
 *
 * BANK 2:
 * 0x8000 - 0x8200:			Sprite Mask Table
 * 0x8200 - 0x8400:			FDC Disk Assess Table
 * 0x8400 - 0xa000:			Font/Gfx Data
 * 0xa000 - 0xb200:			Sprite Cache
 * 0xb200 - 0xbf00:			Reserved for Music/SFX
 * 0xbf00 - 0xc000:			Sprite Cache Buffer
 *
 * BANK 3:
 * 0xc000 - 0xffff:			Video Memory
 *
 * BANK 4:
 *
 * BANK 5:
 *
 * BANK 6:
 * 0x08000 - 0x1bfff:		Expanded HW Sprite Cache
 *
 * BANK 7:
 * 0x1c000 - 0x1ffff:		Background Image Data (Paged into BANK 1)
 *
 */
