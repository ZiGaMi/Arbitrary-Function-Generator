`timescale 1ns / 1ns
`include "Defines.vh"

//
//		Interface
//
//	Author:		Ziga M 
//	Date: 		08.09.2019 
//
//
//	Description: 	This is module has a function to communicate with master device
//					via SPI interface. Simple communication protocol is defined, where
//					individual regiseters are addressed. 
//
//

module Interface(

	sys_clk_i,
	sys_rst_i,
	
	int_clk_i,
	int_mosi_i,
	int_cs_i,
	int_miso_o,
	
	int_re_o,
	int_we_o,
	int_addr_o,
	int_data_o,
	int_data_i
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

// Communication clock input
input int_clk_i;

// Communication master data input
input int_mosi_i;

// Communication slave select input
input int_cs_i;

// Communication slave data output
output int_miso_o;

// Read enable output
output int_re_o;

// Write enable output
output int_we_o;

// Address of register output
output [(`RF_ADDR_WIDTH-1):0] int_addr_o;

// Data output 
output [(`RF_DATA_WIDTH-1):0] int_data_o;

// Data input
output [(`RF_DATA_WIDTH-1):0] int_data_i;




/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////

// Synchronise interface clock
reg clk_a, clk_b;

// Positive edge of interface clock
wire clk_pos;





/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////

// Generate positive edge on interface clock
assign clk_pos = ( clk_a & !clk_b );

// Synchronize clock
always @ (posedge sys_clk_i)
	begin
		clk_a <= int_clk_i;
		clk_b <= clk_a;
	end








endmodule /* module: Interface */






