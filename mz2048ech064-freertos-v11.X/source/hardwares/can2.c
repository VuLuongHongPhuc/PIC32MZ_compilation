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
 * 
 * NOTE: blocked at change mode Configration mode to other mode
 */

#include "xc.h"
#include <sys/attribs.h>
#include <sys/kmem.h>  // KVA_TO_PA
#include <proc/p32mz2048ech064.h>  // IPLxAUTO, IPLxSRS


#include "can2.h"


#define __EXTENDED_ID    1
#define __LOOPBACK_MODE  0


#define CAN_MESSAGE_RAM_TX_SIZE        8U   /* FIFO0 Max 32 */
#define CAN_MESSAGE_RAM_RX_SIZE        8U   /* FIFO1 max 32 */
#define CAN_MESSAGE_RAM_CONFIG_SIZE    (CAN_MESSAGE_RAM_TX_SIZE+CAN_MESSAGE_RAM_RX_SIZE)


/* Allocate TX + RX message buffer size. */
static CAN_TX_RX_MSG_BUFFER __attribute__((coherent, aligned(32))) can_message_buffer[CAN_MESSAGE_RAM_CONFIG_SIZE];

static CAN_CALLBACK can2RxEventHandler = NULL;
static uintptr_t can2RxContextHandler;




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
static void SetFIFO(void)
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

static void SetAcceptanceFilter(void)
{
    C2FLTCON0bits.FLTEN0 = 1; /* Enable filter 0*/
    
    /* Configure CAN Filters */
    C2RXF0bits.SID = 0;
    C2RXF0bits.EXID = 0;
    C2RXF0bits.EID = 0;
    
    C2CONbits.DNCNT = 0; /* Do not compare data bytes */
    
    C2FLTCON0bits.FSEL0 = 1; // 1 = Message matching filter is stored in FIFO buffer 1
    
    /* Configure CAN Acceptance Filter Masks */
    C2RXM0bits.SID = 0; 
    C2RXM0bits.MIDE = 0;
    C2RXM0bits.EID = 0;
    //C2RXM0 = 0x3FFFFu | (0x01u << _C2RXM0_MIDE_POSITION) | (0x7FFu << _C2RXM0_SID_POSITION) /* mask 0x1FFFFFFF */
    //C2RXM0 = (0x1FFFFFFFUL & _C2RXM0_EID_MASK) | (((0x1FFFFFFFU & 0x1FFC0000u) >> 18u) << _C2RXM0_SID_POSITION) | _C2RXM0_MIDE_MASK;
}

static void InitGPIO()
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

static void SetInterrupt()
{
    C2INTbits.IVRIE = 1;  // Invalid Message Received Interrupt Enable bit
    //C2INTbits.CERRIE = 1; // CAN Bus Error Interrupt Enable bit
    //C2INTbits.SERRIE = 1; // System Error Interrupt Enable bit
    //C2INTSET = _C2INT_TBIE_MASK; /* Enable Transmit Buffer Interrupt */
    C2INTSET = _C2INT_RBIE_MASK; /* Enable Receive Buffer Interrupt */
    
    
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
    
    (void)__builtin_disable_interrupts();
    
    /* Remap GPIO */
    InitGPIO();
    
    /* Switch the CAN module ON */
    C2CONSET = _C2CON_ON_MASK;
    
    /* At reset, normally on configuration mode */
    /* Switch the CAN module to Configuration mode. Wait until the switch is complete */
    C2CONbits.REQOP = CAN_CONFIGURATION_MODE;
    while (C2CONbits.OPMOD != CAN_CONFIGURATION_MODE)
    {
        /* Do nothing - wait */
    }
    
    SetBaudrate();
    SetFIFO();
    SetInterrupt();   

#if (__LOOPBACK_MODE == 1)
    C2CONbits.REQOP = CAN_LOOPBACK_MODE;
    while(C2CONbits.OPMOD != CAN_LOOPBACK_MODE)
    {
        /* Do Nothing */
    }
#else
    /* The CAN module can now be placed into normal mode if no further */
    //C2CONbits.REQOP = CAN_OPERATION_MODE;
    //while(C2CONbits.OPMOD != CAN_OPERATION_MODE)    { /* Do Nothing - wait */ }
    
    /* Switch the CAN module to CAN_OPERATION_MODE. Wait until the switch is complete */
    C2CON = (C2CON & ~_C2CON_REQOP_MASK) | ((CAN_OPERATION_MODE << _C2CON_REQOP_POSITION) & _C2CON_REQOP_MASK);
    while(((C2CON & _C2CON_OPMOD_MASK) >> _C2CON_OPMOD_POSITION) != CAN_OPERATION_MODE)
    {
        /* Do Nothing */
    }
#endif
    
    (void)__builtin_enable_interrupts();
}

void CAN2_Enable(void)
{
    C2CONbits.ON = 1;
    /* Auto request priority on C2TX/C2RX pins */
}

void CAN2_Disable(void)
{
    /* Place the CAN module in Configuration mode. */
    C2CONbits.REQOP = 4;         /* Request enter configuration mode */
    while(C2CONbits.OPMOD != 4); /* Wait mode change */
    
    /* Switch the CAN module off. */
    C2CONCLR = 0x00008000;          /* Clear the ON bit */
    while(C2CONbits.CANBUSY == 1);  /* Wait for CAN off - advisor */
    
    /* - Auto release device control on C2TX/C2RX pins
     * - Place CAN module into reset
     * - All FIFO message is reset
     */
}

/* @brief Reset Tx FIFO - Can also be done enter config mode or put module to off
 */
void CAN2_ResetTxFIFO(void)
{
    /* Reset CAN2 FIFO0 */
    C2FIFOCON0SET = 0x00004000; /* Set the FRESET bit */
    while(C2FIFOCON0bits.FRESET == 1);
}

