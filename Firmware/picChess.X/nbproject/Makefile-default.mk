#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/picChess.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/picChess.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1472/mainVGA800x600.o ${OBJECTDIR}/_ext/1360908001/VGA.o ${OBJECTDIR}/_ext/2145020369/chessEngine.o ${OBJECTDIR}/_ext/2145020369/chessVideo.o ${OBJECTDIR}/_ext/730281814/PS2IC.o ${OBJECTDIR}/_ext/2145020369/chessInterface.o ${OBJECTDIR}/_ext/1360908001/text.o ${OBJECTDIR}/_ext/1360908001/graphics.o ${OBJECTDIR}/_ext/2145020369/chessMakeMove.o ${OBJECTDIR}/_ext/2145020369/chessMoveGen.o ${OBJECTDIR}/_ext/2145020369/chessEvaluation.o ${OBJECTDIR}/_ext/2145020369/chessSearch.o ${OBJECTDIR}/_ext/2145020369/chessTables.o ${OBJECTDIR}/_ext/2145020369/chessGame.o ${OBJECTDIR}/_ext/2145148639/clock.o ${OBJECTDIR}/_ext/2145148639/clockVideo.o ${OBJECTDIR}/_ext/1360900790/sst25vf016.o ${OBJECTDIR}/_ext/2143559335/audio.o ${OBJECTDIR}/_ext/2143559335/sounds.o ${OBJECTDIR}/_ext/1768172253/UART2.o ${OBJECTDIR}/_ext/761820693/gameOfLife.o ${OBJECTDIR}/_ext/761817454/LM35.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1472/mainVGA800x600.o.d ${OBJECTDIR}/_ext/1360908001/VGA.o.d ${OBJECTDIR}/_ext/2145020369/chessEngine.o.d ${OBJECTDIR}/_ext/2145020369/chessVideo.o.d ${OBJECTDIR}/_ext/730281814/PS2IC.o.d ${OBJECTDIR}/_ext/2145020369/chessInterface.o.d ${OBJECTDIR}/_ext/1360908001/text.o.d ${OBJECTDIR}/_ext/1360908001/graphics.o.d ${OBJECTDIR}/_ext/2145020369/chessMakeMove.o.d ${OBJECTDIR}/_ext/2145020369/chessMoveGen.o.d ${OBJECTDIR}/_ext/2145020369/chessEvaluation.o.d ${OBJECTDIR}/_ext/2145020369/chessSearch.o.d ${OBJECTDIR}/_ext/2145020369/chessTables.o.d ${OBJECTDIR}/_ext/2145020369/chessGame.o.d ${OBJECTDIR}/_ext/2145148639/clock.o.d ${OBJECTDIR}/_ext/2145148639/clockVideo.o.d ${OBJECTDIR}/_ext/1360900790/sst25vf016.o.d ${OBJECTDIR}/_ext/2143559335/audio.o.d ${OBJECTDIR}/_ext/2143559335/sounds.o.d ${OBJECTDIR}/_ext/1768172253/UART2.o.d ${OBJECTDIR}/_ext/761820693/gameOfLife.o.d ${OBJECTDIR}/_ext/761817454/LM35.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1472/mainVGA800x600.o ${OBJECTDIR}/_ext/1360908001/VGA.o ${OBJECTDIR}/_ext/2145020369/chessEngine.o ${OBJECTDIR}/_ext/2145020369/chessVideo.o ${OBJECTDIR}/_ext/730281814/PS2IC.o ${OBJECTDIR}/_ext/2145020369/chessInterface.o ${OBJECTDIR}/_ext/1360908001/text.o ${OBJECTDIR}/_ext/1360908001/graphics.o ${OBJECTDIR}/_ext/2145020369/chessMakeMove.o ${OBJECTDIR}/_ext/2145020369/chessMoveGen.o ${OBJECTDIR}/_ext/2145020369/chessEvaluation.o ${OBJECTDIR}/_ext/2145020369/chessSearch.o ${OBJECTDIR}/_ext/2145020369/chessTables.o ${OBJECTDIR}/_ext/2145020369/chessGame.o ${OBJECTDIR}/_ext/2145148639/clock.o ${OBJECTDIR}/_ext/2145148639/clockVideo.o ${OBJECTDIR}/_ext/1360900790/sst25vf016.o ${OBJECTDIR}/_ext/2143559335/audio.o ${OBJECTDIR}/_ext/2143559335/sounds.o ${OBJECTDIR}/_ext/1768172253/UART2.o ${OBJECTDIR}/_ext/761820693/gameOfLife.o ${OBJECTDIR}/_ext/761817454/LM35.o


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/picChess.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33FJ128MC804
MP_LINKER_FILE_OPTION=,--script=p33FJ128MC804.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1360908001/VGA.o: ../VGA/VGA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360908001 
	@${RM} ${OBJECTDIR}/_ext/1360908001/VGA.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../VGA/VGA.c  -o ${OBJECTDIR}/_ext/1360908001/VGA.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360908001/VGA.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360908001/VGA.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessEngine.o: ../CHESS/chessEngine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessEngine.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessEngine.c  -o ${OBJECTDIR}/_ext/2145020369/chessEngine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessEngine.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessEngine.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessVideo.o: ../CHESS/chessVideo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessVideo.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessVideo.c  -o ${OBJECTDIR}/_ext/2145020369/chessVideo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessVideo.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessVideo.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/730281814/PS2IC.o: ../KEYBOARD/PS2IC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/730281814 
	@${RM} ${OBJECTDIR}/_ext/730281814/PS2IC.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../KEYBOARD/PS2IC.c  -o ${OBJECTDIR}/_ext/730281814/PS2IC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/730281814/PS2IC.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/730281814/PS2IC.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessInterface.o: ../CHESS/chessInterface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessInterface.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessInterface.c  -o ${OBJECTDIR}/_ext/2145020369/chessInterface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessInterface.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessInterface.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/1360908001/text.o: ../VGA/text.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360908001 
	@${RM} ${OBJECTDIR}/_ext/1360908001/text.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../VGA/text.c  -o ${OBJECTDIR}/_ext/1360908001/text.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360908001/text.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360908001/text.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/1360908001/graphics.o: ../VGA/graphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360908001 
	@${RM} ${OBJECTDIR}/_ext/1360908001/graphics.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../VGA/graphics.c  -o ${OBJECTDIR}/_ext/1360908001/graphics.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360908001/graphics.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360908001/graphics.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessMakeMove.o: ../CHESS/chessMakeMove.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessMakeMove.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessMakeMove.c  -o ${OBJECTDIR}/_ext/2145020369/chessMakeMove.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessMakeMove.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessMakeMove.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessMoveGen.o: ../CHESS/chessMoveGen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessMoveGen.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessMoveGen.c  -o ${OBJECTDIR}/_ext/2145020369/chessMoveGen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessMoveGen.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessMoveGen.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessEvaluation.o: ../CHESS/chessEvaluation.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessEvaluation.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessEvaluation.c  -o ${OBJECTDIR}/_ext/2145020369/chessEvaluation.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessEvaluation.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessEvaluation.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessSearch.o: ../CHESS/chessSearch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessSearch.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessSearch.c  -o ${OBJECTDIR}/_ext/2145020369/chessSearch.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessSearch.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessSearch.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessTables.o: ../CHESS/chessTables.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessTables.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessTables.c  -o ${OBJECTDIR}/_ext/2145020369/chessTables.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessTables.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessTables.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessGame.o: ../CHESS/chessGame.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessGame.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessGame.c  -o ${OBJECTDIR}/_ext/2145020369/chessGame.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessGame.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessGame.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145148639/clock.o: ../CLOCK/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145148639 
	@${RM} ${OBJECTDIR}/_ext/2145148639/clock.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CLOCK/clock.c  -o ${OBJECTDIR}/_ext/2145148639/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145148639/clock.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145148639/clock.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145148639/clockVideo.o: ../CLOCK/clockVideo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145148639 
	@${RM} ${OBJECTDIR}/_ext/2145148639/clockVideo.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CLOCK/clockVideo.c  -o ${OBJECTDIR}/_ext/2145148639/clockVideo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145148639/clockVideo.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145148639/clockVideo.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/1360900790/sst25vf016.o: ../NVM/sst25vf016.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360900790 
	@${RM} ${OBJECTDIR}/_ext/1360900790/sst25vf016.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../NVM/sst25vf016.c  -o ${OBJECTDIR}/_ext/1360900790/sst25vf016.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360900790/sst25vf016.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360900790/sst25vf016.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2143559335/audio.o: ../AUDIO/audio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2143559335 
	@${RM} ${OBJECTDIR}/_ext/2143559335/audio.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../AUDIO/audio.c  -o ${OBJECTDIR}/_ext/2143559335/audio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2143559335/audio.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2143559335/audio.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2143559335/sounds.o: ../AUDIO/sounds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2143559335 
	@${RM} ${OBJECTDIR}/_ext/2143559335/sounds.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../AUDIO/sounds.c  -o ${OBJECTDIR}/_ext/2143559335/sounds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2143559335/sounds.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2143559335/sounds.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/1768172253/UART2.o: ../SERIAL/UART2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1768172253 
	@${RM} ${OBJECTDIR}/_ext/1768172253/UART2.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../SERIAL/UART2.c  -o ${OBJECTDIR}/_ext/1768172253/UART2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1768172253/UART2.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1768172253/UART2.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/761820693/gameOfLife.o: ../LIFE/gameOfLife.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/761820693 
	@${RM} ${OBJECTDIR}/_ext/761820693/gameOfLife.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIFE/gameOfLife.c  -o ${OBJECTDIR}/_ext/761820693/gameOfLife.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820693/gameOfLife.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820693/gameOfLife.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/761817454/LM35.o: ../LM35/LM35.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/761817454 
	@${RM} ${OBJECTDIR}/_ext/761817454/LM35.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LM35/LM35.c  -o ${OBJECTDIR}/_ext/761817454/LM35.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761817454/LM35.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/761817454/LM35.o.d" $(SILENT) 
	
