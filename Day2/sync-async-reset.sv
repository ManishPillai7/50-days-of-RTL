// Code your design here
module resets(d1,d2,q1,q2,clk1,clk2,rst1,rst2);
  input d1,d2,clk1,clk2,rst1,rst2;
  output reg q1,q2;
  
  //Synchronous reset
  always@(posedge clk1)
    begin
      if (rst1)
        begin
          q1<=0;
        end
      else begin
        q1<=d1;
      end
    end
  
  //Asynchronous reset
  always@(posedge clk2 or posedge rst2)
    begin
      if (rst2)
        begin
          q2<=0;
        end
      else begin
        q2<=d2;
      end
    end
endmodule
