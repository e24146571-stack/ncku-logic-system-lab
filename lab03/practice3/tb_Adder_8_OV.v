`timescale 1ns / 1ps

module tb_Adder_8_OV;

    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    wire [7:0] Sum;
    wire OV;

    Adder_8_OV adder_8_ov(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .OV(OV)
    );

    initial begin
        /*
        test 1: addition without overflow (opposite signs)
        */
        A = 8'b10101010;
        B = 8'b01010101;
        Cin = 1'b0;
        #10;
        if (OV !== 1'b0 || Sum !== 8'b11111111)
            $display("test 1 failed");
        else 
            $display("test 1 passed");
        
        /*
        test 2: addition with overflow (two negative -> positive)
        */
        A = 8'b10101010;
        B = 8'b10000000;
        Cin = 1'b0;
        #10;
        if (OV !== 1'b1 || Sum !== 8'b00101010)
            $display("test 2 failed");
        else 
            $display("test 2 passed");

        /*
        test 3: addition without overflow (same signs)
        */
        A = 8'b00000001;
        B = 8'b00000001;
        Cin = 1'b0;
        #10;
        if (OV !== 1'b0 || Sum !== 8'b00000010)
            $display("test 3 failed");
        else 
            $display("test 3 passed");

        /*
        test 4: addition with overflow (two positive -> negative)
        */
        A = 8'b01111111;
        B = 8'b00000001;
        Cin = 1'b0;
        #10;
        if (OV !== 1'b1 || Sum !== 8'b10000000)
            $display("test 4 failed");
        else 
            $display("test 4 passed");
        $finish;
    end

endmodule