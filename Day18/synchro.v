module synchro(data_in,clk,rst,out);
input data_in,clk,rst;
output reg out;

reg q1;
always@(posedge clk or posedge rst)begin
if(rst)begin
q1<=0;
out<=0;
end
else begin
q1<=data_in;
out<=q1;
end
end
endmodule
