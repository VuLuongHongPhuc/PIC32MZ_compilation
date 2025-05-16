


//#include <stdbool.h>

#include "FreeRTOS.h"
#include "task.h"

#include "task_display.h"
#include "gpio.h"
#include "spi.h"
#include "ili9341.h"
#include "ili9341_test.h"


/*** Variables ****************************************************************/



/*** SPI entries function *****************************************************/
static inline void SPI_ChipSelectSignal(uint8_t state)
{
    /* RD9 */
    LATDbits.LATD9 = state;
}

static inline void SPI_ResetSignal(uint8_t state)
{
    /* RD10 */
    LATDbits.LATD10 = state;
}

static inline void SPI_DCSignal(uint8_t state)
{
    /* RD11 */
    LATDbits.LATD11 = state;
}

static inline void SPI_LEDSignal(uint8_t state)
{
    /* RD0 */
    LATDbits.LATD0 = state;
}


/*** Display screen task ******************************************************/

void DISPLAY_Task( void *pvParameters  )
{
    uint8_t index = 0;
    SPI_InterfaceStruct driver = {
        .CS = &SPI_ChipSelectSignal,
        .Reset = &SPI_ResetSignal,
        .DC = &SPI_DCSignal,
        .Led = &SPI_LEDSignal,
        .Write = &SPI1_Write,
        .Delay = &vTaskDelay
    }; 
    
    SPI1_Initialize();
    ILI9341_Initialize(&driver);
    
    /* fixe screen */
    //ILI9341_TEST_Text();
    while(1)
    {
        // OK
        
        LED_2_Toggle();
        
        vTaskDelay(1000U / portTICK_PERIOD_MS);
        
        if (index > 12) index = 0;
        ILI9341_TEST_Sequence(index++);
        
    }
}

/* *****************************************************************************
 End of File
 */
