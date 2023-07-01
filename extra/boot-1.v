module A ( );
/*
reg [8:0] a;
initial
begin
a='oz1;
$display("%0b",a);
end
///////////
reg signed [3:0] a = -4;
reg signed [3:0] b = 4;
initial
begin
$display("Value of a=%b",a);
a = a >>> 1;
b = b >>> 1;
$display("Value of a=%b",a);
$display("Value of b=%b",b);
end
////////
reg [7:0] a;
wire b;

assign b = ~|a;

initial
begin
a=8'b00111001;
#2;
a = {a[5:3],{3{b}}};
#10;
$display("Value of a=%b",a);
$display("Value of b=%b",b);
end
*/
//////////
/*
reg a=1'b1;
wire [1:0] y;
assign y=(a==2'b01);
reg [7:0] X=8'b10101101;
initial
begin
$display("Value of a=%b",X);
X<=X>>1;
X[0]<=X[7];
$display("Value of a=%b",X);
$display("Value of a=%b",y);
end
*/
///////
/*
//////
"What is the sythesis module of the following snippet assuming all variables are declared?

always@(posedge clk1 or negedge clk2)
begin
if(~clk2 && a)
dout<=0;
else
dout<= din;
end"
//////////////its not synthesizable as a is level trigerred and its not in the sensitivity list////////////

reg a=1'b1;
wire [1:0] y;
assign y=(a==2'b01);

reg b=1'b1;
wire [1:0] c;
assign c=(b==2'b01);
initial
begin
$display("Value of c=%b",c);
$display("Value of y=%b",y);
end


///////////
reg [3:0] a, b, c;
reg [4:0] d;
initial
begin
$display("c=%0b", c?(a&b):d);
a=11;
b=15;
c=1;
#10 c=0;
$display("c=%0b", c?(a&b):d);
end



////
reg [5:0] a, b, c, d;
initial
begin
a=10;
b=20;
#10 c=#5 a;
d=b;
#20 b=(d|b);

$monitor("Value of a=%b,b=%d,c=%d,d=%d",a,b,c,d);
$finish;
end
////////////////////////

reg [3:0] y;
reg [3:0]a=4'b1010;
reg [3:0]b=3'b11x;

initial
begin
y=a&&b;
$display("y=%b",y);
end

///////////////////////////////////////
reg [4:0] y;
y= 3'bx01 what is the value in y?"
*/

reg [1:0] a;
initial
begin
a = -10%3;
$display("%0b”,a);
endmodule