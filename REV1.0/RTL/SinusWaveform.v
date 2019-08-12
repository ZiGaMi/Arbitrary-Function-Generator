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
	
	sw_en_i,
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

// Generation enable input
input sw_en_i;

// Waveform clock 1 input
input sw_clk_1_i;

// Waveform clock 2 input
input sw_clk_2_i; 

// Waveform 1 output
output [11:0] sw_sine_1_o;

// Waveform 2 output
output [11:0] sw_sine_2_o;





/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////

// Waveform clock buffers
reg clk_1_a;
reg clk_2_a;

// Waveform clock positive edge
wire clk_1_pos;
wire clk_2_pos;


/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////

// Generate positive pulse on waveform clock
/*always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT )
	
	
	end
*/

endmodule // module: SinusWaveform





