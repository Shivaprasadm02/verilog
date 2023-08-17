
module top(clk,rst,x,y);
input clk,rst;
output reg [3:0]x,y;

always@(posedge clk)
begin
	if(rst)
	begin
		x=0;
		y=1;
	end
	else y<=y+1;
end
always@(posedge clk)
begin
	if(y%3==0)
		x<=x+1;
	else x<=x;
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
#20 rst=1'b0;
#100 $finish;
end

initial
$monitor("x=%d,y=%d",x,y);

endmodule
/*

module top(clk,rst,x,y);
input clk,rst;
output [3:0]x;
output reg [3:0]y;
reg [3:0]count;


always@(posedge clk)
begin
	if(rst)
	begin
		//x=0;
		y=1;
		count=0;
	end
	else 
		y=y+1;
		
	count<=y;
	
	//if(count%3==0)
		//x<=x+1;	
	//else x<=x;
	
end
assign x=(count%3==0)?(x+1'b1):(x+1'b0);
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
x=1'b0;
#20 rst=1'b0;
#100 $finish;
end

initial
$monitor("x=%d,y=%d",x,y);

endmodule
*/