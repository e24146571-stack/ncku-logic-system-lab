module CB_Demux_1to4(
    input channel,
    input [1:0] dst_sel,
    output [3:0] dst
);

    wire [1:0] demux0_out;

    Demux_1to2 demux0(
        .channel(channel),
        .dst_sel(dst_sel[1]),
        .dst(demux0_out)
    );

    Demux_1to2 demux1(
        .channel(demux0_out[0]),
        .dst_sel(dst_sel[0]),
        .dst(dst[1:0])
    );

    Demux_1to2 demux2(
        .channel(demux0_out[1]),
        .dst_sel(dst_sel[0]),
        .dst(dst[3:2])
    );

endmodule