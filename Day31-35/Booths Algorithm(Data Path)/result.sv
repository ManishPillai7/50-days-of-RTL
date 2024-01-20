module result(
  input [4:0]inA,inQ,
  input en,clr,
  output reg [9:0]dout
);
  always@(*)begin
    if(clr)
      dout=10'b0;
    else if(en)
      dout={inA,inQ};
    else if(!en)
      dout<=dout;
  end
endmodule
