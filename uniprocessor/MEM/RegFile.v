`include "../macros/define.v"

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
	output reg [`RegBus] ReadData_2	
);

	// Declaring those 31 general-purpose registers x1 - x31, which hold integer values.
	reg [`RegBus] x_regs[0:`RegNum-1]; 

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

