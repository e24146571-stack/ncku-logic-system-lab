`timescale 1ns / 1ps

module tb_RCA_8;

    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    wire Cout;
    wire [7:0] Sum;

    RCA_8 rca_8(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout),
        .Sum(Sum)
    );

    initial begin
        /*
        test 1 : without Cin
        A = 10010110
        B = 00111000
        Cin = 0
        */
        A = 8'b10010110;
        B = 8'b00111000;
        Cin = 1'b0;
        #10;
        if (Sum !== 8'b11001110 || Cout !== 1'b0)
            $display("test 1 failed");
        else
            $display("test 1 passed");
        
        /*
        test 2 : with Cin
        A = 10010110
        B = 00111001
        Cin = 1
        */
        A = 8'b10010110;
        B = 8'b00111001;
        Cin = 1'b1;
        #10;
        if (Sum !== 8'b11010000 || Cout !== 1'b0)
            $display("test 2 failed");
        else
            $display("test 2 passed");

        /*
        test 3 : 0+0
        A = 00000000
        B = 00000000
        Cin = 0
        */
        A = 8'b00000000;
        B = 8'b00000000;
        Cin = 1'b0;
        #10;
        if (Sum !== 8'b00000000 || Cout !== 1'b0)
            $display("test 3 failed");
        else
            $display("test 3 passed");

        /*
        test 4 : 全1 + 1
        A = 11111111
        B = 00000001
        Cin = 0
        */
        A = 8'b11111111;
        B = 8'b00000001;
        Cin = 1'b0;
        #10;
        if (Sum !== 8'b00000000 || Cout !== 1'b1)
            $display("test 4 failed");
        else
            $display("test 4 passed");

        $finish;
    end
    
endmodule