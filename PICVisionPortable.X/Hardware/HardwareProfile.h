/* 
 * File:   HardwareProfile.h
 * Author: Jacques
 *
 * Created on 21 janvier 2015, 07:56
 */

#ifndef HARDWAREPROFILE_H
#define	HARDWAREPROFILE_H

#ifdef	__cplusplus
extern "C" {
#endif
#include <xc.h>
#include <stdint.h>
#include <stdbool.h>


#define FW_DEBUG 0
#define SDC_SUPPORT 1

#define MHZ 1000000UL
#define FOSC (32*MHZ)
#define FCY (FOSC/2) // core cycle frequency
#include <libpic30.h>

#define SYSTMR      TMR1
#define SYSCON      T1CON
#define SYSTICK_IE  IEC0bits.T1IE
#define SYSTICK_IF  IFS0bits.T1IF
#define SYSTICK_IPC IPC0bits.T1IP




// LCD peripheral port and pins
#define LCD_RST (1<<15)  // RB15 LCD_RST  (reset)
#define LCD_E (1<<14)  // RB14 LCD_E   (Enable)
#define LCD_RS  (1<<13)  // RB13 LCD_RS (Register Select)
#define LCD_DB7 (1<<12) // RB12 LCD_DB7
#define LCD_DB6 (1<<11) // RB11 LCD_DB6
#define LCD_DB5 (1<<10) // RB10 LCD_DB5
#define LCD_DB4 (1<<9)  // RB9 LCD_DB4
#define LCD_PINS (LCD_E|LCD_RS|LCD_DB7|LCD_DB6|LCD_DB5|LCD_DB4)
#define LCD_TRIS  TRISB // LCD on PORTB:13-15
#define LCD_LAT   LATB
#define LCD_PORT  PORTB
#define LCD_ODC   ODCB
#define LCD_DATA_PINS (1<<9|1<<10|1<<11|1<<12)
#define LCD_TMR TMR3
#define LCD_PR  PR3
#define LCD_CON T3CON
#define LCD_IE   IEC0bits.T3IE
#define LCD_IF   IFS0bits.T3IF
#define LCD_IPC  IPC2bits.T3IP



// keypad
#define KP_BTN_UP  (1)
#define KP_BTN_DN  (2)
#define KP_BTN_LT  (4)
#define KP_BTN_RT  (8)
#define KP_BTN_ST  (16)
#define KP_TRIS  TRISA
#define KP_LAT   LATA
#define KP_PORT  PORTA
#define KP_MASK  (0x1F)

#define TMRON (1<<15)
// tones outputs
#define TONE_TRIS TRISB
#define TONE_LAT  LATB
#define TONE_PORT PORTB
#define TONE1_TMR  TMR2
#define TONE1_OUT (1<<3)   //RB3
#define TONE1_PER  PR2   // period register
#define TONE1_DC   OC2RS // duty cycle
#define TONE1_IDC   OC2R    // initial duty cycle
#define TONE1_OCCON OC2CON  // output compare control
#define TONE1_TMRCON  T2CON
#define TONE1_PIN_PPS  RPOR1bits.RP3R
#define TONE1_OUT_FN  (19)
#define TONE1_IF  IFS0bits.T2IF
#define TONE1_IE  IEC0bits.T2IE
#define TONE1_IPC IPC1bits.T2IP
#define TONE2_TMR  TMR4
#define TONE2_OUT  (1<<4)  // RB4
#define TONE2_PER  PR4   // period register
#define TONE2_DC   OC4RS // duty cycle
#define TONE2_IDC   OC4R    // initial duty cycle
#define TONE2_OCCON OC4CON  // output compare control
#define TONE2_TMRCON  T4CON
#define TONE2_PIN_PPS  RPOR2bits.RP4R
#define TONE2_OUT_FN  (21)

#if defined WAV_SUPPORT
// PWM WAV player
#define WAV_TMR  TMR2
#define WAV_OUT  (1<<4)  // RB4
#define WAV_TRIS TRISB
#define WAV_LAT  LATB
#define WAV_PER  PR2   // period register
#define WAV_DC   OC2RS // duty cycle
#define WAV_IDC   OC2R    // initial duty cycle
#define WAV_OCCON OC2CON  // output compare control
#define WAV_TMRCON  T2CON
#define WAV_PIN_PPS  RPOR2bits.RP4R
#define WAV_OUT_FN  (19)
#define WAV_IF  IFS0bits.T2IF
#define WAV_IE  IEC0bits.T2IE
#define WAV_IPC IPC1bits.T2IP
#define WAV_LOAD_TMR   TMR3
#define WAV_LOAD_CON   T3CON
#define WAV_OC_IE  IEC0bits.OC2IE
#define WAV_OC_IF  IFS0bits.OC2IF
#define WAV_OC_IPC IPC1bits.OC2IP
#endif

#define ENTRY_SIZE  (32)

// SD card
#define SDC_CON1    SPI1CON1
#define SDC_CON2    SPI1CON2
#define SDC_BUF     SPI1BUF
#define SDC_STAT    SPI1STAT
#define SDC_IF      IFS0bits.SPI1IF
#define SDC_IE      IEC0bits.SPI1IE
#define SDC_IPC     IPC2bits.SPI1IP
#define SDC_TRIS    TRISB
#define SDC_LAT     LATB
#define SDC_PORT    PORTB
#define SDC_CD_RP (2) // sdcard detect on RB2
#define SDC_MOSI_RP (7)   // SPI1 SDO on RB7
#define SDC_MOSI_PPSO RPOR3bits.RP7R    // SPI1 SDO -> sdcard CMD/SDI
#define SDC_MOSI_FN (7) // SPI1 SDO function number
#define SDC_MISO_RP (5) // SPI1 MISO on RP5
#define SDC_MISO_PPSI RPINR20bits.SDI1R  // pin select register bits
#define SDC_SCK_RP  (6)  // SPI1 clk out pin on RB6
#define SDC_SCK_PPSO  RPOR3bits.RP6R  // pin select register bits
#define SDC_SCK_FN  (8)  // SPI1 SCK function number
#define SDC_SCK_PPSI  RPINR20bits.SCK1R  // SPI1 sck  input select register
#define SDC_SS_RP   (8)  // slave select pin RB8
#define SDC_OUT_MSK ((1<<SDC_SS_RP)|(1<<SDC_SCK_RP)|(1<<SDC_SS_RP))
#define SDC_INP_MSK ((1<<SDC_CD_RP)|(1<<SDC_MISO_RP))
#define SDC_TBF     SPI1STATbits.SPITBF
#define SDC_RBF     SPI1STATbits.SPIRBF
#define sdc_disable_analog_pin() AD1PCFGbits.PCFG5=1
#define sdc_spi_enable() SPI1STATbits.SPIEN=1
#define sdc_spi_disable() SPI1STATbits.SPIEN=0
#if SDC_SUPPORT
    extern bool sdcard_available;
#endif

    extern volatile uint32_t systick; // millisecond ticks
    extern volatile uint16_t game_timer; // game delay timer

    extern void HardwareInit();
    extern void pause(uint16_t msec);
    
#ifdef	__cplusplus
}
#endif

#endif	/* HARDWAREPROFILE_H */

