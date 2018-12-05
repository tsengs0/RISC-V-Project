`timescale 1ns/100ps
`include "../../macros/define.v"

module tb_RegFile;

	reg sys_clk, rstn;
	reg [`RegAddrBus] ReadAddr_1, ReadAddr_2, WriteAddr;
	reg [`RegBus] WriteData;
	reg RegRead_1, RegRead_2, RegWrite;
	wire [`RegBus] ReadData_1, ReadData_2;
	wire [`RegBus] x_regs[0:`RegNum-1];
	wire [`RegBus] x0; 	
	wire [`RegBus] x1; 	
	wire [`RegBus] x2; 	
	wire [`RegBus] x3; 	
	wire [`RegBus] x4; 	
	wire [`RegBus] x5; 	
	wire [`RegBus] x6; 	
	wire [`RegBus] x7; 	
	wire [`RegBus] x8; 	
	wire [`RegBus] x9; 	
	wire [`RegBus] x10; 	
	wire [`RegBus] x11; 	
	wire [`RegBus] x12; 	
	wire [`RegBus] x13; 	
	wire [`RegBus] x14; 	
	wire [`RegBus] x15; 	
	wire [`RegBus] x16; 	
	wire [`RegBus] x17; 	
	wire [`RegBus] x18; 	
	wire [`RegBus] x19; 	
	wire [`RegBus] x20; 	
	wire [`RegBus] x21; 	
	wire [`RegBus] x22; 	
	wire [`RegBus] x23; 	
	wire [`RegBus] x24; 	
	wire [`RegBus] x25; 	
	wire [`RegBus] x26; 	
	wire [`RegBus] x27; 	
	wire [`RegBus] x28; 	
	wire [`RegBus] x29; 	
	wire [`RegBus] x30; 	
	wire [`RegBus] x31;	

	RegFile u0 (
		.sys_clk (sys_clk),
       		.rstn (rstn),
		.ReadAddr_1 (ReadAddr_1[`RegAddrBus]),
		.ReadAddr_2 (ReadAddr_2[`RegAddrBus]),
		.WriteAddr (WriteAddr[`RegAddrBus]),
		.WriteData (WriteData[`RegBus]),
		.RegRead_1 (RegRead_1), 
		.RegRead_2 (RegRead_2), 
		.RegWrite (RegWrite),  
	
		.ReadData_1 (ReadData_1[`RegBus]),
		.ReadData_2 (ReadData_2[`RegBus]),	
		.x0 (x0), 	
		.x1 (x1), 	
		.x2 (x2), 	
		.x3 (x3), 	
		.x4 (x4), 	
		.x5 (x5), 	
		.x6 (x6), 	
		.x7 (x7), 	
		.x8 (x8), 	
		.x9 (x9), 	
		.x10 (x10), 	
		.x11 (x11), 	
		.x12 (x12), 	
		.x13 (x13), 	
		.x14 (x14), 	
		.x15 (x15), 	
		.x16 (x16), 	
		.x17 (x17), 	
		.x18 (x18), 	
		.x19 (x19), 	
		.x20 (x20), 	
		.x21 (x21), 	
		.x22 (x22), 	
		.x23 (x23), 	
		.x24 (x24), 	
		.x25 (x25), 	
		.x26 (x26), 	
		.x27 (x27), 	
		.x28 (x28), 	
		.x29 (x29), 	
		.x30 (x30), 	
		.x31 (x31) 	
	);
	
	initial begin
		$dumpfile("tb_RegFile.vcd");
		$dumpvars(0, tb_RegFile);
		$monitor("%t: ReadAddr_1: %h, ReadAddr_2: %h, WriteAddr: %h, WriteData: %h, RegRead_1: %h, RegRead_2: %h, RegWrite: %h, ReadData_1: %h, ReadData_2: %h",
				$time,
				ReadAddr_1, ReadAddr_2, WriteAddr,
				WriteData, RegRead_1, RegRead_2, 
				RegWrite, ReadData_1, ReadData_2 
		);
	end

	initial begin
		#0;
		rstn    <= `RstEnable;
		
		#20;
		rstn <= `RstDisable;

		#1000 $finish;
	end

	initial begin
		#0;
		sys_clk <= 1'b0;

		forever #10 sys_clk <= ~sys_clk;
		
		#1000 $finish;
	end

	integer i;
	initial begin
		#0;
		ReadAddr_1 <= 'd0;
		ReadAddr_2 <= 'd31;

		#50 
		ReadAddr_1 <= ReadAddr_1 + 1'b1;
		ReadAddr_2 <= ReadAddr_2 - 1'b1;
		
		for(i = 0; i < 31; i++) begin
			#20 
			ReadAddr_1 <= ReadAddr_1 + 1'b1;
			ReadAddr_2 <= ReadAddr_2 - 1'b1;
		end
		#1000 $finish;

	end

	initial begin
		#0;
		RegRead_1 <= 1'b0;
		RegRead_2 <= 1'b0;

		forever begin
			#10;
			RegRead_1 <= ~RegRead_1;
			RegRead_2 <= ~RegRead_2;
		end	
		#1000 $finish;
	end

	initial begin
		#0   RegWrite <= 1'b0;
		#700 RegWrite <= 1'b1;
		#1000 $finish;
	end

	initial begin
		#0 WriteAddr <= 'd0;
		
		#700;
		for(i = 0; i < 32; i++) begin
			#10
			WriteAddr <= WriteAddr + $itor(i);
		end
		#1000 $finish;
	end

	reg [`RegBus] x_regs_temp[0:`RegNum-1];
	initial begin
		$display("Loading Write Registers");
		$readmemh("RegWrite_pattern.mem", x_regs_temp);
		#1000 $finish;
	end
	initial begin
		#0 RegWrite <= 'd0;
		#700;
		for(i = 0; i < 32; i++) begin
			#10 RegWrite <= x_regs_temp[i];
		end	
		#1000 $finish;
	end

endmodule



