/*
 * PcInterface.c
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */


#include "Communication/PcInterface.h"


// Parsed data
uint8_t parsedData[ UART_RX_BUF_SIZE ];

// Message from PC
pcMessage pcMsg;




// Find header
// Returns index position at start of header
static uint8_t getHeaderIndex(uint8_t *buf, uint8_t *header, uint8_t h_size){

	uint8_t h_pos = 0;
	uint8_t h_idx = 0;
	for ( uint8_t i = 0; i < UART_RX_BUF_SIZE; i++ ){
		if ( *( buf + i ) == *( header + h_idx )){
			h_idx++;
			if ( h_idx == h_size ){
				h_pos = ( i - h_size + 1 );
				break;
			}
		}
		else{
			h_idx = 0;
		}
	}

	return h_pos;
}



// Check CRC
static uint8_t PcInterfaceGetCrcCheckFlag(){

	// Get send crc
	uint8_t crc = parsedData[ parsedData[0] ];

	// Calculate crc
	uint8_t crc_calc = 0u;
	for ( uint8_t i = 0; i < parsedData[0]; i++ ){
		crc_calc ^= parsedData[i];
	}

	return ( uint8_t ) ( crc == crc_calc );
}



// Parse data
// Arguments: input buffer, size of input buffer
void PcInterfaceParseData(uint8_t *rx_buf){

	//static uint8_t data[UART_RX_BUF_SIZE];

	// Find header
	uint8_t h_pos = getHeaderIndex(rx_buf, PROTOCOL_HEADER, PROTOCOL_HEADER_size);

	// Get msg lenght ( lenght in message doesn't count itself )
	uint8_t msg_len = ( *( rx_buf + h_pos + PROTOCOL_HEADER_size ) + 1 );

	// Ignore header
	for ( uint8_t i = 0; i < msg_len; i++){
		parsedData[i] = *( rx_buf + h_pos + PROTOCOL_HEADER_size + i);
	}

	// If CRC not OK -> Clear buffer
	if ( !PcInterfaceGetCrcCheckFlag() ){
		for ( uint8_t i = 0; i < UART_RX_BUF_SIZE; i++ ){
			parsedData[i] = 0;
		}
		pcMsg.cmd = 0u;
		pcMsg.freq = 0ul;
	}
	else{
		pcMsg.cmd = parsedData[1];
		pcMsg.freq = (uint32_t) ((( parsedData[2] << 24u ) & 0xFF000000 ) | (( parsedData[3] << 16u ) & 0xFF0000 ) | (( parsedData[4] << 8u ) & 0xFF00 ) | ( parsedData[5] & 0xFF ));
	}
}



// Check reception buffer check timeout flag
uint8_t PcInterfaceGetRxBufCheckTimeoutFlag(){

	static uint16_t sys_clk = 0u;

	if (( SysGetTick() > sys_clk ) && ( ( SysGetTick() - sys_clk ) >= P_CHECK_TIM_time  ) ){
		sys_clk = SysGetTick();
		return 1;
	}
	else if (( SysGetTick() < sys_clk ) && ( ( 0x10000u - sys_clk + SysGetTick() ) >= P_CHECK_TIM_time )) {
		sys_clk = SysGetTick();
		return 1;
	}
	else{
		return 0;
	}
}



// Get parsed data
uint8_t *PcInterfaceGetParsedData(){
	return (uint8_t*) &( parsedData );
}



// Apply command from PC
void PcInterfaceApplyCommand(){

	switch( pcMsg.cmd ){

		case P_WAVEFORM_CODE_SINE:
			UartSendBuffer((uint8_t*) "\x01", 1);
			break;

		case P_WAVEFORM_CODE_SQRT:
			UartSendBuffer((uint8_t*) "\x02", 1);
			break;

		case P_WAVEFORM_CODE_RECT:
			UartSendBuffer((uint8_t*) "\x03", 1);
			break;

		case P_WAVEFORM_CODE_SAW:
			UartSendBuffer((uint8_t*) "\x04", 1);
			break;

		default:
			UartSendBuffer((uint8_t*) "\xFF", 1);
			break;
	}
}



