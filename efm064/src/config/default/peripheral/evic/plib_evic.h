/*******************************************************************************
  EVIC PLIB Header

  Company:
    Microchip Technology Inc.

  File Name:
    plib_evic.h

  Summary:
    PIC32MZ Interrupt Module PLIB Header File

  Description:
    None

*******************************************************************************/

// DOM-IGNORE-BEGIN
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
// DOM-IGNORE-END

#ifndef PLIB_EVIC_H
#define PLIB_EVIC_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <device.h>
#include <stddef.h>
#include <stdbool.h>
#include <device.h>

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif
// DOM-IGNORE-END



// *****************************************************************************
// *****************************************************************************
// Section: Data Types
// *****************************************************************************
// *****************************************************************************

/* MISRAC 2012 deviation block start */
/* MISRA C-2012 Rule 5.4 deviated: 5  Deviation record ID -  H3_MISRAC_2012_R_5_4_DR_1 */
#define    INT_SOURCE_CORE_TIMER   (_CORE_TIMER_VECTOR)

#define    INT_SOURCE_CORE_SOFTWARE_0   (_CORE_SOFTWARE_0_VECTOR)

#define    INT_SOURCE_CORE_SOFTWARE_1   (_CORE_SOFTWARE_1_VECTOR)

#define    INT_SOURCE_EXTERNAL_0   (_EXTERNAL_0_VECTOR)

#define    INT_SOURCE_TIMER_1   (_TIMER_1_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_1_ERROR   (_INPUT_CAPTURE_1_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_1   (_INPUT_CAPTURE_1_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_1   (_OUTPUT_COMPARE_1_VECTOR)

#define    INT_SOURCE_EXTERNAL_1   (_EXTERNAL_1_VECTOR)

#define    INT_SOURCE_TIMER_2   (_TIMER_2_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_2_ERROR   (_INPUT_CAPTURE_2_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_2   (_INPUT_CAPTURE_2_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_2   (_OUTPUT_COMPARE_2_VECTOR)

#define    INT_SOURCE_EXTERNAL_2   (_EXTERNAL_2_VECTOR)

#define    INT_SOURCE_TIMER_3   (_TIMER_3_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_3_ERROR   (_INPUT_CAPTURE_3_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_3   (_INPUT_CAPTURE_3_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_3   (_OUTPUT_COMPARE_3_VECTOR)

#define    INT_SOURCE_EXTERNAL_3   (_EXTERNAL_3_VECTOR)

#define    INT_SOURCE_TIMER_4   (_TIMER_4_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_4_ERROR   (_INPUT_CAPTURE_4_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_4   (_INPUT_CAPTURE_4_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_4   (_OUTPUT_COMPARE_4_VECTOR)

#define    INT_SOURCE_EXTERNAL_4   (_EXTERNAL_4_VECTOR)

#define    INT_SOURCE_TIMER_5   (_TIMER_5_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_5_ERROR   (_INPUT_CAPTURE_5_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_5   (_INPUT_CAPTURE_5_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_5   (_OUTPUT_COMPARE_5_VECTOR)

#define    INT_SOURCE_TIMER_6   (_TIMER_6_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_6_ERROR   (_INPUT_CAPTURE_6_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_6   (_INPUT_CAPTURE_6_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_6   (_OUTPUT_COMPARE_6_VECTOR)

#define    INT_SOURCE_TIMER_7   (_TIMER_7_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_7_ERROR   (_INPUT_CAPTURE_7_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_7   (_INPUT_CAPTURE_7_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_7   (_OUTPUT_COMPARE_7_VECTOR)

#define    INT_SOURCE_TIMER_8   (_TIMER_8_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_8_ERROR   (_INPUT_CAPTURE_8_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_8   (_INPUT_CAPTURE_8_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_8   (_OUTPUT_COMPARE_8_VECTOR)

#define    INT_SOURCE_TIMER_9   (_TIMER_9_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_9_ERROR   (_INPUT_CAPTURE_9_ERROR_VECTOR)

#define    INT_SOURCE_INPUT_CAPTURE_9   (_INPUT_CAPTURE_9_VECTOR)

#define    INT_SOURCE_OUTPUT_COMPARE_9   (_OUTPUT_COMPARE_9_VECTOR)

#define    INT_SOURCE_ADC   (_ADC_VECTOR)

