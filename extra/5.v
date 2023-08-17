module clock_div(
input clk,
output clk5
); 

reg [2:0]q=3'b000;
reg toggle=0;
//wire div_clk;
//assign div_clk=q[3];

always@(posedge clk)
begin
if(q==3'b100)begin
q<=3'b000;
toggle<=~toggle;
end
else q<=q+1'b1;
end

//assign clk5=div_clk;
assign clk5=toggle;
endmodule

module div5_tb();
reg clk;
wire clk5;

clock_div DUT(clk,clk5);

initial
clk=0;

always #5 clk=~clk;

initial
begin
$monitor("clk=%b,clk5=%b,", clk,clk5);
#100 $finish;
end

endmodule