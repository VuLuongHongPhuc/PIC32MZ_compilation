/*******************************************************************************
 * NOTE:
 * 
 * Do not use RF3 and USBID = OFF
 * 
 * voir usb_device_cdc.h L.740
 * 
 * https://developerhelp.microchip.com/xwiki/bin/view/software-tools/harmony/get-start-tm-drvr-middlware-freertos/
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "app.h"
#include "sys_tasks.h"  // freeRTOS

//#include "test_task.h"

#include "./config/default/peripheral/can/plib_can1.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

uint8_t CACHE_ALIGN switchPromptUSB[] = "\r\nPUSH BUTTON PRESSED";

uint8_t CACHE_ALIGN cdcReadBuffer[APP_READ_BUFFER_SIZE];
uint8_t CACHE_ALIGN cdcWriteBuffer[APP_READ_BUFFER_SIZE];

static uint32_t _countIncompletRx = 0;

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_DATA appData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* USER:  Add any necessary callback functions. */

/* @brief USB CDC Device Events - Application Event Handler
 * @param index
 * @param event
 * @param pData
 * @param userData
 */

USB_DEVICE_CDC_EVENT_RESPONSE APP_USBDeviceCDCEventHandler
(
    USB_DEVICE_CDC_INDEX index,
    USB_DEVICE_CDC_EVENT event,
    void * pData,
    uintptr_t userData
)
{
    APP_DATA * appDataObject;
    USB_CDC_CONTROL_LINE_STATE * controlLineStateData;
    USB_DEVICE_CDC_EVENT_DATA_READ_COMPLETE * eventDataRead;
    
    appDataObject = (APP_DATA *)userData;

    switch(event)
    {
        case USB_DEVICE_CDC_EVENT_GET_LINE_CODING:

            /* This means the host wants to know the current line
             * coding. This is a control transfer request. Use the
             * USB_DEVICE_ControlSend() function to send the data to
             * host.  */

            USB_DEVICE_ControlSend(appDataObject->deviceHandle,
                    &appDataObject->getLineCodingData, sizeof(USB_CDC_LINE_CODING));

            break;

        case USB_DEVICE_CDC_EVENT_SET_LINE_CODING:

            /* This means the host wants to set the line coding.
             * This is a control transfer request. Use the
             * USB_DEVICE_ControlReceive() function to receive the
             * data from the host */

            USB_DEVICE_ControlReceive(appDataObject->deviceHandle,
                    &appDataObject->setLineCodingData, sizeof(USB_CDC_LINE_CODING));

            break;

        case USB_DEVICE_CDC_EVENT_SET_CONTROL_LINE_STATE:

            /* This means the host is setting the control line state.
             * Read the control line state. We will accept this request
             * for now. */

            controlLineStateData = (USB_CDC_CONTROL_LINE_STATE *)pData;
            appDataObject->controlLineStateData.dtr = controlLineStateData->dtr;
            appDataObject->controlLineStateData.carrier = controlLineStateData->carrier;

            USB_DEVICE_ControlStatus(appDataObject->deviceHandle, USB_DEVICE_CONTROL_STATUS_OK);

            break;

        case USB_DEVICE_CDC_EVENT_SEND_BREAK:

            /* This means that the host is requesting that a break of the
             * specified duration be sent. Read the break duration */

            appDataObject->breakData = ((USB_DEVICE_CDC_EVENT_DATA_SEND_BREAK *)pData)->breakDuration;
            
            /* Complete the control transfer by sending a ZLP  */
            USB_DEVICE_ControlStatus(appDataObject->deviceHandle, USB_DEVICE_CONTROL_STATUS_OK);
            
            break;

        case USB_DEVICE_CDC_EVENT_READ_COMPLETE:

            /* This means that the host has sent some data*/
            eventDataRead = (USB_DEVICE_CDC_EVENT_DATA_READ_COMPLETE *)pData;
            
            if(eventDataRead->status != USB_DEVICE_CDC_RESULT_ERROR)
            {
                appDataObject->isReadComplete = true;
                
                appDataObject->numBytesRead = eventDataRead->length; 
            }
            break;

        case USB_DEVICE_CDC_EVENT_CONTROL_TRANSFER_DATA_RECEIVED:

            /* The data stage of the last control transfer is
             * complete. For now we accept all the data */

            USB_DEVICE_ControlStatus(appDataObject->deviceHandle, USB_DEVICE_CONTROL_STATUS_OK);
            break;

        case USB_DEVICE_CDC_EVENT_CONTROL_TRANSFER_DATA_SENT:

            /* This means the GET LINE CODING function data is valid. We don't
             * do much with this data in this demo. */
            break;

        case USB_DEVICE_CDC_EVENT_WRITE_COMPLETE:

            /* This means that the data write got completed. We can schedule
             * the next read. */

            appDataObject->isWriteComplete = true;
            break;

        default:
            break;
    }

    return USB_DEVICE_CDC_EVENT_RESPONSE_NONE;
}

