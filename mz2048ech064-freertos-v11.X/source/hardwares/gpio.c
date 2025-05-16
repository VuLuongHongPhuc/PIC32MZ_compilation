
#include "xc.h"

#include "gpio.h"


void GPIO_init(void)
{
/*** Set mode : input/output **************************************************/

    /* LED */
    LED_1_OutputEnable(); // Ambre
    LED_2_OutputEnable(); // Green
    LED_3_OutputEnable(); // Blue
    
    /* LED default init */
    LED_1_Set(); // Ambre
    LED_2_Set(); // Green
    LED_3_Set(); // Blue
    
    
    /* OUTPUT */
    RB10_OutputEnable();
    // switch speed ?
    
    /* SWITCH / BUTTON */
    ANSELEbits.ANSE5 = AD_DIGITAL;
    TRISEbits.TRISE5 = INPUT_PIN;
    CNPUEbits.CNPUE5 = CNPU_PULLUP_ENABLE;
   
    
    /* ILI9143 LCD */
    SPI_CS_OutputEnable();
    SPI_Reset_OutputEnable();
    SPI_DC_OutputEnable();
    SPI_LED_OutputEnable();
    //ANSELD = 0;
}

/*EOF*/
