
/*
 * Copyright (c) 2006-2012 by Roland Riegel <feedback@roland-riegel.de>
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#ifndef SD_RAW_CONFIG_H
#define SD_RAW_CONFIG_H

#include <stdint.h>

#include "../Hardware/HardwareProfile.h"

#ifdef __cplusplus
extern "C"
{
#endif

/**
 * \addtogroup sd_raw
 *
 * @{
 */
/**
 * \file
 * MMC/SD support configuration (license: GPLv2 or LGPLv2.1)
 */

/**
 * \ingroup sd_raw_config
 * Controls MMC/SD write support.
 *
 * Set to 1 to enable MMC/SD write support, set to 0 to disable it.
 */
 #if defined (_CHIPCON_)
	#define SD_RAW_WRITE_SUPPORT 0
#else
	#define SD_RAW_WRITE_SUPPORT 1
#endif

/**
 * \ingroup sd_raw_config
 * Controls MMC/SD write buffering.
 *
 * Set to 1 to buffer write accesses, set to 0 to disable it.
 *
 * \note This option has no effect when SD_RAW_WRITE_SUPPORT is 0.
 */
#define SD_RAW_WRITE_BUFFERING 1

/**
 * \ingroup sd_raw_config
 * Controls MMC/SD access buffering.
 * 
 * Set to 1 to save static RAM, but be aware that you will
 * lose performance.
 *
 * \note When SD_RAW_WRITE_SUPPORT is 1, SD_RAW_SAVE_RAM will
 *       be reset to 0.
 */
#define SD_RAW_SAVE_RAM 1

/**
 * \ingroup sd_raw_config
 * Controls support for SDHC cards.
 *
 * Set to 1 to support so-called SDHC memory cards, i.e. SD
 * cards with more than 2 gigabytes of memory.
 */
#define SD_RAW_SDHC 0

/**
 * @}
 */

/* defines for customisation of sd/mmc port access */
#if defined(__AVR_ATmega8__) || \
    defined(__AVR_ATmega48__) || \
    defined(__AVR_ATmega48P__) || \
    defined(__AVR_ATmega88__) || \
    defined(__AVR_ATmega88P__) || \
    defined(__AVR_ATmega168__) || \
    defined(__AVR_ATmega168P__) || \
    defined(__AVR_ATmega328P__)
    #define configure_pin_mosi() DDRB |= (1 << DDB3)
    #define configure_pin_sck() DDRB |= (1 << DDB5)
    #define configure_pin_miso() DDRB &= ~(1 << DDB4)
	#if defined (_CHIPCON_)
		#define configure_pin_ss() SDC_DDR |= SDC_SEL
		#define select_card() SDC_PORT &= ~SDC_SEL
		#define unselect_card() SDC_PORT |= SDC_SEL
	#else
		#define configure_pin_ss() DDRB |= (1 << DDB2)
		#define select_card() PORTB &= ~(1 << PORTB2)
		#define unselect_card() PORTB |= (1 << PORTB2)
	#endif	
#elif defined(__AVR_ATmega16__) || \
      defined(__AVR_ATmega32__)
    #define configure_pin_mosi() DDRB |= (1 << DDB5)
    #define configure_pin_sck() DDRB |= (1 << DDB7)
    #define configure_pin_miso() DDRB &= ~(1 << DDB6)
	#define configure_pin_ss() DDRB |= (1 << DDB4)
	#define select_card() PORTB &= ~(1 << PORTB4)
	#define unselect_card() PORTB |= (1 << PORTB4)
#elif defined(__AVR_ATmega64__) || \
      defined(__AVR_ATmega128__) || \
      defined(__AVR_ATmega169__)
    #define configure_pin_mosi() DDRB |= (1 << DDB2)
    #define configure_pin_sck() DDRB |= (1 << DDB1)
    #define configure_pin_ss() DDRB |= (1 << DDB0)
    #define configure_pin_miso() DDRB &= ~(1 << DDB3)

    #define select_card() PORTB &= ~(1 << PORTB0)
    #define unselect_card() PORTB |= (1 << PORTB0)
#elif defined (__PIC24FJ64GA002__)
    #define configure_pin_mosi() SDC_MOSI_PPSO=SDC_MOSI_FN
    #define configure_pin_sck()  SDC_SCK_PPSO=SDC_SCK_FN;SDC_SCK_PPSI=SDC_SCK_RP
    #define configure_pin_miso() SDC_MISO_PPSI= SDC_MISO_RP;SDC_TRIS|=(1<<SDC_MISO_RP)
    #define configure_pin_ss()   SDC_TRIS &= ~(1<<SDC_SS_RP)
    #define select_card()       SDC_LAT &=~(1<<SDC_SS_RP)
    #define unselect_card()     SDC_LAT |= (1<<SDC_SS_RP)
#else
    #error "no sd/mmc pin mapping available!"
#endif

/* chip-comp don't support write protect */
#if defined (_CHIPCON_)
    #define configure_pin_available() SDC_TRIS |= (1<<SDC_CD_RP)
    #define get_pin_available() (SDC_PORT & (1<<SDC_CD_RP))
#else
#define configure_pin_available() DDRC &= ~(1 << DDC4)
#define configure_pin_locked() DDRC &= ~(1 << DDC5)

#define get_pin_available() (PINC & (1 << PINC4))
#define get_pin_locked() (PINC & (1 << PINC5))
#endif

#if SD_RAW_SDHC
    typedef uint64_t offset_t;
#else
    typedef uint32_t offset_t;
#endif

/* configuration checks */
#if SD_RAW_WRITE_SUPPORT
#undef SD_RAW_SAVE_RAM
#define SD_RAW_SAVE_RAM 0
#else
#undef SD_RAW_WRITE_BUFFERING
#define SD_RAW_WRITE_BUFFERING 0
#endif

#ifdef __cplusplus
}
#endif

#endif

