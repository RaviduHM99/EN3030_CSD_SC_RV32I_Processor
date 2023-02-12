`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2023 01:17:42 AM
// Design Name: 
// Module Name: FPGA_Module_tb
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


module FPGA_Module_tb();
    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD = 20;
    logic clk;
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
    
    logic reset;
    logic output_switch;
    reg [6:0] Dig_Arr [7:0];

    FPGA_Module(.*);
    
    initial begin
    
    @(posedge clk);
        reset <= 1'b1;
        output_switch <= 1'b0;
    
     @(posedge clk);
        reset <= 1'b0;
        output_switch <= 1'b0;
     @(posedge clk);
        reset <= 1'b0;
        output_switch <= 1'b1;


end


endmodule
