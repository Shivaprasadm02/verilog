module top;
integer n=5,p=0,i,j;
initial
begin
	for(i=0;i<n;i=i+1)
	begin
	for(j=0;j<n;j=j+1)
	begin
		p=p+1;
		$write("%0d ",p);
	end
	$display();
	end
end

endmodule