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
    input logic [31:0] PC,
    input logic [31:0] WRITE_Data_IN,
    input logic REG_READ_Ctrl_1,
    input logic REG_READ_Ctrl_2,
    input logic REG_WRITE_Ctrl,
    output logic [31:0] WRITE_Data,
    output logic [31:0] READ_Addr_1,
    output logic [31:0] READ_Addr_2
    );
    
    always_comb begin
        unique case(REG_READ_Ctrl_1)
            1'd1 : READ_Addr_1 = Reg_Addr_1; //Computational Instructions
            1'd0 : READ_Addr_1 = 4'd0; //x0 Register
        endcase
    end
    
    always_comb begin
        unique case(REG_READ_Ctrl_2)
            1'd1 : READ_Addr_2 = Reg_Addr_2; //Computational Instructions
            1'd0 : READ_Addr_2 = 4'd0; //x0 Register
        endcase
    end
    
    always_comb begin
        unique case(REG_WRITE_Ctrl)
            1'd1 : WRITE_Data = PC; //Here PC means PC+4
            1'd0 : WRITE_Data = WRITE_Data_IN; 
        endcase
    end
    
endmodule
