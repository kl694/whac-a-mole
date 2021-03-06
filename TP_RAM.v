// megafunction wizard: %RAM: 3-PORT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: alt3pram 

// ============================================================
// File Name: TP_RAM.v
// Megafunction Name(s):
// 			alt3pram
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 6.0 Build 202 06/20/2006 SP 1 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2006 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module TP_RAM (
	data,
	rdaddress_a,
	rdaddress_b,
	rdclock,
	wraddress,
	wrclock,
	wren,
	qa,
	qb);

	input	[23:0]  data;
	input	[9:0]  rdaddress_a;
	input	[9:0]  rdaddress_b;
	input	  rdclock;
	input	[9:0]  wraddress;
	input	  wrclock;
	input	  wren;
	output	[23:0]  qa;
	output	[23:0]  qb;

	wire [23:0] sub_wire0;
	wire [23:0] sub_wire1;
	wire [23:0] qa = sub_wire0[23:0];
	wire [23:0] qb = sub_wire1[23:0];

	alt3pram	alt3pram_component (
				.outclock (rdclock),
				.wren (wren),
				.inclock (wrclock),
				.data (data),
				.rdaddress_a (rdaddress_a),
				.wraddress (wraddress),
				.rdaddress_b (rdaddress_b),
				.qa (sub_wire0),
				.qb (sub_wire1)
				// synopsys translate_off
				,
				.aclr (),
				.inclocken (),
				.outclocken (),
				.rden_a (),
				.rden_b ()
				// synopsys translate_on
				);
	defparam
		alt3pram_component.indata_aclr = "OFF",
		alt3pram_component.indata_reg = "INCLOCK",
		alt3pram_component.intended_device_family = "Cyclone II",
		alt3pram_component.lpm_type = "alt3pram",
		alt3pram_component.outdata_aclr_a = "OFF",
		alt3pram_component.outdata_aclr_b = "OFF",
		alt3pram_component.outdata_reg_a = "OUTCLOCK",
		alt3pram_component.outdata_reg_b = "OUTCLOCK",
		alt3pram_component.rdaddress_aclr_a = "OFF",
		alt3pram_component.rdaddress_aclr_b = "OFF",
		alt3pram_component.rdaddress_reg_a = "OUTCLOCK",
		alt3pram_component.rdaddress_reg_b = "OUTCLOCK",
		alt3pram_component.rdcontrol_aclr_a = "OFF",
		alt3pram_component.rdcontrol_aclr_b = "OFF",
		alt3pram_component.rdcontrol_reg_a = "UNREGISTERED",
		alt3pram_component.rdcontrol_reg_b = "UNREGISTERED",
		alt3pram_component.width = 24,
		alt3pram_component.widthad = 10,
		alt3pram_component.write_aclr = "OFF",
		alt3pram_component.write_reg = "INCLOCK";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: BlankMemory NUMERIC "1"
