//ADDER
module adder(
  input [7:0]d1,d2,
  output reg [7:0]data_out
);
  always@(*)begin
    data_out=d1+d2;
  end
endmodule