#define    INT_SOURCE_ADC_FIFO   (_ADC_FIFO_VECTOR)

#define    INT_SOURCE_ADC_DC1   (_ADC_DC1_VECTOR)

#define    INT_SOURCE_ADC_DC2   (_ADC_DC2_VECTOR)

#define    INT_SOURCE_ADC_DC3   (_ADC_DC3_VECTOR)

#define    INT_SOURCE_ADC_DC4   (_ADC_DC4_VECTOR)

#define    INT_SOURCE_ADC_DC5   (_ADC_DC5_VECTOR)

#define    INT_SOURCE_ADC_DC6   (_ADC_DC6_VECTOR)

#define    INT_SOURCE_ADC_DF1   (_ADC_DF1_VECTOR)

#define    INT_SOURCE_ADC_DF2   (_ADC_DF2_VECTOR)

#define    INT_SOURCE_ADC_DF3   (_ADC_DF3_VECTOR)

#define    INT_SOURCE_ADC_DF4   (_ADC_DF4_VECTOR)

#define    INT_SOURCE_ADC_DF5   (_ADC_DF5_VECTOR)

#define    INT_SOURCE_ADC_DF6   (_ADC_DF6_VECTOR)

#define    INT_SOURCE_ADC_FAULT   (_ADC_FAULT_VECTOR)

#define    INT_SOURCE_ADC_DATA0   (_ADC_DATA0_VECTOR)

#define    INT_SOURCE_ADC_DATA1   (_ADC_DATA1_VECTOR)

#define    INT_SOURCE_ADC_DATA2   (_ADC_DATA2_VECTOR)

#define    INT_SOURCE_ADC_DATA3   (_ADC_DATA3_VECTOR)

#define    INT_SOURCE_ADC_DATA4   (_ADC_DATA4_VECTOR)

#define    INT_SOURCE_ADC_DATA5   (_ADC_DATA5_VECTOR)

#define    INT_SOURCE_ADC_DATA6   (_ADC_DATA6_VECTOR)

#define    INT_SOURCE_ADC_DATA7   (_ADC_DATA7_VECTOR)

#define    INT_SOURCE_ADC_DATA8   (_ADC_DATA8_VECTOR)

#define    INT_SOURCE_ADC_DATA9   (_ADC_DATA9_VECTOR)

#define    INT_SOURCE_ADC_DATA10   (_ADC_DATA10_VECTOR)

#define    INT_SOURCE_ADC_DATA11   (_ADC_DATA11_VECTOR)

#define    INT_SOURCE_ADC_DATA12   (_ADC_DATA12_VECTOR)

#define    INT_SOURCE_ADC_DATA13   (_ADC_DATA13_VECTOR)

#define    INT_SOURCE_ADC_DATA14   (_ADC_DATA14_VECTOR)

#define    INT_SOURCE_ADC_DATA15   (_ADC_DATA15_VECTOR)

#define    INT_SOURCE_ADC_DATA16   (_ADC_DATA16_VECTOR)

#define    INT_SOURCE_ADC_DATA17   (_ADC_DATA17_VECTOR)

#define    INT_SOURCE_ADC_DATA18   (_ADC_DATA18_VECTOR)

#define    INT_SOURCE_ADC_DATA43   (_ADC_DATA43_VECTOR)

#define    INT_SOURCE_ADC_DATA44   (_ADC_DATA44_VECTOR)

#define    INT_SOURCE_CORE_PERF_COUNT   (_CORE_PERF_COUNT_VECTOR)

#define    INT_SOURCE_CORE_FAST_DEBUG_CHAN   (_CORE_FAST_DEBUG_CHAN_VECTOR)

#define    INT_SOURCE_SYSTEM_BUS_PROTECTION   (_SYSTEM_BUS_PROTECTION_VECTOR)

#define    INT_SOURCE_CRYPTO   (_CRYPTO_VECTOR)

#define    INT_SOURCE_SPI1_FAULT   (_SPI1_FAULT_VECTOR)

#define    INT_SOURCE_SPI1_RX   (_SPI1_RX_VECTOR)

#define    INT_SOURCE_SPI1_TX   (_SPI1_TX_VECTOR)

#define    INT_SOURCE_UART1_FAULT   (_UART1_FAULT_VECTOR)

