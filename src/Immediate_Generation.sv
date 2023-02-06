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
    input logic  [3:0] IMM_CTRL,
    output logic Imm_Gen
    );
    
    always_comb begin
        unique case(IMM_CTRL)
            4'd0 : Imm_Gen = INST[31:12] << 12 ; //LUI Instructions
            4'd1 : Imm_Gen = INST[31:12] << 12 ; //AUIPC Instructions
            4'd2 : Imm_Gen = 32'(signed'({INST[31], INST[19:12], INST[20], INST[30:21]})); //JAL Instructions
            4'd3 : Imm_Gen = 32'(signed'(INST[31:20])); //JALR Instructions
            4'd4 : Imm_Gen = 32'(signed'({INST[31:25], INST[11:7]})); //S Instructions
            4'd5 : Imm_Gen = 32'(signed'(INST[31:20]));//I- LOAD Instructions
            4'd6 : begin
                unique case(INST[14:12]) //I-ALU Instructions
                    3'b001 : Imm_Gen = 32'(signed'(INST[24:20]));
                    3'b101 : Imm_Gen = 32'(signed'(INST[24:20]));
                    default: Imm_Gen = 32'(signed'(INST[31:20]));
                endcase
            end
            4'd7 : Imm_Gen = 32'(signed'({INST[31], INST[7], INST[30:25], INST[11:8]})); //B Instructions
            default: Imm_Gen = 32'd0;
        endcase
     end   
endmodule
