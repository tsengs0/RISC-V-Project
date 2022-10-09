`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bo-Yu Tseng
// 
// Create Date: 09.Oct.2022
// Design Name: rv32i
// Module Name: rv32i_instDecoder
// Project Name: RISC-V core IP development
// Target Devices: Xilinx FPGAs and open source ASIC process
// Tool Versions: 
// Description: 
// 				A RTL module of instruction decoder for RV32I
// Dependencies: 
// 				a) ../macros/rv32_define.vh
//				b) ../macros/define.vh
// Revision:
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "../macros/define.vh"
`include "../macros/rv32_define"

module rv32i_instDecoder (
	// Output
	// To integer register RAM
	output wire [`REG_ADDR_WIDTH-1:0] rd_addr_o,
	output wire [`REG_ADDR_WIDTH-1:0] rs1_addr_o,
	output wire [`REG_ADDR_WIDTH-1:0] rs2_addr_o,
	output wire rs1_re_o,
	output wire rs2_re_o,

	// Immediate value
	output wire [`EXT_IMM_WIDTH-1:0] imm_extend_o,

	// Input
	input wire [`INST_WIDTH-1:0] inst_code_i,
	input wire rstn
);

endmodule