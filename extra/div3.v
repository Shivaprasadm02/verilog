module clock_div(clk,clk2,clk3,clk4);
input clk;
output clk2,clk3,clk4; 

reg [3:0]q=4'b0000;
reg [1:0]b=2'b00;

always@(posedge clk)
begin
	q=q+1'b1;
end

assign clk2=q[0];
assign clk4=q[1];

always@(posedge clk)
begin
 b=b+1'b1;
 if(b==2'b11)
 b=0;
end

assign clk3=b[1];

endmodule

module div5_tb();
reg clk;
wire clk2,clk3,clk4;

clock_div DUT(clk,clk2,clk3,clk4);

initial
clk=0;

always #5 clk=~clk;

initial
begin
$monitor("clk=%b,clk2=%b,clk3=%b,clk4=%b", clk,clk2,clk3,clk4);
#100 $finish;
end

endmodule