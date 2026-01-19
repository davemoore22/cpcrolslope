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

#define INTRO_RASTER_TOP (u8)0
#define INTRO_RASTER_SLOPES (u8)50
#define INTRO_RASTER_SCENERY (u8)80
#define INTRO_RASTER_DO_STUFF (u8)120
#define INTRO_RASTER_ICE (u8)169
#define INTRO_RASTER_TEXT (u8)184

#define INTRO_SPEED_LEFT 8
#define INTRO_SPEED_RIGHT 8

extern ghost_bob_t g_ghost_bob;

/* Public Functions */
void i_start(void);
void i_stop(void);
