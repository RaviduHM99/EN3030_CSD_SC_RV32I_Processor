`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2023 08:50:41 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();

    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD = 10;
    logic clk;
    initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    logic [3:0] ALUops; ///////////////////////////////////////////////////////unsigned and signed problem
    logic [31:0] READ_Reg_1;
    logic [31:0] READ_Data_2;
    logic [31:0] ALU_Output;
    logic Branch_Output;
    
    ALU ALU_dut(.*);
    
    initial begin

    @(posedge clk);
        ALUops <= 4'd0;
        READ_Reg_1 <= 32'd1;
        READ_Data_2 <= 32'd2;
    @(posedge clk);
            ALUops <= 4'd15;
            READ_Reg_1 <= 32'd1;
            READ_Data_2 <= 32'd2;

    end
endmodule
