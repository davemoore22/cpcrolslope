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

#include "lib/video.h"

static u8 v_pixel_scroll = 0; 
static u16 v_char_scroll = 0;

void v_blank_screen_no_asic(void) {

	static const u16 black_palette[4] = {
		HW_BLACK, HW_BLACK, HW_BLACK, HW_BLACK};

	cpct_setPalette(black_palette, 4);
	cpct_setBorder(HW_BLACK);
}

/* Blank the Screen and remove any Palette-adjusting Rasters */
void v_blank_screen_mode_1(void) {

	static const u16 palette[4] = {cpctm_asicColor(15, 15, 15),
		cpctm_asicColor(15, 15, 15), cpctm_asicColor(15, 15, 15),
		cpctm_asicColor(15, 15, 15)};

	cpct_waitVSYNC();
	cpct_asicSetPalette(palette, 4);
	cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
}

/* Just clear the Screen */
void v_clear_screen(void) {

	cpct_waitVSYNCStart();
	cpct_clearScreen_f64(0);
}

/* Commented out for now due to use of division */

/*
void video_fade_in_palette(
	const u16 *target_palette, u8 palette_size, u8 steps) {

	u16 current_palette[16];
	u8 step;

	for (u8 i = 0; i < palette_size; i++)
		current_palette[i] = cpctm_asicColor(0, 0, 0);

	cpct_asicSetPalette(current_palette, palette_size);

	for (step = 1; step <= steps; step++) {
		for (u8 i = 0; i < palette_size; i++) {

			u8 tr = ASIC_GET_R(target_palette[i]);
			u8 tg = ASIC_GET_G(target_palette[i]);
			u8 tb = ASIC_GET_B(target_palette[i]);

			u8 r = (tr * step) / steps;
			u8 g = (tg * step) / steps;
			u8 b = (tb * step) / steps;

			current_palette[i] = cpctm_asicColor(r, g, b);
		}

		cpct_waitVSYNC();
		cpct_asicSetPalette(current_palette, palette_size);
	}
} */

/*
void video_fade_out_palette(
	const u16 *start_palette, u8 palette_size, u8 steps) {

	u16 current_palette[16];
	u8 step;

	for (step = steps; step > 0; step--) {
		for (u8 i = 0; i < palette_size; i++) {

			u8 sr = ASIC_GET_R(start_palette[i]);
			u8 sg = ASIC_GET_G(start_palette[i]);
			u8 sb = ASIC_GET_B(start_palette[i]);

			u8 r = (sr * step) / steps;
			u8 g = (sg * step) / steps;
			u8 b = (sb * step) / steps;

			current_palette[i] = cpctm_asicColor(r, g, b);
		}

		cpct_waitVSYNC();
		cpct_asicSetPalette(current_palette, palette_size);
	}

	for (u8 i = 0; i < palette_size; i++)
		current_palette[i] = cpctm_asicColor(0, 0, 0);

	cpct_asicSetPalette(current_palette, palette_size);
} */

void v_set_intro_ghost_sprite_pos(i16 x_m2, i16 y, bool reversed) {

	extern ghost_bob_t g_ghost_bob;

	y += g_ghost_bob.y_off;

	for (u8 row = 0; row < 3; row++) {
		for (u8 col = 0; col < 3; col++) {

			u8 tile_col = reversed ? (2 - col) : col;
			u8 spr_idx = (row * 3) + tile_col;

			cpct_asicSetSpritePosition(
				spr_idx, x_m2 + (col << 5), y + (row << 4));
		}
	}
}

void v_set_intro_roland_sprite_pos(i16 x_m2, i16 y, bool reversed) {

	for (u8 row = 0; row < 2; row++) {
		for (u8 col = 0; col < 2; col++) {

			u8 tile_col = reversed ? (1 - col) : col;
			u8 spr_idx = (row * 2) + tile_col;

			cpct_asicSetSpritePosition(
				spr_idx, x_m2 + (col << 5), y + (row << 4));
		}
	}
}

void v_set_title_roland_sprite_pos(i16 x_m2, i16 y, bool reversed) {

	for (u8 row = 0; row < 2; row++) {
		for (u8 col = 0; col < 2; col++) {

			u8 tile_col = reversed ? (1 - col) : col;
			u8 spr_idx = HW_SPRITE_TITLE_ROLAND_START +
				     ((row * 2) + tile_col);

			cpct_asicSetSpritePosition(
				spr_idx, x_m2 + (col << 5), y + (row << 4));
		}
	}
}

void v_set_made_cpctelera_sprite_pos(i16 x_m2, i16 y, bool reversed) {

	(void)reversed;

	for (u8 row = 0; row < 4; row++) {
		for (u8 col = 0; col < 4; col++) {

			u8 tile_col = reversed ? (3 - col) : col;
			u8 spr_idx = (row * 4) + tile_col;

			cpct_asicSetSpritePosition(
				spr_idx, x_m2 + (col << 5), y + (row << 4));
		}
	}
}

