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
 endcase/*
 assign y[0]=~a&~b;
 assign y[1]=~a&b;
 assign y[2]=a&~b;
 assign y[3]=a&b;*/
 end
endmodule

module dec_tb();
reg a,b;
wire [3:0]y;

dec2_4 DUT(a,b,y);

initial
begin
{a,b}=0;
#10 a=1;
#20 b=1;
#10 {a,b}=0;
#10 {a,b}=2'b01;
end

initial
$monitor($time	,"a=%b,b=%b,y=%b",a,b,y);

initial
#100 $finish;

endmodule
 