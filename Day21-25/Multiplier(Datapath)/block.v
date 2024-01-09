// REGISTOR A
module block(
  input [7:0]data_in,
  input clk,en,
  output reg [7:0]data_out
);
  always@(posedge clk)begin
    if(en)begin
      data_out=data_in;
    end
  end
endmodule
