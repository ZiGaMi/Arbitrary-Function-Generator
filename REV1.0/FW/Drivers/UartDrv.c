/*
 * UartDrv.c
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */


#include "Drivers/UartDrv.h"


// Reception buffer
uint8_t rxBuffer[ UART_RX_BUF_SIZE ];

// Working buffer
uint8_t rxBuffer_temp[ UART_RX_BUF_SIZE ];


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
#if ( UART_TX_bp > 7u )
	UART_port -> AFR[1] &= ~( 0x0F << ( 4ul * ( UART_TX_bp - 8u )));
	UART_port -> AFR[1] |=  ( UART_TX_afnum << ( 4ul * ( UART_TX_bp - 8u)));
#else
	UART_port -> AFR[0] &= ~( 0x0F << ( 4ul * UART_TX_bp ));
	UART_port -> AFR[0] |=  ( UART_TX_afnum << ( 4ul * UART_TX_bp ));
#endif

#if ( UART_RX_bp > 7u )
	UART_port -> AFR[1] &= ~( 0x0F << ( 4ul * ( UART_RX_bp - 8u )));
	UART_port -> AFR[1] |=  ( UART_RX_afnum << ( 4ul * ( UART_RX_bp - 8u )));
#else
	UART_port -> AFR[0] &= ~( 0x0F << ( 4ul * UART_RX_bp ));
	UART_port -> AFR[0] |=  ( UART_RX_afnum << ( 4ul * UART_RX_bp ));
#endif
}


// Init dma
void UartDmaInit(){

	// Enable DMA clock
	RCC -> AHBENR |= RCC_AHBENR_DMA1EN;

	//
	// 	Configure UART RX DMA Stream
	//

	// Make sure that DMA streams are remapped
#if ( UART_DMA_RX_REMAP)

	// Enable system configuration clock
	RCC -> APB2ENR |= (RCC_APB2ENR_SYSCFGEN );

	// Remap DMA
	SYSCFG -> CFGR1 |= ( SYSCFG_CFGR1_USART1RX_DMA_RMP );
#endif

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
	// Read from periphery
	UART_DMA_RX_CH -> CCR = ( DMA_CCR_EN | DMA_CCR_PL_0 | DMA_CCR_MINC );


	//
	// 	Configure UART TX DMA Stream
	//

	// Make sure that DMA streams are remapped
#if ( UART_DMA_TX_REMAP )

	// Remap DMA
	SYSCFG -> CFGR1 |= ( SYSCFG_CFGR1_USART1TX_DMA_RMP );
#endif

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



// Check for new data in reception buffer
uint8_t UartRxNewDataReady(){

	if ((( UART_DMA_RX_CH -> CNDTR ) != UART_RX_BUF_SIZE ) && ( !UART_RX_BUSY_get() )){

		// Copy rx data to working buffer
		for ( uint8_t i = 0; i < UART_RX_BUF_SIZE; i++ ){
			rxBuffer_temp[i] = rxBuffer[i];
		}

		return 1;
	}
	else{
		return 0;
	}
}

// Clear new data flag
void UartRxReintiDma(){
	UART_DMA_RX_CH -> CCR &= ~( DMA_CCR_EN );
	UART_DMA_RX_CH -> CNDTR = ( uint32_t ) ( UART_RX_BUF_SIZE );
	UART_DMA_RX_CH -> CCR |= ( DMA_CCR_EN );
}


// Get Rx buffer
uint8_t *UartGetRxBuffer(){
	return (uint8_t*) &( rxBuffer_temp );
}


