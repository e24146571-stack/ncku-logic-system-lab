/*
Output 0-6 7-Segment Display
Using Procedural Block (case)
Improve code readability
*/

module Decoder_v3(
    input [3:0] BCD,
    output reg [6:0] out
);

    localparam S7_0 = 7'b0000001;
    localparam S7_1 = 7'b1001111;
    localparam S7_2 = 7'b0010010;
    localparam S7_3 = 7'b0000110;
    localparam S7_4 = 7'b1001100;
    localparam S7_5 = 7'b0100100;
    localparam S7_6 = 7'b0100000;

    always @(*) begin
        case(BCD) 
            4'd0 : 
                out = S7_0;
            4'd1 :
                out = S7_1;
            4'd2 :
                out = S7_2;
            4'd3 :
                out = S7_3;
            4'd4 :
                out = S7_4;
            4'd5 :
                out = S7_5;
            default :
                out = S7_6;
        endcase
    end

endmodule