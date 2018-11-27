CC = iverilog 
FLAGS = -Wall -Winfloop

MACROS_DIR = ../macros
PIPELINE_APP = tb_if_id
PIPELINE_DIR = ./
PC_DIR = ../PC


all: 	$(PIPELINE_DIR)/tb_if_id.v \
	$(PIPELINE_DIR)/if_id.v \
	$(PIPELINE_DIR)/InstMem_controller.v \
	$(PC_DIR)/pc.v \
	$(MACROS_DIR)/define.v

	$(CC) $(FLAGS) -o $(PIPELINE_APP) $(PIPELINE_DIR)/tb_if_id.v \
					  $(PIPELINE_DIR)/if_id.v \
					  $(PIPELINE_DIR)/InstMem_controller.v \
					  $(PC_DIR)/pc.v \
					  $(MACROS_DIR)/define.v
	
	vvp $(PIPELINE_DIR)/$(PIPELINE_APP)
	gtkwave $(PIPELINE_DIR)/$(PIPELINE_APP).vcd


clean:
	rm $(PIPELINE_DIR)/$(PIPELINE_APP) $(PIPELINE_DIR)/$(PIPELINE_APP).vcd
