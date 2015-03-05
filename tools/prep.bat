@echo off
ccasm c8test.chp c8test.bin -s c8test.lbl
cvt-chip -pPIC c8test.bin
xcopy /y c8test.c ..\
xcopy /y c8test.h ..\

