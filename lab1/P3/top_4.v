module top_4(
    input [3:0] src,
    input [1:0] src_sel,
    input [1:0] dst_sel,
    output [3:0] dst,
    output channel
);

    GL_Mux_4to1 mux(
        .src(src),
        .src_sel(src_sel),
        .channel(channel)
    );

    CB_Demux_1to4 demux(
        .channel(channel),
        .dst_sel(dst_sel),
        .dst(dst)
    );

endmodule