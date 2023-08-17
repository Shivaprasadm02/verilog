//`define m 10
module mod_n#(parameter N=5,width=3)(clk,rst,count);
//parameter n=10;
input clk,rst;
//output reg [(`m-1):0]count;
output reg [(width-1):0]count;
 always@(posedge clk)
 begin
  if(rst)
   count<=4'd0;
   else if(count==N-1)
   count<=4'd0;
   else
   count<=count+1'b1;
 end
endmodule

module mod_n_tb();
parameter N=12,width=4;
reg clk,rst;
wire [(width-1):0]count;

mod_n#(N,width) DUT(clk,rst,count);

initial
begin
	clk=0;
	rst=1;
	#20 rst=0;
	#200 $finish;
end

always #5 clk=~clk;

initial
	$monitor("count=%d",count);
	
endmodule