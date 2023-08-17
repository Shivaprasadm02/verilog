module example(clk,reset,x,y);

input clk,reset;
output reg [3:0] x,y;


always @(posedge clk)
    begin
        if(reset)
            begin
                {x,y} <= 0 ;
            end 
        else
            begin
                y <= y+1;
            end
    end

always @(posedge clk)
    begin
        if(y>=1 && y<=3)
            begin
              x <= 4'd1;  
            end
        else if (y>=4  && y<=6)
            begin
                x <= 4'd2; 
            end
        else if (y>=7 && y<=9)
            begin
                x <= 4'd3;
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
#20 rst=1'b0;
#100 $finish;
end

initial
$monitor("x=%d,y=%d",x,y);

endmodule