module FA(
    input A, B, Cin,
    output Cout,
    output Sum
);

    wire temp_carry1, temp_carry2;
    wire temp_sum;

    HA ha1(
        .A(A),
        .B(B),
        .Carry(temp_carry1),
        .Sum(temp_sum)
    );

    HA ha2(
        .A(temp_sum),
        .B(Cin),
        .Carry(temp_carry2),
        .Sum(Sum)
    );

    assign Cout = temp_carry1 | temp_carry2;

endmodule