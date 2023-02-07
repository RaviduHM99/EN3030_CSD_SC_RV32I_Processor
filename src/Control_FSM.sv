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
        input logic clk,
        input logic rst,
        input logic [31:0] INST,
        output logic REG_READ_Ctrl_1, output logic REG_READ_Ctrl_2,
        output logic ALU_IN_CTRL,
        output logic [2:0]ALU_OUT_CTRL,
        output logic [3:0] ALU_INST,
        output logic [3:0] IMM_CTRL,
        output logic pc_clk, output logic reset,
        output logic Reg_WRITE,
        output logic write_enable, output logic read_enable, output logic [2:0] mem_type,
        output logic [1:0] CTRL_BRANCH
    );
    
    typedef enum {FETCH, DECODE, EXECUTE, MEMORY, WRITEBACK} state_type;
    state_type state;
    
    logic [23:0] CTRL_SIGNAL;
    
    assign {write_enable, read_enable, pc_clk, REG_READ_Ctrl_1, REG_READ_Ctrl_2, IMM_CTRL, ALU_IN_CTRL, ALU_INST,
    mem_type, reset, Reg_WRITE, ALU_OUT_CTRL, CTRL_BRANCH} = CTRL_SIGNAL; // IMM_CTRL-4, ALU_INST-4, CTRL_BRANCH-2

  
    always @(posedge clk or posedge rst)
    begin
        if (rst == 1'b1) begin
            CTRL_SIGNAL[6] <= 1'b1; 
            state <= FETCH;
        end
        else begin
            if (state == FETCH)
                begin
                    CTRL_SIGNAL[21] <= 1'b0;
                    state <= DECODE;
                end
                
            if (state == DECODE) 
                begin 
                    unique case(INST[6:0])
                        7'b0110111 : begin //LUI
                            CTRL_SIGNAL[20:14] <= 7'b0000000;
                            state <= MEMORY;
                        end
                        7'b0010111 : begin //AUIPC
                            CTRL_SIGNAL[20:14] <= 7'b0000010;
                            state <= MEMORY;
                        end
                        7'b1101111 : begin //JAL
                            CTRL_SIGNAL[20:14] <= 7'b0000100;
                            state <= MEMORY;
                        end
                        7'b1100111 : begin //JALR
                            CTRL_SIGNAL[20:14] <= 7'b1000111;
                            state <= EXECUTE;
                        end
                        7'b1100011 : begin //SB
                            CTRL_SIGNAL[20:14] <= 7'b1101110;
                            state <= EXECUTE;
                        end
                        7'b0000011 : begin //I-LOAD
                            CTRL_SIGNAL[20:14] <= 7'b1001011;
                            state <= EXECUTE;
                        end
                        7'b0100011 : begin //S
                            CTRL_SIGNAL[20:14] <= 7'b1101001;
                            state <= EXECUTE;
                        end
                        7'b0010011 : begin //I-ALU
                            unique case(INST[14:12])
                                3'b001 : CTRL_SIGNAL[20:14] <= 7'b1001100;
                                3'b101 : CTRL_SIGNAL[20:14] <= 7'b1001100;
                                default: CTRL_SIGNAL[20:14] <= 7'b1001101;
                            endcase
                            state <= EXECUTE;
                        end
                        7'b0110011 : begin //R
                            CTRL_SIGNAL[20:14] <= 7'b1111110;
                            state <= EXECUTE;
                        end
                    endcase         
                end
                
           if (state == EXECUTE) 
            begin 
            unique case(INST[6:0])
                7'b1100111 : begin //JALR
                    CTRL_SIGNAL[13:10] <= 4'd3;
                    state <= MEMORY;
                end
                7'b1100011 : begin //SB
                    CTRL_SIGNAL[13:10] <= 4'd7;
                    state <= MEMORY;
                end
                7'b0000011 : begin //I-LOAD
                    CTRL_SIGNAL[13:10] <= 4'd5;
                    state <= MEMORY;
                end
                7'b0100011 : begin //S
                    CTRL_SIGNAL[13:10] <= 4'd4;
                    state <= MEMORY;
                end
                7'b0010011 : begin //I-ALU
                    CTRL_SIGNAL[13:10] <= 4'd6;
                    state <= MEMORY;
                end
                7'b0110011 : begin //R
                    CTRL_SIGNAL[13:10] <= 4'd8;
                    state <= MEMORY;
                end
            endcase         
            end
                
          if (state == MEMORY) 
           begin 
                unique case(INST[6:0])
                  7'b0110111 : CTRL_SIGNAL[1:0] <= 2'b00; //LUI
                  7'b0010111 : CTRL_SIGNAL[1:0] <= 2'b00; //AUIPC
                  7'b1101111 : CTRL_SIGNAL[1:0] <= 2'b01; //JAL
                  7'b1100111 : CTRL_SIGNAL[1:0] <= 2'b10; //JALR
                  7'b1100011 : CTRL_SIGNAL[1:0] <= 2'b11; //SB
                  7'b0000011 : begin //I-LOAD
                      CTRL_SIGNAL[1:0] <= 2'b00;
                      unique case(INST[14:12])
                      3'b000 : {CTRL_SIGNAL[23:22], CTRL_SIGNAL[9:7]} <= 5'b01000;
                      3'b001 : {CTRL_SIGNAL[23:22], CTRL_SIGNAL[9:7]} <= 5'b01001;
                      3'b010 : {CTRL_SIGNAL[23:22], CTRL_SIGNAL[9:7]} <= 5'b01010;
                      3'b100 : {CTRL_SIGNAL[23:22], CTRL_SIGNAL[9:7]} <= 5'b01100;
                      3'b101 : {CTRL_SIGNAL[23:22], CTRL_SIGNAL[9:7]} <= 5'b01110;
                      endcase
                  end
                  7'b0100011 : begin //S
                      CTRL_SIGNAL[1:0] = 2'b00;
                      unique case(INST[14:12])
                      3'b000 : {CTRL_SIGNAL[23:22], CTRL_SIGNAL[9:7]} <= 5'b10000;
                      3'b001 : {CTRL_SIGNAL[23:22], CTRL_SIGNAL[9:7]} <= 5'b10001;
                      3'b010 : {CTRL_SIGNAL[23:22], CTRL_SIGNAL[9:7]} <= 5'b10010;
                      endcase
                  end
                  7'b0010011 : CTRL_SIGNAL[1:0] <= 2'b00; //I-ALU
                  7'b0110011 : CTRL_SIGNAL[1:0] <= 2'b00; //R
              endcase 
              state <= WRITEBACK;        
          end  
          if (state == WRITEBACK)
            begin
                CTRL_SIGNAL[21] = 1'b1;
                unique case(INST[6:0])
                    7'b0110111 : CTRL_SIGNAL[5:2] <= 4'b1011; //LUI
                    7'b0010111 : CTRL_SIGNAL[5:2] <= 4'b1010; //AUIPC
                    7'b1101111 : CTRL_SIGNAL[5:2] <= 4'b1101; //JAL
                    7'b1100111 : CTRL_SIGNAL[5:2] <= 4'b1101; //JALR
                    7'b1100011 : CTRL_SIGNAL[1:0] <= 4'b0111; //SB
                    7'b0000011 : CTRL_SIGNAL[5:2] <= 4'b1001; //I-LOAD
                    7'b1100011 : CTRL_SIGNAL[1:0] <= 4'b0111; //S
                    7'b0010011 : CTRL_SIGNAL[5:2] <= 4'b1000; //I-ALU
                    7'b0110011 : CTRL_SIGNAL[5:2] <= 4'b1000; //R
                endcase 
                state <= FETCH;
           end
        end // else begin
        CTRL_SIGNAL[6] <= 1'b0;        
    end  
endmodule
