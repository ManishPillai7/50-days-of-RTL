module binary_gray(in,out);
  input [3:0]in;
  output [3:0]out;
  
  assign out=(in^(in>>1));
endmodule
