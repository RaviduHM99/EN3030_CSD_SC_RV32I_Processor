`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2023 05:49:31 PM
// Design Name: 
// Module Name: ALU_InMux
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


module ALU_InMux(
    input logic ALU_IN_CTRL,
    input logic [31:0] Imm,
    input logic [31:0] REG_READ,
    output logic [31:0] ALU_In
    );
    
    always_comb begin
        unique case(ALU_IN_CTRL)
            1'b0 : ALU_In = REG_READ;
            1'b1 : ALU_In = Imm;
        endcase
    end
endmodule
