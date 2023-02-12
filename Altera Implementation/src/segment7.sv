//Verilog module.
module segment7(
     bcd,
     dig
    );
     
     //Declare inputs,outputs and internal variables.
     input [3:0] bcd;
     output [6:0] dig;
     reg [6:0] dig;

//always block for converting bcd digit into 7 segment format
    always @(bcd)
    begin
        case (bcd) //case statement
            0  : dig = 7'b1000000;
            1  : dig = 7'b1111001;
            2  : dig = 7'b0100100;
            3  : dig = 7'b0110000;
            4  : dig = 7'b0011001;
            5  : dig = 7'b0010010;
            6  : dig = 7'b0000010;
            7  : dig = 7'b1111000;
            8  : dig = 7'b0000000;
            9  : dig = 7'b0010000;
			'hA: dig = 7'b0001000;
			'hB: dig = 7'b0000011;
			'hC: dig = 7'b1000110;
			'hD: dig = 7'b0100001;
			'hE: dig = 7'b0000110;
			'hF: dig = 7'b0001110;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : dig = 7'b1111111; 
        endcase
    end
    
endmodule