#define    INT_SOURCE_UART1_RX   (_UART1_RX_VECTOR)

#define    INT_SOURCE_UART1_TX   (_UART1_TX_VECTOR)

#define    INT_SOURCE_I2C1_BUS   (_I2C1_BUS_VECTOR)

#define    INT_SOURCE_I2C1_SLAVE   (_I2C1_SLAVE_VECTOR)

#define    INT_SOURCE_I2C1_MASTER   (_I2C1_MASTER_VECTOR)

#define    INT_SOURCE_CHANGE_NOTICE_B   (_CHANGE_NOTICE_B_VECTOR)

#define    INT_SOURCE_CHANGE_NOTICE_C   (_CHANGE_NOTICE_C_VECTOR)

#define    INT_SOURCE_CHANGE_NOTICE_D   (_CHANGE_NOTICE_D_VECTOR)

#define    INT_SOURCE_CHANGE_NOTICE_E   (_CHANGE_NOTICE_E_VECTOR)

#define    INT_SOURCE_CHANGE_NOTICE_F   (_CHANGE_NOTICE_F_VECTOR)

#define    INT_SOURCE_CHANGE_NOTICE_G   (_CHANGE_NOTICE_G_VECTOR)

#define    INT_SOURCE_PMP   (_PMP_VECTOR)

#define    INT_SOURCE_PMP_ERROR   (_PMP_ERROR_VECTOR)

#define    INT_SOURCE_COMPARATOR_1   (_COMPARATOR_1_VECTOR)

#define    INT_SOURCE_COMPARATOR_2   (_COMPARATOR_2_VECTOR)

#define    INT_SOURCE_USB   (_USB_VECTOR)

#define    INT_SOURCE_USB_DMA   (_USB_DMA_VECTOR)

#define    INT_SOURCE_DMA0   (_DMA0_VECTOR)

#define    INT_SOURCE_DMA1   (_DMA1_VECTOR)

#define    INT_SOURCE_DMA2   (_DMA2_VECTOR)

#define    INT_SOURCE_DMA3   (_DMA3_VECTOR)

#define    INT_SOURCE_DMA4   (_DMA4_VECTOR)

#define    INT_SOURCE_DMA5   (_DMA5_VECTOR)

#define    INT_SOURCE_DMA6   (_DMA6_VECTOR)

#define    INT_SOURCE_DMA7   (_DMA7_VECTOR)

#define    INT_SOURCE_SPI2_FAULT   (_SPI2_FAULT_VECTOR)

#define    INT_SOURCE_SPI2_RX   (_SPI2_RX_VECTOR)

#define    INT_SOURCE_SPI2_TX   (_SPI2_TX_VECTOR)

#define    INT_SOURCE_UART2_FAULT   (_UART2_FAULT_VECTOR)

#define    INT_SOURCE_UART2_RX   (_UART2_RX_VECTOR)

#define    INT_SOURCE_UART2_TX   (_UART2_TX_VECTOR)

#define    INT_SOURCE_CAN1   (_CAN1_VECTOR)

#define    INT_SOURCE_CAN2   (_CAN2_VECTOR)

#define    INT_SOURCE_ETHERNET   (_ETHERNET_VECTOR)

#define    INT_SOURCE_SPI3_FAULT   (_SPI3_FAULT_VECTOR)

#define    INT_SOURCE_SPI3_RX   (_SPI3_RX_VECTOR)

#define    INT_SOURCE_SPI3_TX   (_SPI3_TX_VECTOR)

#define    INT_SOURCE_UART3_FAULT   (_UART3_FAULT_VECTOR)

#define    INT_SOURCE_UART3_RX   (_UART3_RX_VECTOR)

#define    INT_SOURCE_UART3_TX   (_UART3_TX_VECTOR)

#define    INT_SOURCE_I2C3_BUS   (_I2C3_BUS_VECTOR)

#define    INT_SOURCE_I2C3_SLAVE   (_I2C3_SLAVE_VECTOR)

#define    INT_SOURCE_I2C3_MASTER   (_I2C3_MASTER_VECTOR)

#define    INT_SOURCE_SPI4_FAULT   (_SPI4_FAULT_VECTOR)

#define    INT_SOURCE_SPI4_RX   (_SPI4_RX_VECTOR)

