`timescale 1ns / 1ps

module tb_top_4;

    reg [3:0] src;
    reg [1:0] src_sel;
    reg [1:0] dst_sel;
    wire [3:0] dst;
    wire channel;

    top_4 dut(
        .src(src),
        .src_sel(src_sel),
        .dst_sel(dst_sel),
        .dst(dst),
        .channel(channel)
    );

    initial begin
        /*
        dst = 1000
        channel = 1
        */
        src = 4'b0010;
        src_sel = 2'b01;
        dst_sel = 2'b11; 
        #10;
        
        /*
        dst - 0100
        channel = 1
        */
        dst_sel = 2'b10;
        #10;
        
        /*
        dst = 0010
        channel = 1
        */
        dst_sel = 2'b01;
        #10;
        
        /*
        dst = 0001
        channel = 1
        */
        dst_sel = 2'b00;
        #10;
        
        /*
        dst = 0000
        channel = 0
        */
        src_sel = 2'b00;
        #10;
        
        /*
        dst = 0000
        channel = 0
        */
        src_sel = 2'b10;
        #10;
        
        /*
        channel = 1
        dst = 0001
        */
        src = 4'b0100;
        #10;
        $finish;
    end

endmodule