
#include "GLCDdriver.h"

#define LCD_DELAY  (36)

#define pulse_e() LCD_LAT |=LCD_E;\
                  __delay_us(2);\
                  LCD_LAT&=~LCD_E;\
                  __delay_us(2)

unsigned char display_buffer[64][16];

void GLCD_send_cmd(unsigned b){
    LCD_LAT &= ~LCD_PINS;
    LCD_LAT |= (b&0xf0)<<5;
    pulse_e();
    LCD_LAT &=~LCD_DATA_PINS;
    LCD_LAT |= (b&0xf)<<9;
    pulse_e();
    __delay_us(LCD_DELAY);
}//f()

void GLCD_send_data(unsigned b){
    LCD_LAT &= ~LCD_PINS;
    LCD_LAT |= LCD_RS;
    LCD_LAT |= (b&0xf0)<<5;
    pulse_e();
    LCD_LAT &=~LCD_DATA_PINS;
    LCD_LAT |= (b&0xf)<<9;
    pulse_e();
    __delay_us(LCD_DELAY);
}


void GLCD_init(){

// power on delay
    __delay_ms(50);
    LCD_LAT |= LCD_RST; // release LCD from reset.
    __delay_ms(10);
    GLCD_send_cmd(1); // efface RAM TEXT
    __delay_ms(2);
// cofigure: 4 bits interface, graphic mode, extended command
    GLCD_set_mode(LCD_GRAPHIC);
    GLCD_set_mode(LCD_GRAPHIC); // in cas it missed the first one
}//f()


void GLCD_set_mode(glcd_mode_t mode){
    if (mode==LCD_TEXT){
        GLCD_send_cmd(BCMD_FUNC_SET);
    }else{//graphic mode, 4 bits data, Graphic mode, extended command set
        GLCD_send_cmd(BCMD_FUNC_SET|G_BIT|RE_BIT);
    }
}//f()

void GLCD_enable(bool enable, unsigned cursor){
    if (enable){
        GLCD_send_cmd(0x0C|cursor);
    }else{
        GLCD_send_cmd(0x08);
    }
}//f()


void GLCD_update(){
    unsigned y,x;
    for (y=0;y<32;y++){
        GLCD_send_cmd(XCMD_GAC|y);
        GLCD_send_cmd(XCMD_GAC);
        for (x=0;x<32;x++){
            if (x<16){
                GLCD_send_data(display_buffer[y][x]);
            }else{
                GLCD_send_data(display_buffer[y+32][x-16]);
            }
        }
    }
}//f()
