`include "ALU.v"
`include "control_unit.v"
`include "data_memory.v"
`include "demux1.v"
`include "instrction_memory.v"
`include "mux1.v"
`include "mux2.v"
`include "mux3.v"
`include "mux6.v"
`include "pc.v"
`include "pc_calculation.v"
`include "Registers.v"
`include "sign_extend.v"

module Single_top(clk,rst);
    input clk,rst;

    wire [31:0] PC_top, instruction, RD1, RD2, mux1_wire,mux2_wire,mux3_wire, mux6_wire, ALUresult, dmux_wire, data_in_wire, data_out_wire, sign_extended_wire,pc_calc_wire;
    wire [3:0] ALU_control_wire;
    wire [1:0] immediate_wire, memory_wire;
    wire branch_wire,reg_write_wire,carry_wire, zero_wire, negative_wire;

    // ALU
    ALU alu_inst (
          .A(mux1_wire)
        , .B(mux3_wire)
        , .ALU_control(ALU_control_wire)
        , .result(ALUresult)
        , .carry(carry_wire)
        , .zero(zero_wire)
        , .negative(negative_wire)
    );

    // control_unit
    control_unit control_unit_inst (
        .reg_write(reg_write_wire)
        , .mem_inst(memory_wire)
        , .branch(branch_wire)
        , .immediate(immediate_wire)
        , .ALU_control(ALU_control_wire)
        , .opcode(instruction[31:26])
    );

    // data_memory
    data_memory data_memory_inst (
        .address(sign_extended_wire)
        , .data_in(data_in_wire)
        , .mem_inst(memory_wire)
        , .clk(clk)
        , .data_out(data_out_wire)
    );

    // demux1x2
    demux1x2 demux1x2_inst (
        .din(ALUresult)
        , .sel(memory_wire)
        , .y0(dmux_wire)
        , .y1(data_in_wire)
    );

    // instruction_memory
    instruction_memory instruction_memory_inst (
        .inst(instruction)
        , .pc(PC_top)
        , .clk(clk)
        , .rst(rst)
    );

    // mux1
    mux1 mux1_inst (
        .RD1(RD1)
        , .Mem_Inst(memory_wire)
        , .mux1_out(mux1_wire)
    );

    // mux2
    mux2 mux2_inst (
        .RD2(RD2)
        , .extended(sign_extended_wire)
        , .immediate(immediate_wire)
        , .mux2_out(mux2_wire)
    );

    // mux3
    mux3 mux3_inst (
        .mux2_out(mux2_wire)
        , .mem_inst(memory_wire)
        , .mux3_out(mux3_wire)
    );

    // mux6
    mux6 mux6_inst (
        .a(dmux_wire)
        , .b(data_out_wire)
        , .sel(memory_wire)
        , .y(mux6_wire)
    );

    // pc (program_counter)
    program_counter pc_inst (
          .pc(PC_top)
        , .clk(clk)
        , .rst(rst)
        , .new_pc(pc_calc_wire)
    );

    // pc_calculation
    PC_CALC pc_calculation_inst (
        .current_pc(PC_top),
        .jmp_value(sign_extended_wire),
        .branch(branch_wire),
        .next_pc(pc_calc_wire)
        // Add ports as defined in your pc_calculation.v, each on a new line after a comma
    );

    // REGISTERS_FILES
    REGISTERS_FILES registers_files_inst (
        .RD1(RD1)
        , .RD2(RD2)
        , .RS1(instruction[20:16])
        , .RS2(instruction[4:0])
        , .RD(instruction[25:21])
        , .WR(mux6_wire)
        , .WE_reg(reg_write_wire)
        , .rst(rst)
        , .clk(clk)
        , .RS2_sel(instruction[31])
    );

    // sign_extend
    sign_extend sign_extend_inst (
        .raw(instruction[15:0]),
        .immediate(immediate_wire),
        .extended(sign_extended_wire)
        // Add ports as defined in your sign_extend.v, each on a new line after a comma
    );
endmodule