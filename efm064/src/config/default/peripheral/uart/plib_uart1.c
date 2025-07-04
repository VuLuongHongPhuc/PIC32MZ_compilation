/*******************************************************************************
  UART1 PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_uart1.c

  Summary:
    UART1 PLIB Implementation File

  Description:
    None

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

#include "device.h"
#include "plib_uart1.h"
#include "interrupts.h"

// *****************************************************************************
// *****************************************************************************
// Section: UART1 Implementation
// *****************************************************************************
// *****************************************************************************

volatile static UART_OBJECT uart1Obj;

void static UART1_ErrorClear( void )
{
    UART_ERROR errors = UART_ERROR_NONE;
    uint8_t dummyData = 0u;

    errors = (UART_ERROR)(U1STA & (_U1STA_OERR_MASK | _U1STA_FERR_MASK | _U1STA_PERR_MASK));

    if(errors != UART_ERROR_NONE)
    {
        /* If it's a overrun error then clear it to flush FIFO */
        if((U1STA & _U1STA_OERR_MASK) != 0U)
        {
            U1STACLR = _U1STA_OERR_MASK;
        }

        /* Read existing error bytes from FIFO to clear parity and framing error flags */
        while((U1STA & _U1STA_URXDA_MASK) != 0U)
        {
            dummyData = (uint8_t)U1RXREG;
        }

        /* Clear error interrupt flag */
        IFS3CLR = _IFS3_U1EIF_MASK;

        /* Clear up the receive interrupt flag so that RX interrupt is not
         * triggered for error bytes */
        IFS3CLR = _IFS3_U1RXIF_MASK;
    }

    // Ignore the warning
    (void)dummyData;
}

void UART1_Initialize( void )
{
    /* Set up UxMODE bits */
    /* STSEL  = 0 */
    /* PDSEL = 0 */
    /* UEN = 0 */

    U1MODE = 0x8;

    /* Enable UART1 Receiver and Transmitter */
    U1STASET = (_U1STA_UTXEN_MASK | _U1STA_URXEN_MASK | _U1STA_UTXISEL1_MASK );

    /* BAUD Rate register Setup */
    U1BRG = 108;

    /* Disable Interrupts */
    IEC3CLR = _IEC3_U1EIE_MASK;

    IEC3CLR = _IEC3_U1RXIE_MASK;

    IEC3CLR = _IEC3_U1TXIE_MASK;

    /* Initialize instance object */
    uart1Obj.rxBuffer = NULL;
    uart1Obj.rxSize = 0;
    uart1Obj.rxProcessedSize = 0;
    uart1Obj.rxBusyStatus = false;
    uart1Obj.rxCallback = NULL;
    uart1Obj.txBuffer = NULL;
    uart1Obj.txSize = 0;
    uart1Obj.txProcessedSize = 0;
    uart1Obj.txBusyStatus = false;
    uart1Obj.txCallback = NULL;
    uart1Obj.errors = UART_ERROR_NONE;

    /* Turn ON UART1 */
    U1MODESET = _U1MODE_ON_MASK;
}

bool UART1_SerialSetup( UART_SERIAL_SETUP *setup, uint32_t srcClkFreq )
{
    bool status = false;
    uint32_t baud;
    uint32_t status_ctrl;
    uint32_t uxbrg = 0;

    if(uart1Obj.rxBusyStatus == true)
    {
        /* Transaction is in progress, so return without updating settings */
        return status;
    }
    if (uart1Obj.txBusyStatus == true)
    {
        /* Transaction is in progress, so return without updating settings */
        return status;
    }

    if (setup != NULL)
    {
        baud = setup->baudRate;

        if ((baud == 0U) || ((setup->dataWidth == UART_DATA_9_BIT) && (setup->parity != UART_PARITY_NONE)))
        {
            return status;
        }

        if(srcClkFreq == 0U)
        {
            srcClkFreq = UART1_FrequencyGet();
        }

        /* Calculate BRG value */
        uxbrg = (((srcClkFreq >> 2) + (baud >> 1)) / baud);
        /* Check if the baud value can be set with low baud settings */
        if (uxbrg < 1U)
        {
            return status;
        }

        uxbrg -= 1U;

        if (uxbrg > UINT16_MAX)
        {
            return status;
        }

        /* Turn OFF UART1. Save UTXEN, URXEN and UTXBRK bits as these are cleared upon disabling UART */

        status_ctrl = U1STA & (_U1STA_UTXEN_MASK | _U1STA_URXEN_MASK | _U1STA_UTXBRK_MASK);

        U1MODECLR = _U1MODE_ON_MASK;

        if(setup->dataWidth == UART_DATA_9_BIT)
        {
            /* Configure UART1 mode */
            U1MODE = (U1MODE & (~_U1MODE_PDSEL_MASK)) | setup->dataWidth;
        }
        else
        {
            /* Configure UART1 mode */
            U1MODE = (U1MODE & (~_U1MODE_PDSEL_MASK)) | setup->parity;
        }

        /* Configure UART1 mode */
        U1MODE = (U1MODE & (~_U1MODE_STSEL_MASK)) | setup->stopBits;

        /* Configure UART1 Baud Rate */
        U1BRG = uxbrg;

        U1MODESET = _U1MODE_ON_MASK;

        /* Restore UTXEN, URXEN and UTXBRK bits. */
        U1STASET = status_ctrl;

        status = true;
    }

    return status;
}

