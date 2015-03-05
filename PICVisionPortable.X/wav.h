/* 
 * File:   wav.h
 * Author: Jacques
 *
 * Created on 15 février 2015, 13:41
 */

#ifndef WAV_H
#define	WAV_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "Hardware/HardwareProfile.h"
#define wav_on()  WAV_TRIS &= ~WAV_OUT;\
                  WAV_TMRCON |=TMRON;\
                  WAV_IF=0;\
                  WAV_IE=1

#define wav_off() WAV_TRIS |= WAV_OUT;\
                  WAV_TMRCON &=~TMRON;\
                  WAV_IE=0;\
                  WAV_OC_IE=0

    uint32_t wav_play_file(const char *file_name,bool loop);
    void wav_stop();

#ifdef	__cplusplus
}
#endif

#endif	/* WAV_H */

