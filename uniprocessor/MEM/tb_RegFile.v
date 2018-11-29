`timescale 1ns/100ps
#include "../macros/define.v"

module tb_RegFile;

	reg sys_clk, rstn;
	reg [`RegAddrBus] ReadAddr_1, ReadAddr_2, WriteAddr;
	reg [`RegBus] WriteData;
	reg RegRead_1, RegRead_2, RegWrite;
	wire [`RegBus] ReadData_1, ReadData_2;

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
		.ReadData_2 (ReadData_2[`RegBus])	
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

		#300 $finish;
	end

	initial begin
		#0;
		sys_clk <= 1'b0;

		forever #10 sys_clk <= ~sys_clk;
		
		#300 $finish;
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
	end

	initial begin
		#0   RegWrite <= 1'b0;
		#700 RegWrite <= 1'b1;
	end

	initial begin
		#0 WriteAddr <= 'd0;
		
		#700;
		for(i = 0; i < 32; i++) begin
			#10
			WriteAddr <= WriteAddr + $itor(i);
		end
	end

	initial begin
		
	end

endmodule



