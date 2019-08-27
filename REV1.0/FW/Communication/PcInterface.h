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

// CRC			0x..			( CRC includes length)

#define PROTOCOL_HEADER				( uint8_t* ) 	( "\xAA\x55" )
#define PROTOCOL_HEADER_size		( uint8_t )		( 2u )			// bytes


// Waveform code
#define P_WAVEFORM_CODE_SINE		( uint8_t )		( 0xC0u )
#define P_WAVEFORM_CODE_SQRT		( uint8_t )		( 0xC1u )
#define P_WAVEFORM_CODE_RECT		( uint8_t )		( 0xC2u )
#define P_WAVEFORM_CODE_SAW			( uint8_t )		( 0xC3u )


////////////////////////////////////////////////////////////////////////////////
//
//	Packet checker timer
//
////////////////////////////////////////////////////////////////////////////////

// Checking reception buffer time
#define P_CHECK_TIM_time			( uint16_t ) ( 100u )		// ms




////////////////////////////////////////////////////////////////////////////////
//
//	PC Interface Data Structure
//
////////////////////////////////////////////////////////////////////////////////

typedef struct{

	uint8_t		newDataAvailable;			// New data in buffer flag
	uint8_t 	*data;						// Buffer of parsed data
	uint8_t 	crcOK;						// Data packet error check flag
}PcInterfaceDataTypeDef;





////////////////////////////////////////////////////////////////////////////////
//
//		Functions
//
////////////////////////////////////////////////////////////////////////////////

// Parse data
uint8_t *PcInterfaceParseData(uint8_t*, uint8_t);

// Check reception buffer check timeout flag
uint8_t PcInterfaceGetRxBufCheckTimeoutFlag(void);

// Check CRC
uint8_t PcInterfaceGetCrcCheckFlag(uint8_t*);

// Apply command from PC
void PcInterfaceApplyCommand(PcInterfaceDataTypeDef*);




#endif /* COMMUNICATION_PCINTERFACE_H_ */
