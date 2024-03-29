`ifndef _DEFINES_VH_
`define _DEFINES_VH_

//
//		Defines.vh
//
//	Author:		Ziga M 
//	Date: 		12.08.2019 
//
//


/////////////////////////////////////////////////////////
//	
//		RESET POLARITY
//
/////////////////////////////////////////////////////////
`define RST_ACT 			( 1'b0 )





/////////////////////////////////////////////////////////
//	
//		R - 2R DAC
//
/////////////////////////////////////////////////////////

// DAC resolution
`define DAC_RES_WIDTH		( 10 )



/////////////////////////////////////////////////////////
//	
//		WAVEFORM CLOCK GENERATOR
//
/////////////////////////////////////////////////////////

// Waveform clock 1 prescaller register size
`define WC_PSC_1_WIDTH			( 24 )

// Waveform clock 1 prescaller register size
`define WC_PSC_2_WIDTH			( 24 )




/////////////////////////////////////////////////////////
//	
//		SINUS LUT 
//
/////////////////////////////////////////////////////////

// Size of LUT
`define SIN_LUT_SIZE			( 48 )

// Bit width of LUT counter
`define SIN_LUT_WIDTH			( 6 )




/////////////////////////////////////////////////////////
//	
//		REGISTER FILE 
//
/////////////////////////////////////////////////////////

// Register file address size
`define RF_ADDR_WIDTH			( 4 )

// Register file data size
`define RF_DATA_WIDTH			( 24 )

// Registers addresses
`define CTRL_ADDR				( 0 )
`define PSC1_ADDR				( 1 )
`define PSC2_ADDR				( 2 )




/////////////////////////////////////////////////////////
//	
//		INTERFACE
//
/////////////////////////////////////////////////////////

// Command length
`define INT_CMD_WIDTH			( 8 )

// Command list
`define INT_CMD_READ			( 8'hC0 )
`define INT_CMD_WRITE			( 8'h70 )

// Command mask in command byte
`define INT_CMD_CMD_MSK			( 8'hF0 )

// Address mask in command byte
`define INT_CMD_ADDR_MSK		( 8'h0F )


`endif // _DEFINES_VH





