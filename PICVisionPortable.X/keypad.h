/*
* Copyright 2015, Jacques Deschênes
* This file is part of PICVisionPortable.
*
*     PICVisionPortable is free software: you can redistribute it and/or modify
*     it under the terms of the GNU General Public License as published by
*     the Free Software Foundation, either version 3 of the License, or
*     (at your option) any later version.
*
*     PICVisionPortable is distributed in the hope that it will be useful,
*     but WITHOUT ANY WARRANTY; without even the implied warranty of
*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*     GNU General Public License for more details.
*
*     You should have received a copy of the GNU General Public License
*     along with PICVisionPortable.  If not, see <http://www.gnu.org/licenses/>.
*/


/*
 * keypad.h
 *
 * Created: 2014-10-03 12:29:38
 *  Author: Jacques Deschênes
 */ 


#ifndef KEYPAD_H_
#define KEYPAD_H_

#include "Hardware/HardwareProfile.h"

#define UP          (0)
#define DOWN        (1)
#define LEFT        (2)
#define RIGHT       (3)
#define SELECT      (4)
#define UP_RIGHT    (5)
#define RIGHT_DOWN  (6)
#define DOWN_LEFT   (7)
#define LEFT_UP     (8)
#define S_UP        (9)
#define S_DOWN      (10)
#define S_LEFT      (11)
#define S_RIGHT     (12)
#define UP_DOWN     (13)
#define LEFT_RIGHT  (14)
#define LR_UP       (15)
#define BREAK       UP_DOWN
#define INVALID     (255)
#define NO_KEY      (255)
#define KP_BREAK    (KP_BTN_UP|KP_BTN_DN)

#define keypad_latch()  ((~KP_PORT)&KP_MASK)
#define any_key()  ((KP_PORT&KP_MASK)!=KP_MASK)
#define wait_key_release()  while (any_key())


uint8_t keypad_read();
uint8_t wait_key();
void prompt_key();
bool keypad_break();
bool key_down(uint8_t key);
#endif /* KEYPAD_H_ */
