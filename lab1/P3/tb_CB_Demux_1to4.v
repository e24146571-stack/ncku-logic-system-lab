`timescale 1ns / 1ps

module tb_CB_Demux_1to4;

    reg channel;
    reg [1:0] dst_sel;
    wire [3:0] dst;

    CB_Demux_1to4 dut(
        .channel(channel),
        .dst_sel(dst_sel),
        .dst(dst)
    );

    initial begin
        channel = 1'b1;
        dst_sel = 2'b00;
        #10;
        dst_sel = 2'b01;
        #10;
        dst_sel = 2'b10;
        #10;
        dst_sel = 2'b11;
        #10;
        $finish;
    end

endmodule