`timescale 1ns / 1ns
`include "Defines.vh"

//
//		WaveformClock.v
//
//	Author:		Ziga M 
//	Date: 		12.08.2019 
//
//
//	Description: Here sinus is generated
//

module WaveformClock(
	sys_clk_i,
	sys_rst_i,
	
	wc_en_i,
	wc_psc_1_i,
	wc_psc_2_i,
	wc_clk_1_o,
	wc_clk_2_o
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
input wc_en_i;

// Clock prescaller 1 input
input [(`WC_PSC_1_WIDTH - 1):0] wc_psc_1_i;

// Clock prescaller 2 input
input [(`WC_PSC_2_WIDTH - 1):0] wc_psc_2_i;

// Waveform clock 1 output
output reg wc_clk_1_o;

// Waveform clock 2 output
output reg wc_clk_2_o; 






/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////

// Waveform clock counter
reg [(`WC_PSC_1_WIDTH - 1):0] clk_1_cnt;
reg [(`WC_PSC_1_WIDTH - 1):0] clk_2_cnt;

// Waveform clock positive edge
wire clk_1_pos;
wire clk_2_pos;



/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////

// Waveform clock positive edge
assign clk_1_pos = ( clk_1_cnt == (( wc_psc_1_i >> 1 ) - 1 ));
assign clk_2_pos = ( clk_2_cnt == (( wc_psc_2_i >> 1 ) - 1 ));


// Generate positive pulse on waveform clock
always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT ) begin
			wc_clk_1_o 	<= 0; 
			wc_clk_2_o 	<= 0;
			clk_1_cnt 	<= 0;
			clk_2_cnt 	<= 0;
		end
	
		// Toggle on match
		else begin
			if ( clk_1_pos ) begin
				wc_clk_1_o 	<= ( wc_clk_1_o ^ 1'b1 );
				clk_1_cnt 	<= 0;
			end
			else begin
				clk_1_cnt 	<= ( clk_1_cnt + 1'b1 );
			end
			
			if ( clk_2_pos ) begin
				wc_clk_2_o 	<= ( wc_clk_2_o ^ 1'b1 );
				clk_2_cnt 	<= 0;
			end			
			else begin
				clk_2_cnt 	<= ( clk_2_cnt + 1'b1 );
			end			
		end
	end

endmodule // module: WaveformClock
