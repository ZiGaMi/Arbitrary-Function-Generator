`timescale 1ns / 1ns
`include "Defines.vh"

//
//		SinusWaveform.v
//
//	Author:		Ziga M 
//	Date: 		12.08.2019 
//
//
//	Description: Here sinus is generated
//

module SinusWaveform(
	sys_clk_i,
	//sys_rst_i,
	
	sw_en_1_i,
	sw_en_2_i,
	sw_clk_1_i,
	sw_clk_2_i,
	sw_sine_1_o,
	sw_sine_2_o
);


/////////////////////////////////////////////////
//
//		Input / Outputs
//
/////////////////////////////////////////////////

// System clock input
input sys_clk_i;

// System reset input
//input sys_rst_i;

// Sine generation 1 enable input
input sw_en_1_i;

// Sine generation 2 enable input
input sw_en_2_i;

// Waveform clock 1 input
input sw_clk_1_i;

// Waveform clock 2 input
input sw_clk_2_i; 

// Waveform 1 output
output [(`DAC_RES_WIDTH - 1):0] sw_sine_1_o;

// Waveform 2 output
output [(`DAC_RES_WIDTH - 1):0] sw_sine_2_o;




/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////

// LUT counter
reg [(`SIN_LUT_WIDTH - 1):0] sin_lut_cnt_1;
reg [(`SIN_LUT_WIDTH - 1):0] sin_lut_cnt_2;

// Sinus LUT
reg [(`DAC_RES_WIDTH - 1):0] sin_lut [(`SIN_LUT_WIDTH - 1):0];




/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////


// Sinus output
assign sw_sine_1_o = ( sw_en_1_i ) ? ( sin_lut[sin_lut_cnt_1] ) : ( (`DAC_RES_WIDTH)'hZ );
assign sw_sine_2_o = ( sw_en_2_i ) ? ( sin_lut[sin_lut_cnt_2] ) : ( (`DAC_RES_WIDTH)'hZ );


// Generate positive pulse on waveform clock
always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT ) begin
			sin_lut_cnt_1 <= 0;
			sin_lut_cnt_2 <= 0;
		end
		
		// Move through sinus LUT
		else begin
			if ( sw_clk_1_i ) begin
				sin_lut_cnt_1 	<= sin_lut_cnt_1 + 1'b1;
			end
			
			if ( sw_clk_2_i ) begin
				sin_lut_cnt_2 	<= sin_lut_cnt_2 + 1'b1;				
			end
		end
	end


endmodule // module: SinusWaveform





