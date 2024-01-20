module shift_reg(
  input clr,clk,en,shift,s_in,
  input [4:0]din,
  output reg[4:0]dout
);
  
  always@(posedge clk)begin
    if(clr)
      dout=5'b0;
    else if(en)
      dout=din;
    else if(shift)
      dout<={s_in,dout[4:1]};
  end
endmodule
