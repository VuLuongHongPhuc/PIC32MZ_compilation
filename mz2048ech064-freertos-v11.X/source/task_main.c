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

/*** Include ******************************************************************/

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#include "FreeRTOS.h"
#include "task.h"

#include "task_main.h"
#include "gpio.h"

//#include "can2.h"
//#include "can_common.h"

/*** Variables ****************************************************************/
TaskHandle_t xTask_Main;


/*** Prototypes ************************************************************* */


/*
void CAN2_RxEventHandler(uintptr_t context)
{
    (void)context;
    
    uint32_t id;
    uint8_t length = 0;
    uint8_t data[8] = {0};
    //uint16_t *timestamp;
    CAN_MSG_RX_ATTRIBUTE msgAttr = CAN_MSG_RX_REMOTE_FRAME;
    
    (void)CAN2_Read(&id, &length, data, NULL, &msgAttr);
    if (msgAttr == CAN_MSG_RX_DATA_FRAME)
    {
        data[7] = 2;
    }
}
*/


void MAIN_Task( void *pvParameters  )
{
    /*
    uint32_t id = 0x01023;
    uint8_t length = 2;
    uint8_t data[8] = {0x31, 0x33, 2, 3, 4, 5, 6};
    CAN_MSG_TX_ATTRIBUTE msgAttr = CAN_MSG_RX_DATA_FRAME;
    */
    //CAN2_Initialize();
    //CAN2_RxCallbackRegister(CAN2_RxEventHandler, (uintptr_t) NULL);

    while(true)
    {
        // OK

        LED_2_Toggle();
        //RB10_Toggle();

        vTaskDelay(1000U / portTICK_PERIOD_MS);
        
        //(void)CAN2_Write(id, length, data, msgAttr);
    }
}


// #define STACK_SIZE configMINIMAL_STACK_SIZE
// StaticTask_t xTaskBuffer;
// static StackType_t xStack[ STACK_SIZE ];
// void vTaskCode( void * pvParameters )
// {
//     /* The parameter value is expected to be 1 as 1 is passed in the
//     pvParameters value in the call to xTaskCreateStatic(). */
//     configASSERT( ( uint32_t ) pvParameters == 1UL );

//     for( ;; )
//     {
//         /* Task code goes here. */
        
//         LED_3_Toggle();

//         vTaskDelay(500U / portTICK_PERIOD_MS);
//     }
// }
// TaskHandle_t xHandle = NULL;
    
    // /* Create the task without using any dynamic memory allocation. */
    // xHandle = xTaskCreateStatic(
    //               vTaskCode,       /* Function that implements the task. */
    //               "NAME",          /* Text name for the task. */
    //               STACK_SIZE,      /* Number of indexes in the xStack array. */
    //               ( void * ) 1,    /* Parameter passed into the task. */
    //               configMAX_PRIORITIES -1,               /* Priority at which the task is created. */
    //               xStack,          /* Array to use as the task's stack. */
    //               &xTaskBuffer );  /* Variable to hold the task's data structure. */
    /* puxStackBuffer and pxTaskBuffer were not NULL, so the task will have
    been created, and xHandle will be the task's handle.  Use the handle
    to suspend the task. */
    //vTaskSuspend( xHandle );

/* *****************************************************************************
 End of File
 */
