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

typedef struct {
		const u8 *begin;
		const u8 *end;
} sprite_data_t;

typedef struct {
		u8 r, g, b;
} rgb_t;

typedef struct {
		u8 hw_id;
		u8 frame;
} sprite_load_t;

typedef struct {
		u8 frame;
		u8 count;
		i8 dir;
} sprite_anim_state_t;

/* Realtime clock */
typedef struct {

		u16 ms; /* Milliseconds*/
		u16 s;	/* Seconds */
} clock_t;

typedef struct {
		u8 phase;
		i8 y_off;
} ghost_bob_t;

typedef enum {
	TITLE_INPUT_NONE = 0,
	TITLE_INPUT_LEFT = -1,
	TITLE_INPUT_RIGHT = +1
} title_input_t;

/* One entry per compressed graphical resource */
typedef struct {
		u16 offset; /* Offset from GFX_BANK_BASE */
		u16 size;   /* Compressed size in bytes */
} gfx_resource_t;

/* List of graphical resources */
typedef enum {
	GFX_PRESENTS,
	GFX_MADEWIDTH,
	GFX_INTRO,
	GFX_TITLE,
	GFX_COUNT
} gfx_id_t;

/* Intro Screen Animation Callbacks */
typedef void (*sprite_pos_fn_t)(i16 x, i16 y, bool reversed);
typedef void (*sprite_load_fn_t)(bool flip);
typedef void (*sprite_tick_fn_t)(u8 *state);