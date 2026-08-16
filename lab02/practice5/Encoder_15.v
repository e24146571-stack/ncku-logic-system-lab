module Encoder_15(
    input [15:1] in,
    output reg [3:0] BCD
);

    always @(*) begin
        if (in[15])
            BCD = 4'd15;
        else if (in[14])
            BCD = 4'd14;
        else if (in[13])
            BCD = 4'd13;
        else if (in[12])
            BCD = 4'd12;
        else if (in[11])
            BCD = 4'd11;
        else if (in[10])
            BCD = 4'd10;
        else if (in[9])
            BCD = 4'd9;
        else if (in[8])
            BCD = 4'd8;
        else if (in[7])
            BCD = 4'd7;
        else if (in[6])
            BCD = 4'd6;
        else if (in[5])
            BCD = 4'd5;
        else if (in[4])
            BCD = 4'd4;
        else if (in[3])
            BCD = 4'd3;
        else if (in[2])
            BCD = 4'd2;
        else if (in[1])
            BCD = 4'd1;
        else
            BCD = 4'd0;
    end

endmodule