/* Note spider sprite is animated */
void v_set_intro_spider_sprite_pos(i16 x_m2, i16 y, bool reversed) {

	(void)reversed;

	static const u8 spider_frame_sprites[SPIDER_FRAMES][4] = {
		{0, 1, 6, 7}, {2, 3, 8, 9}, {4, 5, 10, 11}};

	for (u8 frame = 0; frame < SPIDER_FRAMES; frame++) {

		/*
		 * Sprite order in table:
		 *
		 * [0] top-left
		 * [1] top-right
		 * [2] bottom-left
		 * [3] bottom-right
		 */

		const u8 *s = spider_frame_sprites[frame];

		cpct_asicSetSpritePosition(s[0], x_m2 + 0, y + 0);
		cpct_asicSetSpritePosition(s[1], x_m2 + 32, y + 0);
		cpct_asicSetSpritePosition(s[2], x_m2 + 0, y + 16);
		cpct_asicSetSpritePosition(s[3], x_m2 + 32, y + 16);
	}
}

/* Three snowball sprites */
void v_set_intro_snowball_sprite_pos(i16 x_m2, i16 y, bool reversed) {

	(void)reversed;

	(void)reversed;

	static const u8 snowball_frame_sprites[SNOWBALL_FRAMES][4] = {
		{0, 1, 8, 9}, {2, 3, 10, 11}, {4, 5, 12, 13}, {6, 7, 14, 15}};

	for (u8 frame = 0; frame < SNOWBALL_FRAMES; frame++) {

		/*
		 * Sprite order in table:
		 *
		 * [0] top-left
		 * [1] top-right
		 * [2] bottom-left
		 * [3] bottom-right
		 */

		const u8 *s = snowball_frame_sprites[frame];

		cpct_asicSetSpritePosition(s[0], x_m2 + 0, y + 0);
		cpct_asicSetSpritePosition(s[1], x_m2 + 32, y + 0);
		cpct_asicSetSpritePosition(s[2], x_m2 + 0, y + 16);
		cpct_asicSetSpritePosition(s[3], x_m2 + 32, y + 16);
	}
}

/*
void video_fade_palette(const u16 *start_palette, const u16 *end_palette,
	u8 palette_size, u8 steps) {
	u16 current_palette[16];

	for (u8 step = 0; step <= steps; step++) {

		u8 r = 0, g = 0, b = 0;

		for (u8 i = 0; i < palette_size; i++) {

			u8 sr = ASIC_GET_R(start_palette[i]);
			u8 sg = ASIC_GET_G(start_palette[i]);
			u8 sb = ASIC_GET_B(start_palette[i]);

			u8 er = ASIC_GET_R(end_palette[i]);
			u8 eg = ASIC_GET_G(end_palette[i]);
			u8 eb = ASIC_GET_B(end_palette[i]);

			r = sr + ((er - sr) * step) / steps;
			g = sg + ((eg - sg) * step) / steps;
			b = sb + ((eb - sb) * step) / steps;

			current_palette[i] = cpctm_asicColor(r, g, b);
		}

		cpct_waitVSYNC();
		cpct_asicSetPalette(current_palette, palette_size);
	}
} */

static u8 last_frame = 0xFF;

void v_spider_set_frame(u8 frame) {

	static const u8 spider_frame_sprites[SPIDER_FRAMES][4] = {
		{0, 1, 6, 7}, {2, 3, 8, 9}, {4, 5, 10, 11}};

	if (frame == last_frame)
		return;

	/*  Hide previous frame */
	if (last_frame != 0xFF) {
		for (u8 i = 0; i < 4; i++)
			cpct_asicSetSpriteZoom(
				spider_frame_sprites[last_frame][i], 0, 0);
	}

	/* Show new frame */
	for (u8 i = 0; i < 4; i++)
		cpct_asicSetSpriteZoom(spider_frame_sprites[frame][i], 2, 1);

	last_frame = frame;
}

void v_snowball_set_frame(u8 frame) {

	static const u8 snowball_frame_sprites[SNOWBALL_FRAMES][4] = {
		{0, 1, 8, 9}, {2, 3, 10, 11}, {4, 5, 12, 13}, {6, 7, 14, 15}};

	if (frame == last_frame)
		return;

	/*  Hide previous frame */
	if (last_frame != 0xFF) {
		for (u8 i = 0; i < 5; i++)
			cpct_asicSetSpriteZoom(
				snowball_frame_sprites[last_frame][i], 0, 0);
	}

	/* Show new frame */
	for (u8 i = 0; i < 5; i++)
		cpct_asicSetSpriteZoom(snowball_frame_sprites[frame][i], 2, 1);

	last_frame = frame;
}
