// Code your design here
/* ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
*/
module alu(data_in1,data_in2,data_out,operation,rst);
  input [7:0] data_in1,data_in2;
  input [3:0] operation;
  input rst;
  output reg [7:0]data_out;
  
  always@(*)begin
    if (rst)
      data_out = 8'b0;
    else begin
      case(operation)
      4'b0000: data_out = data_in1 + data_in2;
      4'b0001: data_out = data_in1 - data_in2;
      4'b0010: data_out = data_in1 * data_in2;
      4'b0011: data_out = data_in1 / data_in2;
      4'b0100: data_out = data_in1 << 1;
      4'b0101: data_out = data_in1 >> 1;
      4'b0110: data_out = data_in1 | data_in2;
      4'b0111: data_out = data_in1 & data_in2;
      4'b1000: data_out = ~(data_in1 | data_in2);
      4'b1001: data_out = ~(data_in1 & data_in2);
      4'b1010: data_out = data_in1 ^ data_in2;
      4'b1011: data_out = ~(data_in1 ^ data_in2);
      4'b1100: data_out = (data_in1 > data_in2)? 8'b1 : 8'b0;
      4'b1101: data_out = (data_in1 < data_in2)? 8'b1 : 8'b0;
      4'b1110: data_out = (data_in1 == data_in2) ? 8'b1 : 8'b0;
      4'b1111: data_out = (data_in1 >> 1) ^ data_in1;
      default : data_out = 8'b0;
    endcase
    end
  end
endmodule
