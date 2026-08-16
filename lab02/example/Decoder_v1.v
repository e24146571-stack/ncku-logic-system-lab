/*
Output 0-6 7-Segment Display
Using assignment
*/

module Decoder_v1(
    input [3:0] BCD,
    output [6:0] out
);

    assign out = (BCD == 4'd0) ? 7'b0000001 :
                 (BCD == 4'd1) ? 7'b1001111 :
                 (BCD == 4'd2) ? 7'b0010010 :
                 (BCD == 4'd3) ? 7'b0000110 :
                 (BCD == 4'd4) ? 7'b1001100 :
                 (BCD == 4'd5) ? 7'b0100100 : 7'b0100000;

endmodule