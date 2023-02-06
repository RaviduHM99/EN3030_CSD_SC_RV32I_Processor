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
    input logic [3:0] ALU_INST,
    input logic [3:0]INST, // {INST[30], INST[14:12]}
    output logic [3:0] ALUops
    );
  
    always_comb begin
        unique case (ALU_INST)
          4'd0 : ALUops = 4'd15; // U - LUI
          4'd1 : ALUops = 4'd15; // U - AUIPC
          4'd2 : ALUops = 4'd15; // UJ - JAL
          4'd3 : ALUops = 4'd0; // UJ - JALR
          4'd4 : ALUops = 4'd0; // S
          4'd5 : ALUops = 4'd0; // I - LOAD
          4'd6 : begin // I - ALU
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
          4'd7 : begin // SB
            unique case(INST[2:0])
                3'b000 : ALUops = 4'd9; //BEQ
                3'b001 : ALUops = 4'd10; //BNE
                3'b100 : ALUops = 4'd11; //BLT
                3'b101 : ALUops = 4'd12; //BGE
                3'b110 : ALUops = 4'd11; //BLTU
                3'b111 : ALUops = 4'd12; //BGEU
           endcase
          end
          4'd8 : begin // R
              unique case(INST)
                  4'b0000 : ALUops = 4'd9; //ADD
                  4'b1000 : ALUops = 4'd10; //SUB
                  4'b0001 : ALUops = 4'd11; // SLL
                  4'b0010 : ALUops = 4'd12; // SLT
                  4'b0011 : ALUops = 4'd11; //SLTU
                  4'b0100 : ALUops = 4'd12; //XOR
                  4'b0101 : ALUops = 4'd11; //SRL
                  4'b1101 : ALUops = 4'd12; //SRA
                  4'b0110 : ALUops = 4'd11; //OR
                  4'b0111 : ALUops = 4'd12; //AND
             endcase
            end
        endcase
    end

endmodule
