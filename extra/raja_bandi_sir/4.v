module tb;
reg y1,y2,y3,y4,y5,y6;
wire y7,y8;
reg a;
always #5 a = ~a;
initial begin a = 0; #200; $finish; end
always @(a) y1 = a;
always @(a) begin
 #7;
 y2 = a;
 end
always @(a)begin
 y3 = #7 a;
 end
always @(a)begin
 #7;
 y4 <= a;
 end
always @(a)begin
 y5 <= #7 a;
 end
always #7 begin
 y6 = a;
 end
assign y7 = a;
assign #7 y8 = a; 

initial
begin
	$monitor($time,"din=%b,dout=%d",din,dout);
	#100 $finish;
end
endmodule