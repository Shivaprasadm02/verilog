//diff bt task and fun

////----1--------reg delay, intra delay/////////////////////
module bits( );
reg a=0;
reg c;
reg b=1;

initial
begin
#5 c = a+b;
$display("C1=%0d",c);
end
initial
begin
c = #5 (a + b);
$display("C2=%0d",c);
end
endmodule
//op c1=1,c2=1///////////

/////---2/////////
/*
//////////"What is the output of the following snippet?
reg clk;
always
 begin
 clk =~clk;
 $display("clk=%b",clk);
 end
//it rens continously and leads to siml deadlock as no sensitivity in always
//value of clk is x
*/

///---------3------/////////////
///"What is the output of the following snippet?-//
/*
module top;
reg clk;
initial
clk=0;

always @(clk)
 begin
 #5 clk <=~clk;
 $display("clk=%b",clk);
 end
endmodule
//continuosly gives clk=0 clk=1 as  there is no $finish
*/

///---------3------/////////////
///"What is the output of the following snippet?-//

module top;
reg clk=0;
always @(clk)
 begin
 #5 clk =~clk;
 $display("clk=%b",clk);
 end
endmodule
//we get only clk=1 cz default of reg is x and its changing to 0
//only for this the alwaysis triggered further for 0to1 change its not trigerred
//cz non-blocking assignment will not retrigger (check in stratified event queue)

//-----------------4------------------///////////////
//What is the value of t in the below code?

module four;
reg t;

function f (input i);
 begin
 $display("&&&&&&&&");
 end
endfunction

initial
begin
 t = f(1'b1);
 $display("t=%b",t);
 end
 
endmodule

//////function has no return type and its not returning anything 
//so t will have default value only i.e x

//-----------------------------5----------------//////////////////
//What is the output from the below code?
/*
module five;

function void f(input i);
 begin

 end
endfunction

initial
 f(1'b1);
 
endmodule
*/
//syntax err as unknown identifier cz ther is no void type in verilog


/////-------------------6----------------/////
/*
"Which flipflop(s) are inferred from the below RTL code?
 module xyz ( input clk, output reg a, b);
  always@(posedge clk)
  begin
  a <=b;
  b <=a;
  end
 endmodule
 */
 
 //2FF as its non-blocking////
 
 ////--------------------7---------------////
 //Which flipflop(s) are inferred from the below RTL code?
 /*
 module xyz ( input clk, output reg a, b);
  always@(posedge clk)
  begin
  a =b;
  b =a;
  end
 endmodule
 
 */
 //1FF as its blocking, FF with ip b op a and wire b at op
 
 ////-------------------------8----------------/////////////
 
 //What gates are inferred from the below RTL code?
 /*
 input a, b, c, d;
 output x, y;
 wor x;
 wand y;
 assign x=a&b;
 assign x=d|c;
 assign y=!b;
 assign y=a^c;
 */
 //6gates 1wor+1wand+4for assignments
 
 ////////-----------------------------9--------------//////////
 ////What is an error in the below code?-//---------------////////

module ques(f, a, b, c);
 input a, b, c;
 output f;
 
wire t= a ^ b;//implicit assign statement
assign f= t & c;

endmodule
///no error----////

//-----------10---------/////
//diff bt blocking= and nonblocking<=
//block will not retrigger non will retrigger

//--11--diff bt initial and always-----//
//always executes continuosly and it can be controlled with sensitivity list
//initial executes only once i
//both start at 0time

//---12--assign-deassign force-relaese-------///
//they are procedural continuos assignment
//so it should be written inside procedural block, it overrides procedural assignment
//force overrides pca also

//---------13------------////////
//What is the output for a, c ? 
module B( );
reg [2:0] a, c;
reg [2:0] b =1;
initial 
 begin
 a<=b;
 c<=a;
 $display("a=%b,b=%b,c=%b",a,b,c);
 end
endmodule
//a=001, c=xxx

//------------14------------//
/*Explain the following code?

reg clk1, clk2;
initial
 begin
 clk1=1’b0;
 clk2=1’b1;
 forever 
 #10 clk1= ~clk1;
 repeat(50)
 #5 clk2=~clk2;
 #75 $finish;
 end */
//clk1 with 20ns tp is generated continuously
// it doesnt come out of forever so below repeat codes and finish doesnt executes

//--------------15-------------//
//What is  the display output for the following code segment?
module fifteen;
integer x, y;
initial
 begin
 x=15;
 y=10;
 end

initial
 repeat(2) 
 $display ("x=%d",x);

initial
 while(y<12)
 begin 
 y = y+1;
 x = x-1;
 end

endmodule
//all these start at 0time but only 1wins and usually it executes in sequence
//so 1st values are updated and then display and then valu changes
//it printes x=15 for 2times

//--------------------16------------------//
//Which of the display output for the following code segment?
module sixteen;
integer x, y;
initial
 begin
 x=15;
 y=10;
 end

initial
 while(y<12)
 begin 
 y = y+1;
 x = x-1;
 end

initial
 repeat(2) $display (“x=%d”, x);"
endmodule
//at 0time all blocks starts
//1st x=15 and y=10 and then values are chnged
//nxt the display so gives x=13;
//thus it depend on order even though all start at 0

//--------------17-----------------//
How many times will the begin and end block be executed in the following snippet?

integer a;
 initial 
 begin 
 a = ’bZ;
 repeat(a)
 begin
 --------
 --------
 --------
 end
 end
 
 //0 times cz a is z so repeat doesnt work
 
 //------------18------------//
 Find the display output from the below code?

`timescale 1ns/100ps
module test; 
integer i;
 task t_value;
 begin
 begin
 @(i)
 $display($time,"\ti=%0d",i);
 end
 end
 endtask

 initial
 begin
 #5 i=2;
 #10 i=4; 
 end

 initial
 begin
 #6 t_value;
 end 
endmodule

//it displays 4 cz task is called at #6 and inside it it waits for event i
//at #5 it changed so it nxt chnages at #15 i.e 5+10 thus gives i=4 at #15 

//---------19----------//
What is the display output for the below snippet:
reg [3:0] a;
 initial
 fork
 begin: B1
 #10; 
 disable B2;
 a=10;
 $display($time,"a=%b",a);
 end

 begin: B2
 reg [3:0] a;
 #20;
 a=5;
 $display($time,"a=%b",a);
 end
 join
 //both B, B2 starts at 0 but B2 executes at 20 so before B2 B1 is disabling it at 10
 //thus only B1 executes and displayes 10 at #10