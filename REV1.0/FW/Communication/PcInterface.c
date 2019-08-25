/*
 * PcInterface.c
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */


#include "Communication/PcInterface.h"



// Make copy of reception buffer
static void bufferCopy(uint8_t *dest, uint8_t *src, uint8_t size){
	for ( uint8_t i = 0u; i < size; i++ ){
		*( dest + i ) = *( src + i );
	}
}


// Find header
// Returns index position at start of header
static uint8_t getHeaderIndex(uint8_t *buf, uint8_t b_size, uint8_t *header, uint8_t h_size){

	uint8_t h_pos = ( b_size + h_size );
	uint8_t h_idx = 0u;
	for ( uint8_t i = 0; i < ( b_size + h_size ); i++ ){
		//if ( *( buf + ( i % b_size )) == *( header + ( h_idx % h_size ))){
		if ( *( buf + ( i % b_size )) == *( header + h_idx )){
			h_idx++;
			if ( h_idx == h_size ){
				h_pos = (( i + 1u ) % b_size );
				break;
			}
		}
		else{
			h_idx = 0u;
		}
	}
	return h_pos;
}


// Parse data
// Arguments: input buffer, size of input buffer
uint8_t *PcInterfaceParseData(uint8_t *rx_buffer, uint8_t size){

	static uint8_t data[UART_RX_BUF_SIZE];
	uint8_t rx_working_buffer[UART_RX_BUF_SIZE];

	// Make a working copy
	bufferCopy((uint8_t*) &rx_working_buffer, (uint8_t*) rx_buffer, size);

	// Get header index
	uint8_t len_idx = getHeaderIndex((uint8_t*) rx_working_buffer, size, PROTOCOL_HEADER, PROTOCOL_HEADER_size);

	// Header detected
	if ( len_idx != size ){

		// Get data length
		// Including also length itself
		uint8_t len = ( rx_working_buffer[len_idx] + 1u );

		// Get data
		uint8_t idx = 0u;
		while ( len-- ){
			data[( idx % size )] = rx_working_buffer[(( idx + len_idx ) % size )];
			idx++;
		}
		return (uint8_t*) ( &data );
	}
	else{
		return NULL;
	}
}



// Check reception buffer check timeout flag
bool PcInterfaceGetRxBufCheckTimeoutFlag(){

	static uint16_t sys_clk = 0u;

	if (( SysGetTick() > sys_clk ) && ( ( SysGetTick() - sys_clk ) >= P_CHECK_TIM_time  ) ){
		sys_clk = SysGetTick();
		return true;
	}
	else if (( SysGetTick() < sys_clk ) && ( ( 0x10000u - sys_clk + SysGetTick() ) >= P_CHECK_TIM_time )) {
		sys_clk = SysGetTick();
		return true;
	}
	else{
		return false;
	}
}




