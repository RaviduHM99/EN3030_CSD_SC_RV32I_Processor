`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 10:38:49 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter_tb( );
    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD = 10;
    logic clk;
    initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    logic reset;
    logic [31:0] PC_in;
    logic [31:0] PC_out;
    
    Program_Counter PC(.*);
    
    initial begin

    @(posedge clk);
        reset <= 1'b0;
        PC_in <= 32'd0;
    @(posedge clk);
        reset <= 1'b0;
        PC_in <= 32'd1;
    @(posedge clk);
        reset <= 1'b0;
        PC_in <= 32'd2;
    #(5)
        reset <= 1'b1;

    end


endmodule
