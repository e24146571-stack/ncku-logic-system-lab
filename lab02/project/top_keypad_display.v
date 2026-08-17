module top_keypad_display(
    input [15:0] key,
    input enable, priority_mode, display_mode,
    output [3:0] code,
    output valid,
    output [6:0] seg_tens, seg_ones
);

    wire raw_valid;
    wire [3:0] raw_code;

    Priority_Encoder16 encoder(
        .key(key),
        .priority_mode(priority_mode),
        .code(raw_code),
        .raw_valid(raw_valid)
    );

    assign code = enable ? raw_code : 4'd0;
    assign valid = enable ? raw_valid : 1'b0;

    Decoder_7S decoder(
        .valid(valid),
        .display_mode(display_mode),
        .code(code),
        .seg_ones(seg_ones),
        .seg_tens(seg_tens)
    );

endmodule