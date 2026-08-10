module GL_Mux_4to1(
    input [3:0] src,
    input [1:0] src_sel,
    output channel
);

    wire [1:0] src_sel_n;
    wire [3:0] g_0;
    wire [1:0] ch_0;
    wire [1:0] g_1;

    not(src_sel_n[0], src_sel[0]);
    not(src_sel_n[1], src_sel[1]);
    and(g_0[0], src[0], src_sel_n[0]);
    and(g_0[1], src[1], src_sel[0]);
    and(g_0[2], src[2], src_sel_n[0]);
    and(g_0[3], src[3], src_sel[0]);
    or(ch_0[0], g_0[0], g_0[1]);
    or(ch_0[1], g_0[2], g_0[3]);
    and(g_1[0], ch_0[0], src_sel_n[1]);
    and(g_1[1], ch_0[1], src_sel[1]);
    or(channel, g_1[0], g_1[1]);

endmodule