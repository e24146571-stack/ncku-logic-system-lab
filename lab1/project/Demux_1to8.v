module Demux_1to8(
    input channel,
    input [2:0] dst_sel,
    output [7:0] dst
);

    assign dst[0] = channel & ~dst_sel[2] & ~dst_sel[1] & ~dst_sel[0];
    assign dst[1] = channel & ~dst_sel[2] & ~dst_sel[1] & dst_sel[0];
    assign dst[2] = channel & ~dst_sel[2] & dst_sel[1] & ~dst_sel[0];
    assign dst[3] = channel & ~dst_sel[2] & dst_sel[1] & dst_sel[0];
    assign dst[4] = channel & dst_sel[2] & ~dst_sel[1] & ~dst_sel[0];
    assign dst[5] = channel & dst_sel[2] & ~dst_sel[1] & dst_sel[0];
    assign dst[6] = channel & dst_sel[2] & dst_sel[1] & ~dst_sel[0];
    assign dst[7] = channel & dst_sel[2] & dst_sel[1] & dst_sel[0];

endmodule