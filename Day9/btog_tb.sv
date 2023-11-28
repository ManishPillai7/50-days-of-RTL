// Code your testbench here
// or browse Examples
module btog_tb();
  reg [3:0]in;
  wire [3:0]out;
  
  binary_gray b1(.*);
  
  initial begin
    for (int i=0;i<10;i=i+1)begin
      in=$urandom_range(0,4'b1111);
      #5;
    end
  end
  
  initial begin
    $dumpfile("fil.vcd");
    $dumpvars(0,btog_tb);
  end
endmodule
