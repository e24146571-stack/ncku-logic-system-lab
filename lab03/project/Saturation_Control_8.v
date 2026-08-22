module Saturation_Control_8(
    input [7:0] raw_result,
    input overflow,
    input sat_enable,
    output reg [7:0] result,
    output saturated
);

    always @(*) begin
        if (overflow && sat_enable) begin
            if (raw_result[7]) 
                result = 8'b01111111;
            else 
                result = 8'b10000000;
        end
        else 
            result = raw_result;
    end

    assign saturated = sat_enable & overflow;

endmodule