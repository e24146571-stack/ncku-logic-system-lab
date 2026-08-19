module PFA(
    input A, B, Cin,
    output P, G, Sum
);

    /*
    P : Propagate a carry
    G : Generate a carry
    */
    assign Sum = A ^ B ^ Cin;
    assign P = A ^ B;
    assign G = A & B;

endmodule