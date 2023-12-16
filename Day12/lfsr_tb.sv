module lfsr_tb();
  reg [3:0]in;
  reg clk,en;
  wire out;
  
  lfsr p1(.*);
  
  initial begin
    clk=0;
    en=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    en=1;in=4'b1001;#10;
    en=0;#100;
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,lfsr_tb);
  end
endmodule
