module GL_Mux_2to1(
    input src_0, src_1,
    input src_sel,
    output channel
);

    wire f_src_0;
    wire f_src_1;
    wire src_sel_n;

    not(src_sel_n, src_sel);
    and(f_src_0, src_sel_n, src_0);
    and(f_src_1, src_sel, src_1);
    or(channel, f_src_0, f_src_1);

endmodule