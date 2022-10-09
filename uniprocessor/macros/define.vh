`define RstEnable  	1'b0	// Reset whilst signal '0'
`define RstDisable 	1'b1 
`define ZeroWord   	32'h0000_0000 
`define ZeroDoubleWord  64'h0000_0000_0000_0000
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

// Instruction Memory (ROM) 
`define INST_MEM_SIZE (4**10) // SIZE of instruction ROM: 4KiB
`define INST_MEM_PAGE_NUM (2**10) // The page number of instruction ROM is 1K
`define INST_ADDR_WIDTH $clog2(`INST_MEM_SIZE)
`define INST_WIDTH 32


// Configuration for 32-bit integer register RAM
`define REG_ADDR_WIDTH 5 // The size of address bus, i.e., 5
`define REG_WIDTH 32      // The data size of each register is 32 bits
`define INT_REG_NUM 32 //  The register from x0 to x31

// Immediate values
`define EXT_IMM_WIDTH 32 // The size of sign-extend immediate value is 32 bits