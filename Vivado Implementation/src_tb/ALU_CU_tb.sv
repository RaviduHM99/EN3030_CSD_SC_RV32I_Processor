`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2023 06:10:45 PM
// Design Name: 
// Module Name: ALU_CU_tb
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


module ALU_CU_tb();
    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD = 10;
    logic clk;
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
    
    
    logic [2:0] ALU_INST;
    logic [3:0]INST; // {INST[30], INST[14:12]}
    logic [3:0] ALUops;
    
    ALU_CU ALUCU(.*);
    
    initial begin
        
        @(posedge clk);
        #(CLK_PERIOD*2);
        
        @(posedge clk);
          ALU_INST <= 3'd0;
          INST <= 4'd6;
          
        @(posedge clk);
        ALU_INST <= 3'd1;
        INST <= 4'd6;
        
        @(posedge clk);
        ALU_INST <= 3'd2;
        INST <= 4'b0010;

   
 
 end
endmodule
