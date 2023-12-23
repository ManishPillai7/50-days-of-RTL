// Code your testbench here
// or browse Examples
module fpa_tb();
  parameter WIDTH=8;
  reg [WIDTH-1:0]in;
  wire [WIDTH-1:0]out;
  
  fpa f1(.*);
  
  initial begin
    for(int i=0; i<20; i++)begin
      in=$urandom_range(0,8'hff);
      #5;
    end
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,fpa_tb);
  end
endmodule
