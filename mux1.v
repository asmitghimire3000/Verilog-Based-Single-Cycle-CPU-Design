module mux1 (
    input [31:0] RD1,
    input [1:0] Mem_Inst,
    output [31:0] mux1_out
);
    assign mux1_out = (Mem_Inst == 2'b11 || Mem_Inst == 2'b01 || Mem_Inst == 2'b00 ) ? RD1 : 32'b00000000000000000000000000000000 ;
endmodule