module RegFile (
	input wire sys_clk,
       	input wire rstn,

	input wire [4:0] ReadAddr_1,
	input wire [4:0] ReadAddr_2,
	input wire [4:0] WriteAddr,
	input wire [63:0] WriteData,

	input wire RegRead_1,
	input wire RegRead_2,
	input wire RegWrite,

	output reg [63:0] ReadData_1,
	output reg [63:0] ReadData_2	
);


endmodule
