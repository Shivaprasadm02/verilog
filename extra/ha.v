module half_adder(input a,b,
	          output reg sum,carry);
always@(a,b)
begin
sum=0;carry=0;
case({a,b})

2'b00:begin sum=1'b0;carry=1'b0; end
2'b01:begin sum=1;carry=0; end
2'b10: begin sum=1;carry=0; end
//default:begin sum=0;carry=0; end
endcase
end
endmodule
/*	
module half_adder_tb(a,b,sum,carry);
`include half_adder
reg a,b;
wire sum,carry;

//half_adder DUT(.a(a),.b(),.sum(sum),.carry(carry));
half_adder DUT(a,b,sum,carry);

initial
begin
a=1;
b=1;
#5;
a=0;
b=1;
end
endmodule
*/