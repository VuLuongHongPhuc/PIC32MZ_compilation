/* CAN2
 * pin.14  C2TX  RB2
 * pin.16  C2RX  RB0
 * Bit rate : 500 Kbps
 * sample at 87.5%
 * Baudrate prescaler : 4
 * propagation segment time (ns) : 800
 * FIFO 0 : Transmit 8 deep level -> 8x 4 words = 32 bytes
 * FIFO 1 : Receive  8 deep level -> 8x 4 words = 32 bytes
 * Interrupt mode
 */

#include "xc.h"
#include <sys/attribs.h>
#include <sys/kmem.h>  // KVA_TO_PA
#include <proc/p32mz2048ech064.h>  // IPLxAUTO, IPLxSRS

// *****************************************************************************
/* CAN Message Object Type RX Attribute

   Summary:
    CAN Message RX Attribute for Data Frame and Remote Frame.

   Description:
    This data type defines CAN Message RX Attribute for Data Frame and Remote Frame.

   Remarks:
    None.
*/
typedef enum
{
    CAN_MSG_RX_DATA_FRAME = 0,
    CAN_MSG_RX_REMOTE_FRAME
} CAN_MSG_RX_ATTRIBUTE;

// *****************************************************************************
/* CAN RX Message

   Summary:
    CAN RX Message Buffer structure.

   Description:
    This data structure stores RX Message.

   Remarks:
    None.
*/
typedef struct
{
    /* Rx Message ID */
    uint32_t *id;
    /* Rx Message buffer */
    uint8_t  *buffer;
    /* Rx Message size */
    uint8_t  *size;
    /* Rx Message timestamp */
    uint16_t *timestamp;
    /* Rx Message attribute */
    CAN_MSG_RX_ATTRIBUTE *msgAttr;
} CAN_RX_MSG;

/* CAN Message Buffer

   Summary:
    CAN Message Buffer structure.

   Description:
    This data structure defines the CAN TX and RX Message Buffer format.

   Remarks:
    None.
*/
typedef struct
{
    /* This is SID portion of the CAN message */
    uint32_t msgSID;

    /* This is EID portion of the CAN message */
    uint32_t msgEID;

    /* This is the data portion of the CAN message */
    uint8_t msgData[8];
} CAN_TX_RX_MSG_BUFFER;


#define CAN_MESSAGE_RAM_TX_SIZE        8U   /* FIFO0 Max 32 */
#define CAN_MESSAGE_RAM_RX_SIZE        8U   /* FIFO1 max 32 */
#define CAN_MESSAGE_RAM_CONFIG_SIZE    (CAN_MESSAGE_RAM_TX_SIZE+CAN_MESSAGE_RAM_RX_SIZE)




/* Allocate a total of 64 words = TX + RX size. */
static CAN_TX_RX_MSG_BUFFER __attribute__((coherent, aligned(32))) can_message_buffer[CAN_MESSAGE_RAM_CONFIG_SIZE];

volatile static CAN_RX_MSG can2RxMsg;// message formatted


void CAN2_Disable(void);
void CAN2_Enable(void);



static inline void SetBaudrate(void)
{
    /*
     * Bit Rate = CAN Clock Frequency/ (BRP x Number of TQ)
     * Number of TQ = 1 (SyncSeg) + PropSeg + PhaseSeg1 + PhaseSeg2
     * we aim for 20 TQ per bit to have BRP value with an integer.
     * => BRP=5, TQ=10
     * 
     * Sample Point = (SyncSeg + ProgSeg + PhaseSeg1) / Total TQ
     * SyncSeg = 1 TQ (always)
     * PropSeg+PhaseSeg1=(0.875×10)?1=16.5 => 16/17
     * And then PhaseSeg2 = 3 TQ (since total is 20 TQ).
     * You typically want PhaseSeg1 larger than PropSeg, so let's pick:
     * PropSeg = 4 TQ
     * PhaseSeg1 = 3 TQ
     * PhaseSeg2 = 2 TQ
     * => 4+3+2=6(Sample at 9/10=85%)
     * 
     * SJW (synchronization jump width) can be 1?2 TQ, usually 1 or 2 is fine. Let's set SJW = 1.
     */
    
    
    C2CFGbits.BRP = 4;   // (BRP + 1) = 5 => BRP = 4
    C2CFGbits.SJW = 1;   // SJW = 2 TQ

    C2CFGbits.PRSEG = 3;  // PropSeg = PRSEG + 1 = 4 TQ
    C2CFGbits.SEG1PH = 2; // PhaseSeg1 = SEG1PH + 1 = 3 TQ
    C2CFGbits.SEG2PH = 1; // PhaseSeg2 = SEG2PH + 1 = 2 TQ
    C2CFGbits.SAM = 0;    // 1 sample per bit
    
    //C2CFGbits.SEG2PHTS = 1; // auto?
}


static inline void CAN2_ZeroInitialize(volatile void* pData, size_t dataSize)
{
    volatile uint8_t* data = (volatile uint8_t*)pData;
    for (uint32_t index = 0; index < dataSize; index++)
    {
        data[index] = 0U;
    }
}

/**
 * @brief Configure CAN FIFOs
 */
static inline void SetFIFO(void)
{
    
    /* Set Start address of MB0 in FIFO0 */
    C2FIFOBA = (uint32_t)KVA_TO_PA(can_message_buffer);
            
    /* Set Transmit FIFO size 8 */
    C2FIFOCON0bits.TXEN = 1;
    C2FIFOCON0bits.FSIZE = CAN_MESSAGE_RAM_TX_SIZE - 1U;
    //C2FIFOCON0bits.UINC = 1; // head/tail?
        
    /* Set FIFO1 Full Receive Message size 8*/
    C2FIFOCON1bits.TXEN = 0;
    C2FIFOCON1bits.FSIZE = CAN_MESSAGE_RAM_RX_SIZE - 1U;
}

