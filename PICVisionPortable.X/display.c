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
 * tvout.c
 *
 * Created: 2014-09-25 12:35:29
 *  Author: Jacques Deschênes
 */ 

#include <stdlib.h>
#include <string.h>

#include "Hardware/HardwareProfile.h"
#include "Hardware/LCDout.h"
#include "display.h"
#include "text.h"
#include "tone.h"

// dessine un point à l'écran
void plot(int8_t x, int8_t y, optype op){
    int8_t xbyte,xbit;

    if ((x<0)||(x>=HRES)||(y<0)||(y>=VRES)) return;
    xbyte= x/8;
    xbit = 7-x%8;
    switch (op){
        case WHITE:
        display_buffer[y][xbyte] |= (1<<xbit);
        break;
        case BLACK:
        display_buffer[y][xbyte] &= ~(1<<xbit);
        break;
        case INVERT:
        display_buffer[y][xbyte] ^= (1<<xbit);
        break;
    }
}


// dessine un sprite 8 pixels par n pixels
// s'il y a collision retourne une valeur 1
// autrement 0.
int8_t put_sprite(int8_t x, int8_t y, uint8_t n, const uint8_t *sprite){
    int8_t xbyte, shl, shr, row, collision;
    uint8_t sprite_row;


    // contrôle des limites
    if ((x<-7)||(x>=HRES)||(y<=-n)||y>=VRES){return 0;}
    collision=0;
    if (x<0){
        shl=-x;
        for (row=0;row<n;row++){
            if (y>=VRES) break;
            if (y<0){y++;continue;}
            sprite_row=sprite[row];
            collision |= display_buffer[y][0] & (sprite_row<<shl);
            display_buffer[y][0] ^= sprite_row<<shl;
            y++;
        }//for
    }else{
        shr= x&7;
        shl=(8-shr)&7;
        xbyte=x>>3;
        for (row=0;row<n;row++){
            if (y>=VRES) break;
            if (y<0){y++;continue;}
            sprite_row=sprite[row];
            collision |= display_buffer[y][xbyte] & (sprite_row>>shr);
            display_buffer[y][xbyte] ^= sprite_row>>shr;
            if (shl && (xbyte+1<HBYTES)){
                collision |= display_buffer[y][xbyte+1] & (sprite_row<<shl);
                display_buffer[y][xbyte+1] ^= sprite_row<<shl;
            }
            y++;
        }
    }
    if (collision) collision=1;
    return collision;
}

//dessine un sprite 16x16pixels
// le sprite est en mémoire RAM
// s'il y a collision retourne 1,
// autrement 0.
int8_t put_big_sprite(int8_t x, int8_t y,const uint8_t *sprite){
    int8_t xbyte, shl, shr, row, collision;
    uint8_t sprite_row;

    // contrôle des limites
    if ((x<-15)||(x>=HRES)||(y<-15)||(y>=VRES)) return 0;
    collision=0;
    if (x<-7){ // x {-7..-15}
        shl=-x-8;
        for (row=0;row<32;row+=2){
            if ((y<0) || (y>= VRES)){y++; continue;}
            sprite_row=sprite[row+1];
            collision |= display_buffer[y][0] & (sprite_row<<shl);
            display_buffer[y][0] ^= sprite_row<<shl;
            y++;
        }
    }else if (x<0){ // x {-1..-7}
        shl=-x;
        shr=8-shl;
        for (row=0;row<32;row+=2){
            if ((y<0) || (y>= VRES)){y++; continue;}
            sprite_row=sprite[row];
            collision|=display_buffer[y][0] & (sprite_row<<shl);
            display_buffer[y][0] ^= sprite_row<<shl;
            sprite_row=sprite[row+1];
            collision|=display_buffer[y][0] & (sprite_row>>shr);
            display_buffer[y][0] ^= sprite_row>>shr;
            collision|=display_buffer[y][1] & (sprite_row<<shl);
            display_buffer[y][1] ^= sprite_row<<shl;
            y++;
        }
    }else{ // x {0..HRES-1}
        shr= x&7;
        shl=(8-shr)&7;
        xbyte=x>>3;
        for (row=0;row<32;row+=2){
            if ((y<0) || (y>=VRES)){y++; continue;}
            sprite_row=sprite[row];
            collision |= display_buffer[y][xbyte] & (sprite_row>>shr);
            display_buffer[y][xbyte] ^= sprite_row>>shr;
            if ((xbyte+1)<HBYTES){
                if (shl){
                        collision |= display_buffer[y][xbyte+1] & (sprite_row<<shl);
                        display_buffer[y][xbyte+1] ^= sprite_row<<shl;
                }
                sprite_row=sprite[row+1];
                collision |= display_buffer[y][xbyte+1] & (sprite_row>>shr);
                display_buffer[y][xbyte+1] ^= (sprite_row>>shr);
                if (shl && ((xbyte+2)<HBYTES)){
                        collision |= display_buffer[y][xbyte+2] & (sprite_row<<shl);
                        display_buffer[y][xbyte+2] ^=(sprite_row<<shl);
                }
            }
            y++;
        }
    }
    if (collision) collision=1;
    return collision;
}


