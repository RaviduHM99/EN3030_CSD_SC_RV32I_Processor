`timescale 1ns / 1ps

module ALU_OutMux(
    input logic [2:0]ALU_OUT_CTRL,
    input logic [31:0] MEM_READ,
    input logic [31:0] ALU_OUT,
    input logic [31:0] PC_Imm,
    input logic [31:0] PC_4,
    input logic [31:0] Imm,
    output logic [31:0] REG_WRITE
    );
    
    always_comb begin
        unique case(ALU_OUT_CTRL)
            3'b000 : REG_WRITE = ALU_OUT;
            3'b001 : REG_WRITE = MEM_READ;
            3'b010 : REG_WRITE = PC_Imm;//AUIPC
            3'b011 : REG_WRITE = Imm; //LUI
            3'b101 : REG_WRITE = PC_4; //JAL,JALR
            default : REG_WRITE = 32'dx;
        endcase
    end
endmodule