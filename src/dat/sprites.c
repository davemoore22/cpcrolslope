/*
 * Roland on the Slopes for the Amstrad CPC Plus
 * Copyright (C) 2026 Dave Moore
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,$(e
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; If not, see <http://www.gnu.org/licenses/>.
 */

#pragma codeseg DATA

#include "dat/sprites.h"

/* HW Sprite Tables */
const sprite_data_t roland_sprites_data[4] = {{roland_0, roland_0_end},
	{roland_1, roland_1_end}, {roland_2, roland_2_end},
	{roland_3, roland_3_end}};

const sprite_data_t snowball_sprites_data[16] = {{snowball_0, snowball_0_end},
	{snowball_1, snowball_1_end}, {snowball_2, snowball_2_end},
	{snowball_3, snowball_3_end}, {snowball_4, snowball_4_end},
	{snowball_5, snowball_5_end}, {snowball_6, snowball_6_end},
	{snowball_7, snowball_7_end}, {snowball_8, snowball_8_end},
	{snowball_9, snowball_9_end}, {snowball_10, snowball_10_end},
	{snowball_11, snowball_11_end}, {snowball_12, snowball_12_end},
	{snowball_13, snowball_13_end}, {snowball_14, snowball_14_end},
	{snowball_15, snowball_15_end}};

const sprite_data_t spider_sprites_data[12] = {{spider_0, spider_0_end},
	{spider_1, spider_1_end}, {spider_2, spider_2_end},
	{spider_3, spider_3_end}, {spider_4, spider_4_end},
	{spider_5, spider_5_end}, {spider_6, spider_6_end},
	{spider_7, spider_7_end}, {spider_8, spider_8_end},
	{spider_9, spider_9_end}, {spider_10, spider_10_end},
	{spider_11, spider_11_end}};

const sprite_data_t ghost_sprites_data[9] = {{ghost_0, ghost_0_end},
	{ghost_1, ghost_1_end}, {ghost_2, ghost_2_end}, {ghost_3, ghost_3_end},
	{ghost_4, ghost_4_end}, {ghost_5, ghost_5_end}, {ghost_6, ghost_6_end},
	{ghost_7, ghost_7_end}, {ghost_8, ghost_8_end}};

const sprite_data_t titles_sprites_data[11] = {
	/* Animated roland sprite */
	{roland_0, roland_0_end}, {roland_1, roland_1_end},
	{roland_2, roland_2_end}, {roland_3, roland_3_end},
	/* Control buttons sprites */
	{controls_0, controls_0_end}, {controls_1, controls_1_end},
	{controls_2, controls_2_end}, {controls_3, controls_3_end},
	/* Play text sprites */
	{play_0, play_0_end}, {play_1, play_1_end}, {play_2, play_2_end}};

const sprite_data_t mode_sprites_data[9] = {{mode_0, mode_0_end},
	{mode_1, mode_1_end}, {mode_2, mode_2_end}, {mode_3, mode_3_end},
	{mode_4, mode_4_end}, {mode_5, mode_5_end}, {mode_6, mode_6_end},
	{mode_7, mode_7_end}, {mode_8, mode_8_end}};

const sprite_data_t cpctelera_sprites_data[16] = {
	{cpctelera_0, cpctelera_0_end}, {cpctelera_1, cpctelera_1_end},
	{cpctelera_2, cpctelera_2_end}, {cpctelera_3, cpctelera_3_end},
	{cpctelera_4, cpctelera_4_end}, {cpctelera_5, cpctelera_5_end},
	{cpctelera_6, cpctelera_6_end}, {cpctelera_7, cpctelera_7_end},
	{cpctelera_8, cpctelera_8_end}, {cpctelera_9, cpctelera_9_end},
	{cpctelera_10, cpctelera_10_end}, {cpctelera_11, cpctelera_11_end},
	{cpctelera_12, cpctelera_12_end}, {cpctelera_13, cpctelera_13_end},
	{cpctelera_14, cpctelera_14_end}, {cpctelera_15, cpctelera_15_end}};

/* HW Sprite Palettes */
const u16 roland_sprites_palette[16] = {0x0FFF, 0x0113, 0x0142, 0x0327, 0x04F0,
	0x08F0, 0x0080, 0x0AF0, 0x052A, 0x0557, 0x0CF0, 0x082D, 0x0DF0, 0x0879,
	0x0B3F, 0x0EAF};

const u16 snowball_sprites_palette[16] = {0x0FFF, 0x0357, 0x0357, 0x0357,
	0x078C, 0x078C, 0x0BBF, 0x0BBF, 0x0BAF, 0x0DDF, 0x0EEF, 0x050C, 0x0000,
	0x0000, 0x0DD3, 0x050C};

const u16 spider_sprites_palette[16] = {0x0FFF, 0x0001, 0x054C, 0x06F6, 0x087D,
	0x0B4D, 0x0C8E, 0x0F9A, 0x0DDE, 0x0000, 0x0BEA, 0x050B, 0x0000, 0x0000,
	0x0000, 0x0000};

const u16 ghost_sprites_palette[16] = {0x0FFF, 0x09C0, 0x0B39, 0x0C4A, 0x0D5B,
	0x0E8D, 0x0DF0, 0x0FAE, 0x0FCE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
	0x0000, 0x0000};

const u16 titles_sprites_palette_classic[16] = {0xFFF, 0x113, 0x142, 0x327,
	0x4F0, 0x8F0, 0xFBF, 0xAF0, 0xFEF, 0x557, 0xCF0, 0x82D, 0xDF0, 0x879,
	0xB3F, 0xEAF};

const u16 titles_sprites_palette_zen[16] = {0xFFF, 0x113, 0x606, 0x327, 0x808,
	0xA0A, 0xFBF, 0xC0C, 0xFEF, 0x557, 0xD0D, 0x82D, 0xF0F, 0x879, 0xB3F,
	0xEAF};

const u16 titles_sprites_palette_mania[16] = {0xFFF, 0x113, 0x055, 0x327, 0x077,
	0x099, 0xFBF, 0x0BB, 0xFEF, 0x557, 0x0DD, 0x82D, 0x0FF, 0x879, 0xB3F,
	0xEAF};

const u16 mode_sprites_palette[16] = {0xFFF, 0x113, 0x142, 0x327, 0x4F0, 0x8F0,
	0xFBF, 0xAF0, 0xFEF, 0x557, 0xCF0, 0x82D, 0xDF0, 0x879, 0xB3F, 0xEAF};

const u16 cpctelera_sprites_palette[16] = {0x0FFF, 0x0000, 0x0111, 0x0222,
	0x0294, 0x0441, 0x0555, 0x0887, 0x0999, 0x0CCC, 0x0ED2, 0x0DF1, 0x0DF7,
	0x0EEE, 0x0FFA, 0x0FFD};
