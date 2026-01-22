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

#pragma codeseg CODE

#include "main.h"

bool g_skip = false;

u8 g_hw;

static const u16 m_load_pal[4] = {
	cpctm_asicColor(0, 0, 0),   /* #000000 */
	cpctm_asicColor(15, 1, 1),  /* #ff1111 */
	cpctm_asicColor(15, 6, 0),  /* #ff6600 */
	cpctm_asicColor(15, 15, 0), /* #ffff00	  */
};

/* Create the Font Sprite Mask Table beneath the Executable */
cpctm_createTransparentMaskTable(v_mask_table, MASK_TABLE_LOC, M1, 0);

void main(void) {

	cpct_setVideoMode(1);
	cpct_pageMemory(RAMCFG_0 | BANK_0);

	v_blank_screen_no_asic();
	cpct_disableFirmware();

	cpct_setStackLocation(STACK_LOC);
	cpct_removeInterruptHandler();

	g_hw = h_get_details();

	if (HW_IS_PLUS(g_hw) && HW_HAS_128K(g_hw)) {

		cpct_asicUnlock();
		a_page_connect_safe();

		while (1) {

			u8 *v_pos = cpctm_screenPtr(CPCT_VMEM_START, 27, 94);
			cpct_drawSprite(img_loading_data, v_pos, 25, 13);
			cpct_asicSetPalette(m_load_pal, 4);

			d_load_gfx_to_extended_memory();
			c_sprite_cache_bank_init();
			d_load_music();

			// a_page_disconnect_safe();
			// cpct_memcpy(MUSIC_LOC, (u8 *)0x7000, 1843);
			// a_page_connect_safe();

			p_start();
			p_stop();

			if (!g_skip) {
				m_start();
				m_stop();
			}

			if (!g_skip) {
				i_start();
				i_stop();
			}

			t_start();
			t_do();
			t_stop();
		};
	} else {

		cpct_setVideoMode(1);
		v_blank_screen_no_asic();
	}
}