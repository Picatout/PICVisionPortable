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
 * Projet: PICVisionPortable
 * File:   main.c
 * Author: Jacques Deschênes
 * Description: Console de jeux CHIPCON utilisant un LCD avec affichage graphique de 128x64 monochrome.
 *      afficage: DFrobot.com: #produit: FIT0021
 * Liens utiles:
 *      http://www.dfrobot.com/wiki/index.php?title=128x64_Graphic_LCD_%28SKU:FIT0021%29
 *      https://www.dfrobot.com/index.php?route=product/product&product_id=240&search=FIT0021+&description=true
 *      http://mikenz.geek.nz/blog/1006/mindkits-128x64-graphic-lcd-and-arduino/
 *      http://www.embeddedrelated.com/groups/lpc2000/show/36610.php
 *      http://fr.scribd.com/doc/190131117/MH-Datasheet-LCD12864ZW#scribd
 *
 * Created on 20 janvier 2015, 22:56
 */

// PIC24FJ64GA002 Configuration Bit Settings
// 'C' source line config statements
#include <xc.h>
// CONFIG2
#pragma config POSCMOD = NONE           // Primary Oscillator Select (Primary oscillator disabled)
#pragma config I2C1SEL = PRI            // I2C1 Pin Location Select (Use default SCL1/SDA1 pins)
#pragma config IOL1WAY = ON             // IOLOCK Protection (Once IOLOCK is set, cannot be changed)
#pragma config OSCIOFNC = ON            // Primary Oscillator Output Function (OSC2/CLKO/RC15 functions as port I/O (RC15))
#pragma config FCKSM = CSDCMD           // Clock switching and Fail-Safe Clock Monitor are disabled
#pragma config FNOSC = FRCPLL           // Oscillator Select (Fast RC Oscillator with PLL module (FRCPLL))
#pragma config SOSCSEL = SOSC           // Sec Oscillator Select (Default Secondary Oscillator (SOSC))
#pragma config WUTSEL = LEG             // Wake-up timer Select (Legacy Wake-up Timer)
#pragma config IESO = OFF               // Internal External Switch Over Mode (IESO mode (Two-Speed Start-up) disabled)
// CONFIG1
#pragma config WDTPS = PS32768          // Watchdog Timer Postscaler (1:32,768)
#pragma config FWPSA = PR128            // WDT Prescaler (Prescaler ratio of 1:128)
#pragma config WINDIS = OFF             // Watchdog Timer Window (Windowed Watchdog Timer enabled; FWDTEN must be 1)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (Watchdog Timer is disabled)
#pragma config ICS = PGx1               // Comm Channel Select (Emulator EMUC1/EMUD1 pins are shared with PGC1/PGD1)
#pragma config GWRP = OFF               // General Code Segment Write Protect (Writes to program memory are allowed)
#pragma config GCP = OFF                // General Code Segment Code Protect (Code protection is disabled)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG port is disabled)
// end config

#include <string.h>
#include <stdlib.h>

#include "Hardware/HardwareProfile.h"
#include "Hardware/LCDout.h"
#include "display.h"
#include "text.h"
#include "tone.h"
#include "chip8.h"
#include "keypad.h"
#include "games/game_info.h"
#if SDC_SUPPORT
#include "filesys.h"
#endif

//****** jeux intégrés ***********
#include "games/BLINKY/blinky.h"
#include "games/SOKOBAN/sokoban.h"
#include "c8test.h"
#include "games/LEM/lem.h"

#define GAMES_COUNT (4)

// jeux en mémoire flash
const game_info_t flash_games[GAMES_COUNT]={
    {"c8test",C8TEST_SIZE,c8test,NULL},
    {"sokoban",SOKOBAN_SIZE,sokoban,(const char*)sokoban_info},
    {"blinky",BLINKY_SIZE,blinky,(const char*)blinky_info},
    {"LEM",LEM_SIZE,lem,lem_info}
};

//********************************

#define MAX_ENTRIES (PROG_SPACE/ENTRY_SIZE)
#define DISPLAY_LINES (8)

uint8_t display_page(int16_t page){
    char fname[ENTRY_SIZE];
    uint8_t i;

    for (i=0;i<DISPLAY_LINES;i++){
        memcpy(fname,&chip_prog[page*DISPLAY_LINES*ENTRY_SIZE+(i*ENTRY_SIZE)],ENTRY_SIZE);
        if (strlen((char *)fname)){
            put_char(' ');
            print(fname);
            if (i<7) new_line();
        }else{
            break;
        }
    }
    return i;
}

inline void display_cursor(uint8_t line){
    put_sprite(0,line*CHAR_HEIGHT,8,&font_6x8[(RIGHT_ARROW-32)*CHAR_HEIGHT]);
}

