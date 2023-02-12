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
    input logic  [31:0] Address,
    output logic [31:0] Instruction
    );
    
    reg [7:0]mem [127:0];
    
    initial
    begin
    mem[0] = 8'h37; // lui x6, 7
    mem[1] = 8'h73; 
    mem[2] = 8'h00; 
    mem[3] = 8'h00;
    mem[4] = 8'hb7; //lui x7, 1000
    mem[5] = 8'h83;
    mem[6] = 8'h3e;
    mem[7] = 8'h00;
    mem[8] = 8'h17; //auipc x8, 2000
    mem[9] = 8'h04;
    mem[10] = 8'h7d;
    mem[11] = 8'h00;
    mem[12] = 8'h93; // addi x9, x0, -50
    mem[13] = 8'h04;
    mem[14] = 8'he0;
    mem[15] = 8'hfc;
    mem[16] = 8'h33; // sub x10, x8, x7
    mem[17] = 8'h05;
    mem[18] = 8'h74;
    mem[19] = 8'h40;
    mem[20] = 8'hb7; // lui x11, 1000000
    mem[21] = 8'h05;
    mem[22] = 8'h24;
    mem[23] = 8'hf4;        
    mem[24] = 8'h23; // sb x9, 0(x0)
    mem[25] = 8'h00;
    mem[26] = 8'h90;
    mem[27] = 8'h00;
    mem[28] = 8'ha3; // sh x7, 1(x0)
    mem[29] = 8'h10;
    mem[30] = 8'h70;
    mem[31] = 8'h00;
    mem[32] = 8'ha3; // sw x11, 3(x0)
    mem[33] = 8'h21;
    mem[34] = 8'hb0; 
    mem[35] = 8'h00; 
    mem[36] = 8'h03; // lw x12, 3(x0)
    mem[37] = 8'h26;
    mem[38] = 8'h30;
    mem[39] = 8'h00;
    mem[40] = 8'h83; // lh x13, 1(x0)
    mem[41] = 8'h16;
    mem[42] = 8'h10;
    mem[43] = 8'h00;
    mem[44] = 8'h13; // addi x14, x0, -56
    mem[45] = 8'h07;
    mem[46] = 8'h80;
    mem[47] = 8'hfc;
    mem[48] = 8'ha3; // sw x14, 7(x0)
    mem[49] = 8'h23;
    mem[50] = 8'he0;
    mem[51] = 8'h00;
    mem[52] = 8'h83; // lbu x15, 7(x0)
    mem[53] = 8'h47;
    mem[54] = 8'h70;
    mem[55] = 8'h00;
    mem[56] = 8'h03; // lhu x16, 7(x0)        
    mem[57] = 8'h58;
    mem[58] = 8'h70;
    mem[59] = 8'h00;
    mem[60] = 8'h63; // beq x6, x7, 8
    mem[61] = 8'h04;
    mem[62] = 8'h73;
    mem[63] = 8'h00;
    mem[64] = 8'h93; // slli x17, x7, 5
    mem[65] = 8'h98;
    mem[66] = 8'h53;
    mem[67] = 8'h00;
    mem[68] = 8'h63; // blt x6, x7, 12
    mem[69] = 8'h46;
    mem[70] = 8'h73;
    mem[71] = 8'h00;
    mem[72] = 8'h33; // and x20, x6, x7      
    mem[73] = 8'h7a;
    mem[74] = 8'h73;
    mem[75] = 8'h00;
    mem[76] = 8'he7;  // jalr x1, x0, 0
    mem[77] = 8'h02;
    mem[78] = 8'h00;
    mem[79] = 8'h00;
    mem[80] = 8'h33; // slt x4, x6, x7
    mem[81] = 8'h22;
    mem[82] = 8'h73;
    mem[83] = 8'h00;
    mem[84] = 8'hef; // jal x1, 72
    mem[85] = 8'hf0;
    mem[86] = 8'h5f;
    mem[87] = 8'hff;
    mem[88] = 8'h00;
    mem[89] = 8'h00;
    mem[90] = 8'h00;
    mem[91] = 8'h00;
    mem[92] = 8'h00;
    mem[93] = 8'h00;
    mem[94] = 8'h00;
    mem[95] = 8'h00;
    mem[96] = 8'h00;
    mem[97] = 8'h00;
    mem[98] = 8'h00;
    mem[99] = 8'h00;
    mem[100] = 8'h00;
    mem[101] = 8'h00;
    mem[102] = 8'h00;
    mem[103] = 8'h00;        
    mem[104] = 8'h00;
    mem[105] = 8'h00;
    mem[106] = 8'h00;
    mem[107] = 8'h00;
    mem[108] = 8'h00;
    mem[109] = 8'h00;
    mem[110] = 8'h00;
    mem[111] = 8'h00;
    mem[112] = 8'h00;
    mem[113] = 8'h00;
    mem[114] = 8'h00;
    mem[115] = 8'h00;
    mem[116] = 8'h00;
    mem[117] = 8'h00;
    mem[118] = 8'h00;
    mem[119] = 8'h00;
    mem[120] = 8'h00;
    mem[121] = 8'h00;
    mem[122] = 8'h00;
    mem[123] = 8'h00;
    mem[124] = 8'h00;
    mem[125] = 8'h00;
    mem[126] = 8'h00;
    mem[127] = 8'h00;
    end
    
    assign Instruction = {mem[Address[6:0] + 6'd3], mem[Address[6:0] + 6'd2], mem[Address[6:0] + 6'd1], mem[Address[6:0]]};

endmodule
