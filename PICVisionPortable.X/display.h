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
 * tvout.h
 *
 * Created: 2014-09-25 12:34:43
 *  Author: Jacques Deschênes
 */ 


#ifndef TVOUT_H_
#define TVOUT_H_


#include "Hardware/LCDout.h"

#define VRES (64)
#define VLINES (VRES*2)


//where is the sprite
#define FLASH_MEM  (0)
#define RAM_MEM (1)

typedef enum OP_TYPE {WHITE,BLACK, INVERT} optype;

#define suspend_update() LCD_IE=0
#define restart_update() LCD_IE=1

void plot(int8_t x, int8_t y, optype op);
int8_t put_sprite(int8_t x, int8_t y, uint8_t n, const uint8_t *sprite);
int8_t put_big_sprite(int8_t x, int8_t y,const uint8_t *sprite);
void cls();
void scroll_down(uint8_t lines);
void scroll_up(uint8_t lines);
void scroll_right(uint8_t pixels);
void chip_scroll_right();
void scroll_left(uint8_t pixels);
void chip_scroll_left();
void screen_save(uint8_t*);
void screen_restore(uint8_t*);

#endif /* TVOUT_H_ */