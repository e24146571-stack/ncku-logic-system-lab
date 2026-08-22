module Adder_8_OV(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] Sum,
    output OV
);

    RCA_8 rca_8(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(),
        .Sum(Sum)
    );

    assign OV = ~A[7] & ~B[7] & Sum[7] | A[7] & B[7] & ~Sum[7];

endmodule