module instruction_memory(inst,pc,clk,rst);
    output [31:0] inst;
    input [31:0] pc;
    input clk,rst;

    reg [31:0] INSTRUCTION_MEMORY [4095 : 0];
    
    assign inst = (rst == 1'b0) ? 32'h0 : INSTRUCTION_MEMORY[pc[11:0]];


    initial begin
        // Load instructions into memory
        INSTRUCTION_MEMORY[0] = 32'h0020000F;
        INSTRUCTION_MEMORY[1] = 32'h0421000F;
        INSTRUCTION_MEMORY[2] = 32'h08400004;
        INSTRUCTION_MEMORY[3] = 32'h90610002;
        INSTRUCTION_MEMORY[4] = 32'h0FE30007;
    end

endmodule