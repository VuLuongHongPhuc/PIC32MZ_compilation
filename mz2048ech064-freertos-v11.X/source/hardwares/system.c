


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include "system.h"
#include "xc.h"
//#include <p32xxxx.h>


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

void SYS_Clock(void);


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

void SYS_Initialize(void)
{
    /* Interrupts must be disabled when enabling the Prefetch Cache Module */
    // ---> disable IT
    __builtin_mtc0(_CP0_STATUS, _CP0_STATUS_SELECT,(__builtin_mfc0(_CP0_STATUS, _CP0_STATUS_SELECT) & 0xFFFFFFFE));
    
    SYS_Clock();
    
    /* Configure Prefetch, Wait States and ECC */
    PRECONbits.PREFEN = 3;
    PRECONbits.PFMWS = 1;
    CFGCONbits.ECCCON = 3;
    
    // Data Memory SRAM wait states: Default Setting = 1; set it to 0
    //BMXCONbits.BMXWSDRM = 0;
    
    // disable JTAG port, normalement deja disable
    //DDPCONbits.JTAGEN = 0;
    
// *** interrupt **********************
    
    // 0: Interrupt controller configured for Single-vectored mode
    // 1: Interrupt controller configured for Multi-vectored mode
    INTCONbits.MVEC = 1;
    
    // Interrupt Proximity Timer Control bits
    //INTCONbits.TPC = 0; //default disable

    
    // ---> enable IT
    // doit avoir IE=1 EXL=0 ERL=0 DM=0 pour que l'interrupt soit actif
    __builtin_mtc0(_CP0_STATUS, _CP0_STATUS_SELECT,(__builtin_mfc0(_CP0_STATUS, _CP0_STATUS_SELECT) | 0x0001));
}


void SYS_Clock(void)
{
    /* PBxDIV : PERIPHERAL BUS ?x? CLOCK DIVISOR CONTROL REGISTER */
    
    /* PBCLK1: OSC2 */
    //PB2DIVbits.ON !                  /*!< The clock for peripheral bus 1 cannot be turned off */
    while(PB1DIVbits.PBDIVRDY == 0);
    PB1DIVbits.PBDIV = 1;              /*!< PBCLK1 is SYSCLK divided by 2 (default value=1)*/
    
    /* PBCLK2: PMP, I2C, UART, SPI */
    /* PB2DIVbits.ON default ON */
    if (PB2DIVbits.ON)
    {
        while(PB2DIVbits.PBDIVRDY == 0);
        PB2DIVbits.PBDIV = 1;              /*!< PBCLK2 is SYSCLK divided by 2 (default value=1)*/
    }
    
    /* PBCLK3: ADC, CMP, Timers, Output compare, Input compare */
    if (PB3DIVbits.ON)
    {
        while(PB3DIVbits.PBDIVRDY == 0);
        PB3DIVbits.PBDIV = 1;              /*!< PBCLK3 is SYSCLK divided by 2 (default value=1)*/
    }
    
    /* PBCLK4: Ports */
    if (PB4DIVbits.ON)
    {
        while(PB4DIVbits.PBDIVRDY == 0);
        PB4DIVbits.PBDIV = 1;             /*!< PBCLK4 is SYSCLK divided by 2 (default value=1)*/
    }
    
    /* PBCLK5 : Flash, Crypto, CAN, Ethernet, SQI */
    if (PB5DIVbits.ON)
    {
        while(PB5DIVbits.PBDIVRDY == 0);
        PB5DIVbits.PBDIV = 1;             /*!< PBCLK5 is SYSCLK divided by 2 (default value=1)*/
    }
    
    /* PBCLK7: CPU, Deadman Timer */
    if (PB7DIVbits.ON)
    {
        while(PB7DIVbits.PBDIVRDY == 0);
        PB7DIVbits.PBDIV = 0;              /*!< PBCLK7 is SYSCLK (default value=0)*/
    }
    
    /* PBCLK8: EBI */
    if (PB8DIVbits.ON)
    {
        while(PB8DIVbits.PBDIVRDY == 0);
        PB8DIVbits.PBDIV = 1;              /*!< PBCLK8 is SYSCLK divided by 2 (default value=1)*/
    }
}


/*EOF*/
