module FA(
    input A, B, Cin,
    output Cout, Sum
);

    assign Sum = A ^ B ^ Cin;
    assign Cout = A & B | Cin & (A | B);

endmodule