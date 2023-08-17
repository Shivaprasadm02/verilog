module updown(input clk,rst,output reg [2:0] cnt);
/*
always@(posedge clk)
begin
	if(rst)
		cnt=3'b000;
	else if(cnt==1'b0)
		cnt<=cnt+1'b1;
	else if (cnt==3'd7)
		cnt<=cnt-1'b1;
	else cnt<=cnt;
	//else if(cnt==3'd4)
	//	@(posedge clk);
		//cnt<=cnt-1;
end
*/
always@(posedge clk)
begin
	if(rst)
		cnt<=3'b000;
	else if(cnt==3'd6)
		cnt<=3'b000;
	else cnt<=cnt+1'b1;
	//else if(cnt==3'd4)
	//	@(posedge clk);
		//cnt<=cnt-1;
end

endmodule

module tb_counter;

    reg clk,rst;
    wire [2:0] count;

    updown DUT(clk,rst,cnt);

initial
begin
	clk=0;
	rst=1;
	#20 rst=0;
	#200 $finish;
end

always #5 clk=~clk;

initial
	$monitor("clk=%b,count=%d",clk,cnt);
	
endmodule