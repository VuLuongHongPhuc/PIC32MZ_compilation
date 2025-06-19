
#include "FreeRTOS.h"
#include "task.h"

#include "./config/default/peripheral/can/plib_can1.h"
#include "peripheral/gpio/plib_gpio.h"


#define DEF_TICK_READ		(1000 * portTICK_RATE_MS)

//static void Can1RxCallback (uintptr_t contextHandle)
static void Can1RxCallback (void)
{
    //(void*)contextHandle;
    
    uint32_t id;
    uint8_t length;
    uint8_t data[8];
    uint16_t timestamp;
    uint8_t fifoNum = 1;// receive fifo
    CAN_MSG_RX_ATTRIBUTE msgAttr;
    
    if (CAN1_MessageReceive(&id, &length, data, &timestamp, fifoNum, &msgAttr))
    {
        /* Something received */
        LED_3_Toggle();
    }
}

void TEST_Task(void)
{
    static portTickType last_read_tick = 0;
    uint32_t id = 0x1F000DA;
    uint8_t length = 8;
    uint8_t data[8] = {0,1,2,3,4,5,6,7};
    uint8_t fifoNum = 0; // transmit fifo
    CAN_MSG_TX_ATTRIBUTE msgAttr = CAN_MSG_TX_DATA_FRAME;
    

    /* Set callback for Rx - don't work */
    //CAN1_CallbackRegister(Can1RxCallback, 1, 1);
    
    if ((xTaskGetTickCount() - last_read_tick) > DEF_TICK_READ)
    {
        // OK
        
        /* Update current time tick */
        last_read_tick = xTaskGetTickCount();

        /* Transmit CAN message test */
        CAN1_MessageTransmit(id, length, data, fifoNum, msgAttr);        
        Can1RxCallback();
    }
    
}


/* *****************************************************************************
 End of File
 */
