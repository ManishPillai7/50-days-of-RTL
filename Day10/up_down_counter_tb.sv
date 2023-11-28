// Code your testbench here
// or browse Examples
module up_down_counter_tb();
  reg m,rst,clk;
  wire [3:0]out;
  
  up_down_counter d1(.*);
  
  initial begin
    rst=0;
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst=1;#5
    rst=0;m=0;#100;
    m=1;#70;
    m=0;#50;
    $stop;
  end
  
  initial begin
    $dumpfile("filr.vcd");
    $dumpvars(0,up_down_counter_tb);
  end
endmodule
