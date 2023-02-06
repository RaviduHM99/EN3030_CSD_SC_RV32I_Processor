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
    input logic PC_Sel,
    input logic [31:0] PC_4,
    input logic [31:0] PC_Imm,
    output logic [31:0] PC_IN
    );
    
    always_comb begin
        unique case(PC_Sel)
            1'b0 : PC_IN = PC_4;
            1'b1 : PC_IN = PC_Imm;
        endcase
    end
endmodule
