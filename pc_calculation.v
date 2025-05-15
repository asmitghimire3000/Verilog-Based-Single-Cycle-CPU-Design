module PC_CALC(
    input [31:0] current_pc,
    input [31:0] jmp_value,
    input branch,
    output [31:0] next_pc
);

assign next_pc = (branch) ? jmp_value : current_pc + 1'b1;

endmodule
