# vitis_dummy_kernel
A dummy kernel to send / receive an AXI stream to close open ends of duplex kernels in vitis.

## Usage
Just call `make`. Parameters can be tweaked in the makefile. If the status of tready and tvalid is relevant to you, best check the generated verilog/vhdl for yourself as well. 

Can afterwards be connected via a `stream_connect` order in the v++ linker config file:
```
stream_connect=my_kernel.out:rx_dummy_kernel.A
```
