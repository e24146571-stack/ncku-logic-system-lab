`timescale 1ns / 1ps

module tb_top_router;

    reg [7:0] src;
    reg [2:0] src_sel;
    reg [2:0] dst_sel;
    reg enable;
    reg invert;
    wire channel;
    wire [7:0] dst;

    top_router dut(
        .src(src),
        .src_sel(src_sel),
        .dst_sel(dst_sel),
        .enable(enable),
        .invert(invert),
        .channel(channel),
        .dst(dst)
    );

    initial begin
        /*
        channel = 1
        dst = 00000001
        */
        src = 8'b00000001;
        src_sel = 3'b000;
        dst_sel = 3'b000;
        enable = 1'b1;
        invert = 1'b0;
        #10;
        

        /*
        channel = 1
        dst = 10000000
        */
        dst_sel = 3'b111;
        #10;


        /*
        channel = 0
        dst = 00000000
        */
        enable = 1'b0;
        #10;


        /*
        channel = 0
        dst = 00000000
        */
        enable = 1'b1;
        src = 8'b10000000;
        #10;


        /*
        channel = 1
        dst = 10000000
        */
        invert = 1'b1;
        #10;


        /*
        channel = 1
        dst = 10000000
        */
        invert = 1'b0;
        src_sel = 3'b111;
        #10;
        $finish;

    end

endmodule