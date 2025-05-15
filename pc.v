module program_counter(pc,clk,rst,new_pc);

    input [31:0] new_pc;
    output reg [31:0] pc;

    input clk,rst;

    always @(posedge clk)
    begin
        if (~rst)
            pc <= 32'b00000000000000000000000000000000;
        else
            pc <= new_pc;
    end    
endmodule