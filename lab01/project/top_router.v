module top_router(
    input [7:0] src,
    input [2:0] src_sel,
    input [2:0] dst_sel,
    input enable,
    input invert,
    output channel,
    output [7:0] dst
);

    wire selected_bit;

    Mux_8to1 mux(
        .src(src),
        .src_sel(src_sel),
        .selected_bit(selected_bit)
    );

    Bit_Controller bit_controller(
        .selected_bit(selected_bit),
        .enable(enable),
        .invert(invert),
        .channel(channel)
    );

    Demux_1to8 demux(
        .channel(channel),
        .dst_sel(dst_sel),
        .dst(dst)
    );

endmodule