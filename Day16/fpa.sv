module fpa(in,out);
  parameter WIDTH=8;
  input [WIDTH-1:0]in;
  output reg [WIDTH-1:0]out;
  
  always@(in)begin
    casex(in)
      8'bxxxxxxx1: out=8'h01;
      8'bxxxxxx10: out=8'h02;
      8'bxxxxx100: out=8'h04;
      8'bxxxx1000: out=8'h08;
      8'bxxx10000: out=8'h10;
      8'bxx100000: out=8'h20;
      8'bx1000000: out=8'h40;
      8'b10000000: out=8'h80;
      default: out=8'h01;
    endcase
  end
endmodule
