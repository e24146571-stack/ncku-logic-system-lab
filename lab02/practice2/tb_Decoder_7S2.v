`timescale 1ns / 1ps

module tb_Decoder_7S2;

    reg [3:0] BCD;
    wire [6:0] out_1, out_0;

    Decoder_7S2 decoder(
        .BCD(BCD),
        .out_0(out_0),
        .out_1(out_1)
    );

    integer i;

    initial begin 
        for (i = 0; i < 16; i = i + 1) begin
            BCD = i;
            #10;
        end
        $finish;
    end

endmodule