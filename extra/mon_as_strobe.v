module dec2_4(a,b,y);
 input a,b;
 output reg[3:0]y;
 always@(a,b)
 begin
 y=0;
 case({a,b})
 2'b00:y[0]=1;
 2'b01:y[1]=1;
 2'b10:y[2]=1;
 2'b11:y[3]=1;
 endcase
 end
endmodule

module dec_tb();
reg a,b;
wire [3:0]y;

dec2_4 DUT(a,b,y);

initial
begin
{a,b}=0;//0,10 are not detected by monitor
#10 a=1;
#20 b=1;
$monitor($time	,"a=%b,b=%b,y=%b",a,b,y);//prints value at end of 30s
 {a,b}=2'b10;
 {a,b}=2'b00;

//this wrks at 30s prev mon also wrks at 30 so only 1print statement is considered
$monitor($time	,"a=%b,b=%b,y=%b",a,b,y);
end

//this mon detects all changes starting frm 0ns
initial
$monitor($time	,"-----mon2 value----a=%b,b=%b,y=%b",a,b,y);


initial
#100 $finish;

endmodule
 