module CLA_4(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output PG, GG
);

    wire [3:0] P;
    wire [3:0] G;
    wire [3:1] C;

    CLL_4 cll(
        .P(P),
        .G(G),
        .Cin(Cin),
        .C(C),
        .PG(PG),
        .GG(GG)
    );

    PFA pfa0(
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .P(P[0]),
        .G(G[0]),
        .Sum(Sum[0])
    );

    PFA pfa1(
        .A(A[1]),
        .B(B[1]),
        .Cin(C[1]),
        .P(P[1]),
        .G(G[1]),
        .Sum(Sum[1])
    );

    PFA pfa2(
        .A(A[2]),
        .B(B[2]),
        .Cin(C[2]),
        .P(P[2]),
        .G(G[2]),
        .Sum(Sum[2])
    );

    PFA pfa3(
        .A(A[3]),
        .B(B[3]),
        .Cin(C[3]),
        .P(P[3]),
        .G(G[3]),
        .Sum(Sum[3])
    );

endmodule