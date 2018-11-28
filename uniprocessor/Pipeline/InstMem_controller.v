`include "../macros/define.v" 

// Read requested memory address and output its corresponding instruction from instruction memory	
module InstMem_controller (
	input wire ce,                      // Start replying the request when ce signal is enable
	input wire [`InstAddrBus] inst_addr,

	output reg [`InstBus] inst
);

	reg [`InstBus] inst_mem[0:6];

	// Load all instructions from Instruction Memory (ROM).
	// The contents of instruction memory is defined by "Inst_mem.mem" file
	initial begin
		$display("Loading ROM");
		$readmemh("Inst_mem.mem", inst_mem);
	end

	wire [6:0] inst_mem_index;
	assign inst_mem_index = {2'b00, inst_addr[`InstWidth-1:2]};
	always @(*) begin
		if(ce == `ChipDisable) inst[`InstBus] <= `InstWidth'd0;
		else inst[`InstBus] <= inst_mem[inst_mem_index];
	end

endmodule
