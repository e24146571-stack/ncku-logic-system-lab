module Encoder_9(
    input [9:1] in,
    output reg [3:0] BCD
);

    always @(*) begin
        if (in[9] == 1)
            BCD = 4'd9;
        else if (in[8] == 1)
            BCD = 4'd8;
        else if (in[7] == 1)
            BCD = 4'd7;
        else if (in[6] == 1)
            BCD = 4'd6;
        else if (in[5] == 1)
            BCD = 4'd5;
        else if (in[4] == 1)
            BCD = 4'd4;
        else if (in[3] == 1)
            BCD = 4'd3;
        else if (in[2] == 1)
            BCD = 4'd2;
        else if (in[1] == 1)
            BCD = 4'd1;
        else 
            BCD = 4'd0;
    end

endmodule