`timescale 1ns / 1ps

module tb_Encoder_15;

    reg [15:1] in;
    wire [3:0] BCD;

    Encoder_15 encoder(
        .in(in),
        .BCD(BCD)
    );

    initial begin
        in = 15'b000000000000000;
        #10;
        in = 15'b000000010000000;
        #10;
        in = 15'b000100001000001;
        #10;
        in = 15'b100000000000001;
        #10;
        $finish;
    end

endmodule