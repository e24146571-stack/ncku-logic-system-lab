module RCA_4(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output Cout,
    output [3:0] Sum
);  

    wire [2:0] C;

    FA fa1(
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Cout(C[0]),
        .Sum(Sum[0])
    );

    FA fa2(
        .A(A[1]),
        .B(B[1]),
        .Cin(C[0]),
        .Cout(C[1]),
        .Sum(Sum[1])
    );

    FA fa3(
        .A(A[2]),
        .B(B[2]),
        .Cin(C[1]),
        .Cout(C[2]),
        .Sum(Sum[2])
    );

    FA fa4(
        .A(A[3]),
        .B(B[3]),
        .Cin(C[2]),
        .Cout(Cout),
        .Sum(Sum[3])
    );

endmodule