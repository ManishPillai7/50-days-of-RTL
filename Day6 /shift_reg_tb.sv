module shift_reg_tb ();
  reg [3:0]in;
  reg clk,rst;
  wire [3:0]out;
  
  shift_reg r1(.*);
  
  initial begin
    clk=0;
    rst=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    rst=1;#5
    rst=0;
    for(int i=0; i<=4; i++)begin
      in=$urandom_range(0,4'b1111);#10;
    end
    #200;
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,day6_tb);
  end

endmodule
