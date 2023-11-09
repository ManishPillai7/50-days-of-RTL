// Code your testbench here
// or browse Examples
module reset_tb();
  reg d1,d2,clk1,clk2,rst1,rst2;
  wire q1,q2;
  
  resets r1(.*);
  
  initial begin
    clk1=0;clk2=0;
    d1=0;
    d2=0;#5;
    d1=1;
    d2=1;#5;
  end
  
  always #5 clk1=~clk1;
  always #5 clk2=~clk2;
  
  initial begin
    rst1=0;
    rst2=0;#7;
    rst1=1;
    rst2=1;#40;
    $stop;
  end
  
  initial begin
    $dumpfile("resets.vcd");
    $dumpvars(0,reset_tb);
  end
endmodule
