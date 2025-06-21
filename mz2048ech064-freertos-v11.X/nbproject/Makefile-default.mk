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
SOURCEFILES_QUOTED_IF_SPACED=source/configurations/stdio/xc32_monitor.c source/configurations/freertos_hooks.c source/hardwares/can2.c source/hardwares/core_timer.c source/hardwares/gpio.c source/hardwares/spi.c source/hardwares/system.c source/hardwares/tim2.c source/hardwares/tim3.c source/hardwares/can1.c source/hardwares/trng.c source/FreeRTOS-Kernel/portable/MemMang/heap_1.c source/FreeRTOS-Kernel/portable/PIC32MZ/port.c source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S source/FreeRTOS-Kernel/croutine.c source/FreeRTOS-Kernel/event_groups.c source/FreeRTOS-Kernel/list.c source/FreeRTOS-Kernel/queue.c source/FreeRTOS-Kernel/stream_buffer.c source/FreeRTOS-Kernel/tasks.c source/FreeRTOS-Kernel/timers.c source/devices/ILI9341/format_string.c source/devices/ILI9341/ili9341.c source/devices/ILI9341/ili9341_test.c source/task_main.c source/task_statistic.c source/task_display.c source/task_test.c source/main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o ${OBJECTDIR}/source/configurations/freertos_hooks.o ${OBJECTDIR}/source/hardwares/can2.o ${OBJECTDIR}/source/hardwares/core_timer.o ${OBJECTDIR}/source/hardwares/gpio.o ${OBJECTDIR}/source/hardwares/spi.o ${OBJECTDIR}/source/hardwares/system.o ${OBJECTDIR}/source/hardwares/tim2.o ${OBJECTDIR}/source/hardwares/tim3.o ${OBJECTDIR}/source/hardwares/can1.o ${OBJECTDIR}/source/hardwares/trng.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o ${OBJECTDIR}/source/devices/ILI9341/format_string.o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o ${OBJECTDIR}/source/task_main.o ${OBJECTDIR}/source/task_statistic.o ${OBJECTDIR}/source/task_display.o ${OBJECTDIR}/source/task_test.o ${OBJECTDIR}/source/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d ${OBJECTDIR}/source/configurations/freertos_hooks.o.d ${OBJECTDIR}/source/hardwares/can2.o.d ${OBJECTDIR}/source/hardwares/core_timer.o.d ${OBJECTDIR}/source/hardwares/gpio.o.d ${OBJECTDIR}/source/hardwares/spi.o.d ${OBJECTDIR}/source/hardwares/system.o.d ${OBJECTDIR}/source/hardwares/tim2.o.d ${OBJECTDIR}/source/hardwares/tim3.o.d ${OBJECTDIR}/source/hardwares/can1.o.d ${OBJECTDIR}/source/hardwares/trng.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d ${OBJECTDIR}/source/task_main.o.d ${OBJECTDIR}/source/task_statistic.o.d ${OBJECTDIR}/source/task_display.o.d ${OBJECTDIR}/source/task_test.o.d ${OBJECTDIR}/source/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o ${OBJECTDIR}/source/configurations/freertos_hooks.o ${OBJECTDIR}/source/hardwares/can2.o ${OBJECTDIR}/source/hardwares/core_timer.o ${OBJECTDIR}/source/hardwares/gpio.o ${OBJECTDIR}/source/hardwares/spi.o ${OBJECTDIR}/source/hardwares/system.o ${OBJECTDIR}/source/hardwares/tim2.o ${OBJECTDIR}/source/hardwares/tim3.o ${OBJECTDIR}/source/hardwares/can1.o ${OBJECTDIR}/source/hardwares/trng.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o ${OBJECTDIR}/source/devices/ILI9341/format_string.o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o ${OBJECTDIR}/source/task_main.o ${OBJECTDIR}/source/task_statistic.o ${OBJECTDIR}/source/task_display.o ${OBJECTDIR}/source/task_test.o ${OBJECTDIR}/source/main.o