#define    INT_SOURCE_SPI4_TX   (_SPI4_TX_VECTOR)

#define    INT_SOURCE_RTCC   (_RTCC_VECTOR)

#define    INT_SOURCE_FLASH_CONTROL   (_FLASH_CONTROL_VECTOR)

#define    INT_SOURCE_PREFETCH   (_PREFETCH_VECTOR)

#define    INT_SOURCE_SQI1   (_SQI1_VECTOR)

#define    INT_SOURCE_UART4_FAULT   (_UART4_FAULT_VECTOR)

#define    INT_SOURCE_UART4_RX   (_UART4_RX_VECTOR)

#define    INT_SOURCE_UART4_TX   (_UART4_TX_VECTOR)

#define    INT_SOURCE_I2C4_BUS   (_I2C4_BUS_VECTOR)

#define    INT_SOURCE_I2C4_SLAVE   (_I2C4_SLAVE_VECTOR)

#define    INT_SOURCE_I2C4_MASTER   (_I2C4_MASTER_VECTOR)

#define    INT_SOURCE_UART5_FAULT   (_UART5_FAULT_VECTOR)

#define    INT_SOURCE_UART5_RX   (_UART5_RX_VECTOR)

#define    INT_SOURCE_UART5_TX   (_UART5_TX_VECTOR)

#define    INT_SOURCE_I2C5_BUS   (_I2C5_BUS_VECTOR)

#define    INT_SOURCE_I2C5_SLAVE   (_I2C5_SLAVE_VECTOR)

#define    INT_SOURCE_I2C5_MASTER   (_I2C5_MASTER_VECTOR)

#define    INT_SOURCE_UART6_FAULT   (_UART6_FAULT_VECTOR)

#define    INT_SOURCE_UART6_RX   (_UART6_RX_VECTOR)

#define    INT_SOURCE_UART6_TX   (_UART6_TX_VECTOR)

#define    INT_SOURCE_ADC_EOS   (_ADC_EOS_VECTOR)

#define    INT_SOURCE_ADC_ARDY   (_ADC_ARDY_VECTOR)

#define    INT_SOURCE_ADC_URDY   (_ADC_URDY_VECTOR)

#define    INT_SOURCE_ADC_EARLY   (_ADC_EARLY_VECTOR)

#define    INT_SOURCE_ADC0_EARLY   (_ADC0_EARLY_VECTOR)

#define    INT_SOURCE_ADC1_EARLY   (_ADC1_EARLY_VECTOR)

#define    INT_SOURCE_ADC2_EARLY   (_ADC2_EARLY_VECTOR)

#define    INT_SOURCE_ADC3_EARLY   (_ADC3_EARLY_VECTOR)

#define    INT_SOURCE_ADC4_EARLY   (_ADC4_EARLY_VECTOR)

#define    INT_SOURCE_ADC7_EARLY   (_ADC7_EARLY_VECTOR)

#define    INT_SOURCE_ADC0_WARM   (_ADC0_WARM_VECTOR)

#define    INT_SOURCE_ADC1_WARM   (_ADC1_WARM_VECTOR)

#define    INT_SOURCE_ADC2_WARM   (_ADC2_WARM_VECTOR)

#define    INT_SOURCE_ADC3_WARM   (_ADC3_WARM_VECTOR)

#define    INT_SOURCE_ADC4_WARM   (_ADC4_WARM_VECTOR)

#define    INT_SOURCE_ADC7_WARM   (_ADC7_WARM_VECTOR)

    /* MISRAC 2012 deviation block end */
typedef uint32_t INT_SOURCE;


// *****************************************************************************
// *****************************************************************************
// Section: Interface Routines
// *****************************************************************************
// *****************************************************************************

void EVIC_Initialize ( void );

void EVIC_SourceEnable( INT_SOURCE source );

void EVIC_SourceDisable( INT_SOURCE source );

bool EVIC_SourceIsEnabled( INT_SOURCE source );

bool EVIC_SourceStatusGet( INT_SOURCE source );

void EVIC_SourceStatusSet( INT_SOURCE source );

void EVIC_SourceStatusClear( INT_SOURCE source );

void EVIC_INT_Enable( void );

bool EVIC_INT_Disable( void );

void EVIC_INT_Restore( bool state );


// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END

#endif // PLIB_EVIC_H
