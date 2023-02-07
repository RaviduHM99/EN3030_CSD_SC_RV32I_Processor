`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2023 10:09:23 PM
// Design Name: 
// Module Name: DATA_MEMORY
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


module DATA_MEMORY(
  input logic [31:0] address,
  input logic [31:0] write_data,
  input logic write_enable,
  input logic [2:0] mem_type, // byte, halfword, word and signed, unsigned
  input logic read_enable,
  output logic [31:0] read_data
);

  reg [7:0]mem [9:0];

  initial begin
    for (int i = 0; i < 9; i++)
      mem[i] = 0;
  end

  always @(posedge write_enable) begin
    unique case(mem_type)
        3'b000 : mem[address] = write_data[7:0]; //byte
        3'b001 : begin //halfword
            mem[address] = write_data[7:0];
            mem[address + 1] = write_data[15:8]; 
        end
        3'b010 : begin //word
            mem[address] = write_data[7:0];
            mem[address + 1] = write_data[15:8]; 
            mem[address + 2] = write_data[23:16]; 
            mem[address + 3] = write_data[31:24]; 
        end
        default: mem[address] = write_data;
    endcase
    end

  always @(posedge read_enable) begin
    unique case(mem_type)
        3'b000 : read_data = 32'(signed'(mem[address])); //byte
        3'b100 : read_data = 32'(unsigned'(mem[address])); //unsigned byte
        3'b001 : read_data = 32'(signed'({mem[address + 1], mem[address]})); //halfword
        3'b110 : read_data = 32'(unsigned'({mem[address + 1], mem[address]})); //unsigned halfword
        3'b010 : read_data = 32'(signed'({mem[address + 3], mem[address + 2], mem[address + 1], mem[address]})); //word
        default: read_data = 32'(signed'(mem[address]));
    endcase
  end

endmodule