bool UART1_AutoBaudQuery( void )
{
    bool autobaudqcheck = false;
    if((U1MODE & _U1MODE_ABAUD_MASK) != 0U)
    {

       autobaudqcheck = true;
    }
    return autobaudqcheck;
}

void UART1_AutoBaudSet( bool enable )
{
    if( enable == true )
    {
        U1MODESET = _U1MODE_ABAUD_MASK;
    }

    /* Turning off ABAUD if it was on can lead to unpredictable behavior, so that
       direction of control is not allowed in this function.                      */
}

bool UART1_Read(void* buffer, const size_t size )
{
    bool status = false;

    if(buffer != NULL)
    {
        /* Check if receive request is in progress */
        if(uart1Obj.rxBusyStatus == false)
        {
            /* Clear error flags and flush out error data that may have been received when no active request was pending */
            UART1_ErrorClear();

            uart1Obj.rxBuffer = buffer;
            uart1Obj.rxSize = size;
            uart1Obj.rxProcessedSize = 0;
            uart1Obj.rxBusyStatus = true;
            uart1Obj.errors = UART_ERROR_NONE;
            status = true;

            /* Enable UART1_FAULT Interrupt */
            IEC3SET = _IEC3_U1EIE_MASK;

            /* Enable UART1_RX Interrupt */
            IEC3SET = _IEC3_U1RXIE_MASK;
        }
    }

    return status;
}

bool UART1_Write( void* buffer, const size_t size )
{
    bool status = false;

    if(buffer != NULL)
    {
        /* Check if transmit request is in progress */
        if(uart1Obj.txBusyStatus == false)
        {
            uart1Obj.txBuffer = buffer;
            uart1Obj.txSize = size;
            uart1Obj.txProcessedSize = 0;
            uart1Obj.txBusyStatus = true;
            status = true;

            size_t txProcessedSize = uart1Obj.txProcessedSize;
            size_t txSize = uart1Obj.txSize;

            /* Initiate the transfer by writing as many bytes as we can */
            while(((U1STA & _U1STA_UTXBF_MASK) == 0U) && (txSize > txProcessedSize) )
            {
                if (( U1MODE & (_U1MODE_PDSEL0_MASK | _U1MODE_PDSEL1_MASK)) == (_U1MODE_PDSEL0_MASK | _U1MODE_PDSEL1_MASK))
                {
                    /* 9-bit mode */
                    U1TXREG = ((uint16_t*)uart1Obj.txBuffer)[txProcessedSize];
                    txProcessedSize++;
                }
                else
                {
                    /* 8-bit mode */
                    U1TXREG = ((uint8_t*)uart1Obj.txBuffer)[txProcessedSize];
                    txProcessedSize++;
                }
            }

            uart1Obj.txProcessedSize = txProcessedSize;

            IEC3SET = _IEC3_U1TXIE_MASK;
        }
    }

    return status;
}

UART_ERROR UART1_ErrorGet( void )
{
    UART_ERROR errors = uart1Obj.errors;

    uart1Obj.errors = UART_ERROR_NONE;

    /* All errors are cleared, but send the previous error state */
    return errors;
}

void UART1_ReadCallbackRegister( UART_CALLBACK callback, uintptr_t context )
{
    uart1Obj.rxCallback = callback;

    uart1Obj.rxContext = context;
}

bool UART1_ReadIsBusy( void )
{
    return uart1Obj.rxBusyStatus;
}

size_t UART1_ReadCountGet( void )
{
    return uart1Obj.rxProcessedSize;
}

bool UART1_ReadAbort(void)
{
    if (uart1Obj.rxBusyStatus == true)
    {
        /* Disable the fault interrupt */
        IEC3CLR = _IEC3_U1EIE_MASK;

        /* Disable the receive interrupt */
        IEC3CLR = _IEC3_U1RXIE_MASK;

        uart1Obj.rxBusyStatus = false;

        /* If required application should read the num bytes processed prior to calling the read abort API */
        uart1Obj.rxSize = 0U;
        uart1Obj.rxProcessedSize = 0U;
    }

    return true;
}

void UART1_WriteCallbackRegister( UART_CALLBACK callback, uintptr_t context )
{
    uart1Obj.txCallback = callback;

    uart1Obj.txContext = context;
}

