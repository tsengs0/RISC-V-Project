`timescale 1ns/100ps 

module tb_branch_op;

	reg [63:0] SrcA;
	reg [63:0] SrcB;
	reg [2:0] InstSel;
	wire result;

	branch_operator u0 (
		.SrcA(SrcA[63:0]),
		.SrcB(SrcB[63:0]),
		.InstSel(InstSel[2:0]),
		.result(result)
	);

	initial begin
		$dumpfile("tb.vcd");
		$dumpvars(0, tb_branch_op);
		$monitor("%t: SrcA = %b, SrcB = %b, result = %b", $time, SrcA, SrcB, result);
	end

	initial begin
		#0;
		InstSel[2:0] <= 3'bzzz;

		#50;
		InstSel[2:0] <= 3'b000;

		#50;
		InstSel[2:0] <= 3'b001;

		#50;
		InstSel[2:0] <= 3'b000;

		#50;
		InstSel[2:0] <= 3'b001;

		#50 $finish;
	end

	initial begin
		#0;
		SrcA[63:0] <= 64'd0;
		SrcB[63:0] <= 64'd0;

		#50;
		SrcA[63:0] <= 64'd5;
		SrcB[63:0] <= 64'd0;
		
		#50;
		SrcA[63:0] <= 64'd0;
		SrcB[63:0] <= 64'd5;
		
		#50;
		SrcA[63:0] <= 64'd10;
		SrcB[63:0] <= 64'd5;
		
		#50;
		SrcA[63:0] <= 64'd5;
		SrcB[63:0] <= 64'd10;

		#50 $finish;
	end
endmodule
