`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2023 05:59:33 PM
// Design Name: 
// Module Name: PC_Mux
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


module PC_Mux(
    input logic [1:0] PC_Sel,
    input logic [31:0] PC_4,
    input logic [31:0] PC_Imm,
    input logic [31:0] ALU_JALR,
    output logic [31:0] PC_IN
    );
    
    always_comb begin
        unique case(PC_Sel)
            2'b00 : PC_IN = PC_4;
            2'b01 : PC_IN = PC_Imm;
            2'b10 : PC_IN = {ALU_JALR[31:1],1'b0};
        endcase
    end
endmodule
