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

#define BG_BLACK cpctm_asicColor(0, 0, 0)
#define BG_MED_BLUE cpctm_asicColor(0, 0, 12)

#define BG_PULSE_MAX 12
#define BG_PULSE_SPEED 2

#define TEXT_RASTER_Y_START (u8)81
#define TEXT_RASTER_Y_END (u8)(81 + 28)
#define STAR_RASTER_Y_START (u8)66
#define STAR_RASTER_Y_END (u8)(66 + 70)
#define RASTER_RESET_LINE (u8)1
#define RASTER_COLOUR_COUNT (u8)21

/* Public Functions */
void p_start(void);
void p_stop(void);
