module SEGMENT_7_INTERFACE(
   	input logic [31:0] data,
	output reg [6:0] dig_arr [7:0]
   	);
    
   	reg [3:0] bcd_arr [7:0];
	
	assign bcd_arr[0] = data[3:0];
	assign bcd_arr[1] = data[7:4];
	assign bcd_arr[2] = data[11:8];
	assign bcd_arr[3] = data[15:12];
	assign bcd_arr[4] = data[19:16];
	assign bcd_arr[5] = data[23:20];
	assign bcd_arr[6] = data[27:24];
	assign bcd_arr[7] = data[31:28];

	segment7 segment7_0(
		.bcd(bcd_arr[0]),
		.dig(dig_arr[0])
	);
	segment7 segment7_1(
		.bcd(bcd_arr[1]),
		.dig(dig_arr[1])
	);
	segment7 segment7_2(
		.bcd(bcd_arr[2]),
		.dig(dig_arr[2])
	);
	segment7 segment7_3(
		.bcd(bcd_arr[3]),
		.dig(dig_arr[3])
	);
	segment7 segment7_4(
		.bcd(bcd_arr[4]),
		.dig(dig_arr[4])
	);
	segment7 segment7_5(
		.bcd(bcd_arr[5]),
		.dig(dig_arr[5])
	);
	segment7 segment7_6(
		.bcd(bcd_arr[6]),
		.dig(dig_arr[6])
	);
	segment7 segment7_7(
		.bcd(bcd_arr[7]),
		.dig(dig_arr[7])
	);
    

endmodule
