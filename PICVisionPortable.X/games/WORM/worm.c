#include "worm.h"

const char worm_info[]=
"SuperWorm V3\n"
"By RB, 1992\n"
"use: LEFT/RIGHT";

const uint8_t worm[WORM_SIZE]={
	0x10,0x1a,0x57,0x6f,0x72,0x6d,0x00,0x52,0x42,0x39,0x32,0x00,0x00,0x00,0x3e,0x05,
	0x00,0x2b,0x7c,0x00,0x00,0x06,0x1e,0x01,0x00,0x04,0x00,0xff,0x00,0xe0,0xa0,0x0b,
	0xfe,0x65,0xa1,0x92,0xf0,0x55,0xfc,0x1e,0x71,0x01,0x31,0x00,0x10,0x24,0xa1,0x68,
	0xda,0xb3,0xd4,0x21,0xd4,0x31,0x74,0x03,0x34,0x7a,0x10,0x32,0xa1,0x77,0x63,0x04,
	0xd3,0x29,0xd4,0x29,0x72,0x09,0x32,0x3f,0x10,0x40,0xa0,0x06,0xf0,0x65,0xa0,0x02,
	0xf0,0x33,0x63,0x2e,0x20,0xe4,0xa0,0x02,0xf5,0x33,0x20,0xe2,0x21,0x4a,0xa1,0x76,
	0xd7,0x61,0x76,0xfe,0x36,0x11,0x10,0x5e,0x63,0x0a,0xf3,0x15,0xa1,0x92,0xf8,0x1e,
	0xf0,0x65,0x84,0x00,0x80,0xa0,0xf0,0x55,0xa2,0x92,0xf8,0x1e,0xf0,0x65,0x81,0x00,
	0x80,0xb0,0xf0,0x55,0xa1,0x6a,0x34,0x00,0xd4,0x13,0xa1,0x60,0xf9,0x1e,0xf1,0x65,
	0xa1,0x6d,0xda,0xb2,0x8a,0x04,0x8b,0x14,0xa1,0x68,0xda,0xb3,0x3f,0x00,0x10,0xfc,
	0xc0,0x0f,0x40,0x00,0x21,0x46,0x78,0x01,0x98,0xe0,0x68,0x00,0x61,0x02,0xe1,0x9e,
	0x66,0x00,0xe1,0x9e,0x10,0xc0,0x36,0x00,0x10,0xc0,0x79,0x02,0x66,0x06,0x89,0x62,
	0x61,0x03,0xe1,0x9e,0x67,0x00,0xe1,0x9e,0x10,0xd4,0x37,0x00,0x10,0xd4,0x79,0xfe,
	0x67,0x06,0x89,0x72,0xf3,0x07,0x33,0x00,0x10,0xac,0x10,0x68,0x20,0xe2,0xa0,0x02,
	0xf5,0x33,0x63,0x00,0x64,0x7c,0xa0,0x02,0xf2,0x65,0xf0,0x29,0xd4,0x35,0x73,0x06,
	0xf1,0x29,0xd4,0x35,0x73,0x06,0xf2,0x29,0xd4,0x35,0x00,0xee,0x21,0x5a,0xa1,0x68,
	0xda,0xb3,0xda,0xb3,0x3f,0x00,0x11,0x12,0x64,0x02,0xf4,0x18,0x75,0x01,0x20,0xdc,
	0x10,0xa6,0x64,0x0a,0xf4,0x18,0xda,0xb3,0x8a,0x05,0x8b,0x15,0xa1,0x6d,0xda,0xb2,
	0xa0,0x06,0xf0,0x65,0x80,0x55,0x80,0x50,0x4f,0x00,0xf0,0x55,0x60,0x64,0xf0,0x15,
	0xf0,0x07,0x30,0x00,0x11,0x30,0x00,0xc8,0x81,0x00,0xa1,0x80,0x90,0x12,0xf0,0x0a,
	0x30,0x04,0x11,0x3e,0x10,0x1a,0x7e,0x01,0x00,0xee,0xa1,0x6f,0xcc,0x7c,0x7c,0x02,
	0xcd,0x3c,0x7d,0x02,0xdc,0xd7,0x4f,0x00,0x00,0xee,0xa1,0x6f,0xdc,0xd7,0x11,0x4c,
	0x04,0x00,0x00,0xfc,0xfc,0x00,0x00,0x04,0xe0,0xe0,0xe0,0xa0,0xe0,0x00,0x40,0x38,
	0x7c,0xde,0xfe,0xfe,0x7c,0x38,0xf0,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,
	0x73,0x65,0x6c,0x65,0x63,0x74,0x20,0x72,0x65,0x73,0x74,0x61,0x72,0x74,0x2e,0x2e,
	0x2e,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,
};
