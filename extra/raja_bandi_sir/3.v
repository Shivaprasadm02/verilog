module seq(clk,din,dout);
input clk;
input [15:0]din;
output reg [2:0]dout=3'b000;
integer i;

	always@(posedge clk)
	begin
		for(i=0;i<14;i=i+1)
		begin
			if({din[i],din[i+1],din[i+2]}==3'b101)
			begin
				dout=dout+1'b1;
			end
		end
	end	
	
endmodule

module tb;

	reg clk;
	reg [15:0]din;
	wire [2:0]dout;

seq DUT(clk,din,dout);

initial clk=0;
always #5 clk=~clk;

initial
begin
din=16'b1010000000000101;
#5 din=16'b1011011011010101;
#5 din=16'd0;
end

initial
begin
	$monitor("clk=%b,dout=%b",clk,dout);
	#100 $finish;
end

endmodule
