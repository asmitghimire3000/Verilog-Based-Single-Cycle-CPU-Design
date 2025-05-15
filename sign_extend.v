module sign_extend(extended, raw , immediate);
    input [15:0] raw;
    output [31:0] extended;
    input[1:0] immediate;

    assign extended = (immediate == 2'b11) ? {raw, 16'b0000000000000000} :  {16'b0000000000000000 , raw};
endmodule