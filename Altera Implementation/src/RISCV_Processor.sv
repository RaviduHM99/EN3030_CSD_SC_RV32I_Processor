`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2023 10:29:03 AM
// Design Name: 
// Module Name: RISCV_Processor
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


module RISCV_Processor(  
    input logic reset,
    input logic clk,
    output logic [31:0] PC_out, 
    output logic [31:0] ALU_Output /////////////// This goes to LED Pin
    );
    
    logic [31:0] read_data;
    logic [31:0] READ_Data_1;
    logic [31:0] READ_Data_2;
    logic [2:0] IMM_CTRL;
    logic [2:0] ALU_INST;
    logic ALU_IN_CTRL;
    logic [1:0] CTRL_BRANCH;
    logic write_enable;
    logic [2:0] mem_type;
    logic read_enable;
    logic [2:0] ALU_OUT_CTRL;
    logic [4:0] READ_Addr_1;
    logic [4:0] READ_Addr_2;
    logic [31:0] Imm_Gen;
    logic [3:0] ALUops;
    logic [31:0] ALU_In;
    logic [31:0] PC_4;
    logic [31:0] PC_Imm;
    logic Branch_Output;
    logic Reg_WRITE;
    logic [1:0] PC_Sel;
    logic [31:0] WRITE_Data;
    logic [31:0] PC_in; 

    Program_Counter PC (.clk(clk), .reset(reset), .PC_in(PC_in), .PC_out(PC_out));

    logic [31:0] Instruction;
    INST_MEMORY INS_MEM(.Address(PC_out[6:0]), .Instruction(Instruction));
    
    logic REG_READ_Ctrl_1;
    logic REG_READ_Ctrl_2;

    Reg_File_Input RFI(.Reg_Addr_1(Instruction[19:15]), .Reg_Addr_2(Instruction[24:20]), .REG_READ_Ctrl_1(REG_READ_Ctrl_1),
    .REG_READ_Ctrl_2(REG_READ_Ctrl_2),
    .READ_Addr_1(READ_Addr_1), .READ_Addr_2(READ_Addr_2));
    
            
    Register_File RF(.Reg_WRITE(Reg_WRITE), .reset(reset), .clk(clk), .READ_Addr_1(READ_Addr_1), .READ_Addr_2(READ_Addr_2),
    .WRITE_Addr(Instruction[11:7]), .WRITE_Data(WRITE_Data),
    .READ_Data_1(READ_Data_1), .READ_Data_2(READ_Data_2)); 
    
    Immediate_Generation IG(.INST(Instruction), .IMM_CTRL(IMM_CTRL), .Imm_Gen(Imm_Gen));
           
    ALU_CU ALUCU(.ALU_INST(ALU_INST), .INST({Instruction[30],Instruction[14:12]}), .ALUops(ALUops));
           
    ALU_InMux ALU_IN_dut(.ALU_IN_CTRL(ALU_IN_CTRL), .Imm(Imm_Gen), .REG_READ(READ_Data_2), .ALU_In(ALU_In));
               
    PC_Inc PCI(.PC(PC_out), .Imm_Out(Imm_Gen), .PC_4(PC_4), .PC_Imm(PC_Imm));
      
    ALU ALU_dut(.ALUops(ALUops), .READ_Reg_1(READ_Data_1), .READ_Imm_Data_2(ALU_In),
    .ALU_Output(ALU_Output), .Branch_Output(Branch_Output));  
    
    Branch_Logic_Unit BLU(.PC_Sel(PC_Sel), .BRANCH_LOGIC(Branch_Output), .CTRL_BRANCH(CTRL_BRANCH));
    
    PC_Mux PCM(.PC_Sel(PC_Sel), .PC_4(PC_4), .PC_Imm(PC_Imm), .ALU_JALR(ALU_Output), .PC_IN(PC_in));
               
    ALU_OutMux ALU_Out(.ALU_OUT_CTRL(ALU_OUT_CTRL), .MEM_READ(read_data), .ALU_OUT(ALU_Output),
    .PC_Imm(PC_Imm), .PC_4(PC_4), .Imm(Imm_Gen), .REG_WRITE(WRITE_Data) ); 
                  
    DATA_MEMORY DM(.address(ALU_Output[3:0]), .clk(clk), .reset(reset),
    .write_data(READ_Data_2), .write_enable(write_enable),
    .mem_type(mem_type), .read_enable(read_enable), .read_data(read_data));
     
    Control_FSM CFSM(.INST({Instruction[14:12], Instruction[6:0]}),
             .REG_READ_Ctrl_1(REG_READ_Ctrl_1),
             .REG_READ_Ctrl_2(REG_READ_Ctrl_2),
             .ALU_IN_CTRL(ALU_IN_CTRL),
             .ALU_OUT_CTRL(ALU_OUT_CTRL),
             .ALU_INST(ALU_INST),
             .IMM_CTRL(IMM_CTRL),
             .Reg_WRITE(Reg_WRITE),
             .write_enable(write_enable), .read_enable(read_enable), .mem_type(mem_type),
             .CTRL_BRANCH(CTRL_BRANCH)
         );
          

endmodule
