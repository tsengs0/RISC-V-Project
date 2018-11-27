module comp_2x2_gt (
	input [2:0] SrcA,
	input [2:0] SrcB,

	output out_g
);

	wire and_1, and_2, and_3;
	and u0(and_1, SrcA[1], ~SrcB[1]);
	and u1(and_2, SrcA[0], ~srcB[1], ~SrcB[0]);
	and u2(and_3, SrcA[1], SrcA[0], ~SrcB[0]);
	or  u3(out_g, and_1, and_2, and_3);
endmodule
