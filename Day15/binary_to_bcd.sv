module bcd_convt(in,clk,rst,out1,out2);
  input [3:0]in;
  input clk,rst;
  output out1;
  output [3:0]out2;
  
  reg [4:0]val;
  assign out1=val[4];
  assign out2=val[3:0];
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      val<=5'b0;
    end
    else begin
      if(in>=4'b1010)begin
        val=in+4'b0110;
      end
      else 
        val=in;
    end
  end
endmodule