else
${OBJECTDIR}/_ext/1360908001/VGA.o: ../VGA/VGA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360908001 
	@${RM} ${OBJECTDIR}/_ext/1360908001/VGA.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../VGA/VGA.c  -o ${OBJECTDIR}/_ext/1360908001/VGA.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360908001/VGA.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360908001/VGA.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessEngine.o: ../CHESS/chessEngine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessEngine.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessEngine.c  -o ${OBJECTDIR}/_ext/2145020369/chessEngine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessEngine.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessEngine.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessVideo.o: ../CHESS/chessVideo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessVideo.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessVideo.c  -o ${OBJECTDIR}/_ext/2145020369/chessVideo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessVideo.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessVideo.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/730281814/PS2IC.o: ../KEYBOARD/PS2IC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/730281814 
	@${RM} ${OBJECTDIR}/_ext/730281814/PS2IC.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../KEYBOARD/PS2IC.c  -o ${OBJECTDIR}/_ext/730281814/PS2IC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/730281814/PS2IC.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/730281814/PS2IC.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessInterface.o: ../CHESS/chessInterface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessInterface.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessInterface.c  -o ${OBJECTDIR}/_ext/2145020369/chessInterface.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessInterface.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessInterface.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/1360908001/text.o: ../VGA/text.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360908001 
	@${RM} ${OBJECTDIR}/_ext/1360908001/text.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../VGA/text.c  -o ${OBJECTDIR}/_ext/1360908001/text.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360908001/text.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360908001/text.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/1360908001/graphics.o: ../VGA/graphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360908001 
	@${RM} ${OBJECTDIR}/_ext/1360908001/graphics.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../VGA/graphics.c  -o ${OBJECTDIR}/_ext/1360908001/graphics.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360908001/graphics.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360908001/graphics.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessMakeMove.o: ../CHESS/chessMakeMove.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessMakeMove.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessMakeMove.c  -o ${OBJECTDIR}/_ext/2145020369/chessMakeMove.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessMakeMove.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessMakeMove.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessMoveGen.o: ../CHESS/chessMoveGen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessMoveGen.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessMoveGen.c  -o ${OBJECTDIR}/_ext/2145020369/chessMoveGen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessMoveGen.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessMoveGen.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessEvaluation.o: ../CHESS/chessEvaluation.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessEvaluation.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessEvaluation.c  -o ${OBJECTDIR}/_ext/2145020369/chessEvaluation.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessEvaluation.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessEvaluation.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessSearch.o: ../CHESS/chessSearch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessSearch.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessSearch.c  -o ${OBJECTDIR}/_ext/2145020369/chessSearch.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessSearch.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessSearch.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessTables.o: ../CHESS/chessTables.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessTables.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessTables.c  -o ${OBJECTDIR}/_ext/2145020369/chessTables.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessTables.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessTables.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145020369/chessGame.o: ../CHESS/chessGame.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145020369 
	@${RM} ${OBJECTDIR}/_ext/2145020369/chessGame.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CHESS/chessGame.c  -o ${OBJECTDIR}/_ext/2145020369/chessGame.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145020369/chessGame.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145020369/chessGame.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145148639/clock.o: ../CLOCK/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145148639 
	@${RM} ${OBJECTDIR}/_ext/2145148639/clock.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CLOCK/clock.c  -o ${OBJECTDIR}/_ext/2145148639/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145148639/clock.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145148639/clock.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2145148639/clockVideo.o: ../CLOCK/clockVideo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2145148639 
	@${RM} ${OBJECTDIR}/_ext/2145148639/clockVideo.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../CLOCK/clockVideo.c  -o ${OBJECTDIR}/_ext/2145148639/clockVideo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2145148639/clockVideo.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2145148639/clockVideo.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/1360900790/sst25vf016.o: ../NVM/sst25vf016.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1360900790 
	@${RM} ${OBJECTDIR}/_ext/1360900790/sst25vf016.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../NVM/sst25vf016.c  -o ${OBJECTDIR}/_ext/1360900790/sst25vf016.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360900790/sst25vf016.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360900790/sst25vf016.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2143559335/audio.o: ../AUDIO/audio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2143559335 
	@${RM} ${OBJECTDIR}/_ext/2143559335/audio.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../AUDIO/audio.c  -o ${OBJECTDIR}/_ext/2143559335/audio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2143559335/audio.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2143559335/audio.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/2143559335/sounds.o: ../AUDIO/sounds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2143559335 
	@${RM} ${OBJECTDIR}/_ext/2143559335/sounds.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../AUDIO/sounds.c  -o ${OBJECTDIR}/_ext/2143559335/sounds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/2143559335/sounds.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/2143559335/sounds.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/1768172253/UART2.o: ../SERIAL/UART2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1768172253 
	@${RM} ${OBJECTDIR}/_ext/1768172253/UART2.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../SERIAL/UART2.c  -o ${OBJECTDIR}/_ext/1768172253/UART2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1768172253/UART2.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1768172253/UART2.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/761820693/gameOfLife.o: ../LIFE/gameOfLife.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/761820693 
	@${RM} ${OBJECTDIR}/_ext/761820693/gameOfLife.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LIFE/gameOfLife.c  -o ${OBJECTDIR}/_ext/761820693/gameOfLife.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761820693/gameOfLife.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/761820693/gameOfLife.o.d" $(SILENT) 
	
${OBJECTDIR}/_ext/761817454/LM35.o: ../LM35/LM35.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/761817454 
	@${RM} ${OBJECTDIR}/_ext/761817454/LM35.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../LM35/LM35.c  -o ${OBJECTDIR}/_ext/761817454/LM35.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/761817454/LM35.o.d"        -g -omf=elf -O0 -I"..\CHESS" -I"..\VGA" -I".." -I"..\KEYBOARD" -I"..\CLOCK" -I"..\NVM" -I"..\AUDIO" -I"..\SERIAL" -I"..\LIFE" -I"..\LM35" -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/761817454/LM35.o.d" $(SILENT) 
	
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
dist/${CND_CONF}/${IMAGE_TYPE}/picChess.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/picChess.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PICKIT2=1  -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PICKIT2=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--no-force-link,--smart-io,-Map="${DISTDIR}\picChess.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/picChess.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/picChess.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="..",--no-force-link,--smart-io,-Map="${DISTDIR}\picChess.X.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/picChess.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf 
	
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
