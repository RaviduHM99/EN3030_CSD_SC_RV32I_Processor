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
        input logic [31:0] INST,
        output logic REG_READ_Ctrl_1, output logic REG_READ_Ctrl_2, output logic REG_WRITE_Ctrl,
        output logic ALU_IN_CTRL,
        output logic ALU_OUT_CTRL,
        output logic [3:0] ALU_INST,
        output logic [3:0] IMM_CTRL,
        output logic pc_clk, output logic reset,
        output logic Reg_WRITE,
        output logic write_enable, output logic read_enable
    );
    
    typedef enum {FETCH, DECODE, EXECUTE, MEMORY, WRITEBACK} state_type;
    state_type state;
    
    always@(posedge clk) begin
        if (state == FETCH)
            begin
                state <= DECODE;
            end
            
        if (state == DECODE) 
            begin 
                unique case(INST[6:0])
                    7'b0110111 : next_state <= EXECUTE;
                    7'b0010111 : next_state <= EXECUTE;
                    7'b1101111 : next_state <= EXECUTE;
                    7'b1100111 : next_state <= EXECUTE;
                    7'b1100011 : next_state <= EXECUTE;
                    7'b0000011 : next_state <= EXECUTE;
                    7'b0100011 : next_state <= EXECUTE;
                    7'b0010011 : next_state <= EXECUTE;
                    7'b0110011 : next_state <= EXECUTE;
                endcase         
            end
            
       if (state == EXECUTE) 
            begin
                unique case(INST[6:0])
                    7'b0110111 : 
                    7'b0010111 : 
                    7'b1101111 : 
                    7'b1100111 :
                    7'b1100011 :
                    7'b0000011 :
                    7'b0100011 :
                    7'b0010011 :
                    7'b0110011 :
                endcase
                next_state <= MEMORY;
            end
            
      if (state == MEMORY) 
            begin
            unique case(INST[6:0])
                                7'b0110111 : 
                                7'b0010111 : 
                                7'b1101111 : 
                                7'b1100111 :
                                7'b1100011 :
                                7'b0000011 :
                                7'b0100011 :
                                7'b0010011 :
                                7'b0110011 :
                            endcase
                if (mem_write) begin
                    data_memory <= alu_result;
                end
                if (mem_read) begin
                    register_file <= data_memory;
                end
                next_state <= WRITEBACK;
            end
            
      if (state == DECODE)
            begin
                register_file <= alu_result;
                next_state <= FETCH;
            end
            default: begin
                next_state <= FETCH;
            end
        endcase
            end

endmodule
