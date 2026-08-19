module HA(
    input A, B,
    output Carry,
    output Sum
);

    assign Sum = A ^ B;
    assign Carry = A & B; 

endmodule