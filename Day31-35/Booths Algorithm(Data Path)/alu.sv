module alu(
  input [4:0]in1,in2,
  input sub_add,
  output reg [4:0]dout
);
  always@(*)begin
    if(sub_add)
      dout=in1+in2;
    else
      dout=in1-in2;
  end
endmodule
