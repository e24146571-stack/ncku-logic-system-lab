module ALU_8(
    input [7:0] A,
    input [7:0] B,
    input OP,
    output [7:0] Sum,
    output OV
);

    wire [7:0] B_in;
    assign  B_in = B ^ {8{OP}};

    RCA_8 rca_8(
        .A(A),
        .B(B_in),
        .Cin(OP),
        .Cout(),
        .Sum(Sum)
    );

    assign OV = ~A[7] & ~B_in[7] & Sum[7] | A[7] & B_in[7] & ~Sum[7];

endmodule