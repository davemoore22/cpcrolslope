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

#include "lib/disc.h"

#pragma constseg DATA

/* Disc File Loading Table */
__at(DISK_TABLE_LOC) u8 d_disk_table[256];

#pragma constseg CODE

#define PRESENTS_BIN_SZ 963
#define MADEWITH_BIN_SZ 1994
#define INTRO_BIN_SZ 4229
#define TITLE_BIN_SZ 6043

const gfx_resource_t d_gfx_resources[GFX_COUNT] = {

	{.offset = 0, .size = PRESENTS_BIN_SZ},		      /* Presents */
	{.offset = PRESENTS_BIN_SZ, .size = MADEWITH_BIN_SZ}, /* Made */
	{.offset = PRESENTS_BIN_SZ + MADEWITH_BIN_SZ,
		.size = INTRO_BIN_SZ}, /* Intro */
	{.offset = PRESENTS_BIN_SZ + MADEWITH_BIN_SZ + INTRO_BIN_SZ,
		.size = TITLE_BIN_SZ}, /* Titles */
};

void d_load(char file_name[12], u8 *loc) {

	asm_fdc_on();
	asm_load_file(file_name, loc, d_disk_table);
	asm_fdc_off();
}

const u8 *d_gfx_resource_end(gfx_id_t id) {

	return GFX_BANK_BASE + d_gfx_resources[id].offset +
	       d_gfx_resources[id].size - 1;
}

const u8 *d_gfx_resource_start(gfx_id_t id) {

	return GFX_BANK_BASE + d_gfx_resources[id].offset;
}

void d_gfx_decompress_to_screen(gfx_id_t id) {

	const u8 *end = d_gfx_resource_end(id);

	a_page_disconnect_safe();
	cpct_pageMemory(RAMCFG_7 | BANK_0);
	cpct_zx7b_decrunch_s(VIDEO_MEM_END, end);
	cpct_pageMemory(RAMCFG_0 | BANK_0);
	a_page_connect_safe();
}

void d_load_gfx_to_extended_memory(void) {

	a_page_disconnect_safe();
	cpct_pageMemory(RAMCFG_7 | BANK_0);

	d_load("PRESENTSBIN", d_gfx_resource_start(GFX_PRESENTS));
	d_load("MADEWITHBIN", d_gfx_resource_start(GFX_MADEWIDTH));
	d_load("INTRO   BIN", d_gfx_resource_start(GFX_INTRO));
	d_load("TITLE   BIN", d_gfx_resource_start(GFX_TITLE));

	cpct_pageMemory(RAMCFG_0 | BANK_0);
	a_page_connect_safe();
}

void d_load_music(void) {

	a_page_disconnect_safe();
	d_load("MUSIC   BIN", TITLE_MUSIC_LOC);
	a_page_connect_safe();
}