# Source Files
SOURCEFILES=source/configurations/stdio/xc32_monitor.c source/configurations/freertos_hooks.c source/hardwares/can2.c source/hardwares/core_timer.c source/hardwares/gpio.c source/hardwares/spi.c source/hardwares/system.c source/hardwares/tim2.c source/hardwares/tim3.c source/hardwares/can1.c source/hardwares/trng.c source/FreeRTOS-Kernel/portable/MemMang/heap_1.c source/FreeRTOS-Kernel/portable/PIC32MZ/port.c source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S source/FreeRTOS-Kernel/croutine.c source/FreeRTOS-Kernel/event_groups.c source/FreeRTOS-Kernel/list.c source/FreeRTOS-Kernel/queue.c source/FreeRTOS-Kernel/stream_buffer.c source/FreeRTOS-Kernel/tasks.c source/FreeRTOS-Kernel/timers.c source/devices/ILI9341/format_string.c source/devices/ILI9341/ili9341.c source/devices/ILI9341/ili9341_test.c source/task_main.c source/task_statistic.c source/task_display.c source/task_test.c source/main.c



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
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  .generated_files/flags/default/4d9652b884219b65da19ca922477b13cfc8d7910 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"source/configurations" -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  -DXPRJ_default=$(CND_CONF)    -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port_asm.S  .generated_files/flags/default/b854a03ef50befaf058e388c6426c572e50f3b06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o: source/configurations/stdio/xc32_monitor.c  .generated_files/flags/default/f1aa8417b08d81edfce28472f7b6d1296dfd4c8b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations/stdio" 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o source/configurations/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/configurations/freertos_hooks.o: source/configurations/freertos_hooks.c  .generated_files/flags/default/1614b1c1298abb9564fd25a23e4620c3d62f1491 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations" 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/freertos_hooks.o.d" -o ${OBJECTDIR}/source/configurations/freertos_hooks.o source/configurations/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can2.o: source/hardwares/can2.c  .generated_files/flags/default/1c194b567ce05ffc104a78870ef60b7b30df6e29 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can2.o.d" -o ${OBJECTDIR}/source/hardwares/can2.o source/hardwares/can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/core_timer.o: source/hardwares/core_timer.c  .generated_files/flags/default/130ad248deb3801948b7d66c032f1b4b92894f96 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/core_timer.o.d" -o ${OBJECTDIR}/source/hardwares/core_timer.o source/hardwares/core_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/gpio.o: source/hardwares/gpio.c  .generated_files/flags/default/e6152b8432fac192cdfad977aa8412692c2666ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/gpio.o.d" -o ${OBJECTDIR}/source/hardwares/gpio.o source/hardwares/gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/spi.o: source/hardwares/spi.c  .generated_files/flags/default/10d90c48d50fb19789c481d930f5f0af011b44c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/spi.o.d" -o ${OBJECTDIR}/source/hardwares/spi.o source/hardwares/spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/system.o: source/hardwares/system.c  .generated_files/flags/default/c23095053be6b91635afec426f95c53a746d45ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/system.o.d" -o ${OBJECTDIR}/source/hardwares/system.o source/hardwares/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim2.o: source/hardwares/tim2.c  .generated_files/flags/default/ca6a881330ca7349bd44cc5d461789505864dfac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim2.o.d" -o ${OBJECTDIR}/source/hardwares/tim2.o source/hardwares/tim2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim3.o: source/hardwares/tim3.c  .generated_files/flags/default/5cad916e2dc8e7eae57d0874a0386e461c7fbe78 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim3.o.d" -o ${OBJECTDIR}/source/hardwares/tim3.o source/hardwares/tim3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can1.o: source/hardwares/can1.c  .generated_files/flags/default/4b169cce58ba2f34213b9acd4eea52384bdcac2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can1.o.d" -o ${OBJECTDIR}/source/hardwares/can1.o source/hardwares/can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/trng.o: source/hardwares/trng.c  .generated_files/flags/default/4df031284f49629315fb896b7fdfd4be4aebe512 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/trng.o.d" -o ${OBJECTDIR}/source/hardwares/trng.o source/hardwares/trng.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o: source/FreeRTOS-Kernel/portable/MemMang/heap_1.c  .generated_files/flags/default/2b9b6b0a53103ea8999583403cd8877b9df377ef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o source/FreeRTOS-Kernel/portable/MemMang/heap_1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port.c  .generated_files/flags/default/341b042f7642396dd299709cde91fcebfc613f5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o source/FreeRTOS-Kernel/portable/PIC32MZ/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o: source/FreeRTOS-Kernel/croutine.c  .generated_files/flags/default/58b7726ea40dc1ab885042f825454e23938c4cc8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o source/FreeRTOS-Kernel/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o: source/FreeRTOS-Kernel/event_groups.c  .generated_files/flags/default/471d02576bc9a60dd0c6e7f1cf304f38dd3915f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o source/FreeRTOS-Kernel/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/list.o: source/FreeRTOS-Kernel/list.c  .generated_files/flags/default/f56048eb2dc8fb72c12e15fa67b1df95938737d8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o source/FreeRTOS-Kernel/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o: source/FreeRTOS-Kernel/queue.c  .generated_files/flags/default/dabc82eb302f901cfe6b738e7002fd20ad283c4a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o source/FreeRTOS-Kernel/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o: source/FreeRTOS-Kernel/stream_buffer.c  .generated_files/flags/default/17c1c021858b7fcb61d4fa5fe6f8d39295743693 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o source/FreeRTOS-Kernel/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o: source/FreeRTOS-Kernel/tasks.c  .generated_files/flags/default/50e835332c84b3489f3aac0274c6c5f1d808063f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o source/FreeRTOS-Kernel/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o: source/FreeRTOS-Kernel/timers.c  .generated_files/flags/default/d9cc1a10c85915cc9745d1815bf536f34635f243 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o source/FreeRTOS-Kernel/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/format_string.o: source/devices/ILI9341/format_string.c  .generated_files/flags/default/5aef313cf8535e9ba5685afeede2d3b9b44f3010 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/format_string.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/format_string.o source/devices/ILI9341/format_string.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341.o: source/devices/ILI9341/ili9341.c  .generated_files/flags/default/66a7a94d31e190280c919a67309a0e57001ecd51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o source/devices/ILI9341/ili9341.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o: source/devices/ILI9341/ili9341_test.c  .generated_files/flags/default/527e0d153b00fa1087308969a3040cfcc3fadf32 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o source/devices/ILI9341/ili9341_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_main.o: source/task_main.c  .generated_files/flags/default/1246132e5f0eea35e55e840a1ba243607ac8d2bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_main.o.d 
	@${RM} ${OBJECTDIR}/source/task_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_main.o.d" -o ${OBJECTDIR}/source/task_main.o source/task_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_statistic.o: source/task_statistic.c  .generated_files/flags/default/a9d0a12313b42024980d60f144010034535314f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_statistic.o.d 
	@${RM} ${OBJECTDIR}/source/task_statistic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_statistic.o.d" -o ${OBJECTDIR}/source/task_statistic.o source/task_statistic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_display.o: source/task_display.c  .generated_files/flags/default/611038571cdd4ccd9190aafe3769ee21faef976f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_display.o.d 
	@${RM} ${OBJECTDIR}/source/task_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_display.o.d" -o ${OBJECTDIR}/source/task_display.o source/task_display.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_test.o: source/task_test.c  .generated_files/flags/default/70961c89fed41d1415a7a57398ba01cc85a34a31 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_test.o.d 
	@${RM} ${OBJECTDIR}/source/task_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_test.o.d" -o ${OBJECTDIR}/source/task_test.o source/task_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/main.o: source/main.c  .generated_files/flags/default/9642b6a206417657727959c8751d96c7add5060a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o: source/configurations/stdio/xc32_monitor.c  .generated_files/flags/default/2d62a6a18038f8403013eb4fb9fe690ca8c29574 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations/stdio" 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/source/configurations/stdio/xc32_monitor.o source/configurations/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/configurations/freertos_hooks.o: source/configurations/freertos_hooks.c  .generated_files/flags/default/5368e7d4bd297dcf973efc14585df64fd7ffbe4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/configurations" 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/source/configurations/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/configurations/freertos_hooks.o.d" -o ${OBJECTDIR}/source/configurations/freertos_hooks.o source/configurations/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can2.o: source/hardwares/can2.c  .generated_files/flags/default/6881485f4313c18cbdd29f1e33629bad228e3bc8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can2.o.d" -o ${OBJECTDIR}/source/hardwares/can2.o source/hardwares/can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/core_timer.o: source/hardwares/core_timer.c  .generated_files/flags/default/53e11e329e71f387a3f49ee6e538018602dc71eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/core_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/core_timer.o.d" -o ${OBJECTDIR}/source/hardwares/core_timer.o source/hardwares/core_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/gpio.o: source/hardwares/gpio.c  .generated_files/flags/default/38929dbaaa10d81dd07e0273a3f0353020f2aed7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/gpio.o.d" -o ${OBJECTDIR}/source/hardwares/gpio.o source/hardwares/gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/spi.o: source/hardwares/spi.c  .generated_files/flags/default/d7851890e968493d5bfe6deb7ff53a69b6156721 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/spi.o.d" -o ${OBJECTDIR}/source/hardwares/spi.o source/hardwares/spi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/system.o: source/hardwares/system.c  .generated_files/flags/default/705f1da50cb9e9fe96051c43ef01caf09ca48c41 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/system.o.d" -o ${OBJECTDIR}/source/hardwares/system.o source/hardwares/system.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim2.o: source/hardwares/tim2.c  .generated_files/flags/default/197fcd6f86544ec898677c53d5ce629e6720c870 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim2.o.d" -o ${OBJECTDIR}/source/hardwares/tim2.o source/hardwares/tim2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/tim3.o: source/hardwares/tim3.c  .generated_files/flags/default/d8c18b864754595b6bb8f4c96a6288477484235f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/tim3.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/tim3.o.d" -o ${OBJECTDIR}/source/hardwares/tim3.o source/hardwares/tim3.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/can1.o: source/hardwares/can1.c  .generated_files/flags/default/37600077d3c5193078b0aa0df25b3da8c88e4ad7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/can1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/can1.o.d" -o ${OBJECTDIR}/source/hardwares/can1.o source/hardwares/can1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/hardwares/trng.o: source/hardwares/trng.c  .generated_files/flags/default/3b2df800b5081a6e968ca87f56f0d54ef9a0f154 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/hardwares" 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o.d 
	@${RM} ${OBJECTDIR}/source/hardwares/trng.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/hardwares/trng.o.d" -o ${OBJECTDIR}/source/hardwares/trng.o source/hardwares/trng.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o: source/FreeRTOS-Kernel/portable/MemMang/heap_1.c  .generated_files/flags/default/8d03f7638cbdf38c89393552883628a218d2e65b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/MemMang/heap_1.o source/FreeRTOS-Kernel/portable/MemMang/heap_1.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o: source/FreeRTOS-Kernel/portable/PIC32MZ/port.c  .generated_files/flags/default/3bc28ac614696e93b8ab220d5ca34df292f49e0a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/portable/PIC32MZ/port.o source/FreeRTOS-Kernel/portable/PIC32MZ/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o: source/FreeRTOS-Kernel/croutine.c  .generated_files/flags/default/c3d8a888632cbb0b7057485d35afcd1810db1178 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/croutine.o source/FreeRTOS-Kernel/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o: source/FreeRTOS-Kernel/event_groups.c  .generated_files/flags/default/da1130af8d545fddb1cb306f660fc53e8a7d9ace .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/event_groups.o source/FreeRTOS-Kernel/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/list.o: source/FreeRTOS-Kernel/list.c  .generated_files/flags/default/ed4c4de82bd2b1885745e64c352762fb208ddc3a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/list.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/list.o source/FreeRTOS-Kernel/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o: source/FreeRTOS-Kernel/queue.c  .generated_files/flags/default/7392be6ec8c7e020d7ed76dfd59279eceead19dd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/queue.o source/FreeRTOS-Kernel/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o: source/FreeRTOS-Kernel/stream_buffer.c  .generated_files/flags/default/7cd53388fb2c5c83cc82eee0f8a4860afb8e4b07 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/stream_buffer.o source/FreeRTOS-Kernel/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o: source/FreeRTOS-Kernel/tasks.c  .generated_files/flags/default/177a5e3d33b72216cd2c2cfebd1bab8dc6868ed8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/tasks.o source/FreeRTOS-Kernel/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o: source/FreeRTOS-Kernel/timers.c  .generated_files/flags/default/d83eb0468d98036dfef15ed13adbf5a6fa8cf9b4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/FreeRTOS-Kernel" 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d 
	@${RM} ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o.d" -o ${OBJECTDIR}/source/FreeRTOS-Kernel/timers.o source/FreeRTOS-Kernel/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/format_string.o: source/devices/ILI9341/format_string.c  .generated_files/flags/default/f9ecd3a78c1c076a2c5beea1bf3c6b318d4cde99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/format_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/format_string.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/format_string.o source/devices/ILI9341/format_string.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341.o: source/devices/ILI9341/ili9341.c  .generated_files/flags/default/261869445e5690b0868ec5559b53a826228d1cad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341.o source/devices/ILI9341/ili9341.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o: source/devices/ILI9341/ili9341_test.c  .generated_files/flags/default/973a3c985a878d7c300302091fc65742022fc6e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source/devices/ILI9341" 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d 
	@${RM} ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o.d" -o ${OBJECTDIR}/source/devices/ILI9341/ili9341_test.o source/devices/ILI9341/ili9341_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_main.o: source/task_main.c  .generated_files/flags/default/9d081f0d934a21857a1c79b322cd0cce64ee763c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_main.o.d 
	@${RM} ${OBJECTDIR}/source/task_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_main.o.d" -o ${OBJECTDIR}/source/task_main.o source/task_main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_statistic.o: source/task_statistic.c  .generated_files/flags/default/5edecee8ddff294439ae0479c3e5fcd3e6484137 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_statistic.o.d 
	@${RM} ${OBJECTDIR}/source/task_statistic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_statistic.o.d" -o ${OBJECTDIR}/source/task_statistic.o source/task_statistic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_display.o: source/task_display.c  .generated_files/flags/default/e50bd997fe432e0d2e9ef27b2ba2c1183599b43b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_display.o.d 
	@${RM} ${OBJECTDIR}/source/task_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_display.o.d" -o ${OBJECTDIR}/source/task_display.o source/task_display.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/task_test.o: source/task_test.c  .generated_files/flags/default/8f6f0a1d7168e9ba0a1c36245031da68de3e1286 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/task_test.o.d 
	@${RM} ${OBJECTDIR}/source/task_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"source/configurations" -I"source/configurations/stdio" -I"source/FreeRTOS-Kernel/include" -I"source/FreeRTOS-Kernel/portable/MemMang" -I"source/FreeRTOS-Kernel/portable/PIC32MZ" -I"source/FreeRTOS-Kernel" -I"source/hardwares" -I"source/devices/ILI9341" -I"source" -MP -MMD -MF "${OBJECTDIR}/source/task_test.o.d" -o ${OBJECTDIR}/source/task_test.o source/task_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/source/main.o: source/main.c  .generated_files/flags/default/969d96f1286e8a76dd2d81bd76c8d51a706c465c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
