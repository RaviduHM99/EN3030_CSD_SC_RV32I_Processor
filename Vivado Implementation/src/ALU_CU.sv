`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2023 05:57:44 AM
// Design Name: 
// Module Name: ALU_CU
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


module ALU_CU(
    input logic [2:0] ALU_INST,
    input logic [3:0]INST, // {INST[30], INST[14:12]}
    output logic [3:0] ALUops
    );
  
    always_comb begin
        unique case (ALU_INST)
          3'd0 : ALUops = 4'dx; // U - LUI, U - AUIPC, UJ - JAL
          3'd1 : ALUops = 4'd0; // UJ - JALR, S, I - LOAD
          3'd2 : begin // I - ALU
             unique case(INST[2:0])
                 3'b000 : ALUops = 4'd0; //ADDI
                 3'b010 : ALUops = 4'd8; //SLTI
                 3'b011 : ALUops = 4'd8; //SLTIU
                 3'b100 : ALUops = 4'd5; //XORI
                 3'b110 : ALUops = 4'd6; //ORI
                 3'b111 : ALUops = 4'd7; //ANDI
                 3'b001 : ALUops = 4'd2; //SLLI
                 3'b101 : begin
                     unique case(INST[3])
                        1'b0 : ALUops = 4'd3; //SRLI
                        1'b1 : ALUops = 4'd4; //SRAI
                     endcase
                 end
            endcase
           end
          3'd3 : begin // SB
            unique case(INST[2:0])
                3'b000 : ALUops = 4'd9; //BEQ
                3'b001 : ALUops = 4'd10; //BNE
                3'b100 : ALUops = 4'd11; //BLT
                3'b101 : ALUops = 4'd12; //BGE
                3'b110 : ALUops = 4'd13; //BLTU
                3'b111 : ALUops = 4'd14; //BGEU
           endcase
          end
          3'd4 : begin // R
              unique case(INST)
                  4'b0000 : ALUops = 4'd0; //ADD
                  4'b1000 : ALUops = 4'd1; //SUB
                  4'b0001 : ALUops = 4'd2; // SLL
                  4'b0010 : ALUops = 4'd8; // SLT
                  4'b0011 : ALUops = 4'd15; //SLTU
                  4'b0100 : ALUops = 4'd5; //XOR
                  4'b0101 : ALUops = 4'd3; //SRL
                  4'b1101 : ALUops = 4'd4; //SRA
                  4'b0110 : ALUops = 4'd6; //OR
                  4'b0111 : ALUops = 4'd7; //AND
             endcase
            end
          default: ALUops = 4'dx; //nop
        endcase
    end

endmodule
