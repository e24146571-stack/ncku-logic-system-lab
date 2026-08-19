module RCA_8(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output Cout,
    output [7:0] Sum
);

    wire C;

    RCA_4 rca4_1(
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .Cout(C),
        .Sum(Sum[3:0])
    );

    RCA_4 rca4_2(
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(C),
        .Cout(Cout),
        .Sum(Sum[7:4])
    );

endmodule