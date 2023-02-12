`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2023 09:52:28 PM
// Design Name: 
// Module Name: Control_FSM
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


module Control_FSM_tb(

    );
    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD = 10;
    logic clk;
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
    

    logic [9:0] INST;
    logic REG_READ_Ctrl_1; logic REG_READ_Ctrl_2;
    logic ALU_IN_CTRL;
    logic [2:0]ALU_OUT_CTRL;
    logic [2:0] ALU_INST;
    logic [2:0] IMM_CTRL;
    logic Reg_WRITE;
    logic write_enable; logic read_enable; logic [2:0] mem_type;
    logic [1:0] CTRL_BRANCH;
    
    Control_FSM CFSM(.*);
    
    initial begin
        
        @(posedge clk);
        #(CLK_PERIOD*2);
        
        @(posedge clk);
        INST <= 9'b110110111;

        
        @(posedge clk);
        INST <= 9'b110010111;


     
     end

  
endmodule
