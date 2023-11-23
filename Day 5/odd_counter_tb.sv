// Code your testbench here
// or browse Examples
module odd_counter_tb();
  reg rst,clk;
  wire [3:0]out;
  
  odd_counter o1(.*);
  
  initial begin
    clk=0;
    rst=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    #5;rst=1;#3;
    rst=0;#100;
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,odd_counter_tb);
  end
endmodule
