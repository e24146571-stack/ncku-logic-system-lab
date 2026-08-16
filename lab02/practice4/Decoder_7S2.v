module Decoder_7S2(
    input [3:0] BCD,
    output [6:0] out_1,
    output reg [6:0] out_0
);

    localparam S7_0 = 7'b0000001;
    localparam S7_1 = 7'b1001111;
    localparam S7_2 = 7'b0010010;
    localparam S7_3 = 7'b0000110;
    localparam S7_4 = 7'b1001100;
    localparam S7_5 = 7'b0100100;
    localparam S7_6 = 7'b0100000;
    localparam S7_7 = 7'b0001111;
    localparam S7_8 = 7'b0000000;
    localparam S7_9 = 7'b0000100;

    assign out_1 = (BCD < 4'd10) ? S7_0 : S7_1;

    always @(*) begin
        if (BCD == 4'd0 || BCD == 4'd10)
            out_0 = S7_0;
        else if (BCD == 4'd1 || BCD == 4'd11)
            out_0 = S7_1;
        else if (BCD == 4'd2 || BCD == 4'd12)
            out_0 = S7_2;
        else if (BCD == 4'd3 || BCD == 4'd13)
            out_0 = S7_3;
        else if (BCD == 4'd4 || BCD == 4'd14)
            out_0 = S7_4;
        else if (BCD == 4'd5 || BCD == 4'd15)
            out_0 = S7_5;
        else if (BCD == 4'd6)
            out_0 = S7_6;
        else if (BCD == 4'd7)
            out_0 = S7_7;
        else if (BCD == 4'd8)
            out_0 = S7_8;
        else 
            out_0 = S7_9;
    end

endmodule