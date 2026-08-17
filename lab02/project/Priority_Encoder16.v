module Priority_Encoder16(
    input [15:0] key,
    input priority_mode,
    output reg [3:0] code,
    output raw_valid
);

    assign raw_valid = |key;

    always @(*) begin
        if (!priority_mode) begin
            if (key[15])
                code = 4'd15;
            else if (key[14])
                code = 4'd14;
            else if (key[13])
                code = 4'd13;
            else if (key[12])
                code = 4'd12;
            else if (key[11])
                code = 4'd11;
            else if (key[10])
                code = 4'd10;
            else if (key[9])
                code = 4'd9;
            else if (key[8])
                code = 4'd8;
            else if (key[7])
                code = 4'd7;
            else if (key[6])
                code = 4'd6;
            else if (key[5])
                code = 4'd5;
            else if (key[4])
                code = 4'd4;
            else if (key[3])
                code = 4'd3;
            else if (key[2])
                code = 4'd2;
            else if (key[1])
                code = 4'd1;
            else 
                code = 4'd0;
        end
        else begin
            if (key[0])
                code = 4'd0;
            else if (key[1])
                code = 4'd1;
            else if (key[2])
                code = 4'd2;
            else if (key[3])
                code = 4'd3;
            else if (key[4])
                code = 4'd4;
            else if (key[5])
                code = 4'd5;
            else if (key[6])
                code = 4'd6;
            else if (key[7])
                code = 4'd7;
            else if (key[8])
                code = 4'd8;
            else if (key[9])
                code = 4'd9;
            else if (key[10])
                code = 4'd10;
            else if (key[11])
                code = 4'd11;
            else if (key[12])
                code = 4'd12;
            else if (key[13])
                code = 4'd13;
            else if (key[14])
                code = 4'd14;
            else if (key[15])
                code = 4'd15;
            else 
                code = 4'd0;
        end
    end

endmodule