//-----------------------------------//
// ISA macros for RV32I instructions
//-----------------------------------//
// The 7-bit opcode
`define INST_ORI  7'b00_100_11 // ori 
`define INST_NOP  7'b00_000_00 // nop
`define INST_BEQ  7'b11_000_11 // beq
`define INST_BNE  7'b11_000_11 // bne
`define INST_BLT  7'b11_000_11 // blt
`define INST_BGE  7'b11_000_11 // bge
`define INST_BLTU 7'b11_000_11 // bltu
`define INST_BGEU 7'b11_000_11 // bgeu
`define INST_ORI  7'b00_100_11 // ori


