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

u8 g_game_mode = 0;

static void t_draw_bg(void);
static void t_add_interrupt(void);
static void t_remove_interrupt(void);
static void t_reset_timers(void);
static void t_interrupt(u8 line) __z88dk_fastcall;
static void t_draw_game_mode(void);
static void t_update_slopes_cycle(void);
static void t_step_slopes_phase(void);
static void t_ani_roland_l(u8 y, u8 speed);
static void t_ani_roland_r(u8 y, u8 speed);
static void t_scroll_sprite_h(
	i16 start_x, i16 end_x, i16 step, u8 y, sprite_pos_fn_t pos_fn);
static void t_load_roland_from_cache(bool right);
static void t_init_roland_slots(u8 y);
static void t_load_static_title_sprites(void);
static void t_load_game_mode_word(void);
static void t_draw_static_sprites(void);
static void t_change_game_mode(i8 delta);
static title_input_t t_poll_title_input(void);
static void t_start_roland_scroll(bool right, u8 y, i8 speed);
static void t_update_roland(void);

static u8 t_int_idx = 0;
static u8 t_frame_c = 0;
static u8 text_phase = 0;
static u8 text_tick = 0;
static u8 slopes_phase = 0;
static i8 slopes_dir = 1;
static u8 slopes_tick = 0;
static bool t_roland_right = false;

static u8 t_mode_cooldown = 0;

static i16 t_roland_x;
static i16 t_roland_start_x;
static i16 t_roland_end_x;
static i8 t_roland_step;
static u8 t_roland_y;
static bool t_roland_active;

static const u16 text_col_top[TEXT_COLOUR_COUNT] = {
	cpctm_asicColor(13, 15, 9),  /* #ddff99 */
	cpctm_asicColor(14, 15, 10), /* #ddffaa */
	cpctm_asicColor(15, 15, 11), /* #ddffbb */
	cpctm_asicColor(15, 15, 12), /* #ddffcc */
	cpctm_asicColor(15, 15, 13), /* #ddffdd */
	cpctm_asicColor(15, 15, 12), /* #ddffcc */
	cpctm_asicColor(15, 15, 11), /* #ddffbb */
	cpctm_asicColor(14, 15, 10), /* #ddffaa */
};

static const u16 text_col_bottom[TEXT_COLOUR_COUNT] = {
	cpctm_asicColor(15, 15, 13), /* #ddffdd */
	cpctm_asicColor(15, 15, 12), /* #ddffcc */
	cpctm_asicColor(15, 15, 11), /* #ddffbb */
	cpctm_asicColor(14, 15, 10), /* #ddffaa */
	cpctm_asicColor(13, 15, 9),  /* #ddff99 */
	cpctm_asicColor(14, 15, 10), /* #ddffaa */
	cpctm_asicColor(15, 15, 11), /* #ddffbb */
	cpctm_asicColor(15, 15, 12), /* #ddffcc */
};

static const u16 roland_band_colours[ROLAND_BAND_COUNT] = {
	cpctm_asicColor(0, 0, 15),  /* #0000ff */
	cpctm_asicColor(1, 3, 15),  /* #1133ff */
	cpctm_asicColor(3, 5, 15),  /* #3355ff */
	cpctm_asicColor(4, 8, 15),  /* #4488ff */
	cpctm_asicColor(6, 11, 15), /* #66bbff */
	cpctm_asicColor(7, 13, 15), /* #77ddff */
	cpctm_asicColor(9, 13, 15), /* #99ddff */
};

static const u16 t_pal_blank[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
};

static const u16 t_pal_top[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(9, 9, 11),   /* #9999bb */
	cpctm_asicColor(1, 1, 4),    /* #111144 */
	cpctm_asicColor(7, 7, 13),   /* #7777dd */
};

