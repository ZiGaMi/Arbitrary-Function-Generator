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
	sys_rst_i,
	
	sw_en_2_i,
	sw_clk_2_i,
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
input sys_rst_i;


// Sine generation 2 enable input
input sw_en_2_i;


// Waveform clock 2 input
input sw_clk_2_i; 


// Waveform 2 output
output [(`DAC_RES_WIDTH - 1):0] sw_sine_2_o;




/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////

// LUT counter
reg [(`SIN_LUT_WIDTH - 1):0] sin_lut_cnt_2;

// Sinus LUT
reg [(`DAC_RES_WIDTH - 1):0] sin_lut [(`SIN_LUT_SIZE - 1):0];




/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////


// Sinus output
assign sw_sine_2_o = ( sw_en_2_i ) ? ( sin_lut[sin_lut_cnt_2] ) : ( 12'hZ );


// Generate positive pulse on waveform clock
always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT ) begin
			sin_lut_cnt_2 <= 0;
			
			// Sinus LUT
			sin_lut[0] <= 12'd2047;
			sin_lut[1] <= 12'd2314;
			sin_lut[2] <= 12'd2576;
			sin_lut[3] <= 12'd2830;
			sin_lut[4] <= 12'd3070;
			sin_lut[5] <= 12'd3293;
			sin_lut[6] <= 12'd3494;
			sin_lut[7] <= 12'd3670;
			sin_lut[8] <= 12'd3819;
			sin_lut[9] <= 12'd3938;
			sin_lut[10] <= 12'd4024;
			sin_lut[11] <= 12'd4076;
			sin_lut[12] <= 12'd4094;
			sin_lut[13] <= 12'd4076;
			sin_lut[14] <= 12'd4024;
			sin_lut[15] <= 12'd3938;
			sin_lut[16] <= 12'd3819;
			sin_lut[17] <= 12'd3670;
			sin_lut[18] <= 12'd3494;
			sin_lut[19] <= 12'd3293;
			sin_lut[20] <= 12'd3070;
			sin_lut[21] <= 12'd2830;
			sin_lut[22] <= 12'd2576;
			sin_lut[23] <= 12'd2314;
			sin_lut[24] <= 12'd2047;
			sin_lut[25] <= 12'd1779;
			sin_lut[26] <= 12'd1517;
			sin_lut[27] <= 12'd1263;
			sin_lut[28] <= 12'd1023;
			sin_lut[29] <= 12'd800;
			sin_lut[30] <= 12'd599;
			sin_lut[31] <= 12'd423;
			sin_lut[32] <= 12'd274;
			sin_lut[33] <= 12'd155;
			sin_lut[34] <= 12'd69;
			sin_lut[35] <= 12'd17;
			sin_lut[36] <= 12'd0;
			sin_lut[37] <= 12'd17;
			sin_lut[38] <= 12'd69;
			sin_lut[39] <= 12'd155;
			sin_lut[40] <= 12'd274;
			sin_lut[41] <= 12'd423;
			sin_lut[42] <= 12'd599;
			sin_lut[43] <= 12'd800;
			sin_lut[44] <= 12'd1023;
			sin_lut[45] <= 12'd1263;
			sin_lut[46] <= 12'd1517;
			sin_lut[47] <= 12'd1779;
		end
		
		// Move through sinus LUT
		else begin
			
			/*
			if ( sw_clk_2_i ) begin
				sin_lut_cnt_2 	<= sin_lut_cnt_2 + 1'b1;	

				// TODO: If prescaller is small increment lut counter by more
				// than one !!! -> Thus frequncy of DDS increases
			end
			
			*/
			
			if ( sin_lut_cnt_2 >= ( `SIN_LUT_SIZE - 1 )) begin
				sin_lut_cnt_2 	<= 0;
			end
			else begin
				sin_lut_cnt_2 	<= sin_lut_cnt_2 + 1'b1;
			end
		end
	end


endmodule // module: SinusWaveform





