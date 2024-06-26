CLK_PERIOD := 2.5
PART := xcu280-fsvh2892-2L-e
EXPD := .
WIDTH := 64

all: clean rx tx

clean:
	rm -rf vitis_dummy_kernel
	rm -f vitis_hls*
	rm -f *.xo
	rm -f main.cpp

main.cpp: main_template.cpp
	sed 's/###WIDTH###/$(WIDTH)/g' main_template.cpp >> main.cpp

rx: main.cpp run.tcl
	vitis_hls -f run.tcl $(PART) $(CLK_PERIOD) rx_dummy_kernel . $(WIDTH)
	mv exported.xo rx_dummy_kernel.xo

tx: main.cpp run.tcl
	vitis_hls -f run.tcl $(PART) $(CLK_PERIOD) tx_dummy_kernel . $(WIDTH)
	mv exported.xo tx_dummy_kernel.xo

