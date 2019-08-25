/*
 * PcInterface.h
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */

#ifndef COMMUNICATION_PCINTERFACE_H_
#define COMMUNICATION_PCINTERFACE_H_

#include "stm32f0xx.h"
#include "stdlib.h"
#include "string.h"

#include "Drivers/ClockDrv.h"
#include "Drivers/UartDrv.h"



////////////////////////////////////////////////////////////////////////////////
//
//	Protocol descriptions
//
////////////////////////////////////////////////////////////////////////////////

// Header		0xAA55
// Length		0x..
// Data			length bytes
// CRC			0x..

#define PROTOCOL_HEADER				( uint8_t* ) 	( "\xAA\x55" )
#define PROTOCOL_HEADER_size		( uint8_t )		( 2u )			// bytes





////////////////////////////////////////////////////////////////////////////////
//
//	Packet checker timer
//
////////////////////////////////////////////////////////////////////////////////

// Checking reception buffer time
#define P_CHECK_TIM_time			( uint16_t ) ( 50u )		// ms




////////////////////////////////////////////////////////////////////////////////
//
//	PC Interface Data Structure
//
////////////////////////////////////////////////////////////////////////////////

typedef struct{

	bool 	newDataAvailable;			// New data in buffer flag
	uint8_t *data;						// Buffer of parsed data
	bool	crcOK;						// Data packet error check flag
}PcInterfaceDataTypeDef;





////////////////////////////////////////////////////////////////////////////////
//
//		Functions
//
////////////////////////////////////////////////////////////////////////////////

// Parse data
uint8_t *PcInterfaceParseData(uint8_t*, uint8_t);

// Check reception buffer check timeout flag
bool PcInterfaceGetRxBufCheckTimeoutFlag(void);

// Check CRC
bool PcInterfaceGetCrcCheckFlag(uint8_t*);

// Apply command from PC
void PcInterfaceApplyCommand(PcInterfaceDataTypeDef*);




#endif /* COMMUNICATION_PCINTERFACE_H_ */
