`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2023 12:49:00 PM
// Design Name: 
// Module Name: RISCV_Processor_tb
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


module RISCV_Processor_tb();
    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD = 10;
    logic clk;
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
    
    logic reset;
    logic [31:0] ALU_Output;
    logic [31:0] PC_out;

    RISCV_Processor RV32I(.*);
    
    initial begin
    
    @(posedge clk);
        reset <= 1'b1;

     @(posedge clk);
        reset <= 1'b0;


    end
endmodule
