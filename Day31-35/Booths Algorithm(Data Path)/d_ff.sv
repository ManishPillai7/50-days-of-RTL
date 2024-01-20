module d_ff(
  input din,clk,clr,shift,
  output reg dout
);
  always@(posedge clk)begin
    if(clr)
      dout=0;
    else if(shift)
      dout=din;
  end
endmodule
