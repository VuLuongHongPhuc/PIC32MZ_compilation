
#include "FreeRTOS.h"
#include "task.h"

#include "gpio.h"
#include "uart1.h"
#include "can1.h"
#include "trng.h"

static void TestCan(void);
static void TestRng(void);
static void TestUart(void);



static void Initialize(void)
{
    //CAN1_Initialize();
    //TRNG_Initialize();
    UART1_Initialize();
}


/* @brief Statistic using "vTaskGetRunTimeStats"
 * @param pvParameters - callback data
 */
void TEST_Task( void *pvParameters )
{
    configASSERT( ( uint32_t ) pvParameters == 1UL );
    
    
    Initialize();
    
    LED_1_Clear();
    LED_2_Clear();
    //LED_3_Clear(); // use by main task
    
    while (1)
    {
        /* Delay to let the system run tasks */
        vTaskDelay(1000U / portTICK_PERIOD_MS);

        //TestCan();
        //TestRng();
        TestUart();
        
    }
}

void TestRng(void)
{
    uint32_t trng_value = 0;
    
    //TRNG_WaitForCnt();
    trng_value = RNGNUMGEN1;
    trng_value = RNGNUMGEN2;
    trng_value = 0;
}

static void TestCan(void)
{
    uint32_t id = 0x1A001023;
    uint8_t length = 2;
    uint8_t data[8] = {0x31, 0x33, 2, 3, 4, 5, 6};
    CAN_MSG_TX_ATTRIBUTE msgAttr = CAN_MSG_TX_DATA_FRAME;
    uint16_t *timestamp;
    
    
    (void)CAN1_Write(id, length, data, msgAttr);
    LED_1_Set();
    

    CAN_MSG_RX_ATTRIBUTE msgRxAttr = CAN_MSG_RX_DATA_FRAME;
    (void)CAN1_Read(&id, &length, data, NULL, &msgRxAttr);
    if (msgAttr == CAN_MSG_RX_DATA_FRAME)
    {
        LED_1_Clear();
    }

}

static void TestUart(void)
{
    volatile uint16_t c;
    static uint8_t count = 0;    
    U1TXREG = count++;
    
    //IEC3SET = _IEC3_U1TXIE_MASK;    /* Enable interrupt */
    
    if (U1STAbits.URXDA)
    {
        c = U1RXREG;
        U1TXREG = c;
    }
}

static void UART1_RX_Callback(void)
{
    volatile uint8_t c = U1RXREG;
    U1TXREG = c;
}

void UART1_TX_Callback(void)
{
    LED_2_Toggle();
}
/* *****************************************************************************
 End of File
 */
