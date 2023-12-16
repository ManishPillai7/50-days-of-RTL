module fsm_tb();
  reg in,clk,rst;
  wire out;
  
  fsm f1(.*);
  
  initial begin
    clk=0;
    rst=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst=1;#2;
    rst=0;#10;
    in=1;#10;
    in=1;#10;
    in=0;#10;
    in=1;
    /*for (int i=0; i<8; i++)begin
      in=$urandom_range(0,1);#5;
    end*/
    #100;
    
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,fsm_tb);
  end
endmodule
