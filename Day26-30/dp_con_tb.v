// Code your testbench here
// or browse Examples

module testbench;
  reg [7:0] data_in;
  reg clk,start;
  wire done;
  wire [7:0]data_out;
  data_path dp (data_out,eqz,clk,enA,enB,enA_c,enB_c,com_en,data_in);
  controller con (enA,enB,enA_c,enB_c,com_en,start,clk,eqz,done);

initial begin 
 clk=1'b0;
 #3 start=1'b1;
 #500 $finish;
 end

always #5 clk=~clk;

initial begin 
#17 data_in=26;
#10 data_in=10;
end
initial begin
$dumpfile("mul.vcd");
$dumpvars(0,testbench);
end
endmodule