void cls(){
    suspend_update();
    memset(display_buffer,0,VRES*HBYTES);
    set_cursor(0,0);
    restart_update();
}


// lines {1..31}
void scroll_down(uint8_t lines){
    if (!lines) return;
    lines &=0x1f;
    memmove(&display_buffer[lines][0],&display_buffer,HBYTES*VRES-HBYTES*lines);
    memset(&display_buffer,0,HBYTES*lines);
}


// lines {1..31}
void scroll_up(uint8_t lines){
    if (!lines) return;
    lines &=0x1f;
    memmove(&display_buffer,&display_buffer[lines],HBYTES*VRES-HBYTES*lines);
    memset(&display_buffer[VRES-lines],0,HBYTES*lines);
}

// pixels {1..8}
void scroll_right(uint8_t pixels){
    uint8_t line, column;
    uint8_t *line_buffer;

    if (pixels==8){
        for (line=0;line<VRES;line++){
            line_buffer=(uint8_t*)&display_buffer+HBYTES*line;
            memmove(line_buffer+1,line_buffer,HBYTES-1);
            *line_buffer=0;
        }
    }else{
        pixels &=0x7;
        for (line=1;line<=VRES;line++){
            line_buffer=(uint8_t*)&display_buffer+HBYTES*line-1;
            for (column=HBYTES-1;column;column--){
                    *line_buffer=(*line_buffer>>pixels)|(*(line_buffer-1))<<(8-pixels);
                    --line_buffer;
            }
            *line_buffer>>=pixels;
        }
    }
}

// optimisé pour la VM chip8()
// décale de 4 pixels
void chip_scroll_right(){
    uint8_t line, column;
    uint8_t *line_buffer;

    for (line=0;line<VRES;line++){
        line_buffer=(uint8_t*)&display_buffer[line][HBYTES-1];
        for (column=HBYTES-1;column;column--){
            *line_buffer=(*line_buffer>>4)|((*(line_buffer-1))<<4);
            --line_buffer;
        }
        *line_buffer>>=4;
    }
}

//pixels {1..8}
void scroll_left(uint8_t pixels){
    uint8_t line, column;
    uint8_t  *line_buffer;

    if (pixels==8){
        for (line=0;line<VRES;line++){
            line_buffer=(uint8_t*)&display_buffer+HBYTES*line;
            memmove(line_buffer,line_buffer+1,HBYTES-1);
            *(line_buffer+HBYTES-1)=0;
        }
    }else{
        pixels &=0x7;
        for (line=0;line<VRES;line++){
            line_buffer=(uint8_t*)&display_buffer+HBYTES*line;
            for (column=0;column<(HBYTES-1);column++){
                *line_buffer=(*line_buffer<<pixels)|(*(line_buffer+1)>>(8-pixels));
                ++line_buffer;
            }
            *line_buffer<<=pixels;
        }
    }
}

// optimisé pour la VM chip8()
// décale de 4 pixels
void chip_scroll_left(){
    uint8_t line, column;
    uint8_t  *line_buffer;
    for (line=0;line<VRES;line++){
        line_buffer=(uint8_t*)&display_buffer[line];
        for (column=0;column<(HBYTES-1);column++){
            *line_buffer=(*line_buffer<<4)|((*(line_buffer+1))>>4);
            ++line_buffer;
        }
        *line_buffer<<=4;
    }
}//f()


void screen_save(uint8_t* buffer){
    suspend_update();
    memmove(buffer,display_buffer,LCD_BUFF_SIZE);
    restart_update();
}//f()

void screen_restore(uint8_t* buffer){
    suspend_update();
    memmove(display_buffer,buffer,LCD_BUFF_SIZE);
    restart_update();
}//f()
