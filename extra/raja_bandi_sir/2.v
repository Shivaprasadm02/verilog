module seq(input i,clk, output y);
reg a=0;
integer m;
always @(posedge i)
begin
repeat(5)
	begin
	@(posedge clk)
	a=0;
	end
@(posedge clk)
a=1;
@(posedge clk)	
a=0;
@(posedge clk)
a=1;
@(posedge clk)
a=0;
end

assign y=a;
endmodule


module seq_tb();
reg clk,i;
wire y;

seq dut(i,clk,y);

always
begin
#5 clk=1'b0;
#5 clk=1'b1;
end

initial begin
#10 i=1;
#10 i=0;
#20 i=1;
#30 i=0;
#100 i=1;
#10 i=0;
end

initial
begin
	$monitor($time,"clk=%b,i=%b,y=%b",clk,i,y);
	#200 $finish;
end

endmodule


/*
module two(input clk,rst,i,output y);
reg dout;
always@(posedge clk)
begin
dout=1'b0;
	if(i==1)
	begin
	repeat(5)
	@(posedge clk);
		dout=1;
	@(posedge clk);
		dout=0;
	@(posedge clk);
		dout=1;
	end
end
assign y=dout;
//$display($time,"clk=%b,dout=%b",clk,dout);
endmodule

module tb;
	reg clk,rst,i;
	wire y;

two DUT(clk,rst,i,y);

initial
clk=0;
always #5 clk=~clk;

initial
begin
i=1'b0;
end

initial
begin
	$monitor($time,"clk=%b,i=%b,y=%b",clk,i,y);
	#100 $finish;
end

endmodule
*/