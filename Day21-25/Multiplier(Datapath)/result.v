//RESULT
module result(
  input en,
  input [7:0]data_in,
  output [7:0]data_out
);
  assign data_out=en?data_in:8'b0;
endmodule
