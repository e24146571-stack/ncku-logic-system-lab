`timescale 1ns / 1ps

module tb_CLA_4;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire PG, GG;

    CLA_4 dut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .PG(PG),
        .GG(GG)
    );

    initial begin
        /*
        test 1:
        A = 1010
        B = 0101
        Cin = 1
        */
        A = 4'b1010;
        B = 4'b0101;
        Cin = 1'b1;
        #10;

        /*
        test 2:
        A = 0011
        B = 1110
        Cin = 0
        */
        A = 4'b0011;
        B = 4'b1110;
        Cin = 1'b0;
        #10;
        $finish;
    end

endmodule