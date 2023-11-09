module mux_2x1(
  input [7:0]a,b,
  input select,
  output reg [7:0]out
);
  
  always @(*)begin
    case(select)
      1'b0: out=a;
      1'b1: out=b;
      default out=a;
    endcase
  end
endmodule