bool UART1_WriteIsBusy( void )
{
    return uart1Obj.txBusyStatus;
}

size_t UART1_WriteCountGet( void )
{
    return uart1Obj.txProcessedSize;
}

void __attribute__((used)) UART1_FAULT_InterruptHandler (void)
{
    /* Save the error to be reported later */
    uart1Obj.errors = (U1STA & (_U1STA_OERR_MASK | _U1STA_FERR_MASK | _U1STA_PERR_MASK));

    /* Disable the fault interrupt */
    IEC3CLR = _IEC3_U1EIE_MASK;

    /* Disable the receive interrupt */
    IEC3CLR = _IEC3_U1RXIE_MASK;

    /* Clear rx status */
    uart1Obj.rxBusyStatus = false;

    UART1_ErrorClear();

    /* Client must call UARTx_ErrorGet() function to get the errors */
    if( uart1Obj.rxCallback != NULL )
    {
        uintptr_t rxContext = uart1Obj.rxContext;

        uart1Obj.rxCallback(rxContext);
    }
}

void __attribute__((used)) UART1_RX_InterruptHandler (void)
{
    if(uart1Obj.rxBusyStatus == true)
    {
        size_t rxSize = uart1Obj.rxSize;
        size_t rxProcessedSize = uart1Obj.rxProcessedSize;

        while((_U1STA_URXDA_MASK == (U1STA & _U1STA_URXDA_MASK)) && (rxSize > rxProcessedSize) )
        {
            if (( U1MODE & (_U1MODE_PDSEL0_MASK | _U1MODE_PDSEL1_MASK)) == (_U1MODE_PDSEL0_MASK | _U1MODE_PDSEL1_MASK))
            {
                /* 9-bit mode */
                ((uint16_t*)uart1Obj.rxBuffer)[rxProcessedSize] = (uint16_t)(U1RXREG);
            }
            else
            {
                /* 8-bit mode */
                ((uint8_t*)uart1Obj.rxBuffer)[rxProcessedSize] = (uint8_t)(U1RXREG);
            }
            rxProcessedSize++;
        }

        uart1Obj.rxProcessedSize = rxProcessedSize;

        /* Clear UART1 RX Interrupt flag */
        IFS3CLR = _IFS3_U1RXIF_MASK;

        /* Check if the buffer is done */
        if(uart1Obj.rxProcessedSize >= rxSize)
        {
            uart1Obj.rxBusyStatus = false;

            /* Disable the fault interrupt */
            IEC3CLR = _IEC3_U1EIE_MASK;

            /* Disable the receive interrupt */
            IEC3CLR = _IEC3_U1RXIE_MASK;


            if(uart1Obj.rxCallback != NULL)
            {
                uintptr_t rxContext = uart1Obj.rxContext;

                uart1Obj.rxCallback(rxContext);
            }
        }
    }
    else
    {
        /* Nothing to process */
    }
}

void __attribute__((used)) UART1_TX_InterruptHandler (void)
{
    if(uart1Obj.txBusyStatus == true)
    {
        size_t txSize = uart1Obj.txSize;
        size_t txProcessedSize = uart1Obj.txProcessedSize;

        while(((U1STA & _U1STA_UTXBF_MASK) == 0U) && (txSize > txProcessedSize) )
        {
            if (( U1MODE & (_U1MODE_PDSEL0_MASK | _U1MODE_PDSEL1_MASK)) == (_U1MODE_PDSEL0_MASK | _U1MODE_PDSEL1_MASK))
            {
                /* 9-bit mode */
                U1TXREG = ((uint16_t*)uart1Obj.txBuffer)[txProcessedSize];
            }
            else
            {
                /* 8-bit mode */
                U1TXREG = ((uint8_t*)uart1Obj.txBuffer)[txProcessedSize];
            }
            txProcessedSize++;
        }

        uart1Obj.txProcessedSize = txProcessedSize;

        /* Clear UART1TX Interrupt flag */
        IFS3CLR = _IFS3_U1TXIF_MASK;

        /* Check if the buffer is done */
        if(uart1Obj.txProcessedSize >= txSize)
        {
            uart1Obj.txBusyStatus = false;

            /* Disable the transmit interrupt, to avoid calling ISR continuously */
            IEC3CLR = _IEC3_U1TXIE_MASK;

            if(uart1Obj.txCallback != NULL)
            {
                uintptr_t txContext = uart1Obj.txContext;

                uart1Obj.txCallback(txContext);
            }
        }
    }
    else
    {
        // Nothing to process
        ;
    }
}



bool UART1_TransmitComplete( void )
{
    bool transmitComplete = false;

    if((U1STA & _U1STA_TRMT_MASK) != 0U)
    {
        transmitComplete = true;
    }

    return transmitComplete;
}