/* @brief Reset Rx FIFO - Can also be done enter config mode or put module to off
 */
void CAN2_ResetRxFIFO(void)
{
    /* Reset CAN2 FIFO1 */
    C2FIFOCON1SET = 0x00004000; /* Set the FRESET bit */
    while(C2FIFOCON1bits.FRESET == 1);
}


uint8_t CAN2_Read(uint32_t *id, uint8_t *length, uint8_t *data, uint16_t *timestamp, CAN_MSG_RX_ATTRIBUTE *msgAttr)
{
    uint8_t  count = 0;
    CAN_TX_RX_MSG_BUFFER *rxMessage = NULL; /* Points to message buffer to be written */
    
    /* if not empty */
    if (!C2FIFOINT1bits.RXNEMPTYIF)
    {
        rxMessage = (CAN_TX_RX_MSG_BUFFER *)PA_TO_KVA1(C2FIFOUA1);
        
        /* Check if it's a extended message type */
        if ((rxMessage->msgEID & CAN_MSG_IDE_MASK) != 0U)
        {
            *id = ((rxMessage->msgSID & CAN_MSG_SID_MASK) << 18) | ((rxMessage->msgEID >> 10) & _C2RXM0_EID_MASK);
            
            /* Check if remote frame */
            if ((rxMessage->msgEID & CAN_MSG_RTR_MASK) != 0U)
            {
                *msgAttr = CAN_MSG_RX_REMOTE_FRAME;
            }
            else
            {
                *msgAttr = CAN_MSG_RX_DATA_FRAME;
            }
        }
        else
        {
            *id = rxMessage->msgSID & CAN_MSG_SID_MASK;
            
            /* Check if remote frame */
            if ((rxMessage->msgEID & CAN_MSG_SRR_MASK) != 0U)
            {
                *msgAttr = CAN_MSG_RX_REMOTE_FRAME;
            }
            else
            {
                *msgAttr = CAN_MSG_RX_DATA_FRAME;
            }
        }

        *length = (uint8_t)(rxMessage->msgEID & CAN_MSG_DLC_MASK);

        /* Copy the data into the payload */
        while (count < *length)
        {
            data[count] = rxMessage->msgData[count];
            count++;
        }

        if (timestamp != NULL)
        {
            *timestamp = (uint16_t)((rxMessage->msgSID & CAN_MSG_TIMESTAMP_MASK) >> 16);
        }
        
        /* Set the UINC bit to tell the CAN module that
        * a message has been read. */
        //C2FIFOCON1SET = 0x2000;
        C2FIFOCON1SET = _C2FIFOCON1_UINC_MASK;
        
        return 1;
    }
    
    // CiFIFOUAn address register
    // CiFIFOCIn index register
    
    return 0;
}

uint8_t CAN2_Write(uint32_t id, uint8_t length, uint8_t* data, CAN_MSG_TX_ATTRIBUTE msgAttr)
{
    uint8_t count = 0;
    CAN_TX_RX_MSG_BUFFER *txMessage = NULL; /* Points to message buffer to be written */
    
    /* Get the address of the message buffer to write to from the C1FIFOUA0 */
    /* register. Convert this physical address to virtual address. */
    txMessage = (CAN_TX_RX_MSG_BUFFER *)PA_TO_KVA1(C2FIFOUA0);

    if (C2FIFOINT0bits.TXNFULLIF == 0)
    {
#if (__EXTENDED_ID == 1)
        txMessage->msgSID = (id & CAN_MSG_EID_MASK) >> 18;
        txMessage->msgEID = ((id & 0x3FFFFUL) << 10) | CAN_MSG_IDE_MASK | CAN_MSG_SRR_MASK;
#else
        txMessage->msgSID = id;
        txMessage->msgEID = 0U;
#endif
        
        if (CAN_MSG_TX_REMOTE_FRAME == msgAttr)
        {
            txMessage->msgEID |= CAN_MSG_RTR_MASK;
        }
        else
        {
            if (length > 8U)
            {
                length = 8U;
            }
            txMessage->msgEID |= length;

            while(count < length)
            {
                txMessage->msgData[count++] = *data++;
            }
        }

        //C2FIFOCON0SET = 0x2008; /* Set the UINC and TXREQ bit */
        C2FIFOCON0SET = _C2FIFOCON0_UINC_MASK | _C2FIFOCON0_TXREQ_MASK;
        
        return 1;
    }
    
    return 0;
}





/* @brief Sets the pointer to the function (and it's context) to be called when the
    given CAN's receive transfer events occur.
 * @param callback - callback function pointer
 * @param contextHandle - loopback data pointer
 */
void CAN2_RxCallbackRegister(CAN_CALLBACK callback, uintptr_t contextHandle)
{
    if (callback != NULL)
    {
        can2RxEventHandler = callback;
        can2RxContextHandler = contextHandle;
    }
    return;
}

// *****************************************************************************
// *****************************************************************************
// Section: System Interrupt Vector definitions
// *****************************************************************************
// *****************************************************************************

void __ISR(_CAN2_VECTOR, IPL2AUTO) CAN2_Handler (void)
{
    
    /* Receive buffer interrupt */
    if (C2INTbits.RBIF)
    {
        // callback event function
        if (NULL != can2RxEventHandler)
        {
            can2RxEventHandler(can2RxContextHandler);
        }
    }
    
    /* Transmit Buffer Interrupt */
    if (C2INTbits.TBIF)
    {
    }
    
    //C2INTCLR = _C2INT_TBIE_MASK;
    IFS4CLR = _IFS4_CAN2IF_MASK;
}

/* *****************************************************************************
 End of File
 */
