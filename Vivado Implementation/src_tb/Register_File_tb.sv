`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 07:54:58 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File_tb();
    timeunit 1ns;
    timeprecision 1ps;
    
    localparam CLK_PERIOD = 10;
    logic clk;
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
    
    
    logic Reg_WRITE;
    logic reset;
    logic [4:0] READ_Addr_1;
    logic [4:0] READ_Addr_2;
    logic [4:0] WRITE_Addr;
    logic [31:0] WRITE_Data;
    logic [31:0] READ_Data_1;
    logic [31:0] READ_Data_2;
    
    Register_File RF(.*);
    
    initial begin
        
        @(posedge clk);
        #(CLK_PERIOD*2);
        
        @(posedge clk);
            Reg_WRITE <= 1'b1;
            reset <= 1'b0;
            READ_Addr_1 <= 5'b0;
            READ_Addr_2 <= 5'd3;
            WRITE_Addr <= 5'b0;
            WRITE_Data <= 32'd10;
            
     end

    
endmodule
