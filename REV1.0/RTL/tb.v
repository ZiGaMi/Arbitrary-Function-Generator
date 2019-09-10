`timescale 1ns / 1ns
`include "Defines.vh"

/*********************************************************************
*
*		TESTBENCH DEFINES
*	
**********************************************************************/

// Defined timescale 
`define TIMESCALE_CLOCK		( 1000000000 )

// System clock frequency
`define SYS_CLK_FREQ		( 48000000 )

// System clock tick
`define SYS_CLK_TICK  		(( `TIMESCALE_CLOCK / `SYS_CLK_FREQ ) / 2 )

// Delay
`define _1_us				( 1e3 )					// relative to timescale !!!
`define _10_us				( 10 * `_1_us )					
`define _100_us				( 100 * `_1_us )
`define _1_ms				( 1e3 * `_1_us )
`define _100_ms				( 1e5 * `_1_us )

// Reset polarity
//`define RST_ACT			( 1'b0 )

// SPI Clock 
`define SPI_CLK_FREQ		( 1000000 )
`define SPI_CLOCK_TICK		(( `TIMESCALE_CLOCK / `SPI_CLK_FREQ ) / 2 )


/*********************************************************************
*
*	TESTBENCH
*	
**********************************************************************/
module tb();
	

// -------------------------------
// 		SYSTEM 
// -------------------------------

// System clock
reg sys_clk;

// System reset
reg sys_rst;

// Spi interface 
reg spi_clk;
reg spi_mosi;
wire spi_miso;
reg spi_cs;



// -------------------------------
// 	GENERATE SYSTEM CLOCK 
// -------------------------------
always #(`SYS_CLK_TICK) sys_clk <= !sys_clk;


// ----------------------------
// 		Function Generator
// ----------------------------
FunctionGenerator FUN_GEN_inst(
	.sys_clk_i						( sys_clk ),
	.sys_rst_i						( sys_rst ),
	.dds_ch1_o						(),
	.dds_ch2_o						(),
	
	.int_clk_i						( spi_clk ),
	.int_mosi_i						( spi_mosi ),
	.int_miso_o						( spi_miso ),
	.int_cs_i						( spi_cs )	
);


// ----------------------------
// 		START SIMULATION
// ----------------------------
initial begin

	// Initialize system
	SYSTEM_INIT();
	
	// Reset sequence
	SYSTEM_RESET();
	
	// Send byte
	#( `_100_us );
	spi_cs <= 0;
	
	#( `SPI_CLOCK_TICK );
	SPI_SEND_BYTE(8'hC1);
	#( `_1_us );
	SPI_SEND_BYTE(8'h00);
	#( `_1_us );
	SPI_SEND_BYTE(8'h00);
	#( `_1_us );
	SPI_SEND_BYTE(8'h00);
	spi_cs <= 1;
	
	
	// Send byte
	#( `_100_us );
	spi_cs <= 0;
	


	#( `SPI_CLOCK_TICK );
	SPI_SEND_BYTE(8'h70);
	#( `_1_us );
	SPI_SEND_BYTE(8'h67);
	#( `_1_us );
	SPI_SEND_BYTE(8'h45);
	#( `_1_us );
	SPI_SEND_BYTE(8'h23);
	spi_cs <= 1;	
	
	
	#( `_100_us );
	spi_cs <= 0;
	
	#( `SPI_CLOCK_TICK );
	SPI_SEND_BYTE(8'hC0);
	#( `_1_us );
	SPI_SEND_BYTE(8'h00);
	#( `_1_us );
	SPI_SEND_BYTE(8'h00);
	#( `_1_us );
	SPI_SEND_BYTE(8'h00);
	spi_cs <= 1;	
	
	
	// End simulation
	#(`_100_us) $finish();

end




// ----------------------------
// 		SYSTEM INITIALIZE
// ----------------------------	
task SYSTEM_INIT;
	begin
		// Generate simulation files
		$dumpfile("FunctionGenerator.vcd");
		$dumpvars();
		
		// Clear clock
		sys_clk 	<= 1'b0;
		
		// Clear reset
		sys_rst 	<= 1'b0;	
		
		// Init spi lines
		spi_clk 	<= 0;
		spi_mosi 	<= 0;
		spi_cs 		<= 1;
		
	end
endtask



// ----------------------------
// 		SYSTEM RESET
// ----------------------------	
task SYSTEM_RESET;
	begin
		sys_rst <= !`RST_ACT;
		#(10 * `_1_us) sys_rst <= `RST_ACT;
		#(10 * `_1_us) sys_rst <= !`RST_ACT;
		# (100 * `_1_us);
	end
endtask


// ----------------------------
// 		SYSTEM RESET
// ----------------------------	
task SPI_SEND_BYTE;
	input [7:0] data;
	integer i;
	begin
		//spi_cs <= 0;
		spi_mosi <= data[7];
		data <= ( data << 1 );
		#( `SPI_CLOCK_TICK );
		
		for ( i = 0; i < 16; i++  ) begin
			
			// Toggle clock
			spi_clk <= !spi_clk;
			
			// Push data
			if ( i & 1 ) begin
				spi_mosi <= data[7];
				data <= ( data << 1 );
			end
			
			#( `SPI_CLOCK_TICK );
		end
		
		//spi_cs <= 1;
	end
	
endtask

endmodule // module: tb
