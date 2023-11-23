module odd_counter(rst,clk,out);
  input rst,clk;
  output [3:0]out;
  
  reg [3:0]count;
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      count=4'b0001;
    else
      count=count + 4'b0010;
  end
  
  assign out=count;
endmodule
