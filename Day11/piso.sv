module piso(in,out,clk,rst,mode);
  input [3:0]in;
  input clk,rst,mode;
  output reg out;
  
  reg [3:0]shift;

  always@(posedge clk or posedge rst)begin
    if(rst)begin
      shift<=0;
    end
    else begin
      if(mode)begin
        shift<=in;
      end
      else begin
        shift<={0,shift[3:1]};
        out <= shift [0];
      end
    end
  end
endmodule
