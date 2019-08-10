/*
 * LedDrv.c
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */

#include "Drivers/LedDrv.h"

// Init
void LedInit(){

	// Enable clock
	RCC -> AHBENR |= ( RCC_AHBENR_GPIOAEN );

	// Output mode
	LED_PORT -> MODER &= ~(( 0x03u << ( 2ul * LED_CH1_bp )) |
						   ( 0x03u << ( 2ul * LED_CH2_bp )));
	LED_PORT -> MODER |=  (( 0x01u << ( 2ul * LED_CH1_bp )) |
						   ( 0x01u << ( 2ul * LED_CH2_bp )));

	// Led off
	LED_CH1_off();
	LED_CH2_off();
}


