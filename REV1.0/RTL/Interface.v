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
output reg int_miso_o;

// Read enable output
output reg int_re_o;

// Write enable output
output reg int_we_o;

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

// Positive / negative edge of interface clock
wire clk_pos;
wire clk_neg;

// Chip select negative edge
reg cs_a, cs_b;
wire cs_neg;
wire cs_pos;

// Command
reg [(`INT_CMD_WIDTH - 1):0] cmd;

// Reception data
reg [(`INT_DATA_WIDTH - 1):0] data_rx;

// Reception data valid
reg data_rx_dv;

// Transmition data
reg [(`INT_DATA_WIDTH - 1):0] data_tx;

// Bit counter
reg [7:0] bit_cnt;


/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////

// Generate pulse on positive edge of interface clock
assign clk_pos = ( clk_a & !clk_b );
assign clk_neg = ( !clk_a & clk_b );

// Generate pulse on negative edge of cs 
assign cs_neg = ( cs_a & !cs_b );

// Generate pulse on positive edge of cs
assign cs_pos = ( !cs_a & cs_b );


// Synchronize input data
always @ (posedge sys_clk_i)
	begin
		clk_a 	<= int_clk_i;
		clk_b 	<= clk_a;
		cs_a 	<= int_cs_i;
		cs_b	<= cs_a;
	end
	
	

// Get command and data
always @ (posedge sys_clk_i)
	begin
		if (( sys_rst_i == `RST_ACT ) || ( cs_neg )) begin
			cmd 			<= 0;
			data_rx 		<= 0;
			bit_cnt			<= 0;
			data_rx_dv 		<= 0;
		end
		
		else if ( clk_pos ) begin
		
			if ( bit_cnt <= 7 ) begin
				cmd <= (( cmd << 1 ) | ( int_mosi_i & 1 ));
			end
			
			else begin

				case ( cmd & `INT_CMD_ADDR_MSK )
				
					`INT_CMD_WRITE: begin
					
					end
					
					`INT_CMD_READ: begin
					
					end
					
					default: begin
					end
					
				endcase 
				
				
				// Receive data
				data_rx <= (( data_rx << 1 ) | ( int_mosi_i & 1 ));
				
				// Transmit data
				int_miso_o <= data_tx[0];
			end
			
			bit_cnt <= bit_cnt + 1;
		end	
	end
	
	
	
// Store data to register file
always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT ) begin
			int_re_o <= 0;
			int_we_o <= 0;
		end
		
		else if (  ) begin
		
			
		end
	
	
	end







endmodule /* module: Interface */






