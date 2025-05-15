module control_unit(reg_write, mem_inst, branch, immediate, ALU_control, opcode);
    input [5:0] opcode;
    output reg_write,branch;
    output [1:0] mem_inst,immediate;
    output [3:0] ALU_control;

        assign reg_write = (opcode == 6'b000000 || opcode == 6'b000001 || opcode == 6'b000010 ||
                   opcode == 6'b100100 || opcode == 6'b000101 || opcode == 6'b000110 ||
                   opcode == 6'b100111 || opcode == 6'b001000 || opcode == 6'b001001 ||
                   opcode == 6'b101010 || opcode == 6'b001011 || opcode == 6'b001100 ||
                   opcode == 6'b101101 || opcode == 6'b001110 || opcode == 6'b001111 ||
                   opcode == 6'b110000 || opcode == 6'b010001 || opcode == 6'b010010 ||
                   opcode == 6'b010011) ? 1'b1 : 1'b0;

        assign mem_inst = (opcode == 6'b000010) ? 2'b10 : 
                    (opcode == 6'b000011) ? 2'b01 : 
                    2'b00;

        assign branch = (opcode == 6'b010100 || opcode == 6'b010101) ? 1'b1 : 1'b0;

        assign immediate = (opcode == 6'b000000 || opcode == 6'b000101 || opcode == 6'b001000 ||
                    opcode == 6'b001011 || opcode == 6'b001110 || opcode == 6'b010001) ? 2'b11 :
                    (opcode == 6'b000001 || opcode == 6'b000110 || opcode == 6'b001001 ||
                    opcode == 6'b001100 || opcode == 6'b001111 || opcode == 6'b010010) ? 2'b10 :
                    (opcode == 6'b000010 || opcode == 6'b000011 || opcode == 6'b010100 ||
                    opcode == 6'b010101) ? 2'b01 :
                    2'b00;

        assign ALU_control = (opcode == 6'b000000 || opcode == 6'b000001 || opcode == 6'b000010 ||
                        opcode == 6'b000011 || opcode == 6'b100100 || opcode == 6'b000101 ||
                        opcode == 6'b000110) ? 4'b0001 :
                        (opcode == 6'b100111 || opcode == 6'b001000 || opcode == 6'b001001) ? 4'b1001 :
                        (opcode == 6'b101010 || opcode == 6'b001011 || opcode == 6'b001100) ? 4'b0011 :
                        (opcode == 6'b101101 || opcode == 6'b001110 || opcode == 6'b001111) ? 4'b0100 :
                        (opcode == 6'b110000 || opcode == 6'b010001 || opcode == 6'b010010) ? 4'b0101 :
                        (opcode == 6'b010011) ? 4'b0110 :
                        (opcode == 6'b010100 || opcode == 6'b010101) ? 4'b0000 : 4'b0000;
endmodule