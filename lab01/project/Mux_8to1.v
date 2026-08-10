module Mux_8to1(
    input [7:0] src,
    input [2:0] src_sel,
    output selected_bit
);

    assign selected_bit = (src_sel == 3'b000) ? src[0] :
                          (src_sel == 3'b001) ? src[1] :
                          (src_sel == 3'b010) ? src[2] :
                          (src_sel == 3'b011) ? src[3] :
                          (src_sel == 3'b100) ? src[4] :
                          (src_sel == 3'b101) ? src[5] :
                          (src_sel == 3'b110) ? src[6] : src[7];
    
endmodule