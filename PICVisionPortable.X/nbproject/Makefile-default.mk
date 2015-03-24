#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PICVisionPortable.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PICVisionPortable.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=FAT/byteordering.c FAT/fat.c FAT/partition.c FAT/sd_raw.c games/BLINKY/blinky.c games/SOKOBAN/sokoban.c games/LEM/lem.c games/MINES/mines.c games/CAR/car.c games/ANT/ant.c games/WORM/worm.c games/ALIEN/alien.c Hardware/HardwareProfile.c Hardware/LCDout.c main.c chip8.c text.c tone.c display.c keypad.c splash.c filesys.c ../tools/c8test.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/FAT/byteordering.o ${OBJECTDIR}/FAT/fat.o ${OBJECTDIR}/FAT/partition.o ${OBJECTDIR}/FAT/sd_raw.o ${OBJECTDIR}/games/BLINKY/blinky.o ${OBJECTDIR}/games/SOKOBAN/sokoban.o ${OBJECTDIR}/games/LEM/lem.o ${OBJECTDIR}/games/MINES/mines.o ${OBJECTDIR}/games/CAR/car.o ${OBJECTDIR}/games/ANT/ant.o ${OBJECTDIR}/games/WORM/worm.o ${OBJECTDIR}/games/ALIEN/alien.o ${OBJECTDIR}/Hardware/HardwareProfile.o ${OBJECTDIR}/Hardware/LCDout.o ${OBJECTDIR}/main.o ${OBJECTDIR}/chip8.o ${OBJECTDIR}/text.o ${OBJECTDIR}/tone.o ${OBJECTDIR}/display.o ${OBJECTDIR}/keypad.o ${OBJECTDIR}/splash.o ${OBJECTDIR}/filesys.o ${OBJECTDIR}/_ext/2103491380/c8test.o
POSSIBLE_DEPFILES=${OBJECTDIR}/FAT/byteordering.o.d ${OBJECTDIR}/FAT/fat.o.d ${OBJECTDIR}/FAT/partition.o.d ${OBJECTDIR}/FAT/sd_raw.o.d ${OBJECTDIR}/games/BLINKY/blinky.o.d ${OBJECTDIR}/games/SOKOBAN/sokoban.o.d ${OBJECTDIR}/games/LEM/lem.o.d ${OBJECTDIR}/games/MINES/mines.o.d ${OBJECTDIR}/games/CAR/car.o.d ${OBJECTDIR}/games/ANT/ant.o.d ${OBJECTDIR}/games/WORM/worm.o.d ${OBJECTDIR}/games/ALIEN/alien.o.d ${OBJECTDIR}/Hardware/HardwareProfile.o.d ${OBJECTDIR}/Hardware/LCDout.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/chip8.o.d ${OBJECTDIR}/text.o.d ${OBJECTDIR}/tone.o.d ${OBJECTDIR}/display.o.d ${OBJECTDIR}/keypad.o.d ${OBJECTDIR}/splash.o.d ${OBJECTDIR}/filesys.o.d ${OBJECTDIR}/_ext/2103491380/c8test.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/FAT/byteordering.o ${OBJECTDIR}/FAT/fat.o ${OBJECTDIR}/FAT/partition.o ${OBJECTDIR}/FAT/sd_raw.o ${OBJECTDIR}/games/BLINKY/blinky.o ${OBJECTDIR}/games/SOKOBAN/sokoban.o ${OBJECTDIR}/games/LEM/lem.o ${OBJECTDIR}/games/MINES/mines.o ${OBJECTDIR}/games/CAR/car.o ${OBJECTDIR}/games/ANT/ant.o ${OBJECTDIR}/games/WORM/worm.o ${OBJECTDIR}/games/ALIEN/alien.o ${OBJECTDIR}/Hardware/HardwareProfile.o ${OBJECTDIR}/Hardware/LCDout.o ${OBJECTDIR}/main.o ${OBJECTDIR}/chip8.o ${OBJECTDIR}/text.o ${OBJECTDIR}/tone.o ${OBJECTDIR}/display.o ${OBJECTDIR}/keypad.o ${OBJECTDIR}/splash.o ${OBJECTDIR}/filesys.o ${OBJECTDIR}/_ext/2103491380/c8test.o

