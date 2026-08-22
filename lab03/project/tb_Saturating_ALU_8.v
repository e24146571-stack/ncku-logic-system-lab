`timescale 1ns / 1ps

module tb_Saturating_ALU_8;

    reg [7:0] A;
    reg [7:0] B;
    reg OP;
    reg sat_enable;
    wire [7:0] result;
    wire overflow;
    wire saturated;
    wire zero;
    wire negative;

    Saturating_ALU_8 dut(
        .A(A),
        .B(B),
        .OP(OP),
        .sat_enable(sat_enable),
        .result(result),
        .overflow(overflow),
        .saturated(saturated),
        .zero(zero),
        .negative(negative)
    );

    initial begin
        /*
        test 1-1: Addition (Normal) (+) + (+)
        A = 00000010
        B = 00000010
        OP = 0
        sat_enable = 0
        */
        A = 8'b01010101;
        B = 8'b00101010;
        OP = 1'b0;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b01111111 || overflow !== 1'b0 || saturated !== 1'b0 || zero !== 1'b0 || negative !== 1'b0)
            $display("test 1-1 failed");
        else 
            $display("test 1-1 passed");
        
        /*
        test 1-2: Addition (Normal) (-) + (-)
        A = 11111111
        B = 10000001
        OP = 0
        sat_enable = 0
        */
        A = 8'b11111111;
        B = 8'b10000001;
        OP = 1'b0;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b10000000 || overflow !== 1'b0 || saturated !== 1'b0 || zero !== 1'b0 || negative !== 1'b1)
            $display("test 1-2 failed");
        else 
            $display("test 1-2 passed");

        /*
        test 1-3: Addition (Normal) (+) + (-)
        A = 00000001
        B = 11111111
        OP = 0
        sat_enable = 0
        */
        A = 8'b00000001;
        B = 8'b11111111;
        OP = 1'b0;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b00000000 || overflow !== 1'b0 || saturated !== 1'b0 || zero !== 1'b1 || negative !== 1'b0)
            $display("test 1-3 failed");
        else 
            $display("test 1-3 passed");

        /*
        test 2-1: Addition (positive overflow)
        A = 00000001
        B = 01111111
        OP = 0
        sat_enable = 0
        */
        A = 8'b00000001;
        B = 8'b01111111;
        OP = 1'b0;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b10000000 || overflow !== 1'b1 || saturated !== 1'b0 || zero !== 1'b0 || negative !== 1'b1)
            $display("test 2-1 failed");
        else 
            $display("test 2-1 passed");

        /*
        test 2-2: Addition (positive overflow, sat)
        A = 00000001
        B = 01111111
        OP = 0
        sat_enable = 1
        */
        A = 8'b00000001;
        B = 8'b01111111;
        OP = 1'b0;
        sat_enable = 1'b1;
        #10;
        if (result !== 8'b01111111 || overflow !== 1'b1 || saturated !== 1'b1 || zero !== 1'b0 || negative !== 1'b0)
            $display("test 2-2 failed");
        else 
            $display("test 2-2 passed");

        /*
        test 2-3: Addition (negative overflow)
        A = 10000000
        B = 11111111
        OP = 0
        sat_enable = 0
        */
        A = 8'b10000000;
        B = 8'b11111111;
        OP = 1'b0;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b01111111 || overflow !== 1'b1 || saturated !== 1'b0 || zero !== 1'b0 || negative !== 1'b0)
            $display("test 2-3 failed");
        else 
            $display("test 2-3 passed");

        /*
        test 2-4: Addition (negative overflow, sat)
        A = 10000000
        B = 11111111
        OP = 0
        sat_enable = 1
        */
        A = 8'b10000000;
        B = 8'b11111111;
        OP = 1'b0;
        sat_enable = 1'b1;
        #10;
        if (result !== 8'b10000000 || overflow !== 1'b1 || saturated !== 1'b1 || zero !== 1'b0 || negative !== 1'b1)
            $display("test 2-4 failed");
        else 
            $display("test 2-4 passed");

        /*
        test 3-1: Subtraction (Normal) (+) - (+)
        A = 01111111
        B = 01111111
        OP = 1
        sat_enable = 0
        */
        A = 8'b01111111;
        B = 8'b01111111;
        OP = 1'b1;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b00000000 || overflow !== 1'b0 || saturated !== 1'b0 || zero !== 1'b1 || negative !== 1'b0)
            $display("test 3-1 failed");
        else 
            $display("test 3-1 passed");

        /*
        test 3-2: Subtraction (Normal) (+) - (-)
        A = 00000001
        B = 11111111
        OP = 1
        sat_enable = 0
        */
        A = 8'b00000001;
        B = 8'b11111111;
        OP = 1'b1;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b00000010 || overflow !== 1'b0 || saturated !== 1'b0 || zero !== 1'b0 || negative !== 1'b0)
            $display("test 3-2 failed");
        else 
            $display("test 3-2 passed");

        /*
        test 3-3: Subtraction (Normal) (-) - (-)
        A = 10000000
        B = 11111111
        OP = 1
        sat_enable = 0
        */
        A = 8'b10000000;
        B = 8'b11111111;
        OP = 1'b1;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b10000001 || overflow !== 1'b0 || saturated !== 1'b0 || zero !== 1'b0 || negative !== 1'b1)
            $display("test 3-3 failed");
        else 
            $display("test 3-3 passed");

        /*
        test 4-1: Subtraction (positive overflow)
        A = 01111111
        B = 11111111
        OP = 1
        sat_enable = 0
        */
        A = 8'b01111111;
        B = 8'b11111111;
        OP = 1'b1;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b10000000 || overflow !== 1'b1 || saturated !== 1'b0 || zero !== 1'b0 || negative !== 1'b1)
            $display("test 4-1 failed");
        else 
            $display("test 4-1 passed");

        /*
        test 4-2: Subtraction (positive overflow, sat)
        A = 01111111
        B = 11111111
        OP = 1
        sat_enable = 1
        */
        A = 8'b01111111;
        B = 8'b11111111;
        OP = 1'b1;
        sat_enable = 1'b1;
        #10;
        if (result !== 8'b01111111 || overflow !== 1'b1 || saturated !== 1'b1 || zero !== 1'b0 || negative !== 1'b0)
            $display("test 4-2 failed");
        else 
            $display("test 4-2 passed");

        /*
        test 4-3: Subtraction (negative overflow)
        A = 10000000
        B = 00000001
        OP = 1
        sat_enable = 0
        */
        A = 8'b10000000;
        B = 8'b00000001;
        OP = 1'b1;
        sat_enable = 1'b0;
        #10;
        if (result !== 8'b01111111 || overflow !== 1'b1 || saturated !== 1'b0 || zero !== 1'b0 || negative !== 1'b0)
            $display("test 4-3 failed");
        else 
            $display("test 4-3 passed");

        /*
        test 4-4: Subtraction (negative overflow, sat)
        A = 10000000
        B = 00000001
        OP = 1
        sat_enable = 1
        */
        A = 8'b10000000;
        B = 8'b00000001;
        OP = 1'b1;
        sat_enable = 1'b1;
        #10;
        if (result !== 8'b10000000 || overflow !== 1'b1 || saturated !== 1'b1 || zero !== 1'b0 || negative !== 1'b1)
            $display("test 4-4 failed");
        else 
            $display("test 4-4 passed");

        $finish;
    end


endmodule