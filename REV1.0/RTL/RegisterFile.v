`timescale 1ns / 1ns
`include "Defines.vh"

//
//		Register File
//
//	Author:		Ziga M 
//	Date: 		10.09.2019 
//
//
//	Description:
//
//
//

module RegisterFile(

	sys_clk_i,
	sys_rst_i,
	
	rf_addr_i,
	rf_data_i,
	rf_data_o,
	rf_we_i,
	rf_re_i,
	rf_ack_o,
	
	rf_psc1_o,
	rf_psc2_o
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

// Address
input [(`RF_ADDR_WIDTH - 1):0] rf_addr_i;

// Input data
input [(`RF_DATA_WIDTH - 1):0] rf_data_i;

// Output data
output [(`RF_DATA_WIDTH - 1):0] rf_data_o;

// Write enable
input rf_we_i;

// Read enable
input rf_re_i;

// Ack
output rf_ack_o;

// Prescaller outputs
output [(`RF_DATA_WIDTH - 1):0] rf_psc1_o;
output [(`RF_DATA_WIDTH - 1):0] rf_psc2_o;



/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////

// Control register
reg [(`RF_DATA_WIDTH - 1):0] CTRL;
wire CTRL_sel, CTRL_re, CTRL_we;

// Channel 1 prescaller register
reg [(`RF_DATA_WIDTH - 1):0] PSC1;
wire PSC1_sel, PSC1_re, PSC1_we;

// Channel 2 prescaller register
reg [(`RF_DATA_WIDTH - 1):0] PSC2;
wire PSC2_sel, PSC2_re, PSC2_we;




/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////

assign CTRL_sel = ( rf_addr_i == ( `CTRL_ADDR ));
assign CTRL_re	= ( CTRL_sel & rf_re_i );
assign CTRL_we	= ( CTRL_sel & rf_we_i );

assign PSC1_sel = ( rf_addr_i == ( `PSC1_ADDR ));
assign PSC1_re	= ( PSC1_sel & rf_re_i );
assign PSC1_we	= ( PSC1_sel & rf_we_i );

assign PSC2_sel = ( rf_addr_i == ( `PSC2_ADDR ));
assign PSC2_re	= ( PSC2_sel & rf_re_i );
assign PSC2_we	= ( PSC2_sel & rf_we_i );

// Acknowledge
assign rf_ack_o = ( CTRL_sel | PSC1_sel | PSC2_sel );

// Write to registers
always @(posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT ) begin
			CTRL <= 0;
			PSC1 <= 100;
			PSC2 <= 100;
		end
		
		else begin
			if 		( CTRL_we ) 	CTRL <= rf_data_i;
			else if	( PSC1_we )		PSC1 <= rf_data_i;
			else if ( PSC2_we )		PSC2 <= rf_data_i;
		end	
	end
	
	
// Output mux
generate
	genvar i;
	
	for ( i = 0; i < ( `RF_DATA_WIDTH ); i = i + 1 ) begin
		assign rf_data_o[i] = 	( CTRL[i] & CTRL_re ) | 
								( PSC1[i] & PSC1_re ) |
								( PSC2[i] & PSC2_re ) ;
	end
endgenerate
	
	

// Improve this in future -> implementation of arbiter is necessary
assign rf_psc1_o = PSC1;
assign rf_psc2_o = PSC2;
	
	
endmodule /* module: RegisterFile */

