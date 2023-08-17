module top(clk,reset,i,y);
input clk,reset,i;
output reg  y;

always @(posedge clk)
    begin
        if(reset)
            y <= 0 ; 
		else y<=i;
    end
endmodule

module tb();
reg clk,rst,i;
wire y;

parameter CYCLE = 10;

top DUT(clk,rst,i,y);

always
begin
	 #(CYCLE/2);
	 clk = 1'b0;
	 #(CYCLE/2);
	 clk=~clk;
      end
initial
begin
rst=1'b1;
#10 rst=1'b0;
i=1'b0;
#2 i=1'b0;
#2 i=1'b1;
#2 i=1'b0;
repeat(5)
#2 i=1'b0;
#300 $finish;
end

initial
$monitor($time,"clk=%b,i=%d,y=%d",clk,i,y);

endmodule