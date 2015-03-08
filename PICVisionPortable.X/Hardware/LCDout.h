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
 * File:   LCDout.h
 * Author: Jacques
 *
 * Created on 30 janvier 2015, 11:49
 */

#ifndef LCDOUT_H
#define	LCDOUT_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "HardwareProfile.h"

// LCD basic commands set
#define BCMD_CLEAR (1)  // text mode: clear display, set cursor top left corner
#define BCMD_HOME  (2)  // text mode: home text cursor
#define BCMD_ENTRY_MODE (4) // text mode: set Entry mode
#define BCMD_DISP_CTRL (8) // display control, text mode: arguments bits: DCB
#define BCMD_CURSOR  (0x10) // control cursor behavior
#define BCMD_FUNC_SET (0x20)  // select commands set, bus width and display mode
#define BCMD_CGRAM (0x40)  // set CGRAM address
#define BCMD_DDRAM (0x80)  // seet DDRAM address
#define BCMD_QUERY_BF (0) // query busy flag, lines: RS=0 and RW=1
#define BCMD_WRITE (0) // write RAM, lines: RS=1 and RW=0
#define BCMD_READ (0)  // read RAM, lines: RS=1 and RW=1
// LCD extended commands set
#define XCMD_STDBY (1)  // set LCD in stanby mode (display off)
#define XCMD_SCROLL (2) // enable vertical scroll position
#define XCMD_REVERSE (4) // reverse C
#define XCMD_FUNC_SET (0x20) // define operating mode
#define XCMD_VERT_SCROOL (0x40) // vertical scroll
#define XCMD_GAC  (0x80) // set graphic address counter

// bits for BCMD_DISP_CTRL command
#define DISPLAY_ON (4)   // bit D=1 display ON
#define CURSOR_ON (2)    // bit C=1 cursor ON
#define CURSOR_BLINK (1) // bit B=1 blinking cursor

    // bits for (B/X)CMD_FUNC_SET
#define RE_BIT (4) // extended command set 0=base, 1=extended
#define G_BIT (2)  // graphic mode,  0=text, 1=graphic
#define DL_BIT (0x10) // data length , 0=4 bits , 1=8 bits

// display size in pixels
#define VRES (64)
#define HRES (128)
#define HBYTES (HRES/8)
#define LCD_BUFF_SIZE (HBYTES*VRES)
    
typedef enum GLCD_MODE {LCD_TEXT,LCD_GRAPHIC} glcd_mode_t;

extern uint8_t display_buffer[VRES][HBYTES];
extern volatile uint16_t frame_counter;

 //pause display update
#define LCD_pause() LCD_IE=0
//resume display update
#define LCD_resume() LCD_IE=1

void LCDout_init();
void LCD_reset();

#ifdef	__cplusplus
}
#endif

#endif	/* LCDOUT_H */

