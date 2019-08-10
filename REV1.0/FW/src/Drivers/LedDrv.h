/*
 * LedDrv.h
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */

#ifndef DRIVERS_LEDDRV_H_
#define DRIVERS_LEDDRV_H_


#include "stm32f0xx.h"


///////////////////////////////////////////////////////////////
//
//		Port/Pin defines
//
///////////////////////////////////////////////////////////////

#define LED_PORT 					( GPIOA )

#define LED_CH1_bp					( uint8_t ) ( 0u )
#define LED_CH1_msk					( uint16_t ) ( 0x01u << LED_CH1_bp )

#define LED_CH2_bp					( uint8_t ) ( 1u )
#define LED_CH2_msk					( uint16_t ) ( 0x01u << LED_CH2_bp )



///////////////////////////////////////////////////////////////
//
//		Macros
//
///////////////////////////////////////////////////////////////

#define LED_CH1_on()				( LED_PORT -> ODR |= ( LED_CH1_msk ))
#define LED_CH1_off()				( LED_PORT -> ODR &= ~( LED_CH1_msk ))
#define LED_CH1_toggle()			( LED_PORT -> ODR ^= ( LED_CH1_msk ))

#define LED_CH2_on()				( LED_PORT -> ODR |= ( LED_CH2_msk ))
#define LED_CH2_off()				( LED_PORT -> ODR &= ~( LED_CH2_msk ))
#define LED_CH2_toggle()			( LED_PORT -> ODR ^= ( LED_CH2_msk ))



///////////////////////////////////////////////////////////////
//
//		Functions
//
///////////////////////////////////////////////////////////////

// Init
void LedInit(void);

#endif /* DRIVERS_LEDDRV_H_ */
