module top;

integer n=5,i,j;
initial
begin
	for(i=0;i<n;i=i+1)//no of rows i.e outer loop
	begin
//1st loop is increasing spaces so it runs through i
		for(j=0;j<=i;j=j+1)//decreasing tri of spaces(2char)
		begin
			$write("  ");//2 char
		end
//second loop is decreasing * so it runs through n	
		for(j=i;j<n;j=j+1)//increasing tri of *
		begin
			$write("* ");//2 char 
		end

		$display();//this display statement is linked only to outer loop
	end
end

endmodule

//---<---------OR--------->-------------
module top;

integer n=5,i,j;
initial
begin
	for(i=1;i<=n;i=i+1)//no of rows i.e outer loop
	begin
//1st loop is increasing spaces so it runs through i
		for(j=1;j<=i;j=j+1)//decreasing tri of spaces(2char)
		begin
			$write("  ");//2 char
		end
//second loop is decreasing * so it runs through n	
		for(j=i;j<=n;j=j+1)//increasing tri of *
		begin
			$write("* ");//2 char 
		end

		$display();//this display statement is linked only to outer loop
	end
end

endmodule

/*the no of char of both inner loops should match
    
  * * * * *
    * * * * 
      * * *
	    * *
	      *
		  
*/