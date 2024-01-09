//REGISTER A AND B
module block(dout,clk,en_din,en_cycle,din,dcycle);
  input [7:0]din,dcycle;
  input clk,en_din,en_cycle;
  output reg [7:0]dout;
  
  always@(posedge clk)begin
    if(en_din)
      dout=din;
    if(en_cycle)
      dout=dcycle;
  end
endmodule
