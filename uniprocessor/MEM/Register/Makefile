CC = iverilog 
FLAGS = -Wall -Winfloop

MACROS_DIR = ../../macros
REG_FILE_APP = tb_RegFile
REG_FILE_DIR = .

all: 	$(REG_FILE_DIR)/RegFile.v \
 	$(REG_FILE_DIR)/tb_RegFile.v \
	$(MACROS_DIR)/define.v

	$(CC) $(FLAGS) -o $(REG_FILE_APP) $(REG_FILE_DIR)/RegFile.v \
			  $(REG_FILE_DIR)/tb_RegFile.v \
			  $(MACROS_DIR)/define.v
	
	vvp $(REG_FILE_DIR)/$(REG_FILE_APP)
	gtkwave $(REG_FILE_DIR)/$(REG_FILE_APP).vcd


clean:
	rm $(REG_FILE_DIR)/$(REG_FILE_APP) $(REG_FILE_DIR)/$(REG_FILE_APP).vcd