// sélectionne un fichier
// à partir de la liste
// affichée à l'écran
int16_t select_file(int16_t fcount){
    int16_t page, selected;
    uint8_t key, pg_lines;
    uint16_t frame_delay;

    print("'S' selection\n");
    print("'L' page precedante\n");
    print("'R' page suivante\n");
    print("'U' vers le haut\n");
    print("'D' vers le bas\n");
    prompt_key();
    cls();
    page=0;
    selected=0;
    frame_delay=frame_counter+2;
    while (frame_delay>frame_counter);
    pg_lines=display_page(page);
    while (1){
        display_cursor(selected);
        key=wait_key();
        key_tone(key,6,1,false);
        display_cursor(selected);
        switch(key){
        case SELECT:
            return page*DISPLAY_LINES+selected;
            break;
        case LEFT: // LEFT arrow
            if (page){
                page--;
                selected=7;
                cls();
                pg_lines=display_page(page);
            }else{
                selected=0;
            }
            break;
        case RIGHT: // RIGHT arrow
            if ((page*DISPLAY_LINES+DISPLAY_LINES)<fcount){
                page++;
                selected=0;
                cls();
                pg_lines=display_page(page);
            }else{
                selected=pg_lines-1;
            }
            break;
        case UP: // UP  arrow
            if (selected){
                selected--;
            }else if (page){
                page--;
                selected=7;
                cls();
                pg_lines=display_page(page);
            }
            break;
        case DOWN: // DOWN arrow
            if (selected<(pg_lines-1)){
                selected++;
            }else if ((page*DISPLAY_LINES+DISPLAY_LINES)<fcount){
                page++;
                selected=0;
                cls();
                pg_lines=display_page(page);
            }
            break;
        default:
            break;
        }//switch
        while (keypad_read()!=NO_KEY)key_tone(key,2,1,false);
    }//while
}

#if SDC_SUPPORT
// copie la liste des fichiers
// du répertoire racine
// dans le tableau CHIP_PROG
int16_t sdc_files(){
		uint8_t fname[ENTRY_SIZE];
		int16_t entry_nbr;
        struct fat_dir_entry_struct dir_entry;

        /* charge les fichiers dans la SRAM */
		entry_nbr=0;
		fname[ENTRY_SIZE-1]=0;
        while((entry_nbr<MAX_ENTRIES) && fs_read_dir(&dir_entry))
        {
            if (!(dir_entry.attributes & FAT_ATTRIB_DIR)){
                if (strstr(dir_entry.long_name,".pvp")||strstr(dir_entry.long_name,".PVP")){
                    strcpy((char*)fname,dir_entry.long_name);
                    memmove(&chip_prog[entry_nbr*ENTRY_SIZE],fname,ENTRY_SIZE);
                    entry_nbr++;
                }
            }
        }
        fname[0]=0;
        chip_prog[entry_nbr*ENTRY_SIZE]=0;
        return entry_nbr;
}

void games_on_sdcard(){
    int16_t fcount, selected;

    if (!fs_mount()){
        print("fs_mount() failed");
        return;
    }
    if (!fs_open_dir("/")){
        print("fs_open_dir() failed");
        return;
    }
    fcount=sdc_files();
    if (fcount && ((selected=select_file(fcount))>-1)){
        if (fs_load_file(selected)){
            cls();
            if (schip(F_RESET)==CHIP_BAD_OPCODE){
                print_vms("CRASH! bad opcode\n");
            }
        }
    }
    fs_close_dir();
    fs_umount();
    cls();
}
#endif


// sélection et exécution
// d'un jeux qui est en
// mémoire flash
void games_in_flash(){
	uint16_t i,selected;

        for (i=0;i<GAMES_COUNT;i++){
            strcpy((char*)chip_prog+i*ENTRY_SIZE,flash_games[i].name);
        }
	cls();
	selected=select_file(GAMES_COUNT);
        if (flash_games[selected].description){
            text_scroller(flash_games[selected].description,2);
        }
        memcpy(chip_prog,flash_games[selected].binary,flash_games[selected].size);
        cls();
#if FW_DEBUG
	schip(F_DEBUG|F_RESET);
#else
	if (schip(F_RESET)==CHIP_BAD_OPCODE){
		print("CRASH! bad opcode\n");
	};
#endif
}

const char credits[]=
	"FAT driver\n"
	"Copyright 2006-2012\n"
	"Roland Riegel\n";

#include "splash.h"

void splash_screen(){
	uint16_t frame_delay;

        screen_restore((uint8_t*)splash);
	frame_delay=frame_counter+25;
	while (frame_delay>frame_counter){
            if (any_key()){
                 tone(1000,2,1);
                 frame_delay=frame_counter;
            }
	}
	wait_key_release();
        text_scroller(credits,2);
        cls();
}

int main() {
    uint32_t size;

    HardwareInit();
    LCDout_init();
    splash_screen();
    tone(523,500,1);
    tone(587,500,2);
    pause(499);
    srand(TMR1);
    while(1){
        select_font(FONT_ASCII);
        set_cursor(0,0);
        memset(chip_prog,0,PROG_SPACE);
        if (sdcard_available){
            games_on_sdcard();
        }else{
            games_in_flash();
        }
    }
    return (EXIT_SUCCESS);
}

