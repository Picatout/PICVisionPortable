
#include <stdlib.h>
#include <string.h>
#include "wav.h"
#include "filesys.h"
#include "tone.h"

bool wav_opened; // wave file opened
volatile bool wav_done; // wave file done
bool wav_loop; // loop sample
volatile static bool load_next;
//int32_t size; // samples in files
//int32_t pos;  // current position
volatile static uint16_t idx; // current position in buffer
volatile static uint16_t samples_left; // how many samples to output.

#define BUFF_SIZE (512)

uint8_t samples[BUFF_SIZE];

typedef struct {
    char FileTypeBlocID[4]; //"RIFF"
    uint32_t FileSize;
    char FileFormatID[4];   //"WAVE"
    char FormatBlocID[4];   //"fmt "
    uint32_t BlockSize;
    uint16_t AudioFormat;
    uint16_t ChanCount;
    uint32_t SampleRate;
    uint32_t BytePerSec;
    uint16_t BytePerBloc;
    uint16_t BitsPerSample;
    char DataBlocID[4];  //"data"
    uint32_t data_size;
}wav_header_t;

// retourne nombre d'échantillons si le fichier existe et est valide
// doit-être un fichier RIFF/WAVEfmt  16bits/22050 monophonique
uint32_t open_wave_file(const char *file_name){
    wav_header_t wav_header;
    uint16_t count;

    memset(&wav_header,0,sizeof(wav_header_t));
    if (fs_open_file(file_name)){
        count=fs_read_file((uint8_t*)&wav_header,sizeof(wav_header_t));
        if (count==sizeof(wav_header_t)){
            wav_header.FileSize=0;
            wav_header.FormatBlocID[3]=0;
            if (!strcmp(wav_header.FileTypeBlocID,"RIFF")&&
                    !strcmp(wav_header.FileFormatID,"WAVEfmt")&&
                    (wav_header.AudioFormat==1) &&
                    (wav_header.ChanCount==1) &&
                    (wav_header.BitsPerSample==8) &&
                    (wav_header.SampleRate==22050)){
            }else{
                goto file_error;
            }
        }else{
            goto file_error;
        }
    }
    return wav_header.data_size;
file_error:
    fs_close_file();
    return 0;
}//f()

static bool upper;

void load_samples_buffer(){
    int count;

    load_next=false;
    if (!upper){
        count=fs_read_file(samples,BUFF_SIZE/2);
        upper=true;
    }
    else{
        count=fs_read_file(&samples[BUFF_SIZE/2],BUFF_SIZE/2);
        upper=false;
    }
    if (count>0){
        samples_left+=count;
    }else{
        fs_close_file();
        wav_opened=false;
    }
}//f()


#define SAMPLE_RATE (22050)
void pwm_init(){
    tone_timer=0;
    WAV_OC_IPC=1;
    WAV_OC_IF=0;
    WAV_OC_IE=0;
    WAV_OCCON &=~7; // OC mode 0 (off)
    WAV_PER = ((FCY/SAMPLE_RATE))-1;
    WAV_DC = ((FCY/SAMPLE_RATE)>>1);
    WAV_IDC = ((FCY/SAMPLE_RATE)>>1);
    WAV_OCCON |= 5; // init low, continuous output pulse.
    WAV_IPC=5;
    idx=0;
    wav_on();

}//f()

uint32_t wav_play_file(const char *file_name, bool loop){
    uint32_t samples_count;
    samples_count=open_wave_file(file_name);
    if (samples_count){
        wav_opened=true;
        upper=false;
        wav_done=false;
        load_samples_buffer();
        load_samples_buffer();
        pwm_init();
        while (wav_opened){
            if (!idx||(idx==(BUFF_SIZE/2)))
                load_samples_buffer();
        }
    }
    return samples_count;
}//f()


void wav_stop(){
    wav_off();
    if (wav_opened){
        fs_close_file();
        wav_opened=false;
    }
    wav_done=true;
}//f()


void __attribute__((interrupt,no_auto_psv)) _T2Interrupt(void){
    if (!wav_done){
//        if (wav_opened && (!idx||(idx==(BUFF_SIZE/2)))){
//            //WAV_OC_IE=1;
//            load_next=true;
//        }
        WAV_DC=samples[idx];
        samples_left--;
        idx++;
        idx&=(BUFF_SIZE-1);
    }
    if (!samples_left){
        wav_done=true;
        wav_off();
    }
    WAV_IF=0;
}//f()

void __attribute__((interrupt,no_auto_psv)) _OC2Interrupt(void){
    WAV_OC_IE=0;
    load_next=true;
//    load_samples_buffer();
    WAV_OC_IF=0;
}//f()
