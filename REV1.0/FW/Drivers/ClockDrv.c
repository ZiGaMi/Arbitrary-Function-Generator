/*
 * ClockDrv.c
 *
 *  Created on: 10. avg. 2019
 *      Author: ZigaM
 */


#include "Drivers/ClockDrv.h"
#include "stdlib.h"


// Initialize system clock
void SysClockInit(void){

	// Enable HSE Clock
	RCC -> CR = ( RCC_CR_HSEON );

	// Wait until HSE clock is stable
	while(( RCC -> CR & RCC_CR_HSERDY ) == RCC_CR_HSERDY );

	// Select system clock
	RCC -> CFGR |= ( RCC_CFGR_SW_HSE );

	// Wait until system clock as HSE is ready
	while ( !(( RCC -> CFGR & RCC_CFGR_SWS_HSE ) == RCC_CFGR_SWS_HSE ));

}


// Initialize system tick
void SysTickInit(void){

	// Set reload register
	SysTick -> LOAD = (( SYS_CLK_FREQ / SYS_TICK_FREQ ) - 1UL );

	// Set system tick interrupt priority
	NVIC_SetPriority (SysTick_IRQn, (1UL << 2U) - 1UL);

	// Load system tick counter value
	SysTick -> VAL = 0UL;

	// Enable system tikc IRQ and system tick timer
	SysTick -> CTRL = ( SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk );

}


// System clock tick counter (for delay statement)
volatile uint32_t sys_tick = 0;

// System clock tick counter
volatile uint16_t sys_clk_tick = 0;

// System tick exception handler
void SysTick_Handler(void){

	// Decrement system tick
	sys_tick--;

	// Increment system clock tick
	sys_clk_tick++;
}


// Get system tick ( miliseconds )
uint32_t millis(void){
	return sys_tick;
}


// Delay for miliseconds
void delay_ms(uint16_t ms){

	// Fill and wait till count down
	sys_tick = ms;
	while ( millis() != 0u );
}


// Get system ticks
uint16_t SysGetTick(void){
	return sys_clk_tick;
}
