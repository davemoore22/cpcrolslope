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

#include "lib/cache.h"

static const u8 bank_counts[SPR_BANK_COUNT] = {
	[SPR_BANK_ROLAND_L] = 4,
	[SPR_BANK_ROLAND_R] = 4,
	[SPR_BANK_MODE_CLASSIC] = 4,
	[SPR_BANK_MODE_MANIA] = 3,
	[SPR_BANK_MODE_ZEN] = 2,
};

sprite_bank_desc_t g_sprite_banks[SPR_BANK_COUNT];

static void c_expand_sprite_to_bank(const sprite_data_t *src,
	const u16 bank_offset, const bool flip_horizontal);
static void c_fetch_sprite_from_bank_and_upload(
	const u16 bank_offset, const u8 hw_id);

/* TODO: disable interrupts in here just in case */
void c_sprite_cache_bank_init(void) {

	u16 bank_offset = 0;

	/* Normal ROLAND Sprites */
	g_sprite_banks[SPR_BANK_ROLAND_L].offset = bank_offset;
	g_sprite_banks[SPR_BANK_ROLAND_L].count = 4;
	for (u8 i = 0; i < 4; i++) {
		c_expand_sprite_to_bank(
			&roland_sprites_data[i], bank_offset, false);
		bank_offset += SPRITE_BYTES;
	};

	/* Flipped ROLAND sprites */
	g_sprite_banks[SPR_BANK_ROLAND_R].offset = bank_offset;
	g_sprite_banks[SPR_BANK_ROLAND_R].count = 4;
	for (u8 i = 0; i < 4; i++) {
		c_expand_sprite_to_bank(
			&roland_sprites_data[i], bank_offset, true);
		bank_offset += SPRITE_BYTES;
	};

	/* CLASSIC: mode 0–3 */
	g_sprite_banks[SPR_BANK_MODE_CLASSIC].offset = bank_offset;
	g_sprite_banks[SPR_BANK_MODE_CLASSIC].count = 4;
	for (u8 i = 0; i < 4; i++) {
		c_expand_sprite_to_bank(
			&mode_sprites_data[i], bank_offset, false);
		bank_offset += SPRITE_BYTES;
	}

	/* MANIA: mode 4–6 */
	g_sprite_banks[SPR_BANK_MODE_MANIA].offset = bank_offset;
	g_sprite_banks[SPR_BANK_MODE_MANIA].count = 3;
	for (u8 i = 0; i < 3; i++) {
		c_expand_sprite_to_bank(
			&mode_sprites_data[4 + i], bank_offset, false);
		bank_offset += SPRITE_BYTES;
	}

	/* ZEN: mode 7–8 */
	g_sprite_banks[SPR_BANK_MODE_ZEN].offset = bank_offset;
	g_sprite_banks[SPR_BANK_MODE_ZEN].count = 2;
	for (u8 i = 0; i < 2; i++) {
		c_expand_sprite_to_bank(
			&mode_sprites_data[7 + i], bank_offset, false);
		bank_offset += SPRITE_BYTES;
	}
}

void c_sprite_cache_bank_upload(
	const sprite_bank_id_t bank, const u8 index, const u8 hw_id) {

	const sprite_bank_desc_t *b = &g_sprite_banks[bank];

	if (index >= b->count)
		return;

	u16 offset = b->offset + (index * SPRITE_BYTES);

	c_fetch_sprite_from_bank_and_upload(offset, hw_id);
}

/* TODO: disable interrupts in here just in case */
static void c_expand_sprite_to_bank(const sprite_data_t *src,
	const u16 bank_offset, const bool flip_horizontal) {

	/* Unhide the sprite data */
	a_page_disconnect_safe();

	/* Grab the sprite and decompress into the buffer at 0xbf00 */
	u8 *buf_end = HW_SPRITE_BUFFER + SPRITE_BYTES - 1;
	cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);
	cpct_zx7b_decrunch_s(buf_end, src->end);

	/* Reverse if needed */
	if (flip_horizontal)
		a_sprite_flip_horizontal_inplace(HW_SPRITE_BUFFER);

	/* Page in Bank 6 */
	cpct_pageMemory(RAMCFG_6 | BANK_0);

	/* Write the expanded sprite to Bank 6 */
	cpct_memcpy((u8 *)(SPRITE_BANK_BASE + bank_offset), HW_SPRITE_BUFFER,
		SPRITE_BYTES);

	/* Restore normal banking */
	cpct_pageMemory(RAMCFG_0 | BANK_0);

	/* Reconnect the ASIC, hiding the sprite data  */
	a_page_connect_safe();
}

/* TODO: disable interrupts in here just in case */
static void c_fetch_sprite_from_bank_and_upload(
	const u16 bank_offset, const u8 hw_id) {

	/* Unhide the sprite data */
	a_page_disconnect_safe();

	/* Page in Bank 6 */
	cpct_pageMemory(RAMCFG_6 | BANK_0);

	/* Copy the sprite data to the buffer at 0xbf00 */
	cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);
	cpct_memcpy(HW_SPRITE_BUFFER, (u8 *)(SPRITE_BANK_BASE + bank_offset),
		SPRITE_BYTES);

	/* Restore normal banking */
	cpct_pageMemory(RAMCFG_0 | BANK_0);

	/* Reconnect the ASIC, hiding the sprite data  */
	a_page_connect_safe();

	/* Upload the sprite data*/
	cpct_asicCopySpriteData(hw_id, HW_SPRITE_BUFFER);
}
