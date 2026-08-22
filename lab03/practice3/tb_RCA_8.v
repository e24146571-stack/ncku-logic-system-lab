`timescale 1ns / 1ps

module tb_RCA_8;

    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    wire Cout;
    wire [7:0] Sum;

    RCA_8 dut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout),
        .Sum(Sum)
    );

    initial begin
        /*
        test 1:
        A = 1010101
        B = 0101010
        Cin = 0
        */
        A = 8'b10101010;
        B = 8'b01010101;
        Cin = 1'b0;
        #10;
        if (Cout !== 1'b0 || Sum !== 8'b11111111)
            $display("test 1 failed");
        else 
            $display("test 1 passed");

        /*
        test 2:
        A = 1010101
        B = 0101010
        Cin = 1
        */
        A = 8'b10101010;
        B = 8'b01010101;
        Cin = 1'b1;
        #10;
        if (Cout !== 1'b1 || Sum !== 8'b00000000)
            $display("test 2 failed");
        else 
            $display("test 2 passed");
        $finish;
    end

endmodule