/*
 * filesys.h
 *
 * Created: 2014-10-11 21:09:04
 *  Author: Jacques
 */ 


#ifndef FILESYS_H_
#define FILESYS_H_

#include "Hardware/HardwareProfile.h"

// sdcard and FAT library
#include "FAT/fat.h"
#include "FAT/partition.h"
#include "FAT/sd_raw.h"




uint8_t fs_mount();
void fs_umount();

uint8_t  fs_open_dir(const char *dir_name);
void fs_close_dir();

uint8_t fs_open_file(const char *file_name);
intptr_t fs_read_file(uint8_t* buffer, uintptr_t buffer_len);
void fs_file_reset();
void fs_close_file();
uint8_t fs_load_file(uint16_t file_no);
uint8_t fs_read_dir(struct fat_dir_entry_struct *dir_entry);


#endif /* FILESYS_H_ */