// Retrieval info: PRIVATE: CLRdata NUMERIC "0"
// Retrieval info: PRIVATE: CLRqa NUMERIC "0"
// Retrieval info: PRIVATE: CLRqb NUMERIC "0"
// Retrieval info: PRIVATE: CLRrdaddress_a NUMERIC "0"
// Retrieval info: PRIVATE: CLRrdaddress_b NUMERIC "0"
// Retrieval info: PRIVATE: CLRrren_a NUMERIC "0"
// Retrieval info: PRIVATE: CLRrren_b NUMERIC "0"
// Retrieval info: PRIVATE: CLRwrite NUMERIC "0"
// Retrieval info: PRIVATE: Clock NUMERIC "1"
// Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_A"
// Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
// Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
// Retrieval info: PRIVATE: MIFfilename STRING ""
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: REGdata NUMERIC "1"
// Retrieval info: PRIVATE: REGqa NUMERIC "1"
// Retrieval info: PRIVATE: REGqb NUMERIC "1"
// Retrieval info: PRIVATE: REGrdaddress_a NUMERIC "1"
// Retrieval info: PRIVATE: REGrdaddress_b NUMERIC "1"
// Retrieval info: PRIVATE: REGrren_a NUMERIC "0"
// Retrieval info: PRIVATE: REGrren_b NUMERIC "0"
// Retrieval info: PRIVATE: REGwrite NUMERIC "1"
// Retrieval info: PRIVATE: WidthAddr NUMERIC "10"
// Retrieval info: PRIVATE: WidthData NUMERIC "24"
// Retrieval info: PRIVATE: enable NUMERIC "0"
// Retrieval info: PRIVATE: rden_a NUMERIC "0"
// Retrieval info: PRIVATE: rden_b NUMERIC "0"
// Retrieval info: CONSTANT: INDATA_ACLR STRING "OFF"
// Retrieval info: CONSTANT: INDATA_REG STRING "INCLOCK"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: LPM_TYPE STRING "alt3pram"
// Retrieval info: CONSTANT: OUTDATA_ACLR_A STRING "OFF"
// Retrieval info: CONSTANT: OUTDATA_ACLR_B STRING "OFF"
// Retrieval info: CONSTANT: OUTDATA_REG_A STRING "OUTCLOCK"
// Retrieval info: CONSTANT: OUTDATA_REG_B STRING "OUTCLOCK"
// Retrieval info: CONSTANT: RDADDRESS_ACLR_A STRING "OFF"
// Retrieval info: CONSTANT: RDADDRESS_ACLR_B STRING "OFF"
// Retrieval info: CONSTANT: RDADDRESS_REG_A STRING "OUTCLOCK"
// Retrieval info: CONSTANT: RDADDRESS_REG_B STRING "OUTCLOCK"
// Retrieval info: CONSTANT: RDCONTROL_ACLR_A STRING "OFF"
// Retrieval info: CONSTANT: RDCONTROL_ACLR_B STRING "OFF"
// Retrieval info: CONSTANT: RDCONTROL_REG_A STRING "UNREGISTERED"
// Retrieval info: CONSTANT: RDCONTROL_REG_B STRING "UNREGISTERED"
// Retrieval info: CONSTANT: WIDTH NUMERIC "24"
// Retrieval info: CONSTANT: WIDTHAD NUMERIC "10"
// Retrieval info: CONSTANT: WRITE_ACLR STRING "OFF"
// Retrieval info: CONSTANT: WRITE_REG STRING "INCLOCK"
// Retrieval info: USED_PORT: data 0 0 24 0 INPUT NODEFVAL data[23..0]
// Retrieval info: USED_PORT: qa 0 0 24 0 OUTPUT NODEFVAL qa[23..0]
// Retrieval info: USED_PORT: qb 0 0 24 0 OUTPUT NODEFVAL qb[23..0]
// Retrieval info: USED_PORT: rdaddress_a 0 0 10 0 INPUT NODEFVAL rdaddress_a[9..0]
// Retrieval info: USED_PORT: rdaddress_b 0 0 10 0 INPUT NODEFVAL rdaddress_b[9..0]
// Retrieval info: USED_PORT: rdclock 0 0 0 0 INPUT NODEFVAL rdclock
// Retrieval info: USED_PORT: wraddress 0 0 10 0 INPUT NODEFVAL wraddress[9..0]
// Retrieval info: USED_PORT: wrclock 0 0 0 0 INPUT NODEFVAL wrclock
// Retrieval info: USED_PORT: wren 0 0 0 0 INPUT VCC wren
// Retrieval info: CONNECT: @data 0 0 24 0 data 0 0 24 0
// Retrieval info: CONNECT: qa 0 0 24 0 @qa 0 0 24 0
// Retrieval info: CONNECT: qb 0 0 24 0 @qb 0 0 24 0
// Retrieval info: CONNECT: @wraddress 0 0 10 0 wraddress 0 0 10 0
// Retrieval info: CONNECT: @rdaddress_a 0 0 10 0 rdaddress_a 0 0 10 0
// Retrieval info: CONNECT: @rdaddress_b 0 0 10 0 rdaddress_b 0 0 10 0
// Retrieval info: CONNECT: @wren 0 0 0 0 wren 0 0 0 0
// Retrieval info: CONNECT: @inclock 0 0 0 0 wrclock 0 0 0 0
// Retrieval info: CONNECT: @outclock 0 0 0 0 rdclock 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL TP_RAM.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL TP_RAM.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL TP_RAM.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL TP_RAM.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL TP_RAM_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL TP_RAM_bb.v FALSE
