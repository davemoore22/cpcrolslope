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

#define TITLES_RASTER_ROLAND_START (u8)0
#define TITLES_RASTER_SLOPES (u8)50
#define TITLES_RASTER_TREES (u8)80
#define TITLES_RASTER_DO_STUFF (u8)120
#define TITLES_RASTER_ICE (u8)169
#define TITLES_RASTER_TEXT (u8)184
#define ROLAND_BAND_COUNT 7

#define SLOPES_RAMP_COUNT 8
#define SLOPES_SPEED 2

#define TEXT_RASTER_SPEED 1
#define TEXT_COLOUR_COUNT 8

#define TITLES_TEXT_COLOUR_COUNT 8
#define TITLES_TEXT_SPEED 2

#define TITLE_MODE_COOLDOWN_FRAMES 25

extern u8 g_game_mode;

/* Public Functions */
void t_start(void);
void t_do(void);
void t_stop(void);