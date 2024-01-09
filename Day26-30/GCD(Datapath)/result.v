module result(dout,din,en);
  input [7:0]din;
  input en;
  output [7:0]dout;
  
  assign dout=en?din:8'b0;
endmodule
