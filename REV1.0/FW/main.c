/*
******************************************************************************
File:     main.c
Info:     Generated by Atollic TrueSTUDIO(R) 9.0.1   2019-08-10

The MIT License (MIT)
Copyright (c) 2018 STMicroelectronics

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

******************************************************************************
*/

/* Includes */
#include "stm32f0xx.h"

#include "Drivers/ClockDrv.h"
#include "Drivers/LedDrv.h"
#include "Drivers/UartDrv.h"

#include "Communication/PcInterface.h"


// Reception buffer
uint8_t rx_buffer[UART_RX_BUF_SIZE];



// PC Interface Data
PcInterfaceDataTypeDef pcData;



/**
**===========================================================================
**
**  Abstract: main program
**
**===========================================================================
*/
int main(void)
{

	// Initialize system
	SysClockInit();
	SysTickInit();
	LedInit();
	UartInit();
	UartDmaInit(( uint8_t* ) &rx_buffer);




	while(1){



		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//
		//		APPLY COMMAND FROM PC
		//
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if ( pcData.newDataAvailable ){
			pcData.newDataAvailable = false;

			UartSendBuffer(pcData.data, pcData.data[0] + 1u);
		}


		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////









		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//
		//		CHECK AND PARSE FOR NEW DATA IN RECEPTION BUFFER
		//
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		if ( PcInterfaceGetRxBufCheckTimeoutFlag() ){

			if ( UartGetRxBufferNewDataFlag() ){
				pcData.data = PcInterfaceParseData((uint8_t*) &rx_buffer, UART_RX_BUF_SIZE);
				pcData.newDataAvailable = true;
			}
		}

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	}

}



