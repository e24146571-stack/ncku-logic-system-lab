module top_8(
    input [7:0] src,
    input [2:0] src_sel,
    input [2:0] dst_sel,
    output [7:0] dst,
    output channel
);

    BL_Mux_8to1 mux(
        .src(src),
        .src_sel(src_sel),
        .channel(channel)
    );

    BL_Demux_1to8 demux(
        .channel(channel),
        .dst_sel(dst_sel),
        .dst(dst)
    );

endmodule