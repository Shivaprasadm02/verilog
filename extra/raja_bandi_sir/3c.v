module seq(din,y);
input [15:0]din;
output [2:0]y;

reg [2:0]dout;
integer i;

	always@(din)
	begin
	dout=3'b000;
		for(i=15;i>1;i=i-1)
		begin
			if({din[i],din[i-1],din[i-2]}==3'b101)
			begin
				dout=dout+1'b1;
				//break;
				//continue;
			end	
		end
	end	
assign y=dout;
endmodule

module tb;

	reg [15:0]din;
	wire [2:0]dout;

seq DUT(din,dout);

initial
begin
din=16'b1010000000000101;
#5 din=16'b1011011011010101;
#5 din=16'd0;
#5 din=16'b1010101000000101;
end

initial
begin
	$monitor($time,"din=%b,dout=%d",din,dout);
	#100 $finish;
end

endmodule
