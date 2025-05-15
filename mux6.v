module mux6 (
    input  [31:0] a,
    input  [31:0] b,
    input  [1:0]  sel,
    output [31:0] y
);

assign y = (sel == 2'b11 || sel == 2'b10 || sel == 2'b01 ) ? b : a;

endmodule