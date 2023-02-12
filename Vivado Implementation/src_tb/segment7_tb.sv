module segment7_tb;

    reg [3:0] bcd;
    wire [6:0] dig;
    integer i;

    // Instantiate the Unit Under Test (UUT)
    segment7 uut (
        .bcd(bcd), 
        .dig(dig)
    );

//Apply inputs
    initial begin
        for(i = 0;i < 16;i = i+1) //run loop for 0 to 15.
        begin
            bcd = i; 
            #10; //wait for 10 ns
        end     
    end
      
endmodule