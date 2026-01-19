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

#include "presents.h"

/* Private Functions */
static void p_draw_bg(void);
static void p_add_interrupt(void);
static void p_remove_interrupt(void);
static void p_reset_timers(void);
static void p_interrupt(u8 line) __z88dk_fastcall;

/* Interrupt Indexes and Counters */
static u8 p_int_idx = 0;
static u8 p_frame_c = 0;

static u8 p_raster_phase = 0;
static u8 p_raster_tick = 0;
static u8 p_star_pulse = 0;
static i8 p_star_pulse_dir = 1;

/* Palettes */
static const u16 p_pal_blank[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
};

static const u16 p_pal_usual[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(1, 5, 13),   /* #1155dd */
	cpctm_asicColor(2, 3, 4),    /* #223344 */
	cpctm_asicColor(6, 7, 8),    /* #667788  */
};

static const u16 p_pal_white[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
};

/* Start the Presents Screen */
void p_start(void) {

	/* Clear the screen */
	v_blank_screen_mode_1();
	v_clear_screen();

	/* Draw the background image */
	p_draw_bg();

	/* Start the animation (makes the logo visible )*/
	p_reset_timers();
	p_add_interrupt();
	cpct_asicSetPalette(p_pal_usual, 4);
	cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));

	g_clock_on = true;
	u_reset_clock();
	u_wait_for_duration_or_kp(25);
	g_clock_on = false;

	/* Draw the foreground animations */
	a_clear_sprites();
}

/* Stop the Presents Screen */
void p_stop(void) {

	p_remove_interrupt();

	v_blank_screen_mode_1();
	v_clear_screen();
}

/* Reset Interrupt Timers */
static void p_reset_timers(void) {

	p_int_idx = 0;
	p_frame_c = 0;
}

/* Draw the Presents screen */
static void p_draw_bg(void) {

	if (HW_HAS_128K(g_hw))
		d_gfx_decompress_to_screen(GFX_PRESENTS);
	else {
		a_page_disconnect_safe();
		d_load("PRESENTSSCR", VIDEO_MEM_START);
		a_page_connect_safe();
	}
	cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
}

static void p_add_interrupt(void) {

	static const u8 lines[] = {
		0,
		RASTER_RESET_LINE,
		TEXT_RASTER_Y_START,
		TEXT_RASTER_Y_START + 4,
		TEXT_RASTER_Y_START + 8,
		TEXT_RASTER_Y_START + 12,
		TEXT_RASTER_Y_START + 16,
		TEXT_RASTER_Y_START + 20,
		TEXT_RASTER_Y_START + 24,
		TEXT_RASTER_Y_END,
	};

	cpct_waitVSYNC();

	cpct_asicSetLinesInterruptHandler(p_interrupt, lines, sizeof(lines));
}

static void p_interrupt(u8 line) __z88dk_fastcall {

	static const u16 p_raster_colours[RASTER_COLOUR_COUNT] = {

		cpctm_asicColor(14, 0, 6), cpctm_asicColor(15, 0, 4),
		cpctm_asicColor(15, 0, 2), cpctm_asicColor(15, 1, 0),
		cpctm_asicColor(15, 3, 0), cpctm_asicColor(15, 5, 0),
		cpctm_asicColor(15, 7, 0), cpctm_asicColor(15, 9, 0),
		cpctm_asicColor(15, 11, 0), cpctm_asicColor(14, 14, 0),
		cpctm_asicColor(11, 14, 0), cpctm_asicColor(8, 14, 0),
		cpctm_asicColor(4, 13, 2), cpctm_asicColor(2, 12, 3),
		cpctm_asicColor(2, 11, 4), cpctm_asicColor(2, 9, 6),
		cpctm_asicColor(3, 7, 8), cpctm_asicColor(5, 5, 8),
		cpctm_asicColor(7, 3, 7), cpctm_asicColor(9, 2, 6),
		cpctm_asicColor(12, 1, 6)};

	if (line == 0) {

		if (p_int_idx == 0) {
			if (++p_frame_c == FC_MAX)
				p_frame_c = 0;
		}

		if (p_int_idx == 1)
			cpct_scanKeyboard_if();

		if (p_int_idx == 2)
			u_clock_interrupt();

		if (p_int_idx == 3) {

			p_raster_phase++;
			if (p_raster_phase >= RASTER_COLOUR_COUNT)
				p_raster_phase = 0;
		}

		if (p_int_idx == 4) {

			/* Handle colour cycling for Star Logo */
			static u8 bg_pulse_tick = 0;
			if (++bg_pulse_tick >= BG_PULSE_SPEED) {
				bg_pulse_tick = 0;

				p_star_pulse += p_star_pulse_dir;

				if (p_star_pulse >= BG_PULSE_MAX) {
					p_star_pulse = BG_PULSE_MAX;
					p_star_pulse_dir = -1;
				} else if (p_star_pulse == 0) {
					p_star_pulse_dir = 1;
				}
			}
		}

		if (++p_int_idx == 6)
			p_int_idx = 0;

	} else if (line == RASTER_RESET_LINE) {
		cpct_asicSetPalColour(0, p_pal_usual[0]);
		cpct_asicSetPalColour(1, /* Star colour */
			cpctm_asicColor(p_star_pulse, 0, p_star_pulse));

	} else if (line == TEXT_RASTER_Y_END) {
		/* TODO: palette entry 3 for loaded file in 64k mode not 2? */
		cpct_asicSetPalColour(2, p_pal_usual[2]);
	} else if (line < TEXT_RASTER_Y_START || line > TEXT_RASTER_Y_END) {
		return;
	} else {

		/* Compute band index (0..6) */
		u8 band = (line - TEXT_RASTER_Y_START) >> 2;

		/* Apply phase offset */
		u8 idx = band + RASTER_COLOUR_COUNT - p_raster_phase;
		if (idx >= RASTER_COLOUR_COUNT)
			idx -= RASTER_COLOUR_COUNT;

		/* Set new colour */

		/* TODO: palette entry 3 for loaded file in 64k mode not 2? */
		cpct_asicSetPalColour(2, p_raster_colours[idx]);
	}
}

static void p_remove_interrupt(void) {

	cpct_asicRemoveLinesInterruptHandler();
}