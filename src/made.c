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
static void m_draw_bg(void);
static void m_add_interrupt(void);
static void m_remove_interrupt(void);
static void m_reset_timers(void);
static void m_interrupt(u8 line) __z88dk_fastcall;
static void m_draw_hw_sprites(void);

/* Interrupt Indexes and Counters */
static u8 m_int_idx = 0;
static u8 m_frame_c = 0;

/* Palettes */
static const u16 m_pal_blank[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(15, 15, 15), /* #ffffff */
};

static const u16 m_pal_usual[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(0, 0, 0),    /* #000000 */
	cpctm_asicColor(9, 9, 9),    /* #999999 */
	cpctm_asicColor(9, 2, 5),    /* #992255 */
};

static const u16 m_pal_text[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(0, 0, 0),    /* #000000 */
	cpctm_asicColor(10, 11, 15), /* #aabbff */
	cpctm_asicColor(5, 5, 15),   /* #5555ff */
};

/* TODO: palette entry 3 for loaded file in 64k mode not 2? */

// static const u16 m_pal_logo[4] = {
//	cpctm_asicColor(15, 15, 15), /* #ffffff */
//	cpctm_asicColor(6, 5, 1),    /* #665511 */
//	cpctm_asicColor(13, 12, 4),  /* #ddcc44 */
//	cpctm_asicColor(0, 0, 0),    /* #000000 */
// };

static const u16 m_pal_logo[4] = {
	cpctm_asicColor(15, 15, 15), /* #ffffff */
	cpctm_asicColor(6, 5, 1),    /* #665511 */
	cpctm_asicColor(0, 0, 0),    /* #000000 */
	cpctm_asicColor(13, 12, 4),  /* #ddcc44 */
};

/* Start the Presents Screen */
void m_start(void) {

	/* Clear the screen */
	a_clear_sprites();
	v_blank_screen_mode_1();
	v_clear_screen();

	/* Draw the mage */
	m_draw_bg();
	m_draw_hw_sprites();

	m_reset_timers();
	m_add_interrupt();

	g_clock_on = true;
	u_reset_clock();
	u_wait_for_duration_or_kp(15);
	g_clock_on = false;

	/* Draw the foreground animations */
	a_clear_sprites();
}

/* Stop the Presents Screen */
void m_stop(void) {

	m_remove_interrupt();
	a_clear_sprites();

	v_blank_screen_mode_1();
	v_clear_screen();
}

/* Reset Interrupt Timers */
static void m_reset_timers(void) {

	m_int_idx = 0;
	m_frame_c = 0;
}

static void m_draw_hw_sprites(void) {

	a_load_cpctelera_sprites(false);
	v_set_made_cpctelera_sprite_pos(454, 36, false);
	a_set_hardware_sprite_palette(cpctelera_sprites_palette);
}

/* Draw the Presents screen */
static void m_draw_bg(void) {

	if (HW_HAS_128K(g_hw))
		d_gfx_decompress_to_screen(GFX_MADEWIDTH);
	else {
		a_page_disconnect_safe();
		d_load("MADEWITHSCR", VIDEO_MEM_START);
		a_page_connect_safe();
	}

	cpct_asicSetBorder(cpctm_asicColor(15, 15, 15));
}

static void m_add_interrupt(void) {

	static const u8 lines[] = {
		MADE_DO_STUFF,
		MADE_TEXT_TOP,
		MADE_CPC_TELERA,
		MADE_TEXT_BOTTOM,
		MADE_GX4000,
	};

	cpct_waitVSYNC();

	cpct_asicSetLinesInterruptHandler(m_interrupt, lines, sizeof(lines));
}

static void m_interrupt(u8 line) __z88dk_fastcall {

	if (line == MADE_DO_STUFF) {

		if (m_int_idx == 0) {
			if (++m_frame_c == FC_MAX)
				m_frame_c = 0;
		}

		if (m_int_idx == 1)
			cpct_scanKeyboard_if();

		if (m_int_idx == 3)
			u_clock_interrupt();

		if (++m_int_idx == 6)
			m_int_idx = 0;

	} else if (line == MADE_TEXT_TOP)
		cpct_asicSetPalette(m_pal_text, 4);
	else if (line == MADE_CPC_TELERA)
		cpct_asicSetPalette(m_pal_usual, 4);
	else if (line == MADE_TEXT_BOTTOM)
		cpct_asicSetPalette(m_pal_text, 4);
	else if (line == MADE_GX4000)
		cpct_asicSetPalette(m_pal_logo, 4);
}

static void m_remove_interrupt(void) {

	cpct_asicRemoveLinesInterruptHandler();
}