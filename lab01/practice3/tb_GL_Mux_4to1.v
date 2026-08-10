`timescale 1ns / 1ps

module tb_GL_Mux_4to1;

    reg [3:0] src;
    reg [1:0] src_sel;
    wire channel;

    GL_Mux_4to1 dut(
        .src(src),
        .src_sel(src_sel),
        .channel(channel)
    );

    initial begin
        src = 4'b1010;
        src_sel = 2'b00;
        #10;
        src_sel = 2'b01;
        #10;
        src_sel = 2'b10;
        #10;
        src_sel = 2'b11;
        #10;
        src = 4'b0001;
        src_sel = 2'b00;
        #10;
        src_sel = 2'b01;
        #10;
        src_sel = 2'b10;
        #10;
        src_sel = 2'b11;
        #10;
        $finish;
    end

endmodule