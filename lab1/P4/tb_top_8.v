`timescale 1ns / 1ps

module tb_top_8;

    reg [7:0] src;
    reg [2:0] src_sel;
    reg [2:0] dst_sel;
    wire channel;
    wire [7:0] dst;

    top_8 dut(
        .src(src),
        .src_sel(src_sel),
        .dst_sel(dst_sel),
        .dst(dst),
        .channel(channel)
    );

    initial begin 
        src = 8'b00010000;
        src_sel = 3'b100;
        dst_sel = 3'b000;
        #10;

        dst_sel = 3'b001;
        #10;

        dst_sel = 3'b010;
        #10;

        src_sel = 3'b001;
        #10;

        src = 8'b00000010;
        #10;

        $finish;
    end

endmodule
