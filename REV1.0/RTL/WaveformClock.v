`timescale 1ns / 1ns
`include "Defines.vh"

//
//		WaveformClock.v
//
//	Author:		Ziga M 
//	Date: 		12.08.2019 
//
//
//	Description: 	Generation of waveform clock based on system clock
//					and configurations in register file
//

module WaveformClock(
	sys_clk_i,
	sys_rst_i,
	
	wc_en_1_i,
	wc_en_2_i,
	wc_psc_1_i,
	wc_psc_2_i,
	wc_clk_p_1_o,
	wc_clk_p_2_o
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

// Clock generation 1 enable
input wc_en_1_i;

// Clock generation 2 enable
input wc_en_2_i;

// Clock prescaller 1 input
input [(`WC_PSC_1_WIDTH - 1):0] wc_psc_1_i;

// Clock prescaller 2 input
input [(`WC_PSC_2_WIDTH - 1):0] wc_psc_2_i;

// Waveform clock pulse 1 output
output wc_clk_p_1_o;

// Waveform clock pulse 2 output
output wc_clk_p_2_o; 



/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////

// Waveform clock counter
reg [(`WC_PSC_1_WIDTH - 1):0] clk_1_cnt;
reg [(`WC_PSC_1_WIDTH - 1):0] clk_2_cnt;




/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////

// Waveform clock positive edge
assign wc_clk_p_1_o = ( wc_en_1_i ) ? ( clk_1_cnt == ( wc_psc_1_i - 1 )) : ( 1'bZ );
assign wc_clk_p_2_o = ( wc_en_2_i ) ? ( clk_2_cnt == ( wc_psc_2_i - 1 )) : ( 1'bZ );


// Generate positive pulse on waveform clock
always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT ) begin
			clk_1_cnt 	<= 0;
			clk_2_cnt 	<= 0;
		end
	
		// Toggle on match
		else begin
			if ( wc_clk_p_1_o ) begin
				clk_1_cnt 	<= 0;
			end
			else begin
				clk_1_cnt 	<= ( clk_1_cnt + 1'b1 );
			end
			
			if ( wc_clk_p_2_o ) begin
				clk_2_cnt 	<= 0;
			end			
			else begin
				clk_2_cnt 	<= ( clk_2_cnt + 1'b1 );
			end			
		end
	end

endmodule // module: WaveformClock
