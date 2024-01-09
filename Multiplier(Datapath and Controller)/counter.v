//COUNTER B
module counter(
  input [7:0]data_in,
  input clk,count_en,en,
  output reg [7:0]data_out
);
  
  always@(posedge clk)begin
    if(en)
      data_out=data_in;
    else if(count_en)
      data_out=data_out-1;
  end
endmodule
