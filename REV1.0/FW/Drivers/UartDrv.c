/*
 * UartDrv.c
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */


#include "Drivers/UartDrv.h"


// Initialize uart
void UartInit(){

	// Enable GPIOA clock
	RCC -> AHBENR |= RCC_AHBENR_GPIOAEN;

	// Enable UART1 clock
	RCC -> APB2ENR |= RCC_APB2ENR_USART1EN;

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

	// Disable uart
	UART -> CR1 &= ~ ( USART_CR1_UE );

	// Enable Rx & Tx, enable Rx interrupt
	UART -> CR1 |= ( USART_CR1_RE |	USART_CR1_TE );

	// Baudrate
	UART -> BRR = ( uint32_t ) ( SYS_CLK_FREQ / UART_BAUDRATE );

	// Enable DMA on receiver and transmitter
	UART -> CR3 |= ( USART_CR3_DMAR | USART_CR3_DMAT );

	// Enable uart
	UART -> CR1 |= USART_CR1_UE;
}


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



// Send packet
void UartSendBuffer(uint8_t *tx_buf, uint32_t size){

	// Disable DMA channel
	DMA1_Channel2 -> CCR &= ~( DMA_CCR_EN );

	// Number of data to transmit
	DMA1_Channel2 -> CNDTR = ( uint32_t ) ( size );

	// Read from
	DMA1_Channel2 -> CMAR = ( uint32_t ) ( tx_buf );

	// Enable channel
	DMA1_Channel2 -> CCR |= ( DMA_CCR_EN );
}


//uint32_t dma_counter_prew = ( DMA1_Channel3 -> CNDTR );

// Check for new data in reception buffer
bool UartGetRxBufferNewDataFlag(){

	// Previous DMA counter
	static uint16_t dma_counter_prew = UART_RX_BUF_SIZE;

	if (( dma_counter_prew != ( DMA1_Channel3 -> CNDTR )) && ( !UART_RX_BUSY_get())){
		dma_counter_prew = ( DMA1_Channel3 -> CNDTR );
		return true;
	}
	else{
		return false;
	}
}

