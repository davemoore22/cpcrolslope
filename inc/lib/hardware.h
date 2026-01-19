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

#define WINAPE_BRK __asm__(".dw #0xFFED");

/* Macros for Hardware detection */
#define HW_RAM_MASK 0x03
#define HW_PLUS_FLAG 0x04

/* RAM size values */
#define HW_RAM_64K 0
#define HW_RAM_128K 1
#define HW_RAM_256K 2

/* Extractors */
#define HW_RAM_SIZE(hw) ((hw) & HW_RAM_MASK)
#define HW_IS_PLUS(hw) ((hw) & HW_PLUS_FLAG)

/* Convenience checks */
#define HW_HAS_128K(hw) (HW_RAM_SIZE(hw) >= HW_RAM_128K)
#define HW_HAS_256K(hw) (HW_RAM_SIZE(hw) >= HW_RAM_256K)

/* Optional: human-readable tests */
#define HW_IS_64K(hw) (HW_RAM_SIZE(hw) == HW_RAM_64K)
#define HW_IS_128K(hw) (HW_RAM_SIZE(hw) == HW_RAM_128K)
#define HW_IS_256K(hw) (HW_RAM_SIZE(hw) == HW_RAM_256K)

/* Header for code in detectcfg.s */
u8 h_get_details(void);
