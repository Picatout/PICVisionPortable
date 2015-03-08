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



#include "LCDout.h"


uint8_t display_buffer[VRES][HBYTES];

#define LCD_DELAY  (40)
#define FN_DELAY  (100) 

#define pulse_e() LCD_LAT |=LCD_E;\
                  __delay_us(2);\
                  LCD_LAT&=~LCD_E;\
                  __delay_us(2)

unsigned char display_buffer[64][16];

static void LCD_send_cmd(uint8_t b){
    LCD_LAT &= ~LCD_PINS;
    LCD_LAT |= (b&0xf0)<<5;
    pulse_e();
    LCD_LAT &=~LCD_DATA_PINS;
    LCD_LAT |= (b&0xf)<<9;
    pulse_e();
}//f()

static void LCD_send_data(uint8_t b){
    LCD_LAT &= ~LCD_PINS;
    LCD_LAT |= LCD_RS;
    LCD_LAT |= (b&0xf0)<<5;
    pulse_e();
    LCD_LAT &=~LCD_DATA_PINS;
    LCD_LAT |= (b&0xf)<<9;
    pulse_e();
}

static void LCD_set_mode(glcd_mode_t mode){
    if (mode==LCD_TEXT){ // text mode 4 bits bus, base commands set
        LCD_send_cmd(BCMD_FUNC_SET);
    }else{//graphic mode, 4 bits data, Graphic mode, extended commands set
        LCD_send_cmd(BCMD_FUNC_SET|G_BIT|RE_BIT);
    }
      __delay_us(LCD_DELAY);
}//f()

void LCD_reset(){
    LCD_LAT  &= ~LCD_RST;
    __delay_ms(5);
    LCD_LAT |= LCD_RST;
    __delay_ms(100);
}//f()

// see power sequence in datasheet V4.0 (2008/08/18) page 35
void LCDout_init(){
    //power up delay wait +5volt to set
    LCD_reset();
    // set bus width to 4 bits, send 2 times
    LCD_send_cmd(BCMD_FUNC_SET);
    __delay_us(FN_DELAY);
    LCD_send_cmd(BCMD_FUNC_SET);
    __delay_us(FN_DELAY);
// graphic mode, extended command
    LCD_set_mode(LCD_GRAPHIC);
    __delay_us(FN_DELAY);
    // display refresh timer setup
    LCD_PR=(FCY/MHZ)*LCD_DELAY-1;
    LCD_CON=0xA000;
    LCD_IF=0;
    LCD_IE=1;
}

volatile uint16_t frame_counter;
volatile static  uint8_t x=0,y=0;
volatile static  uint8_t state=0;

void __attribute__((interrupt,no_auto_psv)) _T4Interrupt(void){
    switch (state){
    case 0:
        LCD_send_cmd(XCMD_GAC|y);
        state++;
        break;
    case 1:
        LCD_send_cmd(XCMD_GAC);
        state++;
        break;
    default :
        if (x<16){
            LCD_send_data(display_buffer[y][x]);
        }else{
            LCD_send_data(display_buffer[y+32][x-16]);
        }
        x++;
        x &= 31;
        if (x==0){
            state=0;
            y++;
            y &=31;
            if (y==0) frame_counter++;
        }
        break;
    }
    LCD_IF=0;
}//f()

