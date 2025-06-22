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

#include "xc.h"
#include <sys/attribs.h>  // IPLxAUTO, IPLxSRS

#include "uart1.h"

static uint16_t Baudrate(uint16_t baud);

void UART1_Initialize(void)
{
    /*
     * UxMode
     * UxSTA
     * UxTXREG
     * UxRXREG
     * UxBRG
     * 
     * FIFO 8 level deep
     */
    
    /* Disable */
    U1MODEbits.ON = 0;
    
    /* UxMode Default 8N1 */
    
    /* UxSTA */
    U1STAbits.URXEN = 1;
    U1STAbits.UTXEN = 1;
    U1STAbits.OERR = 0;
    
    U1BRG = Baudrate(115200);
    
    /* Enable */
    U1MODEbits.ON = 1;
    
    /* Set interrupt */
    
    
    /* Pins remap */
    RPB3R = 0b0001; // U1TX RB3 pin.13
    U1RXR = 0b1000; // U1RX RB5 pin.11
}


static uint16_t Baudrate(uint16_t baud)
{
    uint32_t ret = 0;
    
    ret = 50000000;
    ret /= (16*115200);
    ret--;
    
    return (uint16_t)ret;
}


/* *****************************************************************************
 End of File
 */
