/* 
 * File:   GLCDdriver.h
 * Author: Jacques
 *
 * Created on 22 janvier 2015, 12:32
 */

#ifndef GLCDDRIVER_H
#define	GLCDDRIVER_H

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

    // display working buffer
    extern unsigned char display_buffer[VRES][HBYTES];
    // display modes
    typedef enum GLCD_MODE {LCD_TEXT,LCD_GRAPHIC} glcd_mode_t;

    // GLCD API
    void GLCD_init();  // initialize display in graphic mode, bus 4 bits
    void GLCD_send_cmd(unsigned b); // write to command register
    void GLCD_send_data(unsigned b); // write to data RAM
    void GLCD_set_mode(glcd_mode_t mode); // set text mode or graphic mode
    void GLCD_enable(bool enable, unsigned cursor); // text mode: enable/disable display
    void GLCD_update(); // update entire graphic display

#ifdef	__cplusplus
}
#endif

#endif	/* GLCDDRIVER_H */

