// Code your design here
module dynamic_sr(in,clk,rst,select,out);
  input [3:0]in;
  input [2:0]select;
  input clk,rst;
  output reg [3:0]out;
  
  reg [3:0]shift[7:0];
  reg [3:0]i;
  reg [7:0]r;
  always@(posedge clk or posedge rst)begin
    if (rst)begin
      for(r=0;r<8;r=r+1)begin
      shift[r]=0;
      end
    end
    else begin
      case(select)
        3'b000: begin
          shift[0]<=in;
          out<=shift[select];
        end
        3'b001: begin
          shift[0]<=in;
          for(i=0;i<select+1;i=i+1)begin
            shift[i+1]<=shift[i];
          end
          out<=shift[select];
        end
        3'b010: begin
          shift[0]<=in;
          for(i=0;i<select+1;i=i+1)begin
            shift[i+1]<=shift[i];
          end
          out<=shift[select];
          end
        3'b011: begin
          shift[0]<=in;
          for(i=0;i<select+1;i=i+1)begin
            shift[i+1]<=shift[i];
          end
          out<=shift[select];
          end
        3'b100: begin
          shift[0]<=in;
          for(i=0;i<select+1;i=i+1)begin
            shift[i+1]<=shift[i];
          end
          out<=shift[select];
          end
        3'b101: begin
          shift[0]<=in;
          for(i=0;i<select+1;i=i+1)begin
            shift[i+1]<=shift[i];
          end
          out<=shift[select];
          end
        3'b110: begin
          shift[0]<=in;
          for(i=0;i<select+1;i=i+1)begin
            shift[i+1]<=shift[i];
          end
          out<=shift[select];
          end
        3'b111: begin
          shift[0]<=in;
          for(i=0;i<select+1;i=i+1)begin
            shift[i+1]<=shift[i];
          end
          out<=shift[select];
          end
        default:out=4'b0;
      endcase
    end
  end
endmodule
