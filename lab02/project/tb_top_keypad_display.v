`timescale 1ns / 1ps

module tb_top_keypad_display;

    reg [15:0] key;
    reg enable, priority_mode, display_mode;
    wire [3:0] code;
    wire valid;
    wire [6:0] seg_ones, seg_tens;

    top_keypad_display dut(
        .key(key),
        .enable(enable),
        .priority_mode(priority_mode),
        .display_mode(display_mode),
        .code(code),
        .valid(valid),
        .seg_ones(seg_ones),
        .seg_tens(seg_tens)
    );

    integer i;

    initial begin
        /*
        test 1 : key = 0
        -------------
        輸出 : 
        code = 0000
        valid = 0
        seg_ones = 1111111
        seg_tens = 1111111
        */
        key = 16'b0000000000000000;
        enable = 1'b1;
        priority_mode = 1'b0;
        display_mode = 1'b0;
        #10;
        if (code !== 4'd0 || valid !== 1'b0 || seg_ones !== 7'b1111111 || seg_tens !== 7'b1111111)
            $display("test 1 failed");
        else 
            $display("test 1 passed");

        /*
        test 2 : enable = 0
        -------------
        輸出 : 
        code = 0000
        valid = 0
        seg_ones = 1111111
        seg_tens = 1111111
        */
        key = 16'b0000000000000001;
        enable = 1'b0;
        priority_mode = 1'b0;
        display_mode = 1'b0; 
        #10;
        if (code !== 4'd0 || valid !== 1'b0 || seg_ones !== 7'b1111111 || seg_tens !== 7'b1111111)
            $display("test 2 failed");
        else 
            $display("test 2 passed");

        /*
        test 3 : 單一 key input
        key = 0000100000000000 (key[11])
        -------------
        輸出 : 
        code = 1011
        valid = 1
        seg_ones = 1100000
        seg_tens = 1111111
        */
        key = 16'b0000100000000000;
        enable = 1'b1;
        priority_mode = 1'b0;
        display_mode = 1'b0; 
        #10;
        if (code !== 4'b1011 || valid !== 1'b1 || seg_ones !== 7'b1100000 || seg_tens !== 7'b1111111)
            $display("test 3 failed");
        else 
            $display("test 3 passed");

        /*
        test 4 : key[0]
        -------------
        輸出 : 
        code = 0000
        valid = 1
        seg_ones = 0000001
        seg_tens = 1111111
        */
        key = 16'b0000000000000001;
        enable = 1'b1;
        priority_mode = 1'b0;
        display_mode = 1'b0; 
        #10;
        if (code !== 4'b0000 || valid !== 1'b1 || seg_ones !== 7'b0000001 || seg_tens !== 7'b1111111)
            $display("test 4 failed");
        else 
            $display("test 4 passed");

        /*
        test 5 : key[15]
        -------------
        輸出 : 
        code = 1111
        valid = 1
        seg_ones = 0111000
        seg_tens = 1111111
        */
        key = 16'b1000000000000000;
        enable = 1'b1;
        priority_mode = 1'b0;
        display_mode = 1'b0; 
        #10;
        if (code !== 4'b1111 || valid !== 1'b1 || seg_ones !== 7'b0111000 || seg_tens !== 7'b1111111)
            $display("test 5 failed");
        else 
            $display("test 5 passed");

        /*
        test 6 : 多個 key 同時 active
        key = 0010000010010000
        -------------
        輸出 : 
        code = 1101
        valid = 1
        seg_ones = 1000010
        seg_tens = 1111111
        */
        key = 16'b0010000010010000;
        enable = 1'b1;
        priority_mode = 1'b0;
        display_mode = 1'b0; 
        #10;
        if (code !== 4'b1101 || valid !== 1'b1 || seg_ones !== 7'b1000010 || seg_tens !== 7'b1111111)
            $display("test 6 failed");
        else 
            $display("test 6 passed");

        /*
        tset 7 : High-index priority
        key = 0100000010010000
        -------------
        輸出 : 
        code = 1110
        valid = 1
        seg_ones = 0110000
        seg_tens = 1111111
        */
        key = 16'b0100000010010000;
        enable = 1'b1;
        priority_mode = 1'b0;
        display_mode = 1'b0; 
        #10;
        if (code !== 4'b1110 || valid !== 1'b1 || seg_ones !== 7'b0110000 || seg_tens !== 7'b1111111)
            $display("test 7 failed");
        else 
            $display("test 7 passed");

        /*
        test 8 : Low-index priority
        key = 0100000010010000
        -------------
        輸出 : 
        code = 0100
        valid = 1
        seg_ones = 1001100
        seg_tens = 1111111
        */
        key = 16'b0100000010010000;
        enable = 1'b1;
        priority_mode = 1'b1;
        display_mode = 1'b0; 
        #10;
        if (code !== 4'b0100 || valid !== 1'b1 || seg_ones !== 7'b1001100 || seg_tens !== 7'b1111111)
            $display("test 8 failed");
        else 
            $display("test 8 passed");

        /*
        test 9 : HEX mode 的 0 ~ F
        */
        display_mode = 1'b0;
        priority_mode = 1'b0;
        enable = 1'b1;
        for (i = 0; i < 16; i = i + 1) begin
            key = 16'd0;
            key[i] = 1;
            #10;
            if (code !== i[3:0] || valid !== 1'b1)
                $display("(test 9) single key %0d failed", i);
            else
                $display("(test 9) single key %0d passed", i);
        end

        /*
        test 10 : Decimal mode 的 0 ~ 15
        */
        key = 16'd0;
        display_mode = 1'b1;
        for (i = 0; i < 16; i = i + 1) begin
            key = 16'd0;
            key[i] = 1;
            #10;
            if (code !== i[3:0] || valid !== 1'b1)
                $display("(test 10) single key %0d failed", i);
            else
                $display("(test 10) single key %0d passed", i);
        end

        /*
        test 11 : 9 → 10 的 decimal boundary
        */
        display_mode = 1'b1;
        priority_mode = 1'b0;
        enable = 1'b1;
        key = 16'b0000001000000000;
        #10;
        if (code !== 4'b1001 || valid !== 1'b1 || seg_ones !== 7'b0000100 || seg_tens !== 7'b1111111)
            $display("test 11 failed");
        else 
            $display("test 11 passed");
        key = 16'b0000010000000000;
        #10;
        if (code !== 4'b1010 || valid !== 1'b1 || seg_ones !== 7'b0000001 || seg_tens !== 7'b1001111)
            $display("test 12 failed");
        else 
            $display("test 12 passed");

        /*
        test 13 : 15 的 decimal boundary
        */
        display_mode = 1'b1;
        priority_mode = 1'b0;
        enable = 1'b1;
        key = 16'b1000000000000000;
        #10;
        if (code !== 4'b1111 || valid !== 1'b1 || seg_ones !== 7'b0100100 || seg_tens !== 7'b1001111)
            $display("test 13 failed");
        else 
            $display("test 13 passed");
        $finish;
    end

endmodule