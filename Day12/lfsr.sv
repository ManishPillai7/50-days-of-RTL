module lfsr(in,clk,en,out);
  input [3:0]in;
  input clk,en;
  output reg out;
  
  reg [3:0]val;
  always@(posedge clk)begin
    if(en)
      val <= in;
    else begin
      val <= {(val[0]^val[1]),val[3:1]};
      out <= val[0];
    end
  end
endmodule
