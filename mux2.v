module mux2 (
    input [31:0] RD2,extended,
    input [1:0] immediate,
    output [31:0] mux2_out
);
    assign mux2_out = (immediate == 2'b11 || immediate == 2'b10 || immediate == 2'b01) ? extended : RD2 ;
endmodule