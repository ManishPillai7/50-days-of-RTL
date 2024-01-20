module data_path(
  input [4:0]data_in,
  input clk,clr_A,enA,clr_Q,enQ,shift,enM,clrff,clr_count,dec,clr_r,sub_add,
  output [9:0]data_out,
  output q0,q1,done
);
  wire [4:0]x1,x2,x3,x4,x5;
  
  assign q0=x2[0];
  assign done=x5;
  shift_reg A(clr_A,clk,enA,shift,x1[4],x3,x1);
  shift_reg Q(clr_Q,clk,enQ,shift,x1[0],data_in,x2);
  d_ff Q1(x2[0],clk,clrff,shift,q1);
  block M(clk,enM,data_in,x4);
  counter COUNTER(clr_count,clk,dec,x5);
  alu ALU(x1,x4,sub_add,x3);
  result RESULT(x1,x2,x5,clr_r,data_out);
endmodule
