module sub(out,clk,en,in1,in2);
  input [7:0]in1,in2;
  input clk,en;
  output reg [7:0]out;
  
  always@(posedge clk)begin
    if(en && !(in1==in2))
      out=in1-in2;
    else
      out=in1;
  end
endmodule
