module top_15_2(
    input [15:1] in,
    output [3:0] BCD,
    output [6:0] out_1, out_0
);

    Encoder_15 encoder(
        .in(in),
        .BCD(BCD)
    );

    Decoder_7S2 decoder(
        .BCD(BCD),
        .out_1(out_1),
        .out_0(out_0)
    );

endmodule