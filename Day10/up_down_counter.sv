// Code your design here
module up_down_counter(m,rst,clk,out);
  input m,rst,clk;
  output [3:0]out;
  
  reg [3:0]count;
  always@(posedge clk or posedge rst)begin
    if(rst)
      count=0;
    else begin
      if(m==1)
        count=count+1;
      else
        count=count-1;
    end
  end
  
  assign out=count;
endmodule
