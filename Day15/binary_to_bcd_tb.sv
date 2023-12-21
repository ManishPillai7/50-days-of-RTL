// Code your testbench here
// or browse Examples
module bcd_convt_tb();
  reg [3:0]in;
  reg clk,rst;
  wire out1;
  wire [3:0]out2;
  
  bcd_convt b1(.*);
  
  initial begin
    clk=0;
    rst=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst=1;#5;
    rst=0;in=4'b1111;#10;
    in=4'b0010;#20;
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,bcd_convt_tb);
  end
endmodule
