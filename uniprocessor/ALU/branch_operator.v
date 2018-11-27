`define EXE_BEQ_SEL  3'b000
`define EXE_BNE_SEL  3'b001
`define EXE_BLT_SEL  3'b010
`define EXE_BGE_SEL  3'b011
`define EXE_BLTU_SEL 3'b100
`define EXE_BGEU_SEL 3'b101

module branch_operator (
	input wire [63:0] SrcA,
	input wire [63:0] SrcB,
	input wire [2:0]  InstSel,
	output reg result
);
	
	reg [63:0] xor_out;
	integer i;
	always @(InstSel[2:0])
	begin
		case (InstSel[2:0])
			`EXE_BEQ_SEL: for(i = 0; i < 64; i = i + 1) xor_out[i] <= SrcA[i] ^ SrcB[i];
			`EXE_BNE_SEL: for(i = 0; i < 64; i = i + 1) xor_out[i] <= SrcA[i] ^ SrcB[i];
			`EXE_BLT_SEL: for(i = 0; i < 64; i = i + 1) xor_out[i] <= SrcA[i] ^ SrcB[i];
			default: xor_out[63:0] <= xor_out[63:0];
		endcase
	end
	
	always @(*) 
	begin
		case (InstSel[2:0])
			`EXE_BEQ_SEL: result <= ~| xor_out[63:0];
			`EXE_BNE_SEL: result <=  | xor_out[63:0];
			default: result <= result;	
		endcase
	end

endmodule
