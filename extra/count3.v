module top(clk,reset,x,y);
input clk,reset;
output reg [3:0] x,y;

always @(posedge clk)
    begin
        if(reset)
                {x,y} <= 0 ; 
        else
            begin
                x <= x+1;
                y <= y+1;
            end
    end

always @(posedge clk)
    begin
        if(x<3)
		begin
			assign y = 0; 
			deassign x;
		end
        else if (x == 3)
		begin
            assign x = 3;
			deassign y;
		end
    end

endmodule

module tb();
reg clk,rst;
wire [3:0]x,y;

parameter CYCLE = 10;

top DUT(clk,rst,x,y);

always
begin
	 #(CYCLE/2);
	 clk = 1'b0;
	 #(CYCLE/2);
	 clk=~clk;
      end
initial
begin
rst=1'b1;
#10 rst=1'b0;
#1000 $finish;
end

initial
$monitor("x=%d,y=%d",x,y);

endmodule