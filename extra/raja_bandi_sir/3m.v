module seq(din,dout);
input [15:0]din;
  output reg [3:0]dout;
  integer i;
  integer count;
	always@(din)
	begin
      dout = 4'b0000;
	  
      for(i=0;i<14;i=i+1)
		begin
          
          if({din[i+2],din[i+1],din[i]}==3'b101)
			begin
              if( (i == count + 2) || (i == count + 1))
                	continue;
              else 
                begin
                	dout=dout+1'b1;
              		count = i;
                end
			end
		end
	end	
	
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