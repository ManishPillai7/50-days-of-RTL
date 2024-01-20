module block(
  input clk,en,
  input [4:0]din,
  output reg [4:0]dout
);
  always@(posedge clk)begin
    if(en)
      dout=din;
  end
endmodule
