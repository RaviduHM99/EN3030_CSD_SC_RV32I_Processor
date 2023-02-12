`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 10:52:20 PM
// Design Name: 
// Module Name: Immediate_Generation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Immediate_Generation(
    input logic [31:0] INST,
    input logic  [2:0] IMM_CTRL,
    output logic [31:0] Imm_Gen
    );
    
    always_comb begin
        unique case(IMM_CTRL)
            3'd0 : Imm_Gen = {INST[31:12], 12'd0} ; //LUI Instructions, AUIPC Instructions
            3'd1 : Imm_Gen = 32'(signed'({INST[31], INST[19:12], INST[20], INST[30:21], 1'b0})); //JAL Instructions
            3'd2 : Imm_Gen = 32'(signed'(INST[31:20])); //JALR Instructions
            3'd3 : Imm_Gen = 32'(signed'({INST[31:25], INST[11:7]})); //S Instructions
            3'd4 : Imm_Gen = 32'(signed'(INST[31:20]));//I- LOAD Instructions
            3'd5 : begin
                unique case(INST[14:12]) //I-ALU Instructions
                    3'b001 : Imm_Gen = 32'(signed'(INST[24:20]));
                    3'b101 : Imm_Gen = 32'(signed'(INST[24:20]));
                    default: Imm_Gen = 32'(signed'(INST[31:20]));
                endcase
            end
            3'd6 : Imm_Gen = 32'(signed'({INST[31], INST[7], INST[30:25], INST[11:8], 1'b0})); //B Instructions
            default: Imm_Gen = 32'dx;
        endcase
     end   
endmodule
