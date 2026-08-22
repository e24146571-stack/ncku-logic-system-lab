`timescale 1ns / 1ps

module tb_FA;

    reg A;
    reg B;
    reg Cin;
    wire Cout;
    wire Sum;

    FA fa(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout),
        .Sum(Sum)
    );

    initial begin
        /*
        test 1:
        A = 1
        B = 1
        Cin = 0
        */
        A = 1'b1;
        B = 1'b1;
        Cin = 1'b0;
        #10;
        if (Cout !== 1'b1 || Sum !== 1'b0)
            $display("test 1 failed");
        else
            $display("test 1 passed");

        /*
        test 2:
        A = 1
        B = 0
        Cin = 1
        */
        A = 1'b1;
        B = 1'b0;
        Cin = 1'b1;
        #10;
        if (Cout !== 1'b1 || Sum !== 1'b0)
            $display("test 2 failed");
        else
            $display("test 2 passed");
        
        /*
        test 3:
        A = 1
        B = 0
        Cin = 0
        */
        A = 1'b1;
        B = 1'b0;
        Cin = 1'b0;
        #10;
        if (Cout !== 1'b0 || Sum !== 1'b1)
            $display("test 3 failed");
        else
            $display("test 3 passed");
    end

endmodule