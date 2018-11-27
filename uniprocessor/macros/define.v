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

`define EXE_ORI 7'b0_0100_11 // ori

// Instruction Memory (ROM) 
`define InstAddrBus 31:0
`define InstBus 31:0
`define InstMemNum 131071 // The actual size of ROM is 128KB
`define InstMemNumLog2 17 // The actual size of address

// Register File: regfile
`define RegAddrBus 4:0 // The size of address bus, i.e., 5
`define RegBus 63:0 	   // The size of data bus is 64-bit
`define RegWidth 64      // The data size of each register is 64-bit
`define DoubleRegWidth 128
`define DoubleRegBus 127:0
`define RegNum 32 //  The register from x0 to x31
`define RegNumLog2 5 // The size of address bus, i.e., log 32 base 2 = 5
`define NOPRegAddr 5'b0_0000