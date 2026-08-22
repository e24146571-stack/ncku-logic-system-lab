`timescale 1ns / 1ps

module tb_CLA_64_q3_2;

    reg [63:0] A;
    reg [63:0] B;
    reg Cin;
    wire Cout;
    wire [63:0] Sum;

    CLA_64 dut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout),
        .Sum(Sum)
    );

    initial begin
        /*
        test 1:
        A = FFFFFFFFFFFFFFFF
        B = 0
        Cin = 1
        */
        A = 64'hFFFFFFFFFFFFFFFF;
        B = 64'd0;
        Cin = 1'b1;
        #10;
        $finish;
    end

endmodule