static const u16 t_slopes_ramp[8] = {
	cpctm_asicColor(6, 6, 12),   /* #6666cc */
	cpctm_asicColor(7, 7, 13),   /* #7777dd */
	cpctm_asicColor(8, 8, 14),   /* #8888ee */
	cpctm_asicColor(9, 9, 15),   /* #9999ff */
	cpctm_asicColor(10, 10, 15), /* #aaaaff */
	cpctm_asicColor(9, 9, 15),   /* #9999ff */
	cpctm_asicColor(8, 8, 14),   /* #8888ee */
	cpctm_asicColor(7, 7, 13),   /* #7777dd */
};

static const u16 t_pal_slopes[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 5, 0),   /* #ff5500 */
	cpctm_asicColor(0, 0, 0),    /* #000000 */
	cpctm_asicColor(15, 11, 4),  /* #ffbb44 */
};

static const u16 t_pal_trees[] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(6, 10, 8),   /* #66aa88 */
	cpctm_asicColor(1, 4, 1),    /* #114411 */
	cpctm_asicColor(3, 7, 5),    /* #337755 */
};

static const u16 t_pal_middle[4] = {
	cpctm_asicColor(1, 5, 13),   /* #1155dd */
	cpctm_asicColor(3, 5, 8),    /* #335588 */
	cpctm_asicColor(5, 10, 14),  /* #55aaee */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
};

static const u16 t_pal_ice[4] = {
	cpctm_asicColor(7, 10, 15),  /* #77aaff */
	cpctm_asicColor(10, 14, 15), /* #aaeeff */
	cpctm_asicColor(5, 8, 14),   /* #5588ee */
	cpctm_asicColor(13, 14, 15), /* #ddeeff */
};

static const u16 t_pal_text[4] = {
	cpctm_asicColor(4, 9, 14),   /* #4499ee */
	cpctm_asicColor(11, 14, 15), /* #bbeeff */
	cpctm_asicColor(15, 7, 0),   /* #ff7700 */
	cpctm_asicColor(14, 12, 1),  /* #eecc11 */

};

void t_start(void) {

	a_clear_sprites();
	v_blank_screen_mode_1();
	v_clear_screen();
	g_game_mode = 0;

	/* Load static title sprites (controls + PLAY) */
	t_load_static_title_sprites();

	/* Init and load Roland */
	t_init_roland_slots(140);
	t_load_roland_from_cache(false);

	/* Load current game-mode word */
	t_load_game_mode_word();

	a_blank_hardware_sprite_palette();
	t_draw_bg();
	a_set_hardware_sprite_palette(roland_sprites_palette);
	t_draw_game_mode();
	t_draw_static_sprites();

	cpct_PLY_AKG_Init(MUSIC_LOC, 0);

	t_reset_timers();
	cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
}

void t_do(void) {

	t_add_interrupt();

	t_start_roland_scroll(false, 140, 4);

	while (1) {

		/* Input & mode change */
		if (t_mode_cooldown > 0) {
			t_mode_cooldown--;
		} else {
			title_input_t input = t_poll_title_input();

			if (input != TITLE_INPUT_NONE) {
				t_change_game_mode((i8)input);
				t_mode_cooldown = TITLE_MODE_COOLDOWN_FRAMES;
				if (g_game_mode == 0)
					a_set_hardware_sprite_palette(
						titles_sprites_palette_classic);
				else if (g_game_mode == 1)
					a_set_hardware_sprite_palette(
						titles_sprites_palette_mania);
				else if (g_game_mode == 2)
					a_set_hardware_sprite_palette(
						titles_sprites_palette_zen);
			}
		}

		/* Animation */
		t_update_roland();

		cpct_waitVSYNC();
	}
}

void t_stop(void) {

	t_remove_interrupt();
	a_clear_sprites();
	v_blank_screen_mode_1();
}

