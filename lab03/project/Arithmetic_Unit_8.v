module Arithmetic_Unit_8(
    input [7:0] A,
    input [7:0] B,
    input OP,
    output [7:0] raw_result,
    output overflow
);

    wire [7:0] B_in;
    assign B_in = B ^ {8{OP}};

    assign raw_result = A + B_in + OP;
    assign overflow = ~A[7] & ~B_in[7] & raw_result[7] | A[7] & B_in[7] & ~raw_result[7];

endmodule