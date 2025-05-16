/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _GPIO_INIT_H    /* Guard against multiple inclusion */
#define _GPIO_INIT_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */




/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    /* NOTES:
     * CNPUx pull-up 0:disable 1:enable (mettre disable si pin en output) (default=0)
     * ANSELx = AD1PCFG register 1:analog 0:digital (=1 si A/D module off) (default=1)
     * ODCx open drain configuration 0:drive 1:open drain (default=0)
     * SRCON0x Slew Rate Control register. exist?
     * SRCON1x Slew Rate Control register; exist?
     * SLEEP ? how to configure
     * SYSCLK dependency
     * 
     * ATOMIC bit manipulation:
     * TRISxSET
     * PORTxCLR
     * LATxINV
    */   
    
    
/**** DEF *******************************************/
    
    /* signal : LATx/PORTx */
    #define HIGH 1
    #define LOW  0

    /* mode : TRISx*/
    #define OUTPUT_PIN   0
    #define INPUT_PIN    1

    /* PULL UP : CNPUx*/
    #define CNPU_PULLUP_ENABLE 1
    #define CNPU_PULLUP_DISABLE 0

    /* ANALOG / DIGITAL : ANSELx*/
    #define AD_DIGITAL 0
    #define AD_ANALOG  1
    
    
    
/**** LED *****************************************************************/
/* TRISx, LATx, */ 
    

//pin 38 RF3 - also use for USBID -> need to desactivate to use in I/O mode
#define LED_1       LATFbits.LATF3  // ambre
//#define LED_1_Port_Mask  0x0008 // bit.3
#define PIN_F3_Mask               (1U<<3) // bit.3
#define LED_1_OutputEnable()      (TRISFCLR = (1U<<3))
#define LED_1_InputEnable()       (TRISFSET = (1U<<3))
#define LED_1_Set()               (LATFSET  = PIN_F3_Mask)
#define LED_1_Clear()             (LATFCLR  = PIN_F3_Mask)
#define LED_1_Toggle()            (PORTFINV = PIN_F3_Mask)
#define LED_1_Get()               ((PORTF >> 3) & 0x1U)


//pin 41 RF4
#define PIN_F4_Mask               (1U<<4) // bit.4
#define LED_2_OutputEnable()      (TRISFCLR = PIN_F4_Mask)
#define LED_2_InputEnable()       (TRISFSET = PIN_F4_Mask)
#define LED_2_Set()               (LATFSET  = PIN_F4_Mask)
#define LED_2_Clear()             (LATFCLR  = PIN_F4_Mask)
#define LED_2_Toggle()            (PORTFINV = PIN_F4_Mask)
#define LED_2_Get()               ((PORTF >> 4) & 0x1U)


//pin 42 RF5
#define LED_3_OutputEnable()      (TRISFbits.TRISF5 = OUTPUT_PIN)
#define LED_3       LATFbits.LATF5  // blue
#define LED_3_Set()     (LED_3 = 1)
#define LED_3_Clear()   (LED_3 = 0)
#define LED_3_Toggle()  (LED_3 ^= 1)
    
    
//RB10
#define RB10_Mask                (1U<<10)
#define RB10_OutputEnable()      (TRISBCLR = RB10_Mask)//(TRISBbits.TRISB10=OUTPUT_PIN) //
#define RB10_InputEnable()       (TRISBSET = RB10_Mask)
#define RB10_Set()               (LATBSET  = RB10_Mask)
#define RB10_Clear()             (LATBCLR  = RB10_Mask)
#define RB10_Toggle()            (PORTBINV = RB10_Mask)//(LATBbits.LATB10 ^= 1)// speed switch effect?
    
/**** SWITCH / BOUTON *********************************************************/
/* PORTx, TRISx */

#define BTN_IGNORE_FACTOR 10

//pin 1
//#define SW1_set_tris()    TRISBbits.TRISB=INPUT_PIN
#define SW1         PORTEbits.RE5
#define SW1_Read()  SW1
    
/*** ILI9143 screen 240x320 ***************************************************/
#define RD9_Mask                (1U << 9)
#define SPI_CS_OutputEnable()   (TRISDCLR = RD9_Mask)
#define SPI_CS_Set()            (LATDSET  = RD9_Mask)
#define SPI_CS_Clear()          (LATDCLR  = RD9_Mask)

#define RD10_Mask                 (1U << 10)
#define SPI_Reset_OutputEnable()  (TRISDCLR = RD10_Mask)
#define SPI_Reset_Set()           (LATDSET  = RD10_Mask)
#define SPI_Reset_Clear()         (LATDCLR  = RD10_Mask)
    
#define RD11_Mask                 (1U << 11)
#define SPI_DC_OutputEnable()     (TRISDCLR = RD11_Mask)
#define SPI_DC_Set()              (LATDSET  = RD11_Mask)
#define SPI_DC_Clear()            (LATDCLR  = RD11_Mask)
    
#define RD0_Mask                   (1U << 0)
#define SPI_LED_OutputEnable()     (TRISDCLR = RD0_Mask)
#define SPI_LED_Set()              (LATDSET  = RD0_Mask)
#define SPI_LED_Clear()            (LATDCLR  = RD0_Mask) 
    
/**** Global Function *********************************************************/
    void GPIO_init(void);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _GPIO_INIT_H */

/* *****************************************************************************
 End of File
 */
