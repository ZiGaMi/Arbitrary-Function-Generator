`timescale 1ns / 1ns
`include "Defines.vh"

/*********************************************************************
*
*		TESTBENCH DEFINES
*	
**********************************************************************/

// System clock frequency
`define SYS_CLK_FREQ	100000000

// System clock tick
`define SYS_CLK_TICK  (( 1000000000 / `SYS_CLK_FREQ ) / 2 )

// Delay
`define _1_us		1e3					// relative to timescale !!!
`define _100_us		(100 * `_1_us)
`define _1_ms		(1e3 * `_1_us)
`define _100_ms		(1e5 * `_1_us)

// Reset polarity
//`define RST_ACT		( 1'b0 )


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
	.dds_ch2_o						()
);


// ----------------------------
// 		START SIMULATION
// ----------------------------
initial begin

	// Initialize system
	SYSTEM_INIT();
	
	// Reset sequence
	SYSTEM_RESET();
	
	
	// End simulation
	#(`_1_us) $finish();

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
		sys_clk <= 1'b0;
		
		// Clear reset
		sys_rst <= 1'b0;	

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


endmodule // module: tb
