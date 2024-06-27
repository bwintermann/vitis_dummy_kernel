# vitis_dummy_kernel
A dummy kernel to send / receive an AXI stream to close open ends of duplex kernels in vitis.

## Usage
Just call `make` to produce both RX and TX kernels. Parameters can be tweaked in the makefile. If the status of tready and tvalid is relevant to you, best check the generated verilog/vhdl for yourself as well. 

Example to produce a dummy kernel _receiving_ data from an AXI Stream with width of 64 bytes on a U280 FPGA with a target of 400MHz clock frequency:
```
make rx WIDTH=64 PART=xcu280-fsvh2892-2L-e CLK_PERIOD=2.5 
```

Can afterwards be connected via a `stream_connect` order in the v++ linker config file:
```
nk=rx_dummy_kernel:1:rx_dummy_kernel_1
stream_connect=my_kernel.out:rx_dummy_kernel_1.A
```
