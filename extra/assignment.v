module test;
reg [2:0]a1,a2;
initial
begin
#10 a1=2'b1;
#20 a2=2'b0;
$display(a1,a2);
#10 a2<=#20 2'd2;
$display(a1,a2);
#20 a1<=#30 2'd3;
$display(a1,a2);
end
initial
$monitor($time		,	"a1=%b,	a2=%b",a1,a2);

endmodule


/*---output---------

run -all
#                    0a1=xxx,	a2=xxx
#                   10a1=001,	a2=xxx
# 10
#                   30a1=001,	a2=000
# 10
# 10
#                   60a1=001,	a2=010
#                   90a1=011,	a2=010

-----------*/