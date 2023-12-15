module piso_tb();
  reg [3:0]in;
  reg clk,rst,mode;
  wire out;
  
  piso p1(.*);
  
  initial begin
    clk=0;
    rst=0;
    mode=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst=1;#5;
    rst=0;#20;
    mode=1;in=4'b1010;#50;
    mode=0;#50;
    mode=1; in=4'b1101;#50;
    mode=0;#50;
    mode=1; in=4'b1001;#50;
    mode=0;#100;
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,piso_tb);
  end
endmodule