# Source Files
SOURCEFILES=FAT/byteordering.c FAT/fat.c FAT/partition.c FAT/sd_raw.c games/BLINKY/blinky.c games/SOKOBAN/sokoban.c games/LEM/lem.c games/MINES/mines.c games/CAR/car.c games/ANT/ant.c games/WORM/worm.c games/ALIEN/alien.c Hardware/HardwareProfile.c Hardware/LCDout.c main.c chip8.c text.c tone.c display.c keypad.c splash.c filesys.c ../tools/c8test.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PICVisionPortable.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GA002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GA002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FAT/byteordering.o: FAT/byteordering.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FAT" 
	@${RM} ${OBJECTDIR}/FAT/byteordering.o.d 
	@${RM} ${OBJECTDIR}/FAT/byteordering.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FAT/byteordering.c  -o ${OBJECTDIR}/FAT/byteordering.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FAT/byteordering.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/FAT/byteordering.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FAT/fat.o: FAT/fat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FAT" 
	@${RM} ${OBJECTDIR}/FAT/fat.o.d 
	@${RM} ${OBJECTDIR}/FAT/fat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FAT/fat.c  -o ${OBJECTDIR}/FAT/fat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FAT/fat.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/FAT/fat.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FAT/partition.o: FAT/partition.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FAT" 
	@${RM} ${OBJECTDIR}/FAT/partition.o.d 
	@${RM} ${OBJECTDIR}/FAT/partition.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FAT/partition.c  -o ${OBJECTDIR}/FAT/partition.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FAT/partition.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/FAT/partition.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FAT/sd_raw.o: FAT/sd_raw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FAT" 
	@${RM} ${OBJECTDIR}/FAT/sd_raw.o.d 
	@${RM} ${OBJECTDIR}/FAT/sd_raw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FAT/sd_raw.c  -o ${OBJECTDIR}/FAT/sd_raw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FAT/sd_raw.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/FAT/sd_raw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/BLINKY/blinky.o: games/BLINKY/blinky.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/BLINKY" 
	@${RM} ${OBJECTDIR}/games/BLINKY/blinky.o.d 
	@${RM} ${OBJECTDIR}/games/BLINKY/blinky.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/BLINKY/blinky.c  -o ${OBJECTDIR}/games/BLINKY/blinky.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/BLINKY/blinky.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/BLINKY/blinky.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/SOKOBAN/sokoban.o: games/SOKOBAN/sokoban.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/SOKOBAN" 
	@${RM} ${OBJECTDIR}/games/SOKOBAN/sokoban.o.d 
	@${RM} ${OBJECTDIR}/games/SOKOBAN/sokoban.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/SOKOBAN/sokoban.c  -o ${OBJECTDIR}/games/SOKOBAN/sokoban.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/SOKOBAN/sokoban.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/SOKOBAN/sokoban.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/LEM/lem.o: games/LEM/lem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/LEM" 
	@${RM} ${OBJECTDIR}/games/LEM/lem.o.d 
	@${RM} ${OBJECTDIR}/games/LEM/lem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/LEM/lem.c  -o ${OBJECTDIR}/games/LEM/lem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/LEM/lem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/LEM/lem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/MINES/mines.o: games/MINES/mines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/MINES" 
	@${RM} ${OBJECTDIR}/games/MINES/mines.o.d 
	@${RM} ${OBJECTDIR}/games/MINES/mines.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/MINES/mines.c  -o ${OBJECTDIR}/games/MINES/mines.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/MINES/mines.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/MINES/mines.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/CAR/car.o: games/CAR/car.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/CAR" 
	@${RM} ${OBJECTDIR}/games/CAR/car.o.d 
	@${RM} ${OBJECTDIR}/games/CAR/car.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/CAR/car.c  -o ${OBJECTDIR}/games/CAR/car.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/CAR/car.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/CAR/car.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/ANT/ant.o: games/ANT/ant.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/ANT" 
	@${RM} ${OBJECTDIR}/games/ANT/ant.o.d 
	@${RM} ${OBJECTDIR}/games/ANT/ant.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/ANT/ant.c  -o ${OBJECTDIR}/games/ANT/ant.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/ANT/ant.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/ANT/ant.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/WORM/worm.o: games/WORM/worm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/WORM" 
	@${RM} ${OBJECTDIR}/games/WORM/worm.o.d 
	@${RM} ${OBJECTDIR}/games/WORM/worm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/WORM/worm.c  -o ${OBJECTDIR}/games/WORM/worm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/WORM/worm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/WORM/worm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/ALIEN/alien.o: games/ALIEN/alien.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/ALIEN" 
	@${RM} ${OBJECTDIR}/games/ALIEN/alien.o.d 
	@${RM} ${OBJECTDIR}/games/ALIEN/alien.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/ALIEN/alien.c  -o ${OBJECTDIR}/games/ALIEN/alien.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/ALIEN/alien.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/ALIEN/alien.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Hardware/HardwareProfile.o: Hardware/HardwareProfile.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Hardware" 
	@${RM} ${OBJECTDIR}/Hardware/HardwareProfile.o.d 
	@${RM} ${OBJECTDIR}/Hardware/HardwareProfile.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Hardware/HardwareProfile.c  -o ${OBJECTDIR}/Hardware/HardwareProfile.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Hardware/HardwareProfile.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Hardware/HardwareProfile.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Hardware/LCDout.o: Hardware/LCDout.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Hardware" 
	@${RM} ${OBJECTDIR}/Hardware/LCDout.o.d 
	@${RM} ${OBJECTDIR}/Hardware/LCDout.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Hardware/LCDout.c  -o ${OBJECTDIR}/Hardware/LCDout.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Hardware/LCDout.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Hardware/LCDout.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/chip8.o: chip8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/chip8.o.d 
	@${RM} ${OBJECTDIR}/chip8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  chip8.c  -o ${OBJECTDIR}/chip8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/chip8.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/chip8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/text.o: text.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/text.o.d 
	@${RM} ${OBJECTDIR}/text.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  text.c  -o ${OBJECTDIR}/text.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/text.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/text.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/tone.o: tone.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tone.o.d 
	@${RM} ${OBJECTDIR}/tone.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  tone.c  -o ${OBJECTDIR}/tone.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/tone.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/tone.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/display.o: display.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/display.o.d 
	@${RM} ${OBJECTDIR}/display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  display.c  -o ${OBJECTDIR}/display.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/display.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/display.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/keypad.o: keypad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keypad.o.d 
	@${RM} ${OBJECTDIR}/keypad.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  keypad.c  -o ${OBJECTDIR}/keypad.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/keypad.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/keypad.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/splash.o: splash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/splash.o.d 
	@${RM} ${OBJECTDIR}/splash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  splash.c  -o ${OBJECTDIR}/splash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/splash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/splash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/filesys.o: filesys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/filesys.o.d 
	@${RM} ${OBJECTDIR}/filesys.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  filesys.c  -o ${OBJECTDIR}/filesys.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/filesys.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/filesys.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2103491380/c8test.o: ../tools/c8test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2103491380" 
	@${RM} ${OBJECTDIR}/_ext/2103491380/c8test.o.d 
	@${RM} ${OBJECTDIR}/_ext/2103491380/c8test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../tools/c8test.c  -o ${OBJECTDIR}/_ext/2103491380/c8test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2103491380/c8test.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1    -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2103491380/c8test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/FAT/byteordering.o: FAT/byteordering.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FAT" 
	@${RM} ${OBJECTDIR}/FAT/byteordering.o.d 
	@${RM} ${OBJECTDIR}/FAT/byteordering.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FAT/byteordering.c  -o ${OBJECTDIR}/FAT/byteordering.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FAT/byteordering.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/FAT/byteordering.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FAT/fat.o: FAT/fat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FAT" 
	@${RM} ${OBJECTDIR}/FAT/fat.o.d 
	@${RM} ${OBJECTDIR}/FAT/fat.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FAT/fat.c  -o ${OBJECTDIR}/FAT/fat.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FAT/fat.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/FAT/fat.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FAT/partition.o: FAT/partition.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FAT" 
	@${RM} ${OBJECTDIR}/FAT/partition.o.d 
	@${RM} ${OBJECTDIR}/FAT/partition.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FAT/partition.c  -o ${OBJECTDIR}/FAT/partition.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FAT/partition.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/FAT/partition.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FAT/sd_raw.o: FAT/sd_raw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FAT" 
	@${RM} ${OBJECTDIR}/FAT/sd_raw.o.d 
	@${RM} ${OBJECTDIR}/FAT/sd_raw.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  FAT/sd_raw.c  -o ${OBJECTDIR}/FAT/sd_raw.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FAT/sd_raw.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/FAT/sd_raw.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/BLINKY/blinky.o: games/BLINKY/blinky.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/BLINKY" 
	@${RM} ${OBJECTDIR}/games/BLINKY/blinky.o.d 
	@${RM} ${OBJECTDIR}/games/BLINKY/blinky.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/BLINKY/blinky.c  -o ${OBJECTDIR}/games/BLINKY/blinky.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/BLINKY/blinky.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/BLINKY/blinky.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/SOKOBAN/sokoban.o: games/SOKOBAN/sokoban.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/SOKOBAN" 
	@${RM} ${OBJECTDIR}/games/SOKOBAN/sokoban.o.d 
	@${RM} ${OBJECTDIR}/games/SOKOBAN/sokoban.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/SOKOBAN/sokoban.c  -o ${OBJECTDIR}/games/SOKOBAN/sokoban.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/SOKOBAN/sokoban.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/SOKOBAN/sokoban.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/LEM/lem.o: games/LEM/lem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/LEM" 
	@${RM} ${OBJECTDIR}/games/LEM/lem.o.d 
	@${RM} ${OBJECTDIR}/games/LEM/lem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/LEM/lem.c  -o ${OBJECTDIR}/games/LEM/lem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/LEM/lem.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/LEM/lem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/MINES/mines.o: games/MINES/mines.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/MINES" 
	@${RM} ${OBJECTDIR}/games/MINES/mines.o.d 
	@${RM} ${OBJECTDIR}/games/MINES/mines.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/MINES/mines.c  -o ${OBJECTDIR}/games/MINES/mines.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/MINES/mines.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/MINES/mines.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/CAR/car.o: games/CAR/car.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/CAR" 
	@${RM} ${OBJECTDIR}/games/CAR/car.o.d 
	@${RM} ${OBJECTDIR}/games/CAR/car.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/CAR/car.c  -o ${OBJECTDIR}/games/CAR/car.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/CAR/car.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/CAR/car.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/ANT/ant.o: games/ANT/ant.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/ANT" 
	@${RM} ${OBJECTDIR}/games/ANT/ant.o.d 
	@${RM} ${OBJECTDIR}/games/ANT/ant.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/ANT/ant.c  -o ${OBJECTDIR}/games/ANT/ant.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/ANT/ant.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/ANT/ant.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/WORM/worm.o: games/WORM/worm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/WORM" 
	@${RM} ${OBJECTDIR}/games/WORM/worm.o.d 
	@${RM} ${OBJECTDIR}/games/WORM/worm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/WORM/worm.c  -o ${OBJECTDIR}/games/WORM/worm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/WORM/worm.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/WORM/worm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/games/ALIEN/alien.o: games/ALIEN/alien.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/games/ALIEN" 
	@${RM} ${OBJECTDIR}/games/ALIEN/alien.o.d 
	@${RM} ${OBJECTDIR}/games/ALIEN/alien.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  games/ALIEN/alien.c  -o ${OBJECTDIR}/games/ALIEN/alien.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/games/ALIEN/alien.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/games/ALIEN/alien.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Hardware/HardwareProfile.o: Hardware/HardwareProfile.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Hardware" 
	@${RM} ${OBJECTDIR}/Hardware/HardwareProfile.o.d 
	@${RM} ${OBJECTDIR}/Hardware/HardwareProfile.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Hardware/HardwareProfile.c  -o ${OBJECTDIR}/Hardware/HardwareProfile.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Hardware/HardwareProfile.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Hardware/HardwareProfile.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Hardware/LCDout.o: Hardware/LCDout.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Hardware" 
	@${RM} ${OBJECTDIR}/Hardware/LCDout.o.d 
	@${RM} ${OBJECTDIR}/Hardware/LCDout.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Hardware/LCDout.c  -o ${OBJECTDIR}/Hardware/LCDout.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Hardware/LCDout.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/Hardware/LCDout.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/chip8.o: chip8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/chip8.o.d 
	@${RM} ${OBJECTDIR}/chip8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  chip8.c  -o ${OBJECTDIR}/chip8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/chip8.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/chip8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/text.o: text.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/text.o.d 
	@${RM} ${OBJECTDIR}/text.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  text.c  -o ${OBJECTDIR}/text.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/text.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/text.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/tone.o: tone.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/tone.o.d 
	@${RM} ${OBJECTDIR}/tone.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  tone.c  -o ${OBJECTDIR}/tone.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/tone.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/tone.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/display.o: display.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/display.o.d 
	@${RM} ${OBJECTDIR}/display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  display.c  -o ${OBJECTDIR}/display.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/display.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/display.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/keypad.o: keypad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keypad.o.d 
	@${RM} ${OBJECTDIR}/keypad.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  keypad.c  -o ${OBJECTDIR}/keypad.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/keypad.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/keypad.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/splash.o: splash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/splash.o.d 
	@${RM} ${OBJECTDIR}/splash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  splash.c  -o ${OBJECTDIR}/splash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/splash.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/splash.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/filesys.o: filesys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/filesys.o.d 
	@${RM} ${OBJECTDIR}/filesys.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  filesys.c  -o ${OBJECTDIR}/filesys.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/filesys.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/filesys.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/2103491380/c8test.o: ../tools/c8test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2103491380" 
	@${RM} ${OBJECTDIR}/_ext/2103491380/c8test.o.d 
	@${RM} ${OBJECTDIR}/_ext/2103491380/c8test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../tools/c8test.c  -o ${OBJECTDIR}/_ext/2103491380/c8test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2103491380/c8test.o.d"        -g -omf=elf -D_CHIPCON_ -D__PIC24__ -O1 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2103491380/c8test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PICVisionPortable.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PICVisionPortable.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -D_CHIPCON_ -D__PIC24__  -mreserve=data@0x800:0x822   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PICKIT2=1,$(MP_LINKER_FILE_OPTION),--stack=256,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PICVisionPortable.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PICVisionPortable.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -D_CHIPCON_ -D__PIC24__ -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=256,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PICVisionPortable.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
