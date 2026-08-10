module CB_Mux_4to1(
    input [3:0] src,
    input [1:0] src_sel,
    output channel
);

    wire g0, g1;

    BL_Mux_2to1 mux1(
        .src_0(src[0]),
        .src_1(src[1]),
        .src_sel(src_sel[0]),
        .channel(g0)
    );

    BL_Mux_2to1 mux2(
        .src_0(src[2]),
        .src_1(src[3]),
        .src_sel(src_sel[0]),
        .channel(g1)
    );

    BL_Mux_2to1 mux3(
        .src_0(g0),
        .src_1(g1),
        .src_sel(src_sel[1]),
        .channel(channel)
    );

endmodule