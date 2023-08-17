module up_down_count(clk,rst,count);
input clk,rst;
reg mode=0;
output reg [3:0]count;
always @(posedge clk)
begin
	if(rst)
		count <= 4'b0000;
	else
	begin
	case(mode)
		1'b0 : count <= count + 1;
		1'b1 : count <= count - 1;
	endcase
	//deassign count;
	end
end

always@(posedge clk)
begin

if(count==4'd6)
mode<=1;
else if(count==4'd0)
mode<=0;

else if(count==4'd5 && mode==1'b1)
begin
//assign count=4'd4;
@(posedge clk) count<=4;
@(posedge clk) count<=count-1;
$display("in loop");
end
end

endmodule


module up_down_count_tb;

reg clk,rst;
wire [3:0]count;
parameter cycle = 10;

up_down_count DUT(clk,rst,count);

always
begin
#(cycle/2);
   clk = 1'b0;
#(cycle/2);
   clk = 1'b1;
end

task rst_t;
begin
@(negedge clk);
 rst = 1'b1;
@(negedge clk);
rst = 1'b0;
end
endtask

initial
begin
rst_t;
#200;
$finish;
end

initial
 $monitor($time,"reset=%b,count=%d",rst,count);
 
endmodule
