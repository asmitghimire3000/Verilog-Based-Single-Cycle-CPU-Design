module ALU(result, carry, negative, zero, A, B,ALU_control);
    
    //inputs
    input [3 : 0] ALU_control;
    input [31 : 0] A;
    input [31 : 0] B;

    //outputs
    output [31 : 0] result;
    output carry, negative, zero;


    //wires
    wire [31 : 0] AorB, AandB, nor_out,AxorB;
    wire [31 : 0] Sum;
    wire [31 : 0] mux4,mux5,not_out;
    wire cout;

    assign AorB = A | B ;
    assign AandB = A & B;
    assign mux4 = (ALU_control[3] == 1'b0) ? B : ~B;
    assign {cout,Sum} = A + mux4 + ALU_control[3]; // ALU_control[3] for performing subtraction by 2s complement
    assign AxorB = A ^ B;
    assign not_out = ~(A);

    assign mux5 = (ALU_control[3:0] == 4'b0001 | ALU_control[3:0] == 4'b1001) ? Sum :
                    (ALU_control[3:0] == 4'b0100) ? AandB :
                        (ALU_control[3:0] == 4'b0011) ? AorB :
                            (ALU_control[3:0] == 4'b0101) ? AxorB :
                                (ALU_control[3:0] == 4'b0101) ? not_out : 32'b0000000000000000000000000000000;

    assign result = mux5;      

    //flags
    assign carry = cout & (~ALU_control[2]) & (~ALU_control[1]) & (ALU_control[0]);
    assign negative = result[31];                               
    assign zero = (&(~(result)));
endmodule