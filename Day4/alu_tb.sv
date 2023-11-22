// Code your testbench here
// or browse Examples
module alu_tb();
  reg [7:0]data_in1,data_in2;
  reg [3:0] operation;
  reg rst;
  wire [7:0]data_out;
  
  alu a1(.*);
  
  initial begin
    data_in1 = 8'b11001111;
    data_in2 = 8'b10110000;
    rst =0;
  end
  
  initial begin
    rst=1;#5;
    rst=0;#5;
    for (int i; i<10; i=i+1)begin
      operation = $urandom_range (0, 4'b1111);
      #5;
    end
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,alu_tb);
  end 
endmodule
