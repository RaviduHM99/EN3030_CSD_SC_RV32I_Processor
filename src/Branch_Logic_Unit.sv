`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2023 07:21:04 PM
// Design Name: 
// Module Name: Branch_Logic_Unit
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


module Branch_Logic_Unit(
    input logic [1:0] CTRL_BRANCH,
    input logic BRANCH_LOGIC,
    output logic PC_Sel
    );
    
    always_comb begin
        unique case(CTRL_BRANCH)
            2'b00 : PC_Sel = 1'b0;// Not Control Instructions
            2'b01 : PC_Sel = 1'b1;// JAL
            2'b10 : PC_Sel = 1'b1;//JALR
            2'b11 : PC_Sel = BRANCH_LOGIC; // SB instructions
        endcase
    end
         
endmodule
