module sync_tb();
reg data_in,clk,rst;
wire out;

synchro s1(data_in,clk,rst,out);

initial begin
rst=0;
clk=0;
data_in = 0;
rst=1;#2;
rst=0;#200;
$stop;
end

always #5 clk=~clk;
always #10 data_in=~data_in;
endmodule
