`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 10:08:42 PM
// Design Name: 
// Module Name: PC_Inc
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


module PC_Inc(
    input logic [31:0] PC,
    input logic [31:0] Imm_Out,
    output logic [31:0] PC_4,
    output logic [31:0] PC_Imm
    );
    
    assign PC_4 = PC + 4; //Check This Out
    assign PC_Imm = PC + Imm_Out;

endmodule
