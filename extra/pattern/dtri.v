module top;

integer n=5,i,j;
initial
begin
	for(i=0;i<n;i=i+1)//no of rows
	begin
		for(j=i;j<n;j=j+1)//no of columns is set to i
		begin
			$write("* ");
		end
		$display();
	end
end

endmodule

/*

* * * * *
* * * *
* * *
* *
*



module top;

integer n=5,i,j;
initial
begin
	for(i=1;i<=n;i=i+1)//no of rows
	begin
		for(j=i;j<=n;j=j+1)//no of columns is set to i
		begin
			$write("* ");
		end
		$display();
	end
end

endmodule
*/