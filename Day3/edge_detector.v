module edge_detector(data_in,clk,rst,data_posedge,data_negedge);
  input data_in,clk,rst;
  output reg data_posedge,data_negedge;
  
  reg out1;
  reg out2;
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      out1 <=0;
      out2 <=0;
    end
    else begin
      out1 <=data_in;
      out2 <=data_in;
    end
  end
  
  assign data_posedge = ~out1 & data_in; //
  assign data_negedge = ~data_in & out2;
endmodule
