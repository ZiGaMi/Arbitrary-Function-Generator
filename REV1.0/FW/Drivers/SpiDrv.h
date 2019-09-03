/*
 * SpiDrv.h
 *
 *  Created on: 3. sep. 2019
 *      Author: ZigaM
 */

#ifndef DRIVERS_SPIDRV_H_
#define DRIVERS_SPIDRV_H_

#include "stm32f0xx.h"



////////////////////////////////////////////////////////////////////////////////
//
//		Periphery
//
////////////////////////////////////////////////////////////////////////////////

// SPI
#define SPI					( SPI1 )

// SPI Tx DMA Channel
#define SPI_DMA_TX_CH		( DMA1_Channel2 )

// SPI Rx DMA Channel
#define SPI_DMA_RX_CH		( DMA1_Channel3 )




////////////////////////////////////////////////////////////////////////////////
//
//		Port / Pins defines
//
////////////////////////////////////////////////////////////////////////////////

#define SPI_port			( GPIOA )

#define SPI_CLK_bp			( 5u )
#define SPI_CLK_msk			( uint16_t ) ( 0x01u << SPI_CLK_bp )
#define SPI_CLK_afnum		( 0u )

#define SPI_MISO_bp			( 6u )
#define SPI_MISO_msk		( uint16_t ) ( 0x01u << SPI_MISO_bp )
#define SPI_CLK_afnum		( 0u )

#define SPI_MOSI_bp			( 7u )
#define SPI_MOSI_msk		( uint16_t ) ( 0x01u << SPI_MOSI_bp )
#define SPI_CLK_afnum		( 0u )

#define SPI_CS_bp			( 4u )
#define SPI_CS_msk			( uint16_t ) ( 0x01u << SPI_CS_bp )




////////////////////////////////////////////////////////////////////////////////
//
//		SPI macros
//
////////////////////////////////////////////////////////////////////////////////

// Chip select
#define SPI_CS_high()		( SPI_port -> ODR |= ( SPI_CS_msk ))
#define SPI_CS_low()		( SPI_port -> ODR &= ~( SPI_CS_msk ))



////////////////////////////////////////////////////////////////////////////////
//
//		Function prototypes
//
////////////////////////////////////////////////////////////////////////////////

// Init pins
void SpiPinsInit(void);

// Init dma
void SpiDmaInit(void);

// Init spi
void SpiInit(void);






#endif /* DRIVERS_SPIDRV_H_ */