static inline void SetAcceptanceFilter(void)
{
    /* Configure CAN Filters */
    //C2RXF0bits.SID = 0;
    //C2RXF0bits.EXID = 0;
    //C2RXF0bits.EID = 0;
    
    C2FLTCON0bits.FSEL0 = 1; // 1 = Message matching filter is stored in FIFO buffer 1
    
    /* Configure CAN Acceptance Filter Masks */
    C2RXM0bits.SID = 0x7FFu;
    C2RXM0bits.MIDE = 0x01u;
    C2RXM0bits.EID = 0x3FFFFu;
}

static inline void InitGPIO()
{
    /* Unlock system for PPS configuration */
    SYSKEY = 0x00000000U;
    SYSKEY = 0xAA996655U;
    SYSKEY = 0x556699AAU;

    CFGCONbits.IOLOCK = 0U;

    /* PPS Input Remapping C2RX */
    C2RXR = 5;

    /* PPS Output Remapping C2TX */
    RPB2R = 15;

        /* Lock back the system after PPS configuration */
    CFGCONbits.IOLOCK = 1U;

    SYSKEY = 0x00000000U;
}

static inline void SetInterrupt()
{
    C2INTbits.IVRIE = 1;  // Invalid Message Received Interrupt Enable bit
    //C2INTbits.CERRIE = 1; // CAN Bus Error Interrupt Enable bit
    //C2INTbits.SERRIE = 1; // System Error Interrupt Enable bit
    //C2INTSET = _C2INT_TBIE_MASK; /* Enable Transmit Buffer Interrupt */
    
    IPC38bits.CAN2IP = 2;  /* Interrupt priority */
    IPC38bits.CAN2IS = 0;  /* Interrupt sub-priority */
    
    IEC4SET = _IEC4_CAN2IE_MASK; /* Enable CAN2 interrupt vector */
}

void CAN2_Initialize(void)
{
    /* !! The module must be in configuration mode C2CON<23:21> = 100 to configure
     * C2CFG
     * C2FIFOBA
     * C2RXMn
     * C2FIFOCONn<20:16> - FSIZE<4:0>
     * C2FIFOCONn<12> - DONLY
     */
    
    /* Remap GPIO */
    InitGPIO();
    
    /* At reset, normally on config mode */
    if (C2CONbits.OPMOD != 4)
    {
        CAN2_Disable();
    }
    
    SetBaudrate();
    
    SetFIFO();
    
    SetInterrupt();   
    
    /* The CAN module can now be placed into normal mode if no further */
    /* configuration is required. */
    C1CONbits.REQOP = 0;
    while(C1CONbits.OPMOD != 0);
    
}

void CAN2_Enable(void)
{
    C2CONbits.ON = 1;
    // -> auto priority requested on C2TX/C2RX pins
}

void CAN2_Disable(void)
{
    /* Place the CAN module in Configuration mode. */
    C2CONbits.REQOP = 4;
    while(C1CONbits.OPMOD != 4);
    
    /* Switch the CAN module off. */
    C2CONCLR = 0x00008000; /*Clear the ON bit */
    while(C1CONbits.CANBUSY == 1);
    
    // auto release on C2TX/C2RX pins?
}

void Read()
{
    // CiFIFOUAn address register
    // CiFIFOCIn index register
}

#if 0 // TRANSMIT
/* This code snippet illustrates the steps to load a transmit message FIFO. */
/* This example uses the CAN1 module. */
/* Four messages to be transmitted using transmit FIFO0 */
int message; /* Tracks the message buffer */
unsigned int * currentMessageBuffer; /* Points to message buffer to be written */
message = 0;
for(message = 0; message <= 3; message ++)
{
/* Get the address of the message buffer to write to from the C1FIFOUA0 */
/* register. Convert this physical address to virtual address. */
currentMessageBuffer = PA_TO_KVA1(C1FIF0UA0);
/* This procedure will load the message
 * buffer with the message to be transmitted. */
LoadMessageBuffer(currentMessageBuffer);
C1FIFOCON0SET = 0x2008; /* Set the UINC and TXREQ bit */
}
/* At this point the messages are loaded in FIFO0 */
#endif


#if 0 // Receive from FIFO
/* This code snippet illustrates the steps to read messages from receive */
/* message FIFO. This example uses the CAN1 module.*/
/* FIFO1 size is 4 messages and each message is 4 words long. */
unsigned int * currentMessageBuffer; /* Points to message buffer to be read */
while(1)
{
/* Keep reading until the FIFO is empty. */
while(C1FIFOINT1bits.RXNEMPTYIF == 1)
{
/* Get the address of the message buffer to read from the C1FIFOUA1 */
/* register. Convert this physical address to virtual address. */
currentMessageBuffer = PA_TO_KVA1(C1FIF0UA1);
ProcessReceivedMessage(currentMessageBuffer);
/* Set the UINC bit to tell the CAN module that
 * a message has been read. */
C1FIFOCON0SET = 0x2000;
}
}
#endif

// *****************************************************************************
// *****************************************************************************
// Section: System Interrupt Vector definitions
// *****************************************************************************
// *****************************************************************************



void __ISR(_CAN2_VECTOR, IPL2AUTO) CAN2_Handler (void)
{
    
    
    //C2INTCLR = _C2INT_TBIE_MASK;
    IFS4CLR = _IFS4_CAN2IF_MASK;
}

/* *****************************************************************************
 End of File
 */
