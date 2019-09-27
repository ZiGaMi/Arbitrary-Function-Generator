/*
 * ClockDrv.h
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */

#ifndef DRIVERS_CLOCKDRV_H_
#define DRIVERS_CLOCKDRV_H_

#include "stm32f0xx.h"


////////////////////////////////////////////////////////////////////////////////
//
//		Frequency Defines
//
////////////////////////////////////////////////////////////////////////////////

// System clock frequency ( for sys tick exception aka. delay)
#define SYS_CLK_FREQ		( unsigned long ) ( 8000000ul )	// Hz
#define SYS_CLK_FREQ_MHz	( uint8_t )	( 8u ) // MHz

// System tick interrupt frequency
#define SYS_TICK_FREQ		( unsigned long ) ( 1000ul )		// Hz




//////////////////////////////////////////////////////////////////////////////////////
//
//		Function Prototypes
//
//////////////////////////////////////////////////////////////////////////////////////

// Initialize system clock
void SysClockInit(void);

// Initialize system tick
void SysTickInit(void);

// Return system ticks
uint32_t millis(void);

// Delay for mili seconds
void delay_ms(uint16_t);


#endif /* DRIVERS_CLOCKDRV_H_ */
