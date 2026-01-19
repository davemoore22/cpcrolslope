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

#include "lib/asic.h"

static bool a_asic_paged = false;

void a_sprite_flip_horizontal_inplace(u8 *sprite) {

	for (u8 y = 0; y < SPRITE_H; y++) {
		u8 *row = sprite + y * SPRITE_W;

		for (u8 x = 0; x < (SPRITE_W >> 1); x++) {
			u8 tmp = row[x];
			row[x] = row[SPRITE_W - 1 - x];
			row[SPRITE_W - 1 - x] = tmp;
		}
	}
}

void a_set_hardware_sprite_palette(const u16 *palette) {

	cpct_asicSetSpritePalette(palette, 16);
}

void a_blank_hardware_sprite_palette(void) {

	for (u8 i = 0; i < 16; i++)
		cpct_asicSetSpritePalColour(i, 0xFFF);
}

void a_load_roland_sprites(bool flip) {

	a_load_sprite_set(roland_sprites_data, NULL, 4, flip);
}

void a_load_ghost_sprites(bool flip) {

	a_load_sprite_set(ghost_sprites_data, NULL, 9, flip);
}

void a_load_spider_sprites(bool flip) {

	a_load_sprite_set(spider_sprites_data, NULL, 12, flip);
}

void a_load_snowball_sprites(bool flip) {

	a_load_sprite_set(snowball_sprites_data, NULL, 16, flip);
}

void a_load_cpctelera_sprites(bool flip) {

	a_load_sprite_set(cpctelera_sprites_data, NULL, 16, flip);
}

void a_load_hw_sprite(u8 hw_id, u8 frame, const sprite_data_t *sprite_table,
	bool flip_horizontal) {

	u8 *dst_end = HW_SPRITE_BUFFER + SPRITE_BYTES - 1;

	cpct_memset(HW_SPRITE_BUFFER, 0, SPRITE_BYTES);

	cpct_waitVSYNCStart();
	cpct_asicPageDisconnect();
	cpct_zx7b_decrunch_s(dst_end, sprite_table[frame].end);
	cpct_asicPageConnect();

	if (flip_horizontal)
		a_sprite_flip_horizontal_inplace(HW_SPRITE_BUFFER);

	cpct_asicCopySpriteData(hw_id, HW_SPRITE_BUFFER);
}

void a_load_sprite_set(const sprite_data_t *sprites,
	const sprite_load_t *layout, u8 count, bool flip_horizontal) {

	for (u8 i = 0; i < count; i++) {

		if (layout) {
			const sprite_load_t *s = &layout[i];
			a_load_hw_sprite(
				s->hw_id, s->frame, sprites, flip_horizontal);
			cpct_asicSetSpriteZoom(s->hw_id, 2, 1);
		} else {
			a_load_hw_sprite(i, i, sprites, flip_horizontal);
			cpct_asicSetSpriteZoom(i, 2, 1);
		}
	}
}

void a_clear_sprites(void) {

	for (u8 i = 0; i < 16; i++) {
		cpct_asicSetSpriteZoom(i, 0, 0);
		cpct_asicSetSpritePosition(i, -64, -64);
	}
}

void a_load_sprite_range(u8 slot_start, const u8 *const *sprites, u8 count) {

	for (u8 i = 0; i < count; i++) {
		cpct_asicCopySpriteData(slot_start + i, sprites[i]);
		cpct_asicSetSpriteZoom(slot_start + i, 2, 1);
	}
}

void a_hide_sprite_range(u8 slot_start, u8 count) {

	for (u8 i = 0; i < count; i++) {
		cpct_asicSetSpriteZoom(slot_start + i, 0, 0);
	}
}

void a_clear_all_sprites(void) {

	for (u8 i = 0; i < 16; i++) {
		cpct_asicSetSpriteZoom(i, 0, 0);
		cpct_asicSetSpritePosition(i, -64, -64);
	}
}

void a_show_sprite(u8 slot) {

	cpct_asicSetSpriteZoom(slot, 2, 1);
}

void a_hide_sprite(u8 slot) {

	cpct_asicSetSpriteZoom(slot, 0, 0);
}

void a_set_sprite_zoom_range(u8 slot_start, u8 zoom_x, u8 zoom_y, u8 count) {

	for (u8 i = 0; i < count; i++)
		cpct_asicSetSpriteZoom(slot_start + i, zoom_x, zoom_y);
}

void a_page_connect_safe(void) {

	if (!a_asic_paged) {
		cpct_asicPageConnect();
		a_asic_paged = true;
	}
}

void a_page_disconnect_safe(void) {

	if (a_asic_paged) {
		cpct_asicPageDisconnect();
		a_asic_paged = false;
	}
}
