module ven_mach_tb();
parameter PRODUCT=4;
reg in_50,clk,rst,lays,kitkat,red_bull,pepsi;
wire [PRODUCT-1:0]p_out;
wire c_out;

ven_mach vm1(in_50,lays,kitkat,red_bull,pepsi,clk,rst,p_out,c_out);

initial begin
clk=0;
rst=0;
end
always #5 clk=~clk;
initial begin
rst=1;#5;rst=0;
in_50=1;
lays=0;
kitkat=0;
red_bull=0;
pepsi=0;
#10;
in_50=1;
lays=0;
kitkat=1;
red_bull=0;
pepsi=0;
#30;
$stop;
end
endmodule
