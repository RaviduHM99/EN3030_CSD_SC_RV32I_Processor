`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2023 10:08:56 PM
// Design Name: 
// Module Name: INST_MEMORY
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


module INST_MEMORY_tb();
    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD = 10;
    logic clk;
    initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    logic [31:0] Address;    
    logic [31:0] Instruction;
    
    INST_MEMORY IM(.*);
    
    initial begin

    @(posedge clk);
        Address <= 32'b0;



    end


endmodule
