/*
CLA_64 Hierarchy (Diagram assisted by ChatGPT)

Level 0 : 16 x CLA_4
------------------------------------------------
cla0  cla1  cla2  cla3   -> cll_layer0_0
cla4  cla5  cla6  cla7   -> cll_layer0_1
cla8  cla9  cla10 cla11  -> cll_layer0_2
cla12 cla13 cla14 cla15  -> cll_layer0_3

          PG/GG from each CLA_4
                    |
                    v

Level 1 : 4 x CLL_4
------------------------------------------------
cll_layer0_0 \
cll_layer0_1  \
cll_layer0_2   ---> PGG/GGG ---> cll_layer1_0
cll_layer0_3  /

                    |
                    v

Level 2 : Top CLL_4
------------------------------------------------
cll_layer1_0
    |
    +--> C_level1[1] -> cla4
    +--> C_level1[2] -> cla8
    +--> C_level1[3] -> cla12
    |
    +--> PGGG / GGGG
              |
              v
      Cout = GGGG | (PGGG & Cin)

C_level0 : carry between CLA_4 blocks inside each 16-bit group
C_level1 : carry between the four 16-bit groups
*/


module CLA_64(
    input [63:0] A,
    input [63:0] B,
    input Cin,
    output [63:0] Sum,
    output Cout
);

    wire [63:0] P;
    wire [63:0] G;
    wire [11:0] C_level0;
    wire [3:1] C_level1;
    wire [15:0] PG;
    wire [15:0] GG;
    wire [3:0] PGG;
    wire [3:0] GGG;
    wire PGGG, GGGG;

    CLA_4 cla0(
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(Cin),
        .Sum(Sum[3:0]),
        .PG(PG[0]),
        .GG(GG[0])
    );

    CLA_4 cla1(
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(C_level0[0]),
        .Sum(Sum[7:4]),
        .PG(PG[1]),
        .GG(GG[1])
    );

    CLA_4 cla2(
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(C_level0[1]),
        .Sum(Sum[11:8]),
        .PG(PG[2]),
        .GG(GG[2])
    );

    CLA_4 cla3(
        .A(A[15:12]),
        .B(B[15:12]),
        .Cin(C_level0[2]),
        .Sum(Sum[15:12]),
        .PG(PG[3]),
        .GG(GG[3])
    );

    CLL_4 cll_layer0_0(
        .P(PG[3:0]),
        .G(GG[3:0]),
        .Cin(Cin),
        .C(C_level0[2:0]),
        .PG(PGG[0]),
        .GG(GGG[0])
    );

    CLA_4 cla4(
        .A(A[19:16]),
        .B(B[19:16]),
        .Cin(C_level1[1]),
        .Sum(Sum[19:16]),
        .PG(PG[4]),
        .GG(GG[4])
    );

    CLA_4 cla5(
        .A(A[23:20]),
        .B(B[23:20]),
        .Cin(C_level0[3]),
        .Sum(Sum[23:20]),
        .PG(PG[5]),
        .GG(GG[5])
    );

    CLA_4 cla6(
        .A(A[27:24]),
        .B(B[27:24]),
        .Cin(C_level0[4]),
        .Sum(Sum[27:24]),
        .PG(PG[6]),
        .GG(GG[6])
    );

    CLA_4 cla7(
        .A(A[31:28]),
        .B(B[31:28]),
        .Cin(C_level0[5]),
        .Sum(Sum[31:28]),
        .PG(PG[7]),
        .GG(GG[7])
    );

    CLL_4 cll_layer0_1(
        .P(PG[7:4]),
        .G(GG[7:4]),
        .Cin(C_level1[1]),
        .C(C_level0[5:3]),
        .PG(PGG[1]),
        .GG(GGG[1])
    );

    CLA_4 cla8(
        .A(A[35:32]),
        .B(B[35:32]),
        .Cin(C_level1[2]),
        .Sum(Sum[35:32]),
        .PG(PG[8]),
        .GG(GG[8])
    );

    CLA_4 cla9(
        .A(A[39:36]),
        .B(B[39:36]),
        .Cin(C_level0[6]),
        .Sum(Sum[39:36]),
        .PG(PG[9]),
        .GG(GG[9])
    );

    CLA_4 cla10(
        .A(A[43:40]),
        .B(B[43:40]),
        .Cin(C_level0[7]),
        .Sum(Sum[43:40]),
        .PG(PG[10]),
        .GG(GG[10])
    );

    CLA_4 cla11(
        .A(A[47:44]),
        .B(B[47:44]),
        .Cin(C_level0[8]),
        .Sum(Sum[47:44]),
        .PG(PG[11]),
        .GG(GG[11])
    );

    CLL_4 cll_layer0_2(
        .P(PG[11:8]),
        .G(GG[11:8]),
        .Cin(C_level1[2]),
        .C(C_level0[8:6]),
        .PG(PGG[2]),
        .GG(GGG[2])
    );

    CLA_4 cla12(
        .A(A[51:48]),
        .B(B[51:48]),
        .Cin(C_level1[3]),
        .Sum(Sum[51:48]),
        .PG(PG[12]),
        .GG(GG[12])
    );

    CLA_4 cla13(
        .A(A[55:52]),
        .B(B[55:52]),
        .Cin(C_level0[9]),
        .Sum(Sum[55:52]),
        .PG(PG[13]),
        .GG(GG[13])
    );

    CLA_4 cla14(
        .A(A[59:56]),
        .B(B[59:56]),
        .Cin(C_level0[10]),
        .Sum(Sum[59:56]),
        .PG(PG[14]),
        .GG(GG[14])
    );

    CLA_4 cla15(
        .A(A[63:60]),
        .B(B[63:60]),
        .Cin(C_level0[11]),
        .Sum(Sum[63:60]),
        .PG(PG[15]),
        .GG(GG[15])
    );

    CLL_4 cll_layer0_3(
        .P(PG[15:12]),
        .G(GG[15:12]),
        .Cin(C_level1[3]),
        .C(C_level0[11:9]),
        .PG(PGG[3]),
        .GG(GGG[3])
    );

    CLL_4 cll_layer1_0(
        .P(PGG),
        .G(GGG),
        .Cin(Cin),
        .C(C_level1),
        .PG(PGGG),
        .GG(GGGG)
    );

    assign Cout = GGGG | (PGGG & Cin);

endmodule