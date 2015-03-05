/*
 * filesys.c
 *
 * Created: 2014-10-11 21:08:50
 *  Author: Jacques Deschênes
 *  une seule partition ouverte
 *  un seul système de fichier ouvert
 *  un seul répertoire ouvert.
 *  un seul fichier ouvert.
 */ 

#include <string.h>

#include "filesys.h"
#include "keypad.h"
#include "text.h"
#include "sram.h"
#include "Hardware/LCDout.h"
#include "display.h"
#include "chip8.h"



static struct fat_fs_struct *fs;
static struct fat_dir_struct *dd;
static struct fat_file_struct *fd;
static struct partition_struct *partition;


void bad_sdcard(const char *msg){
    cls();
    select_font(FONT_ASCII);
    print(msg);
    prompt_key();
}


uint8_t fs_mount(){
    if (get_pin_available()){
        // pas de carte SD
        // dans le lecteur
        return 0;
    }
    /* ouvre la première partition */
    partition = partition_open(sd_raw_read, sd_raw_read_interval, 0, 0, 0);
    if(!partition)
    {
        /* Si la partition n'a pas ouvert essaie
         * pour  "superfloppy", i.e. pas de MBR.
         */
        partition = partition_open(sd_raw_read, sd_raw_read_interval, 0, 0, -1);
        if(!partition)
        {   // rien à faire avec cette carte
            bad_sdcard("Echec acces partition\n");
            return 0;
        }
    }

    /* ouvre le système de fichiers */
    fs = fat_open(partition);
    if(!fs)
    {
        bad_sdcard("Echec acces fichiers\n");
        partition_close(partition);
        return 0;
    }

    return 1;
}

void fs_umount(){
    fat_close_file(fd);
    fat_close_dir(dd);
    fat_close(fs);
    partition_close(partition);
}


uint8_t  fs_open_dir(const char *dir_name){
    /* ouvre le répertoire dir_name */
    struct fat_dir_entry_struct directory;
    fat_get_dir_entry_of_path(fs, dir_name, &directory);
    dd = fat_open_dir(fs, &directory);
    if(!dd)
    {
        bad_sdcard("Echec acces repert.\n");
        fs_umount();
        return 0;
    }
    return 1;
}

void fs_close_dir(){
    fat_close_dir(dd);
}

uint8_t fs_open_file(const char *file_name){
    uint8_t found=0;
    struct fat_dir_entry_struct dir_entry;
    while(fat_read_dir(dd, &dir_entry))
    {
        if(strcmp(dir_entry.long_name, file_name) == 0)
        {
            fat_reset_dir(dd);
            found= 1;
            break;
        }
    }

    if (!found) return 0;
    fd=fat_open_file(fs, &dir_entry);
    if(!fd){
        bad_sdcard("Echec ouvert. fich.\n");
        return 0;
    }
    //print(fd->dir_entry.long_name);
    return 1;
}


void fs_close_file(){
    fat_close_file(fd);
}

void fs_file_reset(){
    fat_seek_file(fd,0,FAT_SEEK_SET);
}//f()

intptr_t fs_read_file(uint8_t* buffer, uintptr_t buffer_len){
    return fat_read_file(fd,buffer,buffer_len);
}//f()

#define BUFF_SIZE (256)
// charge le fichier CHIP-8 dans la SRAM
// retourne nombres d'octets
uint8_t fs_load_file(uint16_t file_no){
    uint16_t byte_count=0;
    uint16_t count;
    uint8_t buffer[256];
    memmove(&buffer, &chip_prog[ENTRY_SIZE*file_no],ENTRY_SIZE);
    if (fs_open_file((char*)buffer)){
        //print(fd->dir_entry.long_name);new_line();
        while((byte_count<PROG_SPACE) && (count = fat_read_file(fd, buffer, 256))){
            memmove(&chip_prog[byte_count],buffer,count);
            byte_count+=count;
        }
        fs_close_file();
    }
    return byte_count;
}

inline uint8_t fs_read_dir(struct fat_dir_entry_struct *dir_entry){
    return fat_read_dir(dd, dir_entry);
}

