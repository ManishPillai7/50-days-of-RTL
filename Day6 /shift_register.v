// Simple shift register
module shift_reg(in,clk,rst,out);
  input [3:0]in;
  input clk,rst;
  output reg [3:0]out;
  
  reg [3:0]i;
  reg [3:0]shift[3:0];
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      shift[3]<=0;
      shift[2]<=0;
      shift[1]<=0;
      shift[0]<=0;
    end
    else begin
      shift[0]<=in;
      for(i=1;i<4;i=i+1)begin
        shift[i]<=shift[i-1];
      end
      out<=shift[3];
    end
  end
endmodulea
