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
	
	sw_en_1_i,
	sw_en_2_i,
	sw_clk_1_i,
	sw_clk_2_i,
	sw_sine_1_o,
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

// Sine generation 1 enable input
input sw_en_1_i;

// Sine generation 2 enable input
input sw_en_2_i;

// Waveform clock 1 input
input sw_clk_1_i;

// Waveform clock 2 input
input sw_clk_2_i; 

// Waveform 1 output
output [(`DAC_RES_WIDTH - 1):0] sw_sine_1_o;

// Waveform 2 output
output [(`DAC_RES_WIDTH - 1):0] sw_sine_2_o;




/////////////////////////////////////////////////
//
//		Registers / Wires
//
/////////////////////////////////////////////////

// LUT counter
reg [(`SIN_LUT_WIDTH - 1):0] sin_lut_cnt_1;
reg [(`SIN_LUT_WIDTH - 1):0] sin_lut_cnt_2;

// Sinus LUT
reg [(`DAC_RES_WIDTH - 1):0] sin_lut [(`SIN_LUT_SIZE - 1):0];




/////////////////////////////////////////////////
//
//		Logic
//
/////////////////////////////////////////////////


// Sinus output
assign sw_sine_1_o = ( sw_en_1_i ) ? ( sin_lut[sin_lut_cnt_1] ) : ( 12'hZ );
assign sw_sine_2_o = ( sw_en_2_i ) ? ( sin_lut[sin_lut_cnt_2] ) : ( 12'hZ );


// Generate positive pulse on waveform clock
always @ (posedge sys_clk_i)
	begin
		if ( sys_rst_i == `RST_ACT ) begin
			sin_lut_cnt_1 <= 0;
			sin_lut_cnt_2 <= 0;
			
			// Sinus LUT
			sin_lut[0] <= 12'd2047;
			sin_lut[1] <= 12'd2097;
			sin_lut[2] <= 12'd2147;
			sin_lut[3] <= 12'd2197;
			sin_lut[4] <= 12'd2247;
			sin_lut[5] <= 12'd2297;
			sin_lut[6] <= 12'd2347;
			sin_lut[7] <= 12'd2396;
			sin_lut[8] <= 12'd2446;
			sin_lut[9] <= 12'd2495;
			sin_lut[10] <= 12'd2544;
			sin_lut[11] <= 12'd2592;
			sin_lut[12] <= 12'd2641;
			sin_lut[13] <= 12'd2689;
			sin_lut[14] <= 12'd2736;
			sin_lut[15] <= 12'd2783;
			sin_lut[16] <= 12'd2830;
			sin_lut[17] <= 12'd2876;
			sin_lut[18] <= 12'd2922;
			sin_lut[19] <= 12'd2967;
			sin_lut[20] <= 12'd3011;
			sin_lut[21] <= 12'd3055;
			sin_lut[22] <= 12'd3099;
			sin_lut[23] <= 12'd3142;
			sin_lut[24] <= 12'd3184;
			sin_lut[25] <= 12'd3225;
			sin_lut[26] <= 12'd3266;
			sin_lut[27] <= 12'd3306;
			sin_lut[28] <= 12'd3345;
			sin_lut[29] <= 12'd3384;
			sin_lut[30] <= 12'd3421;
			sin_lut[31] <= 12'd3458;
			sin_lut[32] <= 12'd3494;
			sin_lut[33] <= 12'd3529;
			sin_lut[34] <= 12'd3563;
			sin_lut[35] <= 12'd3597;
			sin_lut[36] <= 12'd3629;
			sin_lut[37] <= 12'd3660;
			sin_lut[38] <= 12'd3691;
			sin_lut[39] <= 12'd3720;
			sin_lut[40] <= 12'd3749;
			sin_lut[41] <= 12'd3776;
			sin_lut[42] <= 12'd3802;
			sin_lut[43] <= 12'd3828;
			sin_lut[44] <= 12'd3852;
			sin_lut[45] <= 12'd3875;
			sin_lut[46] <= 12'd3897;
			sin_lut[47] <= 12'd3918;
			sin_lut[48] <= 12'd3938;
			sin_lut[49] <= 12'd3956;
			sin_lut[50] <= 12'd3974;
			sin_lut[51] <= 12'd3990;
			sin_lut[52] <= 12'd4005;
			sin_lut[53] <= 12'd4019;
			sin_lut[54] <= 12'd4032;
			sin_lut[55] <= 12'd4044;
			sin_lut[56] <= 12'd4054;
			sin_lut[57] <= 12'd4063;
			sin_lut[58] <= 12'd4071;
			sin_lut[59] <= 12'd4078;
			sin_lut[60] <= 12'd4084;
			sin_lut[61] <= 12'd4088;
			sin_lut[62] <= 12'd4091;
			sin_lut[63] <= 12'd4093;
			sin_lut[64] <= 12'd4094;
			sin_lut[65] <= 12'd4093;
			sin_lut[66] <= 12'd4091;
			sin_lut[67] <= 12'd4088;
			sin_lut[68] <= 12'd4084;
			sin_lut[69] <= 12'd4078;
			sin_lut[70] <= 12'd4071;
			sin_lut[71] <= 12'd4063;
			sin_lut[72] <= 12'd4054;
			sin_lut[73] <= 12'd4044;
			sin_lut[74] <= 12'd4032;
			sin_lut[75] <= 12'd4019;
			sin_lut[76] <= 12'd4005;
			sin_lut[77] <= 12'd3990;
			sin_lut[78] <= 12'd3974;
			sin_lut[79] <= 12'd3956;
			sin_lut[80] <= 12'd3938;
			sin_lut[81] <= 12'd3918;
			sin_lut[82] <= 12'd3897;
			sin_lut[83] <= 12'd3875;
			sin_lut[84] <= 12'd3852;
			sin_lut[85] <= 12'd3828;
			sin_lut[86] <= 12'd3802;
			sin_lut[87] <= 12'd3776;
			sin_lut[88] <= 12'd3749;
			sin_lut[89] <= 12'd3720;
			sin_lut[90] <= 12'd3691;
			sin_lut[91] <= 12'd3660;
			sin_lut[92] <= 12'd3629;
			sin_lut[93] <= 12'd3597;
			sin_lut[94] <= 12'd3563;
			sin_lut[95] <= 12'd3529;
			sin_lut[96] <= 12'd3494;
			sin_lut[97] <= 12'd3458;
			sin_lut[98] <= 12'd3421;
			sin_lut[99] <= 12'd3384;
			sin_lut[100] <= 12'd3345;
			sin_lut[101] <= 12'd3306;
			sin_lut[102] <= 12'd3266;
			sin_lut[103] <= 12'd3225;
			sin_lut[104] <= 12'd3184;
			sin_lut[105] <= 12'd3142;
			sin_lut[106] <= 12'd3099;
			sin_lut[107] <= 12'd3055;
			sin_lut[108] <= 12'd3011;
			sin_lut[109] <= 12'd2967;
			sin_lut[110] <= 12'd2922;
			sin_lut[111] <= 12'd2876;
			sin_lut[112] <= 12'd2830;
			sin_lut[113] <= 12'd2783;
			sin_lut[114] <= 12'd2736;
			sin_lut[115] <= 12'd2689;
			sin_lut[116] <= 12'd2641;
			sin_lut[117] <= 12'd2592;
			sin_lut[118] <= 12'd2544;
			sin_lut[119] <= 12'd2495;
			sin_lut[120] <= 12'd2446;
			sin_lut[121] <= 12'd2396;
			sin_lut[122] <= 12'd2347;
			sin_lut[123] <= 12'd2297;
			sin_lut[124] <= 12'd2247;
			sin_lut[125] <= 12'd2197;
			sin_lut[126] <= 12'd2147;
			sin_lut[127] <= 12'd2097;
			sin_lut[128] <= 12'd2047;
			sin_lut[129] <= 12'd1996;
			sin_lut[130] <= 12'd1946;
			sin_lut[131] <= 12'd1896;
			sin_lut[132] <= 12'd1846;
			sin_lut[133] <= 12'd1796;
			sin_lut[134] <= 12'd1746;
			sin_lut[135] <= 12'd1697;
			sin_lut[136] <= 12'd1647;
			sin_lut[137] <= 12'd1598;
			sin_lut[138] <= 12'd1549;
			sin_lut[139] <= 12'd1501;
			sin_lut[140] <= 12'd1452;
			sin_lut[141] <= 12'd1404;
			sin_lut[142] <= 12'd1357;
			sin_lut[143] <= 12'd1310;
			sin_lut[144] <= 12'd1263;
			sin_lut[145] <= 12'd1217;
			sin_lut[146] <= 12'd1171;
			sin_lut[147] <= 12'd1126;
			sin_lut[148] <= 12'd1082;
			sin_lut[149] <= 12'd1038;
			sin_lut[150] <= 12'd994;
			sin_lut[151] <= 12'd951;
			sin_lut[152] <= 12'd909;
			sin_lut[153] <= 12'd868;
			sin_lut[154] <= 12'd827;
			sin_lut[155] <= 12'd787;
			sin_lut[156] <= 12'd748;
			sin_lut[157] <= 12'd709;
			sin_lut[158] <= 12'd672;
			sin_lut[159] <= 12'd635;
			sin_lut[160] <= 12'd599;
			sin_lut[161] <= 12'd564;
			sin_lut[162] <= 12'd530;
			sin_lut[163] <= 12'd496;
			sin_lut[164] <= 12'd464;
			sin_lut[165] <= 12'd433;
			sin_lut[166] <= 12'd402;
			sin_lut[167] <= 12'd373;
			sin_lut[168] <= 12'd344;
			sin_lut[169] <= 12'd317;
			sin_lut[170] <= 12'd291;
			sin_lut[171] <= 12'd265;
			sin_lut[172] <= 12'd241;
			sin_lut[173] <= 12'd218;
			sin_lut[174] <= 12'd196;
			sin_lut[175] <= 12'd175;
			sin_lut[176] <= 12'd155;
			sin_lut[177] <= 12'd137;
			sin_lut[178] <= 12'd119;
			sin_lut[179] <= 12'd103;
			sin_lut[180] <= 12'd88;
			sin_lut[181] <= 12'd74;
			sin_lut[182] <= 12'd61;
			sin_lut[183] <= 12'd49;
			sin_lut[184] <= 12'd39;
			sin_lut[185] <= 12'd30;
			sin_lut[186] <= 12'd22;
			sin_lut[187] <= 12'd15;
			sin_lut[188] <= 12'd9;
			sin_lut[189] <= 12'd5;
			sin_lut[190] <= 12'd2;
			sin_lut[191] <= 12'd0;
			sin_lut[192] <= 12'd0;
			sin_lut[193] <= 12'd0;
			sin_lut[194] <= 12'd2;
			sin_lut[195] <= 12'd5;
			sin_lut[196] <= 12'd9;
			sin_lut[197] <= 12'd15;
			sin_lut[198] <= 12'd22;
			sin_lut[199] <= 12'd30;
			sin_lut[200] <= 12'd39;
			sin_lut[201] <= 12'd49;
			sin_lut[202] <= 12'd61;
			sin_lut[203] <= 12'd74;
			sin_lut[204] <= 12'd88;
			sin_lut[205] <= 12'd103;
			sin_lut[206] <= 12'd119;
			sin_lut[207] <= 12'd137;
			sin_lut[208] <= 12'd155;
			sin_lut[209] <= 12'd175;
			sin_lut[210] <= 12'd196;
			sin_lut[211] <= 12'd218;
			sin_lut[212] <= 12'd241;
			sin_lut[213] <= 12'd265;
			sin_lut[214] <= 12'd291;
			sin_lut[215] <= 12'd317;
			sin_lut[216] <= 12'd344;
			sin_lut[217] <= 12'd373;
			sin_lut[218] <= 12'd402;
			sin_lut[219] <= 12'd433;
			sin_lut[220] <= 12'd464;
			sin_lut[221] <= 12'd496;
			sin_lut[222] <= 12'd530;
			sin_lut[223] <= 12'd564;
			sin_lut[224] <= 12'd599;
			sin_lut[225] <= 12'd635;
			sin_lut[226] <= 12'd672;
			sin_lut[227] <= 12'd709;
			sin_lut[228] <= 12'd748;
			sin_lut[229] <= 12'd787;
			sin_lut[230] <= 12'd827;
			sin_lut[231] <= 12'd868;
			sin_lut[232] <= 12'd909;
			sin_lut[233] <= 12'd951;
			sin_lut[234] <= 12'd994;
			sin_lut[235] <= 12'd1038;
			sin_lut[236] <= 12'd1082;
			sin_lut[237] <= 12'd1126;
			sin_lut[238] <= 12'd1171;
			sin_lut[239] <= 12'd1217;
			sin_lut[240] <= 12'd1263;
			sin_lut[241] <= 12'd1310;
			sin_lut[242] <= 12'd1357;
			sin_lut[243] <= 12'd1404;
			sin_lut[244] <= 12'd1452;
			sin_lut[245] <= 12'd1501;
			sin_lut[246] <= 12'd1549;
			sin_lut[247] <= 12'd1598;
			sin_lut[248] <= 12'd1647;
			sin_lut[249] <= 12'd1697;
			sin_lut[250] <= 12'd1746;
			sin_lut[251] <= 12'd1796;
			sin_lut[252] <= 12'd1846;
			sin_lut[253] <= 12'd1896;
			sin_lut[254] <= 12'd1946;
			sin_lut[255] <= 12'd1996;
		end
		
		// Move through sinus LUT
		else begin
			if ( sw_clk_1_i ) begin
				sin_lut_cnt_1 	<= sin_lut_cnt_1 + 1'b1;
			end
			
			if ( sw_clk_2_i ) begin
				sin_lut_cnt_2 	<= sin_lut_cnt_2 + 1'b1;				
			end
		end
	end


endmodule // module: SinusWaveform





