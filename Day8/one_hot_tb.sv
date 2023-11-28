// Code your testbench here
// or browse Examples
module one_hot_tb();
  reg [2:0]in;
  wire [7:0]out;
  
  one_hot_encoder n1(.*);
  
  initial begin
    for(int i=0;i<10;i=i+1)begin
      in=$urandom_range(0,3'b111);
      #5;
    end
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,one_hot_tb);
  end
  
endmodule
