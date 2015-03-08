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
 * tones.c
 *
 * Created: 2014-09-26 10:17:59
 *  Author: Jacques Deschênes
 */ 


#include "tone.h"



volatile unsigned tone_timer[2];

// fréquence en hertz
// durée en  millisecondes
void tone(uint16_t freq, unsigned length, unsigned channel){
    if (channel==1){
        TONE1_OCCON &=~7; // OC off
        TONE1_PER = ((FCY/freq)>>1)-1;
        TONE1_DC = ((FCY/freq)>>2);
        TONE1_IDC = ((FCY/freq)>>2);
        TONE1_OCCON |= 3; // toggle output on compare
        tone1_on();
    }else{
        TONE2_OCCON &=~7; // OC off
        TONE2_PER = ((FCY/freq)>>1)-1;
        TONE2_DC = ((FCY/freq)>>2);
        TONE2_IDC = ((FCY/freq)>>2);
        TONE2_OCCON |= 3; // toggle output on compare
        tone2_on();
    }
    tone_timer[channel] = length;
}

const uint16_t SCALE[16]={523,554,587,622,659,698,740,784,831,880,932,988,1047,1109,1175,1245};
	
inline void key_tone(uint8_t key, unsigned length,unsigned channel, bool wait_end){
	tone(SCALE[key&15],length,channel);
	if (wait_end) wait_tone_end(channel);
}


void noise(unsigned length,bool wait_end){
    tone(rand()|1024,length,1);
    TONE1_IF=0;
    TONE1_IE=1;
    if (wait_end) wait_tone_end(1);
}//f()

void __attribute__((interrupt,no_auto_psv)) _T2Interrupt(void){
    TONE1_PER=rand()|1024;
    TONE1_DC=TONE1_PER>>1;
    TONE1_IF=0;
}//f()

