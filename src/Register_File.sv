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


module Register_File(
    input logic Reg_WRITE,
    input logic reset,
    input logic [4:0] READ_Addr_1,
    input logic [4:0] READ_Addr_2,
    input logic [4:0] WRITE_Addr,
    input logic [31:0] WRITE_Data,
    output logic [31:0] READ_Data_1,
    output logic [31:0] READ_Data_2
    );
    
	reg [31:0]REG_File [31:0];
    
    assign READ_Data_1 = REG_File[READ_Addr_1];
    assign READ_Data_2 = REG_File[READ_Addr_2];
    assign REG_File[0] = 32'd0;
    
    initial begin
        for (integer k=1; k<32; k++) 
        begin
            REG_File[k] <= 32'd0;
        end
    end
    
    always @(posedge Reg_WRITE or posedge reset) 
    begin
        if (reset==1'b1)
        begin
            for (integer k=1; k<32; k++) 
            begin
                REG_File[k] <= 32'd0;
            end
        end 
        
        else if (Reg_WRITE == 1'b1) 
            REG_File[WRITE_Addr] <= WRITE_Data; 
            
    end
    
endmodule
