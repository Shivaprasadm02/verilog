module top;

integer n=5,i,j;
initial
begin
	for(i=0;i<n;i=i+1)//no of rows
	begin
		for(j=0;j<n;j=j+1)//no of columns
		begin
			$write("* ");
		end
		$display();
	end
end

endmodule