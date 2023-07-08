module A ( );
//-----1------------//
reg [8:0] a;
initial
begin
a='oz1;
$display("%0b",a);
end
//output -> z001

//----------2--------//
reg signed [3:0] a = -4;  //a=1100
reg signed [3:0] b = 4;   //b=0100
initial
begin
$display("Value of a=%b",a);
a = a >>> 1;
b = b >>> 1;
$display("Value of a=%b",a);
$display("Value of b=%b",b);
end
//output ->
//Value of a=1100;
//Value of a=1110;
//Value of a=0010;

//-----------3----------//
reg [7:0] a;
wire b;

assign b = ~|a;//nor operation i.e 1 for only 00

initial
begin
a=8'b00111001;//b=~(0|0|1|1|1|0|0|1)=~1=0
//if atleast 1no of 1's present then or operation is 1
#2;
a = {a[5:3],{3{b}}};
//_ _ _ _ _ _ _ _ , last 3 is b nxt 3 is a[5:3],remaining i.e fsrt 2 is prev val i.e 00
#10;
$display("Value of a=%b",a);
$display("Value of b=%b",b);
end
//output ->
//Value of a=00111000;
//Value of b=0;

//--------------4-----------//
reg a=1'b1;
wire [1:0] y;
assign y=(a==2'b01);//a is 1'b1 which is equal to 2'b01 thus y is true
reg [7:0] X=8'b10101101;
initial
begin
$display("Value of a=%b",X);
X<=X>>1;//it occurs in NBA region so doesn't reflects in dispy
X[0]<=X[7];
$display("Value of a=%b",X);//as its $display it occurs in active region 
$display("Value of a=%b",y);//y is true as y is 2bit it prints 01
end

//output->
//Value of a=10101101;
//Value of a=10101101;
//Value of a=01;

//---------------5----------------//
"What is the sythesis module of the following snippet 
assuming all variables are declared?

always@(posedge clk1 or negedge clk2)
begin
if(~clk2 && a)
dout<=0;
else
dout<= din;
end"
//its not synthesizable as a is level trigerred and its not in the sensitivity list//

//----------------6----------------//
reg a=3'b1;
wire [1:0] y;
assign y=(a==2'b11);

reg b=1'b1;
wire [2:0] c;
assign c=(b==3'b01);

initial
begin
$display("Value of y=%b",y);
$display("Value of c=%b",c);
end
//output-->
//Value of y=00;
//Value of c=001;


//----------------7---------------//
reg [3:0] a, b, c;
reg [4:0] d;
initial
begin
$display("c=%0b", c?(a&b):d);
a=11;
b=15;
c=1;
$monitor($time,"c=%0b", c?(a&b):d);
#10 c=0;
end
//c=x;
//0 c=1011;//c is true so a&b is printed i.e 1011 & 1111 
//10 c=x;//c is falso so d is printed which is x

//--------------8--------------//
reg [5:0] a, b, c, d;
initial
begin
a=10;
b=20;
#10 c=#5 a;
d=b;
#20 b=(c|b);//c|b is cis 001010 | 010100 =011110

$monitor("Value of a=%b,b=%d,c=%d,d=%d",a,b,c,d);
$finish;
end
//as monitor is at last it wont detech anything
//if its at frst and $finish is not present then the values are as below
// #0Value of a=001010,b=010100,c= x,d=xxxxxx
// #15Value of a=001010,b=010100,c=10,d=010100
// #35Value of a=001010,b=011110,c=10,d=010100


//-------------9----------------//
reg [3:0] y;
reg [3:0]a=4'b1010;
reg [3:0]b=3'b11x;
//internally mag is found using OR operation 
//thus for a 1or0or1or0 is 1 , as min 1 no of 1's is present mag is 1
//for b 1or1orx as 2no of 1's present mag is 1 for whatever value of x
initial
begin
y=a&&b;//a is 1 and b is also 1 so 1&&1 is 1 
$display("y=%b",y);
end
//output -->as y is 4 bit 
//y=0001--------------//


//--------------10------------//
reg [4:0] y;
y= 3'bx01 what is the value in y?"
//y is 00xo1;


//-----------------11----------//
reg [1:0] a;
initial
begin
a = -10%3;
$display("%0b”,a);
end
//output-->11;


endmodule
