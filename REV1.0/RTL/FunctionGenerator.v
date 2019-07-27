`timescale 1ns / 1ns


//
//		Function Generator TOP Module
//
//	Author:		Ziga M 
//	Date: 		20.07.2019 
//
module FunctionGenerator(
	sys_clk_i,
	sys_rst_i,
	led_o,
	dac_o
);

// System clock
input sys_clk_i;

// System reset
input sys_rst_i;

// Led
output [7:0] led_o;

// DAC
output [11:0] dac_o;

// Counter
reg [7:0] cnt;

reg [11:0] dac_cnt;

assign dac_o = dac_cnt;
assign led_o = dac_cnt[7:0];

always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i ) begin
			cnt <= 12'h0;
		end
		else if ( cnt == 8'd25 ) begin
			cnt <= 12'h0;
			dac_cnt <= dac_cnt + 1'b1;
		end
		else begin
			cnt <= cnt + 1'b1;
		end
	end

endmodule // module: FunctionGenerator