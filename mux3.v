module mux3 (
    input [31:0] mux2_out,
    input [1:0] mem_inst,
    output [31:0] mux3_out
);
    assign mux3_out = (mem_inst == 2'b10 || mem_inst == 2'b00 || mem_inst == 2'b11 ) ? mux2_out : 32'b00000000000000000000000000000000;
endmodule