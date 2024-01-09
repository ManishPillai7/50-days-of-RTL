//REGISTOR P
module block2(
  input [7:0]data_in,
  input clk,en,clr,
  output reg [7:0]data_out
);
  always@(posedge clk)begin
    if(clr)
      data_out=8'b0;
    else if(en)
      data_out=data_in;
  end
endmodule
