module fsm (in,clk,rst,out);
  input in,clk,rst;
  output reg out;
  
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  
  reg [1:0]ps,ns;
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      ps<=0;
      ns<=0;
    end
    else begin
      ps=ns;
      case(ps)
        s0:if(in)begin
          ns=s1;
          out=0;
        end
        else begin
          ns=s0;
          out=0;
        end
         s1:if(in)begin
          ns=s2;
          out=0;
        end
        else begin
          ns=s0;
          out=0;
        end
         s2:if(in)begin
          ns=s1;
          out=0;
        end
        else begin
          ns=s3;
          out=0;
        end
         s3:if(in)begin
          ns=s0;
          out=1;
        end
        else begin
          ns=s1;
          out=0;
        end
        default begin
          ns=s0;
          out=0;
        end
      endcase
    end
  end
endmodule
