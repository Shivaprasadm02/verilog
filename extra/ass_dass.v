module ass_dass(en,x,y);
input en;
output reg [3:0]x,y;

always@(*)
begin
if(!en)
begin
	assign x=0;
	assign y=0;
end
else 
begin
	assign x=x+1;
	assign y=y+1;
end
deassign x;
deassign y;
end
endmodule

module ass_dass_tb();
reg en;
wire [3:0]x,y;

ass_dass DUT(en,x,y);

initial
begin
en=1'b0;
#10 en=1'b1;
#100 en=1'b0;
end
initial
$monitor("en=%d,x=%d,y=%d",en,x,y);
endmodule