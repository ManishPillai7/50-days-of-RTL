// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module dynamic_sr_tb();
  reg [3:0]in;
  reg [2:0]select;
  reg clk,rst;
  wire [3:0]out;
  
  dynamic_sr d1(.*);
  
  initial begin
    clk=0;
    rst=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    in=0;
    rst=1;#5;
    rst=0;select=010;in=4'b1010;#200;
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,dynamic_sr_tb);
  end
endmodule
