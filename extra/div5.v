module div5(clk,rst,q);
input clk,rst;
output reg [2:0]q=0; 

reg newclk;
reg [2:0]count;

always@(posedge clk)
begin
if(rst)
count<=0;
else count<=count+1'b1;

newclk=count[2];
$display("newclk=%b",newclk);
$display("count=%b",count);
end

always@(posedge newclk)
begin
if(rst)
q<=0;
else q<=q+1;

end

endmodule


module div5_tb();
reg clk=0,rst;
wire [2:0]count;

parameter cycle=10;

div5 DUT(clk,rst,q);

always #(cycle/2)clk=~clk;

task reset();
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

initial
begin
reset();
#100 $finish;
end

initial
$monitor("clk=%b,rst=%b,q=%b", clk,rst,q);
endmodule