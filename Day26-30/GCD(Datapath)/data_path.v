module data_path(data_out,eqz,clk,enA,enB,enA_c,enB_c,com_en,data_in);
  input [7:0]data_in;
  input clk,enA,enB,com_en,enA_c,enB_c;
  output [7:0]data_out;
  output eqz;
  wire [7:0]x,y,z,m;
  wire a1,b1,w;
  assign eqz=w;
  block A(x,clk,enA,enA_c,data_in,y);
  block B(z,clk,enB,enB_c,data_in,m);
  comp COMP(b1,a1,w,com_en,x,z);
  sub AgB(y,clk,a1,x,z);
  sub AlB(m,clk,b1,z,x);
  result RESULT(data_out,x,w);
endmodule
