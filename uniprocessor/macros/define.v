`define RstEnable  	1'b0	// Reset whilst signal '0'
`define RstDisable 	1'b1 
`define ZeroWord   	32'h0000_0000 
`define WriteEnable 	1'b1
`define WriteDisable	1'b0
`define ReadEnable	1'b1
`define ReadDisable	1'b0

`define AluControlIn	3:0	// The size of ALU Operation, i.e., ALU control input

`define InstValid	1'b0	// Valid instruction
`define InstInvalid	1'b1	// Invalid instruction
`define True_v		1'b1	// Logically True
`define False_v		1'b0	// Logically False
`define ChipEnable	1'b1
`define ChipDisable	1'b0

// The marcos of RV32I Based instruction
// The 7-bit opcode
`define EXE_ORI	 7'b0_0100_11 // ori 
`define EXE_NOP	 7'b0_0000_00 // nop
`define EXE_BEQ  7'b1_1000_11 // beq
`define EXE_BNE  7'b1_1000_11 // bne
`define EXE_BLT  7'b1_1000_11 // blt
`define EXE_BGE  7'b1_1000_11 // bge
`define EXE_BLTU 7'b1_1000_11 // bltu
`define EXE_BGEU 7'b1_1000_11 // bgeu


