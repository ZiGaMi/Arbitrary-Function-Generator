/*
 * UartDrv.c
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */


#include "Drivers/UartDrv.h"


// Reception buffer
uint8_t rxBuffer[ UART_RX_BUF_SIZE ];


// Init pins
void UartPinsInit(){

	// Enable GPIOA clock
	RCC -> AHBENR |= RCC_AHBENR_GPIOAEN;

	// Alternative function
	UART_port -> MODER &= ~(( 0x03u << ( 2ul * UART_RX_bp )) | ( 0x03u << ( 2ul * UART_TX_bp )));
	UART_port -> MODER |=  (( 0x02u << ( 2ul * UART_RX_bp )) | ( 0x02u << ( 2ul * UART_TX_bp )));

	// High speed
	UART_port -> OSPEEDR |= (( 0x03u << ( 2ul * UART_RX_bp )) | ( 0x03u << ( 2ul * UART_TX_bp )));

	// Alternative function
	UART_port -> AFR[0] &= ~( 0x0F << ( 4ul * UART_TX_bp ));
	UART_port -> AFR[0] |=  ( UART_TX_afnum << ( 4ul * UART_TX_bp ));

	UART_port -> AFR[0] &= ~( 0x0F << ( 4ul * UART_RX_bp ));
	UART_port -> AFR[0] |=  ( UART_RX_afnum << ( 4ul * UART_RX_bp ));
}


// Init dma
void UartDmaInit(){

	//
	// 	Configure UART RX DMA Stream
	//

	// Enable DMA clock
	RCC -> AHBENR |= RCC_AHBENR_DMA1EN;

	// Disable DMA channel
	UART_DMA_RX_CH -> CCR &= ~( DMA_CCR_EN );

	// Number of data to transfer
	UART_DMA_RX_CH -> CNDTR = ( uint16_t ) ( UART_RX_BUF_SIZE );

	// Peripheral address to read from
	UART_DMA_RX_CH -> CPAR = ( uint32_t ) &( USART1 -> RDR );

	// Memory address to write to
	UART_DMA_RX_CH -> CMAR = ( uint32_t ) ( &rxBuffer );

	// Enable channel
	// Medium priority
	// Memory increment mode
	// Circular mode
	// Read from periphery
	UART_DMA_RX_CH -> CCR = ( DMA_CCR_EN | DMA_CCR_PL_0 | DMA_CCR_MINC | DMA_CCR_CIRC);



	//
	// 	Configure UART TX DMA Stream
	//

	// Disable DMA channel
	UART_DMA_TX_CH -> CCR = 0;

	// Medium priority
	// Memory increment mode
	// Read from memory
	UART_DMA_TX_CH -> CCR |= ( DMA_CCR_PL_0 | DMA_CCR_MINC | DMA_CCR_DIR );

	// Peripheral address to read from
	UART_DMA_TX_CH -> CPAR = ( uint32_t ) &( USART1 -> TDR );
}


// Initialize uart
void UartInit(){

	// Init pins
	UartPinsInit();

	// Init dma
	UartDmaInit();

	// Enable UART1 clock
	RCC -> APB2ENR |= RCC_APB2ENR_USART1EN;

	// Disable uart
	UART -> CR1 = 0u;

	// Enable Rx & Tx, enable Rx interrupt
	//UART -> CR1 |= ( USART_CR1_RE |	USART_CR1_TE );

	// Baudrate
	UART -> BRR = ( uint32_t ) ( SYS_CLK_FREQ / UART_BAUDRATE );

	// Enable DMA on receiver and transmitter
	UART -> CR3 |= ( USART_CR3_DMAR | USART_CR3_DMAT );

	// Enable UART, nable Rx & Tx, enable Rx interrupt
	UART -> CR1 |= ( USART_CR1_UE | USART_CR1_RE |	USART_CR1_TE );
}

