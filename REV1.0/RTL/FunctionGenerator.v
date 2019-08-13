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
	sys_clk_i,
	sys_rst_i,

	dds_ch1_o,
	dds_ch2_o
);

/////////////////////////////////////////////////
//
//		Input / Outputs
//
/////////////////////////////////////////////////

// System clock
input sys_clk_i;

// System reset
input sys_rst_i;

// DDS channel 1 output
output [11:0] dds_ch1_o;

// DDS channel 2 output
output [11:0] dds_ch2_o;


wire [11:0] ch1;
wire [11:0] ch2;

assign dds_ch1_o = ch1;
assign dds_ch2_o = ch2;


/////////////////////////////////////////////////
//
//		RGB drivers 
//
//	NOTE: Can only be driven as open-drain
//
/////////////////////////////////////////////////

//`ifndef SIMULATION
/*
// Channel 1 DAC bit 7
SB_IO_OD #(
	.PIN_TYPE				( 6'b011001 ),		// pin output
	.NEG_TRIGGER			( 1'b0 )			// rising edge
)
RGB_IO7_inst(
	.PACKAGEPIN				( dds_ch1_o[7] ),
	.DOUT0					( ch1[7] )
);

// Channel 1 DAC bit 8
SB_IO_OD #(
	.PIN_TYPE				( 6'b011001 ),		// pin output
	.NEG_TRIGGER			( 1'b0 )			// rising edge
)
RGB_IO8_inst(
	.PACKAGEPIN				( dds_ch1_o[8] ),
	.DOUT0					( ch1[8] )
);

// Channel 1 DAC bit 9
SB_IO_OD #(
	.PIN_TYPE				( 6'b011001 ),		// pin output
	.NEG_TRIGGER			( 1'b0 )			// rising edge
)
RGB_IO9_inst(
	.PACKAGEPIN				( dds_ch1_o[9] ),
	.DOUT0					( ch1[9] )
);
*/
//`endif



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
//		WAVEFORM CLOCK 
//
/////////////////////////////////////////////////

// NOTE: Check what to do with if PSC = 0 or PSC = 1 !!!!
WaveformClock WC_inst(
	.sys_clk_i					( sys_clk_i ),
	.sys_rst_i					( sys_rst_i ),

	.wc_en_1_i					( 1'b1 ),
	.wc_en_2_i					( 1'b1 ),
	.wc_psc_1_i					( 24'd25 ),
	.wc_psc_2_i					( 24'd10 ),
	.wc_clk_p_1_o				( clk_p_1_w ),
	.wc_clk_p_2_o				( clk_p_2_w )
);




/////////////////////////////////////////////////
//
//		SINUS WAVEFORM
//
/////////////////////////////////////////////////

SinusWaveform SW_inst(
	.sys_clk_i					( sys_clk_i ),
	.sys_rst_i					( sys_rst_i ),
	
	.sw_en_1_i					( 1'b1 ),
	.sw_en_2_i					( 1'b1 ),
	.sw_clk_1_i					( clk_p_1_w ),
	.sw_clk_2_i					( clk_p_2_w ),
	.sw_sine_1_o				( ch1 ),
	.sw_sine_2_o				( ch2)
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