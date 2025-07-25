/*
 * - configure the peripheral
 * - clear IFSx bit flag
 * - don't enable IECx -> DMA will self do it on the peripheral
 * 
 */

#include <xc.h>
#include <sys/attribs.h>
#include <sys/kmem.h>  // KVA_TO_PA

#include "dma.h"
#include "gpio.h"

static uint8_t uart_tx_buf[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

void DMA_Initialize(void)
{
    /*
     * DMACON
     * DCHxCON: DMA CHANNEL x CONTROL REGISTER
     * DCHxECON: DMA CHANNEL x EVENT CONTROL REGISTER
     * DCHxINT: DMA CHANNEL x INTERRUPT CONTROL REGISTER
     * IECx
     * IFSx
     */
    
    IEC4bits.DMA0IE = 0;        /* disable DMA channel 0 interrupts */
    IFS4bits.DMA0IF = 0;        /* clear any existing DMA channel 0 interrupt flag */
    
    DMACONbits.ON = 1;          /* Enable DMA0 */
    
    DCH0CONbits.CHEN = 0;       /* Channel Enable bit : off */
    DCH0CONbits.CHPRI = 0b11;   /* Channel Priority bits : 3 (highest) */
    
    DCH0ECONbits.CHSIRQ = _UART1_TX_VECTOR;
    DCH0ECONbits.CHAIRQ = _UART1_FAULT_VECTOR;
    DCH0ECONbits.SIRQEN = 1; /* Channel Start IRQ Enable bit : enable */
    
    DCH0SSA = KVA_TO_PA( &( uart_tx_buf[0] ) ); /* transfer source physical address */
    DCH0DSA = KVA_TO_PA( &U1TXREG );            /* transfer destination physical address */
    DCH0SSIZ = 5;                               /* source size is n byte */
    DCH0DSIZ = 1;                               /* destination size at most 1 bytes */
    DCH0CSIZ = 1;                               /* one byte per UART transfer request */
    
    DCH0INTCLR = 0x00ff00ff;        /* Clear existing events, disable all interrupts */
    DCH0INTbits.CHBCIE = 1;          /* Channel Block Transfer Complete Interrupt Enable bit */
    
    IPC33CLR = 0x7C00000;           /* clear the DMA channel 0 priority and sub-priority */
    IPC33bits.DMA0IP = 0b001;       /* Set IPL 1 */
    IPC33bits.DMA0IS = 0b01;        /* Sub-priority 1 */
    IEC4bits.DMA0IE = 1;            /* DMA channel 0 interrupts bits : enable */
    DCH0CONbits.CHEN = 1;           /* Channel Enable bit : on */
}


void __ISR(_DMA0_VECTOR, IPL1AUTO) _InterruptDma0Handler(void)
{    
    // Toggle the LED
    //LED_2_Toggle();
    
    DCH0INTCLR = 0x00ff00ff;        /* Clear existing events, disable all interrupts */
    IEC4bits.DMA0IE = 0;        /* disable DMA channel 0 interrupts */
    IFS4bits.DMA0IF = 0;        /* clear any existing DMA channel 0 interrupt flag */
    DCH0CONbits.CHEN = 0;
}

/* *****************************************************************************
 End of File
 */
