/*
 * SpiDrv.c
 *
 *  Created on: 3. sep. 2019
 *      Author: ZigaM
 */


#include "Drivers/SpiDrv.h"




// Init pins
void SpiPinsInit(){

	// Enable clock
	RCC -> AHBENR |= ( RCC_AHBENR_GPIOAEN );

	// Alternative functions
	SPI_port -> MODER &= ~(	(( 0x03u ) << ( 2ul * SPI_CLK_bp )) |
							(( 0x03u ) << ( 2ul * SPI_MISO_bp ))|
							(( 0x03u ) << ( 2ul * SPI_MOSI_bp ))|
							(( 0x03u ) << ( 2ul * SPI_CS_bp )));

	SPI_port -> MODER |=  (	(( 0x02u ) << ( 2ul * SPI_CLK_bp )) |
							(( 0x02u ) << ( 2ul * SPI_MISO_bp ))|
							(( 0x02u ) << ( 2ul * SPI_MOSI_bp )));


	// Alternative function number
#if ( SPI_CLK_bp > 7 )
	SPI_port -> AFR[1] &= ~( 0x0Fu << ( 4ul * ( SPI_CLK_bp - 8u )));
	SPI_port -> AFR[1] |= ( SPI_CLK_afnum << ( 4ul * ( SPI_CLK_bp - 8u )));
#else
	SPI_port -> AFR[0] &= ~( 0x0Fu << ( 4ul * SPI_CLK_bp ));
	SPI_port -> AFR[0] |= ( SPI_CLK_afnum << ( 4ul * SPI_CLK_bp ));
#endif

#if ( SPI_MOSI_bp > 7 )
	SPI_port -> AFR[1] &= ~( 0x0Fu << ( 4ul * ( SPI_MOSI_bp - 8u )));
	SPI_port -> AFR[1] |= ( SPI_MOSI_afnum << ( 4ul * ( SPI_MOSI_bp - 8u )));
#else
	SPI_port -> AFR[0] &= ~( 0x0Fu << ( 4ul * SPI_MOSI_bp ));
	SPI_port -> AFR[0] |= ( SPI_MOSI_afnum << ( 4ul * SPI_MOSI_bp ));
#endif

#if ( SPI_MISO_bp > 7 )
	SPI_port -> AFR[1] &= ~( 0x0Fu << ( 4ul * ( SPI_MISO_bp - 8u )));
	SPI_port -> AFR[1] |= ( SPI_MISO_afnum << ( 4ul * ( SPI_MISO_bp - 8u )));
#else
	SPI_port -> AFR[0] &= ~( 0x0Fu << ( 4ul * SPI_MISO_bp ));
	SPI_port -> AFR[0] |= ( SPI_MISO_afnum << ( 4ul * SPI_MISO_bp ));
#endif

	// CS standart output
	SPI_port -> MODER |= ( 0x01u << ( 2ul * SPI_CS_bp ));

	// CS high
	SPI_CS_high();
}


// Init dma
void SpiDmaInit(){


}


// Init spi
void SpiInit(){

	// Init pins
	SpiPinsInit();

	// Init dma
	//SpiDmaInit();

	// Enable SPI
	RCC -> APB2ENR |= ( RCC_APB2ENR_SPI1EN );

	// Disable SPI
	SPI -> CR1 = 0;

	// Fifo threahold
	// 8-bit data mode
	SPI -> CR2 = ( SPI_CR2_FRXTH | SPI_CR2_DS_0 | SPI_CR2_DS_1 | SPI_CR2_DS_2 | SPI_CR2_SSOE );

	// 1MHz baud
	// Enable SPI
	SPI -> CR1 = ( SPI_CR1_BR_1 | SPI_CR1_BR_0 | SPI_CR1_SPE | SPI_CR1_MSTR );
}



// Send byte
uint8_t SpiSendByte(uint8_t data){

	while(( SPI -> SR & SPI_SR_TXE ) != SPI_SR_TXE );
	*(uint8_t*) &( SPI -> DR ) = (uint8_t) ( data );

	while(( SPI -> SR & SPI_SR_RXNE ) != SPI_SR_RXNE );
	return (uint8_t) ( SPI -> DR );
}



// Send array
uint8_t *SpiSendArray(uint8_t *buf, uint8_t size){

	static uint8_t data[10];

	SPI_CS_low();
	for(uint8_t i = 0; i < size; i++){
		data[i] = SpiSendByte( buf[i] );
	}
	SPI_CS_high();
	return (uint8_t*) &( data );
}


// Check timeout flag for rx buffer
uint8_t SpiGetRxBufferTimeoutFlag(){

	static uint32_t now = 0ul;
	if ( (uint32_t) ( millis() - now ) >= SPI_CHECK_RX_BUFFER_TIME ){
		now = millis();
		return 1u;
	}
	else{
		return 0u;
	}
}

