CC = iverilog 
FLAGS = -Wall -Winfloop

MACROS_DIR = ../macros
PC_APP = tb_pc
PC_DIR = ./


all: $(PC_DIR)/pc.v $(PC_DIR)/tb_pc.v $(MACROS_DIR)/define.v
	$(CC) $(FLAGS) -o $(PC_APP) $(PC_DIR)/pc.v $(PC_DIR)/tb_pc.v $(MACROS_DIR)/define.v
	
	vvp $(PC_DIR)/tb_pc
	gtkwave $(PC_DIR)/tb_pc.vcd


clean:
	rm $(PC_DIR)/$(PC_APP) $(PC_DIR)/$(PC_APP).vcd
