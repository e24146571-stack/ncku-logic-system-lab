`timescale 1ns / 1ps

module tb_Encoder_9;

    reg [9:1] in;
    wire [3:0] BCD;

    Encoder_9 encoder(
        .in(in),
        .BCD(BCD)
    );

    initial begin
        in = 9'b000000000;
        #10;
        in = 9'b000001000;
        #10;
        in = 9'b100010010;
        #10;
        in = 9'b000010010;
        #10;
        $finish;
    end

endmodule