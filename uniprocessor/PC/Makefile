MACROS_DIR = ../macros
PC_DIR = .

SIMPRG   = vcs -full64 -v2005
SIM_FILE = tb_pc
SOURCES  = $(PC_DIR)/pc.v $(PC_DIR)/tb_pc.v $(MACROS_DIR)/define.v


all:
	$(SIMPRG) $(SOURCES) -o $(SIM_FILE)

run:
	./${SIM_FILE}

clean:
	rm -rf $(SIM_FILE) $(SIM_FILE).daidir csrc ucli.key
