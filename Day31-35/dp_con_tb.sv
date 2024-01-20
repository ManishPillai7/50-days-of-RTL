module testbench;
  reg [4:0] data_in;
  reg clk,start;
  wire done;
  wire [4:0]data_out;
  data_path dp (data_in,clk,clr_A,enA,clr_Q,enQ,shift,enM,clrff,clr_count,dec,clr_r,sub_add,data_out, q0,q1,done);
  controller con (start,clk,q1,q0,done,enD,enA,enM,enQ,sub_add,clr_A,clr_count,dec,shift,clr_Q,clr_r,clrff);

initial begin 
 clk=1'b1;
 #3 start=1'b1;
 #500 $finish;
 end

always #5 clk=~clk;

initial begin 
#11 data_in=-10;
#10 data_in=13;
end
initial begin
$dumpfile("mul.vcd");
$dumpvars(0,testbench);
end
endmodule
