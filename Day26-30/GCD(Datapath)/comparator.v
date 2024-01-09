  module comp(out_less,out_greater,out_equal,en,din1,din2);
    input [7:0]din1,din2;
    input en;
    output out_less,out_greater,out_equal;
  
    assign out_less=(din1<din2);
    assign out_greater=(din1>din2);
    assign out_equal=(din1==din2);
  endmodule