/***********************************************
 * Application USB Device Layer Event Handler.
 ***********************************************/
void APP_USBDeviceEventHandler 
(
    USB_DEVICE_EVENT event, 
    void * eventData, 
    uintptr_t context 
)
{
    USB_DEVICE_EVENT_DATA_CONFIGURED *configuredEventData;

    switch(event)
    {
        case USB_DEVICE_EVENT_SOF:

            /* This event is used for switch debounce. This flag is reset
             * by the switch process routine. */
            appData.sofEventHasOccurred = true;
            
            break;

        case USB_DEVICE_EVENT_RESET:

            /* Update LED to show reset state */
            LED_2_Clear();

            appData.isConfigured = false;

            break;

        case USB_DEVICE_EVENT_CONFIGURED:

            /* Check the configuration. We only support configuration 1 */
            configuredEventData = (USB_DEVICE_EVENT_DATA_CONFIGURED*)eventData;
            
            if ( configuredEventData->configurationValue == 1)
            {
                /* Update LED to show configured state */
                LED_2_Set();
                
                /* Register the CDC Device application event handler here.
                 * Note how the appData object pointer is passed as the
                 * user data */

                USB_DEVICE_CDC_EventHandlerSet(USB_DEVICE_CDC_INDEX_0, APP_USBDeviceCDCEventHandler, (uintptr_t)&appData);

                /* Mark that the device is now configured */
                appData.isConfigured = true;
            }
            
            break;

        case USB_DEVICE_EVENT_POWER_DETECTED:

            /* VBUS was detected. We can attach the device */
            USB_DEVICE_Attach(appData.deviceHandle);
            
            break;

        case USB_DEVICE_EVENT_POWER_REMOVED:
            
            /* VBUS is not available. We can detach the device */
            USB_DEVICE_Detach(appData.deviceHandle);
            
            appData.isConfigured = false;
            
            LED_2_Clear();
            
            break;

        case USB_DEVICE_EVENT_SUSPENDED:

            /* Switch LED to show suspended state */
            LED_2_Clear();
            
            break;

        case USB_DEVICE_EVENT_RESUMED:
            /* Switch LED to show suspended state */
            LED_2_Set();
            
            break;
            
        case USB_DEVICE_EVENT_ERROR:
        default:
            
            break;
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


/*****************************************************
 * This function is called in every step of the
 * application state machine.
 *****************************************************/

bool APP_StateReset(void)
{
    /* This function returns true if the device
     * was reset  */

    bool retVal;

    if(appData.isConfigured == false)
    {
        appData.state = APP_STATE_WAIT_FOR_CONFIGURATION;
        appData.readTransferHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
        appData.writeTransferHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
        appData.isReadComplete = true;
        appData.isWriteComplete = true;
        retVal = true;
    }
    else
    {
        retVal = false;
    }

    return(retVal);
}


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;



    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
    
    /* Device Layer Handle  */
    appData.deviceHandle = USB_DEVICE_HANDLE_INVALID ;

    /* Device configured status */
    appData.isConfigured = false;

    /* Initial get line coding state */
    appData.getLineCodingData.dwDTERate = 9600;
    appData.getLineCodingData.bParityType = 0;
    appData.getLineCodingData.bParityType = 0;
    appData.getLineCodingData.bDataBits = 8;

    /* Read Transfer Handle */
    appData.readTransferHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;

    /* Write Transfer Handle */
    appData.writeTransferHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;

    /* Initialize the read complete flag */
    appData.isReadComplete = true;

    /*Initialize the write complete flag*/
    appData.isWriteComplete = true;

    /* Reset other flags */
    appData.sofEventHasOccurred = false;
    
    /* Set up the read buffer */
    appData.cdcReadBuffer = &cdcReadBuffer[0];

    /* Set up the read buffer */
    appData.cdcWriteBuffer = &cdcWriteBuffer[0];  
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    static CAN_USB_DATA_TRANSFER canRx;
    static CAN_USB_DATA_TRANSFER canTx;
    uint16_t timestamp;
    CAN_MSG_RX_ATTRIBUTE msgAttr;
    
    
    //TEST_Task();

    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
            /* Let the time for USB to initialize */
            vTaskDelay(50U / portTICK_PERIOD_MS);

            /* Open the device layer */
            appData.deviceHandle = USB_DEVICE_Open( USB_DEVICE_INDEX_0, DRV_IO_INTENT_READWRITE );
            
            if(appData.deviceHandle != USB_DEVICE_HANDLE_INVALID)
            {
                /* Register a callback with device layer to get event notification (for end point 0) */
                USB_DEVICE_EventHandlerSet(appData.deviceHandle, APP_USBDeviceEventHandler, 0);

                /* Set the next step */
                appData.state = APP_STATE_WAIT_FOR_CONFIGURATION;
            
                break;
            }
            else
            {
                /* The Device Layer is not ready to be opened. We should try
                 * again later. */
            }

            break;
        }

        
        /* USER: implement your application state machine.*/
        
        case APP_STATE_WAIT_FOR_CONFIGURATION:

            /* Check if the device was configured */
            if(appData.isConfigured)
            {
                /* If the device is configured then lets start reading */
                appData.state = APP_STATE_SCHEDULE_READ;                
            }
            
            break;

        case APP_STATE_SCHEDULE_READ:

            if(APP_StateReset())
            {
                break;
            }

            /* If a read is complete, then schedule a read
             * else wait for the current read to complete */

            //appData.state = APP_STATE_WAIT_FOR_READ_COMPLETE;
            appData.state = APP_STATE_CAN_TASK;
            
            if(appData.isReadComplete == true)
            {
                appData.isReadComplete = false;
                appData.readTransferHandle =  USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;

                USB_DEVICE_CDC_Read (USB_DEVICE_CDC_INDEX_0,
                        &appData.readTransferHandle, appData.cdcReadBuffer,
                        APP_READ_BUFFER_SIZE);
                
                if(appData.readTransferHandle == USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID)
                {
                    appData.state = APP_STATE_ERROR;
                    break;
                }
            }

            break;


        case APP_STATE_CAN_TASK:
        {
            if(APP_StateReset())
            {
                break;
            }
            
            
            if(appData.isReadComplete == true)
            {
                appData.isReadComplete = false;
                
                /* format bytes to can frame */
                if (appData.numBytesRead == CAN_STRUCT_SIZE)
                {
                    canTx.startofframe = appData.cdcReadBuffer[0];
                    canTx.type         = appData.cdcReadBuffer[1];
                    
                    canTx.id =  (uint32_t)(appData.cdcReadBuffer[2]);
                    canTx.id |= (uint32_t)(appData.cdcReadBuffer[3]<<8);
                    canTx.id |= (uint32_t)(appData.cdcReadBuffer[4]<<16);
                    canTx.id |= (uint32_t)(appData.cdcReadBuffer[5]<<24);
                    
                    canTx.dlc = appData.cdcReadBuffer[6];
                    
                    canTx.data[0] = appData.cdcReadBuffer[7];
                    canTx.data[1] = appData.cdcReadBuffer[8];
                    canTx.data[2] = appData.cdcReadBuffer[9];
                    canTx.data[3] = appData.cdcReadBuffer[10];
                    canTx.data[4] = appData.cdcReadBuffer[11];
                    canTx.data[5] = appData.cdcReadBuffer[12];
                    canTx.data[6] = appData.cdcReadBuffer[13];
                    canTx.data[7] = appData.cdcReadBuffer[14];
                    
                    canTx.endofframe = appData.cdcReadBuffer[15];
                    
                    CAN1_MessageTransmit(canTx.id, canTx.dlc, canTx.data, CAN_TX_FIFO_CHANNEL, CAN_MSG_TX_DATA_FRAME);
                }
                else
                {
                    _countIncompletRx++;
                    
                    //TODO: change with stream buffer
                }
                
                
                /* Reload USB queue for next receive */
                appData.readTransferHandle =  USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;

                USB_DEVICE_CDC_Read (USB_DEVICE_CDC_INDEX_0,
                        &appData.readTransferHandle,
                        appData.cdcReadBuffer,
                        APP_READ_BUFFER_SIZE);
                
                if(appData.readTransferHandle == USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID)
                {
                    appData.state = APP_STATE_ERROR;
                    break;
                }
            }
            
            /* USB free to transmit */
            if(appData.isWriteComplete == true)
            {
                if (CAN1_MessageReceive(&canRx.id, &canRx.dlc, canRx.data, &timestamp, CAN_RX_FIFO_CHANNEL, &msgAttr))
                {
                    appData.cdcWriteBuffer[0] = canRx.startofframe = 0x03;
                    
                    
                    appData.cdcWriteBuffer[1] = canRx.type = (msgAttr==CAN_MSG_RX_DATA_FRAME) ? 1 : 2;
                    
                    appData.cdcWriteBuffer[2] = (uint8_t)(canRx.id>>0);
                    appData.cdcWriteBuffer[3] = (uint8_t)(canRx.id>>8);
                    appData.cdcWriteBuffer[4] = (uint8_t)(canRx.id>>16);
                    appData.cdcWriteBuffer[5] = (uint8_t)(canRx.id>>24);
                    
                    appData.cdcWriteBuffer[6] = canRx.dlc;
                    
                    appData.cdcWriteBuffer[7] = canRx.data[0];
                    appData.cdcWriteBuffer[8] = canRx.data[1];
                    appData.cdcWriteBuffer[9] = canRx.data[2];
                    appData.cdcWriteBuffer[10] = canRx.data[3];
                    appData.cdcWriteBuffer[11] = canRx.data[4];
                    appData.cdcWriteBuffer[12] = canRx.data[5];
                    appData.cdcWriteBuffer[13] = canRx.data[6];
                    appData.cdcWriteBuffer[14] = canRx.data[7];
                    
                    appData.cdcWriteBuffer[15] = canRx.endofframe = 0x15;
                    
                    
                    
                    
                    appData.writeTransferHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
                    appData.isWriteComplete = false;
                    USB_DEVICE_CDC_Write(USB_DEVICE_CDC_INDEX_0,
                            &appData.writeTransferHandle,
                            appData.cdcWriteBuffer,
                            CAN_STRUCT_SIZE,                                    /* number of byte */
                            USB_DEVICE_CDC_TRANSFER_FLAGS_DATA_COMPLETE);
                }
            }
        }break;

        case APP_STATE_ERROR:

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

/*******************************************************************************
 End of File
 */
