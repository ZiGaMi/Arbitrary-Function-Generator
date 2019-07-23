`timescale 1ns / 1ns


/*********************************************************************
*
*	TESTBENCH
*	
**********************************************************************/
module tb();
	
	
/*********************************************************************
*
*		TESTBENCH DEFINES
*	
**********************************************************************/

// System clock tick
`define SYS_CLK_TICK  20

// Delay
`define _1_us		100E3
`define _100_us		(100 * `_1_us)
`define _1_ms		(1E3 * `_1_us)
`define _100_ms		(1E5 * `_1_us)

	

// -------------------------------
// 		SYSTEM 
// -------------------------------

// System clock
reg sys_clk;

// System reset
reg sys_rst;

// Define reset polarity
`define RST_ACT 1'b1



// -------------------------------
// 	GENERATE SYSTEM CLOCK 25 MHz
// -------------------------------
always #(`SYS_CLK_TICK) sys_clk <= !sys_clk;


// Function generator instance
FunctionGenerator FG_INST(
	.sys_clk_i			( sys_clk ),
	.sys_rst_i			( sys_rst ),
	.led_o				(),
	.dac_o				()
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
	#(`_100_us * 1) $finish();

end

// ----------------------------
// 		SYSTEM INITIALIZE
// ----------------------------	
task SYSTEM_INIT;
	begin
		// Generate simulation files
		$dumpfile("LOGICchain.vcd");
		$dumpvars();
		
		// Init clock
		sys_clk <= 1'b0;

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
