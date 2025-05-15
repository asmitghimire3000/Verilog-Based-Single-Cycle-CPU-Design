# Verilog Based Single Cycle CPU Design

# Architecture
<img width="844" alt="ARCHITECTURE" src="https://github.com/user-attachments/assets/ddb405b7-c738-4eb9-a341-409307708d73" />

# Overview
This project implements a custom 32-bit single-cycle processor architecture using Verilog HDL. The design includes all fundamental components of a basic CPU, such as an ALU, control unit, instruction memory, data memory, register file, multiplexers, demultiplexers, program counter, and sign extension logic. The processor supports a simple instruction set and demonstrates instruction fetch, decode, execution, memory access, and write-back stages in a single clock cycle.

# Instructions
Some instructions that can be implemented here are: 
1. Load
2. Store
3. Add
4. Sub
5. Or
6. And
7. Xor
8. Not
9. Jump

The instructions can be implemented on immediate data as well as the datas in the registers according to the instructions provided.

Furthermore, As the processor is of 32-bit and an immediate 32-bit data cant be provided in a single instruction, We tend to provide the immediate datas in two part choosing it to be the upper 16-bit or the lower 16-bit. The opcode decides it to be the upper one or the lower one.

# Example
For the instruction :
LUI R1 000F
LLI R1 000F
LD R2 0004
ADD R3 R2 R1
ST R3 0007


# Output
![Screenshot 2025-05-13 223507](https://github.com/user-attachments/assets/f67e8053-823b-4166-bb48-7e8234509e34)
