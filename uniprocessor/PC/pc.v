module pc {
	
	input wire sys_clk,
	input wire rstn,

	output reg [`InstAddrBus] pc_addr, // Point the memory address of current instruction inside the instruction memory (32-bit instruction)
	output reg	 ce // Enable the instruction memory to be accessable 
};

	always@ (posedge sys_clk, rtsn) 
	begin
		if(rstn == `RstEnable) ce <= `ChipDisable;
		else		       ce <= `ChipEnable;
	end

	always@ (posedge sys_clk, rstn)
	begin
		if(rstn == `RstEnable && ce == `ChipDisable ) begin
			pc_addr[`InstAddrBus] <= `InstAddrWidth'd0;
		else
			pc_addr[`InstAddrBus] <= pc_addr[`InstAddrBus] + 4'h4
		end	
	end

endmodule
