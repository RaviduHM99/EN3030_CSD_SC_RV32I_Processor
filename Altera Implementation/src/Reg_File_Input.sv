`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 09:21:06 PM
// Design Name: 
// Module Name: Reg_File_Input
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


module Reg_File_Input(
    input logic [4:0] Reg_Addr_1,
    input logic [4:0] Reg_Addr_2,
    input logic REG_READ_Ctrl_1,
    input logic REG_READ_Ctrl_2,
    output logic [4:0] READ_Addr_1,
    output logic [4:0] READ_Addr_2
    );
    
    assign READ_Addr_1 = REG_READ_Ctrl_1 ?  Reg_Addr_1 : 5'd0; 
    
    assign READ_Addr_2 = REG_READ_Ctrl_2 ?  Reg_Addr_2 : 5'd0; 
      
endmodule
