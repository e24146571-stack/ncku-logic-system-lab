module Decoder_7S(
    input valid, display_mode,
    input [3:0] code,
    output reg [6:0] seg_ones, seg_tens
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
    localparam S7_A = 7'b0001000;
    localparam S7_b = 7'b1100000;
    localparam S7_c = 7'b1110010;
    localparam S7_d = 7'b1000010;
    localparam S7_E = 7'b0110000;
    localparam S7_F = 7'b0111000;
    localparam S7_blank = 7'b1111111;

    always @(*) begin
        if (valid) begin
            if (!display_mode) begin
                seg_tens = S7_blank;
                case (code)
                    4'd0 : 
                        seg_ones = S7_0;
                    4'd1 : 
                        seg_ones = S7_1;
                    4'd2 : 
                        seg_ones = S7_2;
                    4'd3 : 
                        seg_ones = S7_3;
                    4'd4 : 
                        seg_ones = S7_4;
                    4'd5 : 
                        seg_ones = S7_5;
                    4'd6 : 
                        seg_ones = S7_6;
                    4'd7 : 
                        seg_ones = S7_7;
                    4'd8 : 
                        seg_ones = S7_8;
                    4'd9 : 
                        seg_ones = S7_9;
                    4'd10 : 
                        seg_ones = S7_A;
                    4'd11 : 
                        seg_ones = S7_b;
                    4'd12 : 
                        seg_ones = S7_c;
                    4'd13 : 
                        seg_ones = S7_d;
                    4'd14 : 
                        seg_ones = S7_E;
                    default : 
                        seg_ones = S7_F;
                endcase
            end
            else begin
                if (code >= 4'd10) 
                    seg_tens = S7_1;
                else 
                    seg_tens = S7_blank;
                case (code)
                    4'd0, 4'd10 :
                        seg_ones = S7_0;
                    4'd1, 4'd11 :
                        seg_ones = S7_1;
                    4'd2, 4'd12 :
                        seg_ones = S7_2;
                    4'd3, 4'd13 :
                        seg_ones = S7_3;
                    4'd4, 4'd14 :
                        seg_ones = S7_4;
                    4'd5, 4'd15 :
                        seg_ones = S7_5;
                    4'd6 : 
                        seg_ones = S7_6;
                    4'd7 : 
                        seg_ones = S7_7;
                    4'd8 : 
                        seg_ones = S7_8;
                    4'd9 : 
                        seg_ones = S7_9;
                    default :
                        seg_ones = S7_blank;
                endcase
            end
        end
        else begin
            seg_ones = S7_blank;
            seg_tens = S7_blank;
        end
    end

endmodule