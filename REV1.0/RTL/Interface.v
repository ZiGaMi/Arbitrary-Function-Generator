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
input [(`RF_DATA_WIDTH-1):0] int_data_i;





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
reg [(`RF_DATA_WIDTH - 1):0] data_rx;

// Transmition data
reg [(`RF_DATA_WIDTH - 1):0] data_tx;

// Bit counter
reg [7:0] bit_cnt;

// Register addr and data
reg [(`RF_ADDR_WIDTH - 1):0] rf_addr;
//reg [(`RF_DATA_WIDTH - 1):0] rf_data;





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
		if ( sys_rst_i == `RST_ACT ) begin
			cmd 			<= 0;
			data_rx 		<= 0;
			bit_cnt			<= 0;
			int_miso_o		<= 0;
		end
		
		else if ( clk_pos ) begin
		
			if ( bit_cnt <= 7 ) begin
				cmd <= (( cmd << 1 ) | ( int_mosi_i & 1 ));
			end
			
			else begin
				
				// Receive data
				data_rx 	<= (( data_rx << 1 ) | ( int_mosi_i & 1 ));
				
				// Transmit data
				int_miso_o 	<= data_tx[( `RF_DATA_WIDTH - 1 )];
				data_tx 	<= ( data_tx << 1 );
			end
			
			// Increment bit counter
			bit_cnt <= bit_cnt + 1;
		end	

		else if ( cs_neg ) begin
			bit_cnt <= 0;
		end
		
		// Clear tx and rx buffers
		else if ( cs_pos ) begin
			data_rx <= 0;
			data_tx <= 0;
		end
		
		// Get data from RF
		else if ( int_re_o ) begin
			data_tx <= int_data_i;
		end
	end
	
	


// Address and data lines
assign int_addr_o = ( int_re_o || int_we_o ) ? ( rf_addr ) : ( 0 );
assign int_data_o = ( int_we_o ) ? ( data_rx ) : ( 0 );

	
// Store data to register file
always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT ) begin
			int_re_o <= 0;
			int_we_o <= 0;
			rf_addr <= 0;
		end
		
		// Get address 
		else if ( clk_neg && ( bit_cnt == 8 )) begin
			rf_addr 	<= ( cmd & `INT_CMD_ADDR_MSK );
			
			// In case of reading from RF prepare data to put on bus
			int_re_o 	<= ((( cmd & `INT_CMD_CMD_MSK ) == ( `INT_CMD_READ )) ? ( clk_neg ) : (0) );
		end
		
		// In case of writing to RF 
		else if ( cs_neg ) begin
			int_we_o <= ((( cmd & `INT_CMD_CMD_MSK ) == ( `INT_CMD_WRITE )) ? ( cs_neg ) : (0) );
		end
		
		else begin
			int_re_o <= 0;
			int_we_o <= 0;
		end
	end

endmodule /* module: Interface */


