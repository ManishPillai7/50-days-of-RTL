// Code your testbench here
// or browse Examples
module seq_det_tb();
  reg in,clk,rst;
  wire out;
  
  seq_det s1(.*);
  
  initial begin
    clk=0;
    rst=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst=1;#5;
    rst=0;#5;
    repeat(3)begin
      in=1;#10;
      in=1;#10;
      in=0;#10;
      in=1;#10;
      in=0;#10;
      in=0;#10;
      in=1;#10;
      in=1;#20;
    end
    
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,seq_det_tb);
  end
endmodule
