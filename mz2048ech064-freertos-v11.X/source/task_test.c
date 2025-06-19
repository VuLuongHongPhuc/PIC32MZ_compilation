
#include "FreeRTOS.h"
#include "task.h"

#include "gpio.h"



#define __TEST_CAN1__    1
#define __TEST_TRNG__    0

#if (__TEST_CAN1__ == 1)
    #include "can1.h"
#elif (__TEST_TRNG__ == 1)
    #include "trng.h"
#endif


#if (__TEST_CAN1__ == 1)
void CAN_RxEventHandler(uintptr_t context)
{
    (void)context;
    
    uint32_t id;
    uint8_t length = 0;
    uint8_t data[8] = {0};
    uint16_t *timestamp;
    CAN_MSG_RX_ATTRIBUTE msgAttr = CAN_MSG_RX_REMOTE_FRAME;
    
    (void)CAN1_Read(&id, &length, data, NULL, &msgAttr);
    if (msgAttr == CAN_MSG_RX_DATA_FRAME)
    {
        data[7] = 2;
    }
    
    LED_2_Set();
}
#endif


static void Initialize(void)
{
#if (__TEST_CAN1__ == 1)
    //CAN1_Initialize();
    CAN1_RxCallbackRegister(CAN_RxEventHandler, (uintptr_t) NULL);
#elif (__TEST_TRNG__ == 1)
    TRNG_Initialize();
#endif
    
}


/* @brief Statistic using "vTaskGetRunTimeStats"
 * @param pvParameters - callback data
 */
void TEST_Task( void *pvParameters )
{
    configASSERT( ( uint32_t ) pvParameters == 1UL );
    
#if (__TEST_CAN1__ == 1)
    uint32_t id = 0x1A001023;
    uint8_t length = 2;
    uint8_t data[8] = {0x31, 0x33, 2, 3, 4, 5, 6};
    CAN_MSG_TX_ATTRIBUTE msgAttr = CAN_MSG_TX_DATA_FRAME;
#elif (__TEST_TRNG__ == 1)
    uint32_t trng_value = 0;
#endif
    
    Initialize();
    
    LED_1_Clear();
    LED_2_Clear();
    //LED_3_Clear(); // use by main task
    
    while (1)
    {
        /* Delay to let the system run tasks */
        vTaskDelay(1000U / portTICK_PERIOD_MS);

#if (__TEST_CAN1__ == 1)
        if (C1CONbits.OPMOD == CAN_OPERATION_MODE)
        {
            (void)CAN1_Write(id, length, data, msgAttr);
            LED_1_Set();
        }
#elif (__TEST_TRNG__ == 1)
        //TRNG_WaitForCnt();
        trng_value = RNGNUMGEN1;
        trng_value = RNGNUMGEN2;
        trng_value = 0;
#endif
        
    }
}



/* *****************************************************************************
 End of File
 */
