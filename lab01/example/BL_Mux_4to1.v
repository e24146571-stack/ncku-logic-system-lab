module BL_Mux_4to1(
    input [3:0] src,
    input [1:0] src_sel,
    output channel
);

    assign channel = (src_sel == 2'b00) ? src[0] :
                     (src_sel == 2'b01) ? src[1] :
                     (src_sel == 2'b10) ? src[2] : src[3];

endmodule