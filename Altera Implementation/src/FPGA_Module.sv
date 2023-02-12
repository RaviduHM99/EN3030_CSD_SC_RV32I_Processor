`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2023 01:06:30 AM
// Design Name: 
// Module Name: FPGA_Module
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


module FPGA_Module(
    input logic clk,
    input logic reset,
    input logic output_switch,
    output reg [6:0] Dig_Arr [7:0]
    );
    
    logic clk_1Hz;
    
    clk_divider cd_dut(.clock_in(clk), .clock_out(clk_1Hz));
    
    logic [31:0] PC_out;
    logic [31:0] ALU_Output;
    
    RISCV_Processor RV32I_Core(.reset(reset),
        .clk(clk_1Hz),
        .PC_out(PC_out), 
        .ALU_Output(ALU_Output) /////////////// This goes to LED Pin
        );
    
    logic [31:0] Seg_IN;
    
    Processor_Out_Mux POM_dut(
        .switch(output_switch),
        .ALU_Output(ALU_Output),
        .PC_out(PC_out),
        .Seg_IN(Seg_IN)
        );
     
    SEGMENT_7_INTERFACE SEG_dut(
        .data(Seg_IN),
        .dig_arr(Dig_Arr)
        );
endmodule
