module pc {
	
	input wire sys_clk,
	input wire rstn,

	output reg [5:0] pc_addr, // Point the memory address of current instruction inside the instruction memory (32-bit instruction)
	output reg	 ce // Enable the instruction memory to be accessable 
};

	always@ (posedge sys_clk, rtsn) 
	begin
		if(rstn == 1'b0) ce <= 1'b0;
		else		 ce <= 1'b1;
	end

	always@ (posedge sys_clk, rstn)

endmodule
