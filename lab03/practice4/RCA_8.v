module RCA_8(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output Cout,
    output [7:0] Sum
);

    wire [7:1] C;

    FA fa0(
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Cout(C[1]),
        .Sum(Sum[0])
    );

    FA fa1(
        .A(A[1]),
        .B(B[1]),
        .Cin(C[1]),
        .Cout(C[2]),
        .Sum(Sum[1])
    );

    FA fa2(
        .A(A[2]),
        .B(B[2]),
        .Cin(C[2]),
        .Cout(C[3]),
        .Sum(Sum[2])
    );

    FA fa3(
        .A(A[3]),
        .B(B[3]),
        .Cin(C[3]),
        .Cout(C[4]),
        .Sum(Sum[3])
    );

    FA fa4(
        .A(A[4]),
        .B(B[4]),
        .Cin(C[4]),
        .Cout(C[5]),
        .Sum(Sum[4])
    );

    FA fa5(
        .A(A[5]),
        .B(B[5]),
        .Cin(C[5]),
        .Cout(C[6]),
        .Sum(Sum[5])
    );

    FA fa6(
        .A(A[6]),
        .B(B[6]),
        .Cin(C[6]),
        .Cout(C[7]),
        .Sum(Sum[6])
    );

    FA fa7(
        .A(A[7]),
        .B(B[7]),
        .Cin(C[7]),
        .Cout(Cout),
        .Sum(Sum[7])
    );

endmodule