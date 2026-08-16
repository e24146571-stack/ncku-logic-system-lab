`timescale 1ns / 1ps

module tb_top_15_2;

    reg [15:1] in;
    wire [3:0] BCD;
    wire [6:0] out_1, out_0;

    top_15_2 dut(
        .in(in),
        .BCD(BCD),
        .out_1(out_1),
        .out_0(out_0)
    );

    initial begin
        in = 15'b000000000000000;
        #10;
        in = 15'b000000010000000;
        #10;
        in = 15'b000100100000000;
        #10;
        in = 15'b100000010000000;
        #10;
        $finish;
    end

endmodule