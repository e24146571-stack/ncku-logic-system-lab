`timescale 1ns / 1ps

module tb_CLA_64;

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
        addition without Cin
        */
        A = 64'd536;
        B = 64'd219;
        Cin = 1'b0;
        #10;
        if (Cout !== 1'b0 || Sum !== 64'd755)
            $display("test 1 failed");
        else
            $display("test 1 passed");
        
        /*
        test 2:
        addition with Cin
        */
        A = 64'd364902;
        B = 64'd9375061;
        Cin = 1'b1;
        #10;
        if (Cout !== 1'b0 || Sum !== 64'd9739964)
            $display("test 2 failed");
        else
            $display("test 2 passed");

        /*
        test 3:
        Cout
        */
        A = 64'd18446744073709551615;
        B = 64'd1;
        Cin = 1'b0;
        #10;
        if (Cout !== 1'b1 || Sum !== 64'd0)
            $display("test 3 failed");
        else
            $display("test 3 passed");
        $finish;
    end

endmodule