`timescale 1ns/100ps
`include "../macros/define.v"

module tb_InstMem;

	reg ce;
	reg [`InstAddrBus] inst_addr;
	wire [`InstBus] inst;

	InstMem_controller u0(
		.ce(ce),
		.inst_addr(inst_addr[`InstAddrBus]),
		.inst(inst[`InstBus])
	);

	initial begin
		$dumpfile("tb_InstMem.vcd");
		$dumpvars(0, tb_InstMem);
		$monitor("ce = %b, inst_addr = %h, inst = %h", ce, inst_addr[`InstAddrBus], inst[`InstBus]);
	end

	initial begin
		#0;
		ce <= `ChipDisable;
		inst_addr[`InstAddrBus] <= `InstAddrWidth'd0;

		#10;
		ce <= `ChipEnable;

		// Fetch instruction from 0x0
		#10; 
		inst_addr[`InstAddrBus] <= inst_addr[`InstAddrBus] + 4'h4;

		// Fetch instruction from 0x4
		#10; 
		inst_addr[`InstAddrBus] <= inst_addr[`InstAddrBus] + 4'h4;

		// Fetch instruction from 0x8
		#10; 
		inst_addr[`InstAddrBus] <= inst_addr[`InstAddrBus] + 4'h4;

		// Fetch instruction from 0xC
		#10; 
		inst_addr[`InstAddrBus] <= inst_addr[`InstAddrBus] + 4'h4;

		// Fetch instruction from 0x10
		#10; 
		inst_addr[`InstAddrBus] <= inst_addr[`InstAddrBus] + 4'h4;

		// Fetch instruction from 0x14
		#10; 
		inst_addr[`InstAddrBus] <= inst_addr[`InstAddrBus] + 4'h4;
		
		#100 $finish;
	end

endmodule
