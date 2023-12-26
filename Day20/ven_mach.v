module ven_mach #(parameter WAIT=00,FIFTY=01,HUNDRED=10,PRODUCT=4)(in_50,lays,kitkat,red_bull,pepsi,clk,rst,p_out,c_out);
input in_50,clk,rst;
input lays,kitkat,red_bull,pepsi;
output reg [PRODUCT-1:0]p_out;
output reg c_out;

reg [1:0]ps,ns;

always@(posedge clk or posedge rst)begin
if(rst)begin
ps<=0;
ns<=0;
p_out<=0;
c_out<=0;
end
else begin
ps=ns;
case(ns)
WAIT: begin
    casex({in_50,lays,kitkat,red_bull,pepsi})
        5'b10000: begin
            ns= FIFTY;
            p_out=4'b0;
            c_out=0;
        end
        5'b11xxx: begin
            ns= WAIT;
            p_out=4'b1000;
            c_out=0;
        end 
        default: begin
            ns= WAIT;
            p_out=4'b0;
            c_out=0;
        end
    endcase
end
FIFTY: begin
    casex({in_50,lays,kitkat,red_bull,pepsi})
        5'b10000: begin
            ns= HUNDRED;
            p_out=4'b0;
            c_out=0;
        end
        5'b101xx: begin
            ns= WAIT;
            p_out=4'b0100;
            c_out=1;
        end
        5'b1001x:begin
            ns=WAIT;
            p_out=4'b0010;
            c_out=0;
        end
        5'b01xxx: begin
            ns= WAIT;
            p_out=4'b1000;
            c_out=0;
        end 
        default: begin
            ns= WAIT;
            p_out=4'b0;
            c_out=0;
        end
    endcase
end
HUNDRED: begin
    casex({in_50,lays,kitkat,red_bull,pepsi})
        5'b0xx1x: begin
            ns= WAIT;
            p_out=4'b0010;
            c_out=0;
        end
        5'b1xxx1: begin
            ns= WAIT;
            p_out=4'b0001;
            c_out=0;
        end 
        default: begin
            ns= WAIT;
            p_out=4'b0;
            c_out=0;
        end
    endcase
end 
default: begin
    ns= WAIT;
    p_out=4'b0;
    c_out=0;
    end 
endcase  
end
end
endmodule
