module num_ones_for(
    input [15:0] A,
    output reg [4:0] ones
    );

integer i;

always@(A)
begin
    ones = 0;  //initialize count variable.
    for(i=0;i<16;i=i+1)   //check for all the bits.
        if(A[i] == 1'b1)    //check if the bit is '1'
            ones = ones + 1;    //if its one, increment the count.
end

endmodule


//-------OR---------

module num_ones_for(
    input [15:0] A,
    output reg [4:0] ones
    );

integer i;

always@(A)
begin
    ones = 0;  //initialize count variable.
    for(i=0;i<16;i=i+1)   //for all the bits.
        ones = ones + A[i]; //Add the bit to the count.
end

endmodule



//------TB-----------

module tb;

    // Inputs
    reg [15:0] A;

    // Outputs
    wire [4:0] ones;

    // Instantiate the Unit Under Test (UUT)
    num_ones_for uut (
        .A(A), 
        .ones(ones)
    );

    initial begin
        A = 16'hFFFF;   #100;
        A = 16'hF56F;   #100;
        A = 16'h3FFF;   #100;
        A = 16'h0001;   #100;
        A = 16'hF10F;   #100;
        A = 16'h7822;   #100;
        A = 16'h7ABC;   #100;   
    end
      
endmodule
