module CLL_4(
    input [3:0] P,
    input [3:0] G,
    input Cin,
    output [3:1] C,
    output PG, GG
);

    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] 
                | (P[1] & G[0]) 
                | (P[1] & P[0] & Cin);
    assign C[3] = G[2] 
                | (P[2] & G[1]) 
                | (P[2] & P[1] & G[0]) 
                | (P[2] & P[1] & P[0] & Cin);
    assign PG = P[3] & P[2] & P[1] & P[0];
    assign GG = G[3] 
              | (P[3] & G[2]) 
              | (P[3] & P[2] & G[1]) 
              | (P[3] & P[2] & P[1] & G[0]);

endmodule