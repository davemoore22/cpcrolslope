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

/* Private Functions */
static void i_reset_timers(void);
static void i_draw_bg(void);
static void i_add_interrupt(void);
static void i_remove_interrupt(void);
static void i_interrupt(u8 line) __z88dk_fastcall;
static void i_scroll_sprite_h(i16 start_x, i16 end_x, i16 step, u8 y,
	bool reversed, sprite_load_fn_t load_fn, const u16 *palette,
	sprite_pos_fn_t pos_fn, sprite_tick_fn_t tick_fn, u8 *tick_state);
static void i_ani_ghost_l(u8 y, u8 speed);
static void i_ani_roland_l(u8 y, u8 speed);
static void i_ani_roland_r(u8 y, u8 speed);
static void i_ani_snowball_r(u8 y, u8 speed);
static void i_ani_spider_l(u8 y, u8 speed);

static void i_spider_tick(u8 *state_ptr);
static void i_ghost_tick(u8 *state_ptr);
static void i_snowball_tick(u8 *state_ptr);

static void i_spider_init(void);
static void i_snowball_init(void);

/* Interrupt Indexes and Counters */
static u8 i_int_idx = 0;
static u8 i_frame_c = 0;

static bool show_roland = false;

ghost_bob_t g_ghost_bob = {0, 0};

static const i8 ghost_sine[32] = {0, 1, 2, 3, 4, 3, 2, 1, 0, -1, -2, -3, -4, -3,
	-2, -1, 0, 1, 2, 3, 4, 3, 2, 1, 0, -1, -2, -3, -4, -3, -2, -1};

static const u16 i_pal_in[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 11, 15), /* #ffbbff */
	cpctm_asicColor(0, 0, 0),    /* #000000 */
	cpctm_asicColor(15, 5, 15),  /* #ff55ff*/
};

static const u16 i_pal_ice[4] = {
	cpctm_asicColor(7, 10, 15),  /* #77aaff */
	cpctm_asicColor(10, 14, 15), /* #aaeeff */
	cpctm_asicColor(5, 8, 14),   /* #5588ee */
	cpctm_asicColor(13, 14, 15), /* #ddeeff */
};

static const u16 i_pal_trees[] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(6, 10, 8),   /* #66aa88 */
	cpctm_asicColor(1, 4, 1),    /* #114411 */
	cpctm_asicColor(3, 7, 5),    /* #337755 */
};

static const u16 i_pal_blank_white[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
};

static const u16 i_pal_blank_ice[4] = {
	cpctm_asicColor(7, 10, 15), /* #77aaff */
	cpctm_asicColor(7, 10, 15), /* #77aaff */
	cpctm_asicColor(7, 10, 15), /* #77aaff */
	cpctm_asicColor(7, 10, 15), /* #77aaff */
};

/* TODO: palette entry 3 for loaded file in 64k mode not 2? */
// static const u16 i_pal_top[4] = {
//	cpctm_asicColor(15, 15, 15), /* #ffffff */
//	cpctm_asicColor(9, 9, 11),   /* #9999bb */
//	cpctm_asicColor(1, 1, 4),    /* #111144 */
//	cpctm_asicColor(7, 7, 13),   /* #7777dd */
// };

static const u16 i_pal_top[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(7, 7, 13),   /* #7777dd */
	cpctm_asicColor(1, 1, 4),    /* #111144 */
	cpctm_asicColor(9, 9, 11),   /* #9999bb */
};

/* Start the Presents Screen */
void i_start(void) {

	/* Clear the screen */
	a_clear_sprites();
	v_blank_screen_mode_1();
	v_clear_screen();

	show_roland = false;
	i_draw_bg();

	/* Set up the foreground animations */
	i_reset_timers();
	i_add_interrupt();
	cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));

	/* Draw the initial chase */
	i_ani_roland_l(140, INTRO_SPEED_LEFT);
	if (g_skip)
		return;
	i_ani_spider_l(144, INTRO_SPEED_LEFT);
	if (g_skip)
		return;
	show_roland = true;
	i_ani_roland_r(140, INTRO_SPEED_RIGHT);
	if (g_skip)
		return;
	i_ani_snowball_r(140, INTRO_SPEED_RIGHT);
	if (g_skip)
		return;

	u8 *v_pos = cpctm_screenPtr(CPCT_VMEM_START, 35, 54);
	cpct_waitVSYNCStart();
	cpct_asicPageDisconnect();
	cpct_drawSprite(img_in, v_pos, 10, 24);
	cpct_asicPageConnect();

	i_ani_roland_l(140, INTRO_SPEED_LEFT);
	if (g_skip)
		return;
	i_ani_ghost_l(124, INTRO_SPEED_LEFT);
	if (g_skip)
		return;
}

/* Stop the Presents Screen */
void i_stop(void) {

	u_wait_for_duration_or_kp(5);

	v_clear_screen();

	i_remove_interrupt();
	v_blank_screen_mode_1();
	v_clear_screen();
}

static void i_draw_bg(void) {

	if (HW_HAS_128K(g_hw))
		d_gfx_decompress_to_screen(GFX_INTRO);
	else {
		a_page_disconnect_safe();
		d_load("INTRO   SCR", VIDEO_MEM_START);
		a_page_connect_safe();
	}
}

static void i_reset_timers(void) {

	i_int_idx = 0;
	i_frame_c = 0;
}

static void i_add_interrupt(void) {

	static const u8 lines[] = {
		INTRO_RASTER_TOP,
		INTRO_RASTER_SLOPES,
		INTRO_RASTER_SCENERY,
		INTRO_RASTER_DO_STUFF,
		INTRO_RASTER_ICE,
		INTRO_RASTER_TEXT,
	};

	cpct_waitVSYNC();

	cpct_asicSetLinesInterruptHandler(i_interrupt, lines, sizeof(lines));
}

