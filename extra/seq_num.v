module PrintNumbers;
  reg [3:0] line;
  reg [2:0] count;
  reg clk;
  always@(clk)
  begin
  clk=~clk;
  end
	//forever #5 clk=~clk;
	reg reset;
  always @(posedge clk) begin
    if (reset) begin
      line <= 0;
      count <= 0;
    end else if (line < 4 && count < (9 - line * 2)) begin
      count <= count + 1;
    end else if (line < 4) begin
      line <= line + 1;
      count <= 0;
    end
  end

  always @(posedge clk) begin
    if (reset) begin
      $display("Reset");
    end else if (line < 4 && count < (9 - line * 2)) begin
      $display("%d", (9 - line * 2) - count);
    end
  end
endmodule
