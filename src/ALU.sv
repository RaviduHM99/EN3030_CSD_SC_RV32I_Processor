`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 06:30:32 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input logic [3:0] ALUops, ///////////////////////////////////////////////////////unsigned and signed problem
    input logic [31:0] READ_Reg_1,
    input logic [31:0] READ_Data_2,
    output logic [31:0] ALU_Output,
    output logic Branch_Output
    );
    
    //Computational Instructions
    always_comb begin
        unique case(ALUops)
            4'd0 : ALU_Output = READ_Reg_1 + READ_Data_2; //ADD
            4'd1 : ALU_Output = READ_Reg_1 - READ_Data_2; //SUB
            4'd2 : ALU_Output = READ_Reg_1 << READ_Data_2; //Left Shift
            4'd3 : ALU_Output = READ_Reg_1 >> READ_Data_2; //Right Shift
            4'd4 : ALU_Output = READ_Reg_1 >>> READ_Data_2; //Shift Right Arithmetic
            4'd5 : ALU_Output = READ_Reg_1 ^ READ_Data_2; // XOR
            4'd6 : ALU_Output = READ_Reg_1 || READ_Data_2; //OR
            4'd7 : ALU_Output = READ_Reg_1 && READ_Data_2; //AND
            4'd8 : ALU_Output = READ_Reg_1 < READ_Data_2; //Less
            default : ALU_Output = 32'd0; //4'd15 for nop
        endcase
    end
    
    //Branch Instructions
    always_comb begin
    unique case(ALUops)
        4'd9 : Branch_Output = READ_Reg_1 == READ_Data_2; //Equal
        4'd10 : Branch_Output = READ_Reg_1 != READ_Data_2; //NotEqual
        4'd11 : Branch_Output = READ_Reg_1 < READ_Data_2; //Less
        4'd12 : Branch_Output = READ_Reg_1 >= READ_Data_2; // GreaterEqual
        default : Branch_Output = 1'd0; //4'd15 for nop
    endcase
    end
    
endmodule
