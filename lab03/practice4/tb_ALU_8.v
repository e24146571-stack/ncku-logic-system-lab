`timescale 1ns / 1ps

module tb_ALU_8;

    reg [7:0] A;
    reg [7:0] B;
    reg OP;
    wire OV;
    wire [7:0] Sum;

    ALU_8 dut(
        .A(A),
        .B(B),
        .OP(OP),
        .Sum(Sum),
        .OV(OV)
    );

    initial begin
        /*
        test 1: addition without overflow
        A = 00000001
        B = 00000001
        OP = 0
        */
        A = 8'b00000001;
        B = 8'b00000001;
        OP = 1'b0;
        #10;
        if (Sum !== 8'b00000010 || OV !== 1'b0)
            $display("test 1 failed");
        else
            $display("test 1 passed");

        /*
        test 2: addition with overflow
        A = 01111111
        B = 00000001
        OP = 0
        */
        A = 8'b01111111;
        B = 8'b00000001;
        OP = 1'b0;
        #10;
        if (Sum !== 8'b10000000 || OV !== 1'b1)
            $display("test 2 failed");
        else
            $display("test 2 passed");

        /*
        test 3: subtraction without overflow
        A = 01111111
        B = 00000001
        OP = 1
        */
        A = 8'b01111111;
        B = 8'b00000001;
        OP = 1'b1;
        #10;
        if (Sum !== 8'b01111110 || OV !== 1'b0)
            $display("test 3 failed");
        else
            $display("test 3 passed");
        
        /*
        test 3: subtraction with overflow
        A = 10000000
        B = 00000001
        OP = 1
        */
        A = 8'b10000000;
        B = 8'b00000001;
        OP = 1'b1;
        #10;
        if (Sum !== 8'b01111111 || OV !== 1'b1)
            $display("test 4 failed");
        else
            $display("test 4 passed");
        
        $finish;
    end

endmodule