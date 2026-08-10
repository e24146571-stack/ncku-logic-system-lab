module Demux_1to2(
    input channel, dst_sel,
    output [1:0] dst
);

    assign dst[0] = channel & ~dst_sel;
    assign dst[1] = channel & dst_sel;

endmodule