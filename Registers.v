module REGISTERS_FILES(RD1,RD2,RS1,RS2,RD,WR,WE_reg,rst,clk,RS2_sel);
    input [0:4] RS1,RS2,RD;
    output reg [31:0] RD1;
    output reg [31:0] RD2;
    input [31:0] WR;
    input clk,rst,WE_reg,RS2_sel;

    reg [31:0] regfile [31:0];

    always @(*) begin
        RD1 = regfile[RS1];
        RD2 = regfile[RS2];
    end

    always @(posedge clk or posedge rst) begin
         if (WE_reg) begin
            regfile[RD] <= WR;
        end
    end

    initial begin
        regfile[0] = 32'b0;
    end
endmodule