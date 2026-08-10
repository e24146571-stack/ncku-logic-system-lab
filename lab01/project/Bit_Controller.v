module Bit_Controller(
    input selected_bit,
    input invert,
    input enable,
    output channel
);

    assign channel = (~selected_bit & enable & invert) | (selected_bit & enable & ~invert);

endmodule