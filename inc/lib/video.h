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

#define SPIDER_FRAMES 3
#define SNOWBALL_FRAMES 4

#define ROW_BYTES 80
#define ROW_PIXELS 8

/* Public Functions */
void v_blank_screen_no_asic(void);
void v_blank_screen_mode_1(void);
void v_clear_screen(void);
/* void video_fade_in_palette(
	const u16 *target_palette, u8 palette_size, u8 steps);
void video_fade_out_palette(
	const u16 *start_palette, u8 palette_size, u8 steps);
void video_fade_palette(const u16 *start_palette, const u16 *end_palette,
	u8 palette_size, u8 steps); */
void v_set_intro_roland_sprite_pos(i16 x_m2, i16 y, bool reversed);
void v_set_intro_ghost_sprite_pos(i16 x_m2, i16 y, bool reversed);
void v_set_intro_snowball_sprite_pos(i16 x_m2, i16 y, bool reversed);
void v_set_intro_spider_sprite_pos(i16 x_m2, i16 y, bool reversed);
void v_set_made_cpctelera_sprite_pos(i16 x_m2, i16 y, bool reversed);
void v_set_title_roland_sprite_pos(i16 x_m2, i16 y, bool reversed);
void v_spider_set_frame(u8 frame);
void v_snowball_set_frame(u8 frame);