static void t_draw_static_sprites(void) {

	/* Draw controls */
	cpct_asicSetSpritePosition(HW_SPRITE_TITLE_CONTROLS_START, 192, 88);
	cpct_asicSetSpritePosition(HW_SPRITE_TITLE_CONTROLS_START + 1, 416, 88);
	cpct_asicSetSpritePosition(
		HW_SPRITE_TITLE_CONTROLS_START + 2, 276, 128);
	cpct_asicSetSpritePosition(
		HW_SPRITE_TITLE_CONTROLS_START + 3, 276, 144);
	cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START, 2, 1);
	cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 1, 2, 1);
	cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 2, 2, 1);
	cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_CONTROLS_START + 3, 2, 1);

	u16 x = 154 * 2;
	u8 y = 128;
	cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START, x, y);
	cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START, 2, 1);
	x += 32;
	cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START + 1, x, y);
	cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + 1, 2, 1);
	x += 32;
	cpct_asicSetSpritePosition(HW_SPRITE_TITLE_PLAY_START + 2, x, y);
	cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + 2, 2, 1);
}

/* Reset Interrupt Timers */
static void t_reset_timers(void) {

	t_int_idx = 0;
	t_frame_c = 0;
}

static void t_draw_game_mode(void) {

	u16 x, y;
	u8 count;

	/* Hide all mode slots first */
	for (u8 i = 0; i < 4; i++)
		cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_MODE_START + i, 0, 0);

	y = 105;

	if (g_game_mode == 0) {
		/* CLASSIC (4) */
		x = 87 * 2;
		count = 4;

	} else if (g_game_mode == 1) {
		/* MANIA (3) */
		x = 155 * 2;
		count = 3;

	} else {
		/* ZEN (2) */
		x = 207 * 2;
		count = 2;
	}

	/* Position only the sprites that exist */
	for (u8 i = 0; i < count; i++) {
		cpct_asicSetSpritePosition(
			HW_SPRITE_TITLE_MODE_START + i, x, y);
		cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_MODE_START + i, 2, 1);
		x += 32;
	}
}

/* Draw the screen */
static void t_draw_bg(void) {

	if (HW_HAS_128K(g_hw))
		d_gfx_decompress_to_screen(GFX_TITLE);
	else {
		a_page_disconnect_safe();
		d_load("TITLE   SCR", VIDEO_MEM_START);
		a_page_connect_safe();
	}
}

static void t_add_interrupt(void) {

	static const u8 lines[] = {
		(u8)TITLES_RASTER_ROLAND_START,
		(u8)(TITLES_RASTER_ROLAND_START + 6),
		(u8)(TITLES_RASTER_ROLAND_START + 12),
		(u8)(TITLES_RASTER_ROLAND_START + 18),
		(u8)(TITLES_RASTER_ROLAND_START + 24),
		(u8)(TITLES_RASTER_ROLAND_START + 30),
		(u8)(TITLES_RASTER_ROLAND_START + 36),
		(u8)(TITLES_RASTER_ROLAND_START + 42),
		(u8)(TITLES_RASTER_SLOPES),
		(u8)(TITLES_RASTER_TREES),
		(u8)(TITLES_RASTER_DO_STUFF),
		(u8)(TITLES_RASTER_ICE),
		(u8)(TITLES_RASTER_TEXT),
	};

	cpct_waitVSYNC();

	cpct_asicSetLinesInterruptHandler(t_interrupt, lines, sizeof(lines));
}

static void t_remove_interrupt(void) {

	cpct_asicRemoveLinesInterruptHandler();
}

