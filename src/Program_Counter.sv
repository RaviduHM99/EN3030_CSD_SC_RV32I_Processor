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


module Program_Counter(
	input logic pc_clk,
	input logic reset,
    input logic [31:0] PC_in,
    output logic [31:0] PC_out
    );

    always_ff @ (posedge pc_clk or posedge reset)
    begin
        if(reset == 1'b1)
            PC_out <= 32'd0;
        else
            PC_out <= PC_in;
    end

endmodule
