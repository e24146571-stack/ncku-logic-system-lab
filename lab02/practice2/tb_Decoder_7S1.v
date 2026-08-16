`timescale 1ns / 1ps

module tb_Decoder_7S1;

    reg [3:0] BCD;
    wire [6:0] out;

    Decoder_7S1 decoder(
        .BCD(BCD),
        .out(out)
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
