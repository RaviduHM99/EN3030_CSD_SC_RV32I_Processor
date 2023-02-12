`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2023 09:52:28 PM
// Design Name: 
// Module Name: Control_FSM
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


module Control_FSM(
        input logic [9:0] INST,////{Instruction[14:12], Instruction[6:0]}
        output logic REG_READ_Ctrl_1, output logic REG_READ_Ctrl_2,
        output logic ALU_IN_CTRL,
        output logic [2:0]ALU_OUT_CTRL,
        output logic [2:0] ALU_INST,
        output logic [2:0] IMM_CTRL,
        output logic Reg_WRITE,
        output logic write_enable, output logic read_enable, output logic [2:0] mem_type,
        output logic [1:0] CTRL_BRANCH
    );
    
    always @(*) begin
        case(INST[6:0])
            7'b0110111 : begin //LUI
                {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b000000; //REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL
                ALU_INST = 3'd0; //ALU_INST
                {mem_type, read_enable, write_enable} = 5'b00000; //mem_type, read_enable, write_enable
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b1011;//Reg_WRITE, ALU_OUT_CTRL
                CTRL_BRANCH = 2'b00;//CTRL_BRANCH
            end
            7'b0010111 : begin //AUIPC
                {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b000000; 
                ALU_INST = 3'd0;
                {mem_type, read_enable, write_enable} = 5'b00000;
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b1010;
                CTRL_BRANCH = 2'b00;
            end
            7'b1101111 : begin //JAL
                {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b000010;
                ALU_INST = 3'd0;
                {mem_type, read_enable, write_enable} = 5'b00000;
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b1101;
                CTRL_BRANCH = 2'b01;
            end
            7'b1100111 : begin //JALR
                {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b100101;
                ALU_INST = 3'd1;
                {mem_type, read_enable, write_enable} = 5'b00000;
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b1101;
                CTRL_BRANCH = 2'b10;
            end
            7'b1100011 : begin //SB
                {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b111100;
                ALU_INST = 3'd3;
                {mem_type, read_enable, write_enable} = 5'b00000;
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b0111;
                CTRL_BRANCH = 2'b11;
            end
            7'b0000011 : begin //I-LOAD
                {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b101001;
                ALU_INST = 3'd1;
                unique case(INST[9:7])
                  3'b000 : {mem_type, read_enable, write_enable} = 5'b00010;
                  3'b001 : {mem_type, read_enable, write_enable} = 5'b00110;
                  3'b010 : {mem_type, read_enable, write_enable} = 5'b01010;
                  3'b100 : {mem_type, read_enable, write_enable} = 5'b10010;
                  3'b101 : {mem_type, read_enable, write_enable} = 5'b11010;
                  default : {mem_type, read_enable, write_enable} = 5'dx; // To avoid latches
                endcase
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b1001;
                CTRL_BRANCH = 2'b00;
            end
            7'b0100011 : begin //S
                {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b110111;
                ALU_INST = 3'd1;
                unique case(INST[9:7])
                  3'b000 : {mem_type, read_enable, write_enable} = 5'b00001;
                  3'b001 : {mem_type, read_enable, write_enable} = 5'b00101;
                  3'b010 : {mem_type, read_enable, write_enable} = 5'b01001;
                  default : {mem_type, read_enable, write_enable} = 5'dx; // To avoid latches
                endcase
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b0111;
                CTRL_BRANCH = 2'b00;

            end
            7'b0010011 : begin //I-ALU
                unique case(INST[9:7])
                    3'b001 : {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b101011;
                    3'b101 : {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b101011;
                    default: {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b101011;
                endcase
                ALU_INST = 3'd2;
                {mem_type, read_enable, write_enable} = 5'b00000;
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b1000;
                CTRL_BRANCH = 2'b00;
            end
            7'b0110011 : begin //R
                {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL} = 6'b111110;
                ALU_INST = 3'd4;
                {mem_type, read_enable, write_enable} = 5'b00000;
                {Reg_WRITE, ALU_OUT_CTRL} = 4'b1000;
                CTRL_BRANCH = 2'b00;
            end
            default : {REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL, ALU_INST, mem_type, read_enable, write_enable, Reg_WRITE, ALU_OUT_CTRL, CTRL_BRANCH} = 32'dx;// To avoid latches
        endcase         
    end
    
   
   
endmodule