/*
// Initialize uart1 DMA
void UartDmaInit(uint8_t *rx_buffer){

	//
	// 	Configure URAT RX DMA Stream
	//
	//  DMA1, Stream1, channel 3
	//

	// Make sure that UART RX Stream aren't remapped
	SYSCFG -> CFGR1 &= ~( SYSCFG_CFGR1_USART1RX_DMA_RMP );

	// Enable DMA clock
	RCC -> AHBENR |= RCC_AHBENR_DMA1EN;

	// Disable DMA channel
	DMA1_Channel3 -> CCR &= ~( DMA_CCR_EN );


	// Medium priority
	// Memory increment mode
	// Circular mode
	// Read from periphery
	DMA1_Channel3 -> CCR |= ( DMA_CCR_PL_0 | DMA_CCR_MINC | DMA_CCR_CIRC);

	// Number of data to transfer
	DMA1_Channel3 -> CNDTR = ( uint16_t ) ( UART_RX_BUF_SIZE );

	// Peripheral address to read from
	DMA1_Channel3 -> CPAR = ( uint32_t ) &( USART1 -> RDR );

	// Memory address to write to
	DMA1_Channel3 -> CMAR = ( uint32_t ) ( rx_buffer );

	// Enable channel
	DMA1_Channel3 -> CCR |= ( DMA_CCR_EN );



	//
	// 	Configure UART TX DMA Stream
	//
	//  DMA1, Stream1, channel 2
	//

	// Make sure that UART RX Stream aren't remapped
	SYSCFG -> CFGR1 &= ~( SYSCFG_CFGR1_USART1TX_DMA_RMP );

	// Disable DMA channel
	DMA1_Channel2 -> CCR &= ~( DMA_CCR_EN );

	// Medium priority
	// Memory increment mode
	// Read from memory
	DMA1_Channel2 -> CCR |= ( DMA_CCR_PL_0 | DMA_CCR_MINC | DMA_CCR_DIR );

	// Peripheral address to read from
	DMA1_Channel2 -> CPAR = ( uint32_t ) &( USART1 -> TDR );
}
*/



// Send packet
void UartSendBuffer(uint8_t *tx_buf, uint32_t size){

	// Disable DMA channel
	UART_DMA_TX_CH -> CCR &= ~( DMA_CCR_EN );

	// Number of data to transmit
	UART_DMA_TX_CH -> CNDTR = ( uint32_t ) ( size );

	// Read from
	UART_DMA_TX_CH -> CMAR = ( uint32_t ) ( tx_buf );

	// Enable channel
	UART_DMA_TX_CH -> CCR |= ( DMA_CCR_EN );
}


// Previous dma counter
uint32_t dma_counter_prew = UART_RX_BUF_SIZE;

// Check for new data in reception buffer
uint8_t UartGetRxBufferNewDataFlag(){

	// Previous DMA counter
	static uint16_t dma_counter_prew = UART_RX_BUF_SIZE;

	if (( dma_counter_prew != ( UART_DMA_RX_CH -> CNDTR )) && ( !UART_RX_BUSY_get())){
		dma_counter_prew = ( UART_DMA_RX_CH -> CNDTR );
		return 1;
	}
	else{
		return 0;
	}
}


// Get Rx buffer
uint8_t *UartGetRxBuffer(){
	return (uint8_t*) &rxBuffer;
}

// Get last msg
uint8_t *UartGetLastMsg(){

	// Previous msg pointer
	static uint8_t msg_p_prev = UART_RX_BUF_SIZE;

	// Working buffer
	static uint8_t rxWorkingBuffer[ UART_RX_BUF_SIZE ];

	uint8_t msg_len = 0;

	if (( UART_DMA_RX_CH -> CNDTR ) > msg_p_prev ){
		msg_len = (( UART_DMA_RX_CH -> CNDTR ) - msg_p_prev);
	}

	else if (( UART_DMA_RX_CH -> CNDTR ) > msg_p_prev ){
		msg_len = ( UART_RX_BUF_SIZE - msg_p_prev + ( UART_DMA_RX_CH -> CNDTR ));
	}

	for ( uint8_t i = 0; i < msg_len; i++){
		rxWorkingBuffer[i] = rxBuffer[(( msg_p_prev + i ) % UART_RX_BUF_SIZE ) ];
	}

	// Store msg pointer
	msg_p_prev = ( UART_DMA_RX_CH -> CNDTR );

	return ( uint8_t* ) &rxWorkingBuffer;
}
