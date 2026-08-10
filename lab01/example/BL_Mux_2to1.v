module BL_Mux_2to1(
    input [1:0] src,
    input src_sel,
    output channel
);

    assign channel = (src_sel == 1'b0) ? src[0] : src[1];

endmodule