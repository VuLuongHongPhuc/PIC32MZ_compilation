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
FINAL_IMAGE=${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=source/configurations/stdio/xc32_monitor.c source/configurations/freertos_hooks.c source/hardwares/can2.c source/hardwares/core_timer.c source/hardwares/gpio.c source/hardwares/spi.c source/hardwares/system.c source/hardwares/tim2.c source/hardwares/tim3.c source/FreeRTOS-Kernel/portable/MemMang/heap_1.c source/FreeRTOS-Kernel/portable/PIC32MZ/port.c source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S source/FreeRTOS-Kernel/croutine.c source/FreeRTOS-Kernel/event_groups.c source/FreeRTOS-Kernel/list.c source/FreeRTOS-Kernel/queue.c source/FreeRTOS-Kernel/stream_buffer.c source/FreeRTOS-Kernel/tasks.c source/FreeRTOS-Kernel/timers.c source/devices/ILI9341/format_string.c source/devices/ILI9341/ili9341.c source/devices/ILI9341/ili9341_test.c source/task_main.c source/task_statistic.c source/task_display.c source/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o ${OBJECTDIR}/source/configurations/freertos_hooks.o ${OBJECTDIR}/source/hardwares/can2.o ${OBJECTDIR}/source/hardwares/core_timer.o ${OBJECTDIR}/source/hardwares/gpio.o ${OBJECTDIR}/source/hardwares/spi.o ${OBJECTDIR}/source/hardwares/system.o ${OBJECTDIR}/source/hardwares/tim2.o ${OBJECTDIR}/source/hardwares/tim3.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o ${OBJECTDIR}/source/devices/ILI9341/format_string.o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o ${OBJECTDIR}/source/task_main.o ${OBJECTDIR}/source/task_statistic.o ${OBJECTDIR}/source/task_display.o ${OBJECTDIR}/source/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d ${OBJECTDIR}/source/configurations/freertos_hooks.o.d ${OBJECTDIR}/source/hardwares/can2.o.d ${OBJECTDIR}/source/hardwares/core_timer.o.d ${OBJECTDIR}/source/hardwares/gpio.o.d ${OBJECTDIR}/source/hardwares/spi.o.d ${OBJECTDIR}/source/hardwares/system.o.d ${OBJECTDIR}/source/hardwares/tim2.o.d ${OBJECTDIR}/source/hardwares/tim3.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d ${OBJECTDIR}/source/task_main.o.d ${OBJECTDIR}/source/task_statistic.o.d ${OBJECTDIR}/source/task_display.o.d ${OBJECTDIR}/source/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o ${OBJECTDIR}/source/configurations/freertos_hooks.o ${OBJECTDIR}/source/hardwares/can2.o ${OBJECTDIR}/source/hardwares/core_timer.o ${OBJECTDIR}/source/hardwares/gpio.o ${OBJECTDIR}/source/hardwares/spi.o ${OBJECTDIR}/source/hardwares/system.o ${OBJECTDIR}/source/hardwares/tim2.o ${OBJECTDIR}/source/hardwares/tim3.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o ${OBJECTDIR}/source/devices/ILI9341/format_string.o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o ${OBJECTDIR}/source/task_main.o ${OBJECTDIR}/source/task_statistic.o ${OBJECTDIR}/source/task_display.o ${OBJECTDIR}/source/main.o

# Source Files
SOURCEFILES=source/configurations/stdio/xc32_monitor.c source/configurations/freertos_hooks.c source/hardwares/can2.c source/hardwares/core_timer.c source/hardwares/gpio.c source/hardwares/spi.c source/hardwares/system.c source/hardwares/tim2.c source/hardwares/tim3.c source/FreeRTOS-Kernel/portable/MemMang/heap_1.c source/FreeRTOS-Kernel/portable/PIC32MZ/port.c source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S source/FreeRTOS-Kernel/croutine.c source/FreeRTOS-Kernel/event_groups.c source/FreeRTOS-Kernel/list.c source/FreeRTOS-Kernel/queue.c source/FreeRTOS-Kernel/stream_buffer.c source/FreeRTOS-Kernel/tasks.c source/FreeRTOS-Kernel/timers.c source/devices/ILI9341/format_string.c source/devices/ILI9341/ili9341.c source/devices/ILI9341/ili9341_test.c source/task_main.c source/task_statistic.c source/task_display.c source/main.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048ECH064
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  .generated_files/flags/default/93d4f27fd6f87f4e8c5ad53ab92fd01e0ae62daa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"source/configurations" -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  .generated_files/flags/default/186acd9cfefddd770a8c0659455920b884f4421a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"source/configurations" -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o: source/configurations/stdio/xc32_monitor.c  .generated_files/flags/default/54e635f71d477748a4d03ff4fd3057fcfe6ed336 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations/stdio" 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o source/configurations/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/configurations/freertos_hooks.o: source/configurations/freertos_hooks.c  .generated_files/flags/default/16c9d19bf3fc395c583ec26674cf2ce4671f9b4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations" 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/freertos_hooks.o.d" -o ${OBJECTDIR}/source/configurations/freertos_hooks.o source/configurations/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can2.o: source/hardwares/can2.c  .generated_files/flags/default/575a481b99dbfa8c5cb18e9a29a3afa029c3cc42 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can2.o.d" -o ${OBJECTDIR}/source/hardwares/can2.o source/hardwares/can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/core_timer.o: source/hardwares/core_timer.c  .generated_files/flags/default/3089977943d5c7deb14a5448991f37412e78203d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/core_timer.o.d" -o ${OBJECTDIR}/source/hardwares/core_timer.o source/hardwares/core_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/gpio.o: source/hardwares/gpio.c  .generated_files/flags/default/a27277a49e0eb9774f11249476ed2e0c280b6c70 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/gpio.o.d" -o ${OBJECTDIR}/source/hardwares/gpio.o source/hardwares/gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/spi.o: source/hardwares/spi.c  .generated_files/flags/default/2f0130cfd7f8f523eef93b945a29ece028da769b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/spi.o.d" -o ${OBJECTDIR}/source/hardwares/spi.o source/hardwares/spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/system.o: source/hardwares/system.c  .generated_files/flags/default/f4d02b0cc572dddfe8d458c250352f8c9df5fe3a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/system.o.d" -o ${OBJECTDIR}/source/hardwares/system.o source/hardwares/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim2.o: source/hardwares/tim2.c  .generated_files/flags/default/be5c518761315c9e229dc750a15c458b5a9015ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim2.o.d" -o ${OBJECTDIR}/source/hardwares/tim2.o source/hardwares/tim2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim3.o: source/hardwares/tim3.c  .generated_files/flags/default/3ecb25e34fea59b9167b7c1c1b4d516820325d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim3.o.d" -o ${OBJECTDIR}/source/hardwares/tim3.o source/hardwares/tim3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o: source/FreeRTOS-Kernel/portable/MemMang/heap_1.c  .generated_files/flags/default/8cc4a5f9a3b32157bbbc762066d9868abdda91bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o source/FreeRTOS-Kernel/portable/MemMang/heap_1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port.c  .generated_files/flags/default/ea5e8049612afecb8ce63356f19b0dca6a8d7a17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o source/FreeRTOS-Kernel/portable/PIC32MZ/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o: source/FreeRTOS-Kernel/croutine.c  .generated_files/flags/default/9788f27950e6f654e792f305aac7c11de1832a49 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o source/FreeRTOS-Kernel/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o: source/FreeRTOS-Kernel/event_groups.c  .generated_files/flags/default/390bead7d4fe5ff321b495cb7dfdf04d73ca971c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o source/FreeRTOS-Kernel/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/list.o: source/FreeRTOS-Kernel/list.c  .generated_files/flags/default/574f45698ee8fbcab89a67906429f8c32c309ab6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o source/FreeRTOS-Kernel/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o: source/FreeRTOS-Kernel/queue.c  .generated_files/flags/default/d49be1b9f221320d43320ac49973f8429be90029 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o source/FreeRTOS-Kernel/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o: source/FreeRTOS-Kernel/stream_buffer.c  .generated_files/flags/default/2d1e4b2332f21a6a204e89856066a4721415eab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o source/FreeRTOS-Kernel/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o: source/FreeRTOS-Kernel/tasks.c  .generated_files/flags/default/f1d1cb51e716e6cb5407b87eefcc8be9432d1714 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o source/FreeRTOS-Kernel/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o: source/FreeRTOS-Kernel/timers.c  .generated_files/flags/default/bc67745e074dc3dc0376cbff08b32a6a13dc801b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o source/FreeRTOS-Kernel/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/format_string.o: source/devices/ILI9341/format_string.c  .generated_files/flags/default/fe019c7ca287a27cddc91efb9fc4b1e07ca983f3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/format_string.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/format_string.o source/devices/ILI9341/format_string.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341.o: source/devices/ILI9341/ili9341.c  .generated_files/flags/default/9789b74ea1a9aedca5d530f1b66390f9dc8ad85d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o source/devices/ILI9341/ili9341.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o: source/devices/ILI9341/ili9341_test.c  .generated_files/flags/default/cac53b117cdc4eab04be231f2afbe7952eac3a3e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o source/devices/ILI9341/ili9341_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_main.o: source/task_main.c  .generated_files/flags/default/b405d882fbedff97c247f66f574ef789e23036a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_main.o.d 
	@${RM} ${OBJECTDIR}/source/task_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_main.o.d" -o ${OBJECTDIR}/source/task_main.o source/task_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_statistic.o: source/task_statistic.c  .generated_files/flags/default/4638bdb220542150385ae102bec9b5ff672794ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_statistic.o.d 
	@${RM} ${OBJECTDIR}/source/task_statistic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_statistic.o.d" -o ${OBJECTDIR}/source/task_statistic.o source/task_statistic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_display.o: source/task_display.c  .generated_files/flags/default/541d780983b37efe9a5802eafe40796f8538492b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_display.o.d 
	@${RM} ${OBJECTDIR}/source/task_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_display.o.d" -o ${OBJECTDIR}/source/task_display.o source/task_display.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/main.o: source/main.c  .generated_files/flags/default/bd4467cdfa65b02c7ab3701bad4439eb31129176 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o: source/configurations/stdio/xc32_monitor.c  .generated_files/flags/default/fe0fb83838abb30803377a9b43f11ac96afb2770 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations/stdio" 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o source/configurations/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/configurations/freertos_hooks.o: source/configurations/freertos_hooks.c  .generated_files/flags/default/92001810ce5e4149f901327d8b2aafabd09d18a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations" 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/freertos_hooks.o.d" -o ${OBJECTDIR}/source/configurations/freertos_hooks.o source/configurations/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can2.o: source/hardwares/can2.c  .generated_files/flags/default/d997033427f24791ce4baff171747fa8c5b96401 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can2.o.d" -o ${OBJECTDIR}/source/hardwares/can2.o source/hardwares/can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/core_timer.o: source/hardwares/core_timer.c  .generated_files/flags/default/da9defea6475814df5b59ce30c74fec931a2e4ee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/core_timer.o.d" -o ${OBJECTDIR}/source/hardwares/core_timer.o source/hardwares/core_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/gpio.o: source/hardwares/gpio.c  .generated_files/flags/default/59aec6c56f72592181da23ffcca4bbdbdfc520f2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/gpio.o.d" -o ${OBJECTDIR}/source/hardwares/gpio.o source/hardwares/gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/spi.o: source/hardwares/spi.c  .generated_files/flags/default/c30408a86fa8bd86628a70aca9982ed54a567728 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/spi.o.d" -o ${OBJECTDIR}/source/hardwares/spi.o source/hardwares/spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/system.o: source/hardwares/system.c  .generated_files/flags/default/9a3eaac458fd65aeff296dba58b4eb1571949c47 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/system.o.d" -o ${OBJECTDIR}/source/hardwares/system.o source/hardwares/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim2.o: source/hardwares/tim2.c  .generated_files/flags/default/f5c826d92c0068771d4d65738bbf9e7c837996e3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim2.o.d" -o ${OBJECTDIR}/source/hardwares/tim2.o source/hardwares/tim2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim3.o: source/hardwares/tim3.c  .generated_files/flags/default/86bb9f21f6c48ef59b968ed25d4abe0e28e568ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim3.o.d" -o ${OBJECTDIR}/source/hardwares/tim3.o source/hardwares/tim3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o: source/FreeRTOS-Kernel/portable/MemMang/heap_1.c  .generated_files/flags/default/8b1134fefd88d5c5b3e9422075df2b72eea4a882 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o source/FreeRTOS-Kernel/portable/MemMang/heap_1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port.c  .generated_files/flags/default/b25fe8b6730c6c55ea38cdfcf4dcaa2d16a777ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o source/FreeRTOS-Kernel/portable/PIC32MZ/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o: source/FreeRTOS-Kernel/croutine.c  .generated_files/flags/default/a0bc17f17d5314cdd61c3998dbb5e6f4553b2783 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o source/FreeRTOS-Kernel/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o: source/FreeRTOS-Kernel/event_groups.c  .generated_files/flags/default/f574b255281b0cb00db73fa28ee999bdba20c1be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o source/FreeRTOS-Kernel/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/list.o: source/FreeRTOS-Kernel/list.c  .generated_files/flags/default/d2035a043730cd80d54464a96f811d3e55f683a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o source/FreeRTOS-Kernel/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o: source/FreeRTOS-Kernel/queue.c  .generated_files/flags/default/bcaa976ccd5718e76e8e7445bbfdbe043f86378d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o source/FreeRTOS-Kernel/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o: source/FreeRTOS-Kernel/stream_buffer.c  .generated_files/flags/default/eec2f872d071bc929f52f184706cc56407dcbfda .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o source/FreeRTOS-Kernel/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o: source/FreeRTOS-Kernel/tasks.c  .generated_files/flags/default/83751a4a21084a297d5432120ae2ad9432c4c7b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o source/FreeRTOS-Kernel/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o: source/FreeRTOS-Kernel/timers.c  .generated_files/flags/default/e698edf9d84b5a0e44ad0d7f17b3e01bb2066dd3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o source/FreeRTOS-Kernel/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/format_string.o: source/devices/ILI9341/format_string.c  .generated_files/flags/default/3420d850d1c7e66c9d8ba0e6fa13eaf975396f56 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/format_string.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/format_string.o source/devices/ILI9341/format_string.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341.o: source/devices/ILI9341/ili9341.c  .generated_files/flags/default/50e5ec9ecdc57b233dc96bd8c20b232a42d7e5ef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o source/devices/ILI9341/ili9341.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o: source/devices/ILI9341/ili9341_test.c  .generated_files/flags/default/36b8706f1f956fd557efeec7877b3204dc8ca005 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o source/devices/ILI9341/ili9341_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_main.o: source/task_main.c  .generated_files/flags/default/fed3b91c4f1fe085563a1c288cf523c2212c9b82 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_main.o.d 
	@${RM} ${OBJECTDIR}/source/task_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_main.o.d" -o ${OBJECTDIR}/source/task_main.o source/task_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_statistic.o: source/task_statistic.c  .generated_files/flags/default/3f9d02336c6dc780490b0cdf24a2fe548dac911f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_statistic.o.d 
	@${RM} ${OBJECTDIR}/source/task_statistic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_statistic.o.d" -o ${OBJECTDIR}/source/task_statistic.o source/task_statistic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_display.o: source/task_display.c  .generated_files/flags/default/91fa7d1200dde083bfb56ff5b8ec7eb4426db921 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_display.o.d 
	@${RM} ${OBJECTDIR}/source/task_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_display.o.d" -o ${OBJECTDIR}/source/task_display.o source/task_display.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/main.o: source/main.c  .generated_files/flags/default/5448857832990b5fb23e20374f94fe4a9e869e85 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x27F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/mz2048ech064-freertos-v11.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
