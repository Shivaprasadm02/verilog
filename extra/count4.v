module top(clk,reset,x,y);
input clk,reset;
output reg [3:0] x,y;

always @(posedge clk)
    begin
        if(reset)
                {x,y} <= 0 ; 
        else
            begin
                x <= x+1;
                y <= 0;
            end
		if(x==3)
		begin
		x<=x;
		y<=y+1;
		end
		else if (y==3)
		begin
		y<=y;
		x<=x+1;
		end
    end

endmodule

module tb();
reg clk,rst;
wire [3:0]x,y;

parameter CYCLE = 10;

top DUT(clk,rst,x,y);

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
#500 $finish;
end

initial
$monitor("x=%d,y=%d",x,y);

endmodule