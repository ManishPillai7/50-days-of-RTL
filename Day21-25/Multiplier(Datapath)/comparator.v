//COMPARATOR
module comp(
  input [7:0]data_in,
  output done
);
  assign done=(data_in==8'b0);
endmodule
