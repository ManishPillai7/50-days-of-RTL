module fpa(in0,in1,in2,in3,out);
input [3:0]in1,in2,in3,in0;
output reg [3:0]out;

integer x;
always@(*)begin
    for(x=0;x<4;x=x+1)begin
        if(in0!=4'b0)
            out=in0;
        else if(in1!=0)
            out=in1;
        else if(in2!=0)
            out=in2;
        else if(in3!=0)
            out=in3;
    end
end
endmodule
