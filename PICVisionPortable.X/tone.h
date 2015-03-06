/*
* Copyright 2014, Jacques Deschênes
* This file is part of CHIPcon.
*
*     CHIPcon is free software: you can redistribute it and/or modify
*     it under the terms of the GNU General Public License as published by
*     the Free Software Foundation, either version 3 of the License, or
*     (at your option) any later version.
*
*     CHIPcon is distributed in the hope that it will be useful,
*     but WITHOUT ANY WARRANTY; without even the implied warranty of
*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*     GNU General Public License for more details.
*
*     You should have received a copy of the GNU General Public License
*     along with CHIPcon.  If not, see <http://www.gnu.org/licenses/>.
*/

/*
 * tone.h
 *
 * Created: 2014-09-26 10:18:30
 *  Author: Jacques Deschênes
 */ 


#ifndef TONE_H_
#define TONE_H_
#include <stdlib.h>
#include <stdbool.h>
#include "Hardware/HardwareProfile.h"


#define tone1_on()  TONE1_TMRCON |=TMRON
                 

#define tone1_off() TONE1_TMRCON &=~TMRON;\
                    TONE1_IE=0

#define tone2_on()  TONE2_TMRCON |= TMRON

#define tone2_off() TONE2_TMRCON &=~TMRON


#define wait_tone_end(n)  while (tone_timer[n])

extern volatile unsigned tone_timer[2];


/*
 * tone(uint16_t freq, unsigned length)
 *  play a single tone (square wave)
 *  freq: frequency Hertz
 *  length: duration millisecond
 *  channel: 1 or 2
 */
void tone(uint16_t freq, unsigned length, unsigned channel);

/*
 * key_tone(uint8_t key, unsigned length,bool wait_end)
 *  play a single tone from tempered scale
 *  key: 0-15 from  C4 to D5#
 *  length: duration in milliseconds
 *  channel:  1 or 2
 *  wait_end: if true, pause until end of note.
 */
void key_tone(uint8_t key, unsigned length,unsigned channel, bool wait_end);

// generate white noise
// length: duration in 16*length milliseconds.
// wait_end: pause while waiting end.
void noise(unsigned length, bool wait_end);

#endif /* TONE_H_ */