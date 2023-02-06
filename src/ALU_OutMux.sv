`timescale 1ns / 1ps

module ALU_OutMux(
    input logic [1:0]ALU_OUT_CTRL,
    input logic [31:0] MEM_READ,
    input logic [31:0] ALU_OUT,
    input logic [31:0] PC_Imm,
    output logic [31:0] REG_WRITE
    );
    
    always_comb begin
        unique case(ALU_OUT_CTRL)
            2'b00 : REG_WRITE = ALU_OUT;
            2'b01 : REG_WRITE = MEM_READ;
            2'b10 : REG_WRITE = PC_Imm;//AUIPC
        endcase
    end
endmodule