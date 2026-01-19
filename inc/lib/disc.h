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

__at(DISK_TABLE_LOC) extern u8 d_disk_table[256];

void d_load(char file_name[12], u8 *loc);

/* FDC Tools SDCC4.5 (via https://www.julien-nevo.com/arkos/fdc-tools/) */

#ifdef __INTELLISENSE__
#pragma diag_suppress 130
#endif
extern void asm_load_file(
	u8 *fileName, u8 *destBuffer, u8 *sectorTable) __z88dk_callee;
#ifdef __INTELLISENSE__
#pragma diag_default 130
#endif
extern void asm_fdc_off(void);
extern void asm_fdc_on(void);

void d_gfx_decompress_to_screen(gfx_id_t id);
const u8 *d_gfx_resource_start(gfx_id_t id);
void d_load_gfx_to_extended_memory(void);
const u8 *d_gfx_resource_end(gfx_id_t id);
void d_load_music(void);

#define GFX_BANK_BASE ((u8 *)0x4001)

/* Graphical resource table */
extern const gfx_resource_t d_gfx_resources[GFX_COUNT];