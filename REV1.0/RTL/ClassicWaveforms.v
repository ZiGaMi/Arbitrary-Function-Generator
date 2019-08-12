`timescale 1ns / 1ns
`include "Defines.vh"

//
//		ClassicWaveforms.v
//
//	Author:		Ziga M 
//	Date: 		20.07.2019 
//
//
//	Description: Here triange, square and ramp functions are generated
//

module ClassicWaveforms(
	sys_clk_i,
	//sys_rst_i,
	
	cw_en_i,
	cw_clk_1_i,
	cw_clk_2_i,
	cw_sel_1_i,
	cw_sel_2_i,
	cw_wave_1_o,
	cw_wave_2_o
);


/////////////////////////////////////////////////
//
//		Input / Outputs
//
/////////////////////////////////////////////////

// System clock input
input sys_clk_i;

// System reset input
input sys_rst_i;

// Generation enable input
input cw_en_i;

// Waveform clock input
input cw_clk_1_i;

// Waveform clock input
input cw_clk_2_i;

// Waveform selection input
input [1:0] cw_sel_1_i;

// Waveform selection input
input [1:0] cw_sel_2_i;

// Waveform 1 output
output [11:0] cw_wave_1_o;

// Waveform 2 output
output [11:0] cw_wave_2_o;





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


endmodule // module: ClassicWaveforms




