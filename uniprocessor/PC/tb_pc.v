`timescale 1ns/100ps 

`include "../macros/define.v"

module tb_pc;

	reg sys_clk, rstn;
	wire [`InstAddrBus] pc_addr;
	wire ce;

	pc u0 (	
		 .sys_clk 	(sys_clk),
		 .rstn		(rstn),	
		 .pc_addr  (pc_addr[`InstAddrBus]), 
		 .ce          (ce)
	);
	
	initial begin
		$dumpfile("tb_pc.vcd");
		$dumpvars(0, tb_pc);
		//$timeformat(-9, 2, " ns", 20); // Print %t with scaled in ns (-9) with 2 precision digits
		$monitor("%t: pc_addr = %b, ce = %h", $time, pc_addr[`InstAddrBus], ce);
	end

	initial begin
		#0;
		rstn    <= `RstEnable;
		
		#100;
		rstn <= `RstDisable;

		#300 $finish;
	end

	initial begin
		#0;
		sys_clk <= 1'b0;

		forever #10 sys_clk <= ~sys_clk;
		
		#300 $finish;
	end

endmodule
