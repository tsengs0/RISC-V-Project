`include "../../macros/define.v"

module RegFile (
	input wire sys_clk,
       	input wire rstn,

	input wire [`RegAddrBus] ReadAddr_1,
	input wire [`RegAddrBus] ReadAddr_2,
	input wire [`RegAddrBus] WriteAddr,
	input wire [`RegBus] WriteData,

	input wire RegRead_1, // Enable signal for read operation of first register, i.e., rs1
	input wire RegRead_2, // Enable signal for read operation of second register, i.e., rs2
	input wire RegWrite,  // Enable signal for write-back operation

	output reg [`RegBus] ReadData_1,
	output reg [`RegBus] ReadData_2,

	output [`RegBus] x0, 	
	output [`RegBus] x1, 	
	output [`RegBus] x2, 	
	output [`RegBus] x3, 	
	output [`RegBus] x4, 	
	output [`RegBus] x5, 	
	output [`RegBus] x6, 	
	output [`RegBus] x7, 	
	output [`RegBus] x8, 	
	output [`RegBus] x9, 	
	output [`RegBus] x10, 	
	output [`RegBus] x11, 	
	output [`RegBus] x12, 	
	output [`RegBus] x13, 	
	output [`RegBus] x14, 	
	output [`RegBus] x15, 	
	output [`RegBus] x16, 	
	output [`RegBus] x17, 	
	output [`RegBus] x18, 	
	output [`RegBus] x19, 	
	output [`RegBus] x20, 	
	output [`RegBus] x21, 	
	output [`RegBus] x22, 	
	output [`RegBus] x23, 	
	output [`RegBus] x24, 	
	output [`RegBus] x25, 	
	output [`RegBus] x26, 	
	output [`RegBus] x27, 	
	output [`RegBus] x28, 	
	output [`RegBus] x29, 	
	output [`RegBus] x30, 	
	output [`RegBus] x31 	
);

	// Declaring those 31 general-purpose registers x1 - x31, which hold integer values.
	reg [`RegBus] x_regs[0:`RegNum-1]; 
	assign x0   = x_regs[0]; 
	assign x1   = x_regs[1]; 
	assign x2   = x_regs[2]; 
	assign x3   = x_regs[3]; 
	assign x4   = x_regs[4]; 
	assign x5   = x_regs[5]; 
	assign x6   = x_regs[6]; 
	assign x7   = x_regs[7]; 
	assign x8   = x_regs[8]; 
	assign x9   = x_regs[9]; 
	assign  x10 =  x_regs[10];
	assign  x11 =  x_regs[11];
	assign  x12 =  x_regs[12];
	assign  x13 =  x_regs[13];
	assign  x14 =  x_regs[14];
	assign  x15 =  x_regs[15];
	assign  x16 =  x_regs[16];
	assign  x17 =  x_regs[17];
	assign  x18 =  x_regs[18];
	assign  x19 =  x_regs[19];
	assign  x20 =  x_regs[20];
	assign  x21 =  x_regs[21];
	assign  x22 =  x_regs[22];
	assign  x23 =  x_regs[23];
	assign  x24 =  x_regs[24];
	assign  x25 =  x_regs[25];
	assign  x26 =  x_regs[26];
	assign  x27 =  x_regs[27];
	assign  x28 =  x_regs[28];
	assign  x29 =  x_regs[29];
	assign  x30 =  x_regs[30];
	assign  x31 =  x_regs[31];

	// Only for testbench
	initial begin
		$display("Loading Registers");
		$readmemh("RegRead_pattern.mem", x_regs);
	end

	//==========================================================================================//
	// Read Operation with rs1
	//==========================================================================================//
	always @(*) begin
		if(rstn == `RstEnable)                             ReadData_1[`RegBus] <= `ZeroDoubleWord;	
		else if(ReadAddr_1[`RegAddrBus] == `RegNumLog2'h0) ReadData_1[`RegBus] <= `ZeroDoubleWord; // x0 is hardwired to the constant '0'
		else if(RegRead_1 == `ReadEnable)                  ReadData_1[`RegBus] <= x_regs[ReadAddr_1[`RegAddrBus]]; 
		else if(
			(ReadAddr_1[`RegAddrBus] == WriteAddr[`RegAddrBus]) &&
		        (RegWrite == `WriteEnable) &&
			(RegRead_1 == `ReadEnable)
		)    ReadData_1[`RegBus] <= WriteData[`RegBus]; // for data consistency, bypass the written data to its output
		else ReadData_1[`RegBus] <= `ZeroDoubleWord;
	end	

	//==========================================================================================//
	// Read Operation with rs2
	//==========================================================================================//
	always @(*) begin
		if(rstn == `RstEnable)                             ReadData_2[`RegBus] <= `ZeroDoubleWord;	
		else if(ReadAddr_1[`RegAddrBus] == `RegNumLog2'h0) ReadData_2[`RegBus] <= `ZeroDoubleWord; // x0 is hardwired to the constant '0'
		else if(RegRead_1 == `ReadEnable)                  ReadData_2[`RegBus] <= x_regs[ReadAddr_2[`RegAddrBus]]; 
		else if(
			(ReadAddr_2[`RegAddrBus] == WriteAddr[`RegAddrBus]) &&
		        (RegWrite == `WriteEnable) &&
			(RegRead_2 == `ReadEnable)
		)    ReadData_2[`RegBus] <= WriteData[`RegBus]; // for data consistency, bypass upcoming written data to its output
		else ReadData_2[`RegBus] <= `ZeroDoubleWord;
	end

	//==========================================================================================//
	// Write-Back Operation for rd
	//==========================================================================================//
	always @(posedge sys_clk, rstn) begin
		if(rstn == `RstDisable) begin
		  if(
		  	(RegWrite == `WriteEnable) && 
			(WriteAddr[`RegAddrBus] != `RegNumLog2'h0) // Assigning a new value to register x0 is forbidden 
		  ) x_regs[WriteAddr[`RegAddrBus]] <= WriteData[`RegBus];
		end	
	end

endmodule