static void t_interrupt(u8 line) __z88dk_fastcall {

	if (line < TITLES_RASTER_SLOPES) {

		if (line == 0) {

			cpct_asicSetPalColour(0, t_pal_top[0]);
			cpct_asicSetPalColour(1, t_pal_top[1]);
			cpct_asicSetPalColour(2, t_pal_top[2]);
			cpct_asicSetPalColour(3, t_pal_top[3]);
		}

		/* Top level Roland gradient */
		u8 band = (line - TITLES_RASTER_ROLAND_START) >> 3;

		/* TODO: palette entry 3 for loaded file in 64k mode not 2? */
		cpct_asicSetPalColour(1, roland_band_colours[band]);

	} else if (line == TITLES_RASTER_SLOPES) {

		/* Colour cycling for "ON THE SLOPES "*/
		t_update_slopes_cycle();
	} else if (line == TITLES_RASTER_TREES) {

		/* Trees palette colour */
		cpct_asicSetPalette(t_pal_trees, 4);
	} else if (line == TITLES_RASTER_DO_STUFF) {

		/* Do the usual interrupt at in a spare area of the screen */
		if (t_int_idx == 0) {
			if (++t_frame_c == FC_MAX)
				t_frame_c = 0;
		}

		// if (t_int_idx == 3)
		cpct_PLY_AKG_Play();

		if (t_int_idx == 2)
			cpct_scanKeyboard_if();

		if (t_int_idx == 4) {

			if (++text_tick >= TITLES_TEXT_SPEED) {
				text_tick = 0;
				if (++text_phase >= TITLES_TEXT_COLOUR_COUNT)
					text_phase = 0;
			}
		}

		if (t_int_idx == 5) {

			if (++slopes_tick >= SLOPES_SPEED) {
				slopes_tick = 0;
				t_step_slopes_phase();
			}
		}

		if (++t_int_idx == 6)
			t_int_idx = 0;

	} else if (line == TITLES_RASTER_ICE) {

		/* Ice palette for the ground which Roland skates */
		cpct_asicSetPalette(t_pal_ice, 4);
	} else if (line == TITLES_RASTER_TEXT) {

		/* Cycle the text colours gently */
		u8 idx = text_phase;
		cpct_asicSetPalColour(2, cpctm_asicColor(0, 0, 0));
		cpct_asicSetPalColour(1, text_col_top[idx]);
		cpct_asicSetPalColour(3, text_col_bottom[idx]);
	}
}

static void t_update_slopes_cycle(void) {

	/* Bottom ink (darker) */
	u8 idx_bottom = slopes_phase;

	/* Top ink (lighter) */
	u8 idx_top = slopes_phase + 1;
	if (idx_top >= SLOPES_RAMP_COUNT)
		idx_top = SLOPES_RAMP_COUNT - 1;

	cpct_asicSetPalColour(1, t_slopes_ramp[idx_bottom]);
	cpct_asicSetPalColour(3, t_slopes_ramp[idx_top]);
}

static void t_step_slopes_phase(void) {

	slopes_phase += slopes_dir;

	if (slopes_phase == SLOPES_RAMP_COUNT - 2)
		slopes_dir = -1;
	else if (slopes_phase == 0)
		slopes_dir = 1;
}

static void t_ani_roland_l(u8 y, u8 speed) {

	t_load_roland_from_cache(false);

	t_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y,
		v_set_title_roland_sprite_pos);
}

static void t_ani_roland_r(u8 y, u8 speed) {

	t_load_roland_from_cache(true);

	t_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y,
		v_set_title_roland_sprite_pos);
}

static void t_scroll_sprite_h(
	i16 start_x, i16 end_x, i16 step, u8 y, sprite_pos_fn_t pos_fn) {

	for (i16 x = start_x; (step > 0) ? (x <= end_x) : (x >= end_x);
		x += step) {

		pos_fn(x, y, t_roland_right);

		t_poll_title_input();
		cpct_waitVSYNC();
	}
}

static void t_load_roland_from_cache(bool right) {

	sprite_bank_id_t bank = right ? SPR_BANK_ROLAND_R : SPR_BANK_ROLAND_L;

	for (u8 i = 0; i < 4; i++) {
		cpct_waitVSYNC();
		c_sprite_cache_bank_upload(bank, i, ASIC_SPR_ROLAND_START + i);
		cpct_asicSetSpriteZoom(ASIC_SPR_ROLAND_START + i, 2, 1);
	}

	t_roland_right = right;
}

static void t_init_roland_slots(u8 y) {

	i16 x = -SPRITE_WIDTH_ZOOM;

	for (u8 i = 0; i < 4; i++) {
		cpct_asicSetSpritePosition(ASIC_SPR_ROLAND_START + i, x, y);
		cpct_asicSetSpriteZoom(ASIC_SPR_ROLAND_START + i, 2, 1);
		x += SPRITE_WIDTH_ZOOM;
	}
}

