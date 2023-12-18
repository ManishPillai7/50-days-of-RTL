// Code your design here
module seq_det(in,clk,rst,out);
  input in,clk,rst;
  output reg out;
  
  reg [2:0]ps,ns;
  parameter s0=3'b0,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      ps<=0;
      ns<=0;
    end
    else begin
      ps=ns;
      case(ps)
        s0: begin
          if(in)begin
            ns=s1;
            out=0;
          end
          else begin
            ns=s0;
            out=0;
          end
        end
        s1: begin
          if(in)begin
            ns=s2;
            out=0;
          end
          else begin
            ns=s0;
            out=0;
          end
        end
        s2: begin
          if(in)begin
            ns=s2;
            out=0;
          end
          else begin
            ns=s3;
            out=0;
          end
        end
        s3: begin
          if(in)begin
            ns=s4;
            out=0;
          end
          else begin
            ns=s0;
            out=0;
          end
        end
        s4: begin
          if(in)begin
            ns=s2;
            out=0;
          end
          else begin
            ns=s5;
            out=0;
          end
        end
        s5: begin
          if(in)begin
            ns=s1;
            out=0;
          end
          else begin
            ns=s6;
            out=0;
          end
        end
        s6: begin
          if(in)begin
            ns=s7;
            out=0;
          end
          else begin
            ns=s0;
            out=0;
          end
        end
        s7: begin
          if(in)begin
            ns=s2;
            out=1;
          end
          else begin
            ns=s0;
            out=0;
          end
        end
      endcase
    end
  end
endmodule
