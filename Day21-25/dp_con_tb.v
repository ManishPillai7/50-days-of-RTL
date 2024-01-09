// Code your testbench here
// or browse Examples
module testbench;
reg [15:0] data_in;
reg clk,start;
wire all_done;
  data_path dp (data_in,enA,enB,enP,clr_P,clk,count_en,out,done);
  controller con (clk,start,done,enA,enB,enP,count_en,clr_P,all_done);

initial begin 
 clk=1'b0;
 #3 start=1'b1;
 #100 $finish;
 end

always #5 clk=~clk;

initial begin 
#17 data_in=17;
#10 data_in=5;
end
initial begin
$dumpfile("mul.vcd");
$dumpvars(0,testbench);
end
endmodule
