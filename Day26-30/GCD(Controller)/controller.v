module controller(enA,enB,enA_c,enB_c,com_en,start,clk,eqz,done);
  input start,clk,eqz;
  output reg enA,enB,enA_c,enB_c,com_en,done;
  
  parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
  reg [2:0]state;
  
  always@(posedge clk)begin
    case(state)
      s0: if(start) state=s1;
      s1: state=s2;
      s2: state=s3;
      s3: if(eqz) state=s4;
      s4: state=s4;
      default: state=s0;
    endcase
  end
  
  always@(state)begin
    case(state)
      s0: begin enA=0;enB=0;enA_c=0;enB_c=0;com_en=0;done=0;end
      s1: enA=1;
      s2: begin enA=0;enB=1; end
      s3: begin enB=0;com_en=1;enA_c=1;enB_c=1;end
      s4: begin enA=0;enB=0;enA_c=0;enB_c=0;com_en=0;done=1;end
      default: begin enA=0;enB=0;enA_c=0;enB_c=0;com_en=0;done=0;end
    endcase
  end
endmodule
