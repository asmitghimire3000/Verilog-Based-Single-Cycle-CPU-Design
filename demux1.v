module demux1x2 (
    input [31:0] din,
    input  [1:0] sel,
    output  [31:0] y0,
    output [31:0] y1
);

assign y0 = (sel == 2'b00) ? din : 32'b00000000000000000000000000000000;
assign y1 = (sel != 2'b00) ? din : 32'b00000000000000000000000000000000;

endmodule