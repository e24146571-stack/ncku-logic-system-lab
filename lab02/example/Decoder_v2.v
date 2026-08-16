/*
Output 0-6 7-Segment Display
Using Procedural Block (if - else)
*/

module Decoder_v2(
    input [3:0] BCD,
    output reg [6:0] out
);

    always @(*) begin
        if (BCD == 4'd0)
            out = 7'b0000001;
        else if (BCD == 4'd1)
            out = 7'b1001111;
        else if (BCD == 4'd2)
            out = 7'b0010010;
        else if (BCD == 4'd3)
            out = 7'b0000110;
        else if (BCD == 4'd4)
            out = 7'b1001100;
        else if (BCD == 4'd5)
            out = 7'b0100100;
        else 
            out = 7'b0100000;
    end

endmodule