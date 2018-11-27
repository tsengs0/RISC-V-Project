`include "../macros/define.v"

module if_id (
	input wire sys_clk,
	input wire rstn,

	input wire [`InstAddrBus] pc_addr_if, // The address of currently fetched instruction (from the result of instruction fetching step) 
	input wire [`InstBus]     fetched_inst_if, // The instruction fetched at any clock cycle

	output reg [`InstAddrBus] pc_addr_id, // The address of currnetly fetched instruction (to instruction decoding step)
	output reg [`InstBus] fetched_inst_id // The fetched instruction to instruction decoder
);

	always @(posedge sys_clk, rstn) begin
		if(rstn == `RstEnable) begin
			pc_addr_id[`InstAddrBus]  <= `ZeroWord; // The output of program counter is set as '0' whilst the reset state is set
			fetched_inst_id[`InstBus] <= `ZeroWord; // The instruction is '0' when the reset state is set
		end 
		else begin
			pc_addr_id[`InstAddrBus]  <= pc_addr_if[`InstAddrBus];  // Pass the current instruction addree to IF/ID register 
			fetched_inst_id[`InstBus] <= fetched_inst_if[`InstBus]; // Pass the currently fetched instruciton to IF/ID register
		end
	end
endmodule