static void t_load_static_title_sprites(void) {

	/* CONTROLS: titles_sprites_data[4..7] */
	for (u8 i = 0; i < 4; i++) {

		a_load_hw_sprite(HW_SPRITE_TITLE_CONTROLS_START + i, 4 + i,
			titles_sprites_data, false);

		cpct_asicSetSpriteZoom(
			HW_SPRITE_TITLE_CONTROLS_START + i, 2, 1);
	}

	/* PLAY: titles_sprites_data[8..10] */
	for (u8 i = 0; i < 3; i++) {
		a_load_hw_sprite(HW_SPRITE_TITLE_PLAY_START + i, 8 + i,
			titles_sprites_data, false);
		cpct_asicSetSpriteZoom(HW_SPRITE_TITLE_PLAY_START + i, 2, 1);
	}
}

static void t_load_game_mode_word(void) {

	sprite_bank_id_t bank;
	u8 count;

	if (g_game_mode == 0) {
		bank = SPR_BANK_MODE_CLASSIC;
		count = 4;
	} else if (g_game_mode == 1) {
		bank = SPR_BANK_MODE_MANIA;
		count = 3;
	} else {
		bank = SPR_BANK_MODE_ZEN;
		count = 2;
	}

	/* Hide MODE slots only */
	a_hide_sprite_range(ASIC_SPR_MODE_START, 4);

	/* Upload MODE sprites from cache */
	for (u8 i = 0; i < count; i++) {
		cpct_waitVSYNC();
		c_sprite_cache_bank_upload(bank, i, ASIC_SPR_MODE_START + i);
		cpct_asicSetSpriteZoom(ASIC_SPR_MODE_START + i, 2, 1);
	}
}

static void t_change_game_mode(i8 delta) {

	i8 mode = (i8)g_game_mode + delta;

	if (mode < 0)
		mode = 2;
	else if (mode > 2)
		mode = 0;

	if ((u8)mode == g_game_mode)
		return;

	g_game_mode = (u8)mode;

	/* Reload MODE sprites */
	cpct_waitVSYNC();
	t_load_game_mode_word();
	cpct_waitVSYNC();
	t_draw_game_mode();
	cpct_waitVSYNC();

	/* This needs to be here for some timing reason */
	cpct_asicSetBorder(cpctm_asicColor(15, g_game_mode, g_game_mode));
	cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
}

static title_input_t t_poll_title_input(void) {

	static bool left_was_down = false;
	static bool right_was_down = false;

	bool left_down = cpct_isKeyPressed(Key_CursorLeft);
	bool right_down = cpct_isKeyPressed(Key_CursorRight);

	title_input_t result = TITLE_INPUT_NONE;

	if (left_down && !left_was_down)
		result = TITLE_INPUT_LEFT;
	else if (right_down && !right_was_down)
		result = TITLE_INPUT_RIGHT;

	left_was_down = left_down;
	right_was_down = right_down;

	return result;
}

static void t_start_roland_scroll(bool right, u8 y, i8 speed) {

	t_roland_right = right;
	t_roland_y = y;

	if (right) {
		t_roland_start_x = SCREEN_WIDTH_M2;
		t_roland_end_x = -SPRITE_WIDTH_ZOOM;
		t_roland_step = -speed;
	} else {
		t_roland_start_x = -SPRITE_WIDTH_ZOOM;
		t_roland_end_x = SCREEN_WIDTH_M2;
		t_roland_step = speed;
	}

	t_roland_x = t_roland_start_x;
	t_roland_active = true;

	t_load_roland_from_cache(right);
}

static void t_update_roland(void) {

	if (!t_roland_active)
		return;

	v_set_title_roland_sprite_pos(t_roland_x, t_roland_y, t_roland_right);

	t_roland_x += t_roland_step;

	if ((t_roland_step > 0 && t_roland_x > t_roland_end_x) ||
		(t_roland_step < 0 && t_roland_x < t_roland_end_x)) {

		t_roland_active = false;

		/* auto-reverse */
		t_start_roland_scroll(!t_roland_right, t_roland_y,
			(t_roland_step > 0) ? t_roland_step : -t_roland_step);
	}
}
