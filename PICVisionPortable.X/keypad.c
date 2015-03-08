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
 * keypad.c
 *
 * Created: 2014-10-03 12:29:17
 *  Author: Jacques Deschênes
 */ 

#include "keypad.h"
#include "display.h"
#include "text.h"
#include "tone.h"


// quels boutons sont enfoncés
// certaines combinaisons sont signalées comme invalides
// sur les 32 possibles 16 sont valides
const uint8_t BUTTONS_DOWN[32]={ // S-R-L-D-U
  NO_KEY,       // 0-0-0-0-0
  UP,           // 0-0-0-0-U
  DOWN,         // 0-0-0-D-0
  UP_DOWN,      // 0-0-0-D-U
  LEFT,         // 0-0-L-0-0
  LEFT_UP,      // 0-0-L-0-U
  DOWN_LEFT,    // 0-0-L-D-0
  INVALID,      // 0-0-L-D-U
  RIGHT,        // 0-R-0-0-0
  UP_RIGHT,     // 0-R-0-0-U
  RIGHT_DOWN,   // 0-R-0-D-0
  INVALID,      // 0-R-0-D-U
  LEFT_RIGHT,   // 0-R-L-0-0
  LR_UP,        // 0-R-L-0-U
  INVALID,      // 0-R-L-D-0
  INVALID,      // 0-R-L-D-U
  SELECT,       // S-0-0-0-0
  S_UP,         // S-0-0-0-U
  S_DOWN,       // S-0-0-D-0
  INVALID,      // S-0-0-D-U
  S_LEFT,       // S-0-L-0-0
  INVALID,      // S-0-L-0-U
  INVALID,      // S-0-L-D-0
  INVALID,      // S-0-L-D-U
  S_RIGHT,      // S-R-0-0-0
  INVALID,      // S-R-0-0-U
  INVALID,      // S-R-0-D-0
  INVALID,      // S-R-0-D-U
  INVALID,      // S-R-L-0-0
  INVALID,      // S-R-L-0-U
  INVALID,      // S-R-L-D-0
  INVALID       // S-R-L-D-U
};

#define BOUNCING_DLY (10)

uint8_t keypad_read(){
    uint8_t code,latch;
    uint32_t t0;
    t0=systick+BOUNCING_DLY;
    code=KP_MASK;
    while (t0>systick){
        latch=keypad_latch();
        if (latch!=code){
            t0=systick+BOUNCING_DLY;
            code=latch;
        }
    }
    code=BUTTONS_DOWN[code];
    return code;
}

uint8_t wait_key(){
    uint8_t key;
    while ((key=keypad_read())==NO_KEY);
    return key;
}

bool key_down(uint8_t key){
    key = key&15;
    return (BUTTONS_DOWN[keypad_latch()]==key);
}//f()

void prompt_key(){
    uint8_t key;

    select_font(FONT_ASCII);
    while (keypad_read()!=NO_KEY);
    print("une touche...");
    wait_key();
    while ((key=keypad_read())!=NO_KEY) key_tone(key,20,1,false);
}


// KEY_UP and KEY_DOWN pressed at same time
bool keypad_break(){
    return ((KP_PORT & KP_BREAK)==0);
}//f()



