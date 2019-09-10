`timescale 1ns / 1ns
`include "Defines.vh"

//
//		Function Generator TOP Module
//
//	Author:		Ziga M 
//	Date: 		20.07.2019 
//
//
//	Description: This is TOP module of function generator project
//
//

module FunctionGenerator(
	
`ifdef SIMULATION
	sys_clk_i,
`endif 
	sys_rst_i,

	dds_ch1_o,
	dds_ch2_o,
	
	int_clk_i,
	int_mosi_i,
	int_miso_o,
	int_cs_i
);



/////////////////////////////////////////////////
//
//		Input / Outputs
//
/////////////////////////////////////////////////

//`ifndef INT_OSC_EN
`ifdef SIMULATION
	// System clock
	input sys_clk_i;
`endif

// System reset
input sys_rst_i;

// DDS channel 1 output
output [(`DAC_RES_WIDTH - 1):0] dds_ch1_o;

// DDS channel 2 output
output [(`DAC_RES_WIDTH - 1):0] dds_ch2_o;

// Interface clock input
input int_clk_i;

// Interface master data input
input int_mosi_i;

// Interface slave data output
output int_miso_o;

// Interface slave select input
input int_cs_i;




///////////////////////////////////////////////////////////////////////////////////////
//
//		WAVEFORM CLOCK AND SINUS WAVEFORM CONNECTIONS
//
///////////////////////////////////////////////////////////////////////////////////////

// Waveform clock pulse 1
wire clk_p_1_w;

// Waveform clock pulse 2
wire clk_p_2_w;




/////////////////////////////////////////////////
//
//		INTERNAL OSCILLATOR - 48 MHz
//
/////////////////////////////////////////////////
//`ifdef INT_OSC_EN
`ifndef SIMULATION

// System clock
wire sys_clk_i;

SB_HFOSC OSC_48MHZ_INST(

	.CLKHFEN				(1'b1),
	.CLKHFPU				(1'b1),
	.CLKHF					(sys_clk_i)
)/* synthesis ROUTE_THROUGH_FABRIC = 0 */;

`endif





/////////////////////////////////////////////////
//
//		INTERFACE WITH MASTER DEVICE
//
/////////////////////////////////////////////////

Interface INTERFACE_INST(

	.sys_clk_i					( sys_clk_i ),
	.sys_rst_i					( sys_rst_i ),
	
	.int_clk_i					( int_clk_i ),
	.int_mosi_i					( int_mosi_i ),
	.int_cs_i					( int_cs_i ),
	.int_miso_o					( int_miso_o ),
	
	.int_re_o					(  ),
	.int_we_o					(  ),
	.int_addr_o					(  ),
	.int_data_o					(  ),
	.int_data_i					( 24'h0123456 )
);








/////////////////////////////////////////////////
//
//		WAVEFORM CLOCK 
//
/////////////////////////////////////////////////

// NOTE: Check what to do with if PSC = 0 or PSC = 1 !!!!
WaveformClock WC_INST(
	.sys_clk_i					( sys_clk_i ),
	.sys_rst_i					( sys_rst_i ),

	.wc_en_2_i					( 1'b1 ),
	.wc_psc_2_i					( 24'd2 ),
	.wc_clk_p_2_o				( clk_p_2_w )
);




/////////////////////////////////////////////////
//
//		SINUS WAVEFORM
//
/////////////////////////////////////////////////

SinusWaveform SW_INST(
	.sys_clk_i					( sys_clk_i ),
	.sys_rst_i					( sys_rst_i ),
	
	.sw_en_2_i					( 1'b1 ),
	.sw_clk_2_i					( clk_p_2_w ),
	.sw_sine_2_o				( dds_ch2_o)
);













/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////






/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////



	
	
	

endmodule // module: FunctionGenerator