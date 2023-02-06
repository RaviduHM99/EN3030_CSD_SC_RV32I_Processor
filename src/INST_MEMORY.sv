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


module INST_MEMORY(
    input logic [31:0] Address,
    output logic [31:0] Instruction
    );
    
    reg [31:0]mem [4095:0];
  
    initial begin
        mem[0] = 32'h8f850003; // addi x1, x0, 3
        //mem[1] = 32'h00200013; // add x2, x0, x1
        //mem[2] = 32'h00208023; // sub x3, x0, x1
        for (int i = 1; i < 4096; i++)
            mem[i] = 0;
    end
    
    assign Instruction = mem[Address];
    

endmodule
