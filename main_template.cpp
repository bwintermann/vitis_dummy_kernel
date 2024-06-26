#include "ap_axi_sdata.h"
#include "hls_stream.h"

typedef ap_axiu<###WIDTH###, 0, 0, 0> stream_type;

void tx_dummy_kernel(hls::stream< stream_type > &A) {
#pragma HLS INTERFACE mode=axis port=A
    stream_type tmp;
    tmp.data = 1;
    while (true) {
    	A.write(tmp);
    }
}

void rx_dummy_kernel(hls::stream< stream_type > &A) {
#pragma HLS INTERFACE mode=axis port=A
    stream_type tmp;
    while (true) {
    	A.read(tmp);
    }
}

