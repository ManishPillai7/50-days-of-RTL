module fpa_tb();
reg [3:0]in1,in2,in3,in0;
wire [3:0]out;

fpa f1(in0,in1,in2,in3,out);

initial begin
in0=4'b1;
in1=4'b1101;
in2=4'b0110;
in3=4'b1011;
end
endmodule
