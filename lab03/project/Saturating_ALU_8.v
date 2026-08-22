module Saturating_ALU_8(
    input [7:0] A,
    input [7:0] B,
    input OP,
    input sat_enable,
    output [7:0] result,
    output overflow,
    output saturated,
    output zero,
    output negative
);

    wire [7:0] raw_result;

    Arithmetic_Unit_8 arithmetic_unit(
        .A(A),
        .B(B),
        .OP(OP),
        .raw_result(raw_result),
        .overflow(overflow)
    );

    Saturation_Control_8 saturation_control(
        .raw_result(raw_result),
        .overflow(overflow),
        .sat_enable(sat_enable),
        .result(result),
        .saturated(saturated)
    );

    assign zero = (result == 8'd0) ? 1'b1 : 1'b0;
    assign negative = (result[7]) ? 1'b1 : 1'b0;

endmodule