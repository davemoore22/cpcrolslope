
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

#include "lib/utilities.h"

/* Enable Global Timer */
bool g_clock_on;

/* Realtime Clock */
clock_t g_clock = {.ms = 0, .s = 0};

/* Interrupt function used by Realtime Clock */
void u_clock_interrupt(void) {

	static u8 count = 0;

	/* Skip if the Realtime Clock is not enabled */
	if (g_clock_on) {

		/*
		 * On a CPC, interrupts are called every 1/300 of a second,
		 * therefore we throttle this function down to only do a tick
		 * every 1/50 of a second (20 microseconds)
		 */
		if (++count == 6)
			count = 0;
		if (count == 5) {
			g_clock.ms += 20;
			if (g_clock.ms == 1000) {
				++g_clock.s;
				g_clock.ms = 0;
			}
		}

		/*
		 * Note that this will cause an error once g_timer_s > 65535,
		 * or just over 18 hours; for efficiency purposes we do not
		 * check for this overlow!
		 */
	}
}

/* Reset Clock */
void u_reset_clock(void) {

	g_clock.ms = g_clock.s = 0;
}

void u_clock_tick(void) {

	g_clock.ms += 20;
	if (g_clock.ms >= 1000) {
		g_clock.ms = 0;
		++g_clock.s;
	}
}

/* Clear Input Queue */
void u_clear_input(void) {

	cpct_scanKeyboard_f();
	while (cpct_isAnyKeyPressed_f())
		cpct_scanKeyboard_f();
}

void u_wait_for_duration_or_kp(u16 duration) {

	g_clock_on = true;

	u_clear_input();

	bool kp = false;
	while ((!kp) && (g_clock.s < duration)) {

		cpct_waitVSYNC();
		u_clock_tick();
		if (cpct_isAnyKeyPressed()) {
			kp = true;
			g_skip = true;
		}
	}

	u_clear_input();

	/* Stop Clock */
	g_clock_on = false;
}