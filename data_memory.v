module data_memory (
    input [31:0] address,
    input [31:0] data_in,
    input [1:0] mem_inst,
    input clk,
    output wire [31:0] data_out
);
    reg [31:0] memory [4095:0]; // 1KB memory

    assign data_out = (mem_inst == 2'b10) ? memory[address[11:0]] : 32'b0; // Read operation

    always @(posedge clk) begin
        if (mem_inst == 2'b01) 
            begin // Write operation
                memory[address[11:0]] <= data_in;
            end 
    end

    initial begin
        // Initialize memory with some values
        memory[4] = 32'h00f000f0;
        // Add more initial values as needed
    end
endmodule    