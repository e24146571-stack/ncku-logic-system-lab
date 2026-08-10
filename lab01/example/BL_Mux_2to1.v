module BL_Mux_2to1(
    input src_0, src_1,
    input src_sel,
    output channel
);

    assign channel = (src_sel == 1'b0) ? src_0 : src_1;

endmodule