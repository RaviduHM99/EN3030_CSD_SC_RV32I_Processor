`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2023 10:09:23 PM
// Design Name: 
// Module Name: DATA_MEMORY
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


module DATA_MEMORY_tb();
  timeunit 1ns;
  timeprecision 1ps;
  
  localparam CLK_PERIOD = 10;
  logic clk;
  initial begin
      clk = 0;
      forever #(CLK_PERIOD/2) clk <= ~clk;
  end
  
  logic reset;
  logic [3:0] address;
  logic [31:0] write_data;
  logic write_enable;
  logic [2:0] mem_type; // byte, halfword, word and signed, unsigned
  logic read_enable;
  logic [31:0] read_data;
  
  DATA_MEMORY DM(.*);
  
  initial begin
      
      @(posedge clk);
      #(CLK_PERIOD*2);
      
      @(posedge clk);
        address <= 4'd0;
        write_data <= 32'd6;
        write_enable <= 1'b1;
        mem_type <= 3'b000; 
        read_enable <= 1'b0;
        reset <= 1'b0;
        
      @(posedge clk);
        address <= 4'd0;
        write_data <= 32'dx;
        write_enable <= 1'b0;
        mem_type <= 3'b000; 
        read_enable <= 1'b1;
        reset <= 1'b0;
        

     
   
   end
endmodule