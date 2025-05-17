/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/**** SYSTEM ******************************************
 **** DEPRICATED ****
 * OSCILLATOR EXTERN  : EC 24 MHz
 * SYSTEM CLOCK       : 100 MHz
 * PERIPHERAL CLOCK   : see SYS_Clock() - system.c
*/

// PIC32MZ2048ECH064 Configuration Bit Settings

// 'C' source line config statements

// DEVCFG3
// USERID = No Setting to use the RF3 as pin IO
#pragma config FMIIEN   = OFF           // Ethernet RMII/MII Enable (RMII Enabled)
#pragma config FETHIO   = OFF           // Ethernet I/O Pin Select (Alternate Ethernet I/O)
#pragma config PGL1WAY  = OFF           // Permission Group Lock One Way Configuration (Allow multiple reconfigurations)
#pragma config PMDL1WAY = OFF           // Peripheral Module Disable Configuration (Allow multiple reconfigurations)
#pragma config IOL1WAY  = OFF           // Peripheral Pin Select Configuration (Allow multiple reconfigurations)
#pragma config FUSBIDIO = OFF           // USB USBID Selection (Controlled by Port Function)

// DEVCFG2
#pragma config FPLLIDIV = DIV_3         // System PLL Input Divider (3x Divider)
#pragma config FPLLRNG = RANGE_21_42_MHZ // System PLL Input Range (21-42 MHz Input)
#pragma config FPLLICLK = PLL_POSC      // System PLL Input Clock Selection (Extern EC is input to the System PLL)
#pragma config FPLLMULT = MUL_50        // System PLL Multiplier (PLL Multiply by 50)
#pragma config FPLLODIV = DIV_4         // System PLL Output Clock Divider (4x Divider)
#pragma config UPLLFSEL = FREQ_24MHZ    // USB PLL Input Frequency Selection (USB PLL input is 24 MHz)
#pragma config UPLLEN = ON              // USB PLL Enable (USB PLL is enabled)

// DEVCFG1
#pragma config FNOSC = SPLL             // Oscillator Selection Bits (System PLL)
#pragma config DMTINTV = WIN_127_128    // DMT Count Window Interval (Window/Interval value is 127/128 counter value)
#pragma config FSOSCEN = OFF            // Secondary Oscillator Enable (Disable SOSC)
#pragma config IESO = OFF               // Internal/External Switch Over (Disabled)
#pragma config POSCMOD = EC             // Primary Oscillator Configuration (Primary osc disabled)
#pragma config OSCIOFNC = OFF           // CLKO Output Signal Active on the OSCO Pin (Disabled)
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor Selection (Clock Switch Disabled, FSCM Disabled)
#pragma config WDTPS = PS1048576        // Watchdog Timer Postscaler (1:1048576)
#pragma config WDTSPGM = STOP           // Watchdog Timer Stop During Flash Programming (WDT stops during Flash programming)
#pragma config WINDIS = NORMAL          // Watchdog Timer Window Mode (Watchdog Timer is in non-Window mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (WDT Disabled)
#pragma config FWDTWINSZ = WINSZ_25     // Watchdog Timer Window Size (Window size is 25%)
#pragma config DMTCNT = DMT31           // Deadman Timer Count Selection (2^31 (2147483648))
#pragma config FDMTEN = OFF             // Deadman Timer Enable (Deadman Timer is disabled)

// DEVCFG0         
#pragma config DEBUG = OFF              // Background Debugger Enable (Debugger is disabled)
#pragma config JTAGEN = OFF             // JTAG Enable (JTAG Disabled)
#pragma config ICESEL = ICS_PGx1        // ICE/ICD Comm Channel Select (Communicate on PGEC1/PGED1)
#pragma config TRCEN = OFF              // Trace Enable (Trace features in the CPU are disabled)
#pragma config BOOTISA = MIPS32         // Boot ISA Selection (Boot code and Exception code is MIPS32)
#pragma config FECCCON = OFF_UNLOCKED   // Dynamic Flash ECC Configuration (ECC and Dynamic ECC are disabled (ECCCON bits are writable))
#pragma config FSLEEP = OFF             // Flash Sleep Mode (Flash is powered down when the device is in Sleep mode)
#pragma config DBGPER = PG_ALL          // Debug Mode CPU Access Permission (Allow CPU access to all permission regions)
#pragma config EJTAGBEN = NORMAL        // EJTAG Boot (Normal EJTAG functionality)

// DEVCP0
#pragma config CP = OFF                 // Code Protect (Protection Disabled)

// SEQ0
//#pragma config TSEQ =       0xffff
//#pragma config CSEQ =       0x0

// DEVADC1

// DEVADC2

// DEVADC3

// DEVADC4

// DEVADC5

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.




/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */


#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE

#include "xc.h"
//#include <sys/attribs.h>

#include "FreeRTOS.h"
#include "task.h"

#include "main.h"
#include "system.h"   // SYS function
#include "gpio.h"
#include "core_timer.h"
#include "tim2.h"

#include "task_main.h"
#include "task_statistic.h"
#include "task_display.h"


/* Variables ********************************************************/
extern TaskHandle_t xTask_Main;


/* This function is called at specified periodic interval */
void CORETIMER_EventHandler(uintptr_t context)
{
    // dummy
    (void)context;

    // 1000 ms OK
}


void TMR2_EventHandler(uint32_t status, uintptr_t context)
{
    // dummy
    (void)status;
    (void)context;
    
    // 1 ms - OK
}


int main(void)
{
    /*** initialize */ 
    SYS_Initialize();                /* system */
    GPIO_init();                     /* GPIO */
    CORETIMER_Initialize(1000);      /* CORE timer */
    TMR2_Initialize();               /* timers 2 */
    
    /*** Set callback */
    CORETIMER_CallbackRegister(CORETIMER_EventHandler, (uintptr_t) NULL); /* CORETIMER Register */
    TMR2_CallbackRegister(TMR2_EventHandler, (uintptr_t) NULL);           /* TIM Register */
    
    /* start timers */
    TMR2_Start();
    
    /*** RTOS section */
    
    // static task create
    // https://www.freertos.org/a00110.html#configKERNEL_PROVIDED_STATIC_MEMORY
    
        
    (void) xTaskCreate((TaskFunction_t) MAIN_Task,  /*!< Pointer to the task entry function */
                "Main",                              /*!< Task name */
                1024,                                /*!< Stack size (not bytes!) -> system 32bits => 1024 x4 = 4096 bytes */
                NULL,                                /*!< Parameter */
                configMAX_PRIORITIES - 1,            /*!< Task priority level */
                &xTask_Main);                        /*!< Used to pass a handle to the created task out of the xTaskCreate() function */
    
    (void) xTaskCreate((TaskFunction_t) STATISTIC_Task,
                "Statistic",
                256,
                ( void * ) 1,
                1,
                (TaskHandle_t*)NULL );
    
#define DISPLAY_ILI9341 1
#if (DISPLAY_ILI9341 == 1)    
    (void) xTaskCreate((TaskFunction_t) DISPLAY_Task,
                "Display",
                256,
                NULL,
                1,
                (TaskHandle_t*)NULL);
#endif
    
    /* Start RTOS Scheduler. */
    
     /**********************************************************************
     * Create all Threads for APP Tasks before starting FreeRTOS Scheduler *
     ***********************************************************************/
    vTaskStartScheduler(); /* This function never returns. */
    
    
    /* infinit loop */
    while(1)
    {  
    }
    
    return ( EXIT_FAILURE );
}


/* *****************************************************************************
 End of File
 */
