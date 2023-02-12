`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2023 01:01:01 AM
// Design Name: 
// Module Name: Processor_Out_Mux
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

module Processor_Out_Mux(
    input logic switch,
    input logic [31:0] ALU_Output,
    input logic [31:0] PC_out,
    output logic [31:0] Seg_IN
    );
    
    assign Seg_IN = switch ? ALU_Output : PC_out;
endmodule
