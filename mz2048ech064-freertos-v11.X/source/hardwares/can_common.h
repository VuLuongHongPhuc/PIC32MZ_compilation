/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _CAN_COMMON_H    /* Guard against multiple inclusion */
#define _CAN_COMMON_H


/*** Includes *****************************************************************/


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif

    
#define CAN_MSG_IDE_MASK            (0x10000000U)
#define CAN_MSG_SID_MASK            (0x7FFU)
#define CAN_MSG_TIMESTAMP_MASK      (0xFFFF0000U)
#define CAN_MSG_EID_MASK            (0x1FFFFFFFU)
#define CAN_MSG_DLC_MASK            (0xFU)
#define CAN_MSG_RTR_MASK            (0x200U)
#define CAN_MSG_SRR_MASK            (0x20000000U)
    
    

/* @brief CAN Message Object Type RX Attribute for Data Frame and Remote Frame.
 */
typedef enum
{
    CAN_MSG_RX_DATA_FRAME = 0,
    CAN_MSG_RX_REMOTE_FRAME
} CAN_MSG_RX_ATTRIBUTE;

/* @brief CAN Message Object Type TX Attribute for Data Frame and Remote Frame.
 */
typedef enum
{
    CAN_MSG_TX_DATA_FRAME = 0,
    CAN_MSG_TX_REMOTE_FRAME
} CAN_MSG_TX_ATTRIBUTE;



/* @brief CAN Message Buffer structure - defines the CAN TX and RX Message Buffer format.
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


/* @brief CAN callback function pointer
 * @param contextHandle - loopback data
 */
typedef void (*CAN_CALLBACK) (uintptr_t contextHandle);  


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _CAN_COMMON_H */

/* *****************************************************************************
 End of File
 */
