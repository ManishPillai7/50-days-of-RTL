module one_hot_encoder(in,out);
  input [2:0]in;
  output [7:0]out;
  
  reg [7:0]val;
  
  always@(in)begin
    val=8'h01*2**in;
  end
  assign out=val;
endmodule
