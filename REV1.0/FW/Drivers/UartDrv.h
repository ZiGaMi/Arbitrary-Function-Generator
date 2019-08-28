/*
 * UartDrv.h
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */

#ifndef DRIVERS_UARTDRV_H_
#define DRIVERS_UARTDRV_H_

#include "stm32f0xx.h"

#include "Drivers/ClockDrv.h"


////////////////////////////////////////////////////////////////////////////////
//
//		Periphery
//
////////////////////////////////////////////////////////////////////////////////

// UART
#define UART					( USART1 )

// TX DMA Channel
#define UART_DMA_TX_CH			( DMA1_Channel2 )

// RX DMA Channel
#define UART_DMA_RX_CH			( DMA1_Channel3 )




////////////////////////////////////////////////////////////////////////////////
//
//		Port / Pins defines
//
////////////////////////////////////////////////////////////////////////////////

#define UART_port 				( GPIOA )

#define UART_TX_bp				( 2ul )
#define UART_TX_msk				( 0x01u << UART_TX_bp )
#define UART_TX_afnum			( 1ul )

#define UART_RX_bp				( 3ul )
#define UART_RX_msk				( 0x01u << UART_RX_bp )
#define UART_RX_afnum			( 1ul )




////////////////////////////////////////////////////////////////////////////////
//
//		UART Settings
//
////////////////////////////////////////////////////////////////////////////////

// Baud rate
#define UART_BAUDRATE			( 115200u )

// Reception buffer size
#define UART_RX_BUF_SIZE		( 20u )



////////////////////////////////////////////////////////////////////////////////
//
//		Macros
//
////////////////////////////////////////////////////////////////////////////////

// Check if reception is in progress
#define UART_RX_BUSY_get()			( uint8_t ) (( UART -> ISR & USART_ISR_BUSY ) == USART_ISR_BUSY )




////////////////////////////////////////////////////////////////////////////////
//
//		Function prototypes
//
////////////////////////////////////////////////////////////////////////////////

// Init UART pins
void UartPinsInit(void);

// Initialize uart DMA
void UartDmaInit(void);

// Initialize uart
void UartInit(void);

// Send packet
void UartSendBuffer(uint8_t*, uint32_t);

// Check for new data in reception buffer
uint8_t UartRxNewDataReady(void);

// Set new number of data to transmit
void UartRxReintiDma(void);

// Get Rx buffer
uint8_t *UartGetRxBuffer(void);




#endif /* DRIVERS_UARTDRV_H_ */
