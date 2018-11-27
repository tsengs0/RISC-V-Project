`timescale 1ns/100ps
`include "../macros/define.v" 

module tb_if_id;

    reg sys_clk, rstn;
	wire ce;
	wire [`InstAddrBus] pc_addr;
	wire [`InstBus] inst;
	wire [`InstAddrBus] pc_addr_id;
	wire [`InstBus] fetched_inst_id;

	pc u0 (	
		 .sys_clk 	(sys_clk),
		 .rstn		(rstn),	
		 .pc_addr  (pc_addr[`InstAddrBus]), 
		 .ce          (ce)
	);

	InstMem_controller u1(
		.ce(ce),
		.inst_addr(pc_addr[`InstAddrBus]),
		.inst(inst[`InstBus])
	);
	
	if_id u2(
		 .sys_clk	        (sys_clk),
		 .rstn		        (rtsn),
		.pc_addr_if	    (pc_addr[`InstAddrBus]),       
		.fetched_inst_if  (inst[`InstBus]),
		.pc_addr_id	    (pc_addr_id[`InstAddrBus]),      
		.fetched_inst_id (fetched_inst_id[`InstBus]) 
	);

	initial begin
		$dumpfile("tb_if_id.vcd");
		$dumpvars(0, tb_if_id);
		$monitor("ce: %b, pc_addr: %h, inst: %h, pc_addr_id: %h, fetched_inst_id: %h", ce, pc_addr, inst, pc_addr_id, fetched_inst_id);
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