static void i_remove_interrupt(void) {

	cpct_asicRemoveLinesInterruptHandler();
}

static void i_interrupt(u8 line) __z88dk_fastcall {

	if (line == INTRO_RASTER_TOP) {
		if (!show_roland)
			cpct_asicSetPalette(i_pal_blank_white, 4);
		else
			cpct_asicSetPalette(i_pal_top, 4);
	} else if (line == INTRO_RASTER_SLOPES) {
		cpct_asicSetPalette(i_pal_in, 4);
	} else if (line == INTRO_RASTER_SCENERY) {
		cpct_asicSetPalette(i_pal_trees, 4);
	} else if (line == INTRO_RASTER_DO_STUFF) {

		if (i_int_idx == 0) {
			if (++i_frame_c == FC_MAX)
				i_frame_c = 0;
		}

		if (i_int_idx == 1)
			cpct_scanKeyboard_if();

		if (i_int_idx == 2)
			u_clock_interrupt();

		if (++i_int_idx == 6)
			i_int_idx = 0;
	} else if (line == INTRO_RASTER_ICE) {
		cpct_asicSetPalette(i_pal_ice, 4);
	} else if (line == INTRO_RASTER_TEXT) {
		cpct_asicSetPalette(i_pal_blank_ice, 4);
	}
}

static void i_scroll_sprite_h(i16 start_x, i16 end_x, i16 step, u8 y,
	bool reversed, sprite_load_fn_t load_fn, const u16 *palette,
	sprite_pos_fn_t pos_fn, sprite_tick_fn_t tick_fn, u8 *tick_state) {

	load_fn(reversed);
	a_set_hardware_sprite_palette(palette);

	for (i16 x = start_x; (step > 0) ? (x <= end_x) : (x >= end_x);
		x += step) {

		pos_fn(x, y, reversed);

		if (tick_fn)
			tick_fn(tick_state);

		cpct_waitVSYNC();
		if (cpct_isAnyKeyPressed()) {
			g_skip = true;
			return;
		}
	}
}

static void i_ani_ghost_l(u8 y, u8 speed) {

	i_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y, false,
		a_load_ghost_sprites, ghost_sprites_palette,
		v_set_intro_ghost_sprite_pos, i_ghost_tick, (u8 *)&g_ghost_bob);
}

static void i_ani_roland_l(u8 y, u8 speed) {

	i_scroll_sprite_h(-SPRITE_WIDTH_ZOOM, SCREEN_WIDTH_M2, speed, y, false,
		a_load_roland_sprites, roland_sprites_palette,
		v_set_intro_roland_sprite_pos, NULL, NULL);
}

static void i_ani_roland_r(u8 y, u8 speed) {

	i_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y, true,
		a_load_roland_sprites, roland_sprites_palette,
		v_set_intro_roland_sprite_pos, NULL, NULL);
}

static void i_spider_tick(u8 *state_ptr) {

	sprite_anim_state_t *s = (sprite_anim_state_t *)state_ptr;

	if (++s->count == 8) {

		v_spider_set_frame(s->frame);

		s->frame += s->dir;

		/* Bounce at the ends: 0 and 2 */
		if (s->frame == 2 || s->frame == 0)
			s->dir = -s->dir;

		s->count = 0;
	}
}

static void i_snowball_tick(u8 *state_ptr) {

	sprite_anim_state_t *s = (sprite_anim_state_t *)state_ptr;

	if (++s->count == 8) {

		v_snowball_set_frame(s->frame);

		s->frame++;
		if (s->frame > 3)
			s->frame = 0;

		s->count = 0;
	}
}

static void i_spider_init(void) {

	for (u8 i = 0; i < 3; i++)
		cpct_asicSetSpriteZoom(i, 2, 1);

	for (u8 i = 3; i < 12; i++)
		cpct_asicSetSpriteZoom(i, 0, 0);
}

static void i_snowball_init(void) {

	for (u8 i = 2; i < 8; i++)
		cpct_asicSetSpriteZoom(i, 0, 0);
	for (u8 i = 10; i < 16; i++)
		cpct_asicSetSpriteZoom(i, 0, 0);

	cpct_asicSetSpriteZoom(0, 2, 1);
	cpct_asicSetSpriteZoom(1, 2, 1);
	cpct_asicSetSpriteZoom(8, 2, 1);
	cpct_asicSetSpriteZoom(9, 2, 1);
}

static void i_ani_snowball_r(u8 y, u8 speed) {

	sprite_anim_state_t state = {.frame = 0, .count = 0, .dir = 1};

	a_load_snowball_sprites(false);
	i_snowball_init();

	i_scroll_sprite_h(SCREEN_WIDTH_M2, -SPRITE_WIDTH_ZOOM, -speed, y, false,
		a_load_snowball_sprites, snowball_sprites_palette,
		v_set_intro_snowball_sprite_pos, i_snowball_tick, (u8 *)&state);
}

static void i_ani_spider_l(u8 y, u8 speed) {

	sprite_anim_state_t state = {.frame = 0, .count = 0, .dir = 1};

	a_load_spider_sprites(false);
	i_spider_init();

	i_scroll_sprite_h(-SPRITE_WIDTH_M2, SCREEN_WIDTH_M2, speed, y, false,
		a_load_spider_sprites, spider_sprites_palette,
		v_set_intro_spider_sprite_pos, i_spider_tick, (u8 *)&state);
}

static void i_ghost_tick(u8 *state_ptr) {

	ghost_bob_t *s = (ghost_bob_t *)state_ptr;

	s->phase = (s->phase + 1) & 31; /* Keep between 0 and 31 */
	s->y_off = ghost_sine[s->phase];
}
