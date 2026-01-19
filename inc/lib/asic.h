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

/* Sprite buffer used for Decompressing */
#define HW_SPRITE_BUFFER ((u8 *)0xBF00)

/* Title screen hardware sprite slot ownership */
#define ASIC_SPR_MODE_START 11
#define ASIC_SPR_ROLAND_START 0
#define ASIC_SPR_CONTROLS_START 4
#define ASIC_SPR_PLAY_START 8

#define CRTC_INDEX 0xBC
#define CRTC_DATA 0xBD

void a_load_sprite_range(u8 slot_start, const u8 *const *sprites, u8 count);
void a_hide_sprite_range(u8 slot_start, u8 count);
void a_clear_all_sprites(void);
void a_show_sprite(u8 slot);
void a_hide_sprite(u8 slot);
void a_set_sprite_zoom_range(u8 slot_start, u8 zoom_x, u8 zoom_y, u8 count);
void a_sprite_flip_horizontal_inplace(u8 *sprite);
void a_set_hardware_sprite_palette(const u16 *palette);
void a_clear_sprites(void);
void a_blank_hardware_sprite_palette(void);
void a_load_sprite_set(sprite_data_t *sprites, const sprite_load_t *layout,
	u8 count, bool flip);
void a_load_roland_sprites(bool flip);
void a_load_spider_sprites(bool flip);
void a_load_snowball_sprites(bool flip);
void a_load_ghost_sprites(bool flip);
void a_load_cpctelera_sprites(bool flip);
void a_load_hw_sprite(u8 hw_id, u8 frame, const sprite_data_t *sprite_table,
	bool flip_horizontal);
void a_page_connect_safe(void);
void a_page_disconnect_safe(void);

void a_crtc_set_start(u16 start_char);
