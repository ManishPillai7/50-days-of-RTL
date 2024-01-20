module counter(
  input clr_5,clk,dec,
  output done
);
  
  reg [2:0]count;
  always@(posedge clk)begin
    if(clr_5)
      count=3'b101;
    else if(dec)
      count=count-1;
  end
  assign done=(count==3'b0);